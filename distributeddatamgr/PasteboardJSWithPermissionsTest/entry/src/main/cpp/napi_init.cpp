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
#include "hilog/log.h"
#include <string>
#include <unistd.h>
#include "database/pasteboard/oh_pasteboard.h"
#include "database/pasteboard/oh_pasteboard_err_code.h"
#include "database/udmf/udmf.h"
#include "database/udmf/udmf_meta.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#include <iostream>
#include <map>
#include <ctime>
#include "common.h"
#include <cctype>
#include <condition_variable>
#include <cstdint>
#include <fcntl.h>
#include <functional>
#include <iostream>
#include <list>
#include <map>
#include <memory>
#include <mutex>
#include <string>
#include <sys/mman.h>
#include <thread>
#include <vector>
#include <string>
#include <random>
#include <chrono>

static OH_Pasteboard_GetDataParams *g_params = nullptr;

void ProgressNotify(Pasteboard_ProgressInfo progressInfo)
{
    printf("percentage = %d\n", progressInfo.progress);
    if (g_params != nullptr && g_params->progressSignal.cancel != nullptr) {
        g_params->progressSignal.cancel();
        free(g_params);
        g_params = nullptr;
    }
}

void ProgressNotify1(Pasteboard_ProgressInfo progressInfo)
{
    printf("percentage = %d\n", progressInfo.progress);
    if (g_params != nullptr && g_params->progressSignal.cancel != nullptr) {
        free(g_params);
        g_params = nullptr;
    }
}

