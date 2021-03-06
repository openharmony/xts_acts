/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef HC_ALG_TEST_CASE_H
#define HC_ALG_TEST_CASE_H

#include <ohos_types.h> // ARRAY_SIZE
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define KEY_PAIR_ALIAS_1 "test: key pair 1"
#define KEY_PAIR_ALIAS_2 "test: key pair 2"
#define SHARED_KEY_ALIAS_1 "test: shared key 1"
#define SHARED_KEY_ALIAS_2 "test: shared key 2"
#define EXCHANGE_AAD "hichain_iso_exchange"

enum {
    NONCE_SIZE = 12,
    AES_GCM_KEY_LEN = 128 / 8,
    TAG_LEN = 16,
    CIPHER_LEN = 32,
    PLAIN_LEN = 16,
    X25519_KEY_BYTE_LEN = 32,
    ED25519_KEY_BYTE_LEN = 32,
};

typedef struct {
    uint32_t baseLength;
    uint32_t expLength;
    const char *prime;
    const uint8_t *base;
    const uint8_t *exp;
    const uint8_t *result;
} BigNumTestCase;

static const uint8_t AES_GCM_TEST_KEY[AES_GCM_KEY_LEN] = {
    0xc7, 0x4f, 0x98, 0x27, 0x09, 0xcf, 0xbe, 0x04,
    0x03, 0x81, 0xbc, 0x4a, 0x45, 0xed, 0xe9, 0xcb
};

static const uint8_t AES_GCM_CIPHER_CASE[CIPHER_LEN] = {
    0xf0, 0x1f, 0x08, 0xb2, 0xb1, 0x79, 0xc9, 0x65,
    0xc6, 0x45, 0x0c, 0xc9, 0xb9, 0xb6, 0x07, 0xc0,
    0x27, 0x0c, 0x8d, 0xa0, 0x33, 0x6a, 0x5b, 0xa9,
    0x0f, 0x1a, 0x01, 0xde, 0x43, 0xda, 0x79, 0x7f
};

static const uint8_t PLAIN_CASE[] = "This is the case";

static const uint8_t HASH_TO_POINT_CASE[] = {
    0x75, 0x6d, 0xee, 0x8b, 0xa1, 0xce, 0xce, 0xa3,
    0x1e, 0x68, 0x02, 0xe8, 0xe4, 0xbe, 0xe0, 0x9e,
    0x3b, 0x01, 0xfa, 0xe0, 0x34, 0x77, 0x65, 0x2c,
    0xf0, 0x2F, 0x33, 0x7a, 0x54, 0x6b, 0xd9, 0xdd
};

static const uint8_t HASH_TO_POINT_RESULT[] = {
    0xd4, 0xa8, 0x7e, 0xa6, 0xd7, 0x07, 0xb0, 0xea,
    0xef, 0x28, 0xd8, 0x98, 0x89, 0xcc, 0xa0, 0xd8,
    0x65, 0x4d, 0x8e, 0xdd, 0x4b, 0x16, 0x7a, 0x0d,
    0xde, 0x4f, 0xf2, 0x99, 0xd3, 0x4c, 0xb4, 0x45
};

static const uint8_t X25519_PRIVATE_KEY_A[X25519_KEY_BYTE_LEN] = {
    0x6c, 0xe7, 0xf5, 0x5c, 0x2d, 0xc8, 0x89, 0x6b,
    0xfc, 0x64, 0xe8, 0xc4, 0x58, 0xfe, 0xbe, 0x13,
    0x45, 0x01, 0xa4, 0x7a, 0xa1, 0x60, 0xcd, 0x4c,
    0xaa, 0x7b, 0x19, 0x10, 0x23, 0x33, 0xa1, 0x32
};

static const uint8_t X25519_PUBLIC_KEY_A[X25519_KEY_BYTE_LEN] = {
    0x10, 0x65, 0x4b, 0x65, 0xf9, 0x40, 0x10, 0x20,
    0x4b, 0x2f, 0xff, 0xc6, 0xaf, 0xb3, 0xa8, 0x86,
    0x69, 0xda, 0x32, 0xf4, 0xa7, 0x00, 0x37, 0x82,
    0x7e, 0xd3, 0x39, 0xd1, 0x02, 0x2b, 0x23, 0x5d
};

static const uint8_t X25519_PRIVATE_KEY_B[X25519_KEY_BYTE_LEN] = {
    0xc3, 0xb2, 0xc7, 0xc3, 0x1c, 0x7e, 0xad, 0x20,
    0x5f, 0x00, 0xdf, 0x1a, 0xe0, 0xe6, 0x9e, 0x6c,
    0xf8, 0xac, 0x2f, 0xd5, 0xea, 0xa5, 0xb6, 0xe7,
    0x75, 0x46, 0xcb, 0x85, 0xbc, 0x0e, 0x68, 0xb6
};

static const uint8_t X25519_PUBLIC_KEY_B[X25519_KEY_BYTE_LEN] = {
    0xd7, 0x7b, 0xa7, 0x19, 0x8b, 0x3e, 0x54, 0x4c,
    0xc3, 0x45, 0xb9, 0x61, 0xa0, 0x9c, 0x23, 0xfc,
    0xeb, 0x1f, 0x9c, 0x30, 0x0f, 0x3c, 0xcd, 0x17,
    0x7d, 0xdc, 0x50, 0x0f, 0x40, 0x03, 0x90, 0x2e
};

static const char PRIME_HEX_384[] =
    "FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74"
    "020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F1437"
    "4FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7ED"
    "EE386BFB5A899FA5AE9F24117C4B1FE649286651ECE45B3DC2007CB8A163BF05"
    "98DA48361C55D39A69163FA8FD24CF5F83655D23DCA3AD961C62F356208552BB"
    "9ED529077096966D670C354E4ABC9804F1746C08CA18217C32905E462E36CE3B"
    "E39E772C180E86039B2783A2EC07A28FB5C55DF06F4C52C9DE2BCBF695581718"
    "3995497CEA956AE515D2261898FA051015728E5A8AAAC42DAD33170D04507A33"
    "A85521ABDF1CBA64ECFB850458DBEF0A8AEA71575D060C7DB3970F85A6E1E4C7"
    "ABF5AE8CDB0933D71E8C94E04A25619DCEE3D2261AD2EE6BF12FFA06D98A0864"
    "D87602733EC86A64521F2B18177B200CBBE117577A615D6C770988C0BAD946E2"
    "08E24FA074E5AB3143DB5BFCE0FD108E4B82D120A93AD2CAFFFFFFFFFFFFFFFF";

