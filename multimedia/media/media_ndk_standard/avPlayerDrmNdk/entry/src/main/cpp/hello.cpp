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
#include "napi/native_api.h"
#include "multimedia/drm_framework/native_mediakeysystem.h"
#include "multimedia/drm_framework/native_drm_common.h"
#include "multimedia/drm_framework/native_drm_err.h"
#include "multimedia/drm_framework/native_mediakeysession.h"
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/native_averrors.h"
#include "GLES3/gl32.h"
#include "EGL/egl.h"
#include <unistd.h>
#include <cerrno>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <sys/socket.h>
#include <sys/types.h>
#include <ctime>
#include <csignal>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define PATH "/data/storage/el2/base/files/ChinaDRMLab_Promo_210525-264-30-1080P-10000K.sm4c.ts"
#define BLUE_AREA "com.clearplay.drm"
#define YELLOW_AREA "com.wiseplay.drm"

#define DATA_UUID_LEN 16
#define DATA_BUFF_LEN 12288
#define PROVISION_SERVICE_IP "192.168.50.59"
#define PROVISION_SERVICE_PORT 9528 
#define LICENSE_SERVICE_IP "192.168.50.59"
#define LICENSE_SERVICE_PORT 9528 
#define LICENSE_ONLINE 1
#define LICENSE_OFFLINE 0
#define REQUESTINFODATA                                                                                        \
    {                                                                                                          \
        0x00, 0x00, 0x00, 0x8B, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x5E, 0x6D, 0x35,        \
        0x9B, 0x9A, 0x41, 0xE8, 0xB8, 0x43, 0xDD, 0x3C, 0x6E, 0x72, 0xC4, 0x2C, 0x00, 0x00, 0x00, 0x6B,        \
        0x7B, 0x22, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x22, 0x3A, 0x22, 0x56, 0x31, 0x2E, 0x30,        \
        0x22, 0x2C, 0x22, 0x63, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x49, 0x44, 0x22, 0x3A, 0x22, 0x64,        \
        0x48, 0x4D, 0x74, 0x4D, 0x6A, 0x59, 0x30, 0x4C, 0x54, 0x45, 0x77, 0x4F, 0x44, 0x41, 0x74, 0x59,        \
        0x57, 0x56, 0x7A, 0x22, 0x2C, 0x22, 0x6B, 0x69, 0x64, 0x73, 0x22, 0x3A, 0x5B, 0x22, 0x47, 0x2B,        \
        0x45, 0x6B, 0x2F, 0x2B, 0x58, 0x6D, 0x55, 0x6B, 0x70, 0x42, 0x48, 0x51, 0x67, 0x58, 0x59, 0x57,        \
        0x51, 0x51, 0x49, 0x67, 0x3D, 0x3D, 0x22, 0x5D, 0x2C, 0x22, 0x65, 0x6E, 0x73, 0x63, 0x68, 0x65,        \
        0x6D, 0x61, 0x22, 0x3A, 0x22, 0x63, 0x62, 0x63, 0x31, 0x22, 0x7D                                       \
    }
#define OFFLINERESPONSE                                                                                        \
    {                                                                                                          \
        0x31, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42,        \
        0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,        \
        0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67,        \
        0x3D, 0x3D                                                                                             \
    }
#define ONLINERESPONSE                                                                                         \
    {                                                                                                          \
        0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42,        \
        0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,        \
        0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67,        \
        0x3D, 0x3D                                                                                             \
    }

#define CHECK_RETURN(cond, ret) \
    do {                                                         \
        if ((cond)) {                                            \
            return ret;                                          \
        }                                                        \
    } while (0)
