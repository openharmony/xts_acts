/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <string>
#include <string.h>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <securec.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "napi/native_api.h"
#include "common/common.h"
#include "relational_store.h"
#include "relational_store_error_code.h"
#include "oh_cursor.h"
#include "oh_predicates.h"
#include "oh_value_object.h"
#include "oh_values_bucket.h"

OH_Rdb_Store *cursorTestRdbStore_ = NULL;

char *RDB_TEST_PATH =  NULL;
char RDB_STORE_NAME[] =  "rdb_store_cursor_test.db";
char BUNDLE_NAME[] =  "com.acts.rdb.napitest";
char MODULE_NAME[] =  "com.acts.rdb.napitest";

static OH_Rdb_Config config_;
static void InitRdbConfig()
{
    config_.dataBaseDir = RDB_TEST_PATH;
    config_.storeName = RDB_STORE_NAME;
    config_.bundleName = BUNDLE_NAME;
    config_.moduleName = MODULE_NAME;
    config_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_.isEncrypt = false;
    config_.selfSize = sizeof(OH_Rdb_Config);
}

static napi_value RdbFilePath(napi_env env, napi_callback_info info) {
    int errCode = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    size_t bufferSize = 0;
    napi_get_value_string_latin1(env, args[0], nullptr, 0, &bufferSize);

    char *buffer = (char*)malloc((bufferSize) + 1);
    napi_get_value_string_utf8(env, args[0], buffer, bufferSize+1, &bufferSize);  

    RDB_TEST_PATH = (char*)malloc((bufferSize) + 1);
    sprintf(RDB_TEST_PATH, "%s", buffer);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode; 
}

static napi_value CursorSetUpTestCase(napi_env env, napi_callback_info info) {
    InitRdbConfig();
    mkdir(config_.dataBaseDir, 0770);

    int errCode = 0;
    char table[] = "test";
    cursorTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);    
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, cursorTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config is fail.");

    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(cursorTestRdbStore_, createTableSql);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(cursorTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert 1  is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(cursorTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert 2 is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 3);
    valueBucket->putText(valueBucket, "data1", "wangWu");
    valueBucket->putInt64(valueBucket, "data2", 14800);
    valueBucket->putReal(valueBucket, "data3", 300.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    errCode = OH_Rdb_Insert(cursorTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 3, "OH_Rdb_Insert 3 is fail.");

    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode; 
}

static napi_value CursorTearDownTestCase(napi_env env, napi_callback_info info) {
    int errCode = 0;
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(cursorTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(cursorTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail.");   

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;    
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0100
 * @tc.desc: napi test RDB cursor for GetColumnType.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0100(napi_env env, napi_callback_info info) {

    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");

    cursor->goToNextRow(cursor);

    OH_ColumnType type;
    errCode = cursor->getColumnType(cursor, 0, &type);
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_INT64, "getColumnType 0  is fail.");

    errCode = cursor->getColumnType(cursor, 1, &type);;
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_TEXT, "getColumnType  1 is fail.");

    errCode = cursor->getColumnType(cursor, 2, &type);
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_INT64, "getColumnType  2 is fail.");

    errCode = cursor->getColumnType(cursor, 3, &type);
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_REAL, "getColumnType  3 is fail.");

    errCode = cursor->getColumnType(cursor, 4, &type);
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_BLOB, "getColumnType  4 is fail.");

    errCode = cursor->getColumnType(cursor, 5, &type);
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_TEXT, "getColumnType  5 is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);    

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0200
 * @tc.desc: napi test RDB cursor for GetColumnIndex.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");
    
    int columnIndex;
    errCode = cursor->getColumnIndex(cursor, "data1", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 1, "getColumnIndex 1 is fail.");

    errCode = cursor->getColumnIndex(cursor, "data2", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 2, "getColumnIndex 2 is fail.");

    errCode = cursor->getColumnIndex(cursor, "data3", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 3, "getColumnIndex 3 is fail.");

    errCode = cursor->getColumnIndex(cursor, "data4", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 4, "getColumnIndex 4 is fail.");

    errCode = cursor->getColumnIndex(cursor, "data5", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 5, "getColumnIndex 5 is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0300
 * @tc.desc: napi test RDB cursor for GetColumnName.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0300(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");
    
    char name[10];
    int  errCode = cursor->getColumnName(cursor, 1, name, 10);
    NAPI_ASSERT(env, strncmp(name, "data1", 5) == 0, "getColumnName data1 is fail.");
    
    errCode = cursor->getColumnName(cursor, 2, name, 6);
    NAPI_ASSERT(env, strncmp(name, "data2", 5) == 0, "getColumnName data2 is fail.");

    errCode = cursor->getColumnName(cursor, 3, name, 6);
    NAPI_ASSERT(env, strncmp(name, "data3", 5) == 0, "getColumnName data3 is fail.");

    errCode = cursor->getColumnName(cursor, 4, name, 6);
    NAPI_ASSERT(env, strncmp(name, "data4", 5) == 0, "getColumnName data4 is fail.");

    errCode = cursor->getColumnName(cursor, 5, name, 6);
    NAPI_ASSERT(env, strncmp(name, "data5", 5) == 0, "getColumnName data5 is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
       
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0400
 * @tc.desc: napi test RDB cursor for Getxxx.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0400(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len1 = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");

    int errCode = 0;
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    char data1Value[size + 1];
    cursor->getText(cursor, 0, data1Value, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value, "zhangSan", size) == 0, "getText  is fail.");

    int64_t data2Value;
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64  is fail.");

    double data3Value;
    cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal  is fail.");

    cursor->getSize(cursor, 3, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 3, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob 0 is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob 1 is fail.");
    
    cursor->goToNextRow(cursor);

    cursor->getSize(cursor, 0, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 0, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "liSi", size) == 0, "getText  is fail.");

    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64  is fail.");

    cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, data3Value == 200.1, "getReal  is fail.");

    bool isNull = false;
    cursor->isNull(cursor, 3, &isNull);
    NAPI_ASSERT(env, isNull == true, "isNull  is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
       
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0500
 * @tc.desc: napi test RDB cursor for GetColumnIndex.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0500(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int columnIndex;
    int errCode = cursor->getColumnIndex(cursor, "data", &columnIndex);
    NAPI_ASSERT(env, columnIndex == -1, "getColumnIndex is fail.");

    errCode = predicates->destroy(predicates);
       
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0600
 * @tc.desc: napi test RDB cursor for GetColumnIndex.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0600(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int columnIndex;
    char *name = NULL;
    int errCode = cursor->getColumnIndex(cursor, name, &columnIndex);
    NAPI_ASSERT(env, errCode == 14800001, "getColumnIndex is fail.");

    errCode = predicates->destroy(predicates);
     
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0700
 * @tc.desc: napi test RDB cursor for GetColumnType.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0700(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    cursor->goToNextRow(cursor);

    OH_ColumnType type;
    int errCode = cursor->getColumnType(cursor, 6, &type);
    NAPI_ASSERT(env, type == OH_ColumnType::TYPE_NULL, "getColumnType is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
       
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0800
 * @tc.desc: napi test RDB cursor for GetColumnName.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0800(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    char name[10] = "";
    int errCode = cursor->getColumnName(cursor, 6, name, 10);
    NAPI_ASSERT(env, strncmp(name, "", 10) == 0, "getColumnName is fail.");
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
      
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_0900
 * @tc.desc: napi test RDB cursor for getSize.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_0900(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len1 = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int errCode = 0;
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 6, &size);
    NAPI_ASSERT(env, (int)size == 0, "getSize  is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
 
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1000
 * @tc.desc: napi test RDB cursor for getText.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1000(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len1 = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    char data1Value[size + 1];
    cursor->getText(cursor, 6, data1Value, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value, "", size) == 0, "getText  is fail.");
    
    predicates->destroy(predicates);
    int errCode = cursor->destroy(cursor);
     
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1100
 * @tc.desc: napi test RDB cursor for getInt64.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1100(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len1 = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    int64_t data2Value = 0;
    int errCode = cursor->getInt64(cursor, 6, &data2Value);
    NAPI_ASSERT(env, data2Value == 0, "getInt64  is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
       
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1200
 * @tc.desc: napi test RDB cursor for getReal.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1200(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    double data3Value = 0;
    cursor->getReal(cursor, 6, &data3Value);
    NAPI_ASSERT(env, data3Value == 0, "getReal  is fail.");

    predicates->destroy(predicates);
    int errCode = cursor->destroy(cursor);
      
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1300
 * @tc.desc: getBlob
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1300(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len1 = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query config is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 3, &size);
    unsigned char data4Value[] = "string";
    int errCode = cursor->getBlob(cursor, 6, data4Value, size);
    NAPI_ASSERT(env, strncmp((char*)data4Value, "string", size) == 0, "getBlob is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);    
 
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1400
 * @tc.desc: isNull
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1400(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");

    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len1 = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, columnNames, len1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount  is fail.");

    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount  is fail.");

    bool isNull = false;
    int errCode = cursor->isNull(cursor, 6, &isNull);
    NAPI_ASSERT(env, isNull == false, "isNull  is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);    
 
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1500
 * @tc.desc: getRowCount
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1500(napi_env env, napi_callback_info info) {

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    predicates->destroy(predicates);
    int errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1600
 * @tc.desc: getRowCount
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1600(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "name";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    predicates->destroy(predicates);
    int errCode = cursor->destroy(cursor);
   
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1700
 * @tc.desc: getRowCount
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1700(napi_env env, napi_callback_info info) {

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject1 = OH_Rdb_CreateValueObject();
    const char *data1Value1 = "zhangSan";
    valueObject1->putText(valueObject1, data1Value1);
    predicates->equalTo(predicates, "data1", valueObject1);
    OH_VObject *valueObject2 = OH_Rdb_CreateValueObject();
    const char *data1Value2 = "name";
    valueObject2->putText(valueObject2, data1Value2);
    predicates->equalTo(predicates, "data1", valueObject2);

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    predicates->destroy(predicates);
    int errCode = cursor->destroy(cursor);
 
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_CURSOR_1800
 * @tc.desc: 
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_CURSOR_1800(napi_env env, napi_callback_info info) {
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan1";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(cursorTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    int errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 14800026, "goToNextRow is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
 
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"RdbFilePath", nullptr, RdbFilePath, nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"CursorSetUpTestCase", nullptr, CursorSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CursorTearDownTestCase", nullptr, CursorTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0100", nullptr, SUB_DDM_RDB_CURSOR_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0200", nullptr, SUB_DDM_RDB_CURSOR_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0300", nullptr, SUB_DDM_RDB_CURSOR_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0400", nullptr, SUB_DDM_RDB_CURSOR_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0500", nullptr, SUB_DDM_RDB_CURSOR_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0600", nullptr, SUB_DDM_RDB_CURSOR_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0700", nullptr, SUB_DDM_RDB_CURSOR_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0800", nullptr, SUB_DDM_RDB_CURSOR_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_0900", nullptr, SUB_DDM_RDB_CURSOR_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1000", nullptr, SUB_DDM_RDB_CURSOR_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1100", nullptr, SUB_DDM_RDB_CURSOR_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1200", nullptr, SUB_DDM_RDB_CURSOR_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1300", nullptr, SUB_DDM_RDB_CURSOR_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1400", nullptr, SUB_DDM_RDB_CURSOR_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1500", nullptr, SUB_DDM_RDB_CURSOR_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1600", nullptr, SUB_DDM_RDB_CURSOR_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1700", nullptr, SUB_DDM_RDB_CURSOR_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_CURSOR_1800", nullptr, SUB_DDM_RDB_CURSOR_1800, nullptr, nullptr, nullptr, napi_default, nullptr}

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
    .nm_modname = "cursor",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
