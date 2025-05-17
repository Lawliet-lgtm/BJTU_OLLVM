#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Pass.h"
#include "llvm/Support/Alignment.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/Support/SHA1.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"
#include "llvm/Support/RandomNumberGenerator.h"

#include <cstdint>
#include <iomanip>
#include <sstream>
#include <vector>
#include <cstring>
#include <map>
#include <set>
#include <queue>

#include "CryptoUtils.h"

using namespace llvm;
using namespace std;


namespace {

// **混淆字符串变量**
static cl::opt<bool> obfStr("obfstr", cl::init(true), 
                            cl::desc("启用字符串混淆 (default: true)"));

// **混淆函数名**
static cl::opt<bool> obfFunc("obffunc", cl::init(false), 
                             cl::desc("启用函数混淆 (default: false)"));

// **启用 Tick 计时器**
static cl::opt<bool> useTick("usetick", cl::init(false), 
                             cl::desc("启用混淆心跳提速 (default: false)"));

// **启用 debug模式**
static cl::opt<bool> debugMod("debug", cl::init(false), 
                             cl::desc("启用debug模式(default: false)"));


class GVObfuscator: public ModulePass {
    public: static char ID;
    GVObfuscator(): ModulePass(ID) {}

    void collectGVUsers(GlobalVariable * GV, map < GlobalVariable * , set < User * >> & GV2Users);
    void findIndirectUsers(Value * V, set < User * > & IndirectUsers);
    void collectGVs(Module & M, vector < GlobalVariable * > & GVs);
    void setupGVTick(Module & M, vector < GlobalVariable * > & GVs, map < GlobalVariable * , GlobalVariable * > & GV2Tick);
    void collectEncryptableGlobals(Module & M,
        vector < GlobalVariable * > & GVs,
        vector < GlobalVariable * > & IntGlobals,
        vector < GlobalVariable * > & ArrayGlobals,
        vector < GlobalVariable * > & StructGlobals);
    void confuseArrayGlobals(Module & M,
        vector < GlobalVariable * > & ArrayGlobals,
        map < GlobalVariable * , pair < GlobalVariable * , GlobalVariable * >> & Orign2Confuz,
        map < GlobalVariable * , pair < Constant * , GlobalVariable * >> & Confuz2DecryptKey);
    void confuseStructGlobals(Module & M,
        vector < GlobalVariable * > & StructGlobals,
        map < GlobalVariable * , pair < GlobalVariable * , GlobalVariable * >> & Orign2Confuz,
        map < GlobalVariable * , pair < Constant * , GlobalVariable * >> & Confuz2DecryptKey);
    GlobalVariable * CreateNewGV(Module & M, LLVMContext & Context, StringRef Name,
        Type * ElementType, int ArraySize, Constant * Initializer, unsigned char * IniData, GlobalVariable * BaseGV);
    void ReplaceUse(map < GlobalVariable * , pair < GlobalVariable * , GlobalVariable * >> & Orign2Confuz,
        map < GlobalVariable * , set < User * >> & GV2Users);
    void ClearUnusedGV(vector < GlobalVariable * > & GVs);
    void InsertDecryptBlocks(Module & M, map < GlobalVariable * , set < User * >> & GV2Users,
        map < GlobalVariable * , GlobalVariable * > & GV2Tick,
        map < GlobalVariable * , pair < GlobalVariable * , GlobalVariable * >> & Orign2Confuz,
        map < GlobalVariable * , pair < Constant * , GlobalVariable * >> & Confuz2DecryptKey);
    void confuseString(Module & M);
    void confuseFunName(Module & M);

    bool runOnModule(Module & M) override;


};


bool GVObfuscator::runOnModule(Module & M) {
    outs() << "Pass start...\n";
    srand(time(NULL));

    if (obfStr) {
        confuseString(M);
        if (debugMod) {
            outs() << "confuseString over...\n";
        }
    }
    if (obfFunc) {
        confuseFunName(M);
        if (debugMod) {
            outs() << "confuseFunName over...\n";
        }
    }

    outs() << "Pass end...\n";
    return false;
} // runOnModule

void GVObfuscator::collectGVUsers(GlobalVariable *GV, map<GlobalVariable *, set<User *>> &GV2Users) {
    if (debugMod) {
        errs() << "[INFO] Collecting users for GlobalVariable: " << GV->getName() << "\n";
    }

    set<User *> VisitedUsers;
    queue<User *> Worklist;

    // 初始化 Worklist
    for (User *U : GV->users()) {
        Worklist.push(U);
    }

    while (!Worklist.empty()) {
        User *U = Worklist.front();
        Worklist.pop();

        if (!VisitedUsers.insert(U).second) continue; // 避免重复处理

        if (Instruction *Inst = dyn_cast<Instruction>(U)) {
            if (!isa<GetElementPtrInst>(Inst)) { // 跳过 GEP
                if (debugMod) {
                    errs() << "[Instruction] " << *Inst << "\n";
                }
                GV2Users[GV].insert(Inst);
            }
        } else if (ConstantExpr *CE = dyn_cast<ConstantExpr>(U)) {
            if (debugMod) {
                errs() << "[ConstantExpr] " << *CE << "\n";
            }
            for (User *CEU : CE->users()) {
                Worklist.push(CEU);
            }
        } else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(U)) {
            if (debugMod) {
                errs() << "[GEP] " << *GEP << "\n";
            }
            for (User *GEPU : GEP->users()) {
                Worklist.push(GEPU);
            }
        }
    }

    // 如果 `GV` 具有 `dso_local`，进一步分析 `Def-Use Chain`
    if (GV->hasDLLImportStorageClass() || GV->isDSOLocal()) {
        if (debugMod) {
            errs() << "[INFO] Analyzing Indirect Users for: " << GV->getName() << "\n";
        }
        findIndirectUsers(GV, GV2Users[GV]);
    }
} //collectGVUsers


