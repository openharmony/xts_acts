#include "napi/native_api.h"
#include "udmf.h"
#include "udmf_err_code.h"
#include <bits/alltypes.h>
#include <iostream>
//#include <ohcamera/camera.h>
#include <string>
#include "udmf_meta.h"
#include "uds.h"
#include "utd.h"

//OH_UdmfProperty
static napi_value OH_Udmf_CreatePropertiesFromUnifiedData001(napi_env env, napi_callback_info info) {
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);

    napi_value result = nullptr;
    napi_create_int32(env, properties != nullptr , &result);

    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}

static napi_value OH_Udmf_SetPropertiesTag001(napi_env env, napi_callback_info info) {
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfProperty *properties = OH_UdmfProperty_Create(data);
    int ret = OH_UdmfProperty_SetTag(properties, "tag");

    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdmfData_Destroy(data);
    OH_UdmfProperty_Destroy(properties);
    return result;
}



EXTERN_C_START static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"OH_Udmf_CreatePropertiesFromUnifiedData001", nullptr, OH_Udmf_CreatePropertiesFromUnifiedData001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Udmf_SetPropertiesTag001", nullptr, OH_Udmf_SetPropertiesTag001, nullptr, nullptr, nullptr, napi_default, nullptr}
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
        .nm_modname = "UdmfNdk",
        .nm_priv = ((void *)0),
        .reserved = {0},
    };

    extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
