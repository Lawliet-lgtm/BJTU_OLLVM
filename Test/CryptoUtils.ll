; ModuleID = 'CryptoUtils.cpp'
source_filename = "CryptoUtils.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.CryptoUtils = type { %"class.std::mersenne_twister_engine" }
%"class.std::mersenne_twister_engine" = type { [312 x i64], i64 }
%"class.std::uniform_int_distribution" = type { %"struct.std::uniform_int_distribution<unsigned long>::param_type" }
%"struct.std::uniform_int_distribution<unsigned long>::param_type" = type { i64, i64 }
%struct.gm_sm4_context = type { [32 x i32], [16 x i8], [16 x i8], i32, i32, i32 }
%"class.std::random_device" = type { %union.anon }
%union.anon = type { %"class.std::mersenne_twister_engine.0" }
%"class.std::mersenne_twister_engine.0" = type { [624 x i64], i64 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon.1 }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { i8* }
%union.anon.1 = type { i64, [8 x i8] }
%"class.std::allocator" = type { i8 }

$_ZNSt24uniform_int_distributionImEC2Ev = comdat any

$_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_ = comdat any

$_ZN11CryptoUtilsC2Ev = comdat any

$_ZNSt13random_deviceC2Ev = comdat any

$_ZNSt13random_deviceclEv = comdat any

$_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEC2Em = comdat any

$_ZNSt13random_deviceD2Ev = comdat any

$_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE4seedEm = comdat any

$_ZNSt8__detail5__modImLm0ELm1ELm0EEET_S1_ = comdat any

$_ZNSt8__detail5__modImLm312ELm1ELm0EEET_S1_ = comdat any

$_ZNSt8__detail4_ModImLm0ELm1ELm0ELb1ELb0EE6__calcEm = comdat any

$_ZNSt8__detail4_ModImLm312ELm1ELm0ELb1ELb1EE6__calcEm = comdat any

$__clang_call_terminate = comdat any

$_ZNSt24uniform_int_distributionImEC2Emm = comdat any

$_ZNSt24uniform_int_distributionImE10param_typeC2Emm = comdat any

$_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_RKNS0_10param_typeE = comdat any

$_ZNKSt24uniform_int_distributionImE10param_type1bEv = comdat any

$_ZNKSt24uniform_int_distributionImE10param_type1aEv = comdat any

$_ZNSt24uniform_int_distributionImE5_S_ndIoSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEmEET1_RT0_S4_ = comdat any

$_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEclEv = comdat any

$_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv = comdat any

@_ZN4llvm24DisableABIBreakingChecksE = external global i32, align 4
@_ZN4llvm30VerifyDisableABIBreakingChecksE = weak hidden global i32* @_ZN4llvm24DisableABIBreakingChecksE, align 8
@GM_SM4_SBOX = dso_local global [256 x i8] c"\D6\90\E9\FE\CC\E1=\B7\16\B6\14\C2(\FB,\05+g\9Av*\BE\04\C3\AAD\13&I\86\06\99\9CBP\F4\91\EF\98z3T\0BC\ED\CF\ACb\E4\B3\1C\A9\C9\08\E8\95\80\DF\94\FAu\8F?\A6G\07\A7\FC\F3s\17\BA\83Y<\19\E6\85O\A8hk\81\B2qd\DA\8B\F8\EB\0FKpV\9D5\1E$\0E^cX\D1\A2%\22|;\01!x\87\D4\00FW\9F\D3'RL6\02\E7\A0\C4\C8\9E\EA\BF\8A\D2@\C78\B5\A3\F7\F2\CE\F9a\15\A1\E0\AE]\A4\9B4\1AU\AD\9320\F5\8C\B1\E3\1D\F6\E2.\82f\CA`\C0)#\AB\0DSNo\D5\DB7E\DE\FD\8E/\03\FFjrml[Q\8D\1B\AF\92\BB\DD\BC\7F\11\D9\\A\1F\10Z\D8\0A\C11\88\A5\CD{\BD-t\D0\12\B8\E5\B4\B0\89i\97J\0C\96w~e\B9\F1\09\C5n\C6\84\18\F0}\EC:\DCM y\EE_>\D7\CB9H", align 16
@GM_SM4_FK = dso_local global [4 x i32] [i32 -1548633402, i32 1453994832, i32 1736282519, i32 -1301273892], align 16
@GM_SM4_CK = dso_local global [32 x i32] [i32 462357, i32 472066609, i32 943670861, i32 1415275113, i32 1886879365, i32 -1936483679, i32 -1464879427, i32 -993275175, i32 -521670923, i32 -66909679, i32 404694573, i32 876298825, i32 1347903077, i32 1819507329, i32 -2003855715, i32 -1532251463, i32 -1060647211, i32 -589042959, i32 -117504499, i32 337322537, i32 808926789, i32 1280531041, i32 1752135293, i32 -2071227751, i32 -1599623499, i32 -1128019247, i32 -656414995, i32 -184876535, i32 269950501, i32 741554753, i32 1213159005, i32 1684763257], align 16
@key = dso_local global [16 x i8] c"k\8BEg2{#\C6d<\98if3Hs", align 16
@.str = private unnamed_addr constant [20 x i8] c"test result: fail1\0A\00", align 1
@__const.genRandomString.charset = private unnamed_addr constant [63 x i8] c"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\00", align 16
@.str.1 = private unnamed_addr constant [8 x i8] c"default\00", align 1

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i64 @_ZN11CryptoUtils12get_uint64_tEv(%class.CryptoUtils* noundef nonnull align 8 dereferenceable(2504) %0) #0 align 2 {
  %2 = alloca %class.CryptoUtils*, align 8
  %3 = alloca %"class.std::uniform_int_distribution", align 8
  store %class.CryptoUtils* %0, %class.CryptoUtils** %2, align 8
  %4 = load %class.CryptoUtils*, %class.CryptoUtils** %2, align 8
  call void @_ZNSt24uniform_int_distributionImEC2Ev(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %3)
  %5 = getelementptr inbounds %class.CryptoUtils, %class.CryptoUtils* %4, i32 0, i32 0
  %6 = call noundef i64 @_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %3, %"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %5)
  ret i64 %6
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt24uniform_int_distributionImEC2Ev(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #1 comdat align 2 {
  %2 = alloca %"class.std::uniform_int_distribution"*, align 8
  store %"class.std::uniform_int_distribution"* %0, %"class.std::uniform_int_distribution"** %2, align 8
  %3 = load %"class.std::uniform_int_distribution"*, %"class.std::uniform_int_distribution"** %2, align 8
  call void @_ZNSt24uniform_int_distributionImEC2Emm(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %3, i64 noundef 0, i64 noundef -1)
  ret void
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %0, %"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %1) #0 comdat align 2 {
  %3 = alloca %"class.std::uniform_int_distribution"*, align 8
  %4 = alloca %"class.std::mersenne_twister_engine"*, align 8
  store %"class.std::uniform_int_distribution"* %0, %"class.std::uniform_int_distribution"** %3, align 8
  store %"class.std::mersenne_twister_engine"* %1, %"class.std::mersenne_twister_engine"** %4, align 8
  %5 = load %"class.std::uniform_int_distribution"*, %"class.std::uniform_int_distribution"** %3, align 8
  %6 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %4, align 8
  %7 = getelementptr inbounds %"class.std::uniform_int_distribution", %"class.std::uniform_int_distribution"* %5, i32 0, i32 0
  %8 = call noundef i64 @_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_RKNS0_10param_typeE(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %5, %"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %6, %"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %7)
  ret i64 %8
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN11CryptoUtils16sm4_key_scheduleEPKhPj(i8* noundef %0, i32* noundef %1) #2 align 2 {
  %3 = alloca i8*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [36 x i32], align 16
  %8 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32* %1, i32** %4, align 8
  %9 = load i8*, i8** %3, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i32
  %13 = shl i32 %12, 24
  %14 = load i8*, i8** %3, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 1
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = shl i32 %17, 16
  %19 = or i32 %13, %18
  %20 = load i8*, i8** %3, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 2
  %22 = load i8, i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = shl i32 %23, 8
  %25 = or i32 %19, %24
  %26 = load i8*, i8** %3, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 3
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = or i32 %25, %29
  %31 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 0
  store i32 %30, i32* %31, align 16
  %32 = load i8*, i8** %3, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 4
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = shl i32 %35, 24
  %37 = load i8*, i8** %3, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 5
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = shl i32 %40, 16
  %42 = or i32 %36, %41
  %43 = load i8*, i8** %3, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 6
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = shl i32 %46, 8
  %48 = or i32 %42, %47
  %49 = load i8*, i8** %3, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 7
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = or i32 %48, %52
  %54 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 1
  store i32 %53, i32* %54, align 4
  %55 = load i8*, i8** %3, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 8
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, 24
  %60 = load i8*, i8** %3, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 9
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = shl i32 %63, 16
  %65 = or i32 %59, %64
  %66 = load i8*, i8** %3, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 10
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = shl i32 %69, 8
  %71 = or i32 %65, %70
  %72 = load i8*, i8** %3, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 11
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = or i32 %71, %75
  %77 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 2
  store i32 %76, i32* %77, align 8
  %78 = load i8*, i8** %3, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 12
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = shl i32 %81, 24
  %83 = load i8*, i8** %3, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 13
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = shl i32 %86, 16
  %88 = or i32 %82, %87
  %89 = load i8*, i8** %3, align 8
  %90 = getelementptr inbounds i8, i8* %89, i64 14
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = shl i32 %92, 8
  %94 = or i32 %88, %93
  %95 = load i8*, i8** %3, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 15
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = or i32 %94, %98
  %100 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 3
  store i32 %99, i32* %100, align 4
  %101 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @GM_SM4_FK, i64 0, i64 0), align 16
  %102 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 0
  %103 = load i32, i32* %102, align 16
  %104 = xor i32 %103, %101
  store i32 %104, i32* %102, align 16
  %105 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @GM_SM4_FK, i64 0, i64 1), align 4
  %106 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 1
  %107 = load i32, i32* %106, align 4
  %108 = xor i32 %107, %105
  store i32 %108, i32* %106, align 4
  %109 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @GM_SM4_FK, i64 0, i64 2), align 8
  %110 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 2
  %111 = load i32, i32* %110, align 8
  %112 = xor i32 %111, %109
  store i32 %112, i32* %110, align 8
  %113 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @GM_SM4_FK, i64 0, i64 3), align 4
  %114 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 3
  %115 = load i32, i32* %114, align 4
  %116 = xor i32 %115, %113
  store i32 %116, i32* %114, align 4
  store i32 0, i32* %8, align 4
  br label %117

117:                                              ; preds = %207, %2
  %118 = load i32, i32* %8, align 4
  %119 = icmp slt i32 %118, 32
  br i1 %119, label %120, label %210

