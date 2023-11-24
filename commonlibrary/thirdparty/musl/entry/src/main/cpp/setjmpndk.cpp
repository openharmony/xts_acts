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
#include <cerrno>
#include <csetjmp>
#include <cstdio>
#include <cstdlib>
#include <js_native_api.h>
#include <node_api.h>
#include <csetjmp>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL -1
#define ERRON_0 0
#define ONEVAL 1
#define MINUSONE -1

static napi_value Setjmp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    jmp_buf jmp;
    if (valueFirst == PARAM_0) {
        int setValue = setjmp(jmp);
        napi_create_int32(env, setValue, &result);
    } else {
        int setValue = setjmp(jmp);
        if (setValue == PARAM_0) {
            longjmp(jmp, valueSecond);
        }
        napi_create_int32(env, setValue, &result);
    }
    return result;
}

static napi_value Sigsetjmp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigjmp_buf jmp;
    if (valueFirst == PARAM_0) {
        int sigValue = sigsetjmp(jmp, PARAM_0);
        napi_create_int32(env, sigValue, &result);
    } else {
        int sigValue = sigsetjmp(jmp, PARAM_0);
        if (sigValue == PARAM_0) {
            siglongjmp(jmp, valueSecond);
        }
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}
void subroutine(jmp_buf jumper) { longjmp(jumper, 1); }
void subroutine(jmp_buf);
static napi_value Longjmp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int value = PARAM_0;
    jmp_buf jumper;
    errno = ERRON_0;
    value = setjmp(jumper);
    if (value != PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
        subroutine(jumper);
    }
    return result;
}

static napi_value Siglongjmp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    sigjmp_buf bufjmp;
    int jmpValue = sigsetjmp(bufjmp, PARAM_0);

    napi_value result = nullptr;
    siglongjmp(bufjmp, valueFirst);
    napi_create_int32(env, jmpValue, &result);
    return result;
}

static napi_value _Longjmp(napi_env env, napi_callback_info info)
{
    int returnValue = PARAM_0;
    errno = ERRON_0;
    sigjmp_buf bufJmp;
    _setjmp(bufJmp);
    _longjmp(bufJmp, PARAM_0);
    if (errno == PARAM_0) {
        returnValue = ONEVAL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value _Setjmp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int valueFirst = PARAM_0;
    int valueSecond = PARAM_0;
    jmp_buf jmp;
    if (valueFirst == PARAM_0) {
        int setValue = _setjmp(jmp);
        napi_create_int32(env, setValue, &result);
        return result;
    } else {
        int setValue = _setjmp(jmp);
        if (setValue == PARAM_0) {
            _longjmp(jmp, valueSecond);
        }
        napi_create_int32(env, setValue, &result);
        return result;
    }
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"longjmp", nullptr, Longjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setjmp", nullptr, Setjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigsetjmp", nullptr, Sigsetjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"siglongjmp", nullptr, Siglongjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"_longjmp", nullptr, _Longjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"_setjmp", nullptr, _Setjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "setjmp",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