void GVObfuscator::findIndirectUsers(Value *V, set<User *> &IndirectUsers) {
    queue<User *> Worklist;
    set<User *> Visited;

    for (User *U : V->users()) {
        Worklist.push(U);
    }

    while (!Worklist.empty()) {
        User *U = Worklist.front();
        Worklist.pop();

        if (!Visited.insert(U).second) continue; // **避免重复处理**

        if (Instruction *Inst = dyn_cast<Instruction>(U)) {
            if (!isa<GetElementPtrInst>(Inst)) { // **跳过 GEP**
                IndirectUsers.insert(Inst);
                if (debugMod) {
                    errs() << "[Indirect Use] " << *Inst << "\n";
                }
            } else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(Inst)) {
                findIndirectUsers(GEP, IndirectUsers);
            }

            // // 如果 `Inst` 是 `store`，检查目标指针
            // if (StoreInst *Store = dyn_cast<StoreInst>(Inst)) {
            //     Value *StoredPtr = Store->getPointerOperand();
            //     if (debugMod) {
            //         errs() << "[Store] Found store to: " << *StoredPtr << "\n";
            //     }
            //     findIndirectUsers(StoredPtr, IndirectUsers);
            // }
        } else {
            for (User *NextU : U->users()) {
                Worklist.push(NextU);
            }
        }
    }
} //findIndirectUsers


void GVObfuscator::collectGVs(Module &M,vector<GlobalVariable *> &GVs){
  for (auto &GV : M.globals()) {
    if(GV.hasInitializer()&&!GV.getName().contains("llvm.metadata")){  //过滤未初始化(extern)以及metadata
        GVs.push_back(&GV);
    }
  }
} //collectGVs

void GVObfuscator::setupGVTick(Module &M, vector<GlobalVariable *> &GVs, map<GlobalVariable *, GlobalVariable *> &GV2Tick) {
    LLVMContext &Context = M.getContext();
    Type *Int8Ty = Type::getInt8Ty(Context);

    for (GlobalVariable *GV : GVs) {
        // 创建新的计时器 `TickGV`，初始值 `5`
        Constant *InitialValue = ConstantInt::get(Int8Ty, 5);
        GlobalVariable *TickGV = new GlobalVariable(M, Int8Ty, false, GV->getLinkage(), InitialValue, GV->getName() + "_tick");

        // 建立 `GV -> TickGV` 的映射
        GV2Tick[GV] = TickGV;
    }
}


void GVObfuscator::collectEncryptableGlobals(Module &M,
                                vector<GlobalVariable *> &GVs,
                                vector<GlobalVariable *> &IntGlobals,
                                vector<GlobalVariable *> &ArrayGlobals,
                                vector<GlobalVariable *> &StructGlobals) {
    for (GlobalVariable * GV: GVs) {
        Type *Ty = GV->getValueType(); 
        // 整数类型
        if (Ty->isIntegerTy()) {
            IntGlobals.push_back(GV);
        }
        // 常量数组（字符数组/普通数组）
        else if (ConstantDataSequential *CDS = dyn_cast<ConstantDataSequential>(GV->getInitializer())) {
            Type *CDSTy = CDS->getElementType();
            // **只处理 char[] 和 int[]**
            if (CDSTy->isIntegerTy()) {
                ArrayGlobals.push_back(GV);
            }
        }
        // 结构体(包含整数or字符串类型)
        else if (StructType *ST = dyn_cast<StructType>(Ty)) {
            bool hasInteger = false;
            bool hasIntArray = false;

            for (int j = 0; j < ST->getNumElements(); j++) {
                Type *ElemTy = ST->getElementType(j);

                if (ElemTy->isIntegerTy()) {
                    hasInteger = true;
                }
                // 检查是否为数组
                else if (ElemTy->isArrayTy()) {
                    ArrayType *ArrayTy = dyn_cast<ArrayType>(ElemTy);
                    Type *ElementType = ArrayTy->getElementType();
                    
                    // 如果是 char[] 或 int[]，标记为可加密
                    if (ElementType->isIntegerTy()) {
                        hasIntArray = true;
                    }
                }
            }

            // 如果结构体含有整数或可加密数组，则存入 StructGlobals
            if (hasInteger || hasIntArray) {
                StructGlobals.push_back(GV);
            }
        }

    }
} //collectEncryptableGlobals

