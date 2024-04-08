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

#include <memory>
#include <string>
#include <set>
#include <uv.h>
#include "node_api.h"
#include "hilog/log.h"
#include "image/image_receiver_native.h"
#include "image_receiver_test.h"

#define STATIC_FUNCTION(n, f) { (n), nullptr, ImageReceiverTest::f, nullptr, nullptr, nullptr, napi_static, nullptr }

namespace OHOS {
namespace Media {

using namespace std;

constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, 0xD002B05, "ImageReceiverTest"};
static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;

struct ImageReceiverContext {
    napi_env env = nullptr;
    napi_ref callbackRef = nullptr;
    OH_ImageReceiverNative* receiver = nullptr;
};

static void Callback(uv_work_t *work, int status)
{
    ImageReceiverContext *context = reinterpret_cast<ImageReceiverContext *>(work->data);
    if (context == nullptr) {
        HiviewDFX::HiLog::Error(LABEL, "context is empty");
    } else {
        napi_value result[1] = {0};
        napi_value retVal;
        napi_value callback = nullptr;
        if (context->env != nullptr && context->callbackRef != nullptr) {
            napi_handle_scope scope = nullptr;
            napi_open_handle_scope(context->env, &scope);
            if (scope == nullptr) {
                delete context;
                delete work;
                return;
            }
            napi_create_uint32(context->env, (int32_t)(uintptr_t)context->receiver, &result[0]);
            napi_get_reference_value(context->env, context->callbackRef, &callback);
            if (callback != nullptr) {
                napi_call_function(context->env, nullptr, callback, 1, result, &retVal);
            } else {
                HiviewDFX::HiLog::Error(LABEL, "napi_get_reference_value callback is empty");
            }
            napi_close_handle_scope(context->env, scope);
        } else {
            HiviewDFX::HiLog::Error(LABEL, "env or callbackRef is empty");
        }
    }
    delete context;
    delete work;
}

class JSImageBufferAvaliableHandler {
public:
    JSImageBufferAvaliableHandler(napi_env env, napi_ref jsHandler)
    {
        handler_ = jsHandler;
        env_ = env;
        napi_get_uv_event_loop(env_, &loop_);
        if (loop_ == nullptr) {
            HiviewDFX::HiLog::Error(LABEL, "napi_get_uv_event_loop failed");
            return;
        }
    }

    ~JSImageBufferAvaliableHandler() = default;

    static void OnBufferAvaliable(OH_ImageReceiverNative* receiver)
    {
        unique_ptr<uv_work_t> work = make_unique<uv_work_t>();
        if (work == nullptr) {
            HiviewDFX::HiLog::Error(LABEL, "DoCallBack: No memory");
            return;
        }
        ImageReceiverContext *context = new ImageReceiverContext;
        context->env = env_;
        context->callbackRef = handler_;
        context->receiver = receiver;
        work->data = reinterpret_cast<void *>(context);
        int ret = uv_queue_work(loop_, work.get(), [] (uv_work_t *work) {}, [] (uv_work_t *work, int status) {
            Callback(work, status);
        });
        if (ret != 0) {
            HiviewDFX::HiLog::Error(LABEL, "Failed to execute DoCallBack work queue");
        } else {
            work.release();
        }
    }

private:
    static napi_ref handler_;
    static napi_env env_;
    static uv_loop_s *loop_;
};

napi_ref JSImageBufferAvaliableHandler::handler_ = nullptr;
napi_env JSImageBufferAvaliableHandler::env_ = nullptr;
uv_loop_s *JSImageBufferAvaliableHandler::loop_ = nullptr;

static std::set<uintptr_t> imageReceiverVec;
static std::set<uintptr_t> imageVec;
static std::set<uintptr_t> optionVec;

static bool saveImageReceiver(uintptr_t receiver)
{
    auto it = imageReceiverVec.find(receiver);
    if (it == imageReceiverVec.end()) {
        imageReceiverVec.insert(receiver);
    }
    return true;
}

static bool removeImageReceiver(uintptr_t receiver)
{
    imageReceiverVec.erase(receiver);
    return true;
}

static bool checkImageReceiver(uintptr_t receiver)
{
    auto it = imageReceiverVec.find(receiver);
    if (it != imageReceiverVec.end()) {
        return true;
    }
    return false;
}

static bool saveImage(uintptr_t image)
{
    auto it = imageVec.find(image);
    if (it == imageVec.end()) {
        imageVec.insert(image);
    }
    return true;
}

static bool removeImage(uintptr_t image)
{
    imageVec.erase(image);
    return true;
}

static bool checkImage(uintptr_t image)
{
    auto it = imageVec.find(image);
    if (it != imageVec.end()) {
        return true;
    }
    return false;
}

static bool saveOption(uintptr_t option)
{
    auto it = optionVec.find(option);
    if (it == optionVec.end()) {
        optionVec.insert(option);
    }
    return true;
}

static bool removeOption(uintptr_t option)
{
    optionVec.erase(option);
    return true;
}

static bool checkOption(uintptr_t option)
{
    auto it = optionVec.find(option);
    if (it != optionVec.end()) {
        return true;
    }
    return false;
}

static bool CheckArgs(size_t argc, const napi_value* argv, size_t expectedCount)
{
    if (argc != expectedCount) {
        return false;
    }
    for (size_t i = NUM_0; i < argc; i++) {
        if (argv[i] == nullptr) {
            return false;
        }
    }
    return true;
}

template <int NUM>
bool GetArgs(napi_env env, napi_callback_info info, napi_value (&argv)[NUM], int32_t (&params)[NUM])
{
    size_t argc = NUM;
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok ||
        !CheckArgs(argc, argv, NUM)) {
        return false;
    }

