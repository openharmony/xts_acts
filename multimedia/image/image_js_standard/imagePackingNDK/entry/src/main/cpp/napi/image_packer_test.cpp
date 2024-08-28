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
#include <map>
#include <uv.h>
#include "node_api.h"
#include "hilog/log.h"
#include "image/image_packer_native.h"
#include "image/pixelmap_native.h"
#include "image_packer_test.h"
#include <vector>
#include <cstdlib>
#include <cstdio>
#include <securec.h>

namespace OHOS {
namespace Media {

using namespace std;

constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, 0xD002B05, "ImagePackerTest"};
static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_4 = 4;
static constexpr uint32_t NUM_5 = 5;
static constexpr uint32_t IMAGE_WIDTH = 600;
static constexpr uint32_t IMAGE_HEIGHT = 400;

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "JsPackToDataMultiFrames", nullptr, ImagePackerTest::JsPackToDataMultiFrames,
            nullptr, nullptr, nullptr, napi_static, nullptr },
        { "JsPackToFileMultiFrames", nullptr, ImagePackerTest::JsPackToFileMultiFrames,
            nullptr, nullptr, nullptr, napi_static, nullptr },
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

uint32_t A = 0xff000000;
uint32_t R = 0x00ff0000;
uint32_t G = 0x0000ff00;
uint32_t B = 0x000000ff;

uint32_t colorArray[240000] = { 0 };

void SetUpImage(int type)
{
    // type 0 -> Red, 1 -> Green, 2 -> Blue
    uint32_t valueColor = 0;
    switch (type) {
        case NUM_0: valueColor = R; break;
        case NUM_1: valueColor = G; break;
        case NUM_2: valueColor = B; break;
        default:
            break;
    }
    for (int i = 0; i < IMAGE_WIDTH * IMAGE_HEIGHT; i++) {
        colorArray[i] = valueColor;
    }
}

bool CreateArrayBuffer(napi_env env, void* src, size_t srcLen, napi_value *res)
{
    if (src == nullptr || srcLen == 0) {
        return false;
    }

    void *nativePtr = nullptr;
    if (napi_create_arraybuffer(env, srcLen, &nativePtr, res) != napi_ok || nativePtr == nullptr) {
        return false;
    }

    if (memcpy_s(nativePtr, srcLen, src, srcLen) != 0) {
        return false;
    }
    return true;
}

void setImageFormat(napi_env env, napi_value argValue, OH_PackingOptions *options)
{
    size_t mimeTypeSize = 0;
    Image_MimeType format;
    if (napi_get_value_string_utf8(env, argValue, nullptr, 0, &mimeTypeSize) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "failed to format");
        return;
    }

    char *buffer = static_cast<char *>(malloc((mimeTypeSize + 1) * sizeof(char)));
    if (buffer == nullptr) {
        return;
    }

    if (napi_get_value_string_utf8(env, argValue, buffer, mimeTypeSize + 1, &mimeTypeSize)) {
        free(buffer);
        return;
    }

    format.data = buffer;
    format.size = mimeTypeSize;
    OH_PackingOptions_SetMimeType(options, &format);
    HiviewDFX::HiLog::Info(LABEL, "get format data success %{public}s", format.data);
    HiviewDFX::HiLog::Info(LABEL, "get format size success %{public}u", format.size);
    free(buffer);
    return;
}

void setLoop(napi_env env, napi_value argValue, OH_PackingOptionsForSequence *options)
{
    uint32_t loop = 0;
    if (napi_get_value_uint32(env, argValue, &loop) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "failed to get loop");
        return;
    }
    OH_PackingOptionsForSequence_SetLoopCount(options, loop);
    HiviewDFX::HiLog::Info(LABEL, "get loop success %{public}d", loop);
    return;
}

