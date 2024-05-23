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
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <native_window/external_window.h>
#include <stdlib.h>
#include <string>

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__);

#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"

const std::string g_jpgUri = std::string("file:///data/test/resource/image_effect_1k_test1.jpg");

/**-----------------------------------------   EffectBufferInfo   --------------------------------------------------**/
static napi_value OHEffectBufferInfoCreate(napi_env env, napi_callback_info info) {
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

static napi_value OHEffectBufferInfoSetAddr(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *addr = malloc(1000);
    switch (index) {
    case 1:
        break;
    case 2:
        bufferInfo = nullptr;
        break;
    case 3:
        addr = nullptr;
        break;
    case 4:
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

static napi_value OHEffectBufferInfoGetAddr(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *setAddr = malloc(1000);
    switch (index) {
    case 1:
        OH_EffectBufferInfo_SetAddr(bufferInfo, setAddr);
        break;
    case 2:
        break;
    case 3:
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    void *retAddr = nullptr;
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetEffectFormat(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);


    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_Format format;
    switch (index) {
    case 1:
        format = EFFECT_PIXEL_FORMAT_UNKNOWN;
        break;
    case 2:
        format = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case 3:
        format = EFFECT_PIXEL_FORMAT_NV21;
        break;
    case 4:
        format = EFFECT_PIXEL_FORMAT_NV12;
        break;
    case 5:
        format = EFFECT_PIXEL_FORMAT_RGBA1010102;
        break;
    case 6:
        format = EFFECT_PIXEL_FORMAT_YCBCR_P010;
        break;
    case 7:
        format = EFFECT_PIXEL_FORMAT_YCRCB_P010;
        break;
    case 8:
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

static napi_value OHEffectBufferInfoGetEffectFormat(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);


    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_Format setFormat;
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        setFormat = EFFECT_PIXEL_FORMAT_UNKNOWN;
        code = OH_EffectBufferInfo_SetEffectFormat(bufferInfo, setFormat);
        break;
    case 2:
        setFormat = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case 3:
        break;
    case 4:
        bufferInfo = nullptr;
        setFormat = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case 5:
        bufferInfo = nullptr;
        break;
    default:
        break;
    }

    ImageEffect_Format getFormat;
    code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetHeight(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    int32_t height;
    switch (index) {
    case 1:
        height = 0;
        break;
    case 2:
        height = 1000;
        break;
    case 3:
        height = -1000;
        break;
    case 4:
        bufferInfo = nullptr;
        height = 1000;
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

static napi_value OHEffectBufferInfoGetHeight(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setHeight;
    switch (index) {
    case 1:
        setHeight = 0;
        code = OH_EffectBufferInfo_SetHeight(bufferInfo, setHeight);
        break;
    case 2:
        setHeight = 1000;
        break;
    case 3:
        setHeight = -1000;
        break;
    case 4:
        bufferInfo = nullptr;
        setHeight = 1000;
        break;
    default:
        break;
    }
    int32_t getHeight;
    code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetRowSize(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);


    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t rowSize;
    switch (index) {
    case 1:
        rowSize = 1024;
        break;
    case 2:
        rowSize = 1048576;
        break;
    case 3:
        rowSize = 1073741824;
        break;
    case 4:
        bufferInfo = nullptr;
        rowSize = 1024;
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

static napi_value OHEffectBufferInfoGetRowSize(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setRowSize;
    switch (index) {
    case 1:
        setRowSize = 1024;
        code = OH_EffectBufferInfo_SetRowSize(bufferInfo, setRowSize);
        break;
    case 2:
        setRowSize = 1048576;
        break;
    case 3:
        setRowSize = 1073741824;
        break;
    case 4:
        bufferInfo = nullptr;
        setRowSize = 1024;
        break;
    default:
        break;
    }
    int32_t getRowSize;
    code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoSetWidth(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t width;
    switch (index) {
    case 1:
        width = 1080;
        break;
    case 2:
        width = 4090;
        break;
    case 3:
        width = -5120;
        break;
    case 4:
        bufferInfo = nullptr;
        width = 1024;
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

static napi_value OHEffectBufferInfoGetWidth(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setWidth;
    switch (index) {
    case 1:
        setWidth = 1080;
        code = OH_EffectBufferInfo_SetWidth(bufferInfo, setWidth);
        break;
    case 2:
        setWidth = 4090;
        break;
    case 3:
        setWidth = -5120;
        break;
    case 4:
        bufferInfo = nullptr;
        setWidth = 1024;
        break;
    default:
        break;
    }
    int32_t getWidth;
    code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectBufferInfoRelease(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo;
    switch (index) {
    case 1:
        bufferInfo = OH_EffectBufferInfo_Create();
        break;
    case 2:
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
static napi_value OHEffectFilterInfoCreate(napi_env env, napi_callback_info info) {
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

static napi_value OHEffectFilterInfoSetFilterName(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    char *name;
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        name = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        break;
    case 2:
        filterInfo = nullptr;
        name = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        break;
    case 3:
        filterInfo = nullptr;
        name = (char *)"";
        break;
    default:
        break;
    }
    code = OH_EffectFilterInfo_SetFilterName(filterInfo, const_cast<char *>(name));
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoGetFilterName(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    char *setName;
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        setName = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, const_cast<char *>(setName));
        break;
    case 2:
        filterInfo = nullptr;
        setName = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        break;
    case 3:
        filterInfo = nullptr;
        setName = (char *)"";
        break;
    default:
        break;
    }
    char *getName;
    code = OH_EffectFilterInfo_GetFilterName(filterInfo, &getName);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoSetSupportedBufferTypes(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_BufferType bufferTypes[2] = {};
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        break;
    case 2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        break;
    case 3:
        filterInfo = nullptr;
        memset(bufferTypes, 0, sizeof(bufferTypes));
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

static napi_value OHEffectFilterInfoGetSupportedBufferTypes(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_BufferType bufferTypes[2] = {};
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
        break;
    case 2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        break;
    case 3:
        filterInfo = nullptr;
        memset(bufferTypes, 0, sizeof(bufferTypes));
        break;
    default:
        break;
    }
    ImageEffect_BufferType *bufferTypeArray;
    uint32_t getSize;
    code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoSetSupportedFormats(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    switch (index) {
    case 1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case 2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        break;
    case 3:
        filterInfo = nullptr;
        memset(formats, 0, sizeof(formats));
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

static napi_value OHEffectFilterInfoGetSupportedFormats(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    uint32_t setSize = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        break;
    case 2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        break;
    case 3:
        filterInfo = nullptr;
        memset(formats, 0, sizeof(formats));
        break;
    case 4:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV21;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        break;
    case 5:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        break;
    case 6:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA1010102;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        break;
    default:
        break;
    }

    uint32_t getSize;
    ImageEffect_Format *formatArray;
    code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterInfoRelease(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo;
    ImageEffect_ErrorCode code;
    switch (index) {
    case 1:
        filterInfo = OH_EffectFilterInfo_Create();
        break;
    case 2:
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
static napi_value OHEffectFilterCreate(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter;
    switch (index) {
    case 1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case 2:
        filter = OH_EffectFilter_Create(nullptr);
        break;
    default:
        break;
    }

    int code = 401;
    if (filter != nullptr) {
        OH_EffectFilter_Release(filter);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterSetValue(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter;
    char *keyName;
    ImageEffect_Any value;
    switch (index) {
    case 1:
        filter = OH_EffectFilter_Create(const_cast<char *>(OH_EFFECT_BRIGHTNESS_FILTER));
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        break;
    case 2:
        filter = nullptr;
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        break;
    case 3:
        filter = OH_EffectFilter_Create(const_cast<char *>(OH_EFFECT_BRIGHTNESS_FILTER));
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        break;
    case 4:
        filter = OH_EffectFilter_Create(const_cast<char *>(OH_EFFECT_BRIGHTNESS_FILTER));
        keyName = (char *)KEY_FILTER_INTENSITY;
        break;
    case 5:
        filter = OH_EffectFilter_Create(const_cast<char *>(OH_EFFECT_BRIGHTNESS_FILTER));
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 100;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
    OH_EffectFilter_Release(filter);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterGetValue(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *name;
    char *keyName;
    ImageEffect_Any value;
    OH_EffectFilter *filter;
    ImageEffect_Any result;
    switch (index) {
    case 1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        break;
    case 2:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        keyName = (char *)KEY_FILTER_INTENSITY;
        break;
    case 3:
        keyName = (char *)KEY_FILTER_INTENSITY;
        break;
    case 4:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case 5:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 100;
        OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectFilter_GetValue(filter, const_cast<char *>(keyName), &result);
    OH_EffectFilter_Release(filter);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterLookupFilterInfo(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    switch (index) {
    case 1:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, filterInfo);
        break;
    case 2:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, nullptr);
        break;
    case 3:
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

static napi_value OHEffectFilterLookupFilters(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *key;
    switch (index) {
    case 1:
        key = (char *)"Format:default";
        break;
    case 2:
        key = (char *)"Format:rgba_8888";
        break;
    case 3:
        key = (char *)"Format:nv21";
        break;
    case 4:
        key = (char *)"Format:nv12";
        break;
    case 5:
        key = (char *)"test:default";
        break;
    default:
        break;
    }

    ImageEffect_FilterNames *filterNames = OH_EffectFilter_LookupFilters(key);

    int code = -1;
    if (filterNames != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterRegister(napi_env env, napi_callback_info info) {
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
    case 1:
        code = OH_EffectFilter_Register(filterInfo, &delegate);
        break;
    case 2:
        code = OH_EffectFilter_Register(nullptr, &delegate);
        break;
    case 3:
        code = OH_EffectFilter_Register(filterInfo, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterRelease(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilter *filter;
    switch (index) {
    case 1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilter_Release(filter);
        break;
    case 2:
        code = OH_EffectFilter_Release(nullptr);
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHEffectFilterReleaseFilterNames(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    switch (index) {
    case 1:
        OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        OH_EffectFilter_ReleaseFilterNames();
        break;
    case 2:
        OH_EffectFilter_ReleaseFilterNames();
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OHEffectFilterRender(napi_env env, napi_callback_info info) {
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = 100.f;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    OH_PixelmapNative *pixelmap = nullptr;
    uint8_t data[] = {};
    size_t dataLength = 0;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    OH_ImageEffect_SetInputPixelmap(imageEffect, pixelmap);

    //     code = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);

    code = OH_EffectFilter_Render(filter, pixelmap, pixelmap);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}


/**-------------------------------------------------- Effect -------------------------------------------------------**/
static napi_value OHImageEffectCreate(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect;
    switch (index) {
    case 1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case 2:
        imageEffect = OH_ImageEffect_Create(nullptr);
        break;
    }

    int code = 401;
    if (imageEffect != nullptr) {
        OH_ImageEffect_Release(imageEffect);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectConfigure(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect;
    const char *key;
    ImageEffect_Any value;
    switch (index) {
    case 1: // TODO：目前value的type只支持int32
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 2;
        break;
    case 2:
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case 3:
        imageEffect = nullptr;
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        break;
    case 4:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = nullptr;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        break;
    case 5:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = nullptr;
    default:
        break;
    }


    ImageEffect_ErrorCode code = OH_ImageEffect_Configure(imageEffect, key, &value);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectAddFilter(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *name;
    char *filterName;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        filterName = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        break;
    case 2:
        name = (char *)"";
        filterName = nullptr;
        break;
    }

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, const_cast<char *>(filterName));
    int status = 401;
    if (filter != nullptr) {
        status = 0;
    }
    OH_EffectFilter_Release(filter);
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectGetFilter(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *name;
    char *filterName;
    int32_t getFilterIndex;
    OH_ImageEffect *imageEffect;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        filterName = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        getFilterIndex = 0;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        OH_ImageEffect_AddFilter(imageEffect, const_cast<char *>(filterName));
        break;
    case 2:
        name = (char *)"";
        filterName = nullptr;
        getFilterIndex = 1;
        imageEffect = nullptr;
        break;
    }

    OH_EffectFilter *getFilter = OH_ImageEffect_GetFilter(imageEffect, getFilterIndex);
    int status = 401;
    if (getFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectGetFilterCount(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t count = 0;
    switch (index) {
    case 1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case 2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case 3:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case 4:
        count = OH_ImageEffect_GetFilterCount(nullptr);
        break;
    }

    int status = 401;
    if (count >= 0) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectGetInputSurface(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *name;
    OH_ImageEffect *imageEffect;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        break;
    case 2:
        name = (char *)"";
        imageEffect = nullptr;
        break;
    }

    OHNativeWindow *nativeWindow = nullptr;
    ImageEffect_ErrorCode code = OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectInsertFilter(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *insertFilter;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    char *name;
    uint32_t idx;
    char *filterName;
    switch (index) {
    case 1:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case 2:
        insertFilter = OH_ImageEffect_InsertFilter(nullptr, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case 3:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, -1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case 4:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 0, nullptr);
        break;
    default:
        break;
    }

    int status = 401;
    if (insertFilter != nullptr) {
        status = 0;
    }
    //     OH_EffectFilter_Release(addFilter);
    //     OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectRelease(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *name;
    OH_ImageEffect *imageEffect;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        break;
    case 2:
        imageEffect = nullptr;
        break;
    }
    ImageEffect_ErrorCode code = OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectRemoveFilter(napi_env env, napi_callback_info info) {


    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect;
    char *name;
    char *addName;
    char *addNameTwo;
    int32_t result;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        addName = (char *)OH_EFFECT_BRIGHTNESS_FILTER;
        OH_ImageEffect_AddFilter(imageEffect, const_cast<char *>(addName));
        result = OH_ImageEffect_RemoveFilter(imageEffect, const_cast<char *>(addName));
        break;
    case 2:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        addName = (char *)OH_EFFECT_CONTRAST_FILTER;
        OH_ImageEffect_AddFilter(imageEffect, const_cast<char *>(addName));
        addNameTwo = (char *)OH_EFFECT_CROP_FILTER;
        OH_ImageEffect_AddFilter(imageEffect, const_cast<char *>(addNameTwo));
        result = OH_ImageEffect_RemoveFilter(imageEffect, const_cast<char *>(addNameTwo));
        break;
    case 3:
        imageEffect = nullptr;
        result = OH_ImageEffect_RemoveFilter(imageEffect, nullptr);
        break;
    }
    napi_value ret;
    int32_t status = 401;
    if (result > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

static napi_value OHImageEffectSave(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect;
    char *name;
    char *imageEffectInfo;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        imageEffectInfo = (char *)"";
        break;
    case 2:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        imageEffectInfo = nullptr;
        break;
    case 3:
        imageEffect = nullptr;
        imageEffectInfo = nullptr;
        break;
    }

    napi_value ret;
    ImageEffect_ErrorCode code = OH_ImageEffect_Save(imageEffect, &imageEffectInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectRestore(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect;
    char *name;
    char *imageEffectInfo;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        imageEffectInfo = (char *)"";
        break;
    case 2:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        imageEffectInfo = nullptr;
        break;
    case 3:
        imageEffect = nullptr;
        imageEffectInfo = nullptr;
        break;
    }


    napi_value ret;
    ImageEffect_ErrorCode code = OH_ImageEffect_Save(imageEffect, &imageEffectInfo);
    if (code != 0) {
        napi_create_int32(env, code, &ret);
        return ret;
    }
    imageEffect = OH_ImageEffect_Restore(imageEffectInfo);
    int32_t result = -1;
    if (imageEffect != nullptr) {
        result = 0;
    }
    napi_create_int32(env, result, &ret);
    return ret;
}

static napi_value OHImageEffectSetInputNativeBuffer(napi_env env, napi_callback_info info) {
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = 100.f;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    //     MockSurfaceBuffer *mockSurfaceBuffer_ = new MockSurfaceBuffer();
    OH_NativeBuffer *nativeBuffer; // reinterpret_cast<OH_NativeBuffer *>(mockSurfaceBuffer_);
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetInputNativeBuffer(imageEffect, nativeBuffer);
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetInputPixelmap(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    napi_value pixelMap = nullptr;
    struct OhosPixelMapCreateOps createOps;
    createOps.width = 4;
    createOps.height = 6;
    createOps.pixelFormat = 4;
    createOps.alphaType = 0;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    char *cc = (char *)buff;
    for (int i = 0; i < 96; i++) {
        *(cc++) = (char)i;
    }
    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    if (res != IMAGE_RESULT_SUCCESS || pixelMap == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, "OH_PixelMap_CreatePixelMap failure");
    }
    OH_PixelmapNative *inputPixelmap = nullptr;
    OH_ImageEffect *imageEffect = nullptr;
    switch (index) {
    case 1:
        inputPixelmap = (OH_PixelmapNative *)pixelMap;
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case 2:
        inputPixelmap = (OH_PixelmapNative *)pixelMap;
        break;
    case 3:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    }
    free(buff);
    ImageEffect_ErrorCode code = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetInputUri(napi_env env, napi_callback_info info) {
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *keyName;
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
        // TODO:测试全部通过，(setValue)
    case 1:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 2:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 3:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = 100.0;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 4:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_CHAR;
        value.dataValue.charValue = 'A';
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 5:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_LONG;
        value.dataValue.longValue = 100L;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 6:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_BOOL;
        value.dataValue.boolValue = true;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 7:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
        value.dataValue.ptrValue = nullptr;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 8:
        keyName = (char *)"";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 100;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 9:
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case 10:
        code = OH_ImageEffect_SetInputUri(nullptr, g_jpgUri.c_str());
        break;
    case 11:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 100;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputNativeBuffer(napi_env env, napi_callback_info info) {
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = 100.f;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    //     MockSurfaceBuffer *mockSurfaceBuffer_ = new MockSurfaceBuffer();
    OH_NativeBuffer *nativeBuffer; // reinterpret_cast<OH_NativeBuffer *>(mockSurfaceBuffer_);
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetInputNativeBuffer(imageEffect, nativeBuffer);
    }
    OH_NativeBuffer *outNativeBuffer;
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetOutputNativeBuffer(imageEffect, outNativeBuffer);
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputPixelmap(napi_env env, napi_callback_info info) {
    OH_PixelmapNative *inputPixelmap = nullptr;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code = OH_ImageEffect_SetOutputPixelmap(imageEffect, inputPixelmap);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputSurface(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *name;
    OH_ImageEffect *imageEffect;
    switch (index) {
    case 1:
        name = (char *)IMAGE_EFFECT_NAME;
        imageEffect = OH_ImageEffect_Create(const_cast<char *>(name));
        break;
    case 2:
        name = (char *)"";
        imageEffect = nullptr;
        break;
    }

    OHNativeWindow *nativeWindow = nullptr;
    OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
    ImageEffect_ErrorCode code = OH_ImageEffect_SetOutputSurface(imageEffect, nativeWindow); // TODO:有问题
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectSetOutputUri(napi_env env, napi_callback_info info) {
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);


    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    char *keyName;
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
        // TODO：有问题->全部通过 (setValue)
    case 1:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 2:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = 100.f;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 3:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = 100.0;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 4:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_CHAR;
        value.dataValue.charValue = 'A';
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 5:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_LONG;
        value.dataValue.longValue = 100L;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 6:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_BOOL;
        value.dataValue.boolValue = true;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 7:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
        value.dataValue.ptrValue = nullptr;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 8:
        keyName = (char *)"";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 100;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case 9:
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case 10:
        code = OH_ImageEffect_SetInputUri(nullptr, g_jpgUri.c_str());
        break;
    case 11:
        keyName = (char *)KEY_FILTER_INTENSITY;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = 100;
        code = OH_EffectFilter_SetValue(filter, const_cast<char *>(keyName), &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    default:
        break;
    }
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetOutputUri(imageEffect, g_jpgUri.c_str());
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectStart(napi_env env, napi_callback_info info) {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode code = OH_ImageEffect_Start(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value OHImageEffectStop(napi_env env, napi_callback_info info) {
    // TODO: start有问题，stop也没有更改

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code = OH_ImageEffect_Start(imageEffect);
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_Stop(imageEffect);
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}


EXTERN_C_START static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"OHEffectBufferInfoCreate", nullptr, OHEffectBufferInfoCreate, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHEffectBufferInfoSetAddr", nullptr, OHEffectBufferInfoSetAddr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHEffectBufferInfoGetAddr", nullptr, OHEffectBufferInfoGetAddr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
        {"OHEffectBufferInfoRelease", nullptr, OHEffectBufferInfoRelease, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHEffectFilterInfoCreate", nullptr, OHEffectFilterInfoCreate, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHEffectFilterInfoSetFilterName", nullptr, OHEffectFilterInfoSetFilterName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHEffectFilterInfoGetFilterName", nullptr, OHEffectFilterInfoGetFilterName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHEffectFilterInfoSetSupportedBufferTypes", nullptr, OHEffectFilterInfoSetSupportedBufferTypes, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHEffectFilterInfoGetSupportedBufferTypes", nullptr, OHEffectFilterInfoGetSupportedBufferTypes, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHEffectFilterInfoSetSupportedFormats", nullptr, OHEffectFilterInfoSetSupportedFormats, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHEffectFilterInfoGetSupportedFormats", nullptr, OHEffectFilterInfoGetSupportedFormats, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHEffectFilterInfoRelease", nullptr, OHEffectFilterInfoRelease, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHEffectFilterCreate", nullptr, OHEffectFilterCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHEffectFilterSetValue", nullptr, OHEffectFilterSetValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHEffectFilterGetValue", nullptr, OHEffectFilterGetValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHEffectFilterLookupFilterInfo", nullptr, OHEffectFilterLookupFilterInfo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
        {"OHImageEffectGetFilter", nullptr, OHImageEffectGetFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHImageEffectGetFilterCount", nullptr, OHImageEffectGetFilterCount, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHImageEffectGetInputSurface", nullptr, OHImageEffectGetInputSurface, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHImageEffectInsertFilter", nullptr, OHImageEffectInsertFilter, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHImageEffectRelease", nullptr, OHImageEffectRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHImageEffectRemoveFilter", nullptr, OHImageEffectRemoveFilter, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHImageEffectSave", nullptr, OHImageEffectSave, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHImageEffectRestore", nullptr, OHImageEffectRestore, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHImageEffectSetInputNativeBuffer", nullptr, OHImageEffectSetInputNativeBuffer, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHImageEffectSetInputPixelmap", nullptr, OHImageEffectSetInputPixelmap, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHImageEffectSetInputUri", nullptr, OHImageEffectSetInputUri, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHImageEffectSetOutputNativeBuffer", nullptr, OHImageEffectSetOutputNativeBuffer, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHImageEffectSetOutputPixelmap", nullptr, OHImageEffectSetOutputPixelmap, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHImageEffectSetOutputSurface", nullptr, OHImageEffectSetOutputSurface, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHImageEffectSetOutputUri", nullptr, OHImageEffectSetOutputUri, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHImageEffectStart", nullptr, OHImageEffectStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHImageEffectStop", nullptr, OHImageEffectStop, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "imageEffect",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
