/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "utils/common_utils.h"
#include "utils/pixelmap_helper.h"
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <native_window/external_window.h>
#include <string>

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)

#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"

#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11

#define IMAGE_EFFECT_2 2
#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_100D 100.0
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401

const std::string g_jpgUri = std::string("file:///data/test/resource/image_effect_1k_test1.jpg");
static std::string imagePath;
static napi_value savePixelMapForPath(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    imagePath = CommonUtils::GetStringArgument(env, args[0]);
    napi_value ret;
    int status = -1;
    if (imagePath.length() > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

/**-----------------------------------------   EffectBufferInfo   --------------------------------------------------**/
static napi_value OHEffectBufferInfoCreate(napi_env env, napi_callback_info info)
{
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    int status = -1;
    if (bufferInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *addr = malloc(IMAGE_EFFECT_1000);
    switch (index) {
    case CASE_INDEX_1:
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    case CASE_INDEX_3:
        addr = nullptr;
        break;
    case CASE_INDEX_4:
        addr = nullptr;
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetAddr(bufferInfo, addr);
    free(addr);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoGetAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    napi_value ret;
    napi_create_int32(env, code, &ret);
    
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *setAddr = malloc(IMAGE_EFFECT_1000);
    void *retAddr = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        OH_EffectBufferInfo_SetAddr(bufferInfo, setAddr);
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        if (retAddr != setAddr) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        break;
    case CASE_INDEX_3:
        bufferInfo = nullptr;
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetEffectFormat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_Format format;
    switch (index) {
    case CASE_INDEX_1:
        format = EFFECT_PIXEL_FORMAT_UNKNOWN;
        break;
    case CASE_INDEX_2:
        format = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case CASE_INDEX_3:
        format = EFFECT_PIXEL_FORMAT_NV21;
        break;
    case CASE_INDEX_4:
        format = EFFECT_PIXEL_FORMAT_NV12;
        break;
    case CASE_INDEX_5:
        format = EFFECT_PIXEL_FORMAT_RGBA1010102;
        break;
    case CASE_INDEX_6:
        format = EFFECT_PIXEL_FORMAT_YCBCR_P010;
        break;
    case CASE_INDEX_7:
        format = EFFECT_PIXEL_FORMAT_YCRCB_P010;
        break;
    case CASE_INDEX_8:
        bufferInfo = nullptr;
        format = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    default:
        break;
    }

    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetEffectFormat(bufferInfo, format);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoGetEffectFormat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_Format setFormat;
    ImageEffect_Format getFormat;
    ImageEffect_ErrorCode code;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setFormat = EFFECT_PIXEL_FORMAT_UNKNOWN;
        code = OH_EffectBufferInfo_SetEffectFormat(bufferInfo, setFormat);
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        if (getFormat != setFormat) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setFormat = EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    case CASE_INDEX_3:
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setFormat = EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    case CASE_INDEX_5:
        bufferInfo = nullptr;
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    default:
        break;
    }

    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetHeight(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    int32_t height;
    switch (index) {
    case CASE_INDEX_1:
        height = 0;
        break;
    case CASE_INDEX_2:
        height = IMAGE_EFFECT_1000;
        break;
    case CASE_INDEX_3:
        height = -IMAGE_EFFECT_1000;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        height = IMAGE_EFFECT_1000;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetHeight(bufferInfo, height);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoGetHeight(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setHeight;
    int32_t getHeight;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setHeight = 0;
        code = OH_EffectBufferInfo_SetHeight(bufferInfo, setHeight);
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        if (getHeight != setHeight) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setHeight = IMAGE_EFFECT_1000;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    case CASE_INDEX_3:
        setHeight = -IMAGE_EFFECT_1000;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setHeight = IMAGE_EFFECT_1000;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    default:
        break;
    }
    
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetRowSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t rowSize;
    switch (index) {
    case CASE_INDEX_1:
        rowSize = IMAGE_EFFECT_1024;
        break;
    case CASE_INDEX_2:
        rowSize = IMAGE_EFFECT_1048576;
        break;
    case CASE_INDEX_3:
        rowSize = IMAGE_EFFECT_1073741824;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        rowSize = IMAGE_EFFECT_1024;
        break;
    default:
        break;
    }
    code = OH_EffectBufferInfo_SetRowSize(bufferInfo, rowSize);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoGetRowSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setRowSize;
    int32_t getRowSize;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setRowSize = IMAGE_EFFECT_1024;
        code = OH_EffectBufferInfo_SetRowSize(bufferInfo, setRowSize);
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        if (getRowSize != setRowSize) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setRowSize = IMAGE_EFFECT_1048576;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    case CASE_INDEX_3:
        setRowSize = IMAGE_EFFECT_1073741824;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setRowSize = IMAGE_EFFECT_1024;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    default:
        break;
    }
    
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetWidth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t width;
    switch (index) {
    case CASE_INDEX_1:
        width = IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_2:
        width = IMAGE_EFFECT_4090;
        break;
    case CASE_INDEX_3:
        width = -IMAGE_EFFECT_5120;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        width = IMAGE_EFFECT_1024;
        break;
    default:
        break;
    }

    code = OH_EffectBufferInfo_SetWidth(bufferInfo, width);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoGetWidth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setWidth;
    int32_t getWidth;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setWidth = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_SetWidth(bufferInfo, setWidth);
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        if (getWidth != setWidth) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setWidth = IMAGE_EFFECT_4090;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    case CASE_INDEX_3:
        setWidth = -IMAGE_EFFECT_5120;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setWidth = IMAGE_EFFECT_1024;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    default:
        break;
    }
    
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        bufferInfo = OH_EffectBufferInfo_Create();
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}


/**-------------------------------------------- EffectFilterInfo ---------------------------------------------------**/
static napi_value OHEffectFilterInfoCreate(napi_env env, napi_callback_info info)
{
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    int status = -1;
    if (filterInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoSetFilterName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilterInfo_SetFilterName(nullptr, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoGetFilterName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    char *getName = nullptr;
    ImageEffect_ErrorCode code;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, &getName);
        //判断  getName != OH_EFFECT_BRIGHTNESS_FILTER
        if (strcmp(getName, OH_EFFECT_BRIGHTNESS_FILTER) != 0) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilterInfo_GetFilterName(nullptr, &getName);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);
    
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoSetSupportedBufferTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_BufferType bufferTypes[2] = {};
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        break;
    case CASE_INDEX_2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoGetSupportedBufferTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_BufferType bufferTypes[2] = {};
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    
    napi_value ret;
    ImageEffect_BufferType *bufferTypeArray = nullptr;
    uint32_t getSize;
    switch (index) {
    case CASE_INDEX_1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        if (getSize != size) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        break;
    default:
        break;
    }
    
    OH_EffectFilterInfo_Release(filterInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoSetSupportedFormats(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    switch (index) {
    case CASE_INDEX_1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case CASE_INDEX_2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    uint32_t size = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, size, formats);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

ImageEffect_ErrorCode GetSupportedFormats(int32_t index, OH_EffectFilterInfo *filterInfo)
{
    ImageEffect_Format formats[2] = {};
    uint32_t setSize = sizeof(formats) / sizeof(ImageEffect_Format);
    uint32_t getSize;
    ImageEffect_Format *formatArray = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_4:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV21;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_5:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_6:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA1010102;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    default:
        break;
    }
    return code;
}

static napi_value OHEffectFilterInfoGetSupportedFormats(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    uint32_t setSize = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code;
    
    napi_value ret;
    uint32_t getSize;
    ImageEffect_Format *formatArray = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        if (getSize != setSize) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_4:
    case CASE_INDEX_5:
    case CASE_INDEX_6:
        code = GetSupportedFormats(index, filterInfo);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        filterInfo = OH_EffectFilterInfo_Create();
        break;
    case CASE_INDEX_2:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    code = OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
/**---------------------------------------------- EffectFilter -----------------------------------------------------**/
static napi_value OHEffectFilterCreate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_EffectFilter_Create(nullptr);
        break;
    default:
        break;
    }

    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        OH_EffectFilter_Release(filter);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterSetValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode code;
    ImageEffect_Any setValue;
    switch (index) {
    case CASE_INDEX_1:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_2:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_3:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(nullptr, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_4:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, nullptr, &setValue);
        break;
    case CASE_INDEX_5:
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterGetValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode code;
    ImageEffect_Any setValue;
    ImageEffect_Any retValue;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, &retValue);
        if (retValue.dataType != setValue.dataType || retValue.dataValue.floatValue != setValue.dataValue.floatValue) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100;
        OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, &retValue);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_GetValue(nullptr, KEY_FILTER_INTENSITY, &retValue);
        break;
    case CASE_INDEX_4:
        code = OH_EffectFilter_GetValue(filter, nullptr, &retValue);
        break;
    case CASE_INDEX_5:
        code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);

    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterLookupFilterInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, filterInfo);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_LookupFilterInfo(nullptr, filterInfo);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterLookupFilters(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_FilterNames *filterNames = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filterNames = OH_EffectFilter_LookupFilters("Format:default");
        break;
    case CASE_INDEX_2:
        filterNames = OH_EffectFilter_LookupFilters("Format:rgba_8888");
        break;
    case CASE_INDEX_3:
        filterNames = OH_EffectFilter_LookupFilters("Format:nv21");
        break;
    case CASE_INDEX_4:
        filterNames = OH_EffectFilter_LookupFilters("Format:nv12");
        break;
    case CASE_INDEX_5:
        filterNames = OH_EffectFilter_LookupFilters("test:default");
        break;
    default:
        break;
    }

    int code = -1;
    if (filterNames != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterRegister(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_FilterDelegate delegate = {
        .setValue = [](OH_EffectFilter *filter, const char *key, const ImageEffect_Any *value) { return false; },
        .render =
            [](OH_EffectFilter *filter, OH_EffectBufferInfo *src, OH_EffectFilterDelegate_PushData pushData) {
                pushData(filter, src);
                return true;
            },
        .save = [](OH_EffectFilter *filter, char **info) { return true; },
        .restore = [](const char *info) { return OH_EffectFilter_Create("CustomBrightnessEFilter"); }};
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilter_Register(filterInfo, &delegate);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_Register(nullptr, &delegate);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_Register(filterInfo, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilter_Release(filter);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_Release(nullptr);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterReleaseFilterNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    switch (index) {
    case CASE_INDEX_1:
        OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        OH_EffectFilter_ReleaseFilterNames();
        break;
    case CASE_INDEX_2:
        OH_EffectFilter_ReleaseFilterNames();
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OHEffectFilterRender(napi_env env, napi_callback_info info)
{
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);
    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;
    ImageEffect_FilterDelegate filterDelegate = {
        .setValue =
            [](OH_EffectFilter *filter, const char *key, const ImageEffect_Any *value) {
                return true;
            },
        .render = [](OH_EffectFilter *filter, OH_EffectBufferInfo *info, OH_EffectFilterDelegate_PushData pushData) {
                return true;
            },
        .save =
            [](OH_EffectFilter *filter, char **info) {
                return true;
            },
        .restore =
            [](const char *info) {
                OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);
                return filter;
            }};
    // 创建 OH_EffectFilterInfo 实例
    OH_EffectFilterInfo *customFilterInfo = OH_EffectFilterInfo_Create();
    // 设置自定义滤镜滤镜名
    OH_EffectFilterInfo_SetFilterName(customFilterInfo, CUSTOM_FILTER);
    // 设置自定义滤镜所支持的内存类型
    ImageEffect_BufferType bufferTypeArray[] = {ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL};
    OH_EffectFilterInfo_SetSupportedBufferTypes(
        customFilterInfo, sizeof(bufferTypeArray) / sizeof(ImageEffect_BufferType), bufferTypeArray);
    // 设置自定义滤镜所支持的像素格式
    ImageEffect_Format formatArray[] = {ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888};
    OH_EffectFilterInfo_SetSupportedFormats(customFilterInfo, sizeof(formatArray) / sizeof(ImageEffect_Format),
                                            formatArray);
    // 注册自定义滤镜
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_Register(customFilterInfo, &filterDelegate);
    // 创建滤镜。比如：创建对比度效果器
    OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);
    // 生效滤镜效果
    errorCode = OH_EffectFilter_Render(filter, inputPixelmap, outputPixelmap);
    // 销毁滤镜实例
    OH_EffectFilter_Release(filter);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}


/**-------------------------------------------------- Effect -------------------------------------------------------**/
static napi_value OHImageEffectCreate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        imageEffect = OH_ImageEffect_Create(nullptr);
        break;
    default:
        break;
    }

    int code = IMAGE_EFFECT_CODE_401;
    if (imageEffect != nullptr) {
        OH_ImageEffect_Release(imageEffect);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectConfigure(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = nullptr;
    const char *key = nullptr;
    ImageEffect_Any value;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_2;
        break;
    case CASE_INDEX_2:
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_3:
        imageEffect = nullptr;
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        break;
    case CASE_INDEX_4:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = nullptr;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        break;
    case CASE_INDEX_5:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = nullptr;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_ImageEffect_Configure(imageEffect, key, &value);
    OH_ImageEffect_Release(imageEffect);
    
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectAddFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_ImageEffect_AddFilter(nullptr, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        filter = OH_ImageEffect_AddFilter(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    
    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectGetFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    int32_t getFilterIndex;
    switch (index) {
    case CASE_INDEX_1:
        getFilterIndex = 0;
        break;
    case CASE_INDEX_2:
        getFilterIndex = 1;
        break;
    default:
        break;
    }
    OH_EffectFilter *getFilter = OH_ImageEffect_GetFilter(imageEffect, getFilterIndex);
    OH_ImageEffect_Release(imageEffect);
    
    int status = IMAGE_EFFECT_CODE_401;
    if (getFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectGetFilterCount(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t count = 0;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case CASE_INDEX_3:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case CASE_INDEX_4:
        count = OH_ImageEffect_GetFilterCount(nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    int status = IMAGE_EFFECT_CODE_401;
    if (count >= 0) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectGetInputSurface(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        imageEffect = nullptr;
        break;
    default:
        break;
    }
    OHNativeWindow *nativeWindow = nullptr;
    ImageEffect_ErrorCode code = OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectInsertFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *insertFilter = nullptr;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    switch (index) {
    case CASE_INDEX_1:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        insertFilter = OH_ImageEffect_InsertFilter(nullptr, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, -1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_4:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 0, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    int status = IMAGE_EFFECT_CODE_401;
    if (insertFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        imageEffect = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectRemoveFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t result;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CROP_FILTER);
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_CROP_FILTER);
        break;
    case CASE_INDEX_3:
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    
    napi_value ret;
    int32_t status = IMAGE_EFFECT_CODE_401;
    if (result > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectSave(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code;
    char *imageEffectInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_Save(imageEffect, &imageEffectInfo);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_Save(nullptr, &imageEffectInfo);
        break;
    case CASE_INDEX_3:
        code = OH_ImageEffect_Save(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectRestore(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *saveImageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect *restoreImageEffect = nullptr;
    char *imageEffectInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_Save(saveImageEffect, &imageEffectInfo);
        restoreImageEffect = OH_ImageEffect_Restore(imageEffectInfo);
        break;
    case CASE_INDEX_2:
        restoreImageEffect = OH_ImageEffect_Restore("");
        break;
    case CASE_INDEX_3:
        restoreImageEffect = OH_ImageEffect_Restore(nullptr);
        break;
    default:
        break;
    }

    int32_t code = 401;
    if (restoreImageEffect != nullptr) {
        code = 0;
    }
    napi_value ret = nullptr;
    napi_create_int32(env, code, &ret);
    return ret;
}

OH_NativeBuffer_Config config{
    .width = 0x100,
    .height = 0x100,
};

static napi_value OHImageEffectSetInputNativeBuffer(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
    
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(&config);
    if (code == EFFECT_SUCCESS && buffer != nullptr) {
        code = OH_ImageEffect_SetInputNativeBuffer(imageEffect, buffer);
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetInputPixelmap(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);
    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code = EFFECT_UNKNOWN;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_SetInputPixelmap(nullptr, inputPixelmap);
        break;
    case CASE_INDEX_3:
        code = OH_ImageEffect_SetInputPixelmap(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

ImageEffect_ErrorCode SetInputUri1(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_2:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_3:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = IMAGE_EFFECT_100D;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_4:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_CHAR;
        value.dataValue.charValue = 'A';
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

ImageEffect_ErrorCode SetInputUri2(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_5:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_LONG;
        value.dataValue.longValue = 100L;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_6:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_BOOL;
        value.dataValue.boolValue = true;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_7:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
        value.dataValue.ptrValue = nullptr;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_8:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, nullptr, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

static napi_value OHImageEffectSetInputUri(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
    case CASE_INDEX_2:
    case CASE_INDEX_3:
    case CASE_INDEX_4:
        code = SetInputUri1(index, imageEffect, filter);
        break;
    case CASE_INDEX_5:
    case CASE_INDEX_6:
    case CASE_INDEX_7:
    case CASE_INDEX_8:
        code = SetInputUri2(index, imageEffect, filter);
        break;
    case CASE_INDEX_9:
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case CASE_INDEX_10:
        code = OH_ImageEffect_SetInputUri(nullptr, g_jpgUri.c_str());
        break;
    case CASE_INDEX_11:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputNativeBuffer(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (code == EFFECT_SUCCESS && nativeBuffer != nullptr) {
        code = OH_ImageEffect_SetInputNativeBuffer(imageEffect, nativeBuffer);
    }
    OH_NativeBuffer *outNativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (code == EFFECT_SUCCESS && outNativeBuffer != nullptr) {
        code = OH_ImageEffect_SetOutputNativeBuffer(imageEffect, outNativeBuffer);
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputPixelmap(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);
    OH_PixelmapNative *outputPixelmap = pixelmapNativePtr.get();
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code = EFFECT_UNKNOWN;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_SetOutputPixelmap(nullptr, outputPixelmap);
        break;
    case CASE_INDEX_3:
        code = OH_ImageEffect_SetOutputPixelmap(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputSurface(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OHNativeWindow *nativeWindow = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
        code = OH_ImageEffect_SetOutputSurface(imageEffect, nativeWindow);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
        code = OH_ImageEffect_SetOutputSurface(nullptr, nativeWindow);
        break;
    default:
        break;
    }
    
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

ImageEffect_ErrorCode SetInputUri3(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_2:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_3:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = IMAGE_EFFECT_100D;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_4:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_CHAR;
        value.dataValue.charValue = 'A';
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

ImageEffect_ErrorCode SetInputUri4(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_5:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_LONG;
        value.dataValue.longValue = 100L;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_6:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_BOOL;
        value.dataValue.boolValue = true;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_7:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
        value.dataValue.ptrValue = nullptr;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_8:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, nullptr, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

static napi_value OHImageEffectSetOutputUri(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
    case CASE_INDEX_2:
    case CASE_INDEX_3:
    case CASE_INDEX_4:
        code = SetInputUri3(index, imageEffect, filter);
        break;
    case CASE_INDEX_5:
    case CASE_INDEX_6:
    case CASE_INDEX_7:
    case CASE_INDEX_8:
        code = SetInputUri4(index, imageEffect, filter);
        break;
    case CASE_INDEX_9:
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case CASE_INDEX_10:
        code = OH_ImageEffect_SetInputUri(nullptr, g_jpgUri.c_str());
        break;
    case CASE_INDEX_11:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, nullptr, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    default:
        break;
    }
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetOutputUri(imageEffect, g_jpgUri.c_str());
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectStart(napi_env env, napi_callback_info info)
{
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);

    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;

    // 1、创建imageEffect实例，“ImageEdit”是imageEffect实例别名。
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create("ImageEdit");

    // 2、添加滤镜，多次调用该接口可以添加多个滤镜，组成滤镜链。
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    // 3、设置滤镜参数, 滤镜强度设置为50
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_50F;
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
    
    // 4、设置输入的Pixelmap
    errorCode = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);

    // 5、设置输出的Pixelmap（可选），不调用该接口时会在输入Pixelmap上直接生效滤镜效果
    errorCode = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);

    // 6、执行生效滤镜效果
    errorCode = OH_ImageEffect_Start(imageEffect);

    // 7、释放imageEffect实例资源
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

static napi_value OHImageEffectStop(napi_env env, napi_callback_info info)
{
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);

    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;

    // 1、创建imageEffect实例，“ImageEdit”是imageEffect实例别名。
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create("ImageEdit");

    // 2、添加滤镜，多次调用该接口可以添加多个滤镜，组成滤镜链。
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    // 3、设置滤镜参数, 滤镜强度设置为50
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_50F;
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    // 4、设置输入的Pixelmap
    errorCode = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);

    // 5、设置输出的Pixelmap（可选），不调用该接口时会在输入Pixelmap上直接生效滤镜效果
    errorCode = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);

    // 6、执行生效滤镜效果
    errorCode = OH_ImageEffect_Start(imageEffect);

    // 7、执行生效滤镜效果
    errorCode = OH_ImageEffect_Stop(imageEffect);

    // 7、释放imageEffect实例资源
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_property_descriptor desc1[] = {
    {"savePixelMapForPath", nullptr, savePixelMapForPath, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectBufferInfoCreate", nullptr, OHEffectBufferInfoCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectBufferInfoSetAddr", nullptr, OHEffectBufferInfoSetAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectBufferInfoGetAddr", nullptr, OHEffectBufferInfoGetAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectBufferInfoSetEffectFormat", nullptr, OHEffectBufferInfoSetEffectFormat, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectBufferInfoGetEffectFormat", nullptr, OHEffectBufferInfoGetEffectFormat, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectBufferInfoSetHeight", nullptr, OHEffectBufferInfoSetHeight, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectBufferInfoGetHeight", nullptr, OHEffectBufferInfoGetHeight, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectBufferInfoSetRowSize", nullptr, OHEffectBufferInfoSetRowSize, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectBufferInfoGetRowSize", nullptr, OHEffectBufferInfoGetRowSize, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectBufferInfoSetWidth", nullptr, OHEffectBufferInfoSetWidth, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectBufferInfoGetWidth", nullptr, OHEffectBufferInfoGetWidth, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectBufferInfoRelease", nullptr, OHEffectBufferInfoRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterInfoCreate", nullptr, OHEffectFilterInfoCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterInfoSetFilterName", nullptr, OHEffectFilterInfoSetFilterName, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectFilterInfoGetFilterName", nullptr, OHEffectFilterInfoGetFilterName, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectFilterInfoSetSupportedBufferTypes", nullptr, OHEffectFilterInfoSetSupportedBufferTypes, nullptr, nullptr,
     nullptr, napi_default, nullptr},
};

napi_property_descriptor desc2[] = {
    {"OHEffectFilterInfoGetSupportedBufferTypes", nullptr, OHEffectFilterInfoGetSupportedBufferTypes, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHEffectFilterInfoSetSupportedFormats", nullptr, OHEffectFilterInfoSetSupportedFormats, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectFilterInfoGetSupportedFormats", nullptr, OHEffectFilterInfoGetSupportedFormats, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectFilterInfoRelease", nullptr, OHEffectFilterInfoRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterCreate", nullptr, OHEffectFilterCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterSetValue", nullptr, OHEffectFilterSetValue, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterGetValue", nullptr, OHEffectFilterGetValue, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterLookupFilterInfo", nullptr, OHEffectFilterLookupFilterInfo, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectFilterLookupFilters", nullptr, OHEffectFilterLookupFilters, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHEffectFilterRegister", nullptr, OHEffectFilterRegister, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterRelease", nullptr, OHEffectFilterRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHEffectFilterReleaseFilterNames", nullptr, OHEffectFilterReleaseFilterNames, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHEffectFilterRender", nullptr, OHEffectFilterRender, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectCreate", nullptr, OHImageEffectCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectConfigure", nullptr, OHImageEffectConfigure, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectAddFilter", nullptr, OHImageEffectAddFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
};

napi_property_descriptor desc3[] = {
    {"OHImageEffectGetFilter", nullptr, OHImageEffectGetFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectGetFilterCount", nullptr, OHImageEffectGetFilterCount, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHImageEffectGetInputSurface", nullptr, OHImageEffectGetInputSurface, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHImageEffectInsertFilter", nullptr, OHImageEffectInsertFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectRelease", nullptr, OHImageEffectRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectRemoveFilter", nullptr, OHImageEffectRemoveFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectSave", nullptr, OHImageEffectSave, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectRestore", nullptr, OHImageEffectRestore, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectSetInputNativeBuffer", nullptr, OHImageEffectSetInputNativeBuffer, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHImageEffectSetInputPixelmap", nullptr, OHImageEffectSetInputPixelmap, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHImageEffectSetInputUri", nullptr, OHImageEffectSetInputUri, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectSetOutputNativeBuffer", nullptr, OHImageEffectSetOutputNativeBuffer, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHImageEffectSetOutputPixelmap", nullptr, OHImageEffectSetOutputPixelmap, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHImageEffectSetOutputSurface", nullptr, OHImageEffectSetOutputSurface, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHImageEffectSetOutputUri", nullptr, OHImageEffectSetOutputUri, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectStart", nullptr, OHImageEffectStart, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHImageEffectStop", nullptr, OHImageEffectStop, nullptr, nullptr, nullptr, napi_default, nullptr},
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    size_t mergedLength =
        sizeof(desc1) / sizeof(desc1[0]) + sizeof(desc2) / sizeof(desc2[0]) + sizeof(desc3) / sizeof(desc3[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    for (size_t i = 0; i < sizeof(desc2) / sizeof(desc2[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + i] = desc2[i];
    }
    for (size_t i = 0; i < sizeof(desc3) / sizeof(desc3[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + sizeof(desc2) / sizeof(desc2[0]) + i] = desc3[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imageEffect",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
