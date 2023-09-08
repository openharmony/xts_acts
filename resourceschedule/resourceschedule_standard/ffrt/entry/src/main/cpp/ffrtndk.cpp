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
#include "c/task.h"
#include "c/type_def.h"
#include "c/condition_variable.h"
#include "c/mutex.h"
#include "c/queue.h"
#include "c/sleep.h"
#include <mutex>
#include <thread>
#include <string>
#include <unistd.h>

void MyPrint(void* arg)
{
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "%{public}s", "hello ffrt\n");
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

void SleepAfterOnePlusTest(void* arg)
{
    *(int*) arg += 1;
    usleep(20000);
}

void OnePlusSleepForTest(void* arg)
{
    sleep(5);
    *(int*) arg += 1;
}

typedef struct {
    ffrt_function_header_t header;
    ffrt_function_t func;
    ffrt_function_t after_func;
    void* arg;
} CFunction;

typedef struct {
    ffrt_cond_t* cond;
    int* a;
    ffrt_mutex_t* lock_;
} FfrtTuple;

void Func1(void* arg)
{
    FfrtTuple* t = (FfrtTuple*)arg;
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

void Func2(void* arg)
{
    FfrtTuple* t = (FfrtTuple*)arg;
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

void Func3(void* arg)
{
    FfrtTuple* t = (FfrtTuple*)arg;
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

static void FfrtExecFunctionWrapper(void* t)
{
    CFunction* f = (CFunction*)t;
    if (f->func) {
        f->func(f->arg);
    }
}

static void FfrtDestroyFunctionWrapper(void* t)
{
    CFunction* f = (CFunction*)t;
    if (f->after_func) {
        f->after_func(f->arg);
    }
}

#define FFRT_STATIC_ASSERT(cond, msg) int x(int static_assertion_##msg[(cond) ? 1 : -1])
static inline ffrt_function_header_t* ffrt_create_function_wrapper(const ffrt_function_t func,
    const ffrt_function_t after_func, void* arg, ffrt_function_kind_t kind_t = ffrt_function_kind_general)
{
    FFRT_STATIC_ASSERT(sizeof(CFunction) <= ffrt_auto_managed_function_storage_size,
        size_of_function_must_be_less_than_ffrt_auto_managed_function_storage_size);
    CFunction* f = (CFunction*)ffrt_alloc_auto_managed_function_storage_base(kind_t);
    f->header.exec = FfrtExecFunctionWrapper;
    f->header.destroy = FfrtDestroyFunctionWrapper;
    f->func = func;
    f->after_func = after_func;
    f->arg = arg;
    return (ffrt_function_header_t*)f;
}

template<class T>
struct function {
    template<class CT>
    function(ffrt_function_header_t h, CT&& c) : header(h), closure(std::forward<CT>(c)) {}
    ffrt_function_header_t header;
    T closure;
};

template<class T>
void exec_function_wrapper(void* t)
{
    auto f = reinterpret_cast<function<std::decay_t<T>>*>(t);
    f->closure();
}

template<class T>
void destroy_function_wrapper(void* t)
{
    auto f = reinterpret_cast<function<std::decay_t<T>>*>(t);
    f->closure = nullptr;
}

template<class T>
static inline ffrt_function_header_t* create_function_wrapper(T&& func,
    ffrt_function_kind_t kind = ffrt_function_kind_general)
{
    using function_type = function<std::decay_t<T>>;
    auto p = ffrt_alloc_auto_managed_function_storage_base(kind);
    auto f =
        new (p)function_type({ exec_function_wrapper<T>, destroy_function_wrapper<T>, { 0 } }, std::forward<T>(func));
    return reinterpret_cast<ffrt_function_header_t*>(f);
}

static inline void ffrt_submit_c(ffrt_function_t func, void* arg,
    const ffrt_deps_t* in_deps, const ffrt_deps_t* out_deps, const ffrt_task_attr_t* attr)
{
    ffrt_submit_base(ffrt_create_function_wrapper(func, NULL, arg), in_deps, out_deps, attr);
}

static inline ffrt_task_handle_t ffrt_submit_h_c(ffrt_function_t func, void* arg,
    const ffrt_deps_t* in_deps, const ffrt_deps_t* out_deps, const ffrt_task_attr_t* attr)
{
    return ffrt_submit_h_base(ffrt_create_function_wrapper(func, NULL, arg), in_deps, out_deps, attr);
}

void FfrtCvTask(void* arg)
{
    int* a = (int*) arg;
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, NULL);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    ffrt_mutex_t lock_;
    FfrtTuple t = {&cond, a, &lock_};
    ret = ffrt_mutex_init(&lock_, NULL);
    if (ret != ffrt_success) {
        printf("error\n");
    }
    ffrt_submit_c(Func1, &t, NULL, NULL, NULL);
    ffrt_submit_c(Func2, &t, NULL, NULL, NULL);
    ffrt_submit_c(Func3, &t, NULL, NULL, NULL);
    ffrt_wait();
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
}

/**
 * add simple ffrt task submit example
*/
static napi_value SubmitSimpleFfrtTask(napi_env env, napi_callback_info info)
{
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "%{public}s", "ffrt start\n");
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    ffrt_task_attr_set_qos(&attr, static_cast<ffrt_qos_t>(ffrt_qos_background));
    ffrt_task_attr_set_name(&attr, "ffrt_testA");
    ffrt_task_attr_get_delay(&attr);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "task name is %{public}s", ffrt_task_attr_get_name(&attr));
    ffrt_task_attr_set_delay(&attr, 1000);
    ffrt_task_attr_get_delay(&attr);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "qos is %{public}d", ffrt_task_attr_get_qos(&attr));
    ffrt_task_attr_set_qos(&attr, static_cast<ffrt_qos_t>(ffrt_qos_user_initiated));
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "qos2 is %{public}d", ffrt_task_attr_get_qos(&attr));
    ffrt_submit_c(MyPrint, NULL, NULL, NULL, &attr);
    int result = ffrt_this_task_update_qos(static_cast<ffrt_qos_t>(ffrt_qos_default));
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "update_qos result is %{public}d", result);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "qos3 is %{public}d", ffrt_task_attr_get_qos(&attr));
    ffrt_this_task_get_id();
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
    ffrt_submit_c(FfrtCvTask, &a, NULL, NULL, NULL);
    ffrt_task_handle_t task1 = ffrt_submit_h_c(MyPrint, NULL, NULL, NULL, NULL);
    ffrt_wait_deps(nullptr);
    ffrt_wait();
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "cond task a is %{public}d", a);
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    ffrt_task_handle_destroy(task1);
    return flag;
}