static napi_value OH_Pasteboard_GetDataWithProgress001(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress002(napi_env env, napi_callback_info info)
{
    const char *uri = "/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress003(napi_env env, napi_callback_info info)
{
    const char *uri1 = "/data/storage/el2/base/haps/entry/files/File.txt";
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri1;
    g_params->destUriLen = strlen(uri1);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == OH_PASTEBOARD_COPY_FILE_ERROR, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress004(napi_env env, napi_callback_info info)
{
    const char *uri1 = "/data/storage/el2/base/haps/entry/文件/File.txt";
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri1;
    g_params->destUriLen = strlen(uri1);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == OH_PASTEBOARD_COPY_FILE_ERROR, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress005(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files123/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;

    // OH_Pasteboard_GetDataParams getDataOptions;
    
    // getDataOptions.destUri = (char *)uri;
    // getDataOptions.destUriLen = strlen(uri);
    // getDataOptions.fileConflictOption = OH_PASTEBOARD_SKIP;
    // getDataOptions.progressIndicator = OH_PASTEBOARD_DEFAULT;
    // int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress006(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files.file/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress007(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files_file/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress008(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files*file/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress009(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files;file/dstFile.txt";

    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == OH_PASTEBOARD_COPY_FILE_ERROR, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress010(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/filesfile11112222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222/dstFile.txt";
    
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress011(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/filesfile111122222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222/dstFile.txt";
    
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_INVALID_PARAMETER, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress012(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_INVALID_PARAMETER, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress013(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri) + 1;
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_INVALID_PARAMETER, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData == nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress014(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress015(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_OVERWRITE;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress016(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = (Pasteboard_FileConflictOption)3;
    g_params->progressIndicator = OH_PASTEBOARD_DEFAULT;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress017(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = (Pasteboard_ProgressIndicator) 3;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress018(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_NONE;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    // OH_Pasteboard_Destroy(pasteboard);
    // OH_UdmfRecord_Destroy(record);
    // OH_UdmfData_Destroy(unifiedData);
    // OH_UdsFileUri_Destroy(fileUri);
    // OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress019(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_NONE;
    g_params->progressListener.callback = ProgressNotify;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress020(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdmfData* unifiedData = OH_UdmfData_Create();
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();
    OH_UdsFileUri_SetFileUri(fileUri, uri);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(unifiedData, record);
    int ret = OH_Pasteboard_SetData( pasteboard, unifiedData);
    NAPI_ASSERT(env, ret == ERR_OK, "OH_Pasteboard_SetData is fail.");
    
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_NONE;
    g_params->progressListener.callback = ProgressNotify1;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == ERR_OK, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    unsigned int getrecordCount = 0;
    OH_UdmfRecord **getRecords = OH_UdmfData_GetRecords(getData, &getrecordCount);
    NAPI_ASSERT(env, getrecordCount == 1, "OH_UdmfData_GetRecords is fail.");
    OH_UdsFileUri* getfileUri = OH_UdsFileUri_Create();
    OH_UdmfRecord_GetFileUri(getRecords[0], getfileUri);
    const char* getContent = OH_UdsFileUri_GetFileUri(getfileUri);
    NAPI_ASSERT(env, strcmp(getContent, uri) == 0, "OH_UdsPlainText_GetContent is fail.");
    OH_Pasteboard_ClearData(pasteboard);

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdsFileUri_Destroy(getfileUri);
    return result;
}

static napi_value OH_Pasteboard_GetDataWithProgress021(napi_env env, napi_callback_info info)
{
    const char *uri = "/data/storage/el2/base/haps/entry/files/dstFile.txt";
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    g_params = (OH_Pasteboard_GetDataParams *)calloc(sizeof(OH_Pasteboard_GetDataParams), 1);
    g_params->destUri = (char *)uri;
    g_params->destUriLen = strlen(uri);
    g_params->fileConflictOption = OH_PASTEBOARD_SKIP;
    g_params->progressIndicator = OH_PASTEBOARD_NONE;
    g_params->progressListener.callback = ProgressNotify;
    int status = -1;
    
    OH_UdmfData* getData = OH_Pasteboard_GetDataWithProgress(pasteboard, g_params, &status);
    NAPI_ASSERT(env, status == OH_PASTEBOARD_GET_DATA_FAILED, "OH_Pasteboard_GetDataWithProgress is fail.");
    NAPI_ASSERT(env, getData != nullptr, "OH_Pasteboard_GetDataWithProgress is fail.");

    int recode = 0;
    napi_value result;
    napi_create_int32(env, recode, &result);
    OH_Pasteboard_Destroy(pasteboard);
    return result;
}



EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Pasteboard_GetDataWithProgress001", nullptr, OH_Pasteboard_GetDataWithProgress001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress002", nullptr, OH_Pasteboard_GetDataWithProgress002,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress003", nullptr, OH_Pasteboard_GetDataWithProgress003,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress004", nullptr, OH_Pasteboard_GetDataWithProgress004,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress005", nullptr, OH_Pasteboard_GetDataWithProgress005,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress006", nullptr, OH_Pasteboard_GetDataWithProgress006,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress007", nullptr, OH_Pasteboard_GetDataWithProgress007,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress008", nullptr, OH_Pasteboard_GetDataWithProgress008,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress009", nullptr, OH_Pasteboard_GetDataWithProgress009,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress010", nullptr, OH_Pasteboard_GetDataWithProgress010,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress011", nullptr, OH_Pasteboard_GetDataWithProgress011,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress012", nullptr, OH_Pasteboard_GetDataWithProgress012,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress013", nullptr, OH_Pasteboard_GetDataWithProgress013,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress014", nullptr, OH_Pasteboard_GetDataWithProgress014,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress015", nullptr, OH_Pasteboard_GetDataWithProgress015,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress016", nullptr, OH_Pasteboard_GetDataWithProgress016,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress017", nullptr, OH_Pasteboard_GetDataWithProgress017,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress018", nullptr, OH_Pasteboard_GetDataWithProgress018,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress019", nullptr, OH_Pasteboard_GetDataWithProgress019,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress020", nullptr, OH_Pasteboard_GetDataWithProgress020,
        nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Pasteboard_GetDataWithProgress021", nullptr, OH_Pasteboard_GetDataWithProgress021,
        nullptr, nullptr, nullptr, napi_default, nullptr},
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
