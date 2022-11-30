/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import dataRdb from '@ohos.data.rdb'
import abilityFeatureAbility from '@ohos.ability.featureAbility'
import fileio from '@ohos.fileio'

const TAG = "[RDB_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"
const DATABASE_DIR = "/data/storage/el2/database/entry/rdb/"
var RdbStore
var context
const STORE_CONFIG = {
    name: "BackupResotreTest.db",
}
const DATABASE_BACKUP_NAME = "Backup.db"

async function CreatRdbStore(context, STORE_CONFIG) {
    let RdbStore = await dataRdb.getRdbStore(context, STORE_CONFIG, 1)
    await RdbStore.executeSql(CREATE_TABLE_TEST, null)
    let u8 = new Uint8Array([1, 2, 3])
    {
        const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        await RdbStore.insert("test", valueBucket)
    }
    {
        const valueBucket = {
            "name": "lisi",
            "age": 28,
            "salary": 100.5,
            "blobType": u8,
        }
        await RdbStore.insert("test", valueBucket)
    }
    {
        const valueBucket = {
            "name": "wangwu",
            "age": 38,
            "salary": 90.0,
            "blobType": u8,
        }
        await RdbStore.insert("test", valueBucket)
    }
    return RdbStore
}

async function BackupTest(backupName) {
    try {
        let promiseRestore = RdbStore.backup(backupName)
        promiseRestore.then(() => {
            expect(false).assertTrue()
        }).catch((err) => {
            console.info(TAG + "Backup error: " + err)
            expect(true).assertTrue()
        })
        await promiseRestore
    } catch(errInfo){
        console.info(TAG + "BackupTest error: " + errInfo)
        expect(true).assertTrue()
    }

    RdbStore = null
}

async function ReStoreTest(restoreName) {
    try {
        let promiseRestore = RdbStore.restore(restoreName)
        promiseRestore.then(() => {
            expect(false).assertTrue()
        }).catch((err) => {
            console.info(TAG + "Restore error: " + err)
            expect(true).assertTrue()
        })
        await promiseRestore
    } catch(errInfo) {
        console.info(TAG + "ReStoreTest error: " + errInfo)
        expect(true).assertTrue()
    }

    RdbStore = null
}

export default function rdbStoreBackupRestorePromiseTest() {
describe('rdbStoreBackupRestorePromiseTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach')
            context = abilityFeatureAbility.getContext()
            RdbStore = await CreatRdbStore(context, STORE_CONFIG)
        })

        afterEach(async function () {
            console.info(TAG + 'afterEach')
            await dataRdb.deleteRdbStore(context, STORE_CONFIG.name)
            await dataRdb.deleteRdbStore(context, DATABASE_BACKUP_NAME)
            await dataRdb.deleteRdbStore(context, "BackupTest003.db")
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        console.info(TAG + "*************Unit Test Begin*************")

        /**
         * @tc.name RDB Backup Restore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0010
         * @tc.desc RDB backup and restore function test
         */
        it('RdbBackupRestoreTest_0010', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0010 start *************")

            // RDB backup function test
            RdbStore.backup(DATABASE_BACKUP_NAME).then(async() => {
                try {
                    fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                    fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
                } catch (err) {
                    console.info("RdbBackupRestoreTest_0010 backup success")
                    expect(false).assertTrue()
                }
                // RDB before restored, delete data
                let deleteData = new dataRdb.RdbPredicates("test")
                deleteData.equalTo("name", "zhangsan")
                await RdbStore.delete(deleteData)

            // RDB restore function test
                RdbStore.restore(DATABASE_BACKUP_NAME).then(async () => {
                    try {
                        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                        expect(false).assertTrue()
                    } catch (err) {
                        console.info("RdbBackupRestoreTest_0010 restore success")
                        expect(true).assertTrue()
                    }

                    try {
                        fileio.accessSync(DATABASE_DIR + STORE_CONFIG.name)
                    } catch (err) {
                        console.info("RdbBackupRestoreTest_0010 restore success2")
                        expect(false).assertTrue()
                    }
                    // RDB after restored, data query test
                    let predicates = new dataRdb.RdbPredicates("test")
                    predicates.equalTo("name", "zhangsan")
                    RdbStore.query(predicates).then((resultSet)=>{
                        try {
                            console.info(TAG + "After restore resultSet query done")
                            resultSet.goToFirstRow();
                            expect(true).assertEqual(resultSet.goToFirstRow())
                            console.info("RdbBackupRestoreTest_0010 goto first row success")
                            const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                            console.info("RdbBackupRestoreTest_0010 get dolumnindex id success")
                            const name = resultSet.getString(resultSet.getColumnIndex("name"))
                            console.info("RdbBackupRestoreTest_0010 get dolumnindex name success")
                            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                            console.info(`RdbBackupRestoreTest_0010 id is ${id},name id ${name},blobType is ${blobType[0]}`)
                            expect(1).assertEqual(id)
                            expect("zhangsan").assertEqual(name)
                            expect(1).assertEqual(blobType[0])
                        } catch (err) {
                            console.info(TAG + 'RdbBackupRestoreTest_0010 accessSync err4:  ' + err)
                            expect(false).assertTrue()
                        }
                        resultSet = null
                        RdbStore = null
        
                        done()
                        console.info(TAG + "************* RdbBackupRestoreTest_0010 end *************")
                    })
                
                }).catch((err) => {
                    console.info("RdbBackupRestoreTest_0010 restore error: " + err)
                    expect(false).assertTrue()
                })
            }).catch((err) => {
                expect(false).assertTrue()
            })
            
            
        })

        /**
         * @tc.name RDB Backup test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0020
         * @tc.desc RDB backup function test
         */
        it('RdbBackupRestoreTest_0020', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0020 start *************")
            // RDB backup function test, backup file name empty
            BackupTest("")

            // RDB backup function test, backup file name already exists
            BackupTest(STORE_CONFIG.name)

            done()
            console.info(TAG + "************* RdbBackupRestoreTest_0020 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0030
         * @tc.desc RDB restore function test
         */
        it('RdbBackupRestoreTest_0030', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0030 start *************")
            let backupName = "BackupTest003.db"
            await RdbStore.backup(backupName)

            // RDB restore function test, backup file name empty
            ReStoreTest("")

            // RDB restore function test, backup file is specified to database name
            ReStoreTest(STORE_CONFIG.name)

            done()
            console.info(TAG + "************* RdbBackupRestoreTest_0030 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0040
         * @tc.desc RDB restore function test
         */
        it('RdbBackupRestoreTest_0040', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0040 start *************")
            let dbName = "notExistName.db"

            // RDB restore function test, backup file does not exists
            try {
                fileio.accessSync(DATABASE_DIR + dbName)
                expect(false).assertTrue()
            } catch {
                ReStoreTest(dbName)
            }

            done()
            console.info(TAG + "************* RdbBackupRestoreTest_0040 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0050
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0050', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0050 start *************")

            // RDB restore function test, backup file
            await RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
                try{
                    console.info(TAG + 'Backup database success')
                    fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                }catch(err){
                    expect(false).assertTrue();
                }
            }).then(() => {
                dataRdb.deleteRdbStore(context, DATABASE_BACKUP_NAME).then(() => {
                    try{
                        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                    }catch(err){
                        console.info(TAG + 'error2  ' + err)
                        expect(true).assertTrue();
                    }
                })
            }).then(() => {
                RdbStore.backup(DATABASE_BACKUP_NAME).then(() => {
                    try{
                        console.info(TAG + 'Backup database success')
                        fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
                    }catch(err){
                        console.info(TAG + 'error3  ' + err)
                        expect(false).assertTrue()
                    }
                })
            })
            done()
            console.info(TAG + "************* RdbBackupRestoreTest_0050 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0060
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0060', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0060 start *************")
            // Backup file is specified to database name
            RdbStore.backup(STORE_CONFIG.name).then(() => {
                console.info(TAG + 'Backup database finish');
                expect(false).assertTrue() ;
            }).catch((err) => {
                console.info(TAG + "Backup database error");
                expect(true).assertTrue() ;
                done();
            })
        })
        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0070
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0070', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0070 start *************")
            await RdbStore.backup(DATABASE_BACKUP_NAME)
            await dataRdb.deleteRdbStore(context, DATABASE_BACKUP_NAME)
            try{
                fileio.accessSync(DATABASE_DIR + DATABASE_BACKUP_NAME)
            }catch(err){
                expect(true).assertTrue();
            }
            await RdbStore.restore(DATABASE_BACKUP_NAME).catch((err) => {
                console.info(TAG + 'Restore fail: ' + err)
                expect(true).assertTrue();
            })
            done();
            console.info(TAG + "************* RdbBackupRestoreTest_0070 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0080
         * @tc.desc RDB restore function test
         */
        it('RdbBackupRestoreTest_0080', 0, async function (done) {
        console.info(TAG + "************* RdbBackupRestoreTest_0080 start *************")
        BackupTest()
        done();
        console.info(TAG + "************* RdbBackupRestoreTest_0080 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0090
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0090', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0090 start *************")
            BackupTest([DATABASE_BACKUP_NAME])
            done();
            console.info(TAG + "************* RdbBackupRestoreTest_0090 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0100
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0100', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0100 start *************")
            await RdbStore.backup(DATABASE_BACKUP_NAME)
            ReStoreTest([DATABASE_BACKUP_NAME])
            done();
            console.info(TAG + "************* RdbBackupRestoreTest_0100 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0110
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0110', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0110 start *************")
            await RdbStore.backup(DATABASE_BACKUP_NAME)
            ReStoreTest()
            done();
            console.info(TAG + "************* RdbBackupRestoreTest_0110 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0120
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0120', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0120 start *************")
            await RdbStore.backup(DATABASE_BACKUP_NAME)
            BackupTest(DATABASE_BACKUP_NAME)
            done();
            console.info(TAG + "************* RdbBackupRestoreTest_0120 end *************")
        })

        /**
         * @tc.name RDB BackupRestore test
         * @tc.number SUB_DDM_RDB_JS_RdbBackupRestoreTest_0130
         * @tc.desc RDB restore function test
         */
         it('RdbBackupRestoreTest_0130', 0, async function (done) {
            console.info(TAG + "************* RdbBackupRestoreTest_0130 start *************")
            await RdbStore.backup(DATABASE_BACKUP_NAME)
            await RdbStore.restore(DATABASE_BACKUP_NAME)
            ReStoreTest(DATABASE_BACKUP_NAME)
            done();
            console.info(TAG + "************* RdbBackupRestoreTest_0130 end *************")
        })
        console.info(TAG + "*************Unit Test End*************")
    })
}