static const char PRIME_HEX_256[] =
    "FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74"
    "020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F1437"
    "4FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7ED"
    "EE386BFB5A899FA5AE9F24117C4B1FE649286651ECE45B3DC2007CB8A163BF05"
    "98DA48361C55D39A69163FA8FD24CF5F83655D23DCA3AD961C62F356208552BB"
    "9ED529077096966D670C354E4ABC9804F1746C08CA18217C32905E462E36CE3B"
    "E39E772C180E86039B2783A2EC07A28FB5C55DF06F4C52C9DE2BCBF695581718"
    "3995497CEA956AE515D2261898FA051015728E5A8AACAA68FFFFFFFFFFFFFFFF";

static const uint8_t BASE_HEX_32[] = {
    0x42, 0x6B, 0x93, 0xAA, 0x93, 0x27, 0xD7, 0x43, 0x8A, 0x92, 0x67, 0x77, 0x77, 0x23, 0x51, 0xAA,
    0xD5, 0xCF, 0xA3, 0xDB, 0x53, 0x0B, 0x81, 0x77, 0x85, 0x85, 0xCC, 0x83, 0x50, 0x41, 0x38, 0xE3
};

static const uint8_t BASE_HEX_256[] = {
    0xDA, 0xC2, 0xE1, 0x78, 0x68, 0xD7, 0x3E, 0x0E, 0xB2, 0x1A, 0x33, 0xA9, 0x1F, 0x0C, 0xD2, 0x44,
    0x75, 0xEC, 0xDC, 0xF3, 0x47, 0x7B, 0xEF, 0x7D, 0x22, 0x01, 0x94, 0x34, 0x01, 0x8F, 0x9A, 0x57,
    0xC1, 0x04, 0xFE, 0x09, 0x9C, 0xB1, 0x50, 0xF5, 0xDD, 0x09, 0x08, 0x3E, 0x08, 0x9E, 0xD3, 0x13,
    0x62, 0x91, 0xC7, 0x72, 0x9B, 0x1F, 0x1F, 0x6A, 0x0A, 0x26, 0xD6, 0xF7, 0xEE, 0xFC, 0x3C, 0x35,
    0x90, 0x94, 0xF0, 0x7B, 0xEF, 0x59, 0xE3, 0xF2, 0x0D, 0x2B, 0x47, 0xAB, 0x8D, 0xB2, 0xA4, 0xFD,
    0x0D, 0x68, 0x9E, 0xA4, 0xCF, 0xE2, 0x7D, 0x19, 0x74, 0x91, 0x7D, 0x18, 0xFB, 0x81, 0x89, 0xC4,
    0xCA, 0x49, 0x31, 0xC3, 0xFB, 0xE5, 0x6C, 0x43, 0x9A, 0x5B, 0x56, 0xF1, 0xBB, 0xE7, 0xF0, 0x76,
    0x66, 0x3E, 0x06, 0x4B, 0x53, 0x01, 0x38, 0x28, 0xA6, 0xB6, 0x27, 0x50, 0xAB, 0x00, 0x20, 0x54,
    0x84, 0x6F, 0x08, 0xCB, 0x13, 0xC3, 0x5D, 0x24, 0x27, 0x02, 0x5C, 0x0F, 0x90, 0xA5, 0xA0, 0x1E,
    0xDC, 0xF9, 0xE5, 0x2F, 0xCB, 0x53, 0xBC, 0xD9, 0x10, 0x52, 0xF6, 0x45, 0x73, 0x21, 0x7B, 0x53,
    0x12, 0xBD, 0xF3, 0x05, 0xDA, 0xE2, 0x1B, 0x65, 0x70, 0x62, 0x74, 0x68, 0xCB, 0x1C, 0xEE, 0xFD,
    0xF9, 0xFC, 0x83, 0x95, 0x7C, 0xB5, 0xCF, 0xCE, 0x83, 0x7B, 0xBA, 0x4D, 0xEC, 0xA9, 0xDF, 0x6D,
    0xF1, 0x85, 0x59, 0x14, 0xB7, 0x94, 0x46, 0x57, 0x44, 0x10, 0x4E, 0x6E, 0xC5, 0x68, 0xDA, 0x82,
    0x92, 0x5A, 0xDB, 0x89, 0x5D, 0x3B, 0x5E, 0xB3, 0x24, 0xB4, 0x55, 0x4A, 0xE9, 0x41, 0xCB, 0xC6,
    0xE3, 0xFE, 0xC3, 0xAD, 0x2F, 0xB3, 0xA6, 0x0F, 0x7D, 0x4C, 0xA5, 0xED, 0x95, 0x70, 0x97, 0x12,
    0x54, 0xAB, 0x58, 0x0E, 0xE5, 0xF6, 0x8B, 0x37, 0x0B, 0x7C, 0x06, 0x54, 0x89, 0xDD, 0x8A, 0xA9
};

static const uint8_t EXP_HEX_1[] = { 0xE9 };

static const uint8_t EXP_HEX_28[] = {
    0x8F, 0x6F, 0xC2, 0xC0, 0x64, 0x37, 0x1E, 0x98, 0x71, 0xC9, 0xF5, 0x5E, 0x45, 0x5F, 0x46, 0x61,
    0x1B, 0x4D, 0x7D, 0x23, 0x21, 0x01, 0x1C, 0x56, 0xE2, 0x77, 0x14, 0x64
};

static const uint8_t EXP_HEX_32[] = {
    0xA9, 0xC9, 0x9A, 0x5B, 0xB5, 0x9F, 0xC6, 0x9E, 0xE3, 0xF7, 0x4B, 0xFC, 0xDC, 0xF4, 0x26, 0x20,
    0xBE, 0xAF, 0x03, 0x17, 0xEC, 0x56, 0x2C, 0xB5, 0x46, 0x13, 0x33, 0xD6, 0x97, 0x6A, 0x33, 0x7C
};

static const uint8_t BASE_HEX_384[] = {
    0x37, 0xBE, 0xDE, 0x74, 0x1B, 0x5D, 0x7D, 0x58, 0x86, 0x55, 0xD3, 0xCB, 0x52, 0x2A, 0x6C, 0x11,
    0xB5, 0x97, 0x68, 0x26, 0x21, 0x68, 0x62, 0x51, 0x6E, 0xFA, 0x0B, 0x44, 0x04, 0x18, 0x92, 0xD9,
    0x11, 0xB0, 0x33, 0x58, 0x46, 0xCD, 0x8B, 0x8E, 0x46, 0x24, 0x25, 0xFE, 0x58, 0xD9, 0x9D, 0xC4,
    0x1B, 0xA2, 0x17, 0x5D, 0xA5, 0x76, 0xA9, 0x81, 0x93, 0x49, 0x1A, 0xB8, 0x2D, 0x29, 0xDA, 0xE5,
    0x29, 0x5F, 0xE3, 0x85, 0x09, 0xE4, 0xC6, 0xF2, 0x73, 0x65, 0x40, 0xBA, 0x93, 0xAA, 0x08, 0x43,
    0xB8, 0x07, 0xF7, 0x01, 0xA5, 0xFB, 0x1E, 0x85, 0xBB, 0x14, 0x3C, 0x2B, 0xA8, 0x4D, 0xD8, 0x3C,
    0xA3, 0x19, 0x16, 0x86, 0x55, 0xE2, 0xFC, 0xC0, 0xA0, 0xA0, 0x69, 0x07, 0x6A, 0x04, 0xBA, 0x76,
    0xC4, 0x60, 0xFE, 0xCB, 0xA8, 0x50, 0x26, 0x40, 0xAB, 0x86, 0x90, 0xBA, 0x23, 0xDC, 0x06, 0xA3,
    0xFE, 0xE2, 0x21, 0x2C, 0xB8, 0x3B, 0xF8, 0x02, 0xFB, 0x1E, 0x2A, 0xBA, 0xA7, 0x60, 0x5D, 0x12,
    0xE6, 0xE7, 0xC1, 0xA3, 0x14, 0x53, 0x42, 0x50, 0x52, 0x10, 0x20, 0xC2, 0x7C, 0x9B, 0xE6, 0xE7,
    0xD0, 0x3B, 0x31, 0x2D, 0x4B, 0xFA, 0x70, 0x3B, 0x32, 0x19, 0x32, 0x71, 0x34, 0xFE, 0x12, 0x0D,
    0xE4, 0x03, 0x1D, 0x95, 0xAD, 0xBC, 0xEB, 0x86, 0xE2, 0x72, 0xBE, 0x22, 0xCC, 0x7A, 0xEF, 0x4B,
    0xEA, 0x2A, 0xD7, 0x61, 0x54, 0x66, 0xC2, 0x51, 0x70, 0x84, 0xC2, 0x93, 0x92, 0x74, 0xE7, 0x91,
    0xFC, 0xF1, 0x1C, 0x7F, 0x3F, 0x47, 0xF7, 0x4D, 0x74, 0xDF, 0xD7, 0xD3, 0x93, 0x06, 0x80, 0xBA,
    0x9B, 0xCE, 0xC4, 0x52, 0x64, 0xF6, 0x83, 0x96, 0x00, 0x3D, 0xE4, 0x6F, 0xF5, 0xDD, 0xA8, 0xC5,
    0xFC, 0x24, 0xBC, 0x4C, 0x86, 0x1C, 0x97, 0xEA, 0x6B, 0xA7, 0x66, 0x86, 0x83, 0xC6, 0x31, 0xAA,
    0x6A, 0x89, 0x9C, 0x51, 0x4C, 0x0A, 0xFB, 0x15, 0x2A, 0x67, 0x23, 0x0A, 0xA7, 0x1E, 0x7E, 0xEA,
    0x62, 0x13, 0x6E, 0x32, 0xA6, 0x3A, 0xE7, 0x39, 0x37, 0x3F, 0xBB, 0x1F, 0x59, 0x0C, 0x54, 0x70,
    0xCE, 0xE8, 0x16, 0xC9, 0xE4, 0x2D, 0xC3, 0xB8, 0xEB, 0xB1, 0x4E, 0x3B, 0x00, 0xFA, 0xD0, 0xFD,
    0xB1, 0x44, 0x86, 0x84, 0x5F, 0xBA, 0x1D, 0xA4, 0x10, 0xC8, 0x7D, 0xAC, 0x90, 0xC4, 0xD2, 0xF4,
    0x52, 0xDD, 0x68, 0xC4, 0x9D, 0xEE, 0x10, 0x6E, 0xE3, 0xD5, 0x1B, 0xBD, 0xF7, 0xFD, 0xBE, 0x7A,
    0xF6, 0xEA, 0x2F, 0x22, 0xEA, 0x8F, 0x41, 0xCB, 0x88, 0x94, 0x0A, 0x63, 0x3C, 0xF2, 0x4B, 0xDF,
    0x97, 0x74, 0xA6, 0x41, 0x55, 0xAE, 0xC9, 0x4B, 0xC7, 0xA6, 0x9D, 0xA1, 0xCD, 0xC8, 0x8F, 0x74,
    0x08, 0x15, 0x00, 0x7B, 0x1D, 0x2B, 0xDB, 0xAD, 0xC9, 0x9E, 0x9E, 0xAD, 0x5D, 0x6A, 0x5F, 0xEB
};

