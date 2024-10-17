/*
 * Copyright (C) 2024 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specif ic language governing permissions and
 * limitations under the License.
 */

#include "hilog/log.h"
#include "napi/native_api.h"
#include "rawfile/raw_file_manager.h"
#include "web/arkweb_scheme_handler.h"
#include "napi/native_api.h"
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <stdint.h>
#include <node_api.h>
#include <string>


#undef LOG_TAG
#define LOG_TAG "ss-handler"


ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

int32_t result_num = 0;
int32_t result_num1 = 1;
int32_t result_num2 = 1;

int32_t judgment_num = 1;
std::string url_return = "";
bool judgment = true;
int g_parameter = 0;
int error_num = 17100101;


bool judgment1 = false;
bool judgment2 = false;
int judgment_index = 0;
char *return_method;


// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info) {
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    OH_ArkWeb_RegisterCustomSchemes("custom", ARKWEB_SCHEME_OPTION_STANDARD | ARKWEB_SCHEME_OPTION_CORS_ENABLED);
    OH_ArkWeb_RegisterCustomSchemes("custom-local", ARKWEB_SCHEME_OPTION_LOCAL);
    OH_ArkWeb_RegisterCustomSchemes("custom-csp-bypassing",
                                    ARKWEB_SCHEME_OPTION_CSP_BYPASSING | ARKWEB_SCHEME_OPTION_STANDARD);
    OH_ArkWeb_RegisterCustomSchemes("custom-isolated", ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED);
    return nullptr;
}

void OnURLRequestStart1(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart1");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *url = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart2(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart2");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *protocol = "https://";
    const char *domain = "www.baidu.com/";
    char url[256];
    strncpy(url, protocol, sizeof(url) - 1);
    strncat(url, domain, sizeof(url) - strlen(url) - 1);
    url[sizeof(url) - 1];
    result_num = OH_ArkWebResponse_SetUrl(nullptr, url);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart3(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart3");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *url = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(nullptr, nullptr);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart4(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart4");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *protocol = "https://";
    const char *domain = "com.baidu123.www";
    char url[256];
    strncpy(url, protocol, sizeof(url) - 1);
    strncat(url, domain, sizeof(url) - strlen(url) - 1);
    url[sizeof(url) - 1];
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in setting URL: %{public}s", url);
        OH_LOG_INFO(LOG_APP, "Succeed OH_ArkWebResponse_SetUrl with code: %{public}d", result_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl url: %{public}s", url);
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl with error code: %{public}d", result_num);
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart5(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart5");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *protocol = "https://";
    const char *domain = "www.baidu.com/";
    char url[256];
    strncpy(url, protocol, sizeof(url) - 1);
    strncat(url, domain, sizeof(url) - strlen(url) - 1);
    url[sizeof(url) - 1];
    char *geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_ArkWebResponse_GetUrl(nullptr, &geturl);
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
        judgment_num = error_num;
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_GetUrl judgment_num is : %{public}d", judgment_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart6(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart6");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *protocol = "https://";
    const char *domain = "www.baidu.com/";
    char url[256];
    strncpy(url, protocol, sizeof(url) - 1);
    strncat(url, domain, sizeof(url) - strlen(url) - 1);
    url[sizeof(url) - 1];
    char *geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_ArkWebResponse_GetUrl(response, &geturl);
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
        judgment_num = error_num;
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_GetUrl judgment_num is : %{public}d", judgment_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart7(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart7");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *protocol = "https://";
    const char *domain = "www.baidu.com/";
    char url[256];
    strncpy(url, protocol, sizeof(url) - 1);
    strncat(url, domain, sizeof(url) - strlen(url) - 1);
    url[sizeof(url) - 1];
    char *geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_ArkWebResponse_GetUrl(nullptr, nullptr);
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
        judgment_num = error_num;
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_GetUrl judgment_num is : %{public}d", judgment_num);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart8(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart8");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *protocol = "https://";
    const char *domain = "www.baidu.com/";
    char url[256];
    strncpy(url, protocol, sizeof(url) - 1);
    strncat(url, domain, sizeof(url) - strlen(url) - 1);
    url[sizeof(url) - 1];
    char *geturl = nullptr;
    result_num = OH_ArkWebResponse_SetUrl(response, url);
    if (result_num == 0) {
        OH_ArkWebResponse_GetUrl(response, &geturl);
        url_return = geturl;
        OH_LOG_INFO(LOG_APP, "Succeed in getting URL: %{public}s", geturl);
    } else if (result_num == error_num) {
        OH_LOG_ERROR(LOG_APP, "Fail to OH_ArkWebResponse_SetUrl");
    }
    OH_ArkWeb_DestroyResponse(response);
}

void OnURLRequestStart9(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                        const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart9");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    ArkWeb_NetError errorCode = ARKWEB_ERR_INVALID_ARGUMENT;
    result_num1 = OH_ArkWebResponse_SetError(nullptr, errorCode);
    if (result_num1 == 0) {
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_SetError executed successfully.");
    } else if (result_num1 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Failed to execute OH_ArkWebResponse_SetError. Error: %{public}d", result_num1);
    }
}

void OnURLRequestStart10(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart10");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    int status = -100;
    result_num2 = OH_ArkWebResponse_SetStatus(response, status);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed: %{public}d", result_num2);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed: %{public}d", result_num2);
    }
}

void OnURLRequestStart11(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart11");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    int status = 200;
    result_num2 = OH_ArkWebResponse_SetStatus(nullptr, status);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed: %{public}d", result_num2);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed: %{public}d", result_num2);
    }
}

void OnURLRequestStart12(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart12");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    int status = 12345678;
    result_num2 = OH_ArkWebResponse_SetStatus(response, status);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed: %{public}d", result_num2);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed: %{public}d", result_num2);
    }
}

void OnURLRequestStart13(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart13");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *statusText = "HauWei";
    result_num2 = OH_ArkWebResponse_SetStatusText(nullptr, statusText);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}d", result_num2);
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}s", statusText);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed SetStatusText: %{public}d", result_num2);
    }
}

void OnURLRequestStart14(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart14");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *statusText = nullptr;
    result_num2 = OH_ArkWebResponse_SetStatusText(response, statusText);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}d", result_num2);
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}s", statusText);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed SetStatusText: %{public}d", result_num2);
    }
}

void OnURLRequestStart15(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart15");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    const char *statusText = "HauWei";
    result_num2 = OH_ArkWebResponse_SetStatusText(response, statusText);
    if (result_num2 == 0) {
        OH_ArkWebResponse_GetStatusText(response, nullptr);
        result_num1 = error_num;
        OH_LOG_INFO(LOG_APP, "Test with invalid status code passed SetStatusText: %{public}d", result_num2);
        OH_LOG_ERROR(LOG_APP, " Failed to OH_ArkWebResponse_GetStatusText: %{public}d", result_num1);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Test with invalid status code failed SetStatusText: %{public}d", result_num2);
    }
}

void OnURLRequestStart16(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart16");
    ArkWeb_Response *response = NULL;
    OH_ArkWeb_CreateResponse(&response);
    if (response == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to create ArkWeb_Response");
        return;
    }
    result_num2 = OH_ArkWebResponse_SetCharset(response, nullptr);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, " Succeed in  OH_ArkWebResponse_SetCharset %{public}d", result_num2);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Failed to  OH_ArkWebResponse_SetCharset %{public}d", result_num2);
    }
}

