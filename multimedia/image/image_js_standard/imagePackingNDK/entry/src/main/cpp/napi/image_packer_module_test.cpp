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

#include <hilog/log.h>
#include "image_packer_module_test.h"

#undef LOG_TAG
#define LOG_TAG "ImagePackerModuleTest"

#define SHOW_LOG
#ifdef SHOW_LOG
constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, 0xD002B05, "ImagePackerModuleTest"};

#define MY_HILOG(op, fmt, args...) \
    do {                                  \
        op(LABEL, "{%{public}s:%{public}d} " fmt, __FUNCTION__, __LINE__, ##args);  \
    } while (0)
#define DEBUG_LOG(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)

#define IMG_TST_LOGF(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Fatal, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGE(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Error, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGW(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Warn, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGI(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGD(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Debug, fmt, ##__VA_ARGS__)
#else
#define IMG_TST_LOGF(...)
#define IMG_TST_LOGE(...)
#define IMG_TST_LOGW(...)
#define IMG_TST_LOGI(...)
#define IMG_TST_LOGD(...)
#endif

ImagePackerModuleTest::ImagePackerModuleTest()
{
}

ImagePackerModuleTest::~ImagePackerModuleTest()
{
}

Image_ErrorCode ImagePackerModuleTest::PackToDataMultiFrames(OH_PackingOptionsForSequence *options,
    OH_PixelmapNative **pixelmaps, size_t mapSize, uint8_t* outData, size_t* outDataSize)
{
    IMG_TST_LOGI("PackToDataMultiFrames enter.");

    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode ret = OH_ImagePackerNative_Create(&imagePacker);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        IMG_TST_LOGE("Create Image Packer failed: err = %{public}d.", ret);
        return ret;
    }

    ret = OH_ImagePackerNative_PackToDataFromPixelmapSequence(imagePacker, options, pixelmaps,
        mapSize, outData, outDataSize);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        IMG_TST_LOGE("PackToDataMultiFrames failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImagePackerNative_Release(imagePacker);
    IMG_TST_LOGI("PackToDataMultiFrames end.");
    return IMAGE_SUCCESS;
}

Image_ErrorCode ImagePackerModuleTest::PackToFileMultiFrames(OH_PackingOptionsForSequence  *options,
    OH_PixelmapNative **pixelmaps, size_t mapSize, int32_t fd)
{
    IMG_TST_LOGI("PackToFileMultiFrames enter.");

    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode ret = OH_ImagePackerNative_Create(&imagePacker);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        IMG_TST_LOGE("Create Image Packer failed: err = %{public}d.", ret);
        return ret;
    }

    ret = OH_ImagePackerNative_PackToFileFromPixelmapSequence(imagePacker, options, pixelmaps, mapSize, fd);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        IMG_TST_LOGE("PackToFileMultiFrames failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImagePackerNative_Release(imagePacker);
    IMG_TST_LOGI("PackToFileMultiFrames end.");
    return IMAGE_SUCCESS;
}