static const uint8_t BIG_NUM_TEST_CASE_1_RESULT[] = {
    0x84, 0x24, 0x3B, 0x5B, 0x99, 0x29, 0x54, 0xCD, 0xD8, 0x7E, 0x38, 0xE3, 0x80, 0xAA, 0x7D, 0xC7,
    0x30, 0xD4, 0xCA, 0xE7, 0x8B, 0x3F, 0xAE, 0x0D, 0xAE, 0xCD, 0x71, 0x27, 0x4D, 0xE7, 0x52, 0x96,
    0x77, 0x08, 0x88, 0x09, 0xC9, 0x4A, 0xD3, 0x09, 0x55, 0xC1, 0xB5, 0x78, 0x98, 0x2E, 0x42, 0x2D,
    0x28, 0xEB, 0xCE, 0x2E, 0x56, 0xA5, 0x15, 0x1A, 0xB4, 0x13, 0xFA, 0x3A, 0xB9, 0xB3, 0xE8, 0x5C,
    0x79, 0xDE, 0x06, 0xAE, 0xBA, 0x58, 0x5F, 0x71, 0x56, 0xCA, 0x51, 0xCF, 0x00, 0x42, 0x6D, 0xD9,
    0x8E, 0x07, 0x5D, 0xA0, 0x71, 0xE4, 0x86, 0x56, 0x7B, 0x05, 0x27, 0x70, 0x7E, 0xEC, 0x81, 0x58,
    0xD3, 0xBE, 0x3A, 0x27, 0x3F, 0x22, 0x15, 0xAB, 0x7B, 0x4E, 0xC5, 0x09, 0xEF, 0x02, 0x6F, 0xE7,
    0x00, 0x40, 0x71, 0x70, 0xC1, 0x44, 0xC7, 0xED, 0xFE, 0xC6, 0x86, 0x10, 0x12, 0xF2, 0x1B, 0x51,
    0x40, 0x02, 0x2F, 0xA1, 0x90, 0xE7, 0x07, 0xC7, 0xFE, 0x52, 0x57, 0xD6, 0xB3, 0x6E, 0xB6, 0xF3,
    0x3F, 0xC9, 0x25, 0xCC, 0x86, 0xBC, 0xEC, 0x18, 0x34, 0x4A, 0x4F, 0xF6, 0xE5, 0x01, 0x42, 0xD7,
    0x7E, 0xE4, 0x54, 0xAF, 0xE4, 0xA3, 0x26, 0x6C, 0x01, 0x0C, 0x64, 0xAD, 0x1C, 0xE0, 0x41, 0xAE,
    0x4B, 0x40, 0xB0, 0xE7, 0x67, 0x08, 0x16, 0xE5, 0x54, 0x05, 0x55, 0x9E, 0x20, 0x3F, 0x54, 0x91,
    0xCF, 0x2F, 0x1F, 0xE7, 0xE3, 0xF2, 0x4A, 0xF1, 0x58, 0x3F, 0xFE, 0x55, 0x56, 0x9A, 0x3C, 0xFB,
    0x63, 0x32, 0xF6, 0x64, 0x55, 0x5C, 0x6C, 0xAA, 0x79, 0xE0, 0x4F, 0x47, 0x36, 0x32, 0xDB, 0x2A,
    0x3F, 0xA1, 0x70, 0xAD, 0x72, 0x93, 0xFB, 0xD2, 0xF9, 0xE5, 0x0F, 0xDC, 0x85, 0x2C, 0xB9, 0x32,
    0x4E, 0x9B, 0x31, 0x8C, 0x8C, 0xFB, 0x21, 0xCF, 0xC3, 0x76, 0x22, 0x04, 0xF9, 0xCD, 0x7F, 0xE0
};

static const uint8_t BIG_NUM_TEST_CASE_2_RESULT[] = {
    0x1A, 0xA5, 0x23, 0xA4, 0x6B, 0x19, 0x79, 0xF0, 0xD0, 0x62, 0x8E, 0xE7, 0xC4, 0x5C, 0x41, 0x54,
    0x54, 0xF8, 0xB6, 0xC2, 0xA7, 0xF6, 0x80, 0x69, 0xB3, 0xE2, 0x3E, 0x0E, 0xBD, 0x73, 0xB3, 0xBC,
    0x3D, 0xB6, 0x18, 0xE1, 0xDC, 0x07, 0x2C, 0xDA, 0x37, 0xA8, 0x55, 0xA0, 0xE6, 0x19, 0x2C, 0x12,
    0xD0, 0x80, 0x36, 0x73, 0x14, 0xBA, 0x59, 0x97, 0xDC, 0x88, 0x83, 0x75, 0x65, 0x62, 0x4D, 0xA7,
    0x74, 0x6A, 0x0F, 0xCB, 0x3E, 0x0F, 0x63, 0xF3, 0x4D, 0xFD, 0xD0, 0x99, 0xE4, 0xA7, 0xF4, 0xBB,
    0x10, 0xE9, 0xF1, 0x57, 0x4B, 0xB5, 0xC4, 0x0A, 0x79, 0x5B, 0xFB, 0x9C, 0xF2, 0x01, 0x52, 0x9A,
    0x00, 0xBE, 0x59, 0xD2, 0xE8, 0xE4, 0xB4, 0x46, 0xD5, 0xF4, 0xE0, 0xC1, 0x99, 0xDC, 0xE8, 0x88,
    0x62, 0x34, 0x52, 0xE8, 0x61, 0xAC, 0xA1, 0x47, 0x05, 0xE7, 0x01, 0x2B, 0x92, 0x0B, 0xD2, 0x43,
    0x9D, 0x57, 0xC3, 0x18, 0x18, 0x2D, 0x6F, 0xA6, 0xB8, 0x01, 0xC5, 0x2C, 0xD3, 0x9D, 0x5E, 0x1B,
    0x54, 0x9C, 0x61, 0x32, 0x5C, 0x7D, 0xA4, 0xE4, 0x65, 0xA6, 0x7E, 0xB9, 0xD2, 0x39, 0x65, 0xB6,
    0x8D, 0xB1, 0xC1, 0xFE, 0xB3, 0x67, 0x9B, 0x31, 0xD3, 0x45, 0xCD, 0xA5, 0x94, 0x3F, 0x7C, 0x4D,
    0x75, 0x57, 0x36, 0x9A, 0x78, 0x23, 0x32, 0xE6, 0xD4, 0xFA, 0xA3, 0x15, 0x47, 0x53, 0x58, 0x08,
    0xAE, 0xF0, 0xC2, 0x0A, 0x5E, 0x47, 0x9A, 0x83, 0x7D, 0x7E, 0x40, 0xA3, 0xDA, 0xA7, 0xE3, 0x19,
    0x9A, 0xFE, 0x81, 0x3F, 0x87, 0xF9, 0x40, 0xA5, 0x96, 0xF3, 0x1E, 0x3D, 0xAF, 0xEC, 0x1F, 0x63,
    0xAA, 0x89, 0xF5, 0x03, 0xD4, 0xD4, 0x3C, 0x47, 0xEA, 0x01, 0xA2, 0xFB, 0x58, 0x4A, 0x40, 0x86,
    0x68, 0xE7, 0x30, 0x87, 0x43, 0xD8, 0xEE, 0xFF, 0x02, 0x01, 0x0B, 0xE7, 0xC7, 0xEF, 0x6F, 0x69
};

