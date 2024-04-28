/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <fcntl.h>
#include <hilog/log.h>
#include <network/netstack/net_websocket.h>
#include <network/netstack/net_ssl/net_ssl_c.h>
#include <cstring>
#include <thread>
#include <iostream>
#include <fstream>

#define WEBSOCKET_ADDRESS "wss://echo.websocket.org"
#define WEBSOCKET_LOG_TAG "NETWORK NDK"
#define WEBSOCKET_LOG_DOMAIN 0x0000
#define MAX_DATA_LENGTH 4 * 1024 * 1024
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
#define SLEEP_TIME_3 3

static const int CLOSE_RESULT_FROM_CLIENT_CODE = 1000;

static void OnOpen(struct WebSocket *client, WebSocket_OpenResult openResult) 
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnOpen --- %{public}s", openResult.reason);
}

static void OnMessage(struct WebSocket *client, char *data, uint32_t length) 
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnMessage --- %{public}s", data);
}

static void OnError(struct WebSocket *client, WebSocket_ErrorResult error) 
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnError --- %{public}s", error.errorMessage);
}

static void OnClose(struct WebSocket *client, WebSocket_CloseResult closeResult) 
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnClose --- %{public}s", closeResult.reason);
}

// 根据路径和类型获取证书
void GetCertData(NetStack_CertBlob &cert, char *cert_path, NetStack_CertType cert_type) 
{
    cert.type = cert_type;
    std::ifstream file(cert_path);
    if (!file.is_open()) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "GetCertData file is open fail");
        return;
    } else {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "GetCertData file is open success");
    }
    file.seekg(0, std::ios::end);
    int length = file.tellg();
    file.seekg(0, std::ios::beg);
    if (length <= 0) {
        OH_LOG_ERROR(LOG_APP, "GetCertData get length fail at line：%{public}d", __LINE__);
    }
    cert.size = length;
    char *buffer = new char[length];
    file.read(buffer, length);
    cert.data = new uint8_t[length];
    file.close();
    for (int i = 0; i < length; i++) {
        cert.data[i] = static_cast<uint8_t>(buffer[i]);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "cert size is： %{public}d", cert.size);
    delete[] buffer;
    buffer = nullptr;
}

// 校验证书
static napi_value OHNetStackCertVerification(napi_env env, napi_callback_info info) 
{
    size_t argc = 3;
    napi_value args[3] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    char *pem_cert_path = nullptr;
    size_t pem_bufsize = 0;
    napi_get_value_string_utf8(env, args[1], pem_cert_path, 0, &pem_bufsize);
    if (pem_bufsize > 0) {
        pem_cert_path = new char[pem_bufsize + 1]; // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[1], pem_cert_path, pem_bufsize + 1, nullptr);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OH_NetStack_CertVerification: %{public}s", pem_cert_path);
    }
    char *der_cert_path = nullptr;
    size_t dem_bufsize = 0;
    napi_get_value_string_utf8(env, args[2], der_cert_path, 0, &dem_bufsize);
    if (dem_bufsize > 0) {
        der_cert_path = new char[dem_bufsize + 1]; // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[2], der_cert_path, dem_bufsize + 1, nullptr);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OH_NetStack_CertVerification: %{public}s", der_cert_path);
    }
    NetStack_CertBlob cert;
    NetStack_CertBlob caCert;
    uint32_t ret = -1;
    if (index == CASE_INDEX_1) {
        GetCertData(cert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        GetCertData(caCert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_2) {
        GetCertData(cert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    } else if (index == CASE_INDEX_3) {
        GetCertData(caCert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(nullptr, &caCert);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetStack_CertVerification(nullptr, nullptr);
    } else if (index == CASE_INDEX_5) {
        GetCertData(cert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_INVALID);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    } else if (index == CASE_INDEX_6) {
        GetCertData(cert, der_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        GetCertData(caCert, der_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_7) {
        GetCertData(cert, der_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    } else if (index == CASE_INDEX_8) {
        GetCertData(caCert, der_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(nullptr, &caCert);
    } else if (index == CASE_INDEX_9) {
        GetCertData(cert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        GetCertData(caCert, der_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_10) {
        GetCertData(cert, der_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        GetCertData(caCert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_11) {
        GetCertData(cert, pem_cert_path, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_NetStack_CertVerification: %{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 构造
static napi_value OHWebSocketClientConstruct(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    WebSocket *client = nullptr;
    if (index == CASE_INDEX_1) {
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    } else if (index == CASE_INDEX_2) {
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, nullptr);
    } else if (index == CASE_INDEX_3) {
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, nullptr, nullptr);
    } else if (index == CASE_INDEX_4) {
        client = OH_WebSocketClient_Constructor(OnOpen, nullptr, nullptr, nullptr);
    } else if (index == CASE_INDEX_5) {
        client = OH_WebSocketClient_Constructor(nullptr, nullptr, nullptr, nullptr);
    }
    int ret = 0;
    if (client == nullptr) {
        ret = 1;
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Constructor: %{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 添加请求头
static napi_value OHWebSocketClientAddHeader(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = -1;
    if (index == CASE_INDEX_1) {
        WebSocket_Header header;
        header.fieldName = "Content-Type";
        header.fieldValue = "application/json";
        header.next = nullptr;
        ret = OH_WebSocketClient_AddHeader(client, header);
    } else if (index == CASE_INDEX_2) {
        WebSocket_Header header;
        ret = OH_WebSocketClient_AddHeader(client, header);
    } else if (index == CASE_INDEX_3) {
        WebSocket_Header header;
        ret = OH_WebSocketClient_AddHeader(nullptr, header);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_AddHeader: %{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 开始链接
static napi_value OHWebSocketClientConnect(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    WebSocket_Header header;
    header.fieldName = "Content-Type";
    header.fieldValue = "application/json";
    header.next = nullptr;
    int ret = OH_WebSocketClient_AddHeader(client, header);
    if (index == CASE_INDEX_1) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    } else if (index == CASE_INDEX_2) {
        const char *url = "192.168.123.255";
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    } else if (index == CASE_INDEX_3) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(nullptr, url, client->requestOptions);
    } else if (index == CASE_INDEX_4) {
        const char *url = "";
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Connect: %{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 发送消息
static napi_value OHWebSocketClientSend(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    napi_value result = nullptr;
    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    WebSocket_Header header;
    header.fieldName = "Content-Type";
    header.fieldValue = "application/json";
    header.next = nullptr;
    int ret = OH_WebSocketClient_AddHeader(client, header);
    const char *url = WEBSOCKET_ADDRESS;
    ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    const char *data = "hello world!";
    if (index == CASE_INDEX_1) {
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), std::strlen(data));
    } else if (index == CASE_INDEX_2) {
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), 0);
    } else if (index == CASE_INDEX_3) {
        ret = OH_WebSocketClient_Send(client, nullptr, 0);
    } else if (index == CASE_INDEX_4) {
        std::string data;
        data.resize(MAX_DATA_LENGTH + 1, 'a');
        int sendLength = data.size();
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data.c_str()), sendLength);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Send: %{public}d", ret);
    napi_create_int32(env, ret, &result);
    return result;
}

// 关闭链接
static napi_value OHWebSocketClientClose(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = -1;
    if (index == CASE_INDEX_1) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Connect is %{public}d", ret);
        std::this_thread::sleep_for(std::chrono::seconds(SLEEP_TIME_3));
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "test close";
        ret = OH_WebSocketClient_Close(client, closeOption);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Close is %{public}d", ret);
    } else if (index == CASE_INDEX_2) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        const char *data = "hello world!";
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), std::strlen(data));
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Send is %{public}d", ret);
        std::this_thread::sleep_for(std::chrono::seconds(SLEEP_TIME_3));
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "test close";
        ret = OH_WebSocketClient_Close(client, closeOption);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Close is %{public}d", ret);
    } else if (index == CASE_INDEX_3) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "close";
        ret = OH_WebSocketClient_Close(client, closeOption);
    } else if (index == CASE_INDEX_4) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = -1;
        closeOption.reason = "";
        ret = OH_WebSocketClient_Close(client, closeOption);
    } else if (index == CASE_INDEX_5) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "test close";
        ret = OH_WebSocketClient_Close(nullptr, closeOption);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Close: %{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 销毁client
static napi_value OHWebSocketClientDestroy(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = -1;
    if (index == CASE_INDEX_1) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        ret = OH_WebSocketClient_Destroy(client);
    } else if (index == CASE_INDEX_2) {
        ret = OH_WebSocketClient_Destroy(client);
    } else if (index == CASE_INDEX_3) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "close";
        ret = OH_WebSocketClient_Close(client, closeOption);
        ret = OH_WebSocketClient_Destroy(client);
    } else if (index == CASE_INDEX_4) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "close";
        ret = OH_WebSocketClient_Close(client, closeOption);
        ret = OH_WebSocketClient_Destroy(client);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OH_WebSocketClient_Destroy: %{public}d", ret);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) 
{
    napi_property_descriptor desc[] = {
        {"OHNetStackCertVerification", nullptr, OHNetStackCertVerification, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientConstruct", nullptr, OHWebSocketClientConstruct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientAddHeader", nullptr, OHWebSocketClientAddHeader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientConnect", nullptr, OHWebSocketClientConnect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientSend", nullptr, OHWebSocketClientSend, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientClose", nullptr, OHWebSocketClientClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientDestroy", nullptr, OHWebSocketClientDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "net_stack_ndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) 
{
    napi_module_register(&demoModule);
}
