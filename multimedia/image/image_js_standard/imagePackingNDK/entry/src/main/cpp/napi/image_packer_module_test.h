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

#ifndef IMAGE_PACKING_MODULE_TEST_H
#define IMAGE_PACKING_MODULE_TEST_H

#include <memory>
#include <string>
#include <vector>
#include "napi/native_api.h"
#include "napi/native_node_api.h"
#include "image/image_packer_native.h"
#include "image/image_common.h"

class ImagePackerModuleTest {
public:
    ImagePackerModuleTest();
    ~ImagePackerModuleTest();
    Image_ErrorCode PackToDataMultiFrames(OH_PackingOptionsForSequence *options,
        OH_PixelmapNative **pixelmaps, size_t mapSize, uint8_t* outData, size_t* outDataSize);

    Image_ErrorCode PackToFileMultiFrames(OH_PackingOptionsForSequence *options, OH_PixelmapNative **pixelmaps,
        size_t mapSize, int32_t fd);
private:
};
#endif // IMAGE_PACKING_MODULE_TEST_H