static const uint8_t BIG_NUM_TEST_CASE_3_RESULT[] = {
    0x6C, 0x16, 0x45, 0x3E, 0x1F, 0xEB, 0x63, 0xDE, 0x06, 0x95, 0x62, 0xC7, 0x45, 0x89, 0xDA, 0xBB,
    0xE4, 0x5B, 0x61, 0x2D, 0x80, 0x46, 0xFE, 0x5F, 0x48, 0x2C, 0xFC, 0x6A, 0x8F, 0xAC, 0x62, 0xB0,
    0x36, 0x85, 0xD1, 0xB5, 0x0F, 0xE9, 0xAD, 0x6C, 0x2B, 0x57, 0x84, 0xB4, 0x12, 0x31, 0xF9, 0xA0,
    0xF8, 0xB3, 0x27, 0xE9, 0xFD, 0x86, 0xE4, 0x29, 0x96, 0x31, 0x98, 0x80, 0x86, 0x31, 0xFE, 0x0F,
    0xC5, 0xD0, 0x68, 0xC1, 0xA9, 0x88, 0x79, 0xD5, 0x28, 0xAA, 0x8C, 0x68, 0x19, 0x3D, 0xC4, 0x9D,
    0xDC, 0x0E, 0xC4, 0x01, 0xEB, 0x8C, 0x12, 0xBA, 0x09, 0x56, 0x91, 0x30, 0x02, 0xC4, 0x8B, 0x88,
    0xD5, 0x73, 0xA8, 0xB5, 0x36, 0x2D, 0x95, 0x63, 0x10, 0x26, 0xE3, 0x21, 0x52, 0x75, 0x99, 0xA1,
    0xA6, 0x34, 0xA0, 0xA6, 0x9A, 0x65, 0x06, 0xA3, 0x03, 0x5C, 0x20, 0xB4, 0xE5, 0x34, 0xEF, 0x40,
    0x03, 0xFE, 0x15, 0xB7, 0xBA, 0xF4, 0x0F, 0x30, 0x00, 0x15, 0xB2, 0x05, 0x17, 0x41, 0xE9, 0xD7,
    0x26, 0xB8, 0x9B, 0x78, 0xAC, 0xE7, 0xF8, 0xC5, 0xA5, 0xCB, 0x08, 0x65, 0x12, 0x89, 0x00, 0x48,
    0xE9, 0x70, 0x02, 0xFE, 0xDB, 0xE2, 0x2E, 0x6B, 0x16, 0x89, 0xD4, 0x71, 0x52, 0x9D, 0x2B, 0xE5,
    0x6D, 0x01, 0x33, 0x53, 0xFD, 0x2A, 0x36, 0xD7, 0x27, 0x94, 0xC1, 0x42, 0x2D, 0x4D, 0x32, 0x46,
    0x07, 0x04, 0x64, 0x16, 0xA2, 0x75, 0x50, 0x77, 0x1A, 0x5B, 0x4A, 0x43, 0x1A, 0x64, 0x78, 0x69,
    0x63, 0xB6, 0x8E, 0xB3, 0x02, 0x44, 0x7A, 0xDC, 0xAC, 0x68, 0xF5, 0x8C, 0xE4, 0x8E, 0x94, 0xC9,
    0xAE, 0x4A, 0x5C, 0x01, 0x04, 0xFF, 0xBB, 0x87, 0xD7, 0x4C, 0x62, 0xF6, 0x8F, 0x9F, 0xD7, 0x27,
    0x99, 0xEF, 0x96, 0xAB, 0xB9, 0x9B, 0xB3, 0x6E, 0x92, 0xDB, 0x55, 0xFB, 0x46, 0x1C, 0x3B, 0x1F,
    0xC2, 0xF9, 0xCC, 0x12, 0x23, 0x0F, 0x0D, 0xD7, 0xCE, 0x22, 0xFD, 0x99, 0xF4, 0x00, 0xED, 0xD0,
    0xC4, 0xA6, 0xE1, 0xAA, 0x8B, 0x22, 0x80, 0x7F, 0x56, 0xF1, 0x10, 0x55, 0xAF, 0x9F, 0x5A, 0xC7,
    0xA2, 0xCD, 0x48, 0xAA, 0x6D, 0x5E, 0x37, 0x8F, 0xA1, 0xC4, 0xA0, 0x3B, 0x78, 0xC8, 0xB6, 0xFD,
    0x0A, 0x7E, 0xE1, 0x61, 0x63, 0xFC, 0x33, 0x6B, 0x50, 0xEB, 0xE7, 0x13, 0x6A, 0x84, 0xF7, 0x33,
    0xB4, 0x38, 0x49, 0xF0, 0x31, 0x0A, 0x05, 0x7C, 0x10, 0xDF, 0xF6, 0x4B, 0x4F, 0x1F, 0x79, 0x96,
    0xF1, 0x37, 0x7D, 0x80, 0x3B, 0xF1, 0x73, 0xB4, 0x4E, 0x62, 0x7D, 0x86, 0x7B, 0x43, 0x51, 0x06,
    0x0B, 0xA0, 0xDC, 0xA7, 0xD5, 0x3D, 0xF2, 0xD7, 0xD3, 0x3C, 0x57, 0x9B, 0x64, 0xB1, 0xDE, 0x69,
    0x90, 0x43, 0xEE, 0xD1, 0xC6, 0xAE, 0xDD, 0x67, 0x02, 0xDF, 0xA1, 0x84, 0x7B, 0x5D, 0xB3, 0xD8
};

