/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <linux/kd.h>
#include <string>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <dlfcn.h>
#include <iostream>

#include "napi/native_api.h"
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include "multimedia/image_framework/image_pixel_map_mdk.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "MY_TAG"

#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define NUM_5 5
#define NUM_6 6
#define MAX_BUFFER_SIZE 512
#define MAX_COLOR_SIZE 96
#define MAX_QUALITY_SIZE 98

OH_PixelmapNative *TEST_PIXELMAP = nullptr;
const char *LOG_APP = "ImageNDK";
const char* VPE_SO_NAME = "/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so";

static void OHLog(const char *module, const char *format, ...)
{

    char buffer[MAX_BUFFER_SIZE];

    va_list args;
    va_start(args, format);
    vsnprintf(buffer, sizeof(buffer), format, args);
    va_end(args);

    printf("[%s] %s\n", module, buffer);
}

#define OH_LOG_ERROR(module, format, ...)                                                                              \
    do {                                                                                                               \
        OHLog(module, format, ##__VA_ARGS__);                                                                          \
    } while (false)


#define OH_LOG_INFO(module, format, ...)                                                                               \
    do {                                                                                                               \
        OHLog(module, format, ##__VA_ARGS__);                                                                          \
    } while (false)

napi_value getJsResult(napi_env env, int result)
{
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

static napi_value TestInitializationOptionsSetRowStrideNormal(napi_env env, napi_callback_info info)
{
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1 ||
        argValue[NUM_0] == nullptr) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed, argCount: %{public}zu.", argCount);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
    int32_t rowStride = 0;
    napi_get_value_int32(env, argValue[0], &rowStride);
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapInitializationOptions_Create failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapInitializationOptions_SetRowStride(opts, rowStride);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    int32_t getStride = 0;
    errCode = OH_PixelmapInitializationOptions_GetRowStride(opts, &getStride);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    if (getStride != rowStride) {
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    errCode = OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapInitializationOptions_Release failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestInitializationOptionsSetRowStrideNormal success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

Image_ErrorCode releaseTestPixelmap()
{
    Image_ErrorCode errCode = OH_PixelmapNative_Release(TEST_PIXELMAP);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_Release failed, errCode: %{public}d.", errCode);
        return errCode;
    }
    TEST_PIXELMAP = nullptr;
    return IMAGE_SUCCESS;
}

Image_ErrorCode createPixelMap(uint32_t width, uint32_t height, int32_t pixelFormat, int32_t alphaType)
{
    OH_Pixelmap_InitializationOptions *createOpts;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&createOpts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap OH_PixelmapInitializationOptions_Create failed");
        return errCode;
    }
    errCode = OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap PixelmapInitializationOptions_SetWidth failed");
        return errCode;
    }
    errCode = OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap PixelmapInitializationOptions_SetHeight failed");
        return errCode;
    }
    errCode = OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, pixelFormat);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap InitializationOptions_SetPixelFormat failed");
        return errCode;
    }
    errCode = OH_PixelmapInitializationOptions_SetAlphaType(createOpts, alphaType);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap InitializationOptions_SetAlphaType failed");
        return errCode;
    }
    if (TEST_PIXELMAP != nullptr) {
        errCode = releaseTestPixelmap();
        if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap releaseTestPixelmap failed");
            return errCode;
        }
    }
    uint8_t colors[MAX_COLOR_SIZE];
    size_t colorLength = MAX_COLOR_SIZE;
    for (int i = 0; i < MAX_COLOR_SIZE; i++) {
        colors[i] = i + 1;
    }
    errCode = OH_PixelmapNative_CreatePixelmap(colors, colorLength, createOpts, &TEST_PIXELMAP);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap OH_PixelmapNative_CreatePixelmap failed");
        return errCode;
    }
    errCode = OH_PixelmapInitializationOptions_Release(createOpts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest createPixelMap PixelmapInitializationOptions_Release failed");
        return errCode;
    }
    return IMAGE_SUCCESS;
}

