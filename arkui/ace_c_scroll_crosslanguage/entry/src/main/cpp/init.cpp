//
// Created on 2023/12/5.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include <hilog/log.h>
#include "manager.h"

namespace NativeXComponentSample {
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
        if ((env == nullptr) || (exports == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
            return nullptr;
        }

        napi_property_descriptor desc[] = {
            {"getContext", nullptr, Manager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createNativeNode", nullptr, Manager::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createNativeNodeFalse", nullptr, Manager::CreateNativeNodeFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"upDateNativeNode", nullptr, Manager::UpdateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr}};

        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
             return nullptr;
        }

        Manager::GetInstance()->Export(env, exports);
        return exports;
    }
    EXTERN_C_END

    static napi_module nativeNodeModule = {.nm_version = 1,
                                             .nm_flags = 0,
                                             .nm_filename = nullptr,
                                             .nm_register_func = Init,
                                             .nm_modname = "nativeNode",
                                             .nm_priv = ((void *)0),
                                             .reserved = {0}};

    extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativeNodeModule); }
} // namespace NativeXComponentSample