120:                                              ; preds = %117
  %121 = load i32, i32* %8, align 4
  %122 = add nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 %123
  %125 = load i32, i32* %124, align 4
  %126 = load i32, i32* %8, align 4
  %127 = add nsw i32 %126, 2
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 %128
  %130 = load i32, i32* %129, align 4
  %131 = xor i32 %125, %130
  %132 = load i32, i32* %8, align 4
  %133 = add nsw i32 %132, 3
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 %134
  %136 = load i32, i32* %135, align 4
  %137 = xor i32 %131, %136
  %138 = load i32, i32* %8, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [32 x i32], [32 x i32]* @GM_SM4_CK, i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  %142 = xor i32 %137, %141
  store i32 %142, i32* %5, align 4
  %143 = load i32, i32* %5, align 4
  %144 = lshr i32 %143, 24
  %145 = and i32 %144, 255
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = shl i32 %149, 24
  store i32 %150, i32* %6, align 4
  %151 = load i32, i32* %5, align 4
  %152 = lshr i32 %151, 16
  %153 = and i32 %152, 255
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %154
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = shl i32 %157, 16
  %159 = load i32, i32* %6, align 4
  %160 = or i32 %159, %158
  store i32 %160, i32* %6, align 4
  %161 = load i32, i32* %5, align 4
  %162 = lshr i32 %161, 8
  %163 = and i32 %162, 255
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = shl i32 %167, 8
  %169 = load i32, i32* %6, align 4
  %170 = or i32 %169, %168
  store i32 %170, i32* %6, align 4
  %171 = load i32, i32* %5, align 4
  %172 = and i32 %171, 255
  %173 = zext i32 %172 to i64
  %174 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %173
  %175 = load i8, i8* %174, align 1
  %176 = zext i8 %175 to i32
  %177 = load i32, i32* %6, align 4
  %178 = or i32 %177, %176
  store i32 %178, i32* %6, align 4
  %179 = load i32, i32* %8, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 %180
  %182 = load i32, i32* %181, align 4
  %183 = load i32, i32* %6, align 4
  %184 = load i32, i32* %6, align 4
  %185 = and i32 %184, -1
  %186 = shl i32 %185, 13
  %187 = load i32, i32* %6, align 4
  %188 = lshr i32 %187, 19
  %189 = or i32 %186, %188
  %190 = xor i32 %183, %189
  %191 = load i32, i32* %6, align 4
  %192 = and i32 %191, -1
  %193 = shl i32 %192, 23
  %194 = load i32, i32* %6, align 4
  %195 = lshr i32 %194, 9
  %196 = or i32 %193, %195
  %197 = xor i32 %190, %196
  %198 = xor i32 %182, %197
  %199 = load i32, i32* %8, align 4
  %200 = add nsw i32 %199, 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [36 x i32], [36 x i32]* %7, i64 0, i64 %201
  store i32 %198, i32* %202, align 4
  %203 = load i32*, i32** %4, align 8
  %204 = load i32, i32* %8, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i32, i32* %203, i64 %205
  store i32 %198, i32* %206, align 4
  br label %207

207:                                              ; preds = %120
  %208 = load i32, i32* %8, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %8, align 4
  br label %117, !llvm.loop !6

210:                                              ; preds = %117
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN11CryptoUtils12gm_sm4_cryptEPKhiS1_Ph(i8* noundef %0, i32 noundef %1, i8* noundef %2, i8* noundef %3) #2 align 2 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca [32 x i32], align 16
  %10 = alloca [36 x i32], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  store i8* %3, i8** %8, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %9, i64 0, i64 0
  call void @_ZN11CryptoUtils16sm4_key_scheduleEPKhPj(i8* noundef %15, i32* noundef %16)
  %17 = load i8*, i8** %7, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 0
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = shl i32 %20, 24
  %22 = load i8*, i8** %7, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 1
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = shl i32 %25, 16
  %27 = or i32 %21, %26
  %28 = load i8*, i8** %7, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 2
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = shl i32 %31, 8
  %33 = or i32 %27, %32
  %34 = load i8*, i8** %7, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 3
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = or i32 %33, %37
  %39 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 0
  store i32 %38, i32* %39, align 16
  %40 = load i8*, i8** %7, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 4
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl i32 %43, 24
  %45 = load i8*, i8** %7, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 5
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = shl i32 %48, 16
  %50 = or i32 %44, %49
  %51 = load i8*, i8** %7, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 6
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = shl i32 %54, 8
  %56 = or i32 %50, %55
  %57 = load i8*, i8** %7, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 7
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = or i32 %56, %60
  %62 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 1
  store i32 %61, i32* %62, align 4
  %63 = load i8*, i8** %7, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 8
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl i32 %66, 24
  %68 = load i8*, i8** %7, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 9
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = shl i32 %71, 16
  %73 = or i32 %67, %72
  %74 = load i8*, i8** %7, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 10
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = shl i32 %77, 8
  %79 = or i32 %73, %78
  %80 = load i8*, i8** %7, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 11
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = or i32 %79, %83
  %85 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 2
  store i32 %84, i32* %85, align 8
  %86 = load i8*, i8** %7, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 12
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = shl i32 %89, 24
  %91 = load i8*, i8** %7, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 13
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = shl i32 %94, 16
  %96 = or i32 %90, %95
  %97 = load i8*, i8** %7, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 14
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = shl i32 %100, 8
  %102 = or i32 %96, %101
  %103 = load i8*, i8** %7, align 8
  %104 = getelementptr inbounds i8, i8* %103, i64 15
  %105 = load i8, i8* %104, align 1
  %106 = zext i8 %105 to i32
  %107 = or i32 %102, %106
  %108 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 3
  store i32 %107, i32* %108, align 4
  store i32 0, i32* %13, align 4
  br label %109

109:                                              ; preds = %218, %4
  %110 = load i32, i32* %13, align 4
  %111 = icmp slt i32 %110, 32
  br i1 %111, label %112, label %221

112:                                              ; preds = %109
  %113 = load i32, i32* %13, align 4
  %114 = add nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 %115
  %117 = load i32, i32* %116, align 4
  %118 = load i32, i32* %13, align 4
  %119 = add nsw i32 %118, 2
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 %120
  %122 = load i32, i32* %121, align 4
  %123 = xor i32 %117, %122
  %124 = load i32, i32* %13, align 4
  %125 = add nsw i32 %124, 3
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 %126
  %128 = load i32, i32* %127, align 4
  %129 = xor i32 %123, %128
  %130 = load i32, i32* %6, align 4
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %134

132:                                              ; preds = %112
  %133 = load i32, i32* %13, align 4
  br label %137

134:                                              ; preds = %112
  %135 = load i32, i32* %13, align 4
  %136 = sub nsw i32 31, %135
  br label %137

137:                                              ; preds = %134, %132
  %138 = phi i32 [ %133, %132 ], [ %136, %134 ]
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [32 x i32], [32 x i32]* %9, i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  %142 = xor i32 %129, %141
  store i32 %142, i32* %11, align 4
  %143 = load i32, i32* %11, align 4
  %144 = lshr i32 %143, 24
  %145 = and i32 %144, 255
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = shl i32 %149, 24
  store i32 %150, i32* %12, align 4
  %151 = load i32, i32* %11, align 4
  %152 = lshr i32 %151, 16
  %153 = and i32 %152, 255
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %154
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = shl i32 %157, 16
  %159 = load i32, i32* %12, align 4
  %160 = or i32 %159, %158
  store i32 %160, i32* %12, align 4
  %161 = load i32, i32* %11, align 4
  %162 = lshr i32 %161, 8
  %163 = and i32 %162, 255
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = shl i32 %167, 8
  %169 = load i32, i32* %12, align 4
  %170 = or i32 %169, %168
  store i32 %170, i32* %12, align 4
  %171 = load i32, i32* %11, align 4
  %172 = and i32 %171, 255
  %173 = zext i32 %172 to i64
  %174 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %173
  %175 = load i8, i8* %174, align 1
  %176 = zext i8 %175 to i32
  %177 = load i32, i32* %12, align 4
  %178 = or i32 %177, %176
  store i32 %178, i32* %12, align 4
  %179 = load i32, i32* %12, align 4
  %180 = load i32, i32* %12, align 4
  %181 = and i32 %180, -1
  %182 = shl i32 %181, 2
  %183 = load i32, i32* %12, align 4
  %184 = lshr i32 %183, 30
  %185 = or i32 %182, %184
  %186 = xor i32 %179, %185
  %187 = load i32, i32* %12, align 4
  %188 = and i32 %187, -1
  %189 = shl i32 %188, 10
  %190 = load i32, i32* %12, align 4
  %191 = lshr i32 %190, 22
  %192 = or i32 %189, %191
  %193 = xor i32 %186, %192
  %194 = load i32, i32* %12, align 4
  %195 = and i32 %194, -1
  %196 = shl i32 %195, 18
  %197 = load i32, i32* %12, align 4
  %198 = lshr i32 %197, 14
  %199 = or i32 %196, %198
  %200 = xor i32 %193, %199
  %201 = load i32, i32* %12, align 4
  %202 = and i32 %201, -1
  %203 = shl i32 %202, 24
  %204 = load i32, i32* %12, align 4
  %205 = lshr i32 %204, 8
  %206 = or i32 %203, %205
  %207 = xor i32 %200, %206
  store i32 %207, i32* %14, align 4
  %208 = load i32, i32* %13, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 %209
  %211 = load i32, i32* %210, align 4
  %212 = load i32, i32* %14, align 4
  %213 = xor i32 %211, %212
  %214 = load i32, i32* %13, align 4
  %215 = add nsw i32 %214, 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 %216
  store i32 %213, i32* %217, align 4
  br label %218

218:                                              ; preds = %137
  %219 = load i32, i32* %13, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %13, align 4
  br label %109, !llvm.loop !8

221:                                              ; preds = %109
  %222 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 35
  %223 = load i32, i32* %222, align 4
  %224 = lshr i32 %223, 24
  %225 = trunc i32 %224 to i8
  %226 = load i8*, i8** %8, align 8
  %227 = getelementptr inbounds i8, i8* %226, i64 0
  store i8 %225, i8* %227, align 1
  %228 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 35
  %229 = load i32, i32* %228, align 4
  %230 = lshr i32 %229, 16
  %231 = trunc i32 %230 to i8
  %232 = load i8*, i8** %8, align 8
  %233 = getelementptr inbounds i8, i8* %232, i64 1
  store i8 %231, i8* %233, align 1
  %234 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 35
  %235 = load i32, i32* %234, align 4
  %236 = lshr i32 %235, 8
  %237 = trunc i32 %236 to i8
  %238 = load i8*, i8** %8, align 8
  %239 = getelementptr inbounds i8, i8* %238, i64 2
  store i8 %237, i8* %239, align 1
  %240 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 35
  %241 = load i32, i32* %240, align 4
  %242 = trunc i32 %241 to i8
  %243 = load i8*, i8** %8, align 8
  %244 = getelementptr inbounds i8, i8* %243, i64 3
  store i8 %242, i8* %244, align 1
  %245 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 34
  %246 = load i32, i32* %245, align 8
  %247 = lshr i32 %246, 24
  %248 = trunc i32 %247 to i8
  %249 = load i8*, i8** %8, align 8
  %250 = getelementptr inbounds i8, i8* %249, i64 4
  store i8 %248, i8* %250, align 1
  %251 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 34
  %252 = load i32, i32* %251, align 8
  %253 = lshr i32 %252, 16
  %254 = trunc i32 %253 to i8
  %255 = load i8*, i8** %8, align 8
  %256 = getelementptr inbounds i8, i8* %255, i64 5
  store i8 %254, i8* %256, align 1
  %257 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 34
  %258 = load i32, i32* %257, align 8
  %259 = lshr i32 %258, 8
  %260 = trunc i32 %259 to i8
  %261 = load i8*, i8** %8, align 8
  %262 = getelementptr inbounds i8, i8* %261, i64 6
  store i8 %260, i8* %262, align 1
  %263 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 34
  %264 = load i32, i32* %263, align 8
  %265 = trunc i32 %264 to i8
  %266 = load i8*, i8** %8, align 8
  %267 = getelementptr inbounds i8, i8* %266, i64 7
  store i8 %265, i8* %267, align 1
  %268 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 33
  %269 = load i32, i32* %268, align 4
  %270 = lshr i32 %269, 24
  %271 = trunc i32 %270 to i8
  %272 = load i8*, i8** %8, align 8
  %273 = getelementptr inbounds i8, i8* %272, i64 8
  store i8 %271, i8* %273, align 1
  %274 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 33
  %275 = load i32, i32* %274, align 4
  %276 = lshr i32 %275, 16
  %277 = trunc i32 %276 to i8
  %278 = load i8*, i8** %8, align 8
  %279 = getelementptr inbounds i8, i8* %278, i64 9
  store i8 %277, i8* %279, align 1
  %280 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 33
  %281 = load i32, i32* %280, align 4
  %282 = lshr i32 %281, 8
  %283 = trunc i32 %282 to i8
  %284 = load i8*, i8** %8, align 8
  %285 = getelementptr inbounds i8, i8* %284, i64 10
  store i8 %283, i8* %285, align 1
  %286 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 33
  %287 = load i32, i32* %286, align 4
  %288 = trunc i32 %287 to i8
  %289 = load i8*, i8** %8, align 8
  %290 = getelementptr inbounds i8, i8* %289, i64 11
  store i8 %288, i8* %290, align 1
  %291 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 32
  %292 = load i32, i32* %291, align 16
  %293 = lshr i32 %292, 24
  %294 = trunc i32 %293 to i8
  %295 = load i8*, i8** %8, align 8
  %296 = getelementptr inbounds i8, i8* %295, i64 12
  store i8 %294, i8* %296, align 1
  %297 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 32
  %298 = load i32, i32* %297, align 16
  %299 = lshr i32 %298, 16
  %300 = trunc i32 %299 to i8
  %301 = load i8*, i8** %8, align 8
  %302 = getelementptr inbounds i8, i8* %301, i64 13
  store i8 %300, i8* %302, align 1
  %303 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 32
  %304 = load i32, i32* %303, align 16
  %305 = lshr i32 %304, 8
  %306 = trunc i32 %305 to i8
  %307 = load i8*, i8** %8, align 8
  %308 = getelementptr inbounds i8, i8* %307, i64 14
  store i8 %306, i8* %308, align 1
  %309 = getelementptr inbounds [36 x i32], [36 x i32]* %10, i64 0, i64 32
  %310 = load i32, i32* %309, align 16
  %311 = trunc i32 %310 to i8
  %312 = load i8*, i8** %8, align 8
  %313 = getelementptr inbounds i8, i8* %312, i64 15
  store i8 %311, i8* %313, align 1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN11CryptoUtils11test_gm_sm4EPKhiPhS1_(i8* noundef %0, i32 noundef %1, i8* noundef %2, i8* noundef %3) #2 align 2 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  store i8* %3, i8** %8, align 8
  store i32 0, i32* %9, align 4
  store i32 0, i32* %9, align 4
  br label %10

10:                                               ; preds = %18, %4
  %11 = load i32, i32* %9, align 4
  %12 = icmp slt i32 %11, 100000
  br i1 %12, label %13, label %21

13:                                               ; preds = %10
  %14 = load i8*, i8** %5, align 8
  %15 = load i32, i32* %6, align 4
  %16 = load i8*, i8** %7, align 8
  %17 = load i8*, i8** %7, align 8
  call void @_ZN11CryptoUtils12gm_sm4_cryptEPKhiS1_Ph(i8* noundef %14, i32 noundef %15, i8* noundef %16, i8* noundef %17)
  br label %18

18:                                               ; preds = %13
  %19 = load i32, i32* %9, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %9, align 4
  br label %10, !llvm.loop !9

21:                                               ; preds = %10
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_ZN11CryptoUtils11gm_sm4_initEP14gm_sm4_contextPKhiiS3_(%struct.gm_sm4_context* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, i8* noundef %4) #2 align 2 {
  %6 = alloca %struct.gm_sm4_context*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  store %struct.gm_sm4_context* %0, %struct.gm_sm4_context** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i8* %4, i8** %10, align 8
  %11 = load i8*, i8** %7, align 8
  %12 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %13 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %12, i32 0, i32 0
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %13, i64 0, i64 0
  call void @_ZN11CryptoUtils16sm4_key_scheduleEPKhPj(i8* noundef %11, i32* noundef %14)
  %15 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %16 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %15, i32 0, i32 4
  store i32 0, i32* %16, align 4
  %17 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %18 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %17, i32 0, i32 3
  store i32 0, i32* %18, align 4
  %19 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %20 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %19, i32 0, i32 5
  store i32 0, i32* %20, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %28

23:                                               ; preds = %5
  %24 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %25 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %24, i32 0, i32 5
  %26 = load i32, i32* %25, align 4
  %27 = or i32 %26, 1
  store i32 %27, i32* %25, align 4
  br label %28

28:                                               ; preds = %23, %5
  %29 = load i32, i32* %9, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %36

31:                                               ; preds = %28
  %32 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %33 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %32, i32 0, i32 5
  %34 = load i32, i32* %33, align 4
  %35 = or i32 %34, 2
  store i32 %35, i32* %33, align 4
  br label %36

36:                                               ; preds = %31, %28
  %37 = load i8*, i8** %10, align 8
  %38 = icmp ne i8* %37, null
  br i1 %38, label %39, label %48

39:                                               ; preds = %36
  %40 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %41 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %40, i32 0, i32 2
  %42 = getelementptr inbounds [16 x i8], [16 x i8]* %41, i64 0, i64 0
  %43 = load i8*, i8** %10, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %42, i8* align 1 %43, i64 16, i1 false)
  %44 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %6, align 8
  %45 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %44, i32 0, i32 5
  %46 = load i32, i32* %45, align 4
  %47 = or i32 %46, 4
  store i32 %47, i32* %45, align 4
  br label %48

48:                                               ; preds = %39, %36
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %0, i8* noundef %1, i32 noundef %2, i8* noundef %3) #0 align 2 {
  %5 = alloca %struct.gm_sm4_context*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.gm_sm4_context* %0, %struct.gm_sm4_context** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i8* %3, i8** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

10:                                               ; preds = %41, %4
  %11 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %5, align 8
  %12 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %11, i32 0, i32 3
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %13, 16
  br i1 %14, label %15, label %29

15:                                               ; preds = %10
  %16 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %5, align 8
  %17 = load i8*, i8** %8, align 8
  %18 = load i32, i32* %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  call void @_ZL16update_one_roundP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %16, i8* noundef %20)
  %21 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %5, align 8
  %22 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %21, i32 0, i32 4
  %23 = load i32, i32* %22, align 4
  %24 = add i32 %23, 16
  store i32 %24, i32* %22, align 4
  %25 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %5, align 8
  %26 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %25, i32 0, i32 3
  store i32 0, i32* %26, align 4
  %27 = load i32, i32* %9, align 4
  %28 = add nsw i32 %27, 16
  store i32 %28, i32* %9, align 4
  br label %29

29:                                               ; preds = %15, %10
  %30 = load i8*, i8** %6, align 8
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %31, i8** %6, align 8
  %32 = load i8, i8* %30, align 1
  %33 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %5, align 8
  %34 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %33, i32 0, i32 1
  %35 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %5, align 8
  %36 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %35, i32 0, i32 3
  %37 = load i32, i32* %36, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %36, align 4
  %39 = zext i32 %37 to i64
  %40 = getelementptr inbounds [16 x i8], [16 x i8]* %34, i64 0, i64 %39
  store i8 %32, i8* %40, align 1
  br label %41

41:                                               ; preds = %29
  %42 = load i32, i32* %7, align 4
  %43 = add i32 %42, -1
  store i32 %43, i32* %7, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %10, label %45, !llvm.loop !10

45:                                               ; preds = %41
  %46 = load i32, i32* %9, align 4
  ret i32 %46
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZL16update_one_roundP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %0, i8* noundef %1) #0 {
  %3 = alloca %struct.gm_sm4_context*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.gm_sm4_context* %0, %struct.gm_sm4_context** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %8 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %7, i32 0, i32 5
  %9 = load i32, i32* %8, align 4
  %10 = and i32 %9, 4
  %11 = icmp ugt i32 %10, 0
  %12 = zext i1 %11 to i32
  store i32 %12, i32* %5, align 4
  %13 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %14 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %13, i32 0, i32 5
  %15 = load i32, i32* %14, align 4
  %16 = and i32 %15, 1
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %62

18:                                               ; preds = %2
  %19 = load i32, i32* %5, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %46

21:                                               ; preds = %18
  store i32 0, i32* %6, align 4
  br label %22

22:                                               ; preds = %42, %21
  %23 = load i32, i32* %6, align 4
  %24 = icmp slt i32 %23, 16
  br i1 %24, label %25, label %45

25:                                               ; preds = %22
  %26 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %27 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %26, i32 0, i32 2
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [16 x i8], [16 x i8]* %27, i64 0, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %34 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %33, i32 0, i32 1
  %35 = load i32, i32* %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [16 x i8], [16 x i8]* %34, i64 0, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = xor i32 %39, %32
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %37, align 1
  br label %42

42:                                               ; preds = %25
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %6, align 4
  br label %22, !llvm.loop !11

45:                                               ; preds = %22
  br label %46

46:                                               ; preds = %45, %18
  %47 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %48 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %47, i32 0, i32 0
  %49 = getelementptr inbounds [32 x i32], [32 x i32]* %48, i64 0, i64 0
  %50 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %51 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %50, i32 0, i32 1
  %52 = getelementptr inbounds [16 x i8], [16 x i8]* %51, i64 0, i64 0
  %53 = load i8*, i8** %4, align 8
  call void @_ZL9one_roundPjiPKhPh(i32* noundef %49, i32 noundef 1, i8* noundef %52, i8* noundef %53)
  %54 = load i32, i32* %5, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %61

56:                                               ; preds = %46
  %57 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %58 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %57, i32 0, i32 2
  %59 = getelementptr inbounds [16 x i8], [16 x i8]* %58, i64 0, i64 0
  %60 = load i8*, i8** %4, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %59, i8* align 1 %60, i64 16, i1 false)
  br label %61

61:                                               ; preds = %56, %46
  br label %108

62:                                               ; preds = %2
  %63 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %64 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %63, i32 0, i32 0
  %65 = getelementptr inbounds [32 x i32], [32 x i32]* %64, i64 0, i64 0
  %66 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %67 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %66, i32 0, i32 1
  %68 = getelementptr inbounds [16 x i8], [16 x i8]* %67, i64 0, i64 0
  %69 = load i8*, i8** %4, align 8
  call void @_ZL9one_roundPjiPKhPh(i32* noundef %65, i32 noundef 0, i8* noundef %68, i8* noundef %69)
  %70 = load i32, i32* %5, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %107

72:                                               ; preds = %62
  store i32 0, i32* %6, align 4
  br label %73

73:                                               ; preds = %103, %72
  %74 = load i32, i32* %6, align 4
  %75 = icmp slt i32 %74, 16
  br i1 %75, label %76, label %106

76:                                               ; preds = %73
  %77 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %78 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %77, i32 0, i32 2
  %79 = load i32, i32* %6, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [16 x i8], [16 x i8]* %78, i64 0, i64 %80
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = load i8*, i8** %4, align 8
  %85 = load i32, i32* %6, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %84, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = xor i32 %89, %83
  %91 = trunc i32 %90 to i8
  store i8 %91, i8* %87, align 1
  %92 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %93 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %92, i32 0, i32 1
  %94 = load i32, i32* %6, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [16 x i8], [16 x i8]* %93, i64 0, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %3, align 8
  %99 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %98, i32 0, i32 2
  %100 = load i32, i32* %6, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [16 x i8], [16 x i8]* %99, i64 0, i64 %101
  store i8 %97, i8* %102, align 1
  br label %103

103:                                              ; preds = %76
  %104 = load i32, i32* %6, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %6, align 4
  br label %73, !llvm.loop !12

106:                                              ; preds = %73
  br label %107

107:                                              ; preds = %106, %62
  br label %108

108:                                              ; preds = %107, %61
  ret void
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_ZN11CryptoUtils11gm_sm4_doneEP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %0, i8* noundef %1) #0 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.gm_sm4_context*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.gm_sm4_context* %0, %struct.gm_sm4_context** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  %8 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %9 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %8, i32 0, i32 5
  %10 = load i32, i32* %9, align 4
  %11 = and i32 %10, 1
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %46

13:                                               ; preds = %2
  %14 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %15 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %14, i32 0, i32 5
  %16 = load i32, i32* %15, align 4
  %17 = and i32 %16, 2
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %46

19:                                               ; preds = %13
  %20 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %21 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %20, i32 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = icmp ne i32 %22, 16
  br i1 %23, label %24, label %46

24:                                               ; preds = %19
  %25 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %26 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = sub i32 16, %27
  store i32 %28, i32* %7, align 4
  %29 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %30 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %29, i32 0, i32 1
  %31 = getelementptr inbounds [16 x i8], [16 x i8]* %30, i64 0, i64 0
  %32 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %33 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %32, i32 0, i32 3
  %34 = load i32, i32* %33, align 4
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %31, i64 %35
  %37 = load i32, i32* %7, align 4
  %38 = trunc i32 %37 to i8
  %39 = load i32, i32* %7, align 4
  %40 = sext i32 %39 to i64
  call void @llvm.memset.p0i8.i64(i8* align 1 %36, i8 %38, i64 %40, i1 false)
  %41 = load i32, i32* %7, align 4
  %42 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %43 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %42, i32 0, i32 3
  %44 = load i32, i32* %43, align 4
  %45 = add i32 %44, %41
  store i32 %45, i32* %43, align 4
  br label %46

