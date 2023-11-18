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
#include <sys/timex.h>
#define PARAM_1 1

static napi_value Adjtimex(napi_env env, napi_callback_info info)
{
    struct timex tx;
    tx.offset = ADJ_OFFSET;
    tx.tick = ADJ_TICK;
    tx.maxerror = ADJ_MAXERROR;
    tx.esterror = ADJ_ESTERROR;
    tx.constant = ADJ_TIMECONST;
    tx.freq = ADJ_FREQUENCY;
    tx.status = ADJ_STATUS;
    tx.precision = PARAM_1;
    tx.tolerance = PARAM_1;
    tx.ppsfreq = PARAM_1;
    tx.jitter = PARAM_1;
    tx.stabil = PARAM_1;
    tx.jitcnt = PARAM_1;
    tx.calcnt = PARAM_1;
    tx.errcnt = PARAM_1;
    tx.stbcnt = PARAM_1;
    int ret = adjtimex(&tx);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"adjtimex", nullptr, Adjtimex, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "timex",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }