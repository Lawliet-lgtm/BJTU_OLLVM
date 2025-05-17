#include "CryptoUtils.h"
#include <cstring> 
#include <sstream>
#include <iomanip>
#include <cstdint>
#include <vector>
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

unsigned char GM_SM4_SBOX[256] ={
    0xd6, 0x90, 0xe9, 0xfe, 0xcc, 0xe1, 0x3d, 0xb7, 0x16, 0xb6, 0x14, 0xc2, 0x28, 0xfb, 0x2c, 0x05,
    0x2b, 0x67, 0x9a, 0x76, 0x2a, 0xbe, 0x04, 0xc3, 0xaa, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99,
    0x9c, 0x42, 0x50, 0xf4, 0x91, 0xef, 0x98, 0x7a, 0x33, 0x54, 0x0b, 0x43, 0xed, 0xcf, 0xac, 0x62,
    0xe4, 0xb3, 0x1c, 0xa9, 0xc9, 0x08, 0xe8, 0x95, 0x80, 0xdf, 0x94, 0xfa, 0x75, 0x8f, 0x3f, 0xa6,
    0x47, 0x07, 0xa7, 0xfc, 0xf3, 0x73, 0x17, 0xba, 0x83, 0x59, 0x3c, 0x19, 0xe6, 0x85, 0x4f, 0xa8,
    0x68, 0x6b, 0x81, 0xb2, 0x71, 0x64, 0xda, 0x8b, 0xf8, 0xeb, 0x0f, 0x4b, 0x70, 0x56, 0x9d, 0x35,
    0x1e, 0x24, 0x0e, 0x5e, 0x63, 0x58, 0xd1, 0xa2, 0x25, 0x22, 0x7c, 0x3b, 0x01, 0x21, 0x78, 0x87,
    0xd4, 0x00, 0x46, 0x57, 0x9f, 0xd3, 0x27, 0x52, 0x4c, 0x36, 0x02, 0xe7, 0xa0, 0xc4, 0xc8, 0x9e,
    0xea, 0xbf, 0x8a, 0xd2, 0x40, 0xc7, 0x38, 0xb5, 0xa3, 0xf7, 0xf2, 0xce, 0xf9, 0x61, 0x15, 0xa1,
    0xe0, 0xae, 0x5d, 0xa4, 0x9b, 0x34, 0x1a, 0x55, 0xad, 0x93, 0x32, 0x30, 0xf5, 0x8c, 0xb1, 0xe3,
    0x1d, 0xf6, 0xe2, 0x2e, 0x82, 0x66, 0xca, 0x60, 0xc0, 0x29, 0x23, 0xab, 0x0d, 0x53, 0x4e, 0x6f,
    0xd5, 0xdb, 0x37, 0x45, 0xde, 0xfd, 0x8e, 0x2f, 0x03, 0xff, 0x6a, 0x72, 0x6d, 0x6c, 0x5b, 0x51,
    0x8d, 0x1b, 0xaf, 0x92, 0xbb, 0xdd, 0xbc, 0x7f, 0x11, 0xd9, 0x5c, 0x41, 0x1f, 0x10, 0x5a, 0xd8,
    0x0a, 0xc1, 0x31, 0x88, 0xa5, 0xcd, 0x7b, 0xbd, 0x2d, 0x74, 0xd0, 0x12, 0xb8, 0xe5, 0xb4, 0xb0,
    0x89, 0x69, 0x97, 0x4a, 0x0c, 0x96, 0x77, 0x7e, 0x65, 0xb9, 0xf1, 0x09, 0xc5, 0x6e, 0xc6, 0x84,
    0x18, 0xf0, 0x7d, 0xec, 0x3a, 0xdc, 0x4d, 0x20, 0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48
};

unsigned int GM_SM4_FK[4] = {0xA3B1BAC6, 0x56AA3350, 0x677D9197, 0xB27022DC};