46:                                               ; preds = %24, %19, %13, %2
  %47 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %48 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %47, i32 0, i32 3
  %49 = load i32, i32* %48, align 4
  %50 = icmp ne i32 %49, 16
  br i1 %50, label %51, label %52

51:                                               ; preds = %46
  store i32 -1, i32* %3, align 4
  br label %125

52:                                               ; preds = %46
  %53 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %54 = load i8*, i8** %5, align 8
  call void @_ZL16update_one_roundP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %53, i8* noundef %54)
  %55 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %56 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %55, i32 0, i32 4
  %57 = load i32, i32* %56, align 4
  %58 = add i32 %57, 16
  store i32 %58, i32* %56, align 4
  %59 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %60 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %59, i32 0, i32 3
  store i32 0, i32* %60, align 4
  store i32 16, i32* %6, align 4
  %61 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %62 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %61, i32 0, i32 5
  %63 = load i32, i32* %62, align 4
  %64 = and i32 %63, 1
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %96

66:                                               ; preds = %52
  %67 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %68 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %67, i32 0, i32 5
  %69 = load i32, i32* %68, align 4
  %70 = and i32 %69, 2
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %95

72:                                               ; preds = %66
  %73 = load i32, i32* %7, align 4
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %94

75:                                               ; preds = %72
  %76 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %77 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %76, i32 0, i32 1
  %78 = getelementptr inbounds [16 x i8], [16 x i8]* %77, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 4 %78, i8 16, i64 16, i1 false)
  %79 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %80 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %79, i32 0, i32 3
  store i32 16, i32* %80, align 4
  %81 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %82 = load i8*, i8** %5, align 8
  %83 = load i32, i32* %6, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8* %82, i64 %84
  call void @_ZL16update_one_roundP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %81, i8* noundef %85)
  %86 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %87 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %86, i32 0, i32 4
  %88 = load i32, i32* %87, align 4
  %89 = add i32 %88, 16
  store i32 %89, i32* %87, align 4
  %90 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %91 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %90, i32 0, i32 3
  store i32 0, i32* %91, align 4
  %92 = load i32, i32* %6, align 4
  %93 = add nsw i32 %92, 16
  store i32 %93, i32* %6, align 4
  br label %94

94:                                               ; preds = %75, %72
  br label %95

95:                                               ; preds = %94, %66
  br label %123

96:                                               ; preds = %52
  %97 = load %struct.gm_sm4_context*, %struct.gm_sm4_context** %4, align 8
  %98 = getelementptr inbounds %struct.gm_sm4_context, %struct.gm_sm4_context* %97, i32 0, i32 5
  %99 = load i32, i32* %98, align 4
  %100 = and i32 %99, 2
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %122

102:                                              ; preds = %96
  %103 = load i8*, i8** %5, align 8
  %104 = getelementptr inbounds i8, i8* %103, i64 15
  %105 = load i8, i8* %104, align 1
  %106 = zext i8 %105 to i32
  %107 = icmp sgt i32 %106, 16
  br i1 %107, label %114, label %108

108:                                              ; preds = %102
  %109 = load i8*, i8** %5, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 15
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp sle i32 %112, 0
  br i1 %113, label %114, label %115

114:                                              ; preds = %108, %102
  store i32 -1, i32* %3, align 4
  br label %125

115:                                              ; preds = %108
  %116 = load i8*, i8** %5, align 8
  %117 = getelementptr inbounds i8, i8* %116, i64 15
  %118 = load i8, i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = load i32, i32* %6, align 4
  %121 = sub nsw i32 %120, %119
  store i32 %121, i32* %6, align 4
  br label %122

122:                                              ; preds = %115, %96
  br label %123

123:                                              ; preds = %122, %95
  %124 = load i32, i32* %6, align 4
  store i32 %124, i32* %3, align 4
  br label %125

125:                                              ; preds = %123, %114, %51
  %126 = load i32, i32* %3, align 4
  ret i32 %126
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_ZN11CryptoUtils15Enc_sm4_ecb_cbcEiiPhi(i32 noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3) #0 align 2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.gm_sm4_context, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %14

14:                                               ; preds = %60, %4
  %15 = load i32, i32* %10, align 4
  %16 = icmp slt i32 %15, 1
  br i1 %16, label %17, label %63

17:                                               ; preds = %14
  %18 = load i32, i32* %7, align 4
  %19 = load i32, i32* %6, align 4
  %20 = icmp ne i32 %19, 0
  %21 = zext i1 %20 to i64
  %22 = select i1 %20, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @key, i64 0, i64 0), i8* null
  call void @_ZN11CryptoUtils11gm_sm4_initEP14gm_sm4_contextPKhiiS3_(%struct.gm_sm4_context* noundef %11, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @key, i64 0, i64 0), i32 noundef 1, i32 noundef %18, i8* noundef %22)
  %23 = load i32, i32* %9, align 4
  %24 = icmp sgt i32 %23, 32
  br i1 %24, label %25, label %41

25:                                               ; preds = %17
  %26 = load i32, i32* %9, align 4
  %27 = sub nsw i32 %26, 32
  store i32 %27, i32* %12, align 4
  %28 = load i8*, i8** %8, align 8
  %29 = load i8*, i8** %8, align 8
  %30 = call noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %11, i8* noundef %28, i32 noundef 32, i8* noundef %29)
  store i32 %30, i32* %9, align 4
  %31 = load i8*, i8** %8, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 32
  %33 = load i32, i32* %12, align 4
  %34 = load i8*, i8** %8, align 8
  %35 = load i32, i32* %9, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %34, i64 %36
  %38 = call noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %11, i8* noundef %32, i32 noundef %33, i8* noundef %37)
  %39 = load i32, i32* %9, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, i32* %9, align 4
  br label %46

41:                                               ; preds = %17
  %42 = load i8*, i8** %8, align 8
  %43 = load i32, i32* %9, align 4
  %44 = load i8*, i8** %8, align 8
  %45 = call noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %11, i8* noundef %42, i32 noundef %43, i8* noundef %44)
  store i32 %45, i32* %9, align 4
  br label %46

46:                                               ; preds = %41, %25
  %47 = load i8*, i8** %8, align 8
  %48 = load i32, i32* %9, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %47, i64 %49
  %51 = call noundef i32 @_ZN11CryptoUtils11gm_sm4_doneEP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %11, i8* noundef %50)
  store i32 %51, i32* %13, align 4
  %52 = load i32, i32* %13, align 4
  %53 = icmp eq i32 %52, -1
  br i1 %53, label %54, label %56

54:                                               ; preds = %46
  %55 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0))
  store i32 -1, i32* %5, align 4
  br label %65

56:                                               ; preds = %46
  %57 = load i32, i32* %13, align 4
  %58 = load i32, i32* %9, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, i32* %9, align 4
  br label %60

60:                                               ; preds = %56
  %61 = load i32, i32* %10, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %10, align 4
  br label %14, !llvm.loop !13

63:                                               ; preds = %14
  %64 = load i32, i32* %9, align 4
  store i32 %64, i32* %5, align 4
  br label %65

65:                                               ; preds = %63, %54
  %66 = load i32, i32* %5, align 4
  ret i32 %66
}

declare i32 @printf(i8* noundef, ...) #5

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @Dec_sm4_ecb_cbc(i32 noundef %0, i32 noundef %1, i8* noundef %2, i8* noundef %3, i32 noundef %4, i8* noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca %struct.gm_sm4_context, align 4
  %15 = alloca %class.CryptoUtils, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store i8* %2, i8** %9, align 8
  store i8* %3, i8** %10, align 8
  store i32 %4, i32* %11, align 4
  store i8* %5, i8** %12, align 8
  %18 = load i8*, i8** %12, align 8
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %23

22:                                               ; preds = %6
  br label %92

23:                                               ; preds = %6
  call void @_ZN11CryptoUtilsC2Ev(%class.CryptoUtils* noundef nonnull align 8 dereferenceable(2504) %15)
  store i32 0, i32* %13, align 4
  br label %24

24:                                               ; preds = %70, %23
  %25 = load i32, i32* %13, align 4
  %26 = icmp slt i32 %25, 1
  br i1 %26, label %27, label %73

27:                                               ; preds = %24
  %28 = load i32, i32* %8, align 4
  %29 = load i32, i32* %7, align 4
  %30 = icmp ne i32 %29, 0
  %31 = zext i1 %30 to i64
  %32 = select i1 %30, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @key, i64 0, i64 0), i8* null
  call void @_ZN11CryptoUtils11gm_sm4_initEP14gm_sm4_contextPKhiiS3_(%struct.gm_sm4_context* noundef %14, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @key, i64 0, i64 0), i32 noundef 0, i32 noundef %28, i8* noundef %32)
  %33 = load i32, i32* %11, align 4
  %34 = icmp sgt i32 %33, 32
  br i1 %34, label %35, label %51

35:                                               ; preds = %27
  %36 = load i32, i32* %11, align 4
  %37 = sub nsw i32 %36, 32
  store i32 %37, i32* %16, align 4
  %38 = load i8*, i8** %10, align 8
  %39 = load i8*, i8** %10, align 8
  %40 = call noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %14, i8* noundef %38, i32 noundef 32, i8* noundef %39)
  store i32 %40, i32* %11, align 4
  %41 = load i8*, i8** %10, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 32
  %43 = load i32, i32* %16, align 4
  %44 = load i8*, i8** %10, align 8
  %45 = load i32, i32* %11, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  %48 = call noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %14, i8* noundef %42, i32 noundef %43, i8* noundef %47)
  %49 = load i32, i32* %11, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, i32* %11, align 4
  br label %56

51:                                               ; preds = %27
  %52 = load i8*, i8** %10, align 8
  %53 = load i32, i32* %11, align 4
  %54 = load i8*, i8** %10, align 8
  %55 = call noundef i32 @_ZN11CryptoUtils13gm_sm4_updateEP14gm_sm4_contextPKhjPh(%struct.gm_sm4_context* noundef %14, i8* noundef %52, i32 noundef %53, i8* noundef %54)
  store i32 %55, i32* %11, align 4
  br label %56

56:                                               ; preds = %51, %35
  %57 = load i8*, i8** %10, align 8
  %58 = load i32, i32* %11, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %57, i64 %59
  %61 = call noundef i32 @_ZN11CryptoUtils11gm_sm4_doneEP14gm_sm4_contextPh(%struct.gm_sm4_context* noundef %14, i8* noundef %60)
  store i32 %61, i32* %17, align 4
  %62 = load i32, i32* %17, align 4
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %66

64:                                               ; preds = %56
  %65 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0))
  br label %92

66:                                               ; preds = %56
  %67 = load i32, i32* %17, align 4
  %68 = load i32, i32* %11, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, i32* %11, align 4
  br label %70

70:                                               ; preds = %66
  %71 = load i32, i32* %13, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %13, align 4
  br label %24, !llvm.loop !14

73:                                               ; preds = %24
  store i32 0, i32* %13, align 4
  br label %74

74:                                               ; preds = %88, %73
  %75 = load i32, i32* %13, align 4
  %76 = load i32, i32* %11, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %91

78:                                               ; preds = %74
  %79 = load i8*, i8** %10, align 8
  %80 = load i32, i32* %13, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8* %79, i64 %81
  %83 = load i8, i8* %82, align 1
  %84 = load i8*, i8** %9, align 8
  %85 = load i32, i32* %13, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %84, i64 %86
  store i8 %83, i8* %87, align 1
  br label %88

88:                                               ; preds = %78
  %89 = load i32, i32* %13, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %13, align 4
  br label %74, !llvm.loop !15

91:                                               ; preds = %74
  br label %92

92:                                               ; preds = %91, %64, %22
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN11CryptoUtilsC2Ev(%class.CryptoUtils* noundef nonnull align 8 dereferenceable(2504) %0) unnamed_addr #1 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %class.CryptoUtils*, align 8
  %3 = alloca %"class.std::random_device", align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store %class.CryptoUtils* %0, %class.CryptoUtils** %2, align 8
  %6 = load %class.CryptoUtils*, %class.CryptoUtils** %2, align 8
  %7 = getelementptr inbounds %class.CryptoUtils, %class.CryptoUtils* %6, i32 0, i32 0
  call void @_ZNSt13random_deviceC2Ev(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %3)
  %8 = invoke noundef i32 @_ZNSt13random_deviceclEv(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %3)
          to label %9 unwind label %12

9:                                                ; preds = %1
  %10 = zext i32 %8 to i64
  invoke void @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEC2Em(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %7, i64 noundef %10)
          to label %11 unwind label %12

11:                                               ; preds = %9
  call void @_ZNSt13random_deviceD2Ev(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %3) #9
  ret void

12:                                               ; preds = %9, %1
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  store i8* %14, i8** %4, align 8
  %15 = extractvalue { i8*, i32 } %13, 1
  store i32 %15, i32* %5, align 4
  call void @_ZNSt13random_deviceD2Ev(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %3) #9
  br label %16

16:                                               ; preds = %12
  %17 = load i8*, i8** %4, align 8
  %18 = load i32, i32* %5, align 4
  %19 = insertvalue { i8*, i32 } undef, i8* %17, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %18, 1
  resume { i8*, i32 } %20
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @genRandomString(i8* noundef %0, i32 noundef %1) #2 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca [63 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = bitcast [63 x i8]* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 getelementptr inbounds ([63 x i8], [63 x i8]* @__const.genRandomString.charset, i32 0, i32 0), i64 63, i1 false)
  store i32 62, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %9

9:                                                ; preds = %23, %2
  %10 = load i32, i32* %7, align 4
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  %14 = call i32 @rand() #9
  %15 = srem i32 %14, 62
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [63 x i8], [63 x i8]* %5, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = load i8*, i8** %3, align 8
  %20 = load i32, i32* %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %19, i64 %21
  store i8 %18, i8* %22, align 1
  br label %23

23:                                               ; preds = %13
  %24 = load i32, i32* %7, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %7, align 4
  br label %9, !llvm.loop !16

26:                                               ; preds = %9
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #6

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @assignLow8BitsToInt8(i8* noundef %0, i8* noundef %1, i64 noundef %2, i8 noundef zeroext %3, i8* noundef %4) #2 {
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8 %3, i8* %9, align 1
  store i8* %4, i8** %10, align 8
  %13 = load i8*, i8** %10, align 8
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %5
  %18 = load i8*, i8** %10, align 8
  store i8 5, i8* %18, align 1
  br label %19

19:                                               ; preds = %17, %5
  %20 = load i8*, i8** %10, align 8
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %29, label %24

24:                                               ; preds = %19
  %25 = load i8*, i8** %10, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %29, label %30

29:                                               ; preds = %24, %19
  br label %68

30:                                               ; preds = %24
  %31 = load i8, i8* %9, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %51

34:                                               ; preds = %30
  store i64 0, i64* %11, align 8
  br label %35

35:                                               ; preds = %47, %34
  %36 = load i64, i64* %11, align 8
  %37 = load i64, i64* %8, align 8
  %38 = icmp ult i64 %36, %37
  br i1 %38, label %39, label %50

39:                                               ; preds = %35
  %40 = load i8*, i8** %7, align 8
  %41 = load i64, i64* %11, align 8
  %42 = getelementptr inbounds i8, i8* %40, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = load i8*, i8** %6, align 8
  %45 = load i64, i64* %11, align 8
  %46 = getelementptr inbounds i8, i8* %44, i64 %45
  store i8 %43, i8* %46, align 1
  br label %47

47:                                               ; preds = %39
  %48 = load i64, i64* %11, align 8
  %49 = add i64 %48, 1
  store i64 %49, i64* %11, align 8
  br label %35, !llvm.loop !17

50:                                               ; preds = %35
  br label %68

51:                                               ; preds = %30
  store i64 0, i64* %12, align 8
  br label %52

52:                                               ; preds = %64, %51
  %53 = load i64, i64* %12, align 8
  %54 = load i64, i64* %8, align 8
  %55 = icmp ult i64 %53, %54
  br i1 %55, label %56, label %67

56:                                               ; preds = %52
  %57 = load i8*, i8** %6, align 8
  %58 = load i64, i64* %12, align 8
  %59 = getelementptr inbounds i8, i8* %57, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = load i8*, i8** %7, align 8
  %62 = load i64, i64* %12, align 8
  %63 = getelementptr inbounds i8, i8* %61, i64 %62
  store i8 %60, i8* %63, align 1
  br label %64

64:                                               ; preds = %56
  %65 = load i64, i64* %12, align 8
  %66 = add i64 %65, 1
  store i64 %66, i64* %12, align 8
  br label %52, !llvm.loop !18

67:                                               ; preds = %52
  br label %68

68:                                               ; preds = %29, %67, %50
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @assignLow8BitsToInt16(i16* noundef %0, i8* noundef %1, i64 noundef %2, i8 noundef zeroext %3, i8* noundef %4) #2 {
  %6 = alloca i16*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i16* %0, i16** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8 %3, i8* %9, align 1
  store i8* %4, i8** %10, align 8
  %13 = load i8*, i8** %10, align 8
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %5
  %18 = load i8*, i8** %10, align 8
  store i8 5, i8* %18, align 1
  br label %19

19:                                               ; preds = %17, %5
  %20 = load i8*, i8** %10, align 8
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %29, label %24

24:                                               ; preds = %19
  %25 = load i8*, i8** %10, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %29, label %30

29:                                               ; preds = %24, %19
  br label %70

30:                                               ; preds = %24
  %31 = load i8, i8* %9, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %52

34:                                               ; preds = %30
  store i64 0, i64* %11, align 8
  br label %35

35:                                               ; preds = %48, %34
  %36 = load i64, i64* %11, align 8
  %37 = load i64, i64* %8, align 8
  %38 = icmp ult i64 %36, %37
  br i1 %38, label %39, label %51

39:                                               ; preds = %35
  %40 = load i8*, i8** %7, align 8
  %41 = load i64, i64* %11, align 8
  %42 = getelementptr inbounds i8, i8* %40, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i16
  %45 = load i16*, i16** %6, align 8
  %46 = load i64, i64* %11, align 8
  %47 = getelementptr inbounds i16, i16* %45, i64 %46
  store i16 %44, i16* %47, align 2
  br label %48

48:                                               ; preds = %39
  %49 = load i64, i64* %11, align 8
  %50 = add i64 %49, 1
  store i64 %50, i64* %11, align 8
  br label %35, !llvm.loop !19

51:                                               ; preds = %35
  br label %70

52:                                               ; preds = %30
  store i64 0, i64* %12, align 8
  br label %53

53:                                               ; preds = %66, %52
  %54 = load i64, i64* %12, align 8
  %55 = load i64, i64* %8, align 8
  %56 = icmp ult i64 %54, %55
  br i1 %56, label %57, label %69

57:                                               ; preds = %53
  %58 = load i16*, i16** %6, align 8
  %59 = load i64, i64* %12, align 8
  %60 = getelementptr inbounds i16, i16* %58, i64 %59
  %61 = load i16, i16* %60, align 2
  %62 = trunc i16 %61 to i8
  %63 = load i8*, i8** %7, align 8
  %64 = load i64, i64* %12, align 8
  %65 = getelementptr inbounds i8, i8* %63, i64 %64
  store i8 %62, i8* %65, align 1
  br label %66

66:                                               ; preds = %57
  %67 = load i64, i64* %12, align 8
  %68 = add i64 %67, 1
  store i64 %68, i64* %12, align 8
  br label %53, !llvm.loop !20

69:                                               ; preds = %53
  br label %70

70:                                               ; preds = %29, %69, %51
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @assignLow8BitsToInt32(i32* noundef %0, i8* noundef %1, i64 noundef %2, i8 noundef zeroext %3, i8* noundef %4) #2 {
  %6 = alloca i32*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i32* %0, i32** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8 %3, i8* %9, align 1
  store i8* %4, i8** %10, align 8
  %13 = load i8*, i8** %10, align 8
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %5
  %18 = load i8*, i8** %10, align 8
  store i8 5, i8* %18, align 1
  br label %19

19:                                               ; preds = %17, %5
  %20 = load i8*, i8** %10, align 8
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %29, label %24

24:                                               ; preds = %19
  %25 = load i8*, i8** %10, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %29, label %30

29:                                               ; preds = %24, %19
  br label %70

30:                                               ; preds = %24
  %31 = load i8, i8* %9, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %52

34:                                               ; preds = %30
  store i64 0, i64* %11, align 8
  br label %35

35:                                               ; preds = %48, %34
  %36 = load i64, i64* %11, align 8
  %37 = load i64, i64* %8, align 8
  %38 = icmp ult i64 %36, %37
  br i1 %38, label %39, label %51

39:                                               ; preds = %35
  %40 = load i8*, i8** %7, align 8
  %41 = load i64, i64* %11, align 8
  %42 = getelementptr inbounds i8, i8* %40, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = load i32*, i32** %6, align 8
  %46 = load i64, i64* %11, align 8
  %47 = getelementptr inbounds i32, i32* %45, i64 %46
  store i32 %44, i32* %47, align 4
  br label %48

48:                                               ; preds = %39
  %49 = load i64, i64* %11, align 8
  %50 = add i64 %49, 1
  store i64 %50, i64* %11, align 8
  br label %35, !llvm.loop !21

51:                                               ; preds = %35
  br label %70

52:                                               ; preds = %30
  store i64 0, i64* %12, align 8
  br label %53

53:                                               ; preds = %66, %52
  %54 = load i64, i64* %12, align 8
  %55 = load i64, i64* %8, align 8
  %56 = icmp ult i64 %54, %55
  br i1 %56, label %57, label %69

57:                                               ; preds = %53
  %58 = load i32*, i32** %6, align 8
  %59 = load i64, i64* %12, align 8
  %60 = getelementptr inbounds i32, i32* %58, i64 %59
  %61 = load i32, i32* %60, align 4
  %62 = trunc i32 %61 to i8
  %63 = load i8*, i8** %7, align 8
  %64 = load i64, i64* %12, align 8
  %65 = getelementptr inbounds i8, i8* %63, i64 %64
  store i8 %62, i8* %65, align 1
  br label %66

66:                                               ; preds = %57
  %67 = load i64, i64* %12, align 8
  %68 = add i64 %67, 1
  store i64 %68, i64* %12, align 8
  br label %53, !llvm.loop !22

69:                                               ; preds = %53
  br label %70

70:                                               ; preds = %29, %69, %51
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @assignLow8BitsToInt64(i64* noundef %0, i8* noundef %1, i64 noundef %2, i8 noundef zeroext %3, i8* noundef %4) #2 {
  %6 = alloca i64*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i64* %0, i64** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8 %3, i8* %9, align 1
  store i8* %4, i8** %10, align 8
  %13 = load i8*, i8** %10, align 8
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %5
  %18 = load i8*, i8** %10, align 8
  store i8 5, i8* %18, align 1
  br label %19

19:                                               ; preds = %17, %5
  %20 = load i8*, i8** %10, align 8
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %29, label %24

24:                                               ; preds = %19
  %25 = load i8*, i8** %10, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %29, label %30

29:                                               ; preds = %24, %19
  br label %70

30:                                               ; preds = %24
  %31 = load i8, i8* %9, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %52

34:                                               ; preds = %30
  store i64 0, i64* %11, align 8
  br label %35

35:                                               ; preds = %48, %34
  %36 = load i64, i64* %11, align 8
  %37 = load i64, i64* %8, align 8
  %38 = icmp ult i64 %36, %37
  br i1 %38, label %39, label %51

39:                                               ; preds = %35
  %40 = load i8*, i8** %7, align 8
  %41 = load i64, i64* %11, align 8
  %42 = getelementptr inbounds i8, i8* %40, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i64
  %45 = load i64*, i64** %6, align 8
  %46 = load i64, i64* %11, align 8
  %47 = getelementptr inbounds i64, i64* %45, i64 %46
  store i64 %44, i64* %47, align 8
  br label %48

48:                                               ; preds = %39
  %49 = load i64, i64* %11, align 8
  %50 = add i64 %49, 1
  store i64 %50, i64* %11, align 8
  br label %35, !llvm.loop !23

51:                                               ; preds = %35
  br label %70

52:                                               ; preds = %30
  store i64 0, i64* %12, align 8
  br label %53

53:                                               ; preds = %66, %52
  %54 = load i64, i64* %12, align 8
  %55 = load i64, i64* %8, align 8
  %56 = icmp ult i64 %54, %55
  br i1 %56, label %57, label %69

57:                                               ; preds = %53
  %58 = load i64*, i64** %6, align 8
  %59 = load i64, i64* %12, align 8
  %60 = getelementptr inbounds i64, i64* %58, i64 %59
  %61 = load i64, i64* %60, align 8
  %62 = trunc i64 %61 to i8
  %63 = load i8*, i8** %7, align 8
  %64 = load i64, i64* %12, align 8
  %65 = getelementptr inbounds i8, i8* %63, i64 %64
  store i8 %62, i8* %65, align 1
  br label %66

66:                                               ; preds = %57
  %67 = load i64, i64* %12, align 8
  %68 = add i64 %67, 1
  store i64 %68, i64* %12, align 8
  br label %53, !llvm.loop !24

69:                                               ; preds = %53
  br label %70

70:                                               ; preds = %29, %69, %51
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZL9one_roundPjiPKhPh(i32* noundef %0, i32 noundef %1, i8* noundef %2, i8* noundef %3) #2 {
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca [36 x i32], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  store i8* %3, i8** %8, align 8
  %14 = load i8*, i8** %7, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 0
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = shl i32 %17, 24
  %19 = load i8*, i8** %7, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 1
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = shl i32 %22, 16
  %24 = or i32 %18, %23
  %25 = load i8*, i8** %7, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 2
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = shl i32 %28, 8
  %30 = or i32 %24, %29
  %31 = load i8*, i8** %7, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = or i32 %30, %34
  %36 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 0
  store i32 %35, i32* %36, align 16
  %37 = load i8*, i8** %7, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 4
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = shl i32 %40, 24
  %42 = load i8*, i8** %7, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 5
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl i32 %45, 16
  %47 = or i32 %41, %46
  %48 = load i8*, i8** %7, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 6
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = shl i32 %51, 8
  %53 = or i32 %47, %52
  %54 = load i8*, i8** %7, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 7
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = or i32 %53, %57
  %59 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 1
  store i32 %58, i32* %59, align 4
  %60 = load i8*, i8** %7, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 8
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = shl i32 %63, 24
  %65 = load i8*, i8** %7, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 9
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = shl i32 %68, 16
  %70 = or i32 %64, %69
  %71 = load i8*, i8** %7, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 10
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = shl i32 %74, 8
  %76 = or i32 %70, %75
  %77 = load i8*, i8** %7, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 11
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = or i32 %76, %80
  %82 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 2
  store i32 %81, i32* %82, align 8
  %83 = load i8*, i8** %7, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 12
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = shl i32 %86, 24
  %88 = load i8*, i8** %7, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 13
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = shl i32 %91, 16
  %93 = or i32 %87, %92
  %94 = load i8*, i8** %7, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 14
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = shl i32 %97, 8
  %99 = or i32 %93, %98
  %100 = load i8*, i8** %7, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 15
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = or i32 %99, %103
  %105 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 3
  store i32 %104, i32* %105, align 4
  store i32 0, i32* %12, align 4
  br label %106

106:                                              ; preds = %216, %4
  %107 = load i32, i32* %12, align 4
  %108 = icmp slt i32 %107, 32
  br i1 %108, label %109, label %219

109:                                              ; preds = %106
  %110 = load i32, i32* %12, align 4
  %111 = add nsw i32 %110, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 %112
  %114 = load i32, i32* %113, align 4
  %115 = load i32, i32* %12, align 4
  %116 = add nsw i32 %115, 2
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 %117
  %119 = load i32, i32* %118, align 4
  %120 = xor i32 %114, %119
  %121 = load i32, i32* %12, align 4
  %122 = add nsw i32 %121, 3
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 %123
  %125 = load i32, i32* %124, align 4
  %126 = xor i32 %120, %125
  %127 = load i32*, i32** %5, align 8
  %128 = load i32, i32* %6, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %132

130:                                              ; preds = %109
  %131 = load i32, i32* %12, align 4
  br label %135

132:                                              ; preds = %109
  %133 = load i32, i32* %12, align 4
  %134 = sub nsw i32 31, %133
  br label %135

135:                                              ; preds = %132, %130
  %136 = phi i32 [ %131, %130 ], [ %134, %132 ]
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32* %127, i64 %137
  %139 = load i32, i32* %138, align 4
  %140 = xor i32 %126, %139
  store i32 %140, i32* %10, align 4
  %141 = load i32, i32* %10, align 4
  %142 = lshr i32 %141, 24
  %143 = and i32 %142, 255
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %144
  %146 = load i8, i8* %145, align 1
  %147 = zext i8 %146 to i32
  %148 = shl i32 %147, 24
  store i32 %148, i32* %11, align 4
  %149 = load i32, i32* %10, align 4
  %150 = lshr i32 %149, 16
  %151 = and i32 %150, 255
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %152
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = shl i32 %155, 16
  %157 = load i32, i32* %11, align 4
  %158 = or i32 %157, %156
  store i32 %158, i32* %11, align 4
  %159 = load i32, i32* %10, align 4
  %160 = lshr i32 %159, 8
  %161 = and i32 %160, 255
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = shl i32 %165, 8
  %167 = load i32, i32* %11, align 4
  %168 = or i32 %167, %166
  store i32 %168, i32* %11, align 4
  %169 = load i32, i32* %10, align 4
  %170 = and i32 %169, 255
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds [256 x i8], [256 x i8]* @GM_SM4_SBOX, i64 0, i64 %171
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = load i32, i32* %11, align 4
  %176 = or i32 %175, %174
  store i32 %176, i32* %11, align 4
  %177 = load i32, i32* %11, align 4
  %178 = load i32, i32* %11, align 4
  %179 = and i32 %178, -1
  %180 = shl i32 %179, 2
  %181 = load i32, i32* %11, align 4
  %182 = lshr i32 %181, 30
  %183 = or i32 %180, %182
  %184 = xor i32 %177, %183
  %185 = load i32, i32* %11, align 4
  %186 = and i32 %185, -1
  %187 = shl i32 %186, 10
  %188 = load i32, i32* %11, align 4
  %189 = lshr i32 %188, 22
  %190 = or i32 %187, %189
  %191 = xor i32 %184, %190
  %192 = load i32, i32* %11, align 4
  %193 = and i32 %192, -1
  %194 = shl i32 %193, 18
  %195 = load i32, i32* %11, align 4
  %196 = lshr i32 %195, 14
  %197 = or i32 %194, %196
  %198 = xor i32 %191, %197
  %199 = load i32, i32* %11, align 4
  %200 = and i32 %199, -1
  %201 = shl i32 %200, 24
  %202 = load i32, i32* %11, align 4
  %203 = lshr i32 %202, 8
  %204 = or i32 %201, %203
  %205 = xor i32 %198, %204
  store i32 %205, i32* %13, align 4
  %206 = load i32, i32* %12, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 %207
  %209 = load i32, i32* %208, align 4
  %210 = load i32, i32* %13, align 4
  %211 = xor i32 %209, %210
  %212 = load i32, i32* %12, align 4
  %213 = add nsw i32 %212, 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 %214
  store i32 %211, i32* %215, align 4
  br label %216

216:                                              ; preds = %135
  %217 = load i32, i32* %12, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %12, align 4
  br label %106, !llvm.loop !25

219:                                              ; preds = %106
  %220 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 35
  %221 = load i32, i32* %220, align 4
  %222 = lshr i32 %221, 24
  %223 = trunc i32 %222 to i8
  %224 = load i8*, i8** %8, align 8
  %225 = getelementptr inbounds i8, i8* %224, i64 0
  store i8 %223, i8* %225, align 1
  %226 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 35
  %227 = load i32, i32* %226, align 4
  %228 = lshr i32 %227, 16
  %229 = trunc i32 %228 to i8
  %230 = load i8*, i8** %8, align 8
  %231 = getelementptr inbounds i8, i8* %230, i64 1
  store i8 %229, i8* %231, align 1
  %232 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 35
  %233 = load i32, i32* %232, align 4
  %234 = lshr i32 %233, 8
  %235 = trunc i32 %234 to i8
  %236 = load i8*, i8** %8, align 8
  %237 = getelementptr inbounds i8, i8* %236, i64 2
  store i8 %235, i8* %237, align 1
  %238 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 35
  %239 = load i32, i32* %238, align 4
  %240 = trunc i32 %239 to i8
  %241 = load i8*, i8** %8, align 8
  %242 = getelementptr inbounds i8, i8* %241, i64 3
  store i8 %240, i8* %242, align 1
  %243 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 34
  %244 = load i32, i32* %243, align 8
  %245 = lshr i32 %244, 24
  %246 = trunc i32 %245 to i8
  %247 = load i8*, i8** %8, align 8
  %248 = getelementptr inbounds i8, i8* %247, i64 4
  store i8 %246, i8* %248, align 1
  %249 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 34
  %250 = load i32, i32* %249, align 8
  %251 = lshr i32 %250, 16
  %252 = trunc i32 %251 to i8
  %253 = load i8*, i8** %8, align 8
  %254 = getelementptr inbounds i8, i8* %253, i64 5
  store i8 %252, i8* %254, align 1
  %255 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 34
  %256 = load i32, i32* %255, align 8
  %257 = lshr i32 %256, 8
  %258 = trunc i32 %257 to i8
  %259 = load i8*, i8** %8, align 8
  %260 = getelementptr inbounds i8, i8* %259, i64 6
  store i8 %258, i8* %260, align 1
  %261 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 34
  %262 = load i32, i32* %261, align 8
  %263 = trunc i32 %262 to i8
  %264 = load i8*, i8** %8, align 8
  %265 = getelementptr inbounds i8, i8* %264, i64 7
  store i8 %263, i8* %265, align 1
  %266 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 33
  %267 = load i32, i32* %266, align 4
  %268 = lshr i32 %267, 24
  %269 = trunc i32 %268 to i8
  %270 = load i8*, i8** %8, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 8
  store i8 %269, i8* %271, align 1
  %272 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 33
  %273 = load i32, i32* %272, align 4
  %274 = lshr i32 %273, 16
  %275 = trunc i32 %274 to i8
  %276 = load i8*, i8** %8, align 8
  %277 = getelementptr inbounds i8, i8* %276, i64 9
  store i8 %275, i8* %277, align 1
  %278 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 33
  %279 = load i32, i32* %278, align 4
  %280 = lshr i32 %279, 8
  %281 = trunc i32 %280 to i8
  %282 = load i8*, i8** %8, align 8
  %283 = getelementptr inbounds i8, i8* %282, i64 10
  store i8 %281, i8* %283, align 1
  %284 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 33
  %285 = load i32, i32* %284, align 4
  %286 = trunc i32 %285 to i8
  %287 = load i8*, i8** %8, align 8
  %288 = getelementptr inbounds i8, i8* %287, i64 11
  store i8 %286, i8* %288, align 1
  %289 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 32
  %290 = load i32, i32* %289, align 16
  %291 = lshr i32 %290, 24
  %292 = trunc i32 %291 to i8
  %293 = load i8*, i8** %8, align 8
  %294 = getelementptr inbounds i8, i8* %293, i64 12
  store i8 %292, i8* %294, align 1
  %295 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 32
  %296 = load i32, i32* %295, align 16
  %297 = lshr i32 %296, 16
  %298 = trunc i32 %297 to i8
  %299 = load i8*, i8** %8, align 8
  %300 = getelementptr inbounds i8, i8* %299, i64 13
  store i8 %298, i8* %300, align 1
  %301 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 32
  %302 = load i32, i32* %301, align 16
  %303 = lshr i32 %302, 8
  %304 = trunc i32 %303 to i8
  %305 = load i8*, i8** %8, align 8
  %306 = getelementptr inbounds i8, i8* %305, i64 14
  store i8 %304, i8* %306, align 1
  %307 = getelementptr inbounds [36 x i32], [36 x i32]* %9, i64 0, i64 32
  %308 = load i32, i32* %307, align 16
  %309 = trunc i32 %308 to i8
  %310 = load i8*, i8** %8, align 8
  %311 = getelementptr inbounds i8, i8* %310, i64 15
  store i8 %309, i8* %311, align 1
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt13random_deviceC2Ev(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %0) unnamed_addr #1 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::random_device"*, align 8
  %3 = alloca %"class.std::__cxx11::basic_string", align 8
  %4 = alloca %"class.std::allocator", align 1
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %"class.std::random_device"* %0, %"class.std::random_device"** %2, align 8
  %7 = load %"class.std::random_device"*, %"class.std::random_device"** %2, align 8
  call void @_ZNSaIcEC1Ev(%"class.std::allocator"* noundef nonnull align 1 dereferenceable(1) %4) #9
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), %"class.std::allocator"* noundef nonnull align 1 dereferenceable(1) %4)
          to label %8 unwind label %10

8:                                                ; preds = %1
  invoke void @_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %7, %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3)
          to label %9 unwind label %14

9:                                                ; preds = %8
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3) #9
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* noundef nonnull align 1 dereferenceable(1) %4) #9
  ret void

10:                                               ; preds = %1
  %11 = landingpad { i8*, i32 }
          cleanup
  %12 = extractvalue { i8*, i32 } %11, 0
  store i8* %12, i8** %5, align 8
  %13 = extractvalue { i8*, i32 } %11, 1
  store i32 %13, i32* %6, align 4
  br label %18

14:                                               ; preds = %8
  %15 = landingpad { i8*, i32 }
          cleanup
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %5, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %6, align 4
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32) %3) #9
  br label %18

18:                                               ; preds = %14, %10
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* noundef nonnull align 1 dereferenceable(1) %4) #9
  br label %19

19:                                               ; preds = %18
  %20 = load i8*, i8** %5, align 8
  %21 = load i32, i32* %6, align 4
  %22 = insertvalue { i8*, i32 } undef, i8* %20, 0
  %23 = insertvalue { i8*, i32 } %22, i32 %21, 1
  resume { i8*, i32 } %23
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt13random_deviceclEv(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %0) #0 comdat align 2 {
  %2 = alloca %"class.std::random_device"*, align 8
  store %"class.std::random_device"* %0, %"class.std::random_device"** %2, align 8
  %3 = load %"class.std::random_device"*, %"class.std::random_device"** %2, align 8
  %4 = call noundef i32 @_ZNSt13random_device9_M_getvalEv(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %3)
  ret i32 %4
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEC2Em(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %0, i64 noundef %1) unnamed_addr #1 comdat align 2 {
  %3 = alloca %"class.std::mersenne_twister_engine"*, align 8
  %4 = alloca i64, align 8
  store %"class.std::mersenne_twister_engine"* %0, %"class.std::mersenne_twister_engine"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %3, align 8
  %6 = load i64, i64* %4, align 8
  call void @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE4seedEm(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %5, i64 noundef %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt13random_deviceD2Ev(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %0) unnamed_addr #7 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::random_device"*, align 8
  store %"class.std::random_device"* %0, %"class.std::random_device"** %2, align 8
  %3 = load %"class.std::random_device"*, %"class.std::random_device"** %2, align 8
  invoke void @_ZNSt13random_device7_M_finiEv(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000) %3)
          to label %4 unwind label %5

4:                                                ; preds = %1
  ret void

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #10
  unreachable
}

declare void @_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000), %"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32)) #5

; Function Attrs: nounwind
declare void @_ZNSaIcEC1Ev(%"class.std::allocator"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #6

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32), i8* noundef, %"class.std::allocator"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* noundef nonnull align 8 dereferenceable(32)) unnamed_addr #6

; Function Attrs: nounwind
declare void @_ZNSaIcED1Ev(%"class.std::allocator"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #6

declare noundef i32 @_ZNSt13random_device9_M_getvalEv(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000)) #5

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE4seedEm(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %0, i64 noundef %1) #0 comdat align 2 {
  %3 = alloca %"class.std::mersenne_twister_engine"*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store %"class.std::mersenne_twister_engine"* %0, %"class.std::mersenne_twister_engine"** %3, align 8
  store i64 %1, i64* %4, align 8
  %7 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %3, align 8
  %8 = load i64, i64* %4, align 8
  %9 = call noundef i64 @_ZNSt8__detail5__modImLm0ELm1ELm0EEET_S1_(i64 noundef %8)
  %10 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %7, i32 0, i32 0
  %11 = getelementptr inbounds [312 x i64], [312 x i64]* %10, i64 0, i64 0
  store i64 %9, i64* %11, align 8
  store i64 1, i64* %5, align 8
  br label %12

12:                                               ; preds = %36, %2
  %13 = load i64, i64* %5, align 8
  %14 = icmp ult i64 %13, 312
  br i1 %14, label %15, label %39

15:                                               ; preds = %12
  %16 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %7, i32 0, i32 0
  %17 = load i64, i64* %5, align 8
  %18 = sub i64 %17, 1
  %19 = getelementptr inbounds [312 x i64], [312 x i64]* %16, i64 0, i64 %18
  %20 = load i64, i64* %19, align 8
  store i64 %20, i64* %6, align 8
  %21 = load i64, i64* %6, align 8
  %22 = lshr i64 %21, 62
  %23 = load i64, i64* %6, align 8
  %24 = xor i64 %23, %22
  store i64 %24, i64* %6, align 8
  %25 = load i64, i64* %6, align 8
  %26 = mul i64 %25, 6364136223846793005
  store i64 %26, i64* %6, align 8
  %27 = load i64, i64* %5, align 8
  %28 = call noundef i64 @_ZNSt8__detail5__modImLm312ELm1ELm0EEET_S1_(i64 noundef %27)
  %29 = load i64, i64* %6, align 8
  %30 = add i64 %29, %28
  store i64 %30, i64* %6, align 8
  %31 = load i64, i64* %6, align 8
  %32 = call noundef i64 @_ZNSt8__detail5__modImLm0ELm1ELm0EEET_S1_(i64 noundef %31)
  %33 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %7, i32 0, i32 0
  %34 = load i64, i64* %5, align 8
  %35 = getelementptr inbounds [312 x i64], [312 x i64]* %33, i64 0, i64 %34
  store i64 %32, i64* %35, align 8
  br label %36

36:                                               ; preds = %15
  %37 = load i64, i64* %5, align 8
  %38 = add i64 %37, 1
  store i64 %38, i64* %5, align 8
  br label %12, !llvm.loop !26

39:                                               ; preds = %12
  %40 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %7, i32 0, i32 1
  store i64 312, i64* %40, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt8__detail5__modImLm0ELm1ELm0EEET_S1_(i64 noundef %0) #0 comdat {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  store i64 1, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call noundef i64 @_ZNSt8__detail4_ModImLm0ELm1ELm0ELb1ELb0EE6__calcEm(i64 noundef %4)
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt8__detail5__modImLm312ELm1ELm0EEET_S1_(i64 noundef %0) #0 comdat {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  store i64 1, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call noundef i64 @_ZNSt8__detail4_ModImLm312ELm1ELm0ELb1ELb1EE6__calcEm(i64 noundef %4)
  ret i64 %5
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt8__detail4_ModImLm0ELm1ELm0ELb1ELb0EE6__calcEm(i64 noundef %0) #2 comdat align 2 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = mul i64 1, %4
  %6 = add i64 %5, 0
  store i64 %6, i64* %3, align 8
  %7 = load i64, i64* %3, align 8
  ret i64 %7
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt8__detail4_ModImLm312ELm1ELm0ELb1ELb1EE6__calcEm(i64 noundef %0) #2 comdat align 2 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = mul i64 1, %4
  %6 = add i64 %5, 0
  store i64 %6, i64* %3, align 8
  %7 = load i64, i64* %3, align 8
  %8 = urem i64 %7, 312
  store i64 %8, i64* %3, align 8
  %9 = load i64, i64* %3, align 8
  ret i64 %9
}

declare void @_ZNSt13random_device7_M_finiEv(%"class.std::random_device"* noundef nonnull align 8 dereferenceable(5000)) #5

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #8 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #9
  call void @_ZSt9terminatev() #10
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt24uniform_int_distributionImEC2Emm(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %0, i64 noundef %1, i64 noundef %2) unnamed_addr #1 comdat align 2 {
  %4 = alloca %"class.std::uniform_int_distribution"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store %"class.std::uniform_int_distribution"* %0, %"class.std::uniform_int_distribution"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.std::uniform_int_distribution"*, %"class.std::uniform_int_distribution"** %4, align 8
  %8 = getelementptr inbounds %"class.std::uniform_int_distribution", %"class.std::uniform_int_distribution"* %7, i32 0, i32 0
  %9 = load i64, i64* %5, align 8
  %10 = load i64, i64* %6, align 8
  call void @_ZNSt24uniform_int_distributionImE10param_typeC2Emm(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %8, i64 noundef %9, i64 noundef %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt24uniform_int_distributionImE10param_typeC2Emm(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %0, i64 noundef %1, i64 noundef %2) unnamed_addr #7 comdat align 2 {
  %4 = alloca %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %0, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %4, align 8
  %8 = getelementptr inbounds %"struct.std::uniform_int_distribution<unsigned long>::param_type", %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %7, i32 0, i32 0
  %9 = load i64, i64* %5, align 8
  store i64 %9, i64* %8, align 8
  %10 = getelementptr inbounds %"struct.std::uniform_int_distribution<unsigned long>::param_type", %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %7, i32 0, i32 1
  %11 = load i64, i64* %6, align 8
  store i64 %11, i64* %10, align 8
  br label %12

12:                                               ; preds = %3
  br label %13

13:                                               ; preds = %12
  ret void
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_RKNS0_10param_typeE(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %0, %"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %1, %"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %2) #0 comdat align 2 {
  %4 = alloca %"class.std::uniform_int_distribution"*, align 8
  %5 = alloca %"class.std::mersenne_twister_engine"*, align 8
  %6 = alloca %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca %"struct.std::uniform_int_distribution<unsigned long>::param_type", align 8
  store %"class.std::uniform_int_distribution"* %0, %"class.std::uniform_int_distribution"** %4, align 8
  store %"class.std::mersenne_twister_engine"* %1, %"class.std::mersenne_twister_engine"** %5, align 8
  store %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %2, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %6, align 8
  %17 = load %"class.std::uniform_int_distribution"*, %"class.std::uniform_int_distribution"** %4, align 8
  store i64 0, i64* %7, align 8
  store i64 -1, i64* %8, align 8
  store i64 -1, i64* %9, align 8
  %18 = load %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %6, align 8
  %19 = call noundef i64 @_ZNKSt24uniform_int_distributionImE10param_type1bEv(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %18)
  %20 = load %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %6, align 8
  %21 = call noundef i64 @_ZNKSt24uniform_int_distributionImE10param_type1aEv(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %20)
  %22 = sub i64 %19, %21
  store i64 %22, i64* %10, align 8
  %23 = load i64, i64* %10, align 8
  %24 = icmp ugt i64 -1, %23
  br i1 %24, label %25, label %32

25:                                               ; preds = %3
  %26 = load i64, i64* %10, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %12, align 8
  %28 = load i64, i64* %12, align 8
  store i64 %28, i64* %13, align 8
  %29 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %5, align 8
  %30 = load i64, i64* %13, align 8
  %31 = call noundef i64 @_ZNSt24uniform_int_distributionImE5_S_ndIoSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEmEET1_RT0_S4_(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %29, i64 noundef %30)
  store i64 %31, i64* %11, align 8
  br label %63

32:                                               ; preds = %3
  %33 = load i64, i64* %10, align 8
  %34 = icmp ult i64 -1, %33
  br i1 %34, label %35, label %58

35:                                               ; preds = %32
  br label %36

36:                                               ; preds = %55, %35
  store i64 0, i64* %15, align 8
  %37 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %5, align 8
  %38 = load i64, i64* %10, align 8
  %39 = udiv i64 %38, 0
  call void @_ZNSt24uniform_int_distributionImE10param_typeC2Emm(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %16, i64 noundef 0, i64 noundef %39)
  %40 = call noundef i64 @_ZNSt24uniform_int_distributionImEclISt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEEEmRT_RKNS0_10param_typeE(%"class.std::uniform_int_distribution"* noundef nonnull align 8 dereferenceable(16) %17, %"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %37, %"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %16)
  %41 = mul i64 0, %40
  store i64 %41, i64* %14, align 8
  %42 = load i64, i64* %14, align 8
  %43 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %5, align 8
  %44 = call noundef i64 @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEclEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %43)
  %45 = sub i64 %44, 0
  %46 = add i64 %42, %45
  store i64 %46, i64* %11, align 8
  br label %47

