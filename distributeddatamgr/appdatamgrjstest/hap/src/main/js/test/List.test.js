/*
* Copyright (c) 2021 Huawei Device Co., Ltd.
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
import dataAbilityPredicatesTest from './StorageHelperJsunit.test.js'
import rdbStoreBackupRestoreWithFAContextTest from './StoragePromiseJsunit.test.js'
import rdbstoreChangeEncryptKeyTest from './StorageCallBackJsunit.test.js'
import rdbStoreDataSharePredicatesTest from './StorageSyncJsunit.test.js'
import rdbStoreDeleteTest from './RdbstoreInsertJsunit.test.js'
import rdbStoreDistributedTest from './RdbstoreDeleteJsunit.test.js'
import rdbstoreInsertTest from './RdbStoreResultSetJsunit.test.js'
import rdbStorePredicatesJoinTest from './RdbstorePredicatesJsunit.test.js'
import rdbPredicatesTest from './RdbstoreRdbstoreJsunit.test.js'
import rdbStoreTest from './RdbstoreStoreExcuteSqlJsunit.test.js'
import rdbResultSetTest from './RdbstoreUpdateJsunit.test.js'
import rdbstoreStoreExcuteSqlTest from './DataAbilityPredicatesJsunit.test.js'
import rdbstoreTransactionTest from './RdbstoreTransactionJsunit.test.js'
import rdbStoreUpdateTest from './RdbstorePredicatesJoinJsunit.test.js'
import storageCallBackTest from './RdbStoreDistributedJsunit.test.js'
import storageHelperTest from './RdbstoreChangeEncryptKeyJsunit.test.js'
import storagePromiseTest from './RdbStoreDataShareJsunit.test.js'
import storageSyncTest from './RdbstoreBackupRestoreWithFAContextJsunit.test.js'
export default function testsuite() {
dataAbilityPredicatesTest()
rdbStoreBackupRestoreWithFAContextTest()
rdbstoreChangeEncryptKeyTest()
rdbStoreDataSharePredicatesTest()
rdbStoreDeleteTest()
rdbStoreDistributedTest()
rdbstoreInsertTest()
rdbStorePredicatesJoinTest()
rdbPredicatesTest()
rdbStoreTest()
rdbResultSetTest()
rdbstoreStoreExcuteSqlTest()
rdbstoreTransactionTest()
rdbStoreUpdateTest()
storageCallBackTest()
storageHelperTest()
storagePromiseTest()
storageSyncTest()
}
