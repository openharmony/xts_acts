#include "napi/native_api.h"

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t requireArgc = 2;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

static napi_value loadModuleWithInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    if (status != napi_ok) {
        return nullptr;
    }
    
    napi_value path_c = args[1];
    napi_value name_c = args[0];
    char name[50] = {0};
    size_t len = 0;
    napi_get_value_string_utf8(env, name_c, name, 50, &len);
    char path[50] = {0};
    size_t pathLen = 0;
    napi_get_value_string_utf8(env, path_c, path, 50, &pathLen);
    
    napi_value result;
    if (pathLen == 0) {
        status = napi_load_module_with_info(env, name, "", &result);
    } else {
        status = napi_load_module_with_info(env, name, path, &result);
    }

    if (status != napi_ok) {
        return nullptr;
    }

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "loadModuleWithInfo", nullptr, loadModuleWithInfo, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "harone",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterHarOneModule(void)
{
    napi_module_register(&demoModule);
}