#define UNUSED_PARAMETER(P) (P)	
static const char* judge_uuid() {
    bool isSupport = OH_MediaKeySystem_IsSupported(BLUE_AREA); 
    if(isSupport == 1) {
            return BLUE_AREA;
    } else {
            return YELLOW_AREA;
    }
}
static int getHttp(const char *IPAddr, int port, const char *link, const char *inbuf, unsigned int inbufLen,
                   uint8_t *outbuf, unsigned int *outbufLen) {
    int sockfd, ret, i, h;
    struct sockaddr_in servaddr;
    char str1[DATA_BUFF_LEN], str[8];
    fd_set t_set1;
    struct timeval tv;
    // 创建套接字
    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        return -1;
    }
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(port);
    if (inet_pton(AF_INET, IPAddr, &servaddr.sin_addr) <= 0) {
        return -1;
    };
    if (connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
        return -1;
    }

    memset(str1, 0, sizeof(str1));
    strcat(str1, "POST ");
    strcat(str1, link);
    strcat(str1, " HTTP/1.1\n");
    strcat(str1, "Host: ");
    strcat(str1, IPAddr);
    strcat(str1, "\n");
    strcat(str1, "Content-Type: application/json;charset=UTF-8\n");
    strcat(str1, "Content-Length: ");
    strcat(str1, str);
    strcat(str1, "\n\n");
    strcat(str1, inbuf);
    strcat(str1, "\r\n\r\n");
    ret = write(sockfd, str1, strlen(str1));
    if (ret < 0) {
        return -1;
    } else {
    }
    FD_ZERO(&t_set1);
    FD_SET(sockfd, &t_set1);

    while (1) {
        sleep(2);
        tv.tv_sec = 0;
        tv.tv_usec = 0;
        h = 0;
        h = select(sockfd + 1, &t_set1, nullptr, nullptr, &tv);
        if (h == 0) {
            continue;
        }
        if (h < 0) {
            close(sockfd);
            return -1;
        }
        if (h > 0) {
            memset(outbuf, 0, *outbufLen);
            i = read(sockfd, outbuf, *outbufLen);
            if (i == 0) {
                close(sockfd);
                return -1;
            } else {
                const char *contentLenStr = strstr(reinterpret_cast<const char *>(outbuf), "Content-Length: ");
                *outbufLen = atoi(contentLenStr + strlen("Content-Length: "));
                const char *headEndStr = strstr(contentLenStr, "\r\n\r\n");
                memcpy(outbuf, headEndStr + strlen("\r\n\r\n"), *outbufLen);
                goto _EXIT;
            }
        }
    }
