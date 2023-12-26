#include "napi/native_api.h"
#include "net_connection.h"
#include <netdb.h>
#include <string.h> 
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "NetManagerNDK"

static napi_value GetAddrInfo(napi_env env, napi_callback_info info) {
    //size_t requireArgc = 3;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value ret;
    int status = 0;
    int net_errno = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    char host[20] = {0};
    size_t result;
    napi_get_value_string_utf8(env, args[0], host, 20, &result);

    char serv[30] = {0};
    napi_get_value_string_utf8(env, args[1], serv, 30, &result);

    int netid = 0;
    napi_get_value_int32(env, args[2], &netid);

    struct addrinfo *res = NULL;
    status = OH_NetConn_GetAddrInfo(host, NULL, NULL, &res, netid);
    if (status == 0) {
        status = OH_NetConn_FreeDnsResult(res);
    }
    
    net_errno = status;
    napi_create_int32(env, net_errno, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getaddrinfo", nullptr, GetAddrInfo, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