static const uint8_t BIG_NUM_TEST_CASE_4_RESULT[] = {
    0x31, 0xEA, 0x6E, 0x6B, 0x8C, 0xE0, 0x0F, 0x62, 0xA0, 0xDD, 0xE1, 0x3E, 0xAD, 0xB1, 0xA5, 0xA2,
    0xC8, 0xDE, 0x3D, 0x61, 0x9D, 0x37, 0xE1, 0x66, 0xF7, 0xF5, 0xCC, 0x11, 0x17, 0xFD, 0x2A, 0xA2,
    0x00, 0x36, 0xFC, 0x72, 0x74, 0x19, 0xC1, 0xA2, 0x0C, 0x35, 0x05, 0x34, 0xB0, 0x64, 0xBE, 0x7E,
    0xD0, 0x96, 0xBF, 0xCA, 0x48, 0x92, 0xA9, 0x0B, 0x4A, 0x8C, 0x56, 0x3F, 0xE6, 0xDA, 0xFC, 0xE6,
    0x66, 0xD4, 0xF8, 0x23, 0x3D, 0x6F, 0xC6, 0xC3, 0x21, 0x27, 0x10, 0x2A, 0x65, 0xE3, 0x15, 0x57,
    0xC9, 0xE4, 0x35, 0xE4, 0xC1, 0x4D, 0x1C, 0x4D, 0x89, 0xF6, 0xF6, 0x67, 0x66, 0x6F, 0x79, 0x77,
    0x64, 0xCA, 0x32, 0x52, 0x2A, 0xBC, 0xAE, 0xD3, 0xB4, 0x58, 0x9F, 0x47, 0xA5, 0x68, 0x94, 0x34,
    0x97, 0x19, 0x9F, 0x48, 0x33, 0x4C, 0x2D, 0x94, 0xD3, 0xC0, 0xBD, 0x66, 0x07, 0x4A, 0xE0, 0x4E,
    0x18, 0x08, 0xDE, 0x82, 0x1A, 0x26, 0xE7, 0x3F, 0x4E, 0x2F, 0x4D, 0x8B, 0x1B, 0x8F, 0x23, 0x81,
    0x51, 0xCA, 0xDC, 0x9B, 0x6F, 0xCB, 0x49, 0x9B, 0x2E, 0x0C, 0x24, 0x8B, 0x08, 0x9E, 0xFF, 0x1C,
    0xEA, 0x40, 0x59, 0xB3, 0xDD, 0xC6, 0x29, 0x1F, 0xBA, 0xA4, 0x2D, 0x9B, 0x5C, 0x78, 0x9F, 0x84,
    0xC6, 0x3B, 0xFB, 0xCB, 0xA0, 0x9E, 0x07, 0xB9, 0x0D, 0x6A, 0x88, 0x91, 0x0C, 0x67, 0xFC, 0x1E,
    0xAF, 0xA2, 0x54, 0x95, 0x7B, 0x50, 0xBD, 0x7D, 0x40, 0x3D, 0x3A, 0x58, 0x13, 0x14, 0x3C, 0x5C,
    0xEE, 0xF6, 0x95, 0x9C, 0x0E, 0x65, 0xA7, 0x4F, 0x67, 0x91, 0xA0, 0xE8, 0xB7, 0xC0, 0xE8, 0xD7,
    0x3E, 0x06, 0x35, 0xB6, 0x82, 0x65, 0x28, 0xA7, 0x29, 0xDA, 0xA6, 0xC1, 0xBD, 0xBA, 0x72, 0x41,
    0xBE, 0x77, 0x4F, 0x30, 0xEB, 0x8E, 0xB1, 0x29, 0x71, 0x44, 0x6B, 0x3A, 0xD8, 0xEA, 0x87, 0x1A,
    0x29, 0x41, 0xA4, 0x2B, 0x59, 0x41, 0x13, 0x4A, 0xC8, 0x60, 0xA1, 0x61, 0x13, 0x30, 0xA6, 0x4B,
    0x4F, 0x6A, 0x7C, 0x82, 0xF3, 0x78, 0x20, 0x20, 0x52, 0x5B, 0xED, 0xD5, 0xF8, 0xBF, 0x03, 0x15,
    0xD8, 0xBB, 0x71, 0x62, 0x88, 0x73, 0xEB, 0xFC, 0x32, 0x4E, 0x20, 0x17, 0xEA, 0xD6, 0xBA, 0xDF,
    0x55, 0x26, 0x6C, 0x19, 0x7F, 0x7F, 0x62, 0x83, 0x43, 0x6C, 0xA9, 0xBD, 0x12, 0x2F, 0x6B, 0x8E,
    0x55, 0x18, 0x84, 0xD6, 0x0E, 0x11, 0xA2, 0x78, 0x05, 0xD2, 0x4F, 0xEA, 0xB3, 0x61, 0x47, 0x9C,
    0xB2, 0xCF, 0x5C, 0xE1, 0xFF, 0xC8, 0x54, 0x56, 0x93, 0x2F, 0x71, 0xE0, 0xF5, 0x85, 0xC8, 0x98,
    0x0C, 0x0E, 0x02, 0x4A, 0x1C, 0xDB, 0xB6, 0x3F, 0x78, 0x4C, 0x4F, 0x1E, 0x54, 0xF9, 0x48, 0x2C,
    0xB1, 0x6E, 0x4D, 0xD6, 0x25, 0xB3, 0x91, 0x5C, 0x2B, 0x9F, 0x3A, 0xFD, 0xEB, 0x75, 0x44, 0x17
};


static const BigNumTestCase BIG_NUM_TEST_CASES[] = {
    // case 1:
    {
        .baseLength = ARRAY_SIZE(BASE_HEX_32),
        .expLength = ARRAY_SIZE(EXP_HEX_1),
        .prime = PRIME_HEX_256,
        .base = BASE_HEX_32,
        .exp = EXP_HEX_1,
        .result = BIG_NUM_TEST_CASE_1_RESULT
    },
    // case 2:
    {
        .baseLength = ARRAY_SIZE(BASE_HEX_256),
        .expLength = ARRAY_SIZE(EXP_HEX_28),
        .prime = PRIME_HEX_256,
        .base = BASE_HEX_256,
        .exp = EXP_HEX_28,
        .result = BIG_NUM_TEST_CASE_2_RESULT
    },
    // case 3:
    {
        .baseLength = ARRAY_SIZE(BASE_HEX_32),
        .expLength = ARRAY_SIZE(EXP_HEX_1),
        .prime = PRIME_HEX_384,
        .base = BASE_HEX_32,
        .exp = EXP_HEX_1,
        .result = BIG_NUM_TEST_CASE_3_RESULT
    },
    // case 4:
    {
        .baseLength = ARRAY_SIZE(BASE_HEX_384),
        .expLength = ARRAY_SIZE(EXP_HEX_32),
        .prime = PRIME_HEX_384,
        .base = BASE_HEX_384,
        .exp = EXP_HEX_32,
        .result = BIG_NUM_TEST_CASE_4_RESULT
    }
};

enum {
    SHA256_MSG_MAX_SIZE = 1024,
    SHA256_TEST_TIMES = 100,
    SHA256_TEST_MIN_LIMIT = 64, // test msg length form 1 to 64

    GEN_RANDOM_MAX_SIZE = 1024,
    GEN_RANDOM_TEST_TIMES = 100,
    GEN_RANDOM_MIN_LIMIT = 64, // test generate random from 1 to 64
    GEN_RANDOM_TEST_REPEAT_SIZE = 32,
    GEN_RANDOM_TEST_REPEAT_TIMES = 100,

    TEST_HMAC_KEY_LEN = 32,                 // equal to PSK_LEN PAKE_HMAC_KEY_LEN SHA256_LEN HC_SHA256_LEN
    TEST_HMAC_ISALIAS_TRUE_MSG_LENGTH = 32, // msg length when isAlias is true ISO_KEY_ALIAS_LEN

    HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN = 32,
    HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN = 32,
#define GENERATE_RETURN_KEY_STR "hichain_return_key"

    HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN = 16,
    HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN = 16,
#define HICHAIN_RETURN_KEY "hichain_return_key"

    HKDF_PAKE_PSK_DERIVE_SECRET_ALIAS_BASEKEY_LEN = 64,
    HKDF_PAKE_PSK_DERIVE_SECRET_ALIAS_SALT_LEN = 32,
#define TMP_AUTH_KEY_FACTOR "hichain_tmp_auth_enc_key"
    HKDF_PAKE_PSK_DERIVE_SECRET_ALIAS_OUTKEY_LEN = 32,

    HKDF_ISO_PSK_DERIVE_SESSIONKEY_BASEKEY_LEN = 32,
    HKDF_ISO_PSK_DERIVE_SESSIONKEY_SALT_LEN = 32,
#define GENERATE_SESSION_KEY_STR "hichain_iso_session_key"
    HKDF_ISO_PSK_DERIVE_SESSIONKEY_OUTKEY_LEN = 32,

    HKDF_NEW_PAKE_PSK_DERIVE_SECRET_BASEKEY_LEN = 32 * 2, // PAKE_PSK_LEN * BYTE_TO_HEX_OPER_LENGTH
    HKDF_NEW_PAKE_PSK_DERIVE_SECRET_SALT_LEN = 16,
#define HICHAIN_SPEKE_BASE_INFO "hichain_speke_base_info"
    HKDF_NEW_PAKE_PSK_DERIVE_SECRET_OUTKEY_LEN = 32,

    HKDF_NEW_PAKE_SHAREDSECRET_DERIVE_SESSIONKEY_BASEKEY_LEN = SHA256_LEN,
    HKDF_NEW_PAKE_SHAREDSECRET_DERIVE_SESSIONKEY_SALT_LEN = 16,
#define HICHAIN_SPEKE_SESSIONKEY_INFO "hichain_speke_sessionkey_info"
    HKDF_NEW_PAKE_SHAREDSECRET_DERIVE_SESSIONKEY_OUTKEY_LEN = 32,

    HKDF_PAKE_PSK_DERIVE_SECRET_BASEKEY_LEN = 32 * 2, // PAKE_PSK_LEN * BYTE_TO_HEX_OPER_LENGTH
    HKDF_PAKE_PSK_DERIVE_SECRET_SALT_LEN = 16,
    HKDF_PAKE_PSK_DERIVE_SECRET_OUTKEY_LEN = 32,

    HKDF_PAKE_SHAREDSECRET_DERIVE_UNIONKEY_SALT_LEN = 16,
    HKDF_PAKE_SHAREDSECRET_DERIVE_UNIONKEY_OUTKEY_LEN = 48,

    IMPORT_ASYMMETRIC_KEY_KEYALIAS_LEN_MAX = 32,
    IMPORT_ASYMMETRIC_KEY_KEYALIAS_LEN_MIN = 1,
    IMPORT_ASYMMETRIC_KEY_AUTHTOKEN_LEN = 32,
};

enum {
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_4 = 4,
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_32 = 32,
    // the meaning of 16 * 2 + 256 * 2 is
    // length of randSelf + length of randPeer + length of authIdPeer + length of authIdSelf
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_RAND_AUTH_ID_SELF_PEER = 16 * 2 + 256 * 2,
    // MAC FF:FF:FF:FF:FF:FF
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_MAC = 16 * 2 + 6 * 2,
    // UDID FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_UDID = 16 * 2 + 16 * 2,
    // IMEI 999999999999999
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_IMEI = 16 * 2 + 15 * 2,
};

static const uint32_t TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_ARRAY[] = {
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_4,
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_32,
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_RAND_AUTH_ID_SELF_PEER,
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_MAC,
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_UDID,
    TEST_HMAC_ISALIAS_FALSE_MSG_LENGTH_IMEI,
};

static const char SHA256_EXAMPLE_MESSAGE[] = "hichain-sha256-example";
static const uint8_t SHA256_EXAMPLE_RESULT[SHA256_LEN] = {
    0x53, 0x0a, 0x91, 0x67, 0xab, 0x1f, 0xf0, 0x18,
    0xfa, 0x1b, 0x8e, 0xb1, 0x03, 0xcf, 0x1c, 0x8a,
    0x1b, 0x7b, 0x05, 0x0d, 0xfb, 0x2d, 0xe0, 0x60,
    0x19, 0x64, 0x50, 0x76, 0x69, 0xd6, 0xc5, 0x79,
};

static const char HMAC_EXAMPLE_MESSAGE[] = "hichain hmac message example";
static const uint8_t HMAC_EXAMPLE_KEY[TEST_HMAC_KEY_LEN] = {
    0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
    0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
    0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
    0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef,
};
static const uint8_t HMAC_EXAMPLE_RESULT[HMAC_LEN] = {
    0x99, 0xbe, 0xaf, 0x20, 0x84, 0xeb, 0xae, 0x5d,
    0xc4, 0x1d, 0x62, 0x19, 0xcb, 0x52, 0xe1, 0x43,
    0xa1, 0xf3, 0x74, 0xf8, 0x33, 0x61, 0xe0, 0x82,
    0x61, 0xfe, 0x19, 0x09, 0x1f, 0xac, 0x9d, 0xb9,
};

// Hashing type: SHA-256
static const char HKDF_EXAMPLE_MESSAGE[] = "hello hichain";
static const uint8_t HKDF_EXAMPLE_SALT[] = {
    0x01, 0x23, 0x45, 0x67, 0x89,
};
static const char HKDF_EXAMPLE_INFO[] = "hichain hkdf info";
static const uint8_t HKDF_EXAMPLE_RESULT_KEY[] = {
    0x4e, 0xc8, 0xf7, 0x6a, 0x03, 0xe9, 0x18, 0xbf,
    0xaa, 0xaa, 0x22, 0xc1, 0xd7, 0x7e, 0x0a, 0xa8,
};

static const char hkdfCaseNameIsoSessionKeyDeriveReturnKey[] =
    "iso sessionkey derive returnkey";
static const char hkdfCaseNamePakeSessionKeyDeriveReturnKey[] =
    "pake sessionkey derive returnkey";
static const char hkdfCaseNameIsoPskDeriveSessionKey[] =
    "iso psk derive sessionkey";
static const char hkdfCaseNameNewPakePskDeriveSecret[] =
    "new pake psk derive secret";
static const char hkdfCaseNameNewPakeSharedSecretDeriveSessionKey[] =
    "new pake sharedSecret derive sessionkey";
