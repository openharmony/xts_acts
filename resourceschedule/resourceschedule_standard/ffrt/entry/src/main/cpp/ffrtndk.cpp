/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "hilog/log.h"
#include "ffrt/task.h"
#include "ffrt/type_def.h"
#include "ffrt/condition_variable.h"
#include "ffrt/mutex.h"
#include "ffrt/queue.h"
#include "ffrt/sleep.h"
#include <string>
#include <unistd.h>

void my_print(void* arg)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "%{public}s", "hello ffrt\n");
}

void OnePlusForTest(void* arg)
{
    *(int*) arg += 1;
}

void MulipleForTest(void* arg)
{
    *(int*) arg *= 10;
}

void SubForTest(void* arg)
{
    *(int*) arg -= 1;
}

typedef struct {
    ffrt_function_header_t header;
    ffrt_function_t func;
    ffrt_function_t after_func;
    void* arg;
} c_function;

typedef struct {
    ffrt_cond_t* cond;
    int* a;
    ffrt_mutex_t* lock_;
} tuple;

void func1(void* arg)
{
    tuple* t = (tuple*)arg;
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    while (*t->a != 1) {
        ret = ffrt_cond_wait(t->cond, t->lock_);
        if (ret != ffrt_success) {
            printf("error\n");
        }
    }
    *(t->a) = 3;
    ret = ffrt_cond_signal(t->cond);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    printf("a = %d", *(t->a));
}

void func2(void* arg)
{
    tuple* t = (tuple*)arg;
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    *(t->a) = 1;
    ret = ffrt_cond_broadcast(t->cond);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        printf("error\n");
    }
}

void func3(void* arg)
{
    tuple* t = (tuple*)arg;
    int ret = ffrt_mutex_trylock(t->lock_);
    if (ret != ffrt_success) {
        printf("error\n");
        ret = ffrt_mutex_lock(t->lock_);
        if (ret != ffrt_success) {
            printf("error\n");
        }
    }
    while (*t->a != 3) {
        ret = ffrt_cond_timedwait(t->cond, t->lock_, nullptr);
        if (ret != ffrt_success) {
            printf("error\n");
            ret = ffrt_cond_wait(t->cond, t->lock_);
            if (ret != ffrt_success) {
                printf("error\n");
            }
        }
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    printf("a = %d", *(t->a));
}

static void ffrt_exec_function_wrapper(void* t)
{
    c_function* f = (c_function*)t;
    if (f->func) {
        f->func(f->arg);
    }
}

static void ffrt_destroy_function_wrapper(void* t)
{
    c_function* f = (c_function*)t;
    if (f->after_func) {
        f->after_func(f->arg);
    }
}

#define FFRT_STATIC_ASSERT(cond, msg) int x(int static_assertion_##msg[(cond) ? 1 : -1])
static inline ffrt_function_header_t* ffrt_create_function_wrapper(const ffrt_function_t func,
    const ffrt_function_t after_func, void* arg, ffrt_function_kind_t kind_t = ffrt_function_kind_general)
{
    FFRT_STATIC_ASSERT(sizeof(c_function) <= ffrt_auto_managed_function_storage_size,
        size_of_function_must_be_less_than_ffrt_auto_managed_function_storage_size);
    c_function* f = (c_function*)ffrt_alloc_auto_managed_function_storage_base(kind_t);
    f->header.exec = ffrt_exec_function_wrapper;
    f->header.destroy = ffrt_destroy_function_wrapper;
    f->func = func;
    f->after_func = after_func;
    f->arg = arg;
    return (ffrt_function_header_t*)f;
}

static inline void ffrt_submit_c(ffrt_function_t func, const ffrt_function_t after_func,
    void* arg, const ffrt_deps_t* in_deps, const ffrt_deps_t* out_deps, const ffrt_task_attr_t* attr)
{
    ffrt_submit_base(ffrt_create_function_wrapper(func, after_func, arg), in_deps, out_deps, attr);
}

static inline ffrt_task_handle_t ffrt_submit_h_c(ffrt_function_t func, const ffrt_function_t after_func,
    void* arg, const ffrt_deps_t* in_deps, const ffrt_deps_t* out_deps, const ffrt_task_attr_t* attr)
{
    return ffrt_submit_h_base(ffrt_create_function_wrapper(func, after_func, arg), in_deps, out_deps, attr);
}

void ffrt_cv_task(void* arg)
{
    int* a = (int*) arg;
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, NULL);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    ffrt_mutex_t lock_;
    tuple t = {&cond, a, &lock_};
    ret = ffrt_mutex_init(&lock_, NULL);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    ffrt_submit_c(func1, NULL, &t, NULL, NULL, NULL);
    ffrt_submit_c(func2, NULL, &t, NULL, NULL, NULL);
    ffrt_submit_c(func3, NULL, &t, NULL, NULL, NULL);
    ffrt_wait();
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
}

