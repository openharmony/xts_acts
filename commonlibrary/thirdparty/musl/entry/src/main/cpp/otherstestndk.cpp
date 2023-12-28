/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain firstParam copy of the License at
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
#include <cfenv>
#include <cmath>
#include <cstdio>
#include <dlfcn.h>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <libgen.h>
#include <mntent.h>
#include <netinet/ether.h>
#include <resolv.h>
#include <sched.h>
#include <sys/epoll.h>
#include <sys/eventfd.h>
#include <sys/file.h>
#include <sys/xattr.h>
#include <syslog.h>
#include <utmp.h>


#define MAXDNAME_A 1025
#define INIT -1
#define SUCCESS 0
#define PARAM_0 0
#define SPNUM 1

static napi_value DlaDdr(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    Dl_info *dlInfo = nullptr;
    errno = SUCCESS;
    const char *path = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    void *ptr = dlopen(path, RTLD_LAZY);
    backParam = dladdr(ptr, dlInfo);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DlOpen(napi_env env, napi_callback_info info)
{
    errno = SUCCESS;
    const char path[] = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    int backParam = PARAM_0;
    void *ptr = dlopen(path, RTLD_LAZY);
    backParam = dlclose(ptr);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DlClose(napi_env env, napi_callback_info info)
{
    const char path[] = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    int backParam = PARAM_0;
    void *ptr = dlopen(path, RTLD_LAZY);
    backParam = dlclose(ptr);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DlError(napi_env env, napi_callback_info info)
{
    char *errorInfo = nullptr;
    int backParam = INIT;
    const char path[] = "/system/lib/extensionability/libstatic_subscriber_extension_modu_le.z.so";
    dlopen(path, RTLD_NOW);
    errorInfo = dlerror();
    if (errorInfo != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CloseLog(napi_env env, napi_callback_info info)
{
    int backResult = SUCCESS;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    openlog(path, LOG_PID, LOG_USER);
    syslog(LOG_DEBUG, path);
    closelog();
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value DirName(napi_env env, napi_callback_info info)
{
    char *backParam = nullptr;
    const char pathname[] = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    backParam = dirname(path);
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Flock(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT), secondParam = LOCK_UN;
    backParam = flock(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dn_comp(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    const char domain[] = "www.baidu.com";
    unsigned char buff[MAXDNAME_A] = {0};
    unsigned char **firstChar = nullptr, **secondChar = nullptr;
    backParam = dn_comp(domain, buff, MAXDNAME_A, firstChar, secondChar);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dn_skipname(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    const unsigned char str[] = {0, 2, 3, 4};
    backParam = dn_skipname(&str[0], &str[1]);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DRem(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double backParam, firstParam, secondParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_double(env, args[1], &secondParam);
    backParam = drem(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value DRemF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double backParam, firstParam, secondParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_double(env, args[1], &secondParam);
    backParam = dremf(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value Finite(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam = PARAM_0;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    backParam = finite(firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FiniteF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam = PARAM_0;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    backParam = finitef(firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EndMntEnt(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    backParam = endmntent(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Clone(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    int (*firstParam)(void *secondParam) = nullptr;
    void *thirdParam = nullptr;
    backParam = clone(firstParam, thirdParam, CLONE_NEWPID, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EndUTent(napi_env env, napi_callback_info info)
{
    errno = INIT;
    endutent();
    napi_value result = nullptr;
    errno = SUCCESS;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Epoll_create(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    int backParam = PARAM_0;
    backParam = epoll_create(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_create1(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/xdl.txt", O_CREAT);
    int backParam = PARAM_0;
    backParam = epoll_create1(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_ctl(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    int backParam = PARAM_0, secondParam = SPNUM, size = SPNUM;
    struct epoll_event *event = nullptr;
    backParam = epoll_ctl(fileDescribe, secondParam, size, event);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_PWait(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, size = SPNUM, mode = SPNUM,
        fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    struct epoll_event *secondParam = nullptr;
    const sigset_t *sigset = nullptr;
    backParam = epoll_pwait(fileDescribe, secondParam, size, mode, sigset);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_Wait(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, size = SPNUM, mode = SPNUM,
        fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    struct epoll_event *secondParam = nullptr;
    backParam = epoll_wait(fileDescribe, secondParam, size, mode);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Ether_aTon(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    struct ether_addr *checkParam = nullptr;
    const char firstParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    checkParam = ether_aton(firstParam[0]);
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Ether_nToa_r(napi_env env, napi_callback_info info)
{
    char *backParam = nullptr;
    struct ether_addr addr[sizeof(ether_addr)];
    char firstParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    ether_aton_r(firstParam[0], addr);
    backParam = ether_ntoa_r(addr, firstParam[0]);
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ether_nToa(napi_env env, napi_callback_info info)
{
    char *backParam = nullptr;
    const struct ether_addr *firstParam = nullptr;
    const char testParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    firstParam = ether_aton(testParam[0]);
    backParam = ether_ntoa(firstParam);
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ether_aTon_r(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    struct ether_addr *addr = (ether_addr *)malloc(sizeof(ether_addr));
    struct ether_addr *checkParam = nullptr;
    const char firstParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    checkParam = ether_aton_r(firstParam[0], addr);
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EventFd(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, secondParam = FD_CLOEXEC;
    unsigned int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    backParam = eventfd(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EventFd_read(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    eventfd_t *secondParam = nullptr;
    backParam = eventfd_read(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EventFd_write(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    eventfd_t secondParam = EFD_CLOEXEC;
    backParam = eventfd_write(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FGetXAttr(napi_env env, napi_callback_info info)
{
    ssize_t size_t = PARAM_0, len = 64;
    int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    const char *secondParam = "/data/storage/el2/base/files";
    void *value = nullptr;
    size_t = fgetxattr(firstParam, secondParam, value, len);
    napi_value result = nullptr;
    napi_create_int32(env, size_t, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"dn_comp", nullptr, Dn_comp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dn_skipname", nullptr, Dn_skipname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"drem", nullptr, DRem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dremf", nullptr, DRemF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finite", nullptr, Finite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitef", nullptr, FiniteF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endmntent", nullptr, EndMntEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clone", nullptr, Clone, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endutent", nullptr, EndUTent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_create", nullptr, Epoll_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_create1", nullptr, Epoll_create1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_ctl", nullptr, Epoll_ctl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_pwait", nullptr, Epoll_PWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_wait", nullptr, Epoll_Wait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_aton", nullptr, Ether_aTon, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_aton_r", nullptr, Ether_aTon_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_ntoa", nullptr, Ether_nToa, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_ntoa_r", nullptr, Ether_nToa_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventfd", nullptr, EventFd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventfd_read", nullptr, EventFd_read, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventfd_write", nullptr, EventFd_write, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetxattr", nullptr, FGetXAttr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dirname", nullptr, DirName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closelog", nullptr, CloseLog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dlopen", nullptr, DlOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dlclose", nullptr, DlClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dlerror", nullptr, DlError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dladdr", nullptr, DlaDdr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"flock", nullptr, Flock, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libotherstestndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
