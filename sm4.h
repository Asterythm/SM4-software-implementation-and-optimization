#ifndef SM4_H
#define SM4_H

#include <stdint.h>
#include <immintrin.h>

// SM4 block and key size
#define SM4_BLOCK_SIZE 16
#define SM4_KEY_SIZE 16
#define SM4_ROUNDS 32

// Function prototypes
void sm4_round(uint32_t *state, uint32_t rk);
void sm4_ttable_round(uint32_t *state, uint32_t rk);
__m128i sm4_aesni_sbox(__m128i x);
__m512i sm4_vprold_linear(__m512i t);
void init_ttable(void);
void sm4_encrypt(const uint8_t *key, const uint8_t *plaintext, uint8_t *ciphertext);

#endif // SM4_H