static napi_value TestCreatePixelMapWithStrideAbnormal(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest Test OH_Pixelmap_CreatePixelMapWithStride will call.");
    void* buffer = nullptr;
    size_t bufferSize = 0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    size_t rowStride = -1; // set a error row stride
    std::cout << "cout: ImagePixelmapNativeCTest Test will call OH_Pixelmap_CreatePixelMapWithStride." << std::endl;
    int32_t res = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buffer, bufferSize, rowStride, &pixelmap);
    std::cout << "cout: ImagePixelmapNativeCTest Test OH_Pixelmap_CreatePixelMapWithStride." << std::endl;
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest Test OH_Pixelmap_CreatePixelMapWithStride, res: %{public}zu.", res);
    if (res != IMAGE_RESULT_GET_DATA_ABNORMAL) {
        return getJsResult(env, res);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestCreatePixelMapWithStrideAbnormal success.");
    return getJsResult(env, 0);
}

static napi_value TestCreatePixelmap(napi_env env, napi_callback_info info)
{
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr || argValue[NUM_2] == nullptr ||
        argValue[NUM_3] == nullptr) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed, argCount: %{public}zu.", argCount);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
    uint32_t width;
    napi_get_value_uint32(env, argValue[NUM_0], &width);
    uint32_t height;
    napi_get_value_uint32(env, argValue[NUM_1], &height);
    int32_t pixelFormat;
    napi_get_value_int32(env, argValue[NUM_2], &pixelFormat);
    int32_t alphaType;
    napi_get_value_int32(env, argValue[NUM_3], &alphaType);
    Image_ErrorCode errCode = createPixelMap(width, height, pixelFormat, alphaType);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "ImagePixelmapNativeCTest TestCreatePixelmap createPixelMap failed.");
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestCreatePixelmap success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeScaleWithAntiAliasingNormal(napi_env env, napi_callback_info info)
{
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed, argCount: %{public}zu.", argCount);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
    double x = 0;
    double y = 0;
    napi_get_value_double(env, argValue[NUM_0], &x);
    napi_get_value_double(env, argValue[NUM_1], &y);
    Image_ErrorCode errCode = OH_PixelmapNative_ScaleWithAntiAliasing(TEST_PIXELMAP, (float)x, (float)y,
     OH_PixelmapNative_AntiAliasing_HIGH);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ScaleWithAntiAliasing failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeScaleWithAntiAliasingNormal success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_2 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return result;
    }
    NativePixelMap* native = nullptr;
    double x = 0;
    double y = 0;
    if (napi_get_value_double(env, argValue[NUM_0], &x) != napi_ok ||
        napi_get_value_double(env, argValue[NUM_1], &y) != napi_ok) {
        return result;
    }

    int32_t errCode = OH_PixelMap_ScaleWithAntiAliasing(
        native, static_cast<float>(x), static_cast<float>(y), OH_PixelMap_AntiAliasing_HIGH);
    if (errCode != IMAGE_RESULT_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_Pixelmap_ScaleWithAntiAliasing failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    return getJsResult(env, IMAGE_RESULT_SUCCESS);
}

static napi_value TestReleasePixelmap(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = releaseTestPixelmap();
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "releaseTestPixelmap failed, errCode: %{public}d.",
                     errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestReleasePixelmap success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char *utf8name, uint32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

static bool CheckVpe()
{
    void* handle = dlopen(VPE_SO_NAME, RTLD_LAZY);
    if (handle == nullptr) {
        OH_LOG_INFO(LOG_APP, "CheckVpe failed");
        return false;
    }
    dlclose(handle);
    handle = nullptr;
    return true;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testCreatePixelMapWithStrideAbnormal", nullptr, TestCreatePixelMapWithStrideAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testInitializationOptionsSetRowStrideNormal", nullptr, TestInitializationOptionsSetRowStrideNormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"testNativeScaleWithAntiAliasingNormal", nullptr, TestNativeScaleWithAntiAliasingNormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testScaleWithAntiAliasingAbnormal", nullptr, TestScaleWithAntiAliasingAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testCreatePixelmap", nullptr, TestCreatePixelmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testReleasePixelmap", nullptr, TestReleasePixelmap, nullptr, nullptr, nullptr, napi_default, nullptr}
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }