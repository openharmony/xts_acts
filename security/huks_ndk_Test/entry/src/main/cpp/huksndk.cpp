/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "native_huks_api.h"
#include "native_huks_param.h"
#include <string>
#include <cstring>

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_7 7
#define PARAM_8 8
#define SUCCESS 0
#define SIZE_64 64
#define TEST_VALUE (-100)
#define ALIAS "testKey"
#define VERSION ""
#define SEC_INFO_DATA "hi_security_level_info"
#define CHALLENGE_DATA "hi_challenge_data"
#define VERSION_DATA "hi_os_version_data"
#define UDID_DATA "hi_udid_data"
#define SN_DATA "hi_sn_data"
#define DEVICE_ID "test_device_id"

void HUKS_FREE_BLOB(struct OH_Huks_Blob blob)
{
    do {
        if ((blob).data != nullptr) {
            free((blob).data);
            (blob).data = nullptr;
        }
        (blob).size = 0;
    } while (0);
}

static napi_value OHHuksGetSdkVersion(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    struct OH_Huks_Blob *gkeyAlias = (struct OH_Huks_Blob *)malloc(sizeof(struct OH_Huks_Blob));
    if (gkeyAlias != nullptr) {
        gkeyAlias->data = (uint8_t *)malloc(sizeof(uint8_t));
    }
    struct OH_Huks_Result resultSt = OH_Huks_GetSdkVersion(gkeyAlias);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetSdkVersionErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Blob *gkeyAlias = new OH_Huks_Blob{};
    struct OH_Huks_Result resultSt = OH_Huks_GetSdkVersion(gkeyAlias);
    if (resultSt.errorCode != OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

struct OH_Huks_Param tmpParams[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
    {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
};

static napi_value OHHuksGenerateKeyItem(napi_env env, napi_callback_info info)
{
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS), (uint8_t *)ALIAS};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
    }

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    struct OH_Huks_Result resultSt = OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static struct OH_Huks_ParamSet *g_paramSetNullptr = nullptr;
static struct OH_Huks_Param *g_paramNullptr = nullptr;
static struct OH_Huks_Blob *g_blobNullptr = nullptr;
static struct OH_Huks_CertChain *g_certChainNullptr = nullptr;

static napi_value OHHuksGenerateKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_GenerateKeyItem(g_blobNullptr, g_paramSetNullptr, g_paramSetNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param *params, uint32_t paramcount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramcount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    return ret;
}

static struct OH_Huks_Param g_genParams041[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE,
     .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096},
    {.tag = OH_HUKS_TAG_PADDING,
     .uint32Param = OH_HUKS_PADDING_OAEP},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA384},
    {.tag = OH_HUKS_TAG_BLOCK_MODE,
     .uint32Param = OH_HUKS_MODE_ECB}};

static napi_value OHHuksExportPublicKeyItem(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    struct OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), (uint8_t *)tmpKeyAlias};
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams041, sizeof(g_genParams041) / sizeof(OH_Huks_Param));
    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    struct OH_Huks_Result resultSt = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksExportPublicKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_ExportPublicKeyItem(g_blobNullptr, g_paramSetNullptr, g_blobNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static struct OH_Huks_Param g_encryptParams041[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE,
     .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096},
    {.tag = OH_HUKS_TAG_PADDING,
     .uint32Param = OH_HUKS_PADDING_OAEP},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA384},
    {.tag = OH_HUKS_TAG_BLOCK_MODE,
     .uint32Param = OH_HUKS_MODE_ECB}};

static napi_value OHHuksImportKeyItem(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    struct OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), (uint8_t *)tmpKeyAlias};
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams041, sizeof(g_genParams041) / sizeof(OH_Huks_Param));
    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    ret = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = sizeof(tmpKey), .data = (uint8_t *)tmpKey};
    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    ret = InitParamSet(&encryptParamSet, g_encryptParams041, sizeof(g_encryptParams041) / sizeof(OH_Huks_Param));

    struct OH_Huks_Result resultSt = OH_Huks_ImportKeyItem(&newKeyAlias, encryptParamSet, &publicKey);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksImportKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_ImportKeyItem(g_blobNullptr, g_paramSetNullptr, g_blobNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksDeleteKeyItem(napi_env env, napi_callback_info info)
{
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS), (uint8_t *)ALIAS};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
    }

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_Result resultSt = OH_Huks_DeleteKeyItem(&gkeyAlias, nullptr);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksDeleteKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_DeleteKeyItem(g_blobNullptr, g_paramSetNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsKeyItemExist(napi_env env, napi_callback_info info)
{
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS), (uint8_t *)ALIAS};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
    }

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_Result resultSt = OH_Huks_IsKeyItemExist(&gkeyAlias, paramSet);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsKeyItemExistErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_IsKeyItemExist(g_blobNullptr, g_paramSetNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static const uint32_t DERIVE_KEY_SIZE_32 = 32;
static struct OH_Huks_Param g_hkdfParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_HKDF},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_DERIVE_KEY_SIZE,
     .uint32Param = DERIVE_KEY_SIZE_32}};

static napi_value OHHuksInitSession(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    struct OH_Huks_ParamSet *hkdfParamSet = nullptr;
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS), (uint8_t *)ALIAS};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
    }
    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    ret = InitParamSet(&hkdfParamSet, g_hkdfParams001, sizeof(g_hkdfParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Result resultSt = OH_Huks_InitSession(&gkeyAlias, hkdfParamSet, &handleDerive, nullptr);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksInitSessionErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_InitSession(g_blobNullptr,
                                                         g_paramSetNullptr, g_blobNullptr, g_blobNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

OH_Huks_Result TestGenerateKey(const struct OH_Huks_Blob *keyAlias)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        return ret;
    }

    ret = OH_Huks_GenerateKeyItem(keyAlias, paramSet, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    return ret;
}

static struct OH_Huks_Blob g_secInfo = {sizeof(SEC_INFO_DATA), (uint8_t *)SEC_INFO_DATA};
static struct OH_Huks_Blob g_challenge = {sizeof(CHALLENGE_DATA), (uint8_t *)CHALLENGE_DATA};
static struct OH_Huks_Blob g_version = {sizeof(VERSION_DATA), (uint8_t *)VERSION_DATA};
static const struct OH_Huks_Blob gkeyAlias = {sizeof("testAttestKeyItem"), (uint8_t *)"testAttestKeyItem"};
static uint32_t g_size = 4096;

static const struct OH_Huks_Param g_commonParams[] = {
    {.tag = OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, .blob = g_secInfo},
    {.tag = OH_HUKS_TAG_ATTESTATION_CHALLENGE, .blob = g_challenge},
    {.tag = OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO, .blob = g_version},
    {.tag = OH_HUKS_TAG_ATTESTATION_ID_ALIAS, .blob = gkeyAlias},
};

OH_Huks_Result GenerateParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param tmpParams[],
                                uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, tmpParams, paramCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    return ret;
}

void *HksMalloc(size_t size)
{
    void *ptr = nullptr;
    if (size <= (size_t)PARAM_0) {
        return static_cast<void *>(ptr);
    }
    return malloc(size);
}

void HksFree(void *ptr)
{
    free(ptr);
}

void FreeCertChain(struct OH_Huks_CertChain **certChain, const uint32_t pos)
{
    if (certChain == nullptr || *certChain == nullptr) {
        return;
    }

    if ((*certChain)->certs == nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
        return;
    }
    for (uint32_t j = 0; j < pos; j++) {
        if ((*certChain)->certs[j].data != nullptr) {
            HksFree((*certChain)->certs[j].data);
            (*certChain)->certs[j].data = nullptr;
        }
    }

    if ((*certChain)->certs != nullptr) {
        HksFree((*certChain)->certs);
        (*certChain)->certs = nullptr;
    }

    if (*certChain != nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
    }
}
struct HksTestCertChain {
    bool certChainExist;
    bool certCountValid;
    bool certDataExist;
    uint32_t certDataSize;
};
static uint32_t CERT_COUNT = 4;

int32_t ConstructDataToCertChain(struct OH_Huks_CertChain **certChain,
                                 const struct HksTestCertChain *certChainParam)
{
    if (!certChainParam->certChainExist) {
        return PARAM_0;
    }
    *certChain = (struct OH_Huks_CertChain *)HksMalloc(sizeof(struct OH_Huks_CertChain));
    if (*certChain == nullptr) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    if (!certChainParam->certCountValid) {
        (*certChain)->certsCount = PARAM_0;
        (*certChain)->certs = nullptr;
        return PARAM_0;
    }
    (*certChain)->certsCount = CERT_COUNT;
    if (!certChainParam->certDataExist) {
        (*certChain)->certs = nullptr;
        return PARAM_0;
    }
    (*certChain)->certs = (struct OH_Huks_Blob *)HksMalloc(sizeof(struct OH_Huks_Blob) * ((*certChain)->certsCount));
    if ((*certChain)->certs == nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
    }
    for (uint32_t i = PARAM_0; i < (*certChain)->certsCount; i++) {
        (*certChain)->certs[i].size = certChainParam->certDataSize;
        (*certChain)->certs[i].data = (uint8_t *)HksMalloc((*certChain)->certs[i].size);
        if ((*certChain)->certs[i].data == nullptr) {
            FreeCertChain(certChain, i);
            return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        }
        memset((*certChain)->certs[i].data, certChainParam->certDataSize, certChainParam->certDataSize);
    }
    return PARAM_0;
}

static napi_value OHHuksAttestKeyItem(napi_env env, napi_callback_info info)
{
    TestGenerateKey(&gkeyAlias);
    struct OH_Huks_ParamSet *paramSet = nullptr;
    GenerateParamSet(&paramSet, g_commonParams, sizeof(g_commonParams) / sizeof(g_commonParams[PARAM_0]));
    OH_Huks_CertChain *certChain = nullptr;
    const struct HksTestCertChain certParam = {true, true, true, g_size};
    (void)ConstructDataToCertChain(&certChain, &certParam);
    struct OH_Huks_Result resultSt = OH_Huks_AttestKeyItem(&gkeyAlias, paramSet, certChain);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_ERR_CODE_PERMISSION_FAIL) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAttestKeyItemErr(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result resultSt = OH_Huks_AttestKeyItem(g_blobNullptr, g_paramSetNullptr, g_certChainNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksInitParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result resultSt = OH_Huks_InitParamSet(&paramSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksInitParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_InitParamSet(nullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAddParams(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAddParamsErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_AddParams(g_paramSetNullptr, g_paramNullptr, 0);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksBuildParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    OH_Huks_Result resultSt = OH_Huks_BuildParamSet(&paramSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksBuildParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_BuildParamSet(nullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreeParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    OH_Huks_Result resultSt;
    resultSt.errorCode = TEST_VALUE;
    if (ret.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        resultSt = OH_Huks_BuildParamSet(&paramSet);
    }
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS && resultSt.errorCode != TEST_VALUE) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetValid(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_IsParamSetValid(paramSet, paramSet->paramSetSize);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetValidErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_IsParamSetValid(g_paramSetNullptr, 0);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetTagValid(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_IsParamSetTagValid(paramSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetTagValidErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_IsParamSetTagValid(g_paramSetNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCheckParamMatch(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Param baseParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    struct OH_Huks_Param otherParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    OH_Huks_Result resultSt = OH_Huks_CheckParamMatch(&baseParam, &otherParam);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCheckParamMatchErr(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Param baseParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    struct OH_Huks_Param otherParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)2};
    OH_Huks_Result resultSt = OH_Huks_CheckParamMatch(&baseParam, &otherParam);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreshParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_FreshParamSet(paramSet, true);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreshParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_FreshParamSet(nullptr, 0);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static const uint32_t DSA_COMMON_SIZE = 1024;
static struct OH_Huks_Param g_genParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_KEY_SIZE,
     .uint32Param = DSA_COMMON_SIZE},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA1}};

static struct OH_Huks_Param g_signParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA1}};

static napi_value OHHuksGetParam(napi_env env, napi_callback_info info)
{
    const char keyAliasString[] = "HksDSASignVerifyKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = {sizeof(keyAliasString), (uint8_t *)keyAliasString};
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParamsTest001,
        sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    ret = InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    ret = OH_Huks_InitSession(&keyAlias, signParamSet, &handle, nullptr);
    struct OH_Huks_Param *tmpParam = NULL;
    OH_Huks_Result resultSt = OH_Huks_GetParam(signParamSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetParamErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_GetParam(g_paramSetNullptr, 0, &g_paramNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCopyParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_ParamSet *paramSetTo = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_BuildParamSet(&paramSet);

    OH_Huks_Result resultSt = OH_Huks_CopyParamSet(paramSet, paramSet->paramSetSize, &paramSetTo);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCopyParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_CopyParamSet(g_paramSetNullptr, 0, &g_paramSetNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksUpdateSessionErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_UpdateSession(g_blobNullptr, g_paramSetNullptr, g_blobNullptr, g_blobNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFinishSessionErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_FinishSession(g_blobNullptr, g_paramSetNullptr, g_blobNullptr, g_blobNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAbortSessionErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_AbortSession(g_blobNullptr, g_paramSetNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static uint8_t g_saltgen[16] = {
    0x14, 0x10, 0x11, 0x3a, 0x27, 0x9e, 0xc8, 0x5f, 0xe0, 0xf3, 0x36, 0x17, 0x57, 0x42, 0x8e, 0xff};
static const uint32_t DERIVE_ITERATION = 1000;
static const uint32_t COMMON_SIZE = 2048;

static struct OH_Huks_Param g_genParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_SIZE,
     .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_ITERATION,
     .uint32Param = 1000},
    {.tag = OH_HUKS_TAG_SALT,
     .blob = {
         sizeof(g_saltgen),
         (uint8_t *)g_saltgen}}};

static struct OH_Huks_Param g_pbkdf2Params001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM,
     .uint32Param = OH_HUKS_ALG_PBKDF2},
    {.tag = OH_HUKS_TAG_PURPOSE,
     .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST,
     .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_SIZE,
     .uint32Param = 256},
    {.tag = OH_HUKS_TAG_ITERATION,
     .int32Param = DERIVE_ITERATION},
    {.tag = OH_HUKS_TAG_SALT,
     .blob = {
         sizeof(g_saltgen),
         (uint8_t *)g_saltgen}},
    {.tag = OH_HUKS_TAG_DERIVE_KEY_SIZE, .uint32Param = DERIVE_KEY_SIZE_32}};

static struct OH_Huks_Param g_pbkdf2FinishParams001[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG,
     .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_KEY_ALIAS,
     .blob = {
         sizeof("HksPBKDF2DeriveKeyAliasTest001_2"),
         (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_2"}},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 256},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}};

static napi_value OHHuksUpdateSession(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob keyAlias = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                    (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1"};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    ret = InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {
        sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
        (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1"};

    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    ret = OH_Huks_InitSession(&keyAlias, pbkdf2ParamSet, &handleDerive, nullptr);

    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    OH_Huks_Result resultSt = OH_Huks_UpdateSession(&handleDerive, pbkdf2ParamSet, &inData, &outData);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFinishSession(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob keyAlias = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                    (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1"};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    struct OH_Huks_ParamSet *pbkdf2FinishParamSet = nullptr;
    ret = InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    ret = InitParamSet(&pbkdf2FinishParamSet, g_pbkdf2FinishParams001,
        sizeof(g_pbkdf2FinishParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {
        sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
        (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1"};

    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    ret = OH_Huks_InitSession(&keyAlias, pbkdf2ParamSet, &handleDerive, nullptr);

    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    ret = OH_Huks_UpdateSession(&handleDerive, pbkdf2ParamSet, &inData, &outData);

    uint8_t outDataD[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataDerive = {COMMON_SIZE, outDataD};
    OH_Huks_Result resultSt = OH_Huks_FinishSession(&handleDerive, pbkdf2FinishParamSet, &inData, &outDataDerive);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAbortSession(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Blob keyAlias = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                    (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1"};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    struct OH_Huks_ParamSet *pbkdf2FinishParamSet = nullptr;
    ret = InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    ret = InitParamSet(&pbkdf2FinishParamSet, g_pbkdf2FinishParams001,
        sizeof(g_pbkdf2FinishParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {
        sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
        (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1"};

    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    ret = OH_Huks_InitSession(&keyAlias, pbkdf2ParamSet, &handleDerive, nullptr);

    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    ret = OH_Huks_UpdateSession(&handleDerive, pbkdf2ParamSet, &inData, &outData);

    OH_Huks_Result resultSt = OH_Huks_AbortSession(&handleDerive, pbkdf2ParamSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetKeyItemParamSet(napi_env env, napi_callback_info info)
{
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS), (uint8_t *)ALIAS};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
    }
    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_ParamSet *paramSetOut = nullptr;
    ret = OH_Huks_InitParamSet(&paramSetOut);
    ret = OH_Huks_BuildParamSet(&paramSetOut);
    paramSetOut->paramSetSize = COMMON_SIZE;
    struct OH_Huks_Result resultSt = OH_Huks_GetKeyItemParamSet(&gkeyAlias, nullptr, paramSetOut);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetKeyItemParamSetErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_GetKeyItemParamSet(nullptr, nullptr, nullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

struct HksImportWrappedKeyTestParams {
    struct OH_Huks_Blob *wrappingKeyAlias;
    struct OH_Huks_ParamSet *genWrappingKeyParamSet;
    uint32_t publicKeySize;

    struct OH_Huks_Blob *callerKeyAlias;
    struct OH_Huks_ParamSet *genCallerKeyParamSet;

    struct OH_Huks_Blob *callerKekAlias;
    struct OH_Huks_Blob *callerKek;
    struct OH_Huks_ParamSet *importCallerKekParamSet;

    struct OH_Huks_Blob *callerAgreeKeyAlias;
    struct OH_Huks_ParamSet *agreeParamSet;

    struct OH_Huks_ParamSet *importWrappedKeyParamSet;
    struct OH_Huks_Blob *importedKeyAlias;
    struct OH_Huks_Blob *importedPlainKey;
    uint32_t keyMaterialLen;
};

static const uint32_t IV_SIZE = 16;
OH_Huks_Result MallocAndCheckBlobData(
    struct OH_Huks_Blob *blob,
    const uint32_t blobSize)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    blob->data = (uint8_t *)HksMalloc(blobSize);
    if (blob->data == NULL) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }

    return ret;
}

static const uint32_t WRAPPED_KEY_IV_SIZE = 16;
static uint8_t WRAPPED_KEY_IV[IV_SIZE] = "bababababababab";

static const uint32_t AAD_SIZE = 16;
static uint8_t AAD[AAD_SIZE] = "abababababababa";

static const uint32_t NONCE_SIZE = 12;
static uint8_t NONCE[NONCE_SIZE] = "hahahahahah";

static const uint32_t AEAD_TAG_SIZE = 16;

static struct OH_Huks_Blob g_wrappingKeyAliasAes256 = {
    .size = (uint32_t)strlen("test_wrappingKey_x25519_aes256"),
    .data = (uint8_t *)"test_wrappingKey_x25519_aes256"};

static struct OH_Huks_Blob g_callerKeyAliasAes256 = {
    .size = (uint32_t)strlen("test_caller_key_x25519_aes256"),
    .data = (uint8_t *)"test_caller_key_x25519_aes256"};

static struct OH_Huks_Blob g_callerKekAliasAes256 = {
    .size = (uint32_t)strlen("test_caller_kek_x25519_aes256"),
    .data = (uint8_t *)"test_caller_kek_x25519_aes256"};

static struct OH_Huks_Blob g_callerAes256Kek = {
    .size = (uint32_t)strlen("This is kek to encrypt plain key"),
    .data = (uint8_t *)"This is kek to encrypt plain key"};

static struct OH_Huks_Blob g_callerAgreeKeyAliasAes256 = {
    .size = (uint32_t)strlen("test_caller_agree_key_x25519_aes256"),
    .data = (uint8_t *)"test_caller_agree_key_x25519_aes256"};

static struct OH_Huks_Blob g_importedKeyAliasAes256 = {
    .size = (uint32_t)strlen("test_import_key_x25519_aes256"),
    .data = (uint8_t *)"test_import_key_x25519_aes256"};

static struct OH_Huks_Blob g_importedAes256PlainKey = {
    .size = (uint32_t)strlen("This is plain key to be imported"),
    .data = (uint8_t *)"This is plain key to be imported"};

static struct OH_Huks_Param g_importWrappedAes256Params[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING},
    {.tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = {.size = AAD_SIZE, .data = (uint8_t *)AAD}},
    {.tag = OH_HUKS_TAG_NONCE, .blob = {.size = NONCE_SIZE, .data = (uint8_t *)NONCE}}};

static const uint32_t g_x25519PubKeySize = 32;

static struct OH_Huks_Param g_genWrappingKeyParams[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256}};

static struct OH_Huks_Param g_genCallerX25519Params[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256}};

static struct OH_Huks_Param g_importParamsCallerKek[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_IV, .blob = {.size = WRAPPED_KEY_IV_SIZE, .data = (uint8_t *)WRAPPED_KEY_IV}}};

static struct OH_Huks_Param g_callerAgreeParams[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256}};

static struct OH_Huks_Param g_aesKekEncryptParams[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = {.size = AAD_SIZE, .data = (uint8_t *)AAD}},
    {.tag = OH_HUKS_TAG_NONCE, .blob = {.size = NONCE_SIZE, .data = (uint8_t *)NONCE}}};

static struct OH_Huks_Param g_importAgreeKeyParams[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_IV, .blob = {.size = IV_SIZE, .data = (uint8_t *)WRAPPED_KEY_IV}}};

OH_Huks_Result HuksAgreeKey(const struct OH_Huks_ParamSet *paramSet, const struct OH_Huks_Blob *keyAlias,
                            const struct OH_Huks_Blob *peerPublicKey, struct OH_Huks_Blob *agreedKey)
{
    uint8_t temp[10] = {0};
    struct OH_Huks_Blob inData = {
        sizeof(temp),
        temp};

    uint8_t handleU[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), handleU};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint8_t outDataU[1024] = {0};
    struct OH_Huks_Blob outDataUpdate = {1024, outDataU};
    ret = OH_Huks_UpdateSession(&handle, paramSet, peerPublicKey, &outDataUpdate);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(&handle, paramSet, &inData, agreedKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

static const uint32_t TIMES = 4;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE * TIMES;

static OH_Huks_Result HkUpd(const struct OH_Huks_Blob *handle,
    const struct OH_Huks_ParamSet *paramSet,
    const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {MAX_OUTDATA_SIZE, NULL};
    uint8_t *cur = outData->data;
    outData->size = 0;
    inDataSeg.size = MAX_UPDATE_SIZE;
    bool isFinished = false;
    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            free(outDataSeg.data);
            return ret;
        }
        std::copy(outDataSeg.data, outDataSeg.data + outDataSeg.size, cur);
        cur += outDataSeg.size;
        outData->size += outDataSeg.size;
        free(outDataSeg.data);
        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }
    struct OH_Huks_Blob outDataFinish = {inDataSeg.size * TIMES, NULL};
    if (MallocAndCheckBlobData(&outDataFinish, outDataFinish.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    ret = OH_Huks_FinishSession(handle, paramSet, &inDataSeg, &outDataFinish);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        free(outDataFinish.data);
        return ret;
    }
    std::copy(outDataFinish.data, outDataFinish.data + outDataFinish.size, cur);
    outData->size += outDataFinish.size;
    free(outDataFinish.data);
    return ret;
}

OH_Huks_Result HuksEncrypt(const struct OH_Huks_Blob *key, const struct OH_Huks_ParamSet *paramSet,
                           const struct OH_Huks_Blob *plainText, struct OH_Huks_Blob *cipherText)
{
    uint8_t handle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleBlob = {sizeof(uint64_t), handle};
    OH_Huks_Result ret = OH_Huks_InitSession(key, paramSet, &handleBlob, nullptr);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = HkUpd(&handleBlob, paramSet, plainText, cipherText);
    return ret;
}

static OH_Huks_Result BuildWrappedKeyData(struct OH_Huks_Blob **blobArray, uint32_t size, struct OH_Huks_Blob *outData)
{
    uint32_t totalLength = size * sizeof(uint32_t);
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    for (uint32_t i = 0; i < size; ++i) {
        totalLength += blobArray[i]->size;
    }

    struct OH_Huks_Blob outBlob = {0, nullptr};
    outBlob.size = totalLength;
    ret = MallocAndCheckBlobData(&outBlob, outBlob.size);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }

    uint32_t offset = 0;

    for (uint32_t i = 0; i < size; ++i) {
        if (totalLength - offset >= sizeof(blobArray[i]->size)) {
            std::copy(reinterpret_cast<uint8_t *>(&blobArray[i]->size),
                      reinterpret_cast<uint8_t *>(&blobArray[i]->size) + sizeof(blobArray[i]->size),
                      outBlob.data + offset);
        } else {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }

        offset += sizeof(blobArray[i]->size);

        if (totalLength - offset >= blobArray[i]->size) {
            std::copy(blobArray[i]->data, blobArray[i]->data + blobArray[i]->size, outBlob.data + offset);
        } else {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }

        offset += blobArray[i]->size;
    }

    outData->size = outBlob.size;
    outData->data = outBlob.data;
    return ret;
}

static OH_Huks_Result CheckParamsValid(const struct HksImportWrappedKeyTestParams *params)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    if (params == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (params->wrappingKeyAlias == nullptr || params->genWrappingKeyParamSet == nullptr ||
        params->callerKeyAlias == nullptr ||
        params->genCallerKeyParamSet == nullptr || params->callerKekAlias == nullptr ||
        params->callerKek == nullptr || params->importCallerKekParamSet == nullptr ||
        params->callerAgreeKeyAlias == nullptr || params->agreeParamSet == nullptr ||
        params->importWrappedKeyParamSet == nullptr || params->importedKeyAlias == nullptr ||
        params->importedPlainKey == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    return ret;
}

static OH_Huks_Result GenerateAndExportHuksPublicKey(const struct HksImportWrappedKeyTestParams *params,
                                                     struct OH_Huks_Blob *huksPublicKey)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(params->wrappingKeyAlias, params->genWrappingKeyParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    huksPublicKey->size = params->publicKeySize;
    ret = MallocAndCheckBlobData(huksPublicKey, huksPublicKey->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ExportPublicKeyItem(params->wrappingKeyAlias, nullptr, huksPublicKey);
    return ret;
}

static OH_Huks_Result GenerateAndExportCallerPublicKey(const struct HksImportWrappedKeyTestParams *params,
                                                       struct OH_Huks_Blob *callerSelfPublicKey)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(params->callerKeyAlias, params->genCallerKeyParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    callerSelfPublicKey->size = params->publicKeySize;
    ret = MallocAndCheckBlobData(callerSelfPublicKey, callerSelfPublicKey->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ExportPublicKeyItem(params->callerKeyAlias, params->genWrappingKeyParamSet, callerSelfPublicKey);
    return ret;
}

static OH_Huks_Result ImportKekAndAgreeSharedSecret(const struct HksImportWrappedKeyTestParams *params,
                                                    const struct OH_Huks_Blob *huksPublicKey,
                                                    struct OH_Huks_Blob *outSharedKey)
{
    OH_Huks_Result ret = OH_Huks_ImportKeyItem(params->callerKekAlias,
                                               params->importCallerKekParamSet, params->callerKek);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = MallocAndCheckBlobData(outSharedKey, outSharedKey->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = HuksAgreeKey(params->agreeParamSet, params->callerKeyAlias, huksPublicKey, outSharedKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    struct OH_Huks_ParamSet *importAgreeKeyParams = nullptr;
    ret = InitParamSet(&importAgreeKeyParams, g_importAgreeKeyParams,
                       sizeof(g_importAgreeKeyParams) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ImportKeyItem(params->callerAgreeKeyAlias, importAgreeKeyParams, outSharedKey);

    OH_Huks_FreeParamSet(&importAgreeKeyParams);
    return ret;
}

static OH_Huks_Result EncryptImportedPlainKeyAndKek(const struct HksImportWrappedKeyTestParams *params,
                                                    struct OH_Huks_Blob *plainCipherText,
                                                    struct OH_Huks_Blob *kekCipherText)
{
    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&encryptParamSet, g_aesKekEncryptParams,
                                      sizeof(g_aesKekEncryptParams) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = HuksEncrypt(params->callerKekAlias, encryptParamSet, params->importedPlainKey,
        plainCipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = HuksEncrypt(params->callerAgreeKeyAlias, encryptParamSet, params->callerKek, kekCipherText);
    OH_Huks_FreeParamSet(&encryptParamSet);
    return ret;
}

static OH_Huks_Result ImportWrappedKey(const struct HksImportWrappedKeyTestParams *params,
                                       struct OH_Huks_Blob *plainCipher, struct OH_Huks_Blob *kekCipherText,
                                       struct OH_Huks_Blob *peerPublicKey, struct OH_Huks_Blob *wrappedKeyData)
{
    struct OH_Huks_Blob commonAad = {.size = AAD_SIZE,
                                     .data = reinterpret_cast<uint8_t *>(AAD)};
    struct OH_Huks_Blob commonNonce = {.size = NONCE_SIZE,
                                       .data = reinterpret_cast<uint8_t *>(NONCE)};
    struct OH_Huks_Blob keyMaterialLen = {.size = sizeof(uint32_t), .data = (uint8_t *)&params->keyMaterialLen};

    const uint32_t tagSize = AEAD_TAG_SIZE;
    uint8_t kekTagBuf[tagSize] = {0};
    struct OH_Huks_Blob kekTag = {.size = tagSize, .data = kekTagBuf};

    std::copy(plainCipher->data + (plainCipher->size - tagSize),
        plainCipher->data + (plainCipher->size - tagSize) + tagSize, kekTag.data);

    plainCipher->size -= tagSize;

    uint8_t agreeKeyTagBuf[tagSize] = {0};
    struct OH_Huks_Blob agreeKeyTag = {.size = tagSize, .data = agreeKeyTagBuf};
    std::copy(kekCipherText->data + (kekCipherText->size - tagSize),
              kekCipherText->data + (kekCipherText->size - tagSize) + tagSize, agreeKeyTagBuf);

    kekCipherText->size -= tagSize;

    struct OH_Huks_Blob *blobArray[] = {peerPublicKey, &commonAad, &commonNonce, &agreeKeyTag, kekCipherText,
                                        &commonAad, &commonNonce, &kekTag, &keyMaterialLen, plainCipher};
    OH_Huks_Result ret = BuildWrappedKeyData(blobArray, OH_HUKS_IMPORT_WRAPPED_KEY_TOTAL_BLOBS, wrappedKeyData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    struct OH_Huks_Param *purpose = nullptr;
    ret = OH_Huks_GetParam(params->importWrappedKeyParamSet, OH_HUKS_TAG_PURPOSE, &purpose);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ImportWrappedKeyItem(params->importedKeyAlias, params->wrappingKeyAlias,
                                       params->importWrappedKeyParamSet, wrappedKeyData);

    return ret;
}

uint32_t OH_HUKS_KEY_BYTES(int keySize)
{
    return (((keySize) + PARAM_7) / PARAM_8);
}

OH_Huks_Result HksImportWrappedKeyTestCommonCase(const struct HksImportWrappedKeyTestParams *params)
{
    OH_Huks_Result ret = CheckParamsValid(params);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Blob huksPublicKey = {0, nullptr};
    struct OH_Huks_Blob callerSelfPublicKey = {0, nullptr};
    struct OH_Huks_Blob outSharedKey = {.size = OH_HUKS_KEY_BYTES(OH_HUKS_AES_KEY_SIZE_256), .data = nullptr};
    struct OH_Huks_Blob wrappedKeyData = {0, nullptr};
    uint8_t plainKeyCipherBuffer[OH_HUKS_MAX_KEY_SIZE] = {0};
    struct OH_Huks_Blob plainCipherText = {OH_HUKS_MAX_KEY_SIZE, plainKeyCipherBuffer};
    uint8_t kekCipherTextBuffer[OH_HUKS_MAX_KEY_SIZE] = {0};
    struct OH_Huks_Blob kekCipherText = {OH_HUKS_MAX_KEY_SIZE, kekCipherTextBuffer};
    do {
        ret = GenerateAndExportCallerPublicKey(params, &callerSelfPublicKey);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = GenerateAndExportHuksPublicKey(params, &huksPublicKey);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = ImportKekAndAgreeSharedSecret(params, &huksPublicKey, &outSharedKey);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = EncryptImportedPlainKeyAndKek(params, &plainCipherText, &kekCipherText);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = ImportWrappedKey(params, &plainCipherText, &kekCipherText, &callerSelfPublicKey, &wrappedKeyData);
    } while (0);

    HUKS_FREE_BLOB(huksPublicKey);
    HUKS_FREE_BLOB(callerSelfPublicKey);
    HUKS_FREE_BLOB(outSharedKey);
    HUKS_FREE_BLOB(wrappedKeyData);
    return ret;
}

void HksClearKeysForWrappedKeyTest(const struct HksImportWrappedKeyTestParams *params)
{
    OH_Huks_Result ret = CheckParamsValid(params);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return;
    }
    (void)OH_Huks_DeleteKeyItem(params->wrappingKeyAlias, nullptr);
    (void)OH_Huks_DeleteKeyItem(params->callerKeyAlias, nullptr);
    (void)OH_Huks_DeleteKeyItem(params->callerKekAlias, nullptr);
    (void)OH_Huks_DeleteKeyItem(params->callerAgreeKeyAlias, nullptr);
    (void)OH_Huks_DeleteKeyItem(params->importedKeyAlias, nullptr);
}

static OH_Huks_Result InitCommonTestParamsAndImport(
    struct HksImportWrappedKeyTestParams *importWrappedKeyTestParams,
    const struct OH_Huks_Param *importedKeyParamSetArray,
    uint32_t arraySize)
{
    struct OH_Huks_ParamSet *genX25519KeyParamSet = nullptr;
    struct OH_Huks_ParamSet *genCallerKeyParamSet = nullptr;
    struct OH_Huks_ParamSet *callerImportParamsKek = nullptr;
    struct OH_Huks_ParamSet *agreeParamSet = nullptr;
    struct OH_Huks_ParamSet *importPlainKeyParams = nullptr;

    OH_Huks_Result ret;
    do {
        ret = InitParamSet(&genX25519KeyParamSet, g_genWrappingKeyParams,
                           sizeof(g_genWrappingKeyParams) / sizeof(OH_Huks_Param));
        if (ret.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        importWrappedKeyTestParams->genWrappingKeyParamSet = genX25519KeyParamSet;
        importWrappedKeyTestParams->publicKeySize = g_x25519PubKeySize;

        ret = InitParamSet(&genCallerKeyParamSet, g_genCallerX25519Params,
                           sizeof(g_genCallerX25519Params) / sizeof(OH_Huks_Param));
        if (ret.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        importWrappedKeyTestParams->genCallerKeyParamSet = genCallerKeyParamSet;

        ret = InitParamSet(&callerImportParamsKek, g_importParamsCallerKek,
                           sizeof(g_importParamsCallerKek) / sizeof(OH_Huks_Param));
        if (ret.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        importWrappedKeyTestParams->importCallerKekParamSet = callerImportParamsKek;

        ret = InitParamSet(&agreeParamSet, g_callerAgreeParams,
                           sizeof(g_callerAgreeParams) / sizeof(OH_Huks_Param));
        if (ret.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        importWrappedKeyTestParams->agreeParamSet = agreeParamSet;

        ret = InitParamSet(&importPlainKeyParams, importedKeyParamSetArray, arraySize);
        if (ret.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        importWrappedKeyTestParams->importWrappedKeyParamSet = importPlainKeyParams;

        ret = HksImportWrappedKeyTestCommonCase(importWrappedKeyTestParams);
    } while (0);

    OH_Huks_FreeParamSet(&genX25519KeyParamSet);
    OH_Huks_FreeParamSet(&genCallerKeyParamSet);
    OH_Huks_FreeParamSet(&callerImportParamsKek);
    OH_Huks_FreeParamSet(&agreeParamSet);
    OH_Huks_FreeParamSet(&importPlainKeyParams);
    return ret;
}

static napi_value OHHuksImportWrappedKeyItem(napi_env env, napi_callback_info info)
{
    struct HksImportWrappedKeyTestParams importWrappedKeyTestParams001 = {0};

    importWrappedKeyTestParams001.wrappingKeyAlias = &g_wrappingKeyAliasAes256;
    importWrappedKeyTestParams001.keyMaterialLen = g_importedAes256PlainKey.size;
    importWrappedKeyTestParams001.callerKeyAlias = &g_callerKeyAliasAes256;
    importWrappedKeyTestParams001.callerKekAlias = &g_callerKekAliasAes256;
    importWrappedKeyTestParams001.callerKek = &g_callerAes256Kek;
    importWrappedKeyTestParams001.callerAgreeKeyAlias = &g_callerAgreeKeyAliasAes256;
    importWrappedKeyTestParams001.importedKeyAlias = &g_importedKeyAliasAes256;
    importWrappedKeyTestParams001.importedPlainKey = &g_importedAes256PlainKey;
    OH_Huks_Result ohResult = InitCommonTestParamsAndImport(&importWrappedKeyTestParams001,
        g_importWrappedAes256Params,
        sizeof(g_importWrappedAes256Params) /
       sizeof(struct OH_Huks_Param));
    HksClearKeysForWrappedKeyTest(&importWrappedKeyTestParams001);

    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}

static napi_value OHHuksImportWrappedKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_ImportWrappedKeyItem(nullptr, nullptr, nullptr, nullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHHuksGetSdkVersion", nullptr, OHHuksGetSdkVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetSdkVersionErr", nullptr, OHHuksGetSdkVersionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGenerateKeyItem", nullptr, OHHuksGenerateKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGenerateKeyItemErr", nullptr, OHHuksGenerateKeyItemErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksExportPublicKeyItem", nullptr, OHHuksExportPublicKeyItem, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksExportPublicKeyItemErr", nullptr, OHHuksExportPublicKeyItemErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksImportKeyItem", nullptr, OHHuksImportKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksImportKeyItemErr", nullptr, OHHuksImportKeyItemErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksDeleteKeyItem", nullptr, OHHuksDeleteKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksDeleteKeyItemErr", nullptr, OHHuksDeleteKeyItemErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsKeyItemExist", nullptr, OHHuksIsKeyItemExist, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsKeyItemExistErr", nullptr, OHHuksIsKeyItemExistErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitSession", nullptr, OHHuksInitSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitSessionErr", nullptr, OHHuksInitSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAttestKeyItem", nullptr, OHHuksAttestKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAttestKeyItemErr", nullptr, OHHuksAttestKeyItemErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitParamSet", nullptr, OHHuksInitParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitParamSetErr", nullptr, OHHuksInitParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAddParams", nullptr, OHHuksAddParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAddParamsErr", nullptr, OHHuksAddParamsErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksBuildParamSet", nullptr, OHHuksBuildParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksBuildParamSetErr", nullptr, OHHuksBuildParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFreeParamSet", nullptr, OHHuksFreeParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsParamSetValid", nullptr, OHHuksIsParamSetValid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsParamSetValidErr", nullptr, OHHuksIsParamSetValidErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksIsParamSetTagValid", nullptr, OHHuksIsParamSetTagValid, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksIsParamSetTagValidErr", nullptr, OHHuksIsParamSetTagValidErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksCheckParamMatch", nullptr, OHHuksCheckParamMatch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksCheckParamMatchErr", nullptr, OHHuksCheckParamMatchErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksFreshParamSet", nullptr, OHHuksFreshParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFreshParamSetErr", nullptr, OHHuksFreshParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetParam", nullptr, OHHuksGetParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetParamErr", nullptr, OHHuksGetParamErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksCopyParamSet", nullptr, OHHuksCopyParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksCopyParamSetErr", nullptr, OHHuksCopyParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksUpdateSession", nullptr, OHHuksUpdateSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksUpdateSessionErr", nullptr, OHHuksUpdateSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFinishSession", nullptr, OHHuksFinishSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFinishSessionErr", nullptr, OHHuksFinishSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAbortSession", nullptr, OHHuksAbortSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAbortSessionErr", nullptr, OHHuksAbortSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetKeyItemParamSet", nullptr, OHHuksGetKeyItemParamSet, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksGetKeyItemParamSetErr", nullptr, OHHuksGetKeyItemParamSetErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksImportWrappedKeyItem", nullptr, OHHuksImportWrappedKeyItem, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksImportWrappedKeyItemErr", nullptr, OHHuksImportWrappedKeyItemErr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "huks",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