    for (size_t i = NUM_0; i < argc; i++) {
        if (napi_get_value_int32(env, argv[i], &params[i]) != napi_ok) {
            return false;
        }
    }

    return true;
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char* utf8name, int32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

napi_value ImageReceiverTest::JsCreateImageReceiverOptions(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    OH_ImageReceiverOptions* options = nullptr;
    napi_get_undefined(env, &udfVar);
    Image_ErrorCode nRst = OH_ImageReceiverOptions_Create(&options);
    if (options != nullptr) {
        saveOption((uintptr_t)options);
    } else {
        HiviewDFX::HiLog::Error(LABEL, "JsCreateImageReceiverOptions failed to create options");
        return udfVar;
    }

    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    Image_Size size = {0};
    int32_t capacity = 0;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsCreateImageReceiverOptions failed to parse params");
        return udfVar;
    }
    if (!CheckArgs(argCount, argValue, NUM_3) ||
        napi_get_value_uint32(env, argValue[NUM_0], &(size.width)) != napi_ok ||
        napi_get_value_uint32(env, argValue[NUM_1], &(size.height)) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_2], &(capacity)) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsCreateImageReceiverOptions check params failed");
        return udfVar;
    }
    OH_ImageReceiverOptions_SetSize(options, size);
    HiviewDFX::HiLog::Error(LABEL, "size: %{public}dx%{public}d", size.width, size.height);
    OH_ImageReceiverOptions_SetCapacity(options, capacity);
    HiviewDFX::HiLog::Error(LABEL, "capacity: %{public}d", capacity);

    if (nRst != IMAGE_SUCCESS || options == nullptr) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, (int32_t)(uintptr_t)options, &result);
    return result;
}

napi_value ImageReceiverTest::JsImageReceiverOptionsGetSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)(uintptr_t)params[NUM_0];
    if (!checkOption((uintptr_t)options)) {
        return udfVar;
    }
    Image_Size size;
    if (OH_ImageReceiverOptions_GetSize(options, &size) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverTest::JsImageReceiverOptionsSetSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_3] = {nullptr};
    int32_t params[NUM_3] = {0};
    Image_Size size = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)(uintptr_t)params[NUM_0];
    if (!checkOption((uintptr_t)options)) {
        return udfVar;
    }
    size.width = params[NUM_1];
    size.height = params[NUM_2];
    Image_ErrorCode nRst = OH_ImageReceiverOptions_SetSize(options, size);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsImageReceiverOptionsGetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)(uintptr_t)params[NUM_0];
    if (!checkOption((uintptr_t)options)) {
        return udfVar;
    }
    int32_t capacity = 0;
    if (OH_ImageReceiverOptions_GetCapacity(options, &capacity) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, capacity, &result);
    return result;
}