void GVObfuscator::confuseArrayGlobals(Module &M,
    vector<GlobalVariable *> &ArrayGlobals,
    map<GlobalVariable *, pair<GlobalVariable *, GlobalVariable *>> &Orign2Confuz,
    map<GlobalVariable *, pair<Constant *, GlobalVariable *>> &Confuz2DecryptKey) {
    
    LLVMContext &Context = M.getContext();

    for (GlobalVariable *GV : ArrayGlobals) {
        if (GV->getInitializer()->isZeroValue() || GV->getInitializer()->isNullValue()) { // 过滤 null & zero
            continue;
        }

        if (debugMod) {
            errs() << "[INFO] Confusing GlobalVariable: " << GV->getName() << "\n";
        }

        ConstantDataSequential *CDS = cast<ConstantDataSequential>(GV->getInitializer());
        IntegerType *IntTy = cast<IntegerType>(CDS->getElementType());

        unsigned char ConfuzData[TARGET_ARRAY_SIZE];
        unsigned char DummyData[TARGET_ARRAY_SIZE];

        int originDataLen = CDS->getNumElements();
        for (int i = 0; i < originDataLen; i++) {
            uint64_t intVal = CDS->getElementAsInteger(i);
            ConfuzData[i] = static_cast<unsigned char>(intVal & 0xFF); // 仅保留低 8 位
            DummyData[i] = static_cast<unsigned char>(intVal & 0xFF); // 仅保留低 8 位
        }

        int ConfuzDataLen = CryptoUtils::Enc_sm4_ecb_cbc(0, 1, ConfuzData, originDataLen); // SM4 加密
        genRandomString(DummyData, originDataLen); // 生成随机干扰数据

        GlobalVariable *ConfuzedGV = nullptr;
        GlobalVariable *DummyGV = nullptr;
        Constant *KeyConst = nullptr;
        Constant *EncryptedConst = nullptr;
        Constant *DummyConst = nullptr;
        vector<uint32_t> FK = {0xA3B1BAC6, 0x56AA3350, 0x677D9197, 0xB27022DC};

        // **创建新的全局变量**
        string ConfuzedGVName = (GV->getName() + "_xyz").str();
        string DummyGVName = (GV->getName() + "_abc").str();

        if (IntTy == Type::getInt8Ty(Context)) {
            ConfuzedGV = CreateNewGV(M, Context, StringRef(ConfuzedGVName),
                                     Type::getInt8Ty(Context), ConfuzDataLen, EncryptedConst, ConfuzData, GV);
            DummyGV = CreateNewGV(M, Context, StringRef(DummyGVName),
                                  Type::getInt8Ty(Context), originDataLen, DummyConst, DummyData, GV);
        } else if (IntTy == Type::getInt32Ty(Context)) {
            ConfuzedGV = CreateNewGV(M, Context, StringRef(ConfuzedGVName),
                                     Type::getInt32Ty(Context), ConfuzDataLen, EncryptedConst, ConfuzData, GV);
            DummyGV = CreateNewGV(M, Context, StringRef(DummyGVName),
                                  Type::getInt32Ty(Context), originDataLen, DummyConst, DummyData, GV);
        } else if (IntTy == Type::getInt64Ty(Context)) {
            ConfuzedGV = CreateNewGV(M, Context, StringRef(ConfuzedGVName),
                                     Type::getInt64Ty(Context), ConfuzDataLen, EncryptedConst, ConfuzData, GV);
            DummyGV = CreateNewGV(M, Context, StringRef(DummyGVName),
                                  Type::getInt64Ty(Context), originDataLen, DummyConst, DummyData, GV);
        } else {
            if (debugMod) {
                errs() << "[ERROR] Unsupported GlobalVariable type: " << *IntTy << "\n";
                errs() << "[ERROR] GlobalVariable Name: " << GV->getName() << "\n";
            }
            continue;
        }

        KeyConst = ConstantDataArray::get(Context, FK); // 存储密钥
        
        if (ConfuzedGV && DummyGV) {
            Orign2Confuz[GV] = make_pair(ConfuzedGV, DummyGV);
            Confuz2DecryptKey[ConfuzedGV] = make_pair(KeyConst, DummyGV);
            
            if (debugMod) {
                errs() << "[INFO] Encrypted GlobalVariable: " << GV->getName() 
                       << " -> Confuzed: " << ConfuzedGV->getName() 
                       << ", Dummy: " << DummyGV->getName() << "\n";
            }
        }
    }
} // confuseArrayGlobals


void GVObfuscator::confuseStructGlobals(
    Module &M,
    vector<GlobalVariable *> &StructGlobals,
    map<GlobalVariable *, pair<GlobalVariable *, GlobalVariable *>> &Orign2Confuz,
    map<GlobalVariable *, pair<Constant *, GlobalVariable *>> &Confuz2DecryptKey) {

    LLVMContext &Context = M.getContext();

    for (GlobalVariable *GV : StructGlobals) {
        Constant *Initializer = GV->getInitializer();
        StructType *ST = dyn_cast<StructType>(GV->getValueType());
        if (!ST) {
            if (debugMod) {
                errs() << "[ERROR] GlobalVariable is not a StructType: " << GV->getName() << "\n";
            }
            continue;
        }

        bool hasEncryptedField = false;
        vector<Type *> NewStructElements;
        vector<Constant *> NewFields;
        vector<Constant *> DummyFields;

        // **遍历结构体成员，处理可加密字段**
        for (unsigned i = 0; i < ST->getNumElements(); i++) {
            Type *ElemTy = ST->getElementType(i);
            Constant *FieldValue = Initializer->getAggregateElement(i);

            if (ArrayType *ArrayTy = dyn_cast<ArrayType>(ElemTy)) {
                Type *ElementType = ArrayTy->getElementType();

                if (ElementType->isIntegerTy()) { // **识别整数数组**
                    if (ConstantDataSequential *CDS = dyn_cast<ConstantDataSequential>(FieldValue)) {
                        hasEncryptedField = true;
                        int originDataLen = CDS->getNumElements();

                        unsigned char ConfuzData[TARGET_ARRAY_SIZE];
                        unsigned char DummyData[TARGET_ARRAY_SIZE];

                        for (int j = 0; j < originDataLen; j++) {
                            uint64_t intVal = CDS->getElementAsInteger(j);
                            ConfuzData[j] = static_cast<unsigned char>(intVal & 0xFF);
                            DummyData[j] = static_cast<unsigned char>(intVal & 0xFF);
                        }

                        int ConfuzDataLen = CryptoUtils::Enc_sm4_ecb_cbc(0, 1, ConfuzData, originDataLen);
                        genRandomString(DummyData, originDataLen);

                        // **创建新数组类型**
                        ArrayType *NewCharArrayType = ArrayType::get(Type::getInt8Ty(Context), ConfuzDataLen);
                        NewStructElements.push_back(NewCharArrayType);

                        NewFields.push_back(ConstantDataArray::get(Context, ArrayRef<uint8_t>(ConfuzData, ConfuzDataLen)));
                        DummyFields.push_back(ConstantDataArray::get(Context, ArrayRef<uint8_t>(DummyData, originDataLen)));

                        if (debugMod) {
                            errs() << "[INFO] Encrypted Field in Struct: " << GV->getName()
                                   << ", Field Index: " << i
                                   << ", New Size: " << ConfuzDataLen << "\n";
                        }
                        continue;
                    }
                }
            }

            // **其他字段保持不变**
            NewStructElements.push_back(ElemTy);
            NewFields.push_back(FieldValue);
            DummyFields.push_back(FieldValue);
        }

        if (!hasEncryptedField) {
            if (debugMod) {
                errs() << "[INFO] No encryptable fields in Struct GV: " << GV->getName() << "\n";
            }
            continue;
        }

        // **创建新的 StructType**
        ArrayRef<Type *> NewElementTypes(NewStructElements);
        string NewStructName = GV->getName().str() + "_struct";
        StructType *NewST = StructType::create(Context, NewElementTypes, StringRef(NewStructName));

        // **创建新的结构体常量**
        Constant *NewInitializer = ConstantStruct::get(NewST, NewFields);
        Constant *DummyInitializer = ConstantStruct::get(ST, DummyFields);

        // **创建新的 GlobalVariable**
        string ConfuzedGVName = (GV->getName() + "_xyz").str();
        string DummyGVName = (GV->getName() + "_abc").str();

        GlobalVariable *ConfuzedGV = new GlobalVariable(
            M, NewST, false, GV->getLinkage(), NewInitializer, ConfuzedGVName);
        ConfuzedGV->copyAttributesFrom(GV);

        GlobalVariable *DummyGV = new GlobalVariable(
            M, ST, false, GV->getLinkage(), DummyInitializer, DummyGVName);
        DummyGV->copyAttributesFrom(GV);

        vector<uint32_t> FK = {0xA3B1BAC6, 0x56AA3350, 0x677D9197, 0xB27022DC};
        Constant *KeyConst = ConstantDataArray::get(Context, FK);

        if (ConfuzedGV && DummyGV) {
            Orign2Confuz[GV] = make_pair(ConfuzedGV, DummyGV);
            Confuz2DecryptKey[ConfuzedGV] = make_pair(KeyConst, DummyGV);

            if (debugMod) {
                errs() << "[INFO] Created Encrypted Struct GV: " << GV->getName()
                       << " -> New Struct: " << NewST->getName() << "\n";
            }
        }
    }
} // confuseStructGlobals


GlobalVariable * GVObfuscator::CreateNewGV(Module & M, LLVMContext & Context, StringRef Name,
    Type * ElementType, int ArraySize, Constant * Initializer, unsigned char * IniData, GlobalVariable * BaseGV) {
    // 创建数组类型
    ArrayType * ArrayTy = ArrayType::get(ElementType, ArraySize);

    // 创建全局变量
    GlobalVariable * GV = new GlobalVariable(
        M, ArrayTy, false, BaseGV -> getLinkage(), nullptr, Name
    );

    // 复制原有属性
    GV -> copyAttributesFrom(BaseGV);

    // 设置初始值（如果有）
    Initializer = ConstantDataArray::getRaw(
        StringRef(reinterpret_cast<const char*>(IniData), ArraySize), ArraySize, ElementType
    );
    GV -> setInitializer(Initializer);

    return GV;
} //CreateNewGV

void GVObfuscator::ReplaceUse(
    map<GlobalVariable *, pair<GlobalVariable *, GlobalVariable *>> &Orign2Confuz,
    map<GlobalVariable *, set<User *>> &GV2Users) {
    
    for (auto iter = Orign2Confuz.begin(); iter != Orign2Confuz.end(); ++iter) {
        GlobalVariable *OriginalGV = iter->first;
        GlobalVariable *ConfuzedGV = iter->second.first;
        GlobalVariable *DummyGV = iter->second.second;

        if (debugMod) {
            errs() << "[INFO] Replacing Uses of: " << OriginalGV->getName() << "\n";
            errs() << "      ConfuzedGV: " << ConfuzedGV->getName() 
                   << ", DummyGV: " << DummyGV->getName() << "\n";
        }

        // **替换所有引用到 DummyGV**
        OriginalGV->replaceAllUsesWith(DummyGV);

        // **清理未被引用的全局变量**
        OriginalGV->removeDeadConstantUsers();

        // **检测替换后 GlobalVariable 是否还有用户**
        if (OriginalGV->getNumUses() == 0 && debugMod) {
            errs() << "  ├─ [INFO] No more references to " << OriginalGV->getName() << "\n";
        }

        if (debugMod) {
            errs() << "----------------------------------\n";
        }
    }      
} //ReplaceUse


void GVObfuscator::ClearUnusedGV(vector < GlobalVariable * > & GVs) {
    for (GlobalVariable * GV: GVs) {
        GV -> removeDeadConstantUsers();
        if (GV -> getNumUses() == 0) {
            if (debugMod) {
                errs() << "ClearUnusedGV GlobalVariable: " << GV->getName() << "\n";
            }
            GV -> dropAllReferences();
            GV -> eraseFromParent();
        }
    }
} //ClearUnusedGV