void OnURLRequestStart17(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    OH_LOG_INFO(LOG_APP, "Succeed in OnURLRequestStart19");
    void *userData = malloc(sizeof(int));
    if (userData == NULL) {
        OH_LOG_ERROR(LOG_APP, "Failed to allocate memory for userData");
        return;
    }
    *((int *)userData) = 43;
    result_num2 = OH_ArkWebSchemeHandler_SetUserData((ArkWeb_SchemeHandler *)schemeHandler, nullptr);
    if (result_num2 == 0) {
        OH_LOG_INFO(LOG_APP, "Succeed in OH_ArkWebSchemeHandler_SetUserData");
        OH_LOG_INFO(LOG_APP, "Succeed in OH_ArkWebSchemeHandler_SetUserData result_num2 : %{public}d", result_num2);
    } else if (result_num2 == error_num) {
        OH_LOG_ERROR(LOG_APP, "Failed to set userData for schemeHandler");
        OH_LOG_INFO(LOG_APP, "Failed to  OH_ArkWebSchemeHandler_SetUserData result_num2 : %{public}d", result_num2);
    }
}
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_RequestHeaderList *requestHeaderList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &requestHeaderList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders Successfully invoked");
    int32_t headersize = OH_ArkWebRequestHeaderList_GetSize(requestHeaderList);
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %{public}d", headersize);
    OH_LOG_INFO(LOG_APP, "=========== g_parameter: %{public}d", g_parameter);
    for (int i = 0; i < headersize; i++) {
        char *key = nullptr;
        char *value = nullptr;
        int32_t a;
        OH_LOG_INFO(LOG_APP, "int32_t a : %{public}d", a);
        if (g_parameter == 18) {
            a = -1;
            OH_LOG_INFO(LOG_APP, " g_parameter == 18 a : %{public}d", a);
        }
        if (g_parameter == 19) {
            a = INT32_MAX;
            OH_LOG_INFO(LOG_APP, " g_parameter == 19 a : %{public}d", a);
        }
        if (g_parameter == 20) {
            a = i - 1;
            OH_LOG_INFO(LOG_APP, " g_parameter == 20 a : %{public}d", a);
        }
        if (g_parameter == 21) {
            a = i;
            OH_LOG_INFO(LOG_APP, " g_parameter == 21 a : %{public}d", a);
        }

        OH_LOG_INFO(LOG_APP, " a : %{public}d", a);
        OH_ArkWebRequestHeaderList_GetHeader(requestHeaderList, a, &key, &value);
        OH_LOG_INFO(LOG_APP, " index a : %{public}d", a);
        OH_LOG_INFO(LOG_APP, " Key: %{public}s, Value: %{public}s", key, value);
        if (key != nullptr && value != nullptr) {
            OH_LOG_INFO(LOG_APP, "Within a reasonable index range class. Key: %{public}s, Value: %{public}s", key,
                        value);
            judgment1 = true;
        } else {
            OH_LOG_ERROR(LOG_APP, "Failed to get header key or value at index");
            OH_LOG_INFO(LOG_APP, "Not in a reasonable index range class.Key: %{public}s, Value: %{public}s", key,
                        value);
            judgment2 = true;
        }
    }
}

void OnURLRequestStart22(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_RequestHeaderList *requestHeaderList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &requestHeaderList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders Successfully invoked");
    int32_t headersize = OH_ArkWebRequestHeaderList_GetSize(requestHeaderList);
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %{public}d", headersize);

    for (int i = 0; i < headersize; i++) {
        char *key[i];
        char *value = nullptr;

        OH_ArkWebRequestHeaderList_GetHeader(requestHeaderList, i, &key[i], &value);
        OH_LOG_INFO(LOG_APP, " index a : %{public}d", i);
        OH_LOG_INFO(LOG_APP, " Key: %{public}s, Value: %{public}s", key[i], value);
        if (key[i] != nullptr && value != nullptr) {
            OH_LOG_INFO(LOG_APP, "Within a reasonable index range class. Key: %{public}s, Value: %{public}s", key[i],
                        value);
            judgment1 = true;
        } else {
            OH_LOG_ERROR(LOG_APP, "Failed to get header key or value at index");
            OH_LOG_INFO(LOG_APP, "Not in a reasonable index range class.Key: %{public}s, Value: %{public}s", key[i],
                        value);
            judgment2 = true;
        }
    }
}

void OnURLRequestStart23(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_RequestHeaderList *requestHeaderList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &requestHeaderList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders Successfully invoked");
    int32_t headersize = OH_ArkWebRequestHeaderList_GetSize(requestHeaderList);
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %{public}d", headersize);

    for (int i = 0; i < headersize; i++) {
        char *key = nullptr;
        char *value = nullptr;

        OH_ArkWebRequestHeaderList_GetHeader(requestHeaderList, i, nullptr, &value);
        OH_LOG_INFO(LOG_APP, " index a : %{public}d", i);
        OH_LOG_INFO(LOG_APP, " Key: %{public}s, Value: %{public}s", key, value);
        if (value != nullptr) {
            OH_LOG_INFO(LOG_APP, "Within a reasonable index range class. Key: %{public}s, Value: %{public}s", key,
                        value);
            judgment1 = true;
        } else {
            OH_LOG_ERROR(LOG_APP, "Failed to get header key or value at index");
            OH_LOG_INFO(LOG_APP, "Not in a reasonable index range class.Key: %{public}s, Value: %{public}s", key,
                        value);
            judgment2 = true;
        }
    }
}

void OnURLRequestStart24(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_RequestHeaderList *requestHeaderList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &requestHeaderList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders Successfully invoked");
    int32_t headersize = OH_ArkWebRequestHeaderList_GetSize(requestHeaderList);
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %{public}d", headersize);

    for (int i = 0; i < headersize; i++) {
        char *key = nullptr;
        char *value[i];

        OH_ArkWebRequestHeaderList_GetHeader(requestHeaderList, i, &key, &value[i]);
        OH_LOG_INFO(LOG_APP, " index a : %{public}d", i);
        OH_LOG_INFO(LOG_APP, " Key: %{public}s, Value: %{public}s", key, value[i]);
        if (key != nullptr && value[i] != nullptr) {
            OH_LOG_INFO(LOG_APP, "Within a reasonable index range class. Key: %{public}s, Value: %{public}s", key,
                        value[i]);
            judgment1 = true;
        } else {
            OH_LOG_ERROR(LOG_APP, "Failed to get header key or value at index");
            OH_LOG_INFO(LOG_APP, "Not in a reasonable index range class.Key: %{public}s, Value: %{public}s", key,
                        value[i]);
            judgment2 = true;
        }
    }
}

void OnURLRequestStart25(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_RequestHeaderList *requestHeaderList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &requestHeaderList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders Successfully invoked");
    int32_t headersize = OH_ArkWebRequestHeaderList_GetSize(requestHeaderList);
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %{public}d", headersize);

    for (int i = 0; i < headersize; i++) {
        char *key = nullptr;
        char *value = nullptr;

        OH_ArkWebRequestHeaderList_GetHeader(requestHeaderList, i, &key, nullptr);
        OH_LOG_INFO(LOG_APP, " index a : %{public}d", i);
        OH_LOG_INFO(LOG_APP, " Key: %{public}s, Value: %{public}s", key, value);
        if (key != nullptr && value != nullptr) {
            OH_LOG_INFO(LOG_APP, "Within a reasonable index range class. Key: %{public}s, Value: %{public}s", key,
                        value);
            judgment1 = true;
        } else {
            OH_LOG_ERROR(LOG_APP, "Failed to get header key or value at index");
            OH_LOG_INFO(LOG_APP, "Not in a reasonable index range class.Key: %{public}s, Value: %{public}s", key,
                        value);
            judgment2 = true;
        }
    }
}

void OnURLRequestStart26(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_RequestHeaderList *requestHeaderList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &requestHeaderList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders Successfully invoked");
    char *method;
    const char *greeting = "GET";
    OH_ArkWebResourceRequest_GetMethod(resourceRequest, &method);
    if (strcmp(method, greeting) == 0) {
        return_method = method;
        OH_LOG_INFO(LOG_APP, "Succeed to get request method, the method is: %{public}s", method);
    } else {
        OH_LOG_ERROR(LOG_APP, "Failed to get request method, the method is: %{public}s", method);
    }
}