_EXIT:
    close(sockfd);
    return 0;
}
static int GenDeviceCertificate(MediaKeySystem *drmKeySystem){
    unsigned char request[DATA_BUFF_LEN] = {0};
    int32_t requestLen = DATA_BUFF_LEN;
    char defaultUrl[DATA_BUFF_LEN] = {0};
    int32_t defaultUrlLen = DATA_BUFF_LEN;
    Drm_ErrCode ret1 = OH_MediaKeySystem_GenerateKeySystemRequest(drmKeySystem, request,&requestLen, defaultUrl, defaultUrlLen);
    unsigned char response[DATA_BUFF_LEN]=     {                                                                                                          
                                           0x31, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42,        
                                           0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,        
                                           0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67,       
                                           0x3D, 0x3D                                                                                             
                                       };
    int32_t responseLen = DATA_BUFF_LEN;
    if(strcmp(judge_uuid(), YELLOW_AREA)){
        int ret = getHttp(PROVISION_SERVICE_IP, PROVISION_SERVICE_PORT, "/getProvision", reinterpret_cast<const char *>(request), requestLen,
                                    response, (unsigned int *)&responseLen); 
        if(ret != 0){
            return -1; 
        }
    }else{
        responseLen = 50;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_ProcessKeySystemResponse(drmKeySystem, response, responseLen);
    if((ret1 | ret2)!= DRM_ERR_OK){
        return -1;
    }
    return 0;
}
static int getLicense(MediaKeySession *mediaKeySession, char isOnline, uint8_t *keydata , int32_t *keylen){
    memset(keydata, 0, *keylen);
    DRM_MediaKeyRequestInfo requestInfo;
    memset(&requestInfo, 0, sizeof(DRM_MediaKeyRequestInfo));
    unsigned char testData[139] = REQUESTINFODATA;
    if(isOnline){
     requestInfo.type = MEDIA_KEY_TYPE_ONLINE;  
    }else{
     requestInfo.type = MEDIA_KEY_TYPE_OFFLINE; 
    }   
    requestInfo.initDataLen = sizeof(testData);    
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    memset(&requestData, 0, sizeof(DRM_MediaKeyRequest));
    Drm_ErrCode ret1 = OH_MediaKeySession_GenerateMediaKeyRequest(mediaKeySession,&requestInfo, &requestData);
    CHECK_RETURN(ret1==DRM_ERR_INVALID_VAL,-1);

    uint8_t keyId[DATA_BUFF_LEN] = {0};
    int32_t keyIdLen = DATA_BUFF_LEN;
    uint8_t offResponseData[139] = OFFLINERESPONSE;
    uint8_t onResponseData[139] = ONLINERESPONSE;
    uint8_t response[DATA_BUFF_LEN] = {0};
    int32_t responseLen = DATA_BUFF_LEN;
    if(strcmp(judge_uuid(), BLUE_AREA) == 0){
        if(isOnline){
            memcpy(response, onResponseData, sizeof(onResponseData));
        }else{
            memcpy(response, offResponseData, sizeof(offResponseData));
        }
        responseLen = 139;
    }else{
        int ret3 = getHttp(LICENSE_SERVICE_IP, LICENSE_SERVICE_PORT, "/getLicense", reinterpret_cast<const char *>(requestData.data), requestData.dataLen,
                  response, (unsigned int *)&responseLen);  
		CHECK_RETURN((ret3!=0),-1);
    }
    Drm_ErrCode ret2 = OH_MediaKeySession_ProcessMediaKeyResponse(mediaKeySession,response, responseLen, keyId, &keyIdLen);
    CHECK_RETURN(ret2==DRM_ERR_INVALID_VAL,-1);	
    memcpy(keydata, keyId, keyIdLen);
    memcpy(keylen, &keyIdLen, sizeof(uint32_t));
	return 0;
}
int IsCallBack = 0; 
void testMediaKeySystemInfo(OH_AVPlayer *play, DRM_MediaKeySystemInfo* mediaKeySystemInfo)
{
    printf("\nEnter SetSystemInfo callBack!");
    printf("\ntest count = %d", mediaKeySystemInfo->psshCount);
    for(int i = 0; i <mediaKeySystemInfo->psshCount; i++){
        printf("\nuuid[%d] = ",i);
        for(int j=0; j<DATA_UUID_LEN;j++){
            printf("%.2x",mediaKeySystemInfo->psshInfo[i].uuid[j]);
        }
        printf("\n pussh[%d] = ",i);
        for(int j=0; j<mediaKeySystemInfo->psshInfo[i].dataLen;j++){
            printf("%.2x",mediaKeySystemInfo->psshInfo[i].data[j]);
        }        
    }
    IsCallBack = 0x55; 
}
static napi_value Test_AVPlayer_SetMediaKeySystemInfoCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;  
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);    
    
    OH_AVPlayer *playerHandle = OH_AVPlayer_Create();
    OH_AVPlayer *handle_ptr = nullptr;
    Player_MediaKeySystemInfoCallback callback_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        handle_ptr = playerHandle;
    }
    if (0 != strcmp(callBack, " ")) {
        callback_ptr = &testMediaKeySystemInfo;
    }       
    OH_AVErrCode ret1 = OH_AVPlayer_SetMediaKeySystemInfoCallback(handle_ptr, callback_ptr);
    OH_AVErrCode ret2 = OH_AVPlayer_SetURLSource(playerHandle, PATH);
    OH_AVErrCode ret3 = OH_AVPlayer_Prepare(playerHandle);
    OH_AVErrCode ret4 = OH_AVPlayer_Play(playerHandle);
    OH_AVErrCode ret5 = OH_AVPlayer_Release(playerHandle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret3 == AV_ERR_OK && ret4 == AV_ERR_OK && ret5 == AV_ERR_OK) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Test_AVPlayer_GetMediaKeySystemInfo(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;  
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);    
    
    OH_AVPlayer *playerHandle = OH_AVPlayer_Create();
    if(playerHandle == nullptr){
        napi_create_int32(env, AV_ERR_INVALID_VAL, &result);
        return result;
    }
    IsCallBack = 0;
    OH_AVErrCode ret1 = OH_AVPlayer_SetMediaKeySystemInfoCallback(playerHandle, &testMediaKeySystemInfo);
    OH_AVErrCode ret2 = OH_AVPlayer_SetURLSource(playerHandle, PATH);
    OH_AVErrCode ret3 = OH_AVPlayer_Prepare(playerHandle);
    OH_AVErrCode ret4 = OH_AVPlayer_Play(playerHandle);
    sleep(5);
    DRM_MediaKeySystemInfo getInfo;
    memset(&getInfo, 0, sizeof(DRM_MediaKeySystemInfo));
    OH_AVPlayer *handle_ptr = nullptr;
    DRM_MediaKeySystemInfo *info_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        handle_ptr = playerHandle;
    }
    if (0 != strcmp(callBack, " ")) {
        info_ptr = &getInfo;
    }       
    OH_AVErrCode ret5 = AV_ERR_OK;
    if(IsCallBack == 0x55){
        IsCallBack = 0;
        ret5 =  OH_AVPlayer_GetMediaKeySystemInfo(handle_ptr, info_ptr);    
        printf("psshCount = %d\n", getInfo.psshCount);
        for(int i = 0; i<DATA_UUID_LEN; i++){
            printf("psshinfo.uuid = %x\n", getInfo.psshInfo[0].uuid[i]);
        }
        printf("psshinfo.dateLen = %x\n", getInfo.psshInfo[0].dataLen);
        for(int j=0; j<getInfo.psshInfo[0].dataLen; j++){
            printf("psshinfo.date = %x\n", getInfo.psshInfo[0].data[j]);
        }    
    }
    OH_AVErrCode ret6 = OH_AVPlayer_Release(playerHandle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret3 == AV_ERR_OK 
    && ret4 == AV_ERR_OK && ret5 == AV_ERR_OK && ret6 == AV_ERR_OK) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Test_AVPlayer_SetDecryptionConfig(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;  
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);    
    
    OH_AVPlayer *playerHandle = OH_AVPlayer_Create();
    OH_AVErrCode ret1 = OH_AVPlayer_SetMediaKeySystemInfoCallback(playerHandle, &testMediaKeySystemInfo);
    OH_AVErrCode ret2 = OH_AVPlayer_SetURLSource(playerHandle, PATH);
    
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    UNUSED_PARAMETER(ret3);
    GenDeviceCertificate(drmKeySystem);
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &drmKeySession);
    UNUSED_PARAMETER(ret5);
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;   
    getLicense(drmKeySession, LICENSE_OFFLINE, keyData , &keyDataLen);
    
    bool secureVideoPath = false;
    Drm_ErrCode ret6 = OH_MediaKeySession_RequireSecureDecoderModule(drmKeySession,"video/mp4", &secureVideoPath);    
    OH_AVErrCode ret7 = OH_AVPlayer_SetDecryptionConfig(playerHandle, drmKeySession,secureVideoPath);
    OH_AVErrCode ret8 = OH_AVPlayer_Prepare(playerHandle);
    OH_AVErrCode ret9 = OH_AVPlayer_Play(playerHandle);
    OH_AVErrCode ret10 = OH_AVPlayer_Release(playerHandle);
    Drm_ErrCode ret11 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret12 = OH_MediaKeySystem_Destroy(drmKeySystem);
    UNUSED_PARAMETER(ret11);
    UNUSED_PARAMETER(ret12);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret6 == DRM_ERR_OK && ret7 == AV_ERR_OK
    && ret8 == AV_ERR_OK && ret9 == AV_ERR_OK && ret10 == AV_ERR_OK) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        { "Test_AVPlayer_SetMediaKeySystemInfoCallback", nullptr, Test_AVPlayer_SetMediaKeySystemInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Test_AVPlayer_GetMediaKeySystemInfo", nullptr, Test_AVPlayer_GetMediaKeySystemInfo, nullptr, nullptr, nullptr, napi_default, nullptr },    
        { "Test_AVPlayer_SetDecryptionConfig", nullptr, Test_AVPlayer_SetDecryptionConfig, nullptr, nullptr, nullptr, napi_default, nullptr }, 
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