static const char hkdfCaseNamePakePskDeriveSecretIsAliasFalse[] =
    "pake psk derive secret isAlias false";
static const char hkdfCaseNamePakeSharedSecretDeriveUnionKey[] =
    "pake sharedSecret derive unionkey";

enum {
    HKDF_OUT_KEY_LENGTH_RANGE_16 = 16,
    HKDF_OUT_KEY_LENGTH_RANGE_32 = 32,
    HKDF_OUT_KEY_LENGTH_RANGE_64 = 64,
    HKDF_OUT_KEY_LENGTH_RANGE_128 = 128,
    HKDF_OUT_KEY_LENGTH_RANGE_256 = 256,
    HKDF_OUT_KEY_LENGTH_RANGE_512 = 512,
    HKDF_OUT_KEY_LENGTH_RANGE_1024 = 1024,

    HKDF_CASE_PAKE_SHARED_SECRET_DERIVE_UNION_KEY_BASE_KEY_LENGTH_ED25519 = 32,
    HKDF_CASE_PAKE_SHARED_SECRET_DERIVE_UNION_KEY_BASE_KEY_LENGTH_P256 = 64,
};

static const struct HkdfTestCase {
    const char *caseName;
    uint32_t baseKeyLength;
    uint32_t saltLength;
    const char *keyInfo;
    uint32_t outKeyLength;
} g_hkdfTestCase[] = {
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_16,
    },
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_32,
    },
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_64,
    },
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_128,
    },
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_256,
    },
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_512,
    },
    {
        .caseName = hkdfCaseNameIsoSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = GENERATE_RETURN_KEY_STR,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_1024,
    },

    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_16,
    },
    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_32,
    },
    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_64,
    },
    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_128,
    },
    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_256,
    },
    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_512,
    },
    {
        .caseName = hkdfCaseNamePakeSessionKeyDeriveReturnKey,
        .baseKeyLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_SESSIONKEY_DERIVE_RETURNKEY_SALT_LEN,
        .keyInfo = HICHAIN_RETURN_KEY,
        .outKeyLength = HKDF_OUT_KEY_LENGTH_RANGE_1024,
    },

    {
        .caseName = hkdfCaseNameIsoPskDeriveSessionKey,
        .baseKeyLength = HKDF_ISO_PSK_DERIVE_SESSIONKEY_BASEKEY_LEN,
        .saltLength = HKDF_ISO_PSK_DERIVE_SESSIONKEY_SALT_LEN,
        .keyInfo = GENERATE_SESSION_KEY_STR,
        .outKeyLength = HKDF_ISO_PSK_DERIVE_SESSIONKEY_OUTKEY_LEN,
    },

    {
        .caseName = hkdfCaseNameNewPakePskDeriveSecret,
        .baseKeyLength = HKDF_NEW_PAKE_PSK_DERIVE_SECRET_BASEKEY_LEN,
        .saltLength = HKDF_NEW_PAKE_PSK_DERIVE_SECRET_SALT_LEN,
        .keyInfo = HICHAIN_SPEKE_BASE_INFO,
        .outKeyLength = HKDF_NEW_PAKE_PSK_DERIVE_SECRET_OUTKEY_LEN,
    },

    {
        .caseName = hkdfCaseNameNewPakeSharedSecretDeriveSessionKey,
        .baseKeyLength = HKDF_NEW_PAKE_SHAREDSECRET_DERIVE_SESSIONKEY_BASEKEY_LEN,
        .saltLength = HKDF_NEW_PAKE_SHAREDSECRET_DERIVE_SESSIONKEY_SALT_LEN,
        .keyInfo = HICHAIN_SPEKE_SESSIONKEY_INFO,
        .outKeyLength = HKDF_NEW_PAKE_SHAREDSECRET_DERIVE_SESSIONKEY_OUTKEY_LEN,
    },

    {
        .caseName = hkdfCaseNamePakePskDeriveSecretIsAliasFalse,
        .baseKeyLength = HKDF_PAKE_PSK_DERIVE_SECRET_BASEKEY_LEN,
        .saltLength = HKDF_PAKE_PSK_DERIVE_SECRET_SALT_LEN,
        .keyInfo = HICHAIN_SPEKE_BASE_INFO,
        .outKeyLength = HKDF_PAKE_PSK_DERIVE_SECRET_OUTKEY_LEN,
    },

    {
        .caseName = hkdfCaseNamePakeSharedSecretDeriveUnionKey,
        .baseKeyLength = HKDF_CASE_PAKE_SHARED_SECRET_DERIVE_UNION_KEY_BASE_KEY_LENGTH_ED25519,
        .saltLength = HKDF_PAKE_SHAREDSECRET_DERIVE_UNIONKEY_SALT_LEN,
        .keyInfo = HICHAIN_SPEKE_SESSIONKEY_INFO,
        .outKeyLength = HKDF_PAKE_SHAREDSECRET_DERIVE_UNIONKEY_OUTKEY_LEN,
    },
    {
        .caseName = hkdfCaseNamePakeSharedSecretDeriveUnionKey,
        .baseKeyLength = HKDF_CASE_PAKE_SHARED_SECRET_DERIVE_UNION_KEY_BASE_KEY_LENGTH_P256,
        .saltLength = HKDF_PAKE_SHAREDSECRET_DERIVE_UNIONKEY_SALT_LEN,
        .keyInfo = HICHAIN_SPEKE_SESSIONKEY_INFO,
        .outKeyLength = HKDF_PAKE_SHAREDSECRET_DERIVE_UNIONKEY_OUTKEY_LEN,
    },
};

enum {
    TEST_COMPUTE_HKDF_WITH_KEY_ALIAS_TRUE_KEY_PAIR_KEY_ALIAS_LENGTH = 32,
    TEST_COMPUTE_HKDF_WITH_KEY_ALIAS_TRUE_SHARED_KEY_LENGTH = 32,
    TEST_COMPUTE_HKDF_WITH_KEY_ALIAS_TRUE_AUTH_ID_LENGTH = 32,
};

enum {
    TEST_IMPORT_ASYMMETRIC_KEY_AUTH_ID_LENGTH_32 = 32,
    TEST_IMPORT_ASYMMETRIC_KEY_AUTH_ID_LENGTH_64 = 64,
};

enum {
    TEST_GENERATE_KEY_PAIR_WITH_STORAGE_AUTH_ID_LENGTH = 32,
};

#ifdef __cplusplus
}
#endif

#endif // HC_ALG_TEST_CASE_H