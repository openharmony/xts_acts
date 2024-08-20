/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "token_setproc.h"
#include "accesstoken_kit.h"
#include "directory_ex.h"
#include "nativetoken_kit.h"
#include <unistd.h>
#include <memory>
#include "udmf.h"
#include "uds.h"
#include "udmf_err_code.h"
#include "unified_data.h"
#include "unified_record.h"
#include "udmf_capi_common.h"
#include "udmf_client.h"
#include "plain_text.h"
#include "udmf_meta.h"
#include "napi/native_api.h"

using namespace OHOS::Security::AccessToken;
using namespace OHOS::UDMF;

namespace OHOS::Test {
static constexpr int USER_ID = 100;
static constexpr int INST_INDEX = 0;
static constexpr int INDEX = 10;
static constexpr int TWO = 2;

static napi_value AllocHapToken1(napi_env env, napi_callback_info info)
{
    OHOS::Security::AccessToken::HapInfoParams hapInfo = {
        .userID = USER_ID,
        .bundleName = "ohos.test.demo1",
        .instIndex = INST_INDEX,
        .appIDDesc = "ohos.test.demo1"
    };

    HapPolicyParams policy = {
        .apl = APL_NORMAL,
        .domain = "test.domain",
        .permList = {
            {
                .permissionName = "ohos.permission.test",
                .bundleName = "ohos.test.demo1",
                .grantMode = 1,
                .availableLevel = APL_NORMAL,
                .label = "label",
                .labelId = 1,
                .description = "test1",
                .descriptionId = 1
            }
        },
        .permStateList = {
            {
                .permissionName = "ohos.permission.test",
                .isGeneral = true,
                .resDeviceID = { "local" },
                .grantStatus = { PermissionState::PERMISSION_GRANTED },
                .grantFlags = { 1 }
            }
        }
    };
    auto tokenID = AccessTokenKit::AllocHapToken(hapInfo, policy);
    SetSelfTokenID(tokenID.tokenIDEx);
    napi_value Code = 0;
    int32_t Ret = 0;
    napi_create_int32(env, Ret, &Code);
    return Code;
}

static napi_value AllocHapToken2(napi_env env, napi_callback_info info)
{
    OHOS::Security::AccessToken::HapInfoParams hapInfo = {
        .userID = USER_ID,
        .bundleName = "ohos.test.demo2",
        .instIndex = INST_INDEX,
        .appIDDesc = "ohos.test.demo2"
    };

    HapPolicyParams policy = {
        .apl = APL_NORMAL,
        .domain = "test.domain",
        .permList = {
            {
                .permissionName = "ohos.permission.test",
                .bundleName = "ohos.test.demo2",
                .grantMode = 1,
                .availableLevel = APL_NORMAL,
                .label = "label",
                .labelId = 1,
                .description = "test2",
                .descriptionId = 1
            }
        },
        .permStateList = {
            {
                .permissionName = "ohos.permission.test",
                .isGeneral = true,
                .resDeviceID = { "local" },
                .grantStatus = { PermissionState::PERMISSION_GRANTED },
                .grantFlags = { 1 }
            }
        }
    };
    auto tokenID = AccessTokenKit::AllocHapToken(hapInfo, policy);
    SetSelfTokenID(tokenID.tokenIDEx);
    napi_value Code = 0;
    int32_t Ret = 0;
    napi_create_int32(env, Ret, &Code);
    return Code;
}

static napi_value SetHapToken1(napi_env env, napi_callback_info info)
{
    auto tokenId = AccessTokenKit::GetHapTokenID(USER_ID, "ohos.test.demo1", INST_INDEX);
    SetSelfTokenID(tokenId);
    napi_value Code = 0;
    int32_t Ret = 0;
    napi_create_int32(env, Ret, &Code);
    return Code;
}

static napi_value ReleaseHapToken1(napi_env env, napi_callback_info info)
{
    auto tokenId = AccessTokenKit::GetHapTokenID(USER_ID, "ohos.test.demo1", INST_INDEX);
    AccessTokenKit::DeleteToken(tokenId);
    tokenId = AccessTokenKit::GetHapTokenID(USER_ID, "ohos.test.demo2", INST_INDEX);
    AccessTokenKit::DeleteToken(tokenId);
    napi_value Code = 0;
    int32_t Ret = 0;
    napi_create_int32(env, Ret, &Code);
    return Code;
}

static napi_value OH_Udmf_CreateUnifiedData(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    if (unifiedData->unifiedData_ == nullptr || unifiedData == nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}
static napi_value OH_Udmf_AddRecordToUnifiedData(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData *unifiedData = OH_UdmfData_Create();

    int invalidRes1 = OH_UdmfData_AddRecord(nullptr, record);
    if (invalidRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, invalidRes1, &Code);
        return Code;
    }

    OH_UdmfData unifiedData1;
    int invalidRes2 = OH_UdmfData_AddRecord(&unifiedData1, record);
    if (invalidRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, invalidRes2, &Code);
        return Code;
    }

    int invalidRes3 = OH_UdmfData_AddRecord(unifiedData, nullptr);
    if (invalidRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, invalidRes3, &Code);
        return Code;
    }

    OH_UdmfRecord unifiedRecord1;
    int invalidRes4 = OH_UdmfData_AddRecord(unifiedData, nullptr);
    if (invalidRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, invalidRes4, &Code);
        return Code;
    }
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_AddRecordToUnifiedDataTest(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    int32_t status = OH_UdmfData_AddRecord(unifiedData, record);
    if (status != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_HasUnifiedDataType(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    char type[] = "general.plain-text";

    bool status1 = OH_UdmfData_HasType(nullptr, type);
    if (status1 != false) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    bool status2 = OH_UdmfData_HasType(unifiedData, nullptr);
    if (status2 != false) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData unifiedData1;
    bool status3 = OH_UdmfData_HasType(&unifiedData1, nullptr);
    if (status3 != false) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    bool status4 = OH_UdmfData_HasType(nullptr, nullptr);
    if (status4 != false) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_HasUnifiedDataTypeTest(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);

    char type1[] = "general.plain-text";
    int hasType1 = OH_UdmfData_HasType(unifiedData, type1);
    if (hasType1 != 1) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    char type2[] = "general.html";
    int hasType2 = OH_UdmfData_HasType(unifiedData, type2);
    if (hasType2 != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_GetUnifiedDataTypes(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();

    unsigned int count1 = 0;
    char **types1 = OH_UdmfData_GetTypes(nullptr, &count1);
    if (types1 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData data;
    char **types2 = OH_UdmfData_GetTypes(&data, &count1);
    if (types2 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    char **types3 = OH_UdmfData_GetTypes(unifiedData, nullptr);
    if (types3 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_GetUnifiedDataTypesTest(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink = OH_UdsHyperlink_Create();
    OH_UdmfRecord_AddHyperlink(record1, hyperlink);
    OH_UdmfData_AddRecord(unifiedData, record1);

    unsigned int count1 = 0;
    char **types1 = OH_UdmfData_GetTypes(unifiedData, &count1);
    if (types1 == nullptr || count1 != TWO) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    char **types2 = OH_UdmfData_GetTypes(unifiedData, &count1);
    if (types1 != types2) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdsPlainText_Destroy(plainText);
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_GetUnifiedRecordTypes(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    unsigned int count = 0;
    char **types1 = OH_UdmfRecord_GetTypes(nullptr, &count);
    if (types1 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    char **types2 = OH_UdmfRecord_GetTypes(record, nullptr);
    if (types2 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord recordCp;
    char **types3 = OH_UdmfRecord_GetTypes(&recordCp, nullptr);
    if (types3 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_GetUnifiedRecordTypesTest(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plaintext = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plaintext);
    unsigned int count = 0;
    char **types1 = OH_UdmfRecord_GetTypes(record, &count);
    if (types1 == nullptr || count != 1) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    char **types2 = OH_UdmfRecord_GetTypes(record, &count);
    if (types2 == nullptr || count != 1 || types2 != types1) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdsPlainText_Destroy(plaintext);
    OH_UdmfRecord_Destroy(record);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_GetRecords(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();

    unsigned int count1 = 0;
    OH_UdmfRecord **records1 = OH_UdmfData_GetRecords(nullptr, &count1);
    if (records1 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData data;
    OH_UdmfRecord **records2 = OH_UdmfData_GetRecords(&data, &count1);
    if (records2 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    
    OH_UdmfRecord **records3 = OH_UdmfData_GetRecords(unifiedData, nullptr);
    if (records3 != nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_GetRecordsTest(napi_env env, napi_callback_info info)
{
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(unifiedData, record);
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink = OH_UdsHyperlink_Create();
    OH_UdmfRecord_AddHyperlink(record1, hyperlink);
    OH_UdmfData_AddRecord(unifiedData, record1);

    unsigned int count = 0;
    OH_UdmfRecord **records1 = OH_UdmfData_GetRecords(unifiedData, &count);
    if (records1 == nullptr || count != TWO) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord **records2 = OH_UdmfData_GetRecords(unifiedData, &count);
    if (records2 == nullptr || count != TWO || records2 != records1) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdsPlainText_Destroy(plainText);
    OH_UdsHyperlink_Destroy(hyperlink);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(record1);
    OH_UdmfData_Destroy(unifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetUnifiedData(napi_env env, napi_callback_info info)
{
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    int setRes1 = OH_Udmf_SetUnifiedData(intention, nullptr, nullptr, 0);
    if (setRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, setRes1, &Code);
        return Code;
    }

    OH_UdmfData unifiedData;
    int setRes2 = OH_Udmf_SetUnifiedData(intention, &unifiedData, nullptr, 0);
    if (setRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, setRes2, &Code);
        return Code;
    }

    OH_UdmfData *unifiedData1 = OH_UdmfData_Create();
    int setRes3 = OH_Udmf_SetUnifiedData(intention, unifiedData1, nullptr, 0);
    if (setRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, setRes3, &Code);
        return Code;
    }

    char key[] = "key";
    int setRes4 = OH_Udmf_SetUnifiedData(intention, unifiedData1, key, 0);
    if (setRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, setRes4, &Code);
        return Code;
    }

    intention = static_cast<Udmf_Intention>(INDEX);
    int setRes5 = OH_Udmf_SetUnifiedData(intention, unifiedData1, key, UDMF_KEY_BUFFER_LEN);
    if (setRes5 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, setRes5, &Code);
        return Code;
    }

    OH_UdmfData_Destroy(unifiedData1);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_GetUnifiedData(napi_env env, napi_callback_info info)
{
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    int getRes1 = OH_Udmf_GetUnifiedData(nullptr, intention, nullptr);
    if (getRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, getRes1, &Code);
        return Code;
    }

    OH_UdmfData unifiedData;
    int getRes2 = OH_Udmf_GetUnifiedData(nullptr, intention, &unifiedData);
    if (getRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, getRes2, &Code);
        return Code;
    }

    OH_UdmfData *unifiedData1 = OH_UdmfData_Create();
    int getRes3 = OH_Udmf_GetUnifiedData(nullptr, intention, unifiedData1);
    if (getRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, getRes3, &Code);
        return Code;
    }

    int getRes4 = OH_Udmf_GetUnifiedData("KEY", UDMF_INTENTION_PASTEBOARD, unifiedData1);
    if (getRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, getRes4, &Code);
        return Code;
    }

    OH_UdmfData_Destroy(unifiedData1);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_SetAndGetUnifiedData(napi_env env, napi_callback_info info)
{
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[UDMF_KEY_BUFFER_LEN];

    int setRes = OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    if (setRes != UDMF_E_OK || key[0] == '\0') {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    int getRes = OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    if (getRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, getRes, &Code);
        return Code;
    }
    unsigned int count = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(readUnifiedData, &count);
    if (count != 1) {
        napi_value Code = 0;
        napi_create_int32(env, count, &Code);
        return Code;
    }
    OH_UdsPlainText *getPlainText = OH_UdsPlainText_Create();
    OH_UdmfRecord_GetPlainText(getRecords[0], getPlainText);
    const char *getContent = OH_UdsPlainText_GetContent(getPlainText);
    if (strcmp(getContent, content) != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);

    OH_UdsPlainText_Destroy(getPlainText);
    OH_UdmfData_Destroy(readUnifiedData);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_CreateUnifiedRecord(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    if (record == nullptr || record->record_ == nullptr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfRecord_Destroy(record);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_AddGeneralEntry(napi_env env, napi_callback_info info)
{
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(nullptr, nullptr, nullptr, 0);
    if (addRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int addRes2 = OH_UdmfRecord_AddGeneralEntry(&record1, nullptr, nullptr, 0);
    if (addRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int addRes3 = OH_UdmfRecord_AddGeneralEntry(record2, nullptr, nullptr, 0);
    if (addRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes3, &Code);
        return Code;
    }

    char typeId[] = "general.plain-text";
    int addRes4 = OH_UdmfRecord_AddGeneralEntry(record2, typeId, nullptr, 0);
    if (addRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_GetGeneralEntry(napi_env env, napi_callback_info info)
{
    int addRes1 = OH_UdmfRecord_GetGeneralEntry(nullptr, nullptr, nullptr, 0);
    if (addRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int addRes2 = OH_UdmfRecord_GetGeneralEntry(&record1, nullptr, nullptr, 0);
    if (addRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int addRes3 = OH_UdmfRecord_GetGeneralEntry(record2, nullptr, nullptr, 0);
    if (addRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes3, &Code);
        return Code;
    }

    char typeId[] = "general.plain-text";
    int addRes4 = OH_UdmfRecord_GetGeneralEntry(record2, typeId, nullptr, 0);
    if (addRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, addRes4, &Code);
        return Code;
    }
    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_AddAndGetGeneralEntry(napi_env env, napi_callback_info info)
{
    char typeId[] = "general.plain-text";
    unsigned char entry[] = "CreateGeneralRecord";
    unsigned int count = sizeof(entry);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);
    if (addRes1 != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, addRes1, &Code);
        return Code;
    }

    unsigned int getCount = 0;
    unsigned char *getEntry;
    int getRes = OH_UdmfRecord_GetGeneralEntry(record, typeId, &getEntry, &getCount);
    if (getRes != UDMF_E_OK || getCount != count || std::memcmp(getEntry, entry, getCount) != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    unsigned int getCount1 = 0;
    unsigned char *getEntry1;
    int getRes1 = OH_UdmfRecord_GetGeneralEntry(record, typeId, &getEntry1, &getCount1);
    if (getRes1 != UDMF_E_OK || getEntry1 != getEntry) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_AddAndGetGeneralEntryTest(napi_env env, napi_callback_info info)
{
    char typeId[] = "general.plain-text";
    unsigned char entry[] = "CreateGeneralRecord";
    unsigned int count = sizeof(entry);
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    int addRes1 = OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);
    if (addRes1 != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, addRes1, &Code);
        return Code;
    }

    OH_UdmfRecord *getRecord = OH_UdmfRecord_Create();
    unsigned int getCount = 0;
    unsigned char *getEntry;
    char typeId1[] = "general.text";
    OH_UdmfRecord_AddGeneralEntry(record, typeId, entry, count);
    
    int getRes = OH_UdmfRecord_GetGeneralEntry(getRecord, typeId1, &getEntry, &getCount);
    if (getRes != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record);
    OH_UdmfRecord_Destroy(getRecord);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildRecordByPlainText(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_AddPlainText(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_AddPlainText(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_AddPlainText(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsPlainText plainText;
    int buildRes4 = OH_UdmfRecord_AddPlainText(record2, &plainText);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_GetPlainTextFromRecord(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_GetPlainText(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_GetPlainText(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_GetPlainText(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsPlainText plainText;
    int buildRes4 = OH_UdmfRecord_GetPlainText(record2, &plainText);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildAndGetPlainTextFromRecord(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText1 = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText1, content);
    int buildRes = OH_UdmfRecord_AddPlainText(record1, plainText1);
    if (buildRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes, &Code);
        return Code;
    }

    OH_UdsPlainText *plainText2 = OH_UdsPlainText_Create();
    int getRes = OH_UdmfRecord_GetPlainText(record1, plainText2);
    if (getRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, getRes, &Code);
        return Code;
    }

    const char *getContent = OH_UdsPlainText_GetContent(plainText2);
    if (strcmp(content, getContent) != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record1);
    OH_UdsPlainText_Destroy(plainText1);
    OH_UdsPlainText_Destroy(plainText2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildRecordByHyperlink(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_AddHyperlink(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_AddHyperlink(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_AddHyperlink(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsHyperlink hyperlink;
    int buildRes4 = OH_UdmfRecord_AddHyperlink(record2, &hyperlink);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_GetHyperlinkFromRecord(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_GetHyperlink(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_GetHyperlink(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_GetHyperlink(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsHyperlink hyperlink;
    int buildRes4 = OH_UdmfRecord_GetHyperlink(record2, &hyperlink);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildAndGetHyperlinkFromRecord(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "https://gitee.com/openharmony/distributeddatamgr_udmf/members";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    int buildRes = OH_UdmfRecord_AddHyperlink(record1, hyperlink1);
    if (buildRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes, &Code);
        return Code;
    }

    OH_UdsHyperlink *hyperlink2 = OH_UdsHyperlink_Create();
    int getRes = OH_UdmfRecord_GetHyperlink(record1, hyperlink2);
    if (getRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, getRes, &Code);
        return Code;
    }

    const char *getUrl = OH_UdsHyperlink_GetUrl(hyperlink2);
    if (strcmp(url, getUrl) != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record1);
    OH_UdsHyperlink_Destroy(hyperlink1);
    OH_UdsHyperlink_Destroy(hyperlink2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildRecordByHtml(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_AddHtml(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_AddHtml(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_AddHtml(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsHtml html;
    int buildRes4 = OH_UdmfRecord_AddHtml(record2, &html);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_GetHtmlFromRecord(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_GetHtml(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_GetHtml(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_GetHtml(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsHtml html;
    int buildRes4 = OH_UdmfRecord_GetHtml(record2, &html);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildAndGetHtmlFromRecord(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsHtml *html1 = OH_UdsHtml_Create();
    char content[] = "hello world";
    OH_UdsHtml_SetContent(html1, content);
    int buildRes = OH_UdmfRecord_AddHtml(record1, html1);
    if (buildRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes, &Code);
        return Code;
    }

    OH_UdsHtml *html2 = OH_UdsHtml_Create();
    int getRes = OH_UdmfRecord_GetHtml(record1, html2);
    if (getRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, getRes, &Code);
        return Code;
    }

    const char *getContent = OH_UdsHtml_GetContent(html2);
    if (strcmp(content, getContent) != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record1);
    OH_UdsHtml_Destroy(html1);
    OH_UdsHtml_Destroy(html2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildRecordByOpenHarmonyAppItem(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_AddAppItem(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_AddAppItem(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_AddAppItem(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsAppItem appItem;
    int buildRes4 = OH_UdmfRecord_AddAppItem(record2, &appItem);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_GetOpenHarmonyAppItemFromRecord(napi_env env, napi_callback_info info)
{
    int buildRes1 = OH_UdmfRecord_GetAppItem(nullptr, nullptr);
    if (buildRes1 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes1, &Code);
        return Code;
    }

    OH_UdmfRecord record1;
    int buildRes2 = OH_UdmfRecord_GetAppItem(&record1, nullptr);
    if (buildRes2 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes2, &Code);
        return Code;
    }

    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    int buildRes3 = OH_UdmfRecord_GetAppItem(record2, nullptr);
    if (buildRes3 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes3, &Code);
        return Code;
    }

    OH_UdsAppItem appItem;
    int buildRes4 = OH_UdmfRecord_GetAppItem(record2, &appItem);
    if (buildRes4 != UDMF_E_INVALID_PARAM) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes4, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
    return Code;
}

static napi_value OH_Udmf_BuildAndGetAppItemFromRecord(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsAppItem *appItem1 = OH_UdsAppItem_Create();
    char name[] = "appItem";
    OH_UdsAppItem_SetName(appItem1, name);
    int buildRes = OH_UdmfRecord_AddAppItem(record1, appItem1);
    if (buildRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, buildRes, &Code);
        return Code;
    }

    OH_UdsAppItem *appItem2 = OH_UdsAppItem_Create();
    int getRes = OH_UdmfRecord_GetAppItem(record1, appItem2);
    if (getRes != UDMF_E_OK) {
        napi_value Code = 0;
        napi_create_int32(env, getRes, &Code);
        return Code;
    }

    const char *getName = OH_UdsAppItem_GetName(appItem2);
    if (strcmp(name, getName) != 0) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }

    OH_UdmfRecord_Destroy(record1);
    OH_UdsAppItem_Destroy(appItem1);
    OH_UdsAppItem_Destroy(appItem2);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_CreatePropertiesFromUnifiedData(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    auto duration = std::chrono::system_clock::now().time_since_epoch();
    if (properties->properties_->timestamp >
        std::chrono::duration_cast<std::chrono::milliseconds>(duration).count()) {
        napi_value Code;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetPropertiesTag(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    std::string tag("tag");
    int result = OH_UdmfProperty_SetTag(properties, tag.c_str());
    if (UDMF_E_OK != result || tag != OH_UdmfProperty_GetTag(properties)) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfProperty_Destroy(properties);
    OH_UdmfData_Destroy(data);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetPropertiesShareOption(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int result = OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_IN_APP);
    if (UDMF_E_OK != result || Udmf_ShareOption::SHARE_OPTIONS_IN_APP != OH_UdmfProperty_GetShareOption(properties)) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetPropertiesShareOptionTest(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int result = OH_UdmfProperty_SetShareOption(properties, Udmf_ShareOption::SHARE_OPTIONS_CROSS_APP);
    if (UDMF_E_OK != result ||
        Udmf_ShareOption::SHARE_OPTIONS_CROSS_APP != OH_UdmfProperty_GetShareOption(properties)) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetPropertiesShareOptionEnd(napi_env env, napi_callback_info info)
{
    OH_UdmfProperty *property = nullptr;
    if (Udmf_ShareOption::SHARE_OPTIONS_INVALID != OH_UdmfProperty_GetShareOption(property)) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetPropertiesExtrasIntParam(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int result = OH_UdmfProperty_SetExtrasIntParam(properties, "keyInt", 0);
    if (UDMF_E_OK != result || 0 != OH_UdmfProperty_GetExtrasIntParam(properties, "keyInt", -1)) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

static napi_value OH_Udmf_SetPropertiesExtrasStringParam(napi_env env, napi_callback_info info)
{
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    std::string str("str");
    int result = OH_UdmfProperty_SetExtrasStringParam(properties, "keyStr", str.c_str());
    if (UDMF_E_OK != result) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    std::string actualStr(OH_UdmfProperty_GetExtrasStringParam(properties, "keyStr"));
    if (str != actualStr) {
        napi_value Code = 0;
        napi_create_int32(env, UDMF_E_INVALID_PARAM, &Code);
        return Code;
    }
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    napi_value Code = 0;
    napi_create_int32(env, UDMF_E_OK, &Code);
    return Code;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"AllocHapToken1", nullptr, AllocHapToken1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AllocHapToken2", nullptr, AllocHapToken2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetHapToken1", nullptr, SetHapToken1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesExtrasStringParam", nullptr, OH_Udmf_SetPropertiesExtrasStringParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesExtrasIntParam", nullptr, OH_Udmf_SetPropertiesExtrasIntParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOptionEnd", nullptr, OH_Udmf_SetPropertiesShareOptionEnd,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOptionTest", nullptr, OH_Udmf_SetPropertiesShareOptionTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesShareOption", nullptr, OH_Udmf_SetPropertiesShareOption, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag", nullptr, OH_Udmf_SetPropertiesTag, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_CreatePropertiesFromUnifiedData", nullptr, OH_Udmf_CreatePropertiesFromUnifiedData,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetAppItemFromRecord", nullptr, OH_Udmf_BuildAndGetAppItemFromRecord, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetOpenHarmonyAppItemFromRecord", nullptr, OH_Udmf_GetOpenHarmonyAppItemFromRecord,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildRecordByOpenHarmonyAppItem", nullptr, OH_Udmf_BuildRecordByOpenHarmonyAppItem,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetHtmlFromRecord", nullptr, OH_Udmf_BuildAndGetHtmlFromRecord, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetHtmlFromRecord", nullptr, OH_Udmf_GetHtmlFromRecord, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_BuildRecordByHtml", nullptr, OH_Udmf_BuildRecordByHtml, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_BuildAndGetHyperlinkFromRecord", nullptr, OH_Udmf_BuildAndGetHyperlinkFromRecord,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetHyperlinkFromRecord", nullptr, OH_Udmf_GetHyperlinkFromRecord, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildRecordByHyperlink", nullptr, OH_Udmf_BuildRecordByHyperlink, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildAndGetPlainTextFromRecord", nullptr, OH_Udmf_BuildAndGetPlainTextFromRecord,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetPlainTextFromRecord", nullptr, OH_Udmf_GetPlainTextFromRecord, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_BuildRecordByPlainText", nullptr, OH_Udmf_BuildRecordByPlainText, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndGetGeneralEntryTest", nullptr, OH_Udmf_AddAndGetGeneralEntryTest, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddAndGetGeneralEntry", nullptr, OH_Udmf_AddAndGetGeneralEntry, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_GetGeneralEntry", nullptr, OH_Udmf_GetGeneralEntry, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_AddGeneralEntry", nullptr, OH_Udmf_AddGeneralEntry, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_CreateUnifiedRecord", nullptr, OH_Udmf_CreateUnifiedRecord, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_SetAndGetUnifiedData", nullptr, OH_Udmf_SetAndGetUnifiedData, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedData", nullptr, OH_Udmf_GetUnifiedData, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_SetUnifiedData", nullptr, OH_Udmf_SetUnifiedData, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_GetRecordsTest", nullptr, OH_Udmf_GetRecordsTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_GetRecords", nullptr, OH_Udmf_GetRecords, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"OH_Udmf_GetUnifiedRecordTypesTest", nullptr, OH_Udmf_GetUnifiedRecordTypesTest, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedRecordTypes", nullptr, OH_Udmf_GetUnifiedRecordTypes, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataTypesTest", nullptr, OH_Udmf_GetUnifiedDataTypesTest, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_GetUnifiedDataTypes", nullptr, OH_Udmf_GetUnifiedDataTypes, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_HasUnifiedDataTypeTest", nullptr, OH_Udmf_HasUnifiedDataTypeTest, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_HasUnifiedDataType", nullptr, OH_Udmf_HasUnifiedDataType, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Udmf_AddRecordToUnifiedDataTest", nullptr, OH_Udmf_AddRecordToUnifiedDataTest, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_AddRecordToUnifiedData", nullptr, OH_Udmf_AddRecordToUnifiedData, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Udmf_CreateUnifiedData", nullptr, OH_Udmf_CreateUnifiedData, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"ReleaseHapToken1", nullptr, ReleaseHapToken1, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "UdmfNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
}