unsigned int GM_SM4_CK[32] = {
    0x00070e15, 0x1c232a31, 0x383f464d, 0x545b6269, 0x70777e85, 0x8c939aa1, 0xa8afb6bd, 0xc4cbd2d9,
    0xe0e7eef5, 0xfc030a11, 0x181f262d, 0x343b4249, 0x50575e65, 0x6c737a81, 0x888f969d, 0xa4abb2b9,
    0xc0c7ced5, 0xdce3eaf1, 0xf8ff060d, 0x141b2229, 0x30373e45, 0x4c535a61, 0x686f767d, 0x848b9299,
    0xa0a7aeb5, 0xbcc3cad1, 0xd8dfe6ed, 0xf4fb0209, 0x10171e25, 0x2c333a41, 0x484f565d, 0x646b7279
};
    
unsigned char key[16] = {
    0x6B, 0x8B, 0x45, 0x67, 0x32, 0x7B, 0x23, 0xC6,
    0x64, 0x3C, 0x98, 0x69, 0x66, 0x33, 0x48, 0x73
};
// 生成 64 位随机数
uint64_t CryptoUtils::get_uint64_t() {
    std::uniform_int_distribution<uint64_t> dist;
    return dist(rng);
}

/* SM4 module */

void CryptoUtils::sm4_key_schedule(const unsigned char * key, unsigned int * rk) {
    unsigned int tmp1, tmp2, K[36];
    int i;

    // K0, K1, K2, K3
    GM_GET_UINT32_BE( K[0], key, 0);
    GM_GET_UINT32_BE( K[1], key, 4);
    GM_GET_UINT32_BE( K[2], key, 8);
    GM_GET_UINT32_BE( K[3], key, 12);

    K[0] ^= GM_SM4_FK[0];
    K[1] ^= GM_SM4_FK[1];
    K[2] ^= GM_SM4_FK[2];
    K[3] ^= GM_SM4_FK[3];

    // rki = Ki+4
    for(i = 0; i < 32; i++)
    {
        // non linear's input
        tmp1 = K[i + 1] ^ K[i + 2] ^ K[i + 3] ^ GM_SM4_CK[i];

        // non linear operation
        GM_SM4_NON_LINEAR_OP(tmp1, tmp2);

        // linear operation
        rk[i] = K[i + 4] = K[i] ^ (tmp2 ^ GM_CROL(tmp2, 13) ^ GM_CROL(tmp2, 23));
    }
}
void CryptoUtils::gm_sm4_crypt(const unsigned char *key, int mode, const unsigned char *in, unsigned char *out){
    unsigned int rk[32], X[36], tmp1, tmp2;
    int i;

    // 计算轮密钥rk
    sm4_key_schedule(key, rk);

    GM_GET_UINT32_BE( X[0], in, 0);
    GM_GET_UINT32_BE( X[1], in, 4);
    GM_GET_UINT32_BE( X[2], in, 8);
    GM_GET_UINT32_BE( X[3], in, 12);

    for(i = 0; i < 32; i++)
    {
        tmp1 = X[i + 1] ^ X[i + 2] ^ X[i + 3] ^ rk[( (mode == GM_SM4_ENCRYPT) ? i : 31 - i )];

        // 非线性变换
        GM_SM4_NON_LINEAR_OP(tmp1, tmp2);

        // 线性变换
        unsigned int tt = (tmp2 ^ GM_CROL(tmp2, 2) ^ GM_CROL(tmp2, 10) ^ GM_CROL(tmp2, 18) ^ GM_CROL(tmp2, 24));

        X[i + 4] = X[i] ^ tt;
    }

    GM_PUT_UINT32_BE(X[35], out,  0);
    GM_PUT_UINT32_BE(X[34], out,  4);
    GM_PUT_UINT32_BE(X[33], out,  8);
    GM_PUT_UINT32_BE(X[32], out, 12);
}
void CryptoUtils::test_gm_sm4(const unsigned char * key, int mode,
    unsigned char * buf,
    const unsigned char * output_hex) {

    int i = 0;

    for(i = 0; i < 100000; i++) {
        gm_sm4_crypt(key, mode, buf, buf);
    }
    // for (i = 0; i < 16; i++) {
    //     sprintf(res + i * 2, "%02X", (buf[i] & 0x0FF));
    // }
    // return res;

    // printf("r = %s\n", res);
    // printf("test result: %s\n", (strcmp(reinterpret_cast<const char*>(output_hex), res) == 0 ? "ok" : "fail"));
}
void CryptoUtils::gm_sm4_init(gm_sm4_context * ctx, const unsigned char key[16], 
    int forEncryption, int pkcs7Padding, const unsigned char iv[16]){
        // 密钥扩展
	CryptoUtils::sm4_key_schedule(key, ctx->rk);

	// 初始化各状态
	ctx->state = ctx->cur_buf_len = ctx->total_len = 0;

	if(forEncryption) {
		ctx->state |= 0x01;
	}

	if(pkcs7Padding) {
		ctx->state |= 0x02;
	}

	if(iv != NULL) {
		memcpy(ctx->iv, iv, 16);
		ctx->state |= 0x04;
	}
}
static void one_round(unsigned int rk[32], int forEncryption, const unsigned char *in, unsigned char *out) {
	unsigned int X[36], tmp1, tmp2;
	int i;

	// transfer input
	GM_GET_UINT32_BE( X[0], in, 0);
    GM_GET_UINT32_BE( X[1], in, 4);
    GM_GET_UINT32_BE( X[2], in, 8);
    GM_GET_UINT32_BE( X[3], in, 12);

	for(i = 0; i < 32; i++)
	{
		// non linear's input
		tmp1 = X[i + 1] ^ X[i + 2] ^ X[i + 3] ^ rk[( forEncryption ? i : 31 - i )];

		// non linear operation
		GM_SM4_NON_LINEAR_OP(tmp1, tmp2);

		// linear operation
		unsigned int tt = (tmp2 ^ GM_CROL(tmp2, 2) ^ GM_CROL(tmp2, 10) ^ GM_CROL(tmp2, 18) ^ GM_CROL(tmp2, 24));

		X[i + 4] = X[i] ^ tt;
	}
    // std::stringstream ss1;
    
    // // 将整数格式化为16进制
    // ss1 << "0x" << std::setw(8) << std::setfill('0') << std::hex << X[35];
    
    // std::stringstream ss2;
    
    // // 将整数格式化为16进制
    // ss2 << "0x" << std::setw(8) << std::setfill('0') << std::hex << X[34];

    // std::stringstream ss3;
    
    // // 将整数格式化为16进制
    // ss3 << "0x" << std::setw(8) << std::setfill('0') << std::hex << X[33];

    // std::stringstream ss4;
    
    // // 将整数格式化为16进制
    // ss4 << "0x" << std::setw(8) << std::setfill('0') << std::hex << X[32];
    
    // // 输出到 llvm::outs()
    // llvm::outs() << "X[35]="<< ss1.str() << " X[34]=" << ss2.str()<<" X[33]=" << ss3.str() << " X[32]="<<ss4.str() << "\n" ;
	// output
    // llvm::outs()<<"output1="<<strlen(reinterpret_cast<const char*>(out))<<"\n";
    // for (size_t i = 0; i < 20; ++i) {
    //     std::stringstream ss;
    //     ss << i <<":0x" << std::setw(2) << std::setfill('0') << std::hex << (int)out[i];
        
    //     llvm::outs() <<ss.str() << " ";
    // }
    
    // llvm::outs() << "\n";
    
    GM_PUT_UINT32_BE(X[35], out,  0);
    // llvm::outs() << int(out[0])<<"\n";
    // llvm::outs() << (unsigned char) ( X[35] >> 24 )<<"\n";
    // // (out)[0] = (unsigned char) ( X[35] >> 24 );       
    // out[0] = 10; 
    // llvm::outs() << "1\n";
    // (out)[1] = (unsigned char) ( X[35] >> 16 );       \
    // llvm::outs() << "2\n";
    // (out)[2] = (unsigned char) ( X[35] >>  8 );       \
    // llvm::outs() << "3\n";
    // (out)[3] = (unsigned char) ( X[35]       );       \
    // llvm::outs() << "1\n";
    // llvm::outs()<<"output1="<<strlen(reinterpret_cast<const char*>(out))<<"\n";
    // for (size_t i = 0; i < 20; ++i) {
    //     std::stringstream ss;
    //     ss << "0x" << std::setw(2) << std::setfill('0') << std::hex << (int)out[i];
    //     llvm::outs() << ss.str() << " ";
    // }
    // llvm::outs() << "\n";
    GM_PUT_UINT32_BE(X[34], out,  4);
    // llvm::outs()<<"output1="<<strlen(reinterpret_cast<const char*>(out))<<"\n";
    // for (size_t i = 0; i < 20; ++i) {
    //     std::stringstream ss;
    //     ss << "0x" << std::setw(2) << std::setfill('0') << std::hex << (int)out[i];
    //     llvm::outs() << ss.str() << " ";
    // }
    // llvm::outs() << "\n";
    GM_PUT_UINT32_BE(X[33], out,  8);
    // llvm::outs()<<"output1="<<strlen(reinterpret_cast<const char*>(out))<<"\n";
    // for (size_t i = 0; i < 20; ++i) {
    //     std::stringstream ss;
    //     ss << "0x" << std::setw(2) << std::setfill('0') << std::hex << (int)out[i];
    //     llvm::outs() << ss.str() << " ";
    // }
    // llvm::outs() << "\n";
    GM_PUT_UINT32_BE(X[32], out, 12);
    // llvm::outs()<<"output1="<<strlen(reinterpret_cast<const char*>(out))<<"\n";
    // for (size_t i = 0; i < 20; ++i) {
    //     std::stringstream ss;
    //     ss << "0x" << std::setw(2) << std::setfill('0') << std::hex << (int)out[i];
    //     llvm::outs() << ss.str() << " ";
    // }
    // llvm::outs() << "\n";
}
static void update_one_round(gm_sm4_context * ctx, unsigned char * output) {
	int isCBC = (ctx->state & 0x04) > 0;
	int i;

	if(ctx->state & 0x01) {
    	// 加密

    	if(isCBC) {
        	// 先与IV异或，再加密
        	for(i = 0; i < 16; i++) {
        		ctx->buf[i] ^= ctx->iv[i];
        	}
        }
        // llvm::outs()<<"output0="<<strlen(reinterpret_cast<const char*>(output))<<"\n";
    	one_round(ctx->rk, 1, ctx->buf, output);
        // llvm::outs()<<"output="<<strlen(reinterpret_cast<const char*>(output))<<"\n";
    	if(isCBC) {
        	// 将密文作为下一轮的IV
        	memcpy(ctx->iv, output, 16);
        }
    }else {
    	// 解密

    	// 先解密，如果是CBC模式，再与IV进行异或
    	one_round(ctx->rk, 0, ctx->buf, output);

    	if(isCBC) {
        	for(i = 0; i < 16; i++) {
        		output[i] ^= ctx->iv[i];
        		// 将这一轮的密文作为下一轮的IV
        		ctx->iv[i] = ctx->buf[i];
        	}
        }
    }
}
int CryptoUtils::gm_sm4_update(gm_sm4_context * ctx, const unsigned char * input, unsigned int iLen, unsigned char * output) {
	int rLen = 0;
    // llvm::outs()<<"output00="<<strlen(reinterpret_cast<const char*>(output))<<"\n";
	do {
        if (ctx->cur_buf_len == 16) {
            // 满了，则立即调用轮函数进行处理
            update_one_round(ctx, output + rLen);
            ctx->total_len += 16;
            ctx->cur_buf_len = 0; // fix:0->-1 cancel
            rLen += 16;
        }

		ctx->buf[ctx->cur_buf_len++] = *input++;
        // llvm::outs()<<"ctx->cur_buf_len="<<ctx->cur_buf_len<<"\n";
        // llvm::outs()<<"iLen1="<<iLen<<"\n";
	} while(--iLen);
	return rLen;
}
int CryptoUtils::gm_sm4_done(gm_sm4_context * ctx, unsigned char * output) {
	int rLen = 0;

	// 事先处理未满16字节加密时的填充
	int pad = 0;
	if((ctx->state & 0x01) && (ctx->state & 0x02) && (ctx->cur_buf_len != 16)) {
		// 如果是加密，PKCS7Padding，并且是未满16字节，则填充
		pad = 16 - ctx->cur_buf_len;
        // llvm::outs()<<"ctx->cur_buf_len1="<<ctx->cur_buf_len<<"\n";
        // llvm::outs()<<"pad="<<pad<<"\n";
		memset(ctx->buf + ctx->cur_buf_len, pad, pad);
		ctx->cur_buf_len += pad;
	}

	if(ctx->cur_buf_len != 16) {
		// 要求待处理数据正好是16的倍数，
		// 我们在gm_sm4_update函数中留了一轮，如果这时如果当前数据长度不等于16，就说明待处理数据不是16的倍数
		return -1;
	}
	update_one_round(ctx, output);
	ctx->total_len += 16;
    ctx->cur_buf_len = 0;
	rLen = 16;

	if(ctx->state & 0x01) {
		// 加密
		if((ctx->state & 0x02)) {
			// PKCS7Padding
			if(pad == 0) {
				// 未进行事先的填充，则说明数据正好是16的倍数，则需要填充一个数据块
				// 再填充，再加密
				memset(ctx->buf, 16, 16);
				ctx->cur_buf_len = 16;
				update_one_round(ctx, output + rLen);
				ctx->total_len += 16;
	            ctx->cur_buf_len = 0;
				rLen += 16;
			}
		}
	}else {
		// 解密
		if((ctx->state & 0x02)) {
			// PKCS7Padding
			if(output[15] > 16 || output[15] <= 0) {
				// 如果是PKCS7Padding，则output最后一个字节肯定是填充字节，那其值肯定要小于等于16
				return -1;
			}
			rLen -= output[15];
		}
	}

	return rLen;
}
int CryptoUtils::Enc_sm4_ecb_cbc(int isCBC, int pkcs7, unsigned char * buf, int iLen) {
    int i;
    gm_sm4_context ctx;
    for(i = 0; i < 1; i++) {
        // 这里可以加一个reset函数来代替，避免每次都要计算一次rk
        gm_sm4_init(&ctx, key, 1, pkcs7, isCBC ? key : NULL);  // 加密
        // llvm::outs() << "round " << i << "\n";
        // llvm::outs()<<"iLen="<<iLen<<"\n";
        // 测试内容长度是16的倍数的case
        if(iLen > 32) {
            int tmpLen = iLen - 32;
            iLen = gm_sm4_update(&ctx, buf, 32, buf);
            iLen += gm_sm4_update(&ctx, buf + 32, tmpLen, buf + iLen);
        }else {
            // llvm::outs()<<"buf0="<<strlen(reinterpret_cast<const char*>(buf));
            iLen = gm_sm4_update(&ctx, buf, iLen, buf);
            // llvm::outs()<<"iLen="<<iLen<<"\n";
            // llvm::outs()<<"buf="<<strlen(reinterpret_cast<const char*>(buf));
            // llvm::outs()<<"\n";
            // for (size_t i = 0; i < 16; ++i) {
            //     std::stringstream ss;
            //     ss << "0x" << std::setw(2) << std::setfill('0') << std::hex << (int)buf[i];
            //     llvm::outs() << ss.str() << " ";
            // }
            // llvm::outs() << "\n";
        }
        
        int r = gm_sm4_done(&ctx, buf + iLen);
        // llvm::outs() << "r=" << r << "\n";
        if(r == -1) {
            printf("test result: fail1\n");
            return -1;
        }
        
        iLen += r;
        
    }
    return iLen;
}
extern "C" void Dec_sm4_ecb_cbc(int isCBC, int pkcs7, unsigned char * decbuf, unsigned char * buf, int iLen, uint8_t * tick){
    // unsigned char *varBuf = new unsigned char[TARGET_ARRAY_SIZE];
    // memcpy(varBuf, buf, iLen);
    // memset(varBuf + iLen, 0, TARGET_ARRAY_SIZE - iLen);
    // // unsigned char * varBuf = reinterpret_cast<unsigned char*>(dataCopy);
    if (*tick < 3){
        return;
    }
    int i;
    gm_sm4_context ctx;
    CryptoUtils cryptoUtils;  
    for(i = 0; i < 1; i++) {
        // 这里可以加一个reset函数来代替，避免每次都要计算一次rk
        cryptoUtils.gm_sm4_init(&ctx, key, 0, pkcs7, isCBC ? key : NULL);  // 解密
        // llvm::outs() << "round " << i << "\n";
        // llvm::outs()<<"iLen="<<iLen<<"\n";
        // 测试内容长度是16的倍数的case
        if(iLen > 32) {
            int tmpLen = iLen - 32;
            iLen = cryptoUtils.gm_sm4_update(&ctx, buf, 32, buf);
            iLen += cryptoUtils.gm_sm4_update(&ctx, buf + 32, tmpLen, buf + iLen);
        }else {
            // llvm::outs()<<"buf0="<<strlen(reinterpret_cast<const char*>(buf));
            iLen = cryptoUtils.gm_sm4_update(&ctx, buf, iLen, buf);
            // llvm::outs()<<"iLen="<<iLen<<"\n";
            // llvm::outs()<<"buf="<<strlen(reinterpret_cast<const char*>(buf));
            // llvm::outs()<<"\n";
            // for (size_t i = 0; i < 16; ++i) {
            //     std::stringstream ss;
            //     ss << "0x" << std::setw(2) << std::setfill('0') << std::hex << (int)buf[i];
            //     llvm::outs() << ss.str() << " ";
            // }
            // llvm::outs() << "\n";
        }
        
        int r = cryptoUtils.gm_sm4_done(&ctx, buf + iLen);
        // llvm::outs() << "r=" << r << "\n";
        if(r == -1) {
            printf("test result: fail1\n");
            return;
        }
        
        iLen += r;
        
    }
    // llvm::outs() << "iLen new=" << iLen << "\n";

    // llvm::outs() << "1\n";
    // if (GV != nullptr) {
    //     llvm::outs() << "GV Pointer Value: " << GV << "\n";
    // } else {
    //     llvm::outs() << "GV is nullptr!\n";
    // }
    
    // // 获取 LLVM Context
    // llvm::LLVMContext &Ctx = GV->getContext();

    // // 创建新的数组类型
    // llvm::ArrayType *newArrTy = llvm::ArrayType::get(llvm::Type::getInt8Ty(Ctx), iLen);


    // // 创建新的全局变量
    // llvm::GlobalVariable *NewGV = new llvm::GlobalVariable(
    //     *(GV)->getParent(), newArrTy, false, GV->getLinkage(),
    //     nullptr, GV->getName() + "_expanded"
    // );

    // // 复制原有的属性
    // NewGV->copyAttributesFrom(GV);


    // // 创建新的 ConstantDataArray
    // llvm::Constant *newInitializer = llvm::ConstantDataArray::getRaw(
    //     llvm::StringRef(reinterpret_cast<const char*>(varBuf), iLen), iLen, llvm::Type::getInt8Ty(Ctx)
    // );
    // NewGV->setInitializer(newInitializer);

    // // 替换旧的 GV
    // GV->replaceAllUsesWith(NewGV);
    // GV->eraseFromParent();
    // GV = NewGV;                     
    // GV->setConstant(false);
    // for (size_t i = 0; i < 20; ++i) {
    //     std::stringstream ss;
    //     ss << i <<":0x" << std::setw(2) << std::setfill('0') << std::hex << (int)buf[i];
        
    //     llvm::outs() <<ss.str() << " ";
    // }
    
    // llvm::outs() << "\n";
    for(i = 0; i < iLen; i++){
        decbuf[i] = buf[i];
    }
    return;
}

extern "C" void genRandomString(unsigned char * buf, int iLen){

    // 可用的字符集
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    const int charsetSize = sizeof(charset) - 1;  // 排除结束符'\0'

    // 随机填充 buf 数组
    for (int i = 0; i < iLen; ++i) {
        buf[i] = charset[rand() % charsetSize];  // 从字符集中随机选择一个字符
        // llvm::outs() << buf[i] << " ";
    }
    // llvm::outs() << "\n";

}

extern "C" void assignLow8BitsToInt8(uint8_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick) {
    if (*tick == 0){
        *tick = 5;
    }
    if (*tick == 1 || *tick==2 ){
        return;
    }
    if (reverse == 0){
        for (size_t i = 0; i < count; ++i) {
            // 只将srcArray[i]赋值给destArray[i]的低8位
            destArray[i] = srcArray[i];
        }
    } else {
        for (size_t i = 0; i < count; ++i) {
            // 只将destArray[i]赋值给srcArray[i]的低8位
            srcArray[i] = destArray[i];
        }
    }
    
}
extern "C" void assignLow8BitsToInt16(uint16_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick) {
    if (*tick == 0){
        *tick = 5;
    }
    if (*tick == 1 || *tick==2 ){
        return;
    }
    if (reverse == 0){
        for (size_t i = 0; i < count; ++i) {
            // 只将srcArray[i]赋值给destArray[i]的低8位
            destArray[i] = static_cast<uint16_t>(srcArray[i]);
        }
    } else {
        for (size_t i = 0; i < count; ++i) {
            // 只将destArray[i]赋值给srcArray[i]的低8位
            srcArray[i] = static_cast<uint8_t>(destArray[i]);
        }
    }
    
}
extern "C" void assignLow8BitsToInt32(uint32_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick) {
    if (*tick == 0){
        *tick = 5;
    }
    if (*tick == 1 || *tick==2 ){
        return;
    }
    if (reverse == 0){
        for (size_t i = 0; i < count; ++i) {
            // 只将srcArray[i]赋值给destArray[i]的低8位
            destArray[i] = static_cast<uint32_t>(srcArray[i]);
        }
    } else {
        for (size_t i = 0; i < count; ++i) {
            // 只将destArray[i]赋值给srcArray[i]的低8位
            srcArray[i] = static_cast<uint8_t>(destArray[i]);
        }
    }
    
}
extern "C" void assignLow8BitsToInt64(uint64_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick) {
    if (*tick == 0){
        *tick = 5;
    }
    if (*tick == 1 || *tick==2 ){
        return;
    }
    if (reverse == 0) {
        for (size_t i = 0; i < count; ++i) {
            // 只将srcArray[i]赋值给destArray[i]的低8位
            destArray[i] = static_cast<uint64_t>(srcArray[i]);
        }
    } else {
        for (size_t i = 0; i < count; ++i) {
            // 只将destArray[i]赋值给srcArray[i]的低8位
            srcArray[i] = static_cast<uint8_t>(destArray[i]);
        }
    }
    
}