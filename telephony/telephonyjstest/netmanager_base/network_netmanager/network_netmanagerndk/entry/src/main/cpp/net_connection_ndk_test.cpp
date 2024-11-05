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

#include "napi/native_api.h"
#include <network/netmanager/net_connection.h>
#include <network/netmanager/net_connection_type.h>

static napi_value OHGetNetCapabilities(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = 0;
    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);
    napi_value result;

    if (netId == -1) {
        ret = OH_NetConn_GetNetCapabilities(NULL, NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        NetConn_NetCapabilities netCapacities;
        ret = OH_NetConn_GetNetCapabilities(&netHandle, &netCapacities);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value OHGetAllNets(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = 0;
    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);
    napi_value result;

    if (netId == -1) {
        ret = OH_NetConn_GetAllNets(NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        NetConn_NetHandleList netHandles;
        ret = OH_NetConn_GetAllNets(&netHandles);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value OHGetConnectionProperties(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = 0;
    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);
    napi_value result;
    
    if (netId == -1) {
        ret = OH_NetConn_GetConnectionProperties(NULL, NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        NetConn_ConnectionProperties netProp;
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_GetConnectionProperties(&netHandle, &netProp);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value OHGetDefaultNet(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = 0;
    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);
    napi_value result;

    if (netId == -1) {
        ret = OH_NetConn_GetDefaultNet(NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        NetConn_NetHandle netHandle;
        ret = OH_NetConn_GetDefaultNet(&netHandle);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value OHHasDefaultNet(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = 0;
    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);
    napi_value result;

    if (netId == -1) {
        ret = OH_NetConn_HasDefaultNet(NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        int flag = 999;
        ret = OH_NetConn_HasDefaultNet(&flag);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value OHIsDefaultNetMetered(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = 0;
    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);
    napi_value result;

    if (netId == -1) {
        ret = OH_NetConn_IsDefaultNetMetered(NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        int flag = 888;
        ret = OH_NetConn_IsDefaultNetMetered(&flag);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value OHGetDefaultHttpProxy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t ret = 0;

    int32_t netId;
    napi_get_value_int32(env, args[0], &netId);

    napi_value result;

    if (netId == -1) {
        ret = OH_NetConn_GetDefaultHttpProxy(NULL);
        napi_create_int32(env, ret, &result);
        return result;
    } else {
        NetConn_HttpProxy httpProxy;
        ret = OH_NetConn_GetDefaultHttpProxy(&httpProxy);
        napi_create_int32(env, ret, &result);
        return result;
    }
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHGetDefaultNet", nullptr, OHGetDefaultNet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHGetAllNets", nullptr, OHGetAllNets, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHGetNetCapabilities", nullptr, OHGetNetCapabilities, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHGetConnectionProperties", nullptr, OHGetConnectionProperties, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHHasDefaultNet", nullptr, OHHasDefaultNet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHisDefaultNetMetered", nullptr, OHisDefaultNetMetered, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHGetDefaultHttpProxy", nullptr, OHetDefaultHttpProxy, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
