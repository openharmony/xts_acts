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

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <sched.h>
#include <unistd.h>
#define FAIL -1
#define NO_ERR 0
#define TWENTYTHREE 23
#define DEFAULTVALUE -100

static napi_value SchedGetPriorityMax(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int maxvalue = sched_get_priority_max(first);
    napi_value result;
    napi_create_int32(env, maxvalue, &result);
    return result;
}

static napi_value SchedGetPriorityMin(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int minvalue = sched_get_priority_min(first);
    napi_value result;
    napi_create_int32(env, minvalue, &result);
    return result;
}

static napi_value SchedYield(napi_env env, napi_callback_info info)
{
    int sch_value = sched_yield();
    napi_value result;
    napi_create_int32(env, sch_value, &result);
    return result;
}

static napi_value SchedSetparam(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    struct sched_param param;
    pid_t pid = getpid();
    int first;
    napi_get_value_int32(env, args[0], &first);
    int maxpri = sched_get_priority_max(SCHED_OTHER);
    int minpri = sched_get_priority_min(SCHED_OTHER);
    if (maxpri == FAIL || minpri == FAIL) {
        napi_value result;
        napi_create_int32(env, FAIL, &result);
        return result;
    } else if (first == NO_ERR) {
        param.sched_priority = TWENTYTHREE;
        int ret = sched_setparam(pid, &param);
        napi_value result;
        napi_create_int32(env, ret, &result);
        return result;
    }
    if (first == FAIL) {
        param.sched_priority = TWENTYTHREE;
        int schval = sched_setparam(pid, nullptr);
        napi_value result;
        napi_create_int32(env, schval, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, DEFAULTVALUE, &result);
    return result;
}

static napi_value SchedSetscheduler(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int sched;
    pid_t pid = getpid();
    sched = SCHED_FIFO;
    struct sched_param param;
    if (first == NO_ERR) {
        param.sched_priority = TWENTYTHREE;
        int schval = sched_setscheduler(pid, sched, &param);
        napi_value result;
        napi_create_int32(env, schval, &result);
        return result;
    }
    if (first == FAIL) {
        int schval = sched_setscheduler(pid, sched, nullptr);
        napi_value result;
        napi_create_int32(env, schval, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, DEFAULTVALUE, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"schedGetPriorityMax", nullptr, SchedGetPriorityMax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schedGetPriorityMin", nullptr, SchedGetPriorityMin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_yield", nullptr, SchedYield, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_setparam", nullptr, SchedSetparam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sched_setscheduler", nullptr, SchedSetscheduler, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "sched",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }