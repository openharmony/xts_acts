/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#include "hilog/log.h"
#include "napi/native_api.h"
#include "rawfile/raw_file_manager.h"
#include "web/arkweb_scheme_handler.h"
#include "napi/native_api.h"
#include <cstddef>
#include <cstdint>
#include <stdint.h>
#include <node_api.h>
#include <string>


#undef LOG_TAG
#define LOG_TAG "ss-handler"


ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

int32_t  testHeader = 0;
int32_t  result_num = 0;
int32_t  result_num1 = 1;
int32_t  result_num2 = 1;

int32_t  judgment_num = 1;
std::string url_return = "";
bool  judgment = true;
int   g_parameter = 0;


// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    OH_ArkWeb_RegisterCustomSchemes("custom", ARKWEB_SCHEME_OPTION_STANDARD | ARKWEB_SCHEME_OPTION_CORS_ENABLED);
    OH_ArkWeb_RegisterCustomSchemes("custom-local", ARKWEB_SCHEME_OPTION_LOCAL);
    OH_ArkWeb_RegisterCustomSchemes("custom-csp-bypassing", ARKWEB_SCHEME_OPTION_CSP_BYPASSING | ARKWEB_SCHEME_OPTION_STANDARD);
    OH_ArkWeb_RegisterCustomSchemes("custom-isolated", ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED);
    return nullptr;
}

void OnURLRequestStart1(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart1");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char* url = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart2(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{   
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart2");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char* url = "https://www.baidu.com/";
    result_num = OH_ArkWebResponse_SetUrl(nullptr, url);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);

}

void OnURLRequestStart3(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart3");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char* url = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(nullptr, nullptr);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart4(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept) 
{
     *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart4");
     ArkWeb_Response* response = NULL;
     OH_ArkWeb_CreateResponse(&response);
     if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
     const char* url = "https://com.baidu123.www";
     result_num =  OH_ArkWebResponse_SetUrl( response, url);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart5(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{   
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart5");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char* url = "https://www.baidu.com/";
     char* geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
    OH_ArkWebResponse_GetUrl(nullptr, &geturl);
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
        judgment_num = 17100101;
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_GetUrl judgment_num is : %{public}d",judgment_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart6(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart6");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char* url = "https://www.baidu.com/";
     char* geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
    OH_ArkWebResponse_GetUrl(response, &geturl);
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
        judgment_num = 17100101;
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_GetUrl judgment_num is : %{public}d",judgment_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart7(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart7");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char* url = "https://www.baidu.com/";
     char* geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
    OH_ArkWebResponse_GetUrl(nullptr, nullptr);
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
        judgment_num = 17100101;
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_GetUrl judgment_num is : %{public}d",judgment_num);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart8(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart8");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char* url = "https://www.baidu.com/";
    char* geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
    OH_ArkWebResponse_GetUrl(response, &geturl);
        url_return = geturl;
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
    } else if(result_num == 17100101){
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart9(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart9");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    ArkWeb_NetError errorCode = ARKWEB_ERR_INVALID_ARGUMENT ;
    result_num1 = OH_ArkWebResponse_SetError(nullptr, errorCode);
    if (result_num1 == 0) {
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_SetError executed successfully.");
    } else if (result_num1 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Failed to execute OH_ArkWebResponse_SetError. Error: %{public}d", result_num1);
    }
}

void OnURLRequestStart10(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart10");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    int status = -100;
    result_num2 = OH_ArkWebResponse_SetStatus(response, status);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed: %{public}d", result_num2);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed: %{public}d", result_num2);
    }
}

void OnURLRequestStart11(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart11");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    int status = 200;
    result_num2 = OH_ArkWebResponse_SetStatus(nullptr, status);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed: %{public}d", result_num2);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed: %{public}d", result_num2);
    }
}

void OnURLRequestStart12(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart12");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    int status = 12345678;
    result_num2 = OH_ArkWebResponse_SetStatus(response, status);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed: %{public}d", result_num2);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed: %{public}d", result_num2);
    }
}

void OnURLRequestStart13(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart13");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char * statusText = "HauWei" ;
    result_num2 = OH_ArkWebResponse_SetStatusText (nullptr, statusText );
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}d", result_num2);
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}s", statusText);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed SetStatusText: %{public}d", result_num2);
    }
}

void OnURLRequestStart14(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart14");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char * statusText =  nullptr ;
    result_num2 = OH_ArkWebResponse_SetStatusText (response, statusText );
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}d", result_num2);
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}s", statusText);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed SetStatusText: %{public}d", result_num2);
    }
}

void OnURLRequestStart15(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart15");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    const char * statusText = "HauWei" ;
    result_num2 = OH_ArkWebResponse_SetStatusText (response, statusText);
    if (result_num2 == 0) {
        OH_ArkWebResponse_GetStatusText (response, nullptr);
        result_num1 = 17100101;
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}d", result_num2);
        OH_LOG_ERROR(LOG_APP, " Failed to OH_ArkWebResponse_GetStatusText: %{public}d", result_num1);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed SetStatusText: %{public}d", result_num2);
    }
}

void OnURLRequestStart16(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart16");
    ArkWeb_Response* response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
     OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
     return;
    }
    result_num2 = OH_ArkWebResponse_SetCharset (response, nullptr );
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, " Succeed in  OH_ArkWebResponse_SetCharset %{public}d", result_num2);
    } else if(result_num2 == 17100101){
        OH_LOG_ERROR(LOG_APP, "Failed to  OH_ArkWebResponse_SetCharset %{public}d", result_num2);
    }
}

void OnURLRequestStart17(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart17");
    bool judgment123;
    const char *scheme = "http";  
    const char *webTag = "";
    if (schemeHandler != NULL) {
        judgment123 = OH_ArkWeb_SetSchemeHandler(scheme, webTag, (ArkWeb_SchemeHandler *)schemeHandler);
        if (judgment123) {
            OH_LOG_INFO(LOG_APP, "Scheme handler set successfully.");
            result_num2 =  OH_ArkWeb_ClearSchemeHandlers (webTag);
            if (result_num2 == 0) {
                //SetSchemeHandler成功、ClearSchemeHandlers成功
                OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ClearSchemeHandlers result_num2 : %{public}d", result_num2);
                OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ClearSchemeHandlers clear successfully.");
            } else if (result_num2 == 17100101) {
                 OH_LOG_ERROR(LOG_APP, "OH_ArkWeb_ClearSchemeHandlers clear failed ");
            }
        } else {
            // OH_ArkWeb_SetSchemeHandler设置失败
            OH_LOG_ERROR(LOG_APP, "Failed to set scheme handler.");
        }
    } else {
        //schemeHandler为空值
        OH_LOG_ERROR(LOG_APP, "Scheme handler pointer is NULL.");
    }
    
}

void OnURLRequestStart19(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{    
   *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart19");
    void* userData = malloc(sizeof(int));
    if (userData == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to allocate memory for userData");
        return;
    }
    *((int*)userData) = 43; 
    result_num2 = OH_ArkWebSchemeHandler_SetUserData((ArkWeb_SchemeHandler*)schemeHandler, nullptr);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in OH_ArkWebSchemeHandler_SetUserData");
        OH_LOG_INFO(LOG_APP, "Succeed in OH_ArkWebSchemeHandler_SetUserData result_num2 : %{public}d", result_num2);
    } else if (result_num2 == 17100101) {
         OH_LOG_ERROR(LOG_APP, "Failed to set userData for schemeHandler");
        OH_LOG_INFO(LOG_APP, "Failed to  OH_ArkWebSchemeHandler_SetUserData result_num2 : %{public}d", result_num2);
    }
}


// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler。
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler,
                      const ArkWeb_ResourceRequest *request)
{
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }
    
}

void OnURLRequestStartForSW(const ArkWeb_SchemeHandler *schemeHandler,
                            ArkWeb_ResourceRequest *resourceRequest,
                            const ArkWeb_ResourceHandler *resourceHandler,
                            bool *intercept)
{
   
}

void OnURLRequestStopForSW(const ArkWeb_SchemeHandler *schemeHandler,
                           const ArkWeb_ResourceRequest *request)
{
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }

}

// 设置SchemeHandler。
static napi_value SetSchemeHandler(napi_env env, napi_callback_info info)
{
     napi_value argv[1];
    size_t argc = 1;
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    if (argc < 1) {
        napi_throw_error(env, nullptr, "Expected one argument");
        return nullptr;
    }
    
    napi_valuetype valuetype;
    napi_typeof(env, argv[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return nullptr;
    }
    
    double value;
    napi_get_value_double(env, argv[0], &value);
    g_parameter = (int)value;  
    OH_LOG_INFO(LOG_APP, "g_parameter ========= %{public}d", g_parameter);
    OH_LOG_INFO(LOG_APP, "set scheme handler");
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandlerForSW);
    
  switch(g_parameter){
        
        case 1:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart1);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart1);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;        
        
        case 2:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart2);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart2);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 3:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart3);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart3);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 4:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart4);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart4);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 5:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart5);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart5);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 6:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart6);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart6);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 7:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart7);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart7);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 8:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart8);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart8);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 9:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart9);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart9);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 10:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart10);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart10);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 11:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart11);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart11);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 12:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart12);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart12);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 13:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart13);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart13);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 14:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart14);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart14);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 15:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart15);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart15);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 16:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart16);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart16);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 17:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart17);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart17);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
        case 19:
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart19);
              
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
            
                OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart19);
                   
                OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
        break;
        
  }
    OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-csp-bypassing", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-isolated", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-local", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("https", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("http", "scheme-handler", g_schemeHandler);

    OH_ArkWebServiceWorker_SetSchemeHandler("https", g_schemeHandlerForSW);
    return nullptr;
}

static napi_value InitResourceManager(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}


static napi_value SetUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, result_num, &result);
    return result;
}

static napi_value SetError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, result_num1, &result);
    return result;
}

static napi_value SetStatus(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, result_num2, &result);
    return result;
}


static napi_value Judgment_num(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, judgment_num, &result);
    return result;
}

static napi_value Url_return(napi_env env, napi_callback_info info) {
    napi_value result;
    // 使用 napi_create_string_utf8 创建字符串类型的 napi_value
    napi_create_string_utf8(env, url_return.c_str(), url_return.length(), &result);
    return result;
}

static napi_value Judgment(napi_env env, napi_callback_info info)
{
   napi_value result;
    if (judgment) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setUrl", nullptr, SetUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setError", nullptr, SetError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setStatus", nullptr, SetStatus, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment_num", nullptr, Judgment_num, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"url_return", nullptr, Url_return, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment", nullptr, Judgment, nullptr, nullptr, nullptr, napi_default, nullptr},
        
        
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}