napi_value ImageReceiverTest::JsImageReceiverOptionsSetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)(uintptr_t)params[NUM_0];
    if (!checkOption((uintptr_t)options)) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverOptions_SetCapacity(options, params[NUM_1]);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsReleaseImageReceiverOptions(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)(uintptr_t)params[NUM_0];
    if (!checkOption((uintptr_t)options)) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverOptions_Release(options);
    removeOption((uintptr_t)options);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsCreateImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverOptions* options = (OH_ImageReceiverOptions*)(uintptr_t)params[NUM_0];
    if (!checkOption((uintptr_t)options)) {
        return udfVar;
    }
    OH_ImageReceiverNative* receiver = nullptr;
    Image_ErrorCode nRst = OH_ImageReceiverNative_Create(options, &receiver);

    if (receiver != nullptr) {
        saveImageReceiver((uintptr_t)receiver);
    }
    if (nRst != IMAGE_SUCCESS || receiver == nullptr) {
        HiviewDFX::HiLog::Error(LABEL, "JsCreateImageReceiver failed to create receiver");
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, (int32_t)(uintptr_t)receiver, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetReceivingSurfaceId(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    uint64_t id = 0;
    if (OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &id) != IMAGE_SUCCESS) {
        return udfVar;
    }

    std::string surfaceId = std::to_string(id);
    napi_value result = nullptr;
    napi_create_string_utf8(env, surfaceId.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

napi_value ImageReceiverTest::JsReadLatestImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    OH_ImageNative* image = nullptr;
    if (OH_ImageReceiverNative_ReadLatestImage(receiver, &image) != IMAGE_SUCCESS) {
        return udfVar;
    }
    if (image != nullptr) {
        saveImage((uintptr_t)image);
    }

    napi_value result = nullptr;
    napi_create_int32(env, (int32_t)(uintptr_t)image, &result);
    return result;
}

napi_value ImageReceiverTest::JsReadNextImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    OH_ImageNative* image = nullptr;
    if (OH_ImageReceiverNative_ReadNextImage(receiver, &image) != IMAGE_SUCCESS) {
        return udfVar;
    }
    if (image != nullptr) {
        saveImage((uintptr_t)image);
    }

    napi_value result = nullptr;
    napi_create_int32(env, (int32_t)(uintptr_t)image, &result);
    return result;
}

napi_value ImageReceiverTest::JsOn(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);

    napi_value thisVar = nullptr;
    size_t argCount = NUM_2;
    if (napi_get_cb_info(env, info, &argCount, argv, &thisVar, nullptr) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsOn failed to parse params");
        return udfVar;
    }
    if (!CheckArgs(argCount, argv, NUM_2) ||
        napi_get_value_int32(env, argv[NUM_0], &(params[NUM_0])) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsOn failed to parse OH_ImageReceiverNative handle");
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    napi_ref jsCallbackHandler;
    napi_create_reference(env, argv[NUM_1], 1, &(jsCallbackHandler));

    JSImageBufferAvaliableHandler bufferAvaliableHandler(env, jsCallbackHandler);
    const OH_ImageReceiver_OnCallback callback = bufferAvaliableHandler.OnBufferAvaliable;

    Image_ErrorCode nRst = OH_ImageReceiverNative_On(receiver, callback);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsOff(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverNative_Off(receiver);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    Image_Size size;
    if (OH_ImageReceiverNative_GetSize(receiver, &size) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverTest::JsGetCapacity(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    int32_t capacity = 0;
    if (OH_ImageReceiverNative_GetCapacity(receiver, &capacity) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, capacity, &result);
    return result;
}

napi_value ImageReceiverTest::JsReleaseImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageReceiverNative* receiver = (OH_ImageReceiverNative*)(uintptr_t)params[NUM_0];
    if (!checkImageReceiver((uintptr_t)receiver)) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageReceiverNative_Release(receiver);
    removeImageReceiver((uintptr_t)receiver);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImageSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    Image_Size size;
    if (OH_ImageNative_GetImageSize(image, &size) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverTest::JsGetImageComponentTypes(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    size_t typeSize = 0;
    if (OH_ImageNative_GetComponentTypes(image, nullptr, &typeSize) != IMAGE_SUCCESS) {
        return udfVar;
    }

    uint32_t* arrayTypes = nullptr;
    napi_value result = nullptr;
    napi_create_array(env, &result);
    if (typeSize <= 0) {
        return result;
    } else {
        arrayTypes = new uint32_t[typeSize];
    }

    if (arrayTypes == nullptr) {
        return result;
    }

    if (OH_ImageNative_GetComponentTypes(image, &arrayTypes, &typeSize) != IMAGE_SUCCESS) {
        delete [] arrayTypes;
        return result;
    }

    for (size_t i = 0; i < typeSize; i++) {
        napi_value type = nullptr;
        napi_create_uint32(env, arrayTypes[i], &type);
        napi_set_element(env, result, i, type);
    }

    delete [] arrayTypes;
    return result;
}

napi_value ImageReceiverTest::JsGetImageByteBuffer(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    OH_NativeBuffer* nativeBuffer = nullptr;
    if (OH_ImageNative_GetByteBuffer(image, componentType, &nativeBuffer) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, (int32_t)(uintptr_t)nativeBuffer, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImageBufferSize(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    size_t bufferSize = 0;
    if (OH_ImageNative_GetBufferSize(image, componentType, &bufferSize) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, bufferSize, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImageRowStride(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    int32_t rowStride = 0;
    if (OH_ImageNative_GetRowStride(image, componentType, &rowStride) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, rowStride, &result);
    return result;
}

napi_value ImageReceiverTest::JsGetImagePixelStride(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_2] = {nullptr};
    int32_t params[NUM_2] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    uint32_t componentType = params[NUM_1];
    int32_t pixelStride = 0;
    if (OH_ImageNative_GetPixelStride(image, componentType, &pixelStride) != IMAGE_SUCCESS) {
        return udfVar;
    }

    napi_value result = nullptr;
    napi_create_int32(env, pixelStride, &result);
    return result;
}

napi_value ImageReceiverTest::JsReleaseImage(napi_env env, napi_callback_info info)
{
    napi_value argv[NUM_1] = {nullptr};
    int32_t params[NUM_1] = {0};
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);
    if (!GetArgs(env, info, argv, params)) {
        return udfVar;
    }

    OH_ImageNative* image = (OH_ImageNative*)(uintptr_t)params[NUM_0];
    if (!checkImage((uintptr_t)image)) {
        return udfVar;
    }
    Image_ErrorCode nRst = OH_ImageNative_Release(image);
    removeImage((uintptr_t)image);
    napi_value result = nullptr;
    napi_create_int32(env, nRst, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        STATIC_FUNCTION("JsCreateImageReceiverOptions", JsCreateImageReceiverOptions),
        STATIC_FUNCTION("JsImageReceiverOptionsGetSize", JsImageReceiverOptionsGetSize),
        STATIC_FUNCTION("JsImageReceiverOptionsSetSize", JsImageReceiverOptionsSetSize),
        STATIC_FUNCTION("JsImageReceiverOptionsGetCapacity", JsImageReceiverOptionsGetCapacity),
        STATIC_FUNCTION("JsImageReceiverOptionsSetCapacity", JsImageReceiverOptionsSetCapacity),
        STATIC_FUNCTION("JsReleaseImageReceiverOptions", JsReleaseImageReceiverOptions),
        STATIC_FUNCTION("JsCreateImageReceiver", JsCreateImageReceiver),
        STATIC_FUNCTION("JsGetReceivingSurfaceId", JsGetReceivingSurfaceId),
        STATIC_FUNCTION("JsReadLatestImage", JsReadLatestImage),
        STATIC_FUNCTION("JsReadNextImage", JsReadNextImage),
        STATIC_FUNCTION("JsOn", JsOn),
        STATIC_FUNCTION("JsOff", JsOff),
        STATIC_FUNCTION("JsGetSize", JsGetSize),
        STATIC_FUNCTION("JsGetCapacity", JsGetCapacity),
        STATIC_FUNCTION("JsReleaseImageReceiver", JsReleaseImageReceiver),
        STATIC_FUNCTION("JsGetImageSize", JsGetImageSize),
        STATIC_FUNCTION("JsGetImageComponentTypes", JsGetImageComponentTypes),
        STATIC_FUNCTION("JsGetImageByteBuffer", JsGetImageByteBuffer),
        STATIC_FUNCTION("JsGetImageBufferSize", JsGetImageBufferSize),
        STATIC_FUNCTION("JsGetImageRowStride", JsGetImageRowStride),
        STATIC_FUNCTION("JsGetImagePixelStride", JsGetImagePixelStride),
        STATIC_FUNCTION("JsReleaseImage", JsReleaseImage),
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

} // namespace Media
} // namespace OHOS
