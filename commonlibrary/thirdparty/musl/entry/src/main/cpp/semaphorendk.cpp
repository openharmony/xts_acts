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
#include <pthread.h>
#include <sched.h>
#include <semaphore.h>
#define ONEHUNDRED 100
#define TWOHUNDRED 200
#define THOUSAND 1000
#define ZERO 0
#define ONE 1
#define FLAG (0644)
static napi_value SemGetvalue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp;
    int ret = sem_getvalue(&semp, &first);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SemOpen(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int a = ONEHUNDRED;
    sem_t *semFirst = sem_open("./test", O_CREAT, FLAG, ONE);
    if (semFirst == SEM_FAILED || semFirst == nullptr) {
        a = -THOUSAND;
    } else {
        a = TWOHUNDRED;
    }
    napi_value result;
    napi_create_int32(env, a, &result);
    return result;
}

static napi_value SemInit(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    sem_t bin_sem;
    int ret = sem_init(&bin_sem, ZERO, first);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static sem_t g_sem;
void *threadfuncA(void *arg)
{
    sem_wait(&g_sem);
    return arg;
}

static napi_value SemDestroy(napi_env env, napi_callback_info info)
{
    sem_t semp;
    sem_init(&semp, ZERO, ONE);
    int sem = sem_destroy(&semp);
    napi_value result;
    napi_create_int32(env, sem, &result);
    return result;
}

static napi_value SemPost(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    pthread_t tid;
    sem_init(&g_sem, ZERO, ZERO);
    pthread_create(&tid, nullptr, threadfuncA, nullptr);
    struct sched_param sched;
    sched.sched_priority = ZERO;
    pthread_setschedparam(tid, SCHED_OTHER, &sched);
    int semRet = sem_post(&g_sem);
    napi_value result;
    napi_create_int32(env, semRet, &result);
    return result;
}

static napi_value SemWait(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp;
    sem_init(&semp, ZERO, first);
    int sem = sem_wait(&semp);
    napi_value result;
    napi_create_double(env, sem, &result);
    return result;
}

static napi_value SemTrywait(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp;
    sem_init(&semp, ZERO, first);
    int sem = sem_trywait(&semp);
    napi_value result;
    napi_create_double(env, sem, &result);
    return result;
}

static napi_value SemTimedwait(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp;
    sem_init(&semp, ZERO, first);
    struct timespec spec;
    int sem = sem_timedwait(&semp, &spec);
    napi_value result;
    napi_create_double(env, sem, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sem_init", nullptr, SemInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_destroy", nullptr, SemDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_open", nullptr, SemOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_post", nullptr, SemPost, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_wait", nullptr, SemWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_timedwait", nullptr, SemTimedwait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_trywait", nullptr, SemTrywait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_getvalue", nullptr, SemGetvalue, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "semaphore",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
