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
import dataAbilityPredicatesTest from './DataAbilityPredicatesJsunit.test.js'
import rdbStoreBackupRestoreWithFAContextTest from './RdbstoreBackupRestoreWithFAContextJsunit.test.js'
import rdbstoreChangeEncryptKeyTest from './RdbstoreChangeEncryptKeyJsunit.test.js'
import rdbStoreDataSharePredicatesTest from './RdbStoreDataShareJsunit.test.js'
import rdbStoreDeleteTest from './RdbstoreDeleteJsunit.test.js'
import rdbStoreDistributedTest from './RdbStoreDistributedJsunit.test.js'
import rdbstoreInsertTest from './RdbstoreInsertJsunit.test.js'
import rdbStorePredicatesJoinTest from './RdbstorePredicatesJoinJsunit.test.js'
import rdbPredicatesTest from './RdbstorePredicatesJsunit.test.js'
import rdbStoreTest from './RdbstoreRdbstoreJsunit.test.js'
import rdbResultSetTest from './RdbStoreResultSetJsunit.test.js'
import rdbstoreStoreExcuteSqlTest from './RdbstoreStoreExcuteSqlJsunit.test.js'
import rdbstoreTransactionTest from './RdbstoreTransactionJsunit.test.js'
import rdbStoreUpdateTest from './RdbstoreUpdateJsunit.test.js'
import storageCallBackTest from './StorageCallBackJsunit.test.js'
import storageHelperTest from './StorageHelperJsunit.test.js'
import storagePromiseTest from './StoragePromiseJsunit.test.js'
import storageSyncTest from './StorageSyncJsunit.test.js'
import systemStorageTest from './SystemStorageJsunit.testjs'
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
systemStorageTest()
}
