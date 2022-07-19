#include "napi/native_api.h"
#include "image_pixel_map_napi.h"

constexpr int TEST_ARG_SUM = 1;

static napi_value TestGetImageInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[TEST_ARG_SUM] = {0};
    size_t argCount = TEST_ARG_SUM;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    
    OHOS::Media::OhosPixelMapInfo pixelMapInfo;
    OHOS::Media::OH_GetImageInfo(env, argValue[0], &pixelMapInfo);
    return result;
}

static napi_value TestAccessPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[TEST_ARG_SUM] = {0};
    size_t argCount = TEST_ARG_SUM;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);

    void* addrPtr = nullptr;
    OHOS::Media::OH_AccessPixels(env, argValue[0], &addrPtr);
    return result;
}

static napi_value TestUnAccessPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[TEST_ARG_SUM] = {0};
    size_t argCount = TEST_ARG_SUM;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);

    OHOS::Media::OH_UnAccessPixels(env, argValue[0]);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "testGetImageInfo", nullptr, TestGetImageInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testAccessPixels", nullptr, TestAccessPixels, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnAccessPixels", nullptr, TestUnAccessPixels, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/*
 * module define
 */
static napi_module g_module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imagePixelmap",
    .nm_priv = ((void*)0),
    .reserved = {0}
};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MyPixelMapRegisterModule(void)
{
    napi_module_register(&g_module);
}