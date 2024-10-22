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
#include "native_effect/effect_filter.h"
#include "native_effect/effect_types.h"
#include "hilog/log.h"

#define SUCCESS 0
#define FAIL (-1)

static napi_value OHFilterCreateEffect(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    OH_PixelmapNative **pixMap = &pixmap;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_CreateEffect(*pixMap, &filter);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterInvert(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_Invert(filter);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterBlur(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_Blur(filter, 0.5f);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterGrayScale(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_GrayScale(filter);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterBrighten(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_Brighten(filter, 0.5);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterSetColorMatrix(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Filter *filter = nullptr;
    OH_Filter_ColorMatrix matrix {
        -1.0, 0, 0, 0, 1,
        0, -1.0, 0, 0, 1,
        0, 0, -1.0, 0, 1,
        0, 0, 0, 1, 0
    };
    EffectErrorCode effectErrorCode = OH_Filter_SetColorMatrix(filter, &matrix);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterGetEffectPixelMap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_GetEffectPixelMap(filter, &pixmap);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHFilterRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_Release(filter);
    if (effectErrorCode != EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHFilterCreateEffect", nullptr, OHFilterCreateEffect, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterInvert", nullptr, OHFilterInvert, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBlur", nullptr, OHFilterBlur, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterGrayScale", nullptr, OHFilterGrayScale, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBrighten", nullptr, OHFilterBrighten, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterSetColorMatrix", nullptr, OHFilterSetColorMatrix, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterGetEffectPixelMap", nullptr, OHFilterGetEffectPixelMap, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterRelease", nullptr, OHFilterRelease, nullptr, nullptr, nullptr,
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
    .nm_modname = "nativeEffectNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }