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

#ifndef IMAGE_SOURCE_TEST_H
#define IMAGE_SOURCE_TEST_H

#include "napi/native_api.h"
#include "multimedia/image_framework/image_pixel_map_napi.h"
#include "multimedia/image_framework/image_source_mdk.h"

namespace OHOS {
namespace Media {

#define IMAGE_LOG_TAG "ImageSourceNDKTest"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)
#define DEBUG_PTR(p) (((p) == nullptr)?"nullptr":"not nullptr")

class ImageSourceNDKTest {
public:
    static napi_value Init(napi_env env, napi_value exports);
    static napi_value Create(napi_env env, napi_callback_info info);
    static napi_value CreateFromFd(napi_env env, napi_callback_info info);
    static napi_value CreateFromUri(napi_env env, napi_callback_info info);
    static napi_value CreateFromData(napi_env env, napi_callback_info info);
    static napi_value CreateFromRawFile(napi_env env, napi_callback_info info);
    static napi_value CreateIncremental(napi_env env, napi_callback_info info);
    static napi_value CreateIncrementalFromData(napi_env env, napi_callback_info info);
    static napi_value InitNative(napi_env env, napi_callback_info info);
    static napi_value CreatePixelMap(napi_env env, napi_callback_info info);
    static napi_value CreatePixelMapList(napi_env env, napi_callback_info info);
    static napi_value GetDelayTime(napi_env env, napi_callback_info info);
    static napi_value GetFrameCount(napi_env env, napi_callback_info info);
    static napi_value GetSupportedFormats(napi_env env, napi_callback_info info);
    static napi_value GetImageInfo(napi_env env, napi_callback_info info);
    static napi_value GetImageProperty(napi_env env, napi_callback_info info);
    static napi_value ModifyImageProperty(napi_env env, napi_callback_info info);
    static napi_value UpdateData(napi_env env, napi_callback_info info);
    static napi_value Release(napi_env env, napi_callback_info info);
private:
};
} // namespace Media
} // namespace OHOS
#endif // IMAGE_SOURCE_TEST_H