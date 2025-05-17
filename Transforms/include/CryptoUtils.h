#ifndef CRYPTO_UTILS_H
#define CRYPTO_UTILS_H

#include <cstdint>
#include <random>
#include <ctime>
#include <cstdlib>   // rand() 和 srand()
#include "llvm/IR/GlobalVariable.h"
#define GM_SM4_ENCRYPT 0
#define TARGET_ARRAY_SIZE 100000
// 将const unsigned char *表示的数据转换为字
#ifndef GM_GET_UINT32_BE
#define GM_GET_UINT32_BE(n, b, i)                       \
{                                                       \
    (n) = ( (uint32_t) (b)[(i)    ] << 24 )             \
        | ( (uint32_t) (b)[(i) + 1] << 16 )             \
        | ( (uint32_t) (b)[(i) + 2] <<  8 )             \
        | ( (uint32_t) (b)[(i) + 3]       );            \
}
#endif

//将字转换为const unsigned char *表示的数据
#ifndef GM_PUT_UINT32_BE
#define GM_PUT_UINT32_BE(n, b ,i)                       \
{                                                       \
    (b)[(i)    ] = (unsigned char) ( (n) >> 24 );       \
    (b)[(i) + 1] = (unsigned char) ( (n) >> 16 );       \
    (b)[(i) + 2] = (unsigned char) ( (n) >>  8 );       \
    (b)[(i) + 3] = (unsigned char) ( (n)       );       \
}
#endif
extern unsigned char GM_SM4_SBOX[256];
// 左移
#define  GM_SHL(x,n) (((x) & 0xFFFFFFFF) << (n % 32))

// 循环左移
#define GM_CROL(x, n) (GM_SHL((x), n) | ((x) >> (32 - (n) % 32)))

// 非线性变换S盒
#define GM_SM4_NON_LINEAR_OP(in, out) \
{                                                           \
    (out)  = ( GM_SM4_SBOX[ ((in) >> 24) & 0x0FF ] ) << 24; \
    (out) |= ( GM_SM4_SBOX[ ((in) >> 16) & 0x0FF ] ) << 16; \
    (out) |= ( GM_SM4_SBOX[ ((in) >> 8)  & 0x0FF ] ) << 8;  \
    (out) |= ( GM_SM4_SBOX[ (in)         & 0x0FF ] );       \
}

//  辅助构造密钥参数
extern unsigned int GM_SM4_FK[4];

extern unsigned int GM_SM4_CK[32];

extern unsigned char key[16];

typedef struct {
	unsigned int rk[32];           // 轮密钥
	unsigned char buf[16];         // 待加密数据
	unsigned char iv[16];          // CBC IV向量
	unsigned int cur_buf_len;      // 当前待压缩消息长度（字节）
	unsigned int total_len;        // 已加密数据长度（字节）
	unsigned int state;            // 0比特标识是否为加密，1比特标识是否为PKCS7填充，2比特标识是否为CBC加密
} gm_sm4_context;

struct EncryptedGV {
  llvm::GlobalVariable *GV;
  uint64_t key;
  uint32_t len;
};

class CryptoUtils {
public:
    CryptoUtils() : rng(std::random_device{}()) {}

    // 生成 64 位随机数
    uint64_t get_uint64_t();

    

    /* SM4 module */

    static void sm4_key_schedule(const unsigned char * key, unsigned int * rk);

    static void gm_sm4_crypt(const unsigned char *key, int mode, const unsigned char *in, unsigned char *out);

    static void test_gm_sm4(const unsigned char * key, int mode,
        unsigned char * input,
        const unsigned char * output_hex);
    static void gm_sm4_init(gm_sm4_context * ctx, const unsigned char key[16], 
	    int forEncryption, int pkcs7Padding, const unsigned char iv[16]);
    static int gm_sm4_update(gm_sm4_context * ctx, const unsigned char * input, unsigned int iLen, unsigned char * output);
    static int gm_sm4_done(gm_sm4_context * ctx, unsigned char * output);
    static int Enc_sm4_ecb_cbc(int isCBC, int pkcs7, unsigned char * buf, int iLen);
    

private:
    std::mt19937_64 rng; // 使用 Mersenne Twister 作为随机数生成器
};
extern "C" void Dec_sm4_ecb_cbc(int isCBC, int pkcs7, unsigned char * decbuf, unsigned char * buf, int iLen, uint8_t * tick);
extern "C" void genRandomString(unsigned char * buf, int iLen);
extern "C" void assignLow8BitsToInt8(uint8_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick);
extern "C" void assignLow8BitsToInt16(uint16_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick); 
extern "C" void assignLow8BitsToInt32(uint32_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick);
extern "C" void assignLow8BitsToInt64(uint64_t* destArray, uint8_t* srcArray, size_t count, uint8_t reverse, uint8_t* tick);

#endif // CRYPTO_UTILS_H
