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
#include <cstdlib>
#include <getopt.h>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>
#define THIRTEEN 13
#define SUCCESS 1
#define FAIL -1
#define ONE 1
#define ZERO 0
#define LENGTH 64

static napi_value GetGroups(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);

    int getInfo = FAIL;
    int size = valueZero;
    gid_t list[10];
    getInfo = getgroups(size, list);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetPid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = getpid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPPid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = getppid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPGrp(napi_env env, napi_callback_info info)
{
    int setResult = setpgrp();
    pid_t getInfo = FAIL;
    if (setResult == ZERO) {
        getInfo = getpgrp();
    }
    if (getInfo != FAIL) {
        getInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPGid(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    pid_t getInfo = getpgid(getpid());
    if (getInfo != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSid(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);

    pid_t getInfo = FAIL;
    getInfo = getsid(valueZero);
    if (FAIL != getInfo) {
        getInfo = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetUid(napi_env env, napi_callback_info info)
{
    uid_t uid = getuid();
    int ret = FAIL;
    if (uid != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetLogin(napi_env env, napi_callback_info info)
{
    errno = ZERO;
    size_t length = LENGTH;
    char *getInfo = (char *)malloc(sizeof(char) * length);
    getInfo = getlogin();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetLoginR(napi_env env, napi_callback_info info)
{
    errno = ZERO;
    char szUserName[64] = {0};
    int getInfo = getlogin_r(szUserName, sizeof(szUserName) - ONE);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetOpt(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = LENGTH, strResult = ZERO;
    char *strTemp = (char *)malloc(sizeof(char) * length);

    napi_get_value_string_utf8(env, args[0], strTemp, length, &strResult);
    optind = ZERO;
    int optArgc = 3;
    char cmdline[50] = "./parse_cmdline";
    char para[100] = "100";
    char *optArgv[] = {cmdline, strTemp, para};
    char optString[50] = "a:b:c:d";
    int getInfo = getopt(optArgc, optArgv, optString);

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetTid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = gettid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetEUid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = ZERO;
    getInfo = geteuid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetGid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = ZERO;
    getInfo = getgid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetEGid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = ZERO;
    getInfo = getegid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetHostName(napi_env env, napi_callback_info info)
{
    char name[65];
    int getInfo = gethostname(name, sizeof(name));
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPageSize(napi_env env, napi_callback_info info)
{
    int getInfo = getpagesize();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetDTableSize(napi_env env, napi_callback_info info)
{
    int getInfo = getdtablesize();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetReSuid(napi_env env, napi_callback_info info)
{
    uid_t ruid = THIRTEEN;
    uid_t euid = THIRTEEN;
    uid_t suid = THIRTEEN;

    int getInfo = getresuid(&ruid, &euid, &suid);

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetResGid(napi_env env, napi_callback_info info)
{
    gid_t rgid = THIRTEEN;
    gid_t egid = THIRTEEN;
    gid_t sgid = THIRTEEN;
    int getInfo = getresgid(&rgid, &egid, &sgid);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value Sleep(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    int sin_value = sleep(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Isatty(napi_env env, napi_callback_info info)
{
    errno = ZERO;
    int fd = fileno(stdout);
    int sin_value = isatty(fd);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getGroups", nullptr, GetGroups, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPid", nullptr, GetPid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPPid", nullptr, GetPPid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPGrp", nullptr, GetPGrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPGid", nullptr, GetPGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSid", nullptr, GetSid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getUid", nullptr, GetUid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLogin", nullptr, GetLogin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLoginR", nullptr, GetLoginR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOpt", nullptr, GetOpt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getTid", nullptr, GetTid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEUid", nullptr, GetEUid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGid", nullptr, GetGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEGid", nullptr, GetEGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostName", nullptr, GetHostName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPageSize", nullptr, GetPageSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDTableSize", nullptr, GetDTableSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getReSuid", nullptr, GetReSuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResGid", nullptr, GetResGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sleep", nullptr, Sleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isatty", nullptr, Isatty, nullptr, nullptr, nullptr, napi_default, nullptr},

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
