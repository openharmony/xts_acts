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

char RDB_TEST_PATH[] =  "/data/storage/el2/database/";
char RDB_STORE_NAME[] =  "rdb_store_test.db";
char BUNDLE_NAME[] =  "com.acts.rdb.napitest";
char MODULE_NAME[] =  "com.acts.rdb.napitest";

OH_Rdb_Store *storeTestRdbStore_ = NULL;
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
static napi_value RdbstoreSetUpTestCase(napi_env env, napi_callback_info info) {

    InitRdbConfig();
    mkdir(config_.dataBaseDir, 0770);

    int errCode = 0;
    storeTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, storeTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config is fail.");

    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(storeTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value RdbstoreTearDownTestCase(napi_env env, napi_callback_info info) {
    int errCode = 0;
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail.");   

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_0100
 * @tc.desc: napi test RDB store for Insert、Update、Query.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0100(napi_env env, napi_callback_info info) {

    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");
    
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Update is fail.");
    
    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "liSi", size) == 0, "getText is fail.");
    
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64 is fail.");


    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 200.1, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob is fail.");

    bool isNull = false;
    cursor->isNull(cursor, 5, &isNull);
    NAPI_ASSERT(env, isNull == true, "isNull is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}


/**
 * @tc.name: SUB_DDM_RDB_0200
 * @tc.desc: napi test RDB store for Insert with wrong table name or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "wrong", valueBucket);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Insert id=2 is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 3);
    valueBucket->putText(valueBucket, "data1", "wangWu");
    valueBucket->putInt64(valueBucket, "data2", 14800);
    valueBucket->putReal(valueBucket, "data3", 300.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    char *table = NULL;
    errCode = OH_Rdb_Insert(storeTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_Insert id=3 is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}

/**
 * @tc.name: SUB_DDM_RDB_0300
 * @tc.desc: napi test RDB store for Update with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("wrong");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Update is fail.");
    
    char *table = NULL;
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates(table);
    NAPI_ASSERT(env, predicates1 == NULL, "OH_Rdb_CreatePredicates is fail.");
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_Update is fail.");

    OH_Predicates *predicates2 = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates2, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");
    
    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "zhangSan", size) == 0, "getText is fail.");
    
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");
    
    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal is fail.");
    
    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strncmp(data5Value, "ABCDEFG", size) == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    predicates2->destroy(predicates2);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}

/**
 * @tc.name: SUB_DDM_RDB_0400
 * @tc.desc: napi test RDB store for Update with valueBucket is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Update is fail.");

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "zhangSan", size) == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0500
 * @tc.desc: napi test RDB store for Update with wrong predicates.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "wangwu";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Update is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "zhangSan", size) == 0, "getText is fail.");
    
    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0600
 * @tc.desc: napi test RDB store for Query with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("wrong");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    char *table = NULL;
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates(table);

    OH_Cursor *cursor1 = OH_Rdb_Query(storeTestRdbStore_, predicates1, NULL, 0);
    NAPI_ASSERT(env, cursor1 == NULL, "OH_Rdb_Query 2 is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0700
 * @tc.desc: napi test RDB store for Query with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0800
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0900
 * @tc.desc: napi test RDB store for Delete、ExecuteQuery.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert 2 is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Delete is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "liSi", 4) == 0, "getText is fail.");
    
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64 is fail.");

    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 200.1, "getReal is fail.");

    bool isNull = false;
    cursor->isNull(cursor, 4, &isNull);
    NAPI_ASSERT(env, isNull == true, "isNull is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strncmp(data5Value, "ABCDEFGH", 8) == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_1000
 * @tc.desc: napi test RDB store for querysql is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char *querySql = NULL;
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_ExecuteQuery is fail.");

    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_1100
 * @tc.desc: napi test RDB store for Delete with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("wrong");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Delete is fail.");

    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates1, NULL, 0);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    char *table = NULL;
    OH_Predicates *predicates2 = OH_Rdb_CreatePredicates(table);
    NAPI_ASSERT(env, predicates2 == NULL, "OH_Rdb_CreatePredicates is fail.");

    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates2);
    NAPI_ASSERT(env, errCode == 14800001, "OH_Rdb_Delete is fail.");

    OH_Cursor *cursor1 = OH_Rdb_Query(storeTestRdbStore_, predicates1, NULL, 0);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    cursor1->destroy(cursor1);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1200
 * @tc.desc: napi test RDB store for Delete with wrong predicates.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "wangwu";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Delete is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


	
/**
 * @tc.name: SUB_DDM_RDB_1300
 * @tc.desc: napi test RDB store for Delete multiple.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Delete is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1400
 * @tc.desc: napi test RDB store for Transaction、Commit.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_Commit(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_1500
 * @tc.desc: napi test RDB store for Transaction、RollBack.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_RollBack(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1600
 * @tc.desc: napi test RDB store for Transaction、Commit.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_Commit(storeTestRdbStore_);
    OH_Rdb_Commit(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1700
 * @tc.desc: napi test RDB store for Transaction、Commit.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_RollBack(storeTestRdbStore_);
    OH_Rdb_Commit(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1800
 * @tc.desc: napi test RDB store for GetVersion、SetVersion.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    int version = 0;
    int setVersion = 3;
    errCode = OH_Rdb_GetVersion(storeTestRdbStore_, &version);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetVersion is fail.");
    NAPI_ASSERT(env, version == 0, "OH_Rdb_GetVersion is fail.");

    errCode = OH_Rdb_SetVersion(storeTestRdbStore_, setVersion);
    errCode = OH_Rdb_GetVersion(storeTestRdbStore_, &version);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_SetVersion is fail.");
    NAPI_ASSERT(env, version == 3, "OH_Rdb_SetVersion is fail.");

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1900
 * @tc.desc: napi test RDB store for Query with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2000
 * @tc.desc: napi test RDB store for Update with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Update is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value_1, "zhangSan", size) == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2100
 * @tc.desc: napi test RDB store for Delete with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Delete is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2200
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 2);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2300
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 7);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2400
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2500
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2600
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2700
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 2);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_2800
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 4);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_2900
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 3);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_3000
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4","data5"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 5);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3100
 * @tc.desc: napi test RDB store for id
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4","data5"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 5);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    errCode = valueBucket->capability;
    NAPI_ASSERT(env, errCode == 6, "valueBucket capabilityis fail.");

    int valueObjectID = valueObject->id;
    int valueBucketID = valueBucket->id;
    int predicatesID = predicates->id;
    int cursorID = cursor->id;
    int rdbID = storeTestRdbStore_->id;

    valueObject->id = 11;
    valueBucket->id = 12;
    predicates->id = 13;
    cursor->id = 14;
    storeTestRdbStore_->id = 15;

    errCode = valueObject->destroy(valueObject);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "valueObject id is fail.");
    errCode = valueBucket->destroy(valueBucket);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "valueBucket id is fail.");
    errCode = predicates->destroy(predicates);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "predicates id is fail.");
    errCode = cursor->destroy(cursor);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "cursor id is fail.");
    errCode = OH_Rdb_CloseStore(storeTestRdbStore_);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "rdb id is fail."); 

    valueObject->id = valueObjectID;
    valueBucket->id = valueBucketID;
    predicates->id = predicatesID;
    cursor->id = cursorID;
    storeTestRdbStore_->id = rdbID;

    errCode = valueObject->destroy(valueObject);
    NAPI_ASSERT(env, errCode ==0, "valueObject id2 is fail.");
    errCode = valueBucket->destroy(valueBucket);
    NAPI_ASSERT(env, errCode == 0, "valueBucket id2 is fail.");
    errCode = predicates->destroy(predicates);
    NAPI_ASSERT(env, errCode == 0, "predicates id2 is fail.");
    errCode = cursor->destroy(cursor);
    NAPI_ASSERT(env, errCode == 0, "cursor id2 is fail.");

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"RdbstoreSetUpTestCase", nullptr, RdbstoreSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbstoreTearDownTestCase", nullptr, RdbstoreTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0100", nullptr, SUB_DDM_RDB_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0200", nullptr, SUB_DDM_RDB_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0300", nullptr, SUB_DDM_RDB_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0400", nullptr, SUB_DDM_RDB_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0500", nullptr, SUB_DDM_RDB_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0600", nullptr, SUB_DDM_RDB_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0700", nullptr, SUB_DDM_RDB_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0800", nullptr, SUB_DDM_RDB_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0900", nullptr, SUB_DDM_RDB_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1000", nullptr, SUB_DDM_RDB_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1100", nullptr, SUB_DDM_RDB_1100, nullptr, nullptr, nullptr, napi_default, nullptr},    
        {"SUB_DDM_RDB_1200", nullptr, SUB_DDM_RDB_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1300", nullptr, SUB_DDM_RDB_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1400", nullptr, SUB_DDM_RDB_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1500", nullptr, SUB_DDM_RDB_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1600", nullptr, SUB_DDM_RDB_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1700", nullptr, SUB_DDM_RDB_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1800", nullptr, SUB_DDM_RDB_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1900", nullptr, SUB_DDM_RDB_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2000", nullptr, SUB_DDM_RDB_2000, nullptr, nullptr, nullptr, napi_default, nullptr},   
        {"SUB_DDM_RDB_2100", nullptr, SUB_DDM_RDB_2100, nullptr, nullptr, nullptr, napi_default, nullptr},    
        {"SUB_DDM_RDB_2200", nullptr, SUB_DDM_RDB_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2300", nullptr, SUB_DDM_RDB_2300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2400", nullptr, SUB_DDM_RDB_2400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2500", nullptr, SUB_DDM_RDB_2500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2600", nullptr, SUB_DDM_RDB_2600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2700", nullptr, SUB_DDM_RDB_2700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2800", nullptr, SUB_DDM_RDB_2800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2900", nullptr, SUB_DDM_RDB_2900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3000", nullptr, SUB_DDM_RDB_3000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3100", nullptr, SUB_DDM_RDB_3100, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "rdbstore",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
