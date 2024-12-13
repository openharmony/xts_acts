/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <iostream>
#include <stdexcept>
#include "napi/native_api.h"
#include <bits/alltypes.h>
#include <ctime>
#include <native_vsync/native_vsync.h>
#include <stdexcept>
#include <cstdio>
#include <zconf.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>

#define SUCCESS 0
#define FAIL (-1)
#define PARAM_0 0
#define NUMBER_2 2
#define NUMBER_3 3
#define TIMEOUT_FIVE 10
#define NUMBER_254 254
#define NUMBER_255 255
#define NUMBER_256 256
#define NUMBER_500 500
#define NUMBER_40001000 40001000
#define ARR_NUMBER_0 0
#define ARR_NUMBER_1 1
#define ARR_NUMBER_2 2
#define ARR_NUMBER_3 3
static bool g_flag = false;
static void OnVSync(long long timestamp, void *data) { g_flag = true; }

static napi_value OHNativeVSyncCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    if (nativeVSync != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
        OH_NativeVSync_Destroy(nativeVSync);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeVSyncCreateFOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    unsigned int length = 0;
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(nullptr, length);
    if (nativeVSync != nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value OHNativeVSyncRequestFrame(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    OH_NativeVSync_FrameCallback callback = OnVSync;
    int ret = OH_NativeVSync_RequestFrame(nativeVSync, callback, nullptr);
    if (ret == SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (nativeVSync) {
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncRequestFrameFOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = OH_NativeVSync_RequestFrame(nullptr, nullptr, nullptr);
    if (ret != SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeVSyncRequestFrameFTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    int ret = OH_NativeVSync_RequestFrame(nativeVSync, nullptr, nullptr);
    if (ret != SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (nativeVSync) {
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncGetPeriod(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    OH_NativeVSync_FrameCallback callback = OnVSync;
    OH_NativeVSync_RequestFrame(nativeVSync, callback, nullptr);
    time_t startTime = time(PARAM_0);
    double diffTime = 0;
    while (!g_flag && diffTime < TIMEOUT_FIVE) {
        time_t curTime = time(PARAM_0);
        diffTime = difftime(curTime, startTime);
    }
    long long period;
    int ret = OH_NativeVSync_GetPeriod(nativeVSync, &period);
    if (ret == SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (nativeVSync) {
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncGetPeriodFOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    long long period;
    int ret = OH_NativeVSync_GetPeriod(nullptr, &period);
    if (ret != SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeVSyncCreateNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    unsigned int length = 0;
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(nullptr, length);
    if (nativeVSync == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value OHNativeVSyncCreateNotEq(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "testCase";
    unsigned int length = NUMBER_2;
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    if (nativeVSync == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeVSync_Destroy(nativeVSync);
    return result;
}

static napi_value OHNativeVSyncCreateNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "testCase";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync1 = OH_NativeVSync_Create(name, length);
    napi_create_array_with_length(env, NUMBER_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    if (nativeVSync1 == nullptr) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, 0, result1);

    OH_NativeVSync *nativeVSync2 = OH_NativeVSync_Create(name, length);
    if (nativeVSync2 == nullptr) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }

    napi_set_element(env, result, 1, result2);
    OH_NativeVSync_Destroy(nativeVSync1);
    OH_NativeVSync_Destroy(nativeVSync2);
    return result;
}

static napi_value OHNativeVSyncCreateAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(NULL, 0);
    if (nativeVSync == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    nativeVSync = OH_NativeVSync_Create(0, 0);
    if (nativeVSync == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeVSync_Destroy(nativeVSync);
    return result;
}

void MyFrameCallback(long long timestamp, void *data)
{
    int *myData = static_cast<int *>(data);
    return;
}

static napi_value OHNativeVSyncCreateDifLenth(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    std::vector<std::string> myArray = {
        "0",
        "a",
        "你",
        "!@#￥%^&*()_+",
        " ",
        "  ",
        "这里有好多好多字符qazwsxedcrfvtgbyhnujqazwsxedcrfvtgbyhnujqazwsxedcrfvtgbyhnujqazwsxedcrfvtgbyhnuj",
        "ab_cdefghijklmnopqrstuvwxyz",
        "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde"};
    napi_create_array_with_length(env, myArray.size(), &result);

    for (uint32_t index = 0; index < myArray.size(); index++) {
        unsigned int len = strlen(myArray[index].c_str());
        OH_NativeVSync *nativeVSync = nullptr;
        napi_value resultIndex = nullptr;
        nativeVSync = OH_NativeVSync_Create(myArray[index].c_str(), len);
        if (nativeVSync == nullptr) {
            napi_create_int32(env, FAIL+index, &result);
            OH_NativeVSync_Destroy(nativeVSync);
            return result;
        } else {
            napi_create_int32(env, SUCCESS, &result);
            OH_NativeVSync_Destroy(nativeVSync);
            continue;
        }
    }
    return result;
}

static napi_value OHNativeVSyncCreateMuch(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "testcase";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSyncArr[NUMBER_500];
    int success = 0;
    for (uint32_t i = 0; i < NUMBER_500; i++) {
        nativeVSyncArr[i] = OH_NativeVSync_Create(name, length);
        if (nativeVSyncArr[i] != nullptr) {
            success = success + 1;
            continue;
        }
    }
    if (success == NUMBER_255 || success == NUMBER_254) {
        for (uint32_t i = 0; i < NUMBER_500; i++) {
            OH_NativeVSync_Destroy(nativeVSyncArr[i]);
        }
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        for (uint32_t i = 0; i < NUMBER_500; i++) {
            OH_NativeVSync_Destroy(nativeVSyncArr[i]);
        }
        napi_create_int32(env, FAIL, &result);
        return result;
    }
}

static napi_value OHNativeVSyncGetPeriodNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    long long period;
    int res = OH_NativeVSync_GetPeriod(nullptr, &period);
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OHNativeVSyncRequestFrameNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "testcase";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    napi_create_array_with_length(env, NUMBER_3, &result);
    int param = 0;
    int res = OH_NativeVSync_RequestFrame(nullptr, MyFrameCallback, &param);
    if (res != NUMBER_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    res = OH_NativeVSync_RequestFrame(nativeVSync, nullptr, &param);
    if (res != NUMBER_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    res = OH_NativeVSync_RequestFrame(nativeVSync, MyFrameCallback, nullptr);
    if (res != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value OHNativeVSyncRequestFrameNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "testcase";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    int *param = nullptr;
    int res = OH_NativeVSync_RequestFrame(nativeVSync, MyFrameCallback, param);
    napi_create_int32(env, res, &result);
    OH_NativeVSync_Destroy(nativeVSync);
    return result;
}

static napi_value OHNativeVSyncRequestFrameParamErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "testcase";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    char param[] = "test";
    int res = OH_NativeVSync_RequestFrame(nativeVSync, MyFrameCallback, &param);
    napi_create_int32(env, res, &result);
    OH_NativeVSync_Destroy(nativeVSync);
    return result;
}

static napi_value OHNativeVSyncCreateForAssociatedWindowNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OHNativeWindow *nativeWindow = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(nativeWindow, &surfaceId);
    char name[] = "test";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    OH_NativeVSync *ret = OH_NativeVSync_Create_ForAssociatedWindow(surfaceId, name, length);
    if (ret == nullptr) {
        napi_create_int32(env, FAIL, &result);
        OH_NativeVSync_Destroy(nativeVSync);
        return result;
    } else {
        napi_create_int32(env, SUCCESS, &result);
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncCreateForAssociatedWindowAbNormal01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    OHNativeWindow *nativeWindow = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(nativeWindow, &surfaceId);
    char name[] = "test";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    OH_NativeVSync *ret = OH_NativeVSync_Create_ForAssociatedWindow(surfaceId, nullptr, length);
    if (ret == nullptr) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    OH_NativeVSync *ret1 = OH_NativeVSync_Create_ForAssociatedWindow(surfaceId, name, 0);
    if (ret1 == nullptr) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    OH_NativeVSync *ret2 = OH_NativeVSync_Create_ForAssociatedWindow(0, name, length);
    if (ret2 == nullptr) {
        napi_create_int32(env, FAIL, &result3);
    } else {
        napi_create_int32(env, SUCCESS, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);
    OH_NativeVSync_Destroy(nativeVSync);
    return result;
}

static napi_value OHNativeVSyncCreateForAssociatedWindowAbNormal02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    OHNativeWindow *nativeWindow = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    uint64_t surfaceId;
    OH_NativeWindow_GetSurfaceId(nativeWindow, &surfaceId);
    char name[] = "test";
    unsigned int length = strlen(name);
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, length);
    OH_NativeVSync *ret3 = OH_NativeVSync_Create_ForAssociatedWindow(3, name, length);
    if (ret3 == nullptr) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    OH_NativeVSync *ret4 = OH_NativeVSync_Create_ForAssociatedWindow(surfaceId, "", length);
    if (ret4 == nullptr) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    OH_NativeVSync *ret5 = OH_NativeVSync_Create_ForAssociatedWindow(surfaceId, name, sizeof(name));
    if (ret5 == nullptr) {
        napi_create_int32(env, FAIL, &result3);
    } else {
        napi_create_int32(env, SUCCESS, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);
    OH_NativeVSync_Destroy(nativeVSync);
    return result;
}
static napi_value OHNativeVSyncCreateForAssociatedWindowAbNormal03(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    uint64_t windowID = 1;
    char name[] = "test";
    int maximum = 257;
    int count = 0;
    OH_NativeVSync *native_vsync_array[maximum];
    for (count = 0; count < maximum; ++count) {
        native_vsync_array[count] = OH_NativeVSync_Create_ForAssociatedWindow(windowID, name, sizeof(name));
        if (native_vsync_array[count] == nullptr) {
            break;
        }
    }
    if (native_vsync_array[count] == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    count--;
    for (; count >= 0; --count) {
        OH_NativeVSync_Destroy(native_vsync_array[count]);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHNativeVSyncCreate", nullptr, OHNativeVSyncCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncCreateFOne", nullptr, OHNativeVSyncCreateFOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncRequestFrame", nullptr, OHNativeVSyncRequestFrame, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncRequestFrameFOne", nullptr, OHNativeVSyncRequestFrameFOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncRequestFrameFTwo", nullptr, OHNativeVSyncRequestFrameFTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncGetPeriod", nullptr, OHNativeVSyncGetPeriod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncGetPeriodFOne", nullptr, OHNativeVSyncGetPeriodFOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncCreateNull", nullptr, OHNativeVSyncCreateNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncCreateNotEq", nullptr, OHNativeVSyncCreateNotEq, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncCreateNormal", nullptr, OHNativeVSyncCreateNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncCreateAbnormal", nullptr, OHNativeVSyncCreateAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncCreateDifLenth", nullptr, OHNativeVSyncCreateDifLenth, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncCreateMuch", nullptr, OHNativeVSyncCreateMuch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncGetPeriodNullptr", nullptr, OHNativeVSyncGetPeriodNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncRequestFrameNullptr", nullptr, OHNativeVSyncRequestFrameNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncRequestFrameNormal", nullptr, OHNativeVSyncRequestFrameNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncRequestFrameParamErr", nullptr, OHNativeVSyncRequestFrameParamErr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncCreateForAssociatedWindowNormal", nullptr, OHNativeVSyncCreateForAssociatedWindowNormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncCreateForAssociatedWindowAbNormal01", nullptr, OHNativeVSyncCreateForAssociatedWindowAbNormal01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncCreateForAssociatedWindowAbNormal02", nullptr, OHNativeVSyncCreateForAssociatedWindowAbNormal02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncCreateForAssociatedWindowAbNormal03", nullptr, OHNativeVSyncCreateForAssociatedWindowAbNormal03,
         nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nativevsync",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); };