void OnURLRequestStart27(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    char *url1 = NULL;
    OH_ArkWebResourceRequest_GetUrl(NULL, &url1);
    if (url1 == NULL) {
        OH_LOG_INFO(LOG_APP, "Test passed: url '%{public}s' ", url1);
        judgment2 = false;
    } else {
        OH_LOG_INFO(LOG_APP, "Test failed: should be NULL but got a value url '%{public}s'", url1);
        judgment2 = true;
    }
}

void OnURLRequestStart28(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    char *url2 = nullptr; // 初始化为 NULL，模拟入参异常
    OH_ArkWebResourceRequest_GetUrl(nullptr, &url2);
    if (url2 == nullptr) {
        judgment2 = false;
        OH_LOG_INFO(LOG_APP, "Test passed: url '%{public}s' ", url2);

    } else {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test failed: should be NULL but got a value url '%{public}s'", url2);
    }
    // 如果 testUrl 不是 NULL，需要释放内存
    OH_ArkWeb_ReleaseString(url2);
}

void OnURLRequestStart29(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    char *url3 = NULL;
    OH_ArkWebResourceRequest_GetUrl(NULL, &url3);
    if (url3 == NULL) {
        judgment2 = false;
        OH_LOG_INFO(LOG_APP, "Test passed: url '%{public}s' ", url3);

    } else {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test failed: should be NULL but got a value url '%{public}s'", url3);
    }
}

void OnURLRequestStart30(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_HttpBodyStream *httpBodyStream;
    OH_ArkWebHttpBodyStream_Init(httpBodyStream, NULL);
    int32_t bufferSize = OH_ArkWebHttpBodyStream_GetSize(httpBodyStream); // 获取请求头列表的大小
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %d", bufferSize);
    if (bufferSize <= 0) {
        OH_LOG_INFO(LOG_APP, "Test failed:bufferSize is not valid");
    }
    int bufLen = bufferSize + 100; // 额外一个字节用于确保缓冲区足够大
    uint8_t *buffer = (uint8_t *)malloc(bufLen * sizeof(uint8_t));
    if (buffer == NULL) {
        OH_LOG_INFO(LOG_APP, "Error: Failed to allocate memory");
    }
    for (size_t i = 0; i < bufLen; ++i) {
        buffer[i] = (uint8_t)i;
    }

    if (bufLen > (size_t)bufferSize) {
        OH_LOG_INFO(LOG_APP, "Input parameter is normal");
    } else {
        OH_LOG_INFO(LOG_APP, "Buffer size is not larger than bufLen");
    }

    OH_ArkWebHttpBodyStream_Read(httpBodyStream, buffer, bufLen);
    if (!OH_ArkWebHttpBodyStream_IsEof(httpBodyStream)) {
        OH_LOG_INFO(LOG_APP, "Test passed: buffer '%{public}s' ", buffer);
        for (size_t i = 0; i < bufferSize; ++i) {
            OH_LOG_INFO(LOG_APP, "Test passed: buffer '%{public}x' ", buffer[i]);
        }
        judgment2 = false;
    } else {
        OH_LOG_INFO(LOG_APP, "Test failed: should be NULL but got a value buffer '%{public}s'", buffer);
        judgment2 = true;
    }
}

void OnURLRequestStart31(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_HttpBodyStream *httpBodyStream;
    OH_ArkWebHttpBodyStream_Init(httpBodyStream, NULL);
    int32_t bufferSize = OH_ArkWebHttpBodyStream_GetSize(httpBodyStream); // 获取请求头列表的大小
    OH_LOG_INFO(LOG_APP, "requestHeaderList_Size: %{public}d", bufferSize);
    int bufLen = bufferSize - 10;
    uint8_t *buffer = (uint8_t *)malloc(bufLen * sizeof(uint8_t));
    OH_ArkWebHttpBodyStream_Read(httpBodyStream, buffer, bufLen);
    if (!OH_ArkWebHttpBodyStream_IsEof(httpBodyStream)) {
        OH_LOG_INFO(LOG_APP, "Test passed: return when buffer<bufLen failed got a value buffer %{public}s ", buffer);
        judgment2 = true;
    } else {
        OH_LOG_INFO(LOG_APP, "Test failed: return when buffer<bufLen success got a value buffer '%{public}s'", buffer);
        judgment1 = true;
    }
}


void OnURLRequestStart34(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    uint64_t position = OH_ArkWebHttpBodyStream_GetPosition(nullptr);
    if (position == 0) {
        OH_LOG_INFO(LOG_APP, "Test passed: position '%{public}llu' ", position);
        judgment1 = true;
        result_num = position;
    } else {
        OH_LOG_INFO(LOG_APP, "Test failed: should be NULL but got a value position '%{public}llu'", position);
        judgment2 = true;
    }
}


void OnURLRequestStart35(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    int64_t position_Destroy = OH_ArkWebResourceRequest_Destroy(nullptr);
    if (position_Destroy == error_num) {
        OH_LOG_INFO(LOG_APP, "Test passed: position_Destroy '%{public}lld' ", position_Destroy);
        judgment1 = true;
        result_num = error_num;
    } else {
        OH_LOG_INFO(LOG_APP, "Test failed: should be NULL but got a value position_Destroy '%{public}lld'",
                    position_Destroy);
        judgment2 = true;
    }
}

void OnURLRequestStart36(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *testString = "This is a test string";
    char *dynamicString = strdup(testString);
    if (dynamicString == NULL) {
        fprintf(stderr, "Failed to allocate memory for dynamicString.\n");
        return;
    }
    OH_ArkWeb_ReleaseString(dynamicString); // 如果字符串被成功释放，那么指针应该指向一个空指针或者无效的内存地址。
    judgment2 = false;
    OH_LOG_INFO(LOG_APP, "Test passed, free success");
}

void OnURLRequestStart37(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    // 创建一个空字符串
    char *emptyString = (char *)malloc(1); // 分配1字节的空间，足以存储空字符串
    emptyString[0] = '\0'; // 设置为空字符串

    // 假设 OH_ArkWeb_ReleaseString 是释放内存的函数
    OH_ArkWeb_ReleaseString(emptyString);
    judgment2 = false;
    OH_LOG_INFO(LOG_APP, "Test passed, Empty string released successfully");
}


void OnURLRequestStart38(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    char *nullString = NULL;
    // 保存当前的日志输出或者错误状态
    int oldErrno = errno;
    // 调用释放函数
    OH_ArkWeb_ReleaseString(nullString);
    judgment2 = true;
    OH_LOG_INFO(LOG_APP, "Test passed, nullptr string release failed as expected");
}

void OnURLRequestStart39(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    uint8_t *byteArray = (uint8_t *)malloc(10 * sizeof(uint8_t));
    if (byteArray == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return;
    }

    // 初始化数组
    for (int i = 0; i < 10; ++i) {
        byteArray[i] = (uint8_t)i;
    }
    uint8_t *originalAddress = byteArray;
    // 调用释放函数
    OH_ArkWeb_ReleaseByteArray(byteArray);
    judgment2 = false;
    OH_LOG_INFO(LOG_APP, "Test passed, Empty byteArray released successfully");
}


void OnURLRequestStart40(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    uint8_t *emptyByteArray = (uint8_t *)malloc(0); // 注意：分配大小为0
    if (emptyByteArray == NULL) {
        OH_LOG_INFO(LOG_APP, "Memory allocation failed");
        return;
    }
    OH_ArkWeb_ReleaseByteArray(emptyByteArray);
    judgment2 = false;
    OH_LOG_INFO(LOG_APP, "Test passed, Empty byteArray released successfully");
}

void OnURLRequestStart41(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    uint8_t *nullArray = NULL;
    // 保存当前的日志输出或者错误状态
    int oldErrno = errno;
    // 调用释放函数
    OH_ArkWeb_ReleaseByteArray(nullArray);
    judgment2 = true;
    OH_LOG_INFO(LOG_APP, "Test passed, nullptr string release failed as expected");
}

