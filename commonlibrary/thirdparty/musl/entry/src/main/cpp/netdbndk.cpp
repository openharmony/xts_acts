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
#include <cstring>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <utmp.h>
#include <uv.h>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL -1
#define TRUE 1
#define LENGTH 64
#define ZERO 0
#define EIGHTY 80
#define BUFLEN 256
#define FLAG 127
static napi_value GetProtoEnt(napi_env env, napi_callback_info info)
{
    struct protoent *getInfo;
    getInfo = getprotoent();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetProtoByName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = LENGTH, strResult = ZERO;
    char *proto_name = (char *)malloc(sizeof(char) * length);

    napi_get_value_string_utf8(env, args[0], proto_name, length, &strResult);
    struct protoent *getInfo;
    getInfo = getprotobyname(proto_name);
    napi_value result = nullptr;
    if (getInfo != nullptr) {
        napi_create_string_utf8(env, getInfo->p_name, NAPI_AUTO_LENGTH, &result);
    } else {
        napi_create_string_utf8(env, "null", NAPI_AUTO_LENGTH, &result);
    }
    return result;
}
static napi_value GetProtoByNumber(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct protoent *getInfo;
    getInfo = getprotobynumber(valueZero);
    napi_value result = nullptr;
    if (getInfo != nullptr) {
        napi_create_string_utf8(env, getInfo->p_name, NAPI_AUTO_LENGTH, &result);
    } else {
        napi_create_string_utf8(env, "null", NAPI_AUTO_LENGTH, &result);
    }
    return result;
}
static napi_value GetNameInfo(napi_env env, napi_callback_info info)
{
    char *ptr;
    char hostname[128] = {0};
    char serverName[128] = {0};
    struct sockaddr_in addR_dst;

    memset(&addR_dst, ZERO, sizeof(addR_dst));
    addR_dst.sin_family = AF_INET;
    addR_dst.sin_addr.s_addr = inet_addr(ptr);

    int getInfo = getnameinfo((struct sockaddr *)&addR_dst, sizeof(addR_dst), hostname, sizeof(hostname), serverName,
                              sizeof(serverName), ZERO);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetHostEnt(napi_env env, napi_callback_info info)
{
    struct hostent *getInfo;
    errno = NO_ERR;
    sethostent(TRUE);
    getInfo = gethostent();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetServEnt(napi_env env, napi_callback_info info)
{
    struct servent *getInfo;
    errno = NO_ERR;
    setservent(TRUE);
    getInfo = getservent();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetNetEnt(napi_env env, napi_callback_info info)
{
    struct netent *getInfo;
    errno = NO_ERR;
    setnetent(TRUE);
    getInfo = getnetent();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetNetByAddr(napi_env env, napi_callback_info info)
{
    struct netent *getInfo;
    errno = NO_ERR;
    getInfo = getnetbyaddr(FLAG, AF_INET);
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetNetByName(napi_env env, napi_callback_info info)
{
    struct netent *getInfo;
    errno = NO_ERR;
    getInfo = getnetbyname("loopback");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetServByName(napi_env env, napi_callback_info info)
{
    struct servent *getInfo;
    errno = NO_ERR;
    getInfo = getservbyname("http", "tcp");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetServByPort(napi_env env, napi_callback_info info)
{
    struct servent *getInfo;
    errno = NO_ERR;
    getInfo = getservbyport(htons(EIGHTY), "tcp");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByName(napi_env env, napi_callback_info info)
{
    struct hostent *getInfo;
    errno = NO_ERR;
    getInfo = gethostbyname("tcp");
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByAddr(napi_env env, napi_callback_info info)
{
    struct hostent *getInfo;
    errno = NO_ERR;
    const char *add = "10.1.59.80";
    char p[30];
    inet_pton(AF_INET, add, p);
    getInfo = gethostbyaddr(p, strlen(p), AF_INET);
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByNameR(napi_env env, napi_callback_info info)
{
    int getInfo;
    errno = NO_ERR;
    char buf[1024];
    struct hostent hostInfo, *pHost;
    int type;
    getInfo = gethostbyname_r("tcp", &hostInfo, buf, sizeof(buf), &pHost, &type);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetHostByAddrR(napi_env env, napi_callback_info info)
{
    int getInfo;
    errno = NO_ERR;
    char ip_address[] = "13.2.37.103";
    struct in_addr address;
    inet_pton(AF_INET, ip_address, &address);

    struct hostent host_buf;
    struct hostent *host_result;
    char buffer[2048];
    int errNum;
    getInfo =
        gethostbyaddr_r(&address, sizeof(address), AF_INET, &host_buf, buffer, sizeof(buffer), &host_result, &errNum);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetHostByName2(napi_env env, napi_callback_info info)
{
    struct hostent *getInfo;
    errno = NO_ERR;
    getInfo = gethostbyname2("tcp", AF_INET);
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetHostByName2R(napi_env env, napi_callback_info info)
{
    int getInfo;
    errno = NO_ERR;
    int err;
    int buf_len = BUFLEN;
    struct hostent hBuf;
    struct hostent *ret;
    char *buf = (char *)malloc(buf_len);
    memset(buf, ZERO, buf_len);
    getInfo = gethostbyname2_r("tcp", AF_INET, &hBuf, buf, buf_len, &ret, &err);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getProtoEnt", nullptr, GetProtoEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getProtoByName", nullptr, GetProtoByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getProtoByNumber", nullptr, GetProtoByNumber, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNameInfo", nullptr, GetNameInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostEnt", nullptr, GetHostEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServEnt", nullptr, GetServEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNetEnt", nullptr, GetNetEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNetByAddr", nullptr, GetNetByAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNetByName", nullptr, GetNetByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServByName", nullptr, GetServByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServByPort", nullptr, GetServByPort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByName", nullptr, GetHostByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByAddr", nullptr, GetHostByAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByNameR", nullptr, GetHostByNameR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByAddrR", nullptr, GetHostByAddrR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByName2", nullptr, GetHostByName2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostByName2R", nullptr, GetHostByName2R, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libnetdb",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
