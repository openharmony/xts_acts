/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <ctime>
#include <cstdint>
#include "common.h"
#include <sys/stat.h>
#include <string>
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"


const char *TAG = "testLog";
static  const char *RDB_TEST_PATH = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/";

static napi_value OH_Rdb_CreateConfig_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CreateConfig_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;

}

static napi_value OH_Rdb_CreateConfig_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CreateConfig_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir is fail.");
    errcode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName is fail.");
    errcode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName is fail.");
    errcode = OH_Rdb_SetModuleName(config, "module");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetModuleName is fail.");
    errcode = OH_Rdb_SetEncrypted(config, false);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel is fail.");
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea is fail.");
    errcode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_0100 ------------- ");
    
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    
    errCode = OH_Rdb_SetDbType(config, Rdb_DBType::RDB_SQLITE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetDbType RDB_SQLITE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType RDB_SQLITE is fail.");
    
    mkdir(RDB_TEST_PATH, 0770);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_0100 ------------- ");
    
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);

    errCode = OH_Rdb_SetDbType(config, Rdb_DBType::DBTYPE_BUTT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetDbType DBTYPE_BUTT   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType DBTYPE_BUTT is fail.");
    
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_GetSupportedDbType_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_GetSupportedDbType_0100 ------------- ");
    
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    
    errCode = OH_Rdb_SetDbType(config, Rdb_DBType::RDB_SQLITE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetDbType RDB_SQLITE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType RDB_SQLITE is fail.");
    
    int numType = 0;
    const int *supportTypeList = OH_Rdb_GetSupportedDbType(&numType);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_GetSupportedDbType    numType= %{public}d", numType);
    NAPI_ASSERT(env, supportTypeList != nullptr, "OH_Rdb_GetSupportedDbType 1 is fail.");
    NAPI_ASSERT(env, (numType == 1) || (numType == 2), "OH_Rdb_GetSupportedDbType numType is fail.");
    NAPI_ASSERT(env, supportTypeList[0] == Rdb_DBType::RDB_SQLITE, "OH_Rdb_GetSupportedDbType RDB_SQLITE is fail.");
    
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0100 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, 0770);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);

    char createTableSql[] = "CREATE TABLE store_test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode =OH_Rdb_Execute(storeConfigV2TestRdbStore, createTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute createTableSql is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(storeConfigV2TestRdbStore, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0200  OH_Rdb_CommitByTrxId ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, 0770);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");

    int64_t trxId = 0;
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxId, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    errCode = OH_Rdb_CommitByTrxId(store, trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_CommitByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId is fail.");
    
    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");

    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0300 OH_Rdb_RollBackByTrxId ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, 0770);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");

    int64_t trxId = 0;
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxId, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    errCode = OH_Rdb_RollBackByTrxId (store, trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_RollBackByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId is fail.");

    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");

    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_Trxid_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0300 Trxid=-1  ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, 0770);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, -1, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");

    int64_t trxId = -1;
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, -1, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    errCode = OH_Rdb_RollBackByTrxId (store, -1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_RollBackByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId is fail.");

    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");

    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, -1, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_Trxid_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0300 Trxid=2  ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, 0770);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, 2, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");

    int64_t trxId = 2;
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, 2, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    errCode = OH_Rdb_RollBackByTrxId (store, 2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_RollBackByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId is fail.");

    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");

    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, 2, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetDatabaseDir(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 1 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetDatabaseDir(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 2 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetDatabaseDir(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 3 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetDatabaseDir(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 4 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0500 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir 1 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0600 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetDatabaseDir(config, "/data");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir 2 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0700 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetDatabaseDir(config, "");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir 3 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0800 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
   
    errcode = OH_Rdb_SetDatabaseDir(config, " ");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir 3 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0900 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
   
    errcode = OH_Rdb_SetDatabaseDir(config, "/");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir 4 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_1000 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetDatabaseDir(config, "*");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir 5 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetStoreName(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 1 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetStoreName(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 2 is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetStoreName(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 3 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetStoreName(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 4 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0500 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetStoreName(config, "aaaaa");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName 1 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0600 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    std::string strname(50,'n');
    errcode = OH_Rdb_SetStoreName(config, strname.c_str());
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName 2 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0700 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetStoreName(config, "");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName 3 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0800 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
   
    errcode = OH_Rdb_SetStoreName(config, " ");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName 4 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0900 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
   
    errcode = OH_Rdb_SetStoreName(config, "/");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName 5 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_1000 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
   
    errcode = OH_Rdb_SetStoreName(config, "_!@#%^*&*(()_+((&^%$%");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName 6 is fail.");

    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}


static napi_value OH_Rdb_SetBundleName_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetBundleName(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 1 is fail.");

    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetBundleName(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 2 is fail.");
    
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetBundleName(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 3 is fail.");

    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    errcode = OH_Rdb_SetBundleName(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 4 is fail.");
    
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0500 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    
    errcode = OH_Rdb_SetBundleName(config, "aaaaa");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName 1 is fail.");

    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0600 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");

    std::string strname(50,'n');
    errcode = OH_Rdb_SetBundleName(config, strname.c_str());
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName 2 is fail.");
   
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0700 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
   
    errcode = OH_Rdb_SetBundleName(config, "");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName 3 is fail.");

    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0800 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
  
    errcode = OH_Rdb_SetBundleName(config, " ");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName 3 is fail.");

    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0900 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
  
    errcode = OH_Rdb_SetBundleName(config, "/");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName 4 is fail.");

    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_1000 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
  
    errcode = OH_Rdb_SetBundleName(config, "_!@#%^*&*(()_+((&^%$%");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName 5 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Rdb_CreateConfig_0100", nullptr, OH_Rdb_CreateConfig_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_CreateConfig_0200", nullptr, OH_Rdb_CreateConfig_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_0100", nullptr, OH_Rdb_SetDbType_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_0300", nullptr, OH_Rdb_SetDbType_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_GetSupportedDbType_0100", nullptr, OH_Rdb_GetSupportedDbType_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_0100", nullptr, OH_Rdb_SetDbType_SQLITE_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_0200", nullptr, OH_Rdb_SetDbType_SQLITE_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_0300", nullptr, OH_Rdb_SetDbType_SQLITE_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_Trxid_0100", nullptr, OH_Rdb_SetDbType_SQLITE_Trxid_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_Trxid_0200", nullptr, OH_Rdb_SetDbType_SQLITE_Trxid_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0100", nullptr, OH_Rdb_SetDatabaseDir_Param_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0200", nullptr, OH_Rdb_SetDatabaseDir_Param_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0300", nullptr, OH_Rdb_SetDatabaseDir_Param_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0400", nullptr, OH_Rdb_SetDatabaseDir_Param_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0500", nullptr, OH_Rdb_SetDatabaseDir_Param_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0600", nullptr, OH_Rdb_SetDatabaseDir_Param_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0700", nullptr, OH_Rdb_SetDatabaseDir_Param_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0800", nullptr, OH_Rdb_SetDatabaseDir_Param_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0900", nullptr, OH_Rdb_SetDatabaseDir_Param_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_1000", nullptr, OH_Rdb_SetDatabaseDir_Param_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0100", nullptr, OH_Rdb_SetStoreName_Param_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0200", nullptr, OH_Rdb_SetStoreName_Param_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0300", nullptr, OH_Rdb_SetStoreName_Param_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0400", nullptr, OH_Rdb_SetStoreName_Param_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0500", nullptr, OH_Rdb_SetStoreName_Param_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0600", nullptr, OH_Rdb_SetStoreName_Param_0600, nullptr, nullptr, nullptr, napi_default, nullptr},        
        {"OH_Rdb_SetStoreName_Param_0700", nullptr, OH_Rdb_SetStoreName_Param_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0800", nullptr, OH_Rdb_SetStoreName_Param_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0900", nullptr, OH_Rdb_SetStoreName_Param_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_1000", nullptr, OH_Rdb_SetStoreName_Param_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0100", nullptr, OH_Rdb_SetBundleName_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0200", nullptr, OH_Rdb_SetBundleName_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0300", nullptr, OH_Rdb_SetBundleName_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0400", nullptr, OH_Rdb_SetBundleName_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0500", nullptr, OH_Rdb_SetBundleName_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0600", nullptr, OH_Rdb_SetBundleName_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0700", nullptr, OH_Rdb_SetBundleName_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0800", nullptr, OH_Rdb_SetBundleName_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0900", nullptr, OH_Rdb_SetBundleName_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_SetBundleName_1000", nullptr, OH_Rdb_SetBundleName_1000, nullptr, nullptr, nullptr, napi_default, nullptr},

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