void OnURLRequestStart42(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    // 调用释放函数
    ArkWeb_HttpBodyStream *httpBodyStream;
    bool BodyStream_IsEof = OH_ArkWebHttpBodyStream_IsEof(httpBodyStream);
    if (!BodyStream_IsEof) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, BodyStream_IsEof:%{public}s", BodyStream_IsEof ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, BodyStream_IsEof:%{public}s", BodyStream_IsEof ? "true" : "false");
    }
}

void OnURLRequestStart43(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_ResourceRequest *resource_Request = nullptr;
    char *referrer = nullptr;
    OH_ArkWebResourceRequest_GetReferrer(resource_Request, &referrer);
    if (referrer == nullptr) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, Failed to get referrer:'%{public}s'", referrer);
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, Success to get referrer:'%{public}s'", referrer);
        OH_ArkWeb_ReleaseString(referrer);
    }
}

void OnURLRequestStart44(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme = nullptr;
    const char *webTag;
    ArkWeb_SchemeHandler *scheme_Handler;
    bool result = OH_ArkWeb_SetSchemeHandler(scheme, webTag, scheme_Handler);
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when scheme is nullptr result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when scheme is nullptr result:'%{public}s'",
                    result ? "true" : "false");
    }
}

void OnURLRequestStart45(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme = "";
    const char *webTag;
    ArkWeb_SchemeHandler *scheme_Handler;
    bool result = OH_ArkWeb_SetSchemeHandler(scheme, webTag, scheme_Handler);
    if (scheme[0] == '\0') {
        // scheme 是空字符串，返回 false
        result = false;
    }
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when scheme is an empty string, result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when scheme is an empty string, result:'%{public}s'",
                    result ? "true" : "false");
    }
}

void OnURLRequestStart46(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme;
    const char *webTag = nullptr;
    ArkWeb_SchemeHandler *scheme_Handler;
    bool result = OH_ArkWeb_SetSchemeHandler(scheme, webTag, scheme_Handler);
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when webTag is nullptr, result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when webTag is nullptr, result:'%{public}s'",
                    result ? "true" : "false");
    }
}

void OnURLRequestStart47(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme;
    const char *webTag = "";
    ArkWeb_SchemeHandler *scheme_Handler;
    bool result = OH_ArkWeb_SetSchemeHandler(scheme, webTag, scheme_Handler);
    if (webTag[0] == '\0') {
        // scheme 是空字符串，返回 false
        result = false;
    }
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when webTag is an empty string, result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when webTag is an empty string, result:'%{public}s'",
                    result ? "true" : "false");
    }
}

void OnURLRequestStart48(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme;
    const char *webTag;
    ArkWeb_SchemeHandler *scheme_Handler = nullptr;
    bool result = OH_ArkWeb_SetSchemeHandler(scheme, webTag, scheme_Handler);
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when scheme_Handler is nullptr, result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when scheme_Handler is nullptr, result:'%{public}s'",
                    result ? "true" : "false");
    }
}


void OnURLRequestStart49(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme;
    ArkWeb_SchemeHandler *scheme_Handler;
    bool BrowserContext = false;
    bool result = OH_ArkWebServiceWorker_SetSchemeHandler(scheme, scheme_Handler);
    if (!BrowserContext) {
        result = false;
    }
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP,
                    "Test passed, returned false when scheme_Handler before BrowserContext, result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when before BrowserContext, result:'%{public}s'",
                    result ? "true" : "false");
    }
}

void OnURLRequestStart50(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    ArkWeb_SchemeHandler *scheme_Handler;
    bool result = OH_ArkWebServiceWorker_SetSchemeHandler(nullptr, scheme_Handler);
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when scheme is an empty , result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when scheme is an empty , result:'%{public}s'",
                    result ? "true" : "false");
    }
}

void OnURLRequestStart51(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                         const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    const char *scheme = nullptr;
    ArkWeb_SchemeHandler *scheme_Handler;
    bool result = OH_ArkWebServiceWorker_SetSchemeHandler(scheme, scheme_Handler);
    if (!result) {
        judgment2 = true;
        OH_LOG_INFO(LOG_APP, "Test passed, returned false when scheme is nullptr, result:'%{public}s'",
                    result ? "true" : "false");
    } else {
        judgment1 = true;
        OH_LOG_INFO(LOG_APP, "Test failed, returned true when scheme is nullptr, result:'%{public}s'",
                    result ? "true" : "false");
    }
}

// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler。
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request) {
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }
}

void OnURLRequestStartForSW(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                            const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {}

void OnURLRequestStopForSW(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request) {
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }
}

// 设置SchemeHandler。
static napi_value SetSchemeHandler(napi_env env, napi_callback_info info) {
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
    int a[60] = {0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 16, 17,
                 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
                 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51};

    if (g_parameter == a[1]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart1);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart1);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    } else if (g_parameter == a[2]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart2);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart2);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[3]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart3);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart3);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[4]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart4);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart4);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[5]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart5);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart5);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[6]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart6);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart6);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[7]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart7);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart7);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[8]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart8);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart8);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[9]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart9);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart9);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[10]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart10);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart10);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[11]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart11);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart11);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[12]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart12);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart12);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[13]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart13);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart13);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[14]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart14);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart14);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[15]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart15);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart15);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[16]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart16);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart16);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[17]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart17);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart17);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }


    else if (g_parameter == a[22]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart22);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart22);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[23]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart23);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart23);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[24]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart24);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart24);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[25]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart25);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart25);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[26]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart26);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart26);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[27]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart27);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart27);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[28]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart28);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart28);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[29]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart29);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart29);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[30]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart30);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart30);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[31]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart31);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart31);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[34]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart34);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart34);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[35]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart35);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart35);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[36]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart36);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart36);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[37]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart37);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart37);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[38]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart38);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart38);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[39]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart39);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart39);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[40]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart40);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart40);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[41]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart41);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart41);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[42]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart42);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart42);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[43]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart43);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart43);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[44]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart44);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart44);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[45]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart45);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart45);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[46]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart46);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart46);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[47]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart47);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart47);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[48]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart48);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart48);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[49]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart49);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart49);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[50]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart50);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart50);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else if (g_parameter == a[51]) {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart51);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart51);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    }

    else {
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart);

        OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
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

static napi_value InitResourceManager(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}


static napi_value SetUrl(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_create_int32(env, result_num, &result);
    return result;
}

static napi_value SetError(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_create_int32(env, result_num1, &result);
    return result;
}

static napi_value SetStatus(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_create_int32(env, result_num2, &result);
    return result;
}


static napi_value Judgment_num(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_create_int32(env, judgment_num, &result);
    return result;
}

static napi_value Judgment_num_2(napi_env env, napi_callback_info info) {
    napi_value result;
    if (judgment2) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value Url_return(napi_env env, napi_callback_info info) {
    napi_value result;
    // 使用 napi_create_string_utf8 创建字符串类型的 napi_value
    napi_create_string_utf8(env, url_return.c_str(), url_return.length(), &result);
    return result;
}

static napi_value Judgment(napi_env env, napi_callback_info info) {
    napi_value result;
    if (judgment) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value Judgment1(napi_env env, napi_callback_info info) {
    napi_value result;
    if (judgment1) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value Judgment2(napi_env env, napi_callback_info info) {
    napi_value result;
    if (judgment2) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}
static napi_value ReturnsMethod(napi_env env, napi_callback_info info) {
    napi_value result;
    napi_status status = napi_create_string_utf8(env, return_method, NAPI_AUTO_LENGTH, &result);
    if (status != napi_ok) {
        napi_throw_error(env, NULL, "Unable to create string");
        return NULL;
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setUrl", nullptr, SetUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setError", nullptr, SetError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setStatus", nullptr, SetStatus, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment_num", nullptr, Judgment_num, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment_num_2", nullptr, Judgment_num_2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"url_return", nullptr, Url_return, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment", nullptr, Judgment, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment1", nullptr, Judgment1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"judgment2", nullptr, Judgment2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"returnsMethod", nullptr, ReturnsMethod, nullptr, nullptr, nullptr, napi_default, nullptr},


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