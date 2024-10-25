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

#include <js_native_api.h>
#include "napi/native_api.h"
#include "native_color_space_manager/native_color_space_manager.h"
#include "hilog/log.h"

#define SUCCESS 0
#define FAIL (-1)
 
static napi_value OHCreateColorSpaceFromName(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ADOBE_RGB;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    if (nativeColorSpace == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHCreateFromPrimariesAndGamma(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpacePrimaries primaries = {0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1};
    float gamma = 1.2;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromPrimariesAndGamma(primaries, gamma);
    if (nativeColorSpace == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHDestroy(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    ColorSpaceName colorSpaceName = ADOBE_RGB;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    if (nativeColorSpace == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHGetColorSpaceName(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName =
        static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    if (colorSpaceName == ColorSpaceName::NONE) {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value OHGetWhitePoint(napi_env env, napi_callback_info info)
{
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    napi_value result = nullptr;
    WhitePointArray array = OH_NativeColorSpaceManager_GetWhitePoint(nativeColorSpace);
    if (array.arr[0] == 0.f) {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value OHGetGamma(napi_env env, napi_callback_info info)
{
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    napi_value result = nullptr;
    float gamma = OH_NativeColorSpaceManager_GetGamma(nativeColorSpace);
    if (gamma == 0.f) {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHCreateColorSpaceFromName", nullptr, OHCreateColorSpaceFromName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCreateFromPrimariesAndGamma", nullptr, OHCreateFromPrimariesAndGamma, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHDestroy", nullptr, OHDestroy, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetColorSpaceName", nullptr, OHGetColorSpaceName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetWhitePoint", nullptr, OHGetWhitePoint, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetGamma", nullptr, OHGetGamma, nullptr, nullptr, nullptr,
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
    .nm_modname = "nativeColorSpaceNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }