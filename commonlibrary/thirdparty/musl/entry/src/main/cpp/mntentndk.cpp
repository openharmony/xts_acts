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

#include "common/napi_helper.cpp"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <cstdio>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <mntent.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>
#define ONEVAL 1
#define MINUSONE -1
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL -1
#define ERRON_0 0

static napi_value Setmntent(napi_env env, napi_callback_info info)
{
    FILE *ffp = setmntent("/data/storage/el2/base/files/test.txt", "r");
    napi_value result;
    if (ffp != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, ONEVAL, &result);
    }
    return result;
}

static napi_value GetMnTent(napi_env env, napi_callback_info info)
{
    FILE *mtab = nullptr;
    struct mntent *part;
    errno = ERRON_0;
    errno = ERRON_0;
    mtab = setmntent("/data/storage/el2/base/files/test.txt", "w+");
    part = getmntent(mtab);
    endmntent(mtab);
    napi_value result;
    if (part == nullptr) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value GetMnTentR(napi_env env, napi_callback_info info)
{
    FILE *mtab = nullptr;
    struct mntent *part = nullptr;
    struct mntent mnt;
    char strings[1024];
    mtab = setmntent("/data/storage/el2/base/files/test.txt", "w+");
    errno = ERRON_0;
    part = getmntent_r(mtab, &mnt, strings, sizeof(strings));
    endmntent(mtab);
    napi_value result;
    if (part == nullptr) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Hasmntopt(napi_env env, napi_callback_info info)
{
    char mnt_opts[] = "/data/storage/el2/base/files/test_hasmntopt";
    struct mntent ent;
    memset(&ent, PARAM_0, sizeof(ent));
    ent.mnt_opts = mnt_opts;
    char *ret = hasmntopt(&ent, "hasmntopt");
    napi_value result;
    if (ret == nullptr) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setmntent", nullptr, Setmntent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMnTent", nullptr, GetMnTent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMnTentR", nullptr, GetMnTentR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasmntopt", nullptr, Hasmntopt, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mntent",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