47:                                               ; preds = %36
  %48 = load i64, i64* %11, align 8
  %49 = load i64, i64* %10, align 8
  %50 = icmp ugt i64 %48, %49
  br i1 %50, label %55, label %51

51:                                               ; preds = %47
  %52 = load i64, i64* %11, align 8
  %53 = load i64, i64* %14, align 8
  %54 = icmp ult i64 %52, %53
  br label %55

55:                                               ; preds = %51, %47
  %56 = phi i1 [ true, %47 ], [ %54, %51 ]
  br i1 %56, label %36, label %57, !llvm.loop !27

57:                                               ; preds = %55
  br label %62

58:                                               ; preds = %32
  %59 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %5, align 8
  %60 = call noundef i64 @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEclEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %59)
  %61 = sub i64 %60, 0
  store i64 %61, i64* %11, align 8
  br label %62

62:                                               ; preds = %58, %57
  br label %63

63:                                               ; preds = %62, %25
  %64 = load i64, i64* %11, align 8
  %65 = load %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %6, align 8
  %66 = call noundef i64 @_ZNKSt24uniform_int_distributionImE10param_type1aEv(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %65)
  %67 = add i64 %64, %66
  ret i64 %67
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNKSt24uniform_int_distributionImE10param_type1bEv(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %0) #2 comdat align 2 {
  %2 = alloca %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, align 8
  store %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %0, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %2, align 8
  %3 = load %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::uniform_int_distribution<unsigned long>::param_type", %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %3, i32 0, i32 1
  %5 = load i64, i64* %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNKSt24uniform_int_distributionImE10param_type1aEv(%"struct.std::uniform_int_distribution<unsigned long>::param_type"* noundef nonnull align 8 dereferenceable(16) %0) #2 comdat align 2 {
  %2 = alloca %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, align 8
  store %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %0, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %2, align 8
  %3 = load %"struct.std::uniform_int_distribution<unsigned long>::param_type"*, %"struct.std::uniform_int_distribution<unsigned long>::param_type"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::uniform_int_distribution<unsigned long>::param_type", %"struct.std::uniform_int_distribution<unsigned long>::param_type"* %3, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt24uniform_int_distributionImE5_S_ndIoSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEmEET1_RT0_S4_(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %0, i64 noundef %1) #0 comdat align 2 {
  %3 = alloca %"class.std::mersenne_twister_engine"*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i128, align 16
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store %"class.std::mersenne_twister_engine"* %0, %"class.std::mersenne_twister_engine"** %3, align 8
  store i64 %1, i64* %4, align 8
  %8 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %3, align 8
  %9 = call noundef i64 @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEclEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %8)
  %10 = zext i64 %9 to i128
  %11 = load i64, i64* %4, align 8
  %12 = zext i64 %11 to i128
  %13 = mul i128 %10, %12
  store i128 %13, i128* %5, align 16
  %14 = load i128, i128* %5, align 16
  %15 = trunc i128 %14 to i64
  store i64 %15, i64* %6, align 8
  %16 = load i64, i64* %6, align 8
  %17 = load i64, i64* %4, align 8
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %19, label %38

19:                                               ; preds = %2
  %20 = load i64, i64* %4, align 8
  %21 = sub i64 0, %20
  %22 = load i64, i64* %4, align 8
  %23 = urem i64 %21, %22
  store i64 %23, i64* %7, align 8
  br label %24

24:                                               ; preds = %28, %19
  %25 = load i64, i64* %6, align 8
  %26 = load i64, i64* %7, align 8
  %27 = icmp ult i64 %25, %26
  br i1 %27, label %28, label %37

28:                                               ; preds = %24
  %29 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %3, align 8
  %30 = call noundef i64 @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEclEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %29)
  %31 = zext i64 %30 to i128
  %32 = load i64, i64* %4, align 8
  %33 = zext i64 %32 to i128
  %34 = mul i128 %31, %33
  store i128 %34, i128* %5, align 16
  %35 = load i128, i128* %5, align 16
  %36 = trunc i128 %35 to i64
  store i64 %36, i64* %6, align 8
  br label %24, !llvm.loop !28

37:                                               ; preds = %24
  br label %38

38:                                               ; preds = %37, %2
  %39 = load i128, i128* %5, align 16
  %40 = lshr i128 %39, 64
  %41 = trunc i128 %40 to i64
  ret i64 %41
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEclEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %0) #0 comdat align 2 {
  %2 = alloca %"class.std::mersenne_twister_engine"*, align 8
  %3 = alloca i64, align 8
  store %"class.std::mersenne_twister_engine"* %0, %"class.std::mersenne_twister_engine"** %2, align 8
  %4 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %2, align 8
  %5 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %4, i32 0, i32 1
  %6 = load i64, i64* %5, align 8
  %7 = icmp uge i64 %6, 312
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  call void @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %4)
  br label %9

9:                                                ; preds = %8, %1
  %10 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %4, i32 0, i32 0
  %11 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %4, i32 0, i32 1
  %12 = load i64, i64* %11, align 8
  %13 = add i64 %12, 1
  store i64 %13, i64* %11, align 8
  %14 = getelementptr inbounds [312 x i64], [312 x i64]* %10, i64 0, i64 %12
  %15 = load i64, i64* %14, align 8
  store i64 %15, i64* %3, align 8
  %16 = load i64, i64* %3, align 8
  %17 = lshr i64 %16, 29
  %18 = and i64 %17, 6148914691236517205
  %19 = load i64, i64* %3, align 8
  %20 = xor i64 %19, %18
  store i64 %20, i64* %3, align 8
  %21 = load i64, i64* %3, align 8
  %22 = shl i64 %21, 17
  %23 = and i64 %22, 8202884508482404352
  %24 = load i64, i64* %3, align 8
  %25 = xor i64 %24, %23
  store i64 %25, i64* %3, align 8
  %26 = load i64, i64* %3, align 8
  %27 = shl i64 %26, 37
  %28 = and i64 %27, -2270628950310912
  %29 = load i64, i64* %3, align 8
  %30 = xor i64 %29, %28
  store i64 %30, i64* %3, align 8
  %31 = load i64, i64* %3, align 8
  %32 = lshr i64 %31, 43
  %33 = load i64, i64* %3, align 8
  %34 = xor i64 %33, %32
  store i64 %34, i64* %3, align 8
  %35 = load i64, i64* %3, align 8
  ret i64 %35
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv(%"class.std::mersenne_twister_engine"* noundef nonnull align 8 dereferenceable(2504) %0) #2 comdat align 2 {
  %2 = alloca %"class.std::mersenne_twister_engine"*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store %"class.std::mersenne_twister_engine"* %0, %"class.std::mersenne_twister_engine"** %2, align 8
  %10 = load %"class.std::mersenne_twister_engine"*, %"class.std::mersenne_twister_engine"** %2, align 8
  store i64 -2147483648, i64* %3, align 8
  store i64 2147483647, i64* %4, align 8
  store i64 0, i64* %5, align 8
  br label %11

11:                                               ; preds = %44, %1
  %12 = load i64, i64* %5, align 8
  %13 = icmp ult i64 %12, 156
  br i1 %13, label %14, label %47

14:                                               ; preds = %11
  %15 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %16 = load i64, i64* %5, align 8
  %17 = getelementptr inbounds [312 x i64], [312 x i64]* %15, i64 0, i64 %16
  %18 = load i64, i64* %17, align 8
  %19 = and i64 %18, -2147483648
  %20 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %21 = load i64, i64* %5, align 8
  %22 = add i64 %21, 1
  %23 = getelementptr inbounds [312 x i64], [312 x i64]* %20, i64 0, i64 %22
  %24 = load i64, i64* %23, align 8
  %25 = and i64 %24, 2147483647
  %26 = or i64 %19, %25
  store i64 %26, i64* %6, align 8
  %27 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %28 = load i64, i64* %5, align 8
  %29 = add i64 %28, 156
  %30 = getelementptr inbounds [312 x i64], [312 x i64]* %27, i64 0, i64 %29
  %31 = load i64, i64* %30, align 8
  %32 = load i64, i64* %6, align 8
  %33 = lshr i64 %32, 1
  %34 = xor i64 %31, %33
  %35 = load i64, i64* %6, align 8
  %36 = and i64 %35, 1
  %37 = icmp ne i64 %36, 0
  %38 = zext i1 %37 to i64
  %39 = select i1 %37, i64 -5403634167711393303, i64 0
  %40 = xor i64 %34, %39
  %41 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %42 = load i64, i64* %5, align 8
  %43 = getelementptr inbounds [312 x i64], [312 x i64]* %41, i64 0, i64 %42
  store i64 %40, i64* %43, align 8
  br label %44

44:                                               ; preds = %14
  %45 = load i64, i64* %5, align 8
  %46 = add i64 %45, 1
  store i64 %46, i64* %5, align 8
  br label %11, !llvm.loop !29

47:                                               ; preds = %11
  store i64 156, i64* %7, align 8
  br label %48

48:                                               ; preds = %81, %47
  %49 = load i64, i64* %7, align 8
  %50 = icmp ult i64 %49, 311
  br i1 %50, label %51, label %84

51:                                               ; preds = %48
  %52 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %53 = load i64, i64* %7, align 8
  %54 = getelementptr inbounds [312 x i64], [312 x i64]* %52, i64 0, i64 %53
  %55 = load i64, i64* %54, align 8
  %56 = and i64 %55, -2147483648
  %57 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %58 = load i64, i64* %7, align 8
  %59 = add i64 %58, 1
  %60 = getelementptr inbounds [312 x i64], [312 x i64]* %57, i64 0, i64 %59
  %61 = load i64, i64* %60, align 8
  %62 = and i64 %61, 2147483647
  %63 = or i64 %56, %62
  store i64 %63, i64* %8, align 8
  %64 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %65 = load i64, i64* %7, align 8
  %66 = add i64 %65, -156
  %67 = getelementptr inbounds [312 x i64], [312 x i64]* %64, i64 0, i64 %66
  %68 = load i64, i64* %67, align 8
  %69 = load i64, i64* %8, align 8
  %70 = lshr i64 %69, 1
  %71 = xor i64 %68, %70
  %72 = load i64, i64* %8, align 8
  %73 = and i64 %72, 1
  %74 = icmp ne i64 %73, 0
  %75 = zext i1 %74 to i64
  %76 = select i1 %74, i64 -5403634167711393303, i64 0
  %77 = xor i64 %71, %76
  %78 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %79 = load i64, i64* %7, align 8
  %80 = getelementptr inbounds [312 x i64], [312 x i64]* %78, i64 0, i64 %79
  store i64 %77, i64* %80, align 8
  br label %81

81:                                               ; preds = %51
  %82 = load i64, i64* %7, align 8
  %83 = add i64 %82, 1
  store i64 %83, i64* %7, align 8
  br label %48, !llvm.loop !30

84:                                               ; preds = %48
  %85 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %86 = getelementptr inbounds [312 x i64], [312 x i64]* %85, i64 0, i64 311
  %87 = load i64, i64* %86, align 8
  %88 = and i64 %87, -2147483648
  %89 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %90 = getelementptr inbounds [312 x i64], [312 x i64]* %89, i64 0, i64 0
  %91 = load i64, i64* %90, align 8
  %92 = and i64 %91, 2147483647
  %93 = or i64 %88, %92
  store i64 %93, i64* %9, align 8
  %94 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %95 = getelementptr inbounds [312 x i64], [312 x i64]* %94, i64 0, i64 155
  %96 = load i64, i64* %95, align 8
  %97 = load i64, i64* %9, align 8
  %98 = lshr i64 %97, 1
  %99 = xor i64 %96, %98
  %100 = load i64, i64* %9, align 8
  %101 = and i64 %100, 1
  %102 = icmp ne i64 %101, 0
  %103 = zext i1 %102 to i64
  %104 = select i1 %102, i64 -5403634167711393303, i64 0
  %105 = xor i64 %99, %104
  %106 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 0
  %107 = getelementptr inbounds [312 x i64], [312 x i64]* %106, i64 0, i64 311
  store i64 %105, i64* %107, align 8
  %108 = getelementptr inbounds %"class.std::mersenne_twister_engine", %"class.std::mersenne_twister_engine"* %10, i32 0, i32 1
  store i64 0, i64* %108, align 8
  ret void
}

attributes #0 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noinline noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