/**
 * add simple ffrt queue task submit example
*/
static napi_value SubmitQueueFfrtTask(napi_env env, napi_callback_info info)
{
    int a = 0;
    int b = 0;
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, ffrt_qos_default);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task qos is %{public}d",
        ffrt_queue_attr_get_qos(&queue_attr));
    ffrt_queue_attr_set_timeout(&queue_attr, 10000);
    ffrt_queue_attr_get_timeout(&queue_attr);
    ffrt_queue_attr_set_callback(&queue_attr,
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &b, ffrt_function_kind_queue));
    ffrt_queue_attr_get_callback(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle,
        ffrt_create_function_wrapper(MulipleForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle,
        ffrt_create_function_wrapper(SubForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    sleep(2);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task a is %{public}d", a);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "queue task b is %{public}d", b);
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    ffrt_task_handle_destroy(task1);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    return flag;
}

static napi_value QueueTest001(napi_env env, napi_callback_info info)
{
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    int result = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &result, ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(MulipleForTest, nullptr, &result, ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(SubForTest, nullptr, &result, ffrt_function_kind_queue), nullptr);
    napi_value flag = nullptr;
    sleep(2);
    napi_create_double(env, result, &flag);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    return flag;
}

static napi_value QueueTest002(napi_env env, napi_callback_info info)
{
    const int maxNum = (int)ffrt_qos_user_initiated + 1;
    ffrt_queue_attr_t queue_attr[maxNum];
    ffrt_queue_t queue_handle[maxNum];
    for (int num = 0; num < maxNum; num++) {
        (void)ffrt_queue_attr_init(&queue_attr[num]);
        ffrt_queue_attr_set_qos(&queue_attr[num], num);
        queue_handle[num] = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr[num]);
    }
    
    int a = 0;
    int result[maxNum] = {0};
    ffrt_task_handle_t task[maxNum][10];
    for (int i = 0; i < 10; i++) {
        for (int num = 0; num < maxNum; num++) {
            task[num][i] = ffrt_queue_submit_h(queue_handle[num],
                ffrt_create_function_wrapper(OnePlusForTest, NULL, &result[num], ffrt_function_kind_queue), nullptr);
        }
    }
    for (int num = 0; num < maxNum; num++) {
        ffrt_queue_wait(task[num][9]);
        HiLogPrint(LOG_APP, LOG_INFO, 1, "FFRT QUEUE", "result in queue task %{public}d is %{public}d", num, result[num]);
        if (result[num] != 10) {
            a = 1;
        }
    }
    for (int i = 0; i < 10; i++) {
        for (int num = 0; num < maxNum; num++) {
            ffrt_task_handle_destroy(task[num][i]);
        }
    }
    for (int num =0; num < maxNum; num++) {
        HiLogPrint(LOG_APP, LOG_INFO, 1, "FFRT QUEUE", "qos in queue task %{public}d is %{public}d", num, ffrt_queue_attr_get_qos(&queue_attr[num]));
        if (ffrt_queue_attr_get_qos(&queue_attr[num]) != num) {
            a = 1;
        }
        ffrt_queue_attr_destroy(&queue_attr[num]);
        ffrt_queue_destroy(queue_handle[num]);
    }
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    return flag;
}

static napi_value QueueDfxTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_timeout接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_attr_set_timeout(nullptr, 10000);
    uint64_t time = ffrt_queue_attr_get_timeout(&queue_attr);
    if (time != 0) {
        result = 1;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 2;
    }
    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_get_timeout接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_attr_set_timeout(&queue_attr, 10000);
    uint64_t time = ffrt_queue_attr_get_timeout(nullptr);
    if (time != 0) {
        result = 1;
    }
    time = ffrt_queue_attr_get_timeout(&queue_attr);
    if (time != 10000) {
        result = 2;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest003(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_timeoutCb接口attr为异常值

    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_attr_set_callback(nullptr, ffrt_create_function_wrapper(MyPrint, NULL, NULL, ffrt_function_kind_queue));
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest004(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_attr_set_callback(&queue_attr, ffrt_create_function_wrapper(MyPrint, NULL, NULL, ffrt_function_kind_queue));
    ffrt_function_header_t* func = ffrt_queue_attr_get_callback(nullptr);
    if (func != nullptr) {
        result = 1;
    }
    func = ffrt_queue_attr_get_callback(&queue_attr);
    if (func == nullptr) {
        result = 2;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_destroy(queue_handle);
    ffrt_queue_attr_destroy(&queue_attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_create接口type为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_max, "test_queue", &queue_attr);
    if (queue_handle != nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_create接口name为空
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, nullptr, &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    // 使用简化接口提交，不支持设置时延和任务名称，不返回task_handle，不支持取消任务和等待任务
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest003(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", nullptr);
    if (queue_handle != nullptr) {
        result = 3;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest004(napi_env env, napi_callback_info info)
{
    int result = 0;
    (void)ffrt_queue_attr_init(nullptr);
    sleep(1);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest005(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_destroy接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }
    
    int a = 0;
    // 使用简化接口提交，不支持设置时延和任务名称，不返回task_handle，不支持取消任务和等待任务
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(nullptr);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest006(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_qos接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_attr_set_qos(nullptr, static_cast<int>(ffrt_qos_utility)); // 设置队列的优先级，非必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    // 使用简化接口提交，不支持设置时延和任务名称，不返回task_handle，不支持取消任务和等待任务
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest007(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_qos接口qos为异常值
    // 设置qos为-1
    ffrt_queue_attr_t queue_attr;
    ffrt_queue_t queue_handle;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, (ffrt_qos_t)(-1));
    int ret = ffrt_queue_attr_get_qos(&queue_attr);
    if (ret != -1) {
        result = 1;
    }
    queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue",&queue_attr);

    int a = 0;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(handle);
    if (a != 1) {
        result = 2;
    }

    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    
    // 设置qos为-2
    ffrt_queue_attr_set_qos(&queue_attr, (ffrt_qos_t)(-2));
    ret = ffrt_queue_attr_get_qos(&queue_attr);
    if (ret != -1) {
        result = 1;
    }
    queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue",&queue_attr);

    handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    usleep(2000);
    ffrt_queue_wait(handle);
    if (a != 2) {
        result = 3;
    }

    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest008(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_get_qos接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_attr_set_qos(&queue_attr, static_cast<int>(ffrt_qos_utility)); // 设置队列的优先级，非必须
    int ret = ffrt_queue_attr_get_qos(nullptr);
    if (ret != 2) {
        result = 2;
    }
    ret = ffrt_queue_attr_get_qos(&queue_attr);
    if (ret != 1) {
        result = 1;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    // 使用简化接口提交，不支持设置时延和任务名称，不返回task_handle，不支持取消任务和等待任务
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest009(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_destroy接口queue为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    // 使用简化接口提交，不支持设置时延和任务名称，不返回task_handle，不支持取消任务和等待任务
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(nullptr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest010(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_submit接口queue或f为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    // 使用简化接口提交，不支持设置时延和任务名称，不返回task_handle，不支持取消任务和等待任务
    ffrt_queue_submit(nullptr, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, nullptr, nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest011(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_submit_h接口queue或f为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(nullptr,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    if (handle != nullptr) {
        result = 1;
    }
    handle = ffrt_queue_submit_h(queue_handle, nullptr, nullptr);
    if (handle != nullptr) {
        result = 2;
    }
    handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(handle);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest012(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_wait接口handle为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(nullptr);
    ffrt_queue_wait(handle);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest013(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_cancel接口handle为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr); // 初始化task属性，必须
    ffrt_task_attr_set_delay(&task_attr, 1000000); // 设置任务1s后才执行
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), &task_attr);

    int ret = ffrt_queue_cancel(nullptr);
    if (ret != -1) {
        result = 1;
    }
    ret = ffrt_queue_cancel(task1);
    if (ret != 0) {
        result = 2;
    }
    if (a != 0) {
        result = 3;
    }

    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1); // 销毁task_handle，必须

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    if (a != 0) {
        result = 4;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueCancelTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // cancel一个delay的未执行task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr); // 初始化task属性，必须
    ffrt_task_attr_set_delay(&task_attr, 1000000); // 设置任务1s后才执行
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), &task_attr);

    int ret = ffrt_queue_cancel(task1);
    if (ret != 0) {
        result = 2;
    }
    if (a != 0) {
        result = 3;
    }

    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1); // 销毁task_handle，必须

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    if (a != 0) {
        result = 4;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueCancelTest003(napi_env env, napi_callback_info info)
{
    int result = 0;
    // cancel一个执行中task,ffrt的sleep
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusSleepForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    usleep(2000);
    int ret = ffrt_queue_cancel(task1);
    if (ret != 1) {
        result = 2;
    }
    if (a != 0) {
        result = 3;
    }
    ffrt_task_handle_destroy(task1); // 销毁task_handle，必须
    if (a != 0) {
        result = 4;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    if (a != 1) {
        result = 5;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueCancelTest004(napi_env env, napi_callback_info info)
{
    int result = 0;
    // cancel一个已执行的task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr); // 初始化属性，必须
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    ffrt_task_handle_t task2 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusSleepForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    sleep(2);
    int ret = ffrt_queue_cancel(task1);
    if (ret != 1) {
        result = 2;
    }
    if (a != 1) {
        result = 3;
    }
    ffrt_queue_wait(task2);
    if (a != 2) {
        result = 4;
    }
    ffrt_task_handle_destroy(task1); // 销毁task_handle，必须
    ffrt_task_handle_destroy(task2); // 销毁task_handle，必须

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value FFRTSubmitBasicTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 5 * 1000;
    int a = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr);
    ffrt_submit_c(OnePlusForTest, &a, NULL, NULL, attr);
    ffrt_wait();
    usleep(sleepTime);
    if (a != 1) {
        result = 3;
    }
    ffrt_task_attr_destroy(attr);
    free(attr);
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value FFRTBasicTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    std::function<void()>&& func = [&]() { x = x + 1;};
    const std::vector<ffrt_dependence_t> in_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t in{static_cast<uint32_t>(in_deps.size()), in_deps.data()};
    const std::vector<ffrt_dependence_t> out_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t out{static_cast<uint32_t>(out_deps.size()), out_deps.data()};
    ffrt_function_header_t* ffrt_header_t = create_function_wrapper((func));
    ffrt_submit_base(ffrt_header_t, &in, &out, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value FFRTSubmitInDependEmptyTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, nullptr, nullptr);
    ffrt_submit_base(basic2Func_ht, &in2, nullptr, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    if (y != 1) {
        result = 2;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitInDependNullptrTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, nullptr, nullptr);
    ffrt_submit_base(basic2Func_ht, &in2, nullptr, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    if (y != 1) {
        result = 2;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitOuDependEmptyTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, &ou1, nullptr);
    ffrt_submit_base(basic2Func_ht, &in2, &ou2, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    if (y != 1) {
        result = 2;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitOuDependNullptrTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
        if (y != 0) {
            result = 1;
        }
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
        if (x != 1) {
            result = 2;
        }
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    ffrt_submit_base(basic1Func_ht, nullptr, &ou1, nullptr);
    ffrt_submit_base(basic2Func_ht, nullptr, &ou2, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 3;
    }
    if (y != 1) {
        result = 4;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitIODependAttrBasicTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
    };
    std::function<void()> &&basic2Func = [&]() {
        usleep(sleepTime);
        if (x != 1) {
            result = 1;
        }
        if (y != 0) {
            result = 2;
        }
        y = y + 1;
    };
    std::function<void()> &&basic3Func = [&]() {
        usleep(sleepTime);
        if (x != 1) {
            result = 3;
        }
        if (y != 1) {
            result = 4;
        }
    };
    ffrt_task_attr_t* attr1 = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr1);
    ffrt_task_attr_t* attr2 = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr2);
    ffrt_task_attr_set_qos(attr2, static_cast<int>(ffrt_qos_default));
    ffrt_task_attr_t* attr3 = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr3);
    ffrt_task_attr_set_qos(attr3, static_cast<int>(ffrt_qos_background));
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    ffrt_function_header_t* basic3Func_ht = create_function_wrapper((basic3Func));
    const std::vector<ffrt_dependence_t> in1_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, &x}, {ffrt_dependence_data, &y}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, &x}, {ffrt_dependence_data, &y}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    const std::vector<ffrt_dependence_t> ou3_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t ou3{static_cast<uint32_t>(ou3_deps.size()), ou3_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, &ou1, attr1);
    ffrt_submit_base(basic2Func_ht, &in2, &ou2, attr2);
    ffrt_submit_base(basic3Func_ht, &in2, &ou3, attr3);
    ffrt_wait();
    if (x != 1) {
        result = 5;
    }
    if (y != 1) {
        result = 6;
    }
    ffrt_task_attr_destroy(attr1);
    free(attr1);
    attr1 = nullptr;
    ffrt_task_attr_destroy(attr2);
    free(attr2);
    attr2 = nullptr;
    ffrt_task_attr_destroy(attr3);
    free(attr3);
    attr3 = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitIn0Ou0WaitNullTask1Test(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 30 * 1000;
    int x = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr);
    std::function<void()>&& basicFunc = [&]() {
        if (x != 0) {
            result = 1;
        }
        usleep(sleepTime);
        x = x + 1;
    };
    ffrt_function_header_t* basicFunc_ht = create_function_wrapper((basicFunc));
    const std::vector<ffrt_dependence_t> in_deps = {};
    ffrt_deps_t in{static_cast<uint32_t>(in_deps.size()), in_deps.data()};
    const std::vector<ffrt_dependence_t> ou_deps = {};
    ffrt_deps_t ou{static_cast<uint32_t>(ou_deps.size()), ou_deps.data()};
    const std::vector<ffrt_dependence_t> wait_deps = {};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    const ffrt_deps_t *wait_null = nullptr;
    ffrt_submit_base(basicFunc_ht, &in, &ou, attr);
    if (x != 0) {
        result = 2;
    }
    ffrt_wait_deps(wait_null);
    if (x != 0) {
        result = 3;
    }
    ffrt_wait_deps(&wait);
    if (x != 0) {
        result = 4;
    }
    ffrt_wait();
    if (x != 1) {
        result = 5;
    }
    ffrt_task_attr_destroy(attr);
    free(attr);
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value DelayCTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // 验证delay的set和delay c接口
    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr); // 初始化属性，必须
    ffrt_task_attr_set_delay(&task_attr, 5000); // 设置任务5ms后才执行， 非必须

    double t;
    auto start = std::chrono::high_resolution_clock::now();
    std::function<void()>&& OnePlusFunc = [&a]() { a += 1; };
    ffrt_task_handle_t task = ffrt_submit_h_base(create_function_wrapper(OnePlusFunc), {}, {}, &task_attr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_task, task}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> elapsed = end-start;
    t = elapsed.count();
    if (a != 1) {
        result = 1;
    }
    if (t <= 5000 || t>=20000) {
        result = 2;
    }

    uint64_t delay = ffrt_task_attr_get_delay(&task_attr);
    if (delay != 5000) {
        result = 3;
    }
    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task); // 销毁task_handle，必须
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QosQueryTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_get_qos(attr);
    int ret = ffrt_task_attr_init(attr);
    if (ret != 0) {
        result = 1;
    }
    int qosVal = ffrt_task_attr_get_qos(attr);
    if (qosVal != 2) {
        result = 2;
    }
    ffrt_task_attr_destroy(attr);
    free(attr);
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QosSetTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr);
    int minLevel = int(ffrt_qos_inherit);
    int maxLevel = int(ffrt_qos_user_initiated);
    for (int idx = minLevel; idx <= maxLevel; idx++) {
        ffrt_task_attr_set_qos(attr, idx);
        int qosVal = int(ffrt_task_attr_get_qos(attr));
        if (qosVal != idx) {
            result = idx + 2;
        }
    }
    ffrt_task_attr_destroy(attr);
    free(attr);
    attr = nullptr;
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QosIllegalTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr);
    int minVal = int(ffrt_qos_inherit) - 1;
    ffrt_task_attr_set_qos(attr, minVal);
    int queryVal = int(ffrt_task_attr_get_qos(attr));
    if (queryVal != -1) {
        result = 1;
    }
    ffrt_task_attr_destroy(attr);
    free(attr);
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QosSetPthreadTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    int minVal = int(ffrt_qos_inherit);
    int maxVal = int(ffrt_qos_user_initiated);
    std::mutex lock;
    const int sleepTime = 100 * 1000;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr);
    for (int qosVal = minVal; qosVal <= maxVal; qosVal++) {
        auto threadSetFunc = [&]() {
            lock.lock();
            ffrt_task_attr_set_qos(attr, qosVal);
            lock.unlock();
        };

        auto threadQueryFunc = [&]() {
            usleep(sleepTime); // 保证set线程先执行
            lock.lock();
            int queryVal = int(ffrt_task_attr_get_qos(attr));
            if (queryVal != qosVal) {
                result = qosVal + 2;
            }
            lock.unlock();
        };

        std::thread tSet(threadSetFunc);
        std::thread tQuery(threadQueryFunc);
        tSet.join();
        tQuery.join();
        usleep(sleepTime);
    }
    ffrt_task_attr_destroy(attr);
    free(attr);
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value AttrSetThreadTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    const int sleepTime = 100 * 1000;
    std::mutex lock;
    auto threadInitFunc = [&]() {
        lock.lock();
        int ret = ffrt_task_attr_init(attr);
        if (ret != 0) {
            result = 1;
        }
        lock.unlock();
    };

    auto threadDestroyFunc = [&]() {
        usleep(sleepTime); // 保证set线程先执行
        lock.lock();
        ffrt_task_attr_destroy(attr);
        lock.unlock();
    };

    std::thread tInit(threadInitFunc);
    std::thread tDestroy(threadDestroyFunc);
    tInit.join();
    tDestroy.join();
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QosSetNameTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t* attr = (ffrt_task_attr_t *) malloc(sizeof(ffrt_task_attr_t));
    ffrt_task_attr_init(attr);
    std::string name(ffrt_task_attr_get_name(attr));
    if (name != "") {
        result = 1;
    }
    ffrt_task_attr_set_name(attr, "Task Name");
    std::string reName(ffrt_task_attr_get_name(attr));
    if (reName != "Task Name") {
        result = 2;
    }
    ffrt_task_attr_destroy(attr);
    std::string desName(ffrt_task_attr_get_name(attr));
    free(attr);
    attr = nullptr;
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value CancelQueueFfrtTask(napi_env env, napi_callback_info info)
{
    int a = 0;
    int b = 0;
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, ffrt_qos_default);
    ffrt_queue_attr_set_callback(&queue_attr,
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &b, ffrt_function_kind_queue));
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_cancel(task1);
    sleep(2);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "cancel queue task a is %{public}d", a);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "cancel queue task b is %{public}d", b);
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    ffrt_task_handle_destroy(task1);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    return flag;
}

static napi_value WaitQueueFfrtTask(napi_env env, napi_callback_info info)
{
    int a = 0;
    int b = 0;
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, ffrt_qos_default);
    ffrt_queue_attr_set_callback(&queue_attr,
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &b, ffrt_function_kind_queue));
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &a, ffrt_function_kind_queue), nullptr);
    ffrt_queue_wait(task1);
    sleep(2);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "wait queue task a is %{public}d", a);
    HiLogPrint(LOG_APP, LOG_INFO, 1, "testFFRT", "wait queue task b is %{public}d", b);
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
        { "submitQueueFfrtTask", nullptr, SubmitQueueFfrtTask, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueTest001", nullptr, QueueTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueTest002", nullptr, QueueTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest001", nullptr, QueueDfxTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest002", nullptr, QueueDfxTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest003", nullptr, QueueDfxTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest004", nullptr, QueueDfxTest004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest001", nullptr, QueueApiTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest002", nullptr, QueueApiTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest003", nullptr, QueueApiTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest004", nullptr, QueueApiTest004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest005", nullptr, QueueApiTest005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest006", nullptr, QueueApiTest006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest007", nullptr, QueueApiTest007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest008", nullptr, QueueApiTest008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest009", nullptr, QueueApiTest009, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest010", nullptr, QueueApiTest010, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest011", nullptr, QueueApiTest011, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest012", nullptr, QueueApiTest012, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest013", nullptr, QueueApiTest013, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueCancelTest001", nullptr, QueueCancelTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueCancelTest003", nullptr, QueueCancelTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueCancelTest004", nullptr, QueueCancelTest004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "basicTest", nullptr, FFRTBasicTest, nullptr, nullptr, nullptr, napi_default, nullptr },    
        { "submitBasicTest", nullptr, FFRTSubmitBasicTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitInDependEmptyTest", nullptr, FFRTSubmitInDependEmptyTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitInDependNullptrTest", nullptr, SubmitInDependNullptrTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitOuDependEmptyTest", nullptr, SubmitOuDependEmptyTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitOuDependNullptrTest", nullptr, SubmitOuDependNullptrTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitIODependAttrBasicTest", nullptr, SubmitIODependAttrBasicTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitIn0Ou0WaitNullTask1Test", nullptr, SubmitIn0Ou0WaitNullTask1Test, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "delayCTest001", nullptr, DelayCTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "qosQueryTest", nullptr, QosQueryTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "qosSetTest", nullptr, QosSetTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "qosIllegalTest", nullptr, QosIllegalTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "qosSetPthreadTest", nullptr, QosSetPthreadTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "attrSetThreadTest", nullptr, AttrSetThreadTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "qosSetNameTest", nullptr, QosSetNameTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cancelQueueFfrtTask", nullptr, CancelQueueFfrtTask, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "waitQueueFfrtTask", nullptr, WaitQueueFfrtTask, nullptr, nullptr, nullptr, napi_default, nullptr }
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