void GVObfuscator::InsertDecryptBlocks(Module & M, map < GlobalVariable * , set < User * >> & GV2Users,
        map < GlobalVariable * , GlobalVariable *> & GV2Tick,
        map < GlobalVariable * , pair < GlobalVariable * , GlobalVariable * >> & Orign2Confuz,
        map < GlobalVariable * , pair < Constant * , GlobalVariable * >> & Confuz2DecryptKey) {

        for (auto & item: GV2Users) {
            GlobalVariable * GV = item.first;
            set < User * > Users = item.second;
            GlobalVariable * ConfuzedGV = Orign2Confuz[GV].first;
            GlobalVariable * DummyGV = Orign2Confuz[GV].second;
            GlobalVariable *TickGV = GV2Tick[GV];
            for (User * Usr: Users) {
                Instruction * Inst = dyn_cast < Instruction > (Usr); //预处理保证Inst* ok
                if (debugMod) {
                    errs() << "Processing Instruction:\n";
                    Inst -> print(errs());
                    errs() << "\n";
                }
                
                // Inst前insert
                IRBuilder < > builder(Inst);
                Function * Func = builder.GetInsertBlock() -> getParent();
                LLVMContext & Context = M.getContext();
                Type * Int8PtrTy = builder.getInt8PtrTy();
                Type * Int8Ty = builder.getInt8Ty();
                Type *Int16Ty = Type::getInt16Ty(Context);  // 获取 `i16`
                Type *Int16PtrTy = PointerType::get(Int16Ty, 0);  // 获取 `i16*`
                Type *Int32Ty = Type::getInt32Ty(Context);  // 获取 `i32`
                Type *Int32PtrTy = PointerType::get(Int32Ty, 0);  // 获取 `i32*`
                Type *Int64Ty = Type::getInt16Ty(Context);  // 获取 `i64`
                Type *Int64PtrTy = PointerType::get(Int64Ty, 0);  // 获取 `i64*`
                SmallVector < Type * , 6 > FuncArgs = {
                    Type::getInt32Ty(Context), // isCBC
                    Type::getInt32Ty(Context), // pkcs7
                    Int8PtrTy, //GV
                    Int8PtrTy, // NewGV
                    Type::getInt32Ty(Context), // iLen
                    Int8PtrTy,  //tick     
                };
                FunctionType * DecryptFuncType = FunctionType::get(Type::getVoidTy(Context), FuncArgs, false);
                FunctionCallee DecryptFuncCallee = M.getOrInsertFunction("Dec_sm4_ecb_cbc", DecryptFuncType);
                Function * DecryptFunc = cast < Function > (DecryptFuncCallee.getCallee());

                SmallVector < Type * , 2 > RandFuncArgs = {
                    Int8PtrTy, //GV
                    Type::getInt32Ty(Context), // iLen  
                };
                FunctionType * RandFuncType = FunctionType::get(Type::getVoidTy(Context), RandFuncArgs, false);
                FunctionCallee RandFuncCallee = M.getOrInsertFunction("genRandomString", RandFuncType);
                Function * RandFunc = cast < Function > (RandFuncCallee.getCallee());

                SmallVector < Type * , 5 > AsFuncArgs = {
                    Int8PtrTy, // dest ptr
                    Int8PtrTy, // src ptr
                    Type::getInt32Ty(Context), // iLen
                    Type::getInt32Ty(Context), //isreverse
                    Int8PtrTy, //tick     
                };
                FunctionType * AssignFuncType = FunctionType::get(Type::getVoidTy(Context), AsFuncArgs, false);
                FunctionCallee AssignFuncCallee = M.getOrInsertFunction("assignLow8BitsToInt8", AssignFuncType);
                Function * AssignFunc = cast < Function > (AssignFuncCallee.getCallee());

                SmallVector < Type * , 5 > AsFuncArgsInt32 = {
                    Int32PtrTy, // dest ptr
                    Int8PtrTy, // src ptr
                    Type::getInt32Ty(Context), // iLen
                    Type::getInt32Ty(Context), //isreverse     
                    Int8PtrTy,
                };
                FunctionType * AssignFuncTypeInt32 = FunctionType::get(Type::getVoidTy(Context), AsFuncArgsInt32, false);
                FunctionCallee AssignFuncCalleeInt32 = M.getOrInsertFunction("assignLow8BitsToInt32", AssignFuncTypeInt32);
                Function * AssignFuncInt32 = cast < Function > (AssignFuncCalleeInt32.getCallee());

                SmallVector < Type * , 5 > AsFuncArgsInt16 = {
                    Int16PtrTy, // dest ptr
                    Int8PtrTy, // src ptr
                    Type::getInt32Ty(Context), // iLen
                    Type::getInt32Ty(Context), //isreverse     
                    Int8PtrTy,
                };
                FunctionType * AssignFuncTypeInt16 = FunctionType::get(Type::getVoidTy(Context), AsFuncArgsInt16, false);
                FunctionCallee AssignFuncCalleeInt16 = M.getOrInsertFunction("assignLow8BitsToInt16", AssignFuncTypeInt16);
                Function * AssignFuncInt16 = cast < Function > (AssignFuncCalleeInt16.getCallee());

                SmallVector < Type * , 5 > AsFuncArgsInt64 = {
                    Int64PtrTy, // dest ptr
                    Int8PtrTy, // src ptr
                    Type::getInt32Ty(Context), // iLen
                    Type::getInt32Ty(Context), //isreverse   
                    Int8PtrTy,  
                };
                FunctionType * AssignFuncTypeInt64 = FunctionType::get(Type::getVoidTy(Context), AsFuncArgsInt64, false);
                FunctionCallee AssignFuncCalleeInt64 = M.getOrInsertFunction("assignLow8BitsToInt64", AssignFuncTypeInt64);
                Function * AssignFuncInt64 = cast < Function > (AssignFuncCalleeInt64.getCallee());

                if (ConstantDataSequential * CDS = dyn_cast < ConstantDataSequential > (GV -> getInitializer())) {
                    IntegerType * IntTy = cast < IntegerType > (CDS -> getElementType());
                    ConstantDataSequential * ConfuzedCDS = dyn_cast < ConstantDataSequential > (ConfuzedGV -> getInitializer());
                    ConstantDataSequential * DummyCDS = dyn_cast < ConstantDataSequential > (DummyGV -> getInitializer());
                    int originDataLen = DummyCDS -> getNumElements();
                    int confuzDataLen = ConfuzedCDS -> getNumElements();
                    Value * decryptedStrSpace = builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), originDataLen)); //tmp store dec
                    Value * decryptedStrSpaceCache = builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), originDataLen)); //tmp cache dummy
                    Value * confuzedStrSpace = builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), confuzDataLen)); //tmp store enc
                    Value * Zero = builder.getInt32(0);

                    Value * decryptedStrPtr = builder.CreateGEP(
                        decryptedStrSpace -> getType() -> getPointerElementType(),
                        decryptedStrSpace, {
                            Zero,
                            Zero
                        }
                    ); // 获取数组首地址
                    decryptedStrPtr = builder.CreateBitCast(decryptedStrPtr, builder.getInt8PtrTy()); // 转换为 i8* as param


                    Value * decryptedStrCachePtr = builder.CreateGEP(
                        decryptedStrSpaceCache -> getType() -> getPointerElementType(),
                        decryptedStrSpaceCache, {
                            Zero,
                            Zero
                        }
                    ); // 获取数组首地址

                    decryptedStrCachePtr = builder.CreateBitCast(decryptedStrCachePtr, builder.getInt8PtrTy()); // 转换为 i8* as param

                    Value * ConfuzedStrPtr = builder.CreateGEP(
                        confuzedStrSpace -> getType() -> getPointerElementType(),
                        confuzedStrSpace, {
                            Zero,
                            Zero
                        }
                    ); // 获取数组首地址

                    ConfuzedStrPtr = builder.CreateBitCast(ConfuzedStrPtr, builder.getInt8PtrTy()); // 转换为 i8* as param
                    Value * DummyGVPtr = builder.CreateBitCast(DummyGV, Type::getInt8PtrTy(Context), "DummyGVPtr");
                    Value * ConfuzeGVPtr = builder.CreateBitCast(ConfuzedGV, Type::getInt8PtrTy(Context), "ConfuzeGVPtr");

                    // **加载 `TickGV` 的当前值**
                    Value *TickGVVal = builder.CreateLoad(Int8Ty, TickGV);

                    // **计算 `TickGV - 1`**
                    Value *TickGVInc = builder.CreateSub(TickGVVal, builder.getInt8(1));

                    SmallVector < Value * , 5 > AsCallArgs1 = {
                        DummyGVPtr, // dest ptr
                        decryptedStrPtr, // src ptr
                        builder.getInt32(originDataLen),
                        builder.getInt32(1),
                        TickGV,
                    };
                    SmallVector < Value * , 5 > AsCallArgs2 = {
                        DummyGVPtr, // dest ptr
                        decryptedStrCachePtr, // src ptr
                        builder.getInt32(originDataLen),
                        builder.getInt32(1), 
                        TickGV,
                    };
                    SmallVector < Value * , 5> AsCallArgs3 = {
                        ConfuzeGVPtr, // dest ptr
                        ConfuzedStrPtr, // src ptr
                        builder.getInt32(confuzDataLen),
                        builder.getInt32(1),
                        TickGV,
                    };
                    SmallVector < Value * , 5> AsCallArgs4 = {
                        DummyGVPtr, // dest ptr
                        decryptedStrPtr, // src ptr
                        builder.getInt32(originDataLen),
                        builder.getInt32(0),
                        TickGV,
                    };
                    SmallVector < Value * , 2 > RandCallArgs = {
                       decryptedStrCachePtr,
                       builder.getInt32(originDataLen),
                    };
                    SmallVector < Value * , 6 > CallArgs = {
                        builder.getInt32(0), // isCBC 参数
                        builder.getInt32(1), // pkcs7 参数
                        decryptedStrPtr, // dec space 参数
                        ConfuzedStrPtr, // enc space 参数
                        builder.getInt32(confuzDataLen), // enc data length 参数
                        TickGV,  //tick參數
                    };
                    SmallVector < Value * , 5 > AsDunmmyCallArgs = {
                        DummyGVPtr, // dest ptr
                        decryptedStrCachePtr, // src ptr
                        builder.getInt32(originDataLen),
                        builder.getInt32(0),
                        TickGV,
                    };
                    if (IntTy == Type::getInt8Ty(Context)){
                        builder.CreateCall(AssignFunc, AsCallArgs1); //assign dummy data from GV
                        builder.CreateCall(AssignFunc, AsCallArgs2); //assign dummy data from GV
                        builder.CreateCall(AssignFunc, AsCallArgs3); //assign confuse data from GV
                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                        builder.CreateCall(AssignFunc, AsCallArgs4); //assign unconfuzed data to GV
                        if (useTick) {
                            builder.CreateStore(TickGVInc, TickGV); //tick--
                        }
                        CallInst * NewCall = CallInst::Create(AssignFunc, AsDunmmyCallArgs); //recover dummy
                        NewCall -> insertAfter(Inst); //after inst
                    } else if (IntTy == Type::getInt32Ty(Context)){
                        builder.CreateCall(AssignFuncInt32, AsCallArgs1); //assign dummy data from GV
                        builder.CreateCall(AssignFuncInt32, AsCallArgs2); //assign dummy data from GV
                        builder.CreateCall(AssignFuncInt32, AsCallArgs3); //assign confuse data from GV
                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                        builder.CreateCall(AssignFuncInt32, AsCallArgs4); //assign unconfuzed data to GV
                        if (useTick) {
                            builder.CreateStore(TickGVInc, TickGV); //tick--
                        }
                        CallInst * NewCall = CallInst::Create(AssignFuncInt32, AsDunmmyCallArgs); //recover dummy
                        NewCall -> insertAfter(Inst); //after inst
                    } else if (IntTy == Type::getInt64Ty(Context)){
                        builder.CreateCall(AssignFuncInt64, AsCallArgs1); //assign dummy data from GV
                        builder.CreateCall(AssignFuncInt64, AsCallArgs2); //assign dummy data from GV
                        builder.CreateCall(AssignFuncInt64, AsCallArgs3); //assign confuse data from GV
                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                        builder.CreateCall(AssignFuncInt64, AsCallArgs4); //assign unconfuzed data to GV
                        if (useTick) {
                            builder.CreateStore(TickGVInc, TickGV); //tick--
                        }
                        CallInst * NewCall = CallInst::Create(AssignFuncInt64, AsDunmmyCallArgs); //recover dummy
                        NewCall -> insertAfter(Inst); //after inst
                    } else if (IntTy == Type::getInt16Ty(Context)){
                        builder.CreateCall(AssignFuncInt16, AsCallArgs1); //assign dummy data from GV
                        builder.CreateCall(AssignFuncInt16, AsCallArgs2); //assign dummy data from GV
                        builder.CreateCall(AssignFuncInt16, AsCallArgs3); //assign confuse data from GV
                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                        builder.CreateCall(AssignFuncInt16, AsCallArgs4); //assign unconfuzed data to GV
                        if (useTick) {
                            builder.CreateStore(TickGVInc, TickGV); //tick--
                        }
                        CallInst * NewCall = CallInst::Create(AssignFuncInt16, AsDunmmyCallArgs); //recover dummy
                        NewCall -> insertAfter(Inst); //after inst
                    }

                } else if (StructType * ST = dyn_cast < StructType > (GV -> getValueType())) {
                    StructType * NewST = dyn_cast < StructType > (ConfuzedGV -> getValueType());
                    Value * Zero = builder.getInt32(0);
                    Constant * Initializer = GV -> getInitializer();
                    Constant * ConfuseInitializer = ConfuzedGV -> getInitializer();
                    Constant * DummyInitializer = DummyGV -> getInitializer();
                    for (int i = 0; i < ST -> getNumElements(); i++) {
                        Type * ElemTy = ST -> getElementType(i);
                        Type * NewElemTy = NewST -> getElementType(i);
                        Constant * FieldValue = Initializer -> getAggregateElement(i);
                        Constant * ConfuseFieldValue = ConfuseInitializer -> getAggregateElement(i);
                        Constant * DummyFieldValue = DummyInitializer -> getAggregateElement(i);
                        if (ArrayType * ArrayTy = dyn_cast < ArrayType > (ElemTy)) {
                            Type * ElementType = ArrayTy -> getElementType();
                            if (ElementType -> isIntegerTy()) { // 识别 char[]
                                if (ConstantDataSequential * CDS = dyn_cast < ConstantDataSequential > (FieldValue)) {
                                    IntegerType * IntTy = cast < IntegerType > (CDS -> getElementType());
                                    ArrayType * NewArrayTy = dyn_cast < ArrayType > (NewElemTy);
                                    ConstantDataSequential * ConfuzedCDS = dyn_cast < ConstantDataSequential > (ConfuseFieldValue);
                                    ConstantDataSequential * DummyCDS = dyn_cast < ConstantDataSequential > (DummyFieldValue);
                                    int originDataLen = DummyCDS -> getNumElements();
                                    int confuzDataLen = ConfuzedCDS -> getNumElements();
                                    Value * decryptedStrSpace = builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), originDataLen)); //tmp store dec
                                    Value * decryptedStrSpaceCache = builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), originDataLen)); //tmp cache dummy
                                    Value * confuzedStrSpace = builder.CreateAlloca(ArrayType::get(builder.getInt8Ty(), confuzDataLen)); //tmp store enc

                                    Value * decryptedStrPtr = builder.CreateGEP(
                                        decryptedStrSpace -> getType() -> getPointerElementType(),
                                        decryptedStrSpace, {
                                            Zero,
                                            Zero
                                        }
                                    ); // 获取数组首地址
                                    decryptedStrPtr = builder.CreateBitCast(decryptedStrPtr, builder.getInt8PtrTy()); // 转换为 i8* as param

                                    Value * decryptedStrCachePtr = builder.CreateGEP(
                                        decryptedStrSpaceCache -> getType() -> getPointerElementType(),
                                        decryptedStrSpaceCache, {
                                            Zero,
                                            Zero
                                        }
                                    ); // 获取数组首地址

                                    decryptedStrCachePtr = builder.CreateBitCast(decryptedStrCachePtr, builder.getInt8PtrTy()); // 转换为 i8* as param

                                    Value * ConfuzedStrPtr = builder.CreateGEP(
                                        confuzedStrSpace -> getType() -> getPointerElementType(),
                                        confuzedStrSpace, {
                                            Zero,
                                            Zero
                                        }
                                    ); // 获取数组首地址

                                    ConfuzedStrPtr = builder.CreateBitCast(ConfuzedStrPtr, builder.getInt8PtrTy()); // 转换为 i8* as param
                                    // 获取 Struct GV 的首地址，使用 IRBuilder 创建 GEP（GetElementPointer）
                                    Value * DummyGvCDSPtr = builder.CreateGEP(ST, DummyGV, {
                                        Zero,
                                        builder.getInt32(i)
                                    });
                                    DummyGvCDSPtr = builder.CreateGEP(ArrayTy, DummyGvCDSPtr, {
                                        Zero,
                                        Zero
                                    });
                                    Value * ConfuseGvCDSPtr = builder.CreateGEP(NewST, ConfuzedGV, {
                                        Zero,
                                        builder.getInt32(i)
                                    });
                                    ConfuseGvCDSPtr = builder.CreateGEP(NewArrayTy, ConfuseGvCDSPtr, {
                                        Zero,
                                        Zero
                                    });
                                    // **加载 `TickGV` 的当前值**
                                    Value *TickGVVal = builder.CreateLoad(Int8Ty, TickGV);

                                    // **计算 `TickGV + 1`**
                                    Value *TickGVInc = builder.CreateSub(TickGVVal, builder.getInt8(1));

                                    SmallVector < Value * , 5 > AsCallArgs1 = {
                                        DummyGvCDSPtr, // dest ptr
                                        decryptedStrPtr, // src ptr
                                        builder.getInt32(originDataLen),
                                        builder.getInt32(1),
                                        TickGV,
                                    };
                                    SmallVector < Value * , 5 > AsCallArgs2 = {
                                        DummyGvCDSPtr, // dest ptr
                                        decryptedStrCachePtr, // src ptr
                                        builder.getInt32(originDataLen),
                                        builder.getInt32(1), 
                                        TickGV,
                                    };
                                    SmallVector < Value * , 5> AsCallArgs3 = {
                                        ConfuseGvCDSPtr, // dest ptr
                                        ConfuzedStrPtr, // src ptr
                                        builder.getInt32(confuzDataLen),
                                        builder.getInt32(1),
                                        TickGV,
                                    };
                                    SmallVector < Value * , 5> AsCallArgs4 = {
                                        DummyGvCDSPtr, // dest ptr
                                        decryptedStrPtr, // src ptr
                                        builder.getInt32(originDataLen),
                                        builder.getInt32(0),
                                        TickGV,
                                    };
                                    SmallVector < Value * , 2 > RandCallArgs = {
                                        decryptedStrCachePtr,
                                        builder.getInt32(originDataLen),
                                    };
                                    SmallVector < Value * , 6 > CallArgs = {
                                        builder.getInt32(0), // isCBC 参数
                                        builder.getInt32(1), // pkcs7 参数
                                        decryptedStrPtr, // dec space 参数
                                        ConfuzedStrPtr, // enc space 参数
                                        builder.getInt32(confuzDataLen), // enc data length 参数
                                        TickGV,
                                    };
                                    SmallVector < Value * , 5 > AsDunmmyCallArgs = {
                                        DummyGvCDSPtr, // dest ptr
                                        decryptedStrCachePtr, // src ptr
                                        builder.getInt32(originDataLen),
                                        builder.getInt32(0),
                                        TickGV,
                                    };
                                    if (IntTy == Type::getInt8Ty(Context)){
                                        builder.CreateCall(AssignFunc, AsCallArgs1); //assign dummy data from GV
                                        builder.CreateCall(AssignFunc, AsCallArgs2); //assign dummy data from GV
                                        builder.CreateCall(AssignFunc, AsCallArgs3); //assign confuse data from GV
                                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                                        builder.CreateCall(AssignFunc, AsCallArgs4); //assign unconfuzed data to GV
                                        if (useTick) {
                                            builder.CreateStore(TickGVInc, TickGV); //tick--
                                        }
                                        CallInst * NewCall = CallInst::Create(AssignFunc, AsDunmmyCallArgs); //recover dummy
                                        NewCall -> insertAfter(Inst); //after inst
                                    } else if (IntTy == Type::getInt32Ty(Context)){
                                        builder.CreateCall(AssignFuncInt32, AsCallArgs1); //assign dummy data from GV
                                        builder.CreateCall(AssignFuncInt32, AsCallArgs2); //assign dummy data from GV
                                        builder.CreateCall(AssignFuncInt32, AsCallArgs3); //assign confuse data from GV
                                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                                        builder.CreateCall(AssignFuncInt32, AsCallArgs4); //assign unconfuzed data to GV
                                        if (useTick) {
                                            builder.CreateStore(TickGVInc, TickGV); //tick--
                                        }
                                        CallInst * NewCall = CallInst::Create(AssignFuncInt32, AsDunmmyCallArgs); //recover dummy
                                        NewCall -> insertAfter(Inst); //after inst
                                    } else if (IntTy == Type::getInt64Ty(Context)){
                                        builder.CreateCall(AssignFuncInt64, AsCallArgs1); //assign dummy data from GV
                                        builder.CreateCall(AssignFuncInt64, AsCallArgs2); //assign dummy data from GV
                                        builder.CreateCall(AssignFuncInt64, AsCallArgs3); //assign confuse data from GV
                                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                                        builder.CreateCall(AssignFuncInt64, AsCallArgs4); //assign unconfuzed data to GV
                                        if (useTick) {
                                            builder.CreateStore(TickGVInc, TickGV); //tick--
                                        }
                                        CallInst * NewCall = CallInst::Create(AssignFuncInt64, AsDunmmyCallArgs); //recover dummy
                                        NewCall -> insertAfter(Inst); //after inst
                                    } else if (IntTy == Type::getInt16Ty(Context)){
                                        builder.CreateCall(AssignFuncInt16, AsCallArgs1); //assign dummy data from GV
                                        builder.CreateCall(AssignFuncInt16, AsCallArgs2); //assign dummy data from GV
                                        builder.CreateCall(AssignFuncInt16, AsCallArgs3); //assign confuse data from GV
                                        builder.CreateCall(RandFunc, RandCallArgs);  //generate random number
                                        builder.CreateCall(DecryptFunc, CallArgs); //insert sm4 dec
                                        builder.CreateCall(AssignFuncInt16, AsCallArgs4); //assign unconfuzed data to GV
                                        if (useTick) {
                                            builder.CreateStore(TickGVInc, TickGV); //tick--
                                        }
                                        CallInst * NewCall = CallInst::Create(AssignFuncInt16, AsDunmmyCallArgs); //recover dummy
                                        NewCall -> insertAfter(Inst); //after inst
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }  
} //InsertDecryptBlocks

void GVObfuscator::confuseString(Module & M){
    vector<GlobalVariable *> GVs;  //保存所有类型原始全局字符串
    vector<GlobalVariable *> IntGlobals; //int
    vector<GlobalVariable *> ArrayGlobals; //char[] int[]
    vector<GlobalVariable *> StructGlobals; // struct {int | char | int[] | char[]}
    map<GlobalVariable *,set<User *>> GV2Users; //全局字符串->引用其的user
    map < GlobalVariable * , pair < GlobalVariable * , GlobalVariable * >>  Orign2Confuz;
    map < GlobalVariable * , pair < Constant * , GlobalVariable * >> Confuz2DecryptKey;
    map < GlobalVariable * , GlobalVariable *> GV2Tick; //混淆心跳:5
    collectGVs(M,GVs);
    ClearUnusedGV(GVs);
    for (int i=0;i<GVs.size();i++){
        collectGVUsers(GVs[i],GV2Users);
    }
    if (debugMod) {
        outs() << "collectGVUsers over...\n";
    }
    setupGVTick(M, GVs, GV2Tick);
    if (debugMod) {
        outs() << "setupGVTick ovwe ...\n";
    }
    collectEncryptableGlobals(M,GVs,IntGlobals,ArrayGlobals,StructGlobals);
    if (debugMod) {
        outs() << "collectEncryptableGlobals over...\n";
    }
    confuseArrayGlobals(M, ArrayGlobals, Orign2Confuz, Confuz2DecryptKey);
    if (debugMod) {
        outs() << "confuseArrayGlobals over...\n";
    }
    confuseStructGlobals(M, StructGlobals, Orign2Confuz, Confuz2DecryptKey);
    if (debugMod) {
        outs() << "confuseStructGlobals over...\n";
    }
    ReplaceUse(Orign2Confuz, GV2Users);
    if (debugMod) {
        outs() << "ReplaceUse over...\n";
    }
    InsertDecryptBlocks(M, GV2Users,GV2Tick, Orign2Confuz, Confuz2DecryptKey);
    if (debugMod) {
        outs() << "InsertDecryptBlocks over...\n";
    }
    ClearUnusedGV(GVs);
    if (debugMod) {
        outs() << "ClearUnusedGV over...\n";
    }

} //confuseString

void GVObfuscator::confuseFunName(Module & M){
    LLVMContext &Context = M.getContext();
    unsigned char randString[TARGET_ARRAY_SIZE];
    int randLen = 4;
    for (Function &F : M.functions()) {
        // 跳过声明的函数（没有定义） 或者 LLVM 内置函数（如 llvm.memcpy）
        if (F.isDeclaration() || F.hasLocalLinkage() || F.getName() == "main"){
            continue;
        }
        genRandomString(randString,randLen);  //生成随机函数名后缀
        // 生成新名字，例如 _obf_func_1234
        string NewName = "_obf_func_" + string(reinterpret_cast<char*>(randString), randLen);

        if (debugMod) {
            errs() << "Renaming: " << F.getName() << " -> " << NewName << "\n";
        }
        F.setName(NewName);
    }
} //confuseFunName

} // namespace

char GVObfuscator::ID = 0;
static RegisterPass<GVObfuscator> X("gvobfus", "Global Variable Obfuscator", false, false);