int32_t* setDelayTimes(napi_env env, napi_value argValue, OH_PackingOptionsForSequence *options)
{
    napi_value delayTimesValue = nullptr;
    if (napi_get_named_property(env, argValue, "delayTimes", &delayTimesValue) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "failed to napi_get_named_property");
        return nullptr;
    }
    bool isDelayTimesArray = false;
    uint32_t delayTimesSize = 0;
    if (napi_is_array(env, delayTimesValue, &isDelayTimesArray) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsPackToFileMultiFrames failed to napi_is_array");
        return nullptr;
    }
    if (!isDelayTimesArray) {
        HiviewDFX::HiLog::Error(LABEL, "is not DelayTimesArray");
        return nullptr;
    }
    if (napi_get_array_length(env, delayTimesValue, &delayTimesSize) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "Parse delayTime pack napi_get_array_length failed");
        return nullptr;
    }
    HiviewDFX::HiLog::Info(LABEL, "delayTime size %{public}u", delayTimesSize);

    int32_t* delayTimesArray = static_cast<int32_t *>(malloc((delayTimesSize + 1) * sizeof(int32_t)));
    if (delayTimesArray == nullptr) {
        HiviewDFX::HiLog::Error(LABEL, "get delayTimesArray space failed.");
        return nullptr;
    }
    int32_t num1 = 0;
    for (size_t i = 0; i < delayTimesSize; i++) {
        napi_value item1;
        if (napi_get_element(env, delayTimesValue, i, &item1) != napi_ok) {
            HiviewDFX::HiLog::Error(LABEL, "napi_get_element failed %{public}zu", i);
            free(delayTimesArray);
            return nullptr;
        }
        if (napi_get_value_int32(env, item1, &num1) != napi_ok) {
            HiviewDFX::HiLog::Error(LABEL, "Parse delayTime in item1 failed %{public}zu", i);
            free(delayTimesArray);
            return nullptr;
        }
        delayTimesArray[i] = num1;
        HiviewDFX::HiLog::Info(LABEL, "Parse delayTime in item1 success %{public}d", delayTimesArray[i]);
    }
    OH_PackingOptionsForSequence_SetDelayTimeList(options, delayTimesArray, delayTimesSize);
    return delayTimesArray;
}

uint32_t* setDisposalTypes(napi_env env, napi_value argValue, OH_PackingOptionsForSequence *options)
{
    napi_value disposalTypesValue = nullptr;
    if (napi_get_named_property(env, argValue, "disposalTypes", &disposalTypesValue) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsPackToFileMultiFrames failed to napi_get_named_property");
        return nullptr;
    }
    bool isDisposalTypesArray = false;
    uint32_t disposalSize = 0;
    if (napi_is_array(env, disposalTypesValue, &isDisposalTypesArray) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, " failed to napi_is_array");
        return nullptr;
    }
    if (!isDisposalTypesArray) {
        HiviewDFX::HiLog::Error(LABEL, "is not DisposalTypesArray");
        return nullptr;
    }
    if (napi_get_array_length(env, disposalTypesValue, &disposalSize) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "Parse disposalTypes pack napi_get_array_length failed");
        return nullptr;
    }
    HiviewDFX::HiLog::Info(LABEL, "disposalSize %{public}u", disposalSize);

    uint32_t* disposalTypesArray = static_cast<uint32_t *>(malloc((disposalSize + 1) * sizeof(uint32_t)));
    if (disposalTypesArray == nullptr) {
        HiviewDFX::HiLog::Error(LABEL, "get disposalTypesArray space failed.");
        return nullptr;
    }
    uint32_t num2 = 0;
    for (size_t i = 0; i < disposalSize; i++) {
        napi_value item2;
        if (napi_get_element(env, disposalTypesValue, i, &item2) != napi_ok) {
            HiviewDFX::HiLog::Error(LABEL, "napi_get_element failed %{public}zu", i);
            free(disposalTypesArray);
            return nullptr;
        }
        if (napi_get_value_uint32(env, item2, &num2) != napi_ok) {
            HiviewDFX::HiLog::Error(LABEL, "Parse disposalTypes in item2 failed %{public}zu", i);
            free(disposalTypesArray);
            return nullptr;
        }
        disposalTypesArray[i] = num2;
        HiviewDFX::HiLog::Info(LABEL, "Parse disposalTypes in item2 success %{public}u", disposalTypesArray[i]);
    }
    OH_PackingOptionsForSequence_SetDisposalTypes(options, disposalTypesArray, disposalSize);
    return disposalTypesArray;
}

int32_t getFrameCount(napi_env env, napi_value argValue)
{
    int32_t frameCount = 0;
    if (napi_get_value_int32(env, argValue, &frameCount) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "failed to get loop");
        return frameCount;
    }
    HiviewDFX::HiLog::Info(LABEL, "get frameCount success %{public}d", frameCount);
    return frameCount;
}

