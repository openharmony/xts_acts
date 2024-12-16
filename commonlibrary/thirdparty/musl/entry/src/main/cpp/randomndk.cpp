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
#include <cstdlib>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <sys/random.h>
#include <hilog/log.h>

#define BUFFSIZE 32
#define DEFAULT_VALUE 0
#define FAIL (-1)
#define NO_ERRS 0
#define BUFSIZE 32

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFEFE
#define LOG_TAG "MUSL_LIBCTEST"

static napi_value Getrandom(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    errno = 0;
    void *buf = malloc(BUFFSIZE);
    if (buf == nullptr) {
        OH_LOG_INFO(LOG_APP, "MUSL malloc failed");
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ssize_t ret = getrandom(buf, BUFFSIZE, DEFAULT_VALUE);
    if (ret != FAIL) {
        napi_create_int32(env, NO_ERRS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getrandom", nullptr, Getrandom, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libunistd",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
