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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import dataRdb from '@ohos.data.rdb'
import featureAbility from '@ohos.ability.featureAbility'

const TAG = "[RDB_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
var u8 = new Uint8Array([1, 2, 3])
var rdbStore = null
var context = featureAbility.getContext()
const STORE_CONFIG = {
    name: "ResotreContextTest.db",
}
describe('rdbStoreContextTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(async function () {
        console.info(TAG + 'afterAll')
        rdbStore = null
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name rdb store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0010
     * @tc.desc rdb store getRdbStore test
     */
    it('testRdbStoreGetContext0001', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0001 start *************");
        let storeConfig = {
            name: "/wrong/rdbstore.db",
        }
        let getPromise = dataRdb.getRdbStore(context, STORE_CONFIG, 1);
        getPromise.then(async (store) => {
            console.info(TAG + "getRdbStore done: " + store);
        }).catch((err) => {
            console.info(err);
            expect(false).assertTrue();
        }).then(async () => {
            await dataRdb.deleteRdbStore(context, storeConfig.name).then(async (store) => {
                console.info(TAG + "deleteRdbStore done: " + store);
            }).catch((err) => {
                console.info(err);
                expect(false).assertTrue();
            })
        })
        await getPromise;
        done();
        console.info(TAG + "************* testRdbStoreGetContext0001 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStore and create table
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0020
     * @tc.desc rdb store getRdbStore and create table
     */
    it('testRdbStoreGetContext0002', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0002 start *************");
        const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        let getPromise = dataRdb.getRdbStore(context, STORE_CONFIG, 2);
        getPromise.then(async (store) => {
            try {
                console.info(TAG + "getRdbStore done: " + store);
                await store.executeSql(CREATE_TABLE_TEST).then(async () =>{
                    await store.insert("test", valueBucket).then((number) => {
                        expect(1).assertEqual(number);
                    })
                });
            } catch (e) {
                console.info(e);
            }
        }).then(async () => {
            await dataRdb.deleteRdbStore(context, STORE_CONFIG.name).catch((err) => {
                console.info(err);
                expect(false).assertTrue();
            })
        }).catch((err) => {
            console.info(err);
        })
        
        done();
        console.info(TAG + "************* testRdbStoreGetContext0002 end   *************");
    })

    /**
     * @tc.name rdb storegetRdbStore with wrong path
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0030
     * @tc.desc rdb store getRdbStore with wrong path
     */
    it('testRdbStoreGetContext0003', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0003 start *************");

        let storeConfig = {
            name: "/wrong/rdbstore.db",
        }
        dataRdb.getRdbStore(context,storeConfig, 1).then(() => {
            console.info(TAG + "getRdbStore done" + store);
            expect(false).assertTrue();
        }).catch(async (err) => {
            console.info(TAG + "getRdbStore with wrong path");
            expect(err).assertNotNull();
            dataRdb.deleteRdbStore(context, STORE_CONFIG.name).then(async (store) => {
                console.info(TAG + "deleteRdbStore done: " + store);
                expect(false).assertTrue();
            }).catch((err) => {
                expect(err).assertNotNull();
                console.info(err);
            })
        })
        done();
        console.info(TAG + "************* testRdbStoreGetContext0003 end   *************");
    })

    /**
     * @tc.name rdb store deleteRdbStore
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0040
     * @tc.desc rdb store deleteRdbStore
     */
    it('testRdbStoreGetContext0004', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0004 start *************");

        dataRdb.getRdbStore(context, STORE_CONFIG, 6).then(async (store) => {
            expect(store).assertNotNull();
        }).catch(async (err) => {
            console.info(TAG + "getRdbStore with wrong path" + err);
            dataRdb.deleteRdbStore(context, STORE_CONFIG.name).then(async (store) => {
                console.info(TAG + "deleteRdbStore done: " + store);
                expect(store).assertNotNull();
            }).catch((err) => {
                console.info(TAG + "deleteRdbStore err: " + err);
                expect(false).assertTrue();
            })
        })
        done();
        console.info(TAG + "************* testRdbStoreGetContext0004 end   *************");
    })

        /**
     * @tc.name rdb store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0010
     * @tc.desc rdb store getRdbStore test
     */
    it('testRdbStoreGetContext0005', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0005 start *************");
        const valueBucket = {
            "name": "lisi",
            "age": 20,
            "salary": 100.5,
            "blobType": u8,
        }
        dataRdb.getRdbStore(context, STORE_CONFIG, 1, function (err, rdbStore) {
            if (err != null) {
                console.info("Get RdbStore failed, err: " + err)
                expect(false).assertTrue();
            }else{
                rdbStore.executeSql(CREATE_TABLE_TEST).then(async () => {
                    await rdbStore.insert("test",valueBucket).then((number) => {
                        expect(number).assertEqual(1)
                    })
                })
            }
            console.info("Get RdbStore successfully.")
        })
        dataRdb.deleteRdbStore(context, STORE_CONFIG.name, function (err, data) {
            if (err) {
                console.info("Delete RdbStore failed, err: " + err)
                expect(false).assertTrue();
            }
            console.info("Delete RdbStore end.")
        })
        done();
        console.info(TAG + "************* testRdbStoreGetContext0005 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStore and create table
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0020
     * @tc.desc rdb store getRdbStore and create table
     */
    it('testRdbStoreGetContext0006', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0006 start *************");
        let storeConfig = {
            name: "/wrong/rdbstore.db",
        }
        try{
            dataRdb.getRdbStore(context, storeConfig, 2, function (err, rdbStore) {
                if (err) {
                    console.info("Get RdbStore failed, err: " + err)
                    expect(false).assertTrue();
                }
                console.info("Get RdbStore successfully.")
            })
        }catch(err){
            console.info(TAG + "testRdbStoreGetContext0006 error: "  + err);
            expect(err).assertNotNull();
        }
        done();
        console.info(TAG + "************* testRdbStoreGetContext0006 end   *************");
    })

    /**
     * @tc.name rdb storegetRdbStore with wrong path
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0030
     * @tc.desc rdb store getRdbStore with wrong path
     */
    it('testRdbStoreGetContext0007', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0007 start *************");

        let storeConfig = {
            name: "/wrong/rdbstore.db",
        }
        dataRdb.getRdbStore(context, storeConfig, 2, function (err, rdbStore) {
            if (err) {
                console.info("Get RdbStore failed, err: " + err)
                expect(err).assertNotNull();
            }else{
                console.info("Get RdbStore failed, success: " + err)
                expect(false).assertTrue();
            }
            console.info("Get RdbStore successfully.")
            
        })
        dataRdb.deleteRdbStore(context, STORE_CONFIG.name, function (err, rdbStore) {
            if (err) {
                console.info("Delete RdbStore failed, err: " + err)
                expect(err).assertNotNull();
            }
            console.info("Delete RdbStore successfully.")
            
        })
        done();
        console.info(TAG + "************* testRdbStoreGetContext0007 end   *************");
    })

    /**
     * @tc.name rdb store deleteRdbStore
     * @tc.number SUB_DDM_AppDataFWK_JSRDB_RdbStore_0040
     * @tc.desc rdb store deleteRdbStore
     */
    it('testRdbStoreGetContext0008', 0, async function (done) {
        console.info(TAG + "************* testRdbStoreGetContext0008 start *************");

        dataRdb.getRdbStore(context, STORE_CONFIG, 6, function (err, rdbStore) {
            if (err) {
                console.info("Get RdbStore failed, err: " + err)
            }else{
                expect(false).assertTrue();
            }
            console.info("Get RdbStore successfully.")
            
        })
        dataRdb.deleteRdbStore(context, STORE_CONFIG.name, function (err, rdbStore) {
            if (err) {
                console.info("Delete RdbStore failed, err: " + err)
            }else{
                expect(false).assertTrue();
            }
            console.info("Delete RdbStore successfully.")
            
        })
        done();
        console.info(TAG + "************* testRdbStoreGetContext0008 end   *************");
    })
    console.info(TAG + "*************Unit Test End*************");
})