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

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_30 30
const bool Isencoder = true;
const bool Isdecoder = false;

static napi_value OHAvCapabilityByCategoryH265(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    OH_AVRange qualityRange;
    OH_AVErrCode checkParam;
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, Isencoder, HARDWARE);
    if (capability != nullptr) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OHAvCapabilityByCategoryH265", nullptr, OHAvCapabilityByCategoryH265, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