int32_t getFileDescriptor(napi_env env, napi_value argValue)
{
    int32_t fd = 0;
    if (napi_get_value_int32(env, argValue, &fd) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "get fd failed ");
        return fd;
    }
    HiviewDFX::HiLog::Info(LABEL, "get fd success %{public}d", fd);
    return fd;
}

void createPixelMapList(OH_PixelmapNative **pixelmaps, int32_t frameCount)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, IMAGE_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(options, IMAGE_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, NUM_5);
    OH_PixelmapInitializationOptions_SetAlphaType(options, 1);

    for (int i = 0; i < frameCount; i++) {
        SetUpImage(i % NUM_3);
        OH_PixelmapNative_CreatePixelmap((uint8_t *)colorArray,
            IMAGE_WIDTH * IMAGE_HEIGHT * NUM_4, options, &pixelmaps[i]);
    }
}

napi_value ImagePackerTest::JsPackToDataMultiFrames(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "JsPackToDataMultiFrames failed to parse params");
        return result;
    }
    OH_PackingOptionsForSequence *options = nullptr;
    OH_PackingOptionsForSequence_Create(&options);
    setLoop(env, argValue[NUM_0], options);
    int32_t* delayTimes = setDelayTimes(env, argValue[NUM_1], options);
    uint32_t* disposalTypesArray = setDisposalTypes(env, argValue[NUM_1], options);
    int32_t frameCount = getFrameCount(env, argValue[NUM_2]);
    OH_PackingOptionsForSequence_SetFrameCount(options, static_cast<uint32_t>(frameCount));
    OH_PixelmapNative *pixelmaps[frameCount];
    createPixelMapList(pixelmaps, frameCount);

    size_t outDataSize = 10000;
    uint8_t outData[outDataSize];
    ImagePackerModuleTest ipmt;
    Image_ErrorCode ret = ipmt.PackToDataMultiFrames(options, pixelmaps, frameCount, outData, &outDataSize);
    if (ret != IMAGE_SUCCESS) {
        HiviewDFX::HiLog::Error(LABEL, "JsPackToDataMultiFrames failed");
        free(delayTimes);
        free(disposalTypesArray);
        OH_PackingOptionsForSequence_Release(options);
        return result;
    }
    CreateArrayBuffer(env, outData, outDataSize, &result);
    free(delayTimes);
    free(disposalTypesArray);
    OH_PackingOptionsForSequence_Release(options);
    return result;
}

napi_value ImagePackerTest::JsPackToFileMultiFrames(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        HiviewDFX::HiLog::Error(LABEL, "failed to parse params");
        return result;
    }

    OH_PackingOptionsForSequence *options = nullptr;
    OH_PackingOptionsForSequence_Create(&options);
    int32_t* delayTimes = setDelayTimes(env, argValue[NUM_0], options);
    uint32_t* disposalTypesArray = setDisposalTypes(env, argValue[NUM_0], options);
    setLoop(env, argValue[NUM_3], options);
    int32_t fd = getFileDescriptor(env, argValue[NUM_1]);
    int32_t frameCount = getFrameCount(env, argValue[NUM_2]);
    OH_PackingOptionsForSequence_SetFrameCount(options, static_cast<uint32_t>(frameCount));
    OH_PixelmapNative *pixelmaps[frameCount];
    createPixelMapList(pixelmaps, frameCount);

    ImagePackerModuleTest ipmt;
    Image_ErrorCode ret = ipmt.PackToFileMultiFrames(options, pixelmaps, frameCount, fd);
    if (ret != IMAGE_SUCCESS) {
        HiviewDFX::HiLog::Error(LABEL, "JsPackToFileMultiFrames failed");
        free(delayTimes);
        free(disposalTypesArray);
        OH_PackingOptionsForSequence_Release(options);
        return result;
    }
    napi_create_int32(env, ret, &result);
    HiviewDFX::HiLog::Error(LABEL, "ret = %{public}d", ret);
    free(delayTimes);
    free(disposalTypesArray);
    OH_PackingOptionsForSequence_Release(options);
    return result;
}

} // namespace Media
} // namespace OHOS