static napi_value SubmitSimpleFfrtTask(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "%{public}s", "ffrt start\n");
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    ffrt_task_attr_set_qos(&attr, static_cast<ffrt_qos_t>(ffrt_qos_background));
    ffrt_task_attr_set_name(&attr, "ffrt_testA");
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "task delay is %{public}d", ffrt_task_attr_get_delay(&attr));
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "task name is %{public}s", ffrt_task_attr_get_name(&attr));
    ffrt_task_attr_set_delay(&attr, 1000);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "task delay2 is %{public}d", ffrt_task_attr_get_delay(&attr));
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "qos is %{public}d", ffrt_task_attr_get_qos(&attr));
    ffrt_task_attr_set_qos(&attr, static_cast<ffrt_qos_t>(ffrt_qos_user_initiated));
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "qos2 is %{public}d", ffrt_task_attr_get_qos(&attr));
    ffrt_submit_c(my_print, NULL, NULL, NULL, NULL, &attr);
    int result = ffrt_this_task_update_qos(static_cast<ffrt_qos_t>(ffrt_qos_default));
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "update_qos result is %{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "qos3 is %{public}d", ffrt_task_attr_get_qos(&attr));
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "task id is %{public}d", ffrt_this_task_get_id());
    ffrt_usleep(10000);
    ffrt_yield();
    ffrt_task_attr_destroy(&attr);
    ffrt_wait();
    napi_value flag = nullptr;
    napi_create_double(env, 1, &flag);
    return flag;
}

static napi_value SubmitCondFfrtTask(napi_env env, napi_callback_info info)
{
    int a = 0;
    ffrt_submit_c(ffrt_cv_task, NULL, &a, NULL, NULL, NULL);
    ffrt_task_handle_t task1 = ffrt_submit_h_c(my_print, NULL, NULL, NULL, NULL, NULL);
    ffrt_wait_deps(nullptr);
    ffrt_wait();
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "cond task a is %{public}d", a);
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    ffrt_task_handle_destroy(task1);
    return flag;
}

static napi_value SubmitQueueFfrtTask(napi_env env, napi_callback_info info)
{
    int a = 0;
    int b = 0;
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, ffrt_qos_default);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task qos is %{public}d", ffrt_queue_attr_get_qos(&queue_attr));
    ffrt_queue_attr_set_timeout(&queue_attr, 10000);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task time is %{public}d", ffrt_queue_attr_get_timeout(&queue_attr));
    ffrt_queue_attr_set_callback(&queue_attr, ffrt_create_function_wrapper(OnePlusForTest, NULL, &b, ffrt_function_kind_queue));
    ffrt_queue_attr_get_callback(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, NULL, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_cancel(task1);
    ffrt_queue_wait(task1);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(MulipleForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(SubForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    sleep(2);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task a is %{public}d", a);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task b is %{public}d", b);
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    ffrt_task_handle_destroy(task1);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    return flag;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "submitSimpleFfrtTask", nullptr, SubmitSimpleFfrtTask, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitCondFfrtTask", nullptr, SubmitCondFfrtTask, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitQueueFfrtTask", nullptr, SubmitQueueFfrtTask, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ffrtndk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
