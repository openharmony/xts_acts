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

#include "napi/native_api.h"
#include <BasicServicesKit/ohscan.h>

#define SCANNER_ID "12"

static void ScannerDiscoveryCallback(Scan_ScannerDevice **devices, int32_t length)
{
}

static napi_value OHScanInit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanStartScannerDiscovery(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_StartScannerDiscovery(ScannerDiscoveryCallback);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanOpenScanner(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_OpenScanner(SCANNER_ID);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanCloseScanner(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_CloseScanner(SCANNER_ID);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanGetScannerParameter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    OH_Scan_GetScannerParameter(SCANNER_ID, &errorCode);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanSetScannerParameter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    int32_t paraOption = 0;
    errorCode = OH_Scan_SetScannerParameter(SCANNER_ID, paraOption, SCANNER_ID);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanStartScan(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_StartScan(SCANNER_ID, false);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanCancelScan(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_CancelScan(SCANNER_ID);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanGetPictureScanProgress(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    Scan_PictureScanProgress* progress = new Scan_PictureScanProgress();
    errorCode = OH_Scan_GetPictureScanProgress(SCANNER_ID, progress);
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHScanExit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    if (errorCode != SCAN_ERROR_NONE) {
        napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
        return result;
    }
    errorCode = OH_Scan_Exit();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}