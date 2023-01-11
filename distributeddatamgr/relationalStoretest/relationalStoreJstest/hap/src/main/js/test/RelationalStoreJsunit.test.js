/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import data_Rdb from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility';


var context = ability_featureAbility.getContext();
var contextApplication = context.getApplicationContext()
const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG = {
    name: "rdbstore.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default function relationalStoreTest() {
describe('relationalStoreTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(async function () {
        console.info(TAG + 'afterAll')
        await data_Rdb.deleteRdbStore(context,"rdbstore.db");
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name RelationalStore store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0010
     * @tc.desc RelationalStore store getRdbStore test
     */
    it('testRdbStore0001', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0001 start *************");
        await data_Rdb.getRdbStore(context, STORE_CONFIG).then(async (store) => {
            try {
                console.info(TAG + "getRdbStore done: " + store);
            } catch (e) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        done();
        console.info(TAG + "************* testRdbStore0001 end   *************");
    })

    /**
     * @tc.name RelationalStore store getRdbStore and create table
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0020
     * @tc.desc RelationalStore store getRdbStore and create table
     */
    it('testRdbStore0002', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0002 start *************");
        let storePromise = data_Rdb.getRdbStore(context, STORE_CONFIG);
        storePromise.then(async (store) => {
            try {
                console.info(TAG + "getRdbStore done: " + store);
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (e) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        await storePromise
        storePromise = null
        done();
        console.info(TAG + "************* testRdbStore0002 end   *************");
    })

    /**
     * @tc.name RelationalStore storegetRdbStore with wrong path
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0030
     * @tc.desc RelationalStore store getRdbStore with wrong path
     */
    it('testRdbStore0003', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0003 start *************");

        let storeConfig = {
            name: "/wrong/rdbstore.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        }
        try{
            data_Rdb.getRdbStore(context, storeConfig).then(async (ret) => {
                console.info(TAG + "getRdbStore done" + ret);
                expect(null).assertFail();
            }).catch((err) => {
                console.info(TAG + "getRdbStore with wrong path");
            })
            expect(false).assertTrue();
        }catch(error){
            console.info(TAG + `catch err: failed: err: code= ${error.code}, message = ${error.message}`)
            expect(error.code).assertEqual("401")
            done();
            console.info(TAG + "************* testRdbStore0003 end   *************");
        }
    })

    /**
     * @tc.name RelationalStore store deleteRdbStore
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0040
     * @tc.desc RelationalStore store deleteRdbStore
     */
    it('testRdbStore0004', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0004 start *************");
        try{
            let store =  await data_Rdb.getRdbStore(context, STORE_CONFIG)
            await store.executeSql(CREATE_TABLE_TEST);
            await data_Rdb.deleteRdbStore(context, "rdbstore.db")
        }catch (e) {
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStore0004 end   *************");
    })

    /**
     * @tc.name RelationalStore store deleteRdbStore
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0050
     * @tc.desc RelationalStore store deleteRdbStore
     */
    it('testRdbStore0005', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0005 start *************");
        try {
            let store = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info(TAG + "Get rdbstore success")
            await store.executeSql(CREATE_TABLE_TEST);
            await data_Rdb.deleteRdbStore(context, "rdbstore.db")
        } catch (e) {
            expect(null).assertFail();
        }
        done();
        console.info(TAG + "************* testRdbStore0005 end   *************");
    })

    /**
     * @tc.name RelationalStore store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0060
     * @tc.desc RelationalStore store getRdbStore test
     */
     it('testRdbStore0006', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0006 start *************");
        let rdbstore = null;
        try{
            const STORE_CONFIG= {
                name: "rdbstorecontext.db",
                securityLevel: data_Rdb.SecurityLevel.S1
            }
            rdbstore = await data_Rdb.getRdbStore(context,STORE_CONFIG)
            console.info(TAG + "Get rdbstore success")
            expect(rdbstore != null).assertTrue();
            await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        }catch(err){
            console.info(TAG + "Get rdbstore fail catch err: " + err)
            expect(null).assertFail()
        }
        rdbstore = null;
        done();
        console.info(TAG + "************* testRdbStore0006 end   *************");
    })

    /**
     * @tc.name RelationalStore store getRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0070
     * @tc.desc RelationalStore store getRdbStore test
     */
    it('testRdbStore0007', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0007 start *************");
        let rdbstore = null;
        try{
            const STORE_CONFIG = {
                name: "rdbstorecontext.db",
                securityLevel: data_Rdb.SecurityLevel.S1
            }
            rdbstore = await data_Rdb.getRdbStore(contextApplication,STORE_CONFIG)
            console.info(TAG + "Get rdbstore success")
            expect(rdbstore != null).assertTrue();
            await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        }catch(err){
            console.info(TAG + "Get rdbstore fail catch err: " + err)
            expect(null).assertFail()
        }
        rdbstore = null;
        done();
        console.info(TAG + "************* testRdbStore0007 end   *************");
    })

    /**
     * @tc.name RelationalStore store deleteRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0080
     * @tc.desc RelationalStore store deleteRdbStore test
     */
    it('testRdbStore0008', 0, async function (done) {
        console.info(TAG + "************* testRdbStore0008 start *************");
        data_Rdb.getRdbStore(context, STORE_CONFIG, async (err,data) => {
            console.info(TAG + "getRdbStore finish")
            console.info(TAG + "getRdbStore success: " + data)
            expect(data != null).assertTrue();
            await data_Rdb.deleteRdbStore(contextApplication, STORE_CONFIG.name)
            done();
            console.info(TAG + "************* testRdbStore0008 end   *************");
        });
        await sleep(1000)
    })

    /**
     * @tc.name RelationalStore store deleteRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0090
     * @tc.desc RelationalStore store deleteRdbStore test
     */
    it('testRdbStore0009', 0, async function(done){
        console.info(TAG + "************* testRdbStore0009 start *************");
        data_Rdb.getRdbStore(contextApplication, STORE_CONFIG, async (err,data) => {
            console.info(TAG + "getRdbStore finish")
            console.info(TAG + "getRdbStore success: " + data)
            expect(data != null).assertTrue();
            await data_Rdb.deleteRdbStore(contextApplication, STORE_CONFIG.name)
            done();
            console.info(TAG + "************* testRdbStore0009 end   *************");
        });
        await sleep(1000)
    })

    /**
     * @tc.name RelationalStore store deleteRdbStore test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0100
     * @tc.desc RelationalStore store deleteRdbStore test
    */
    it('testRdbStore0010', 0, async function(done){
        console.info(TAG + "************* testRdbStore0010 start *************");
        await data_Rdb.getRdbStore(contextApplication, STORE_CONFIG, async function(err,rdbStore){
            if (err) {
                console.info("Get testRdbStore0010 failed, err: " + err)
                expect().assertFail();
                return
            }
            if (rdbStore.openStatus == data_Rdb.OpenStatus.ON_CREATE) {
                console.log("testRdbStore0010 status is ON_CREATE")
                expect(true).assertTrue();
            } else if (rdbStore.openStatus == data_Rdb.OpenStatus.ON_OPEN) {
                console.log("testRdbStore0010 status is ON_OPEN")
                expect().assertFail();
            } else {
                expect().assertFail();
                return
            }
            console.log("Get testRdbStore0010 successfully.")
        });
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        done();
        console.log("Get testRdbStore0010 successfully end.")
        await sleep(1000)
    })

    /**
     * @tc.name RelationalStore store RelationalStore.OpenStatus test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0110
     * @tc.desc RelationalStore store RelationalStore.OpenStatus test
    */
    it('testRdbStore0011', 0, async function(done){
        console.info(TAG + "************* testRdbStore0011 start *************");
        await data_Rdb.getRdbStore(contextApplication, STORE_CONFIG, async function(err,rdbStore){
            if (err) {
                console.info("Get testRdbStore0011 failed, err: " + err)
                return
            }
            if (rdbStore.openStatus == data_Rdb.OpenStatus.ON_CREATE) {
                console.log("testRdbStore0011 status1 is ON_CREATE")
            } else if (rdbStore.openStatus == data_Rdb.OpenStatus.ON_OPEN) {
                console.log("testRdbStore0011 status1 is ON_OPEN")
            } else {
                expect().assertFail();
                return
            }
        });
        await data_Rdb.getRdbStore(contextApplication, STORE_CONFIG, async function(err,rdbStore){
            if (err) {
                console.info("Get testRdbStore0011 failed, err: " + err)
                expect().assertFail();
                return
            }
            if (rdbStore.openStatus == data_Rdb.OpenStatus.ON_CREATE) {
                console.log("testRdbStore0011 status is ON_CREATE")
                expect().assertFail();
            } else if (rdbStore.openStatus ==data_Rdb.OpenStatus.ON_OPEN) {
                console.log("testRdbStore0011 status is ON_OPEN")
                expect(true).assertTrue();
            } else {
                expect().assertFail();
                return
            }
        });
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        done();
        console.log("Get testRdbStore0011 successfully end.")
    })

    /**
     * @tc.name RelationalStore store RelationalStore.OpenStatus test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0120
     * @tc.desc RelationalStore store RelationalStore.OpenStatus test
    */
     it('testRdbStore0012', 0, async function(done){
        console.info(TAG + "************* testRdbStore0012 start *************");
        try{
            let promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            promise =null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info("Get testRdbStore0012 promise.openStatus: " + promise.openStatus)
            console.info("Get testRdbStore0012 data_Rdb.OpenStatus.ON_OPEN: " + data_Rdb.OpenStatus.ON_OPEN)
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_OPEN);
            await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        }catch(err){
            console.info(TAG + "Get rdbstore fail catch err: " + err)
            expect(null).assertFail()
        }
        done();
        console.log("Get testRdbStore0012 successfully end.")
    })

    /**
     * @tc.name RelationalStore store RelationalStore.OpenStatus test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0130
     * @tc.desc RelationalStore store RelationalStore.OpenStatus test
    */
     it('testRdbStore0013', 0, async function(done){
        console.info(TAG + "************* testRdbStore0013 start *************");
        let STORE_CONFIG1 = {
            name: "rdbnumber.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        }
        try{
            let promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info("Get testRdbStore0013 STORE_CONFIG promise.openStatus: " + promise.openStatus)
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
            console.info("Get testRdbStore0013 STORE_CONFIG1 promise.openStatus: " + promise.openStatus)
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
        }catch(err){
            console.info(TAG + "Get testRdbStore0013 fail catch err: " + err)
            expect(null).assertFail()
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG1.name)
        done();
        console.log("Get testRdbStore0013 successfully end.")
    })
            
    /**
     * @tc.name RelationalStore store RelationalStore.OpenStatus test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0140
     * @tc.desc RelationalStore store RelationalStore.OpenStatus test
    */
     it('testRdbStore0014', 0, async function(done){
        console.info(TAG + "************* testRdbStore0014 start *************");
        let STORE_CONFIG1 = {
            name: "rdbnumber.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        }
        try{
            let promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info("Get testRdbStore0014 STORE_CONFIG promise.openStatus: " + promise.openStatus)
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
            // expect(promise.openStatus != data_Rdb.OpenStatus.ON_CREATE).assertFail();
            promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
            console.info("Get testRdbStore0014 STORE_CONFIG1 promise.openStatus: " + promise.openStatus)
            // expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
        }catch(err){
            console.info(TAG + "Get testRdbStore0014 fail catch err: " + err)
            expect(null).assertFail()
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG1.name)
        done();
        console.log("Get testRdbStore0014 successfully end.")
    })

    /**
     * @tc.name RelationalStore store RelationalStore.OpenStatus test
     * @tc.number SUB_DDM_AppDataFWK_JSRelationalStore_RdbStore_0150
     * @tc.desc RelationalStore store RelationalStore.OpenStatus test
    */
     it('testRdbStore0015', 0, async function(done){
        console.info(TAG + "************* testRdbStore0012 start *************");
        let STORE_CONFIG1 = {
            name: "rdbnumber.db",
            securityLevel: data_Rdb.SecurityLevel.S1
        }
        try{
            let promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info("Get testRdbStore0015 STORE_CONFIG promise.openStatus: " + promise.openStatus)
            // expect(promise.openStatus != data_Rdb.OpenStatus.ON_CREATE).assertFail();
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
            console.info("Get testRdbStore0015 STORE_CONFIG1 promise.openStatus: " + promise.openStatus)
            // expect(promise.openStatus != data_Rdb.OpenStatus.ON_CREATE).assertFail();
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_CREATE);
            promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info("Get testRdbStore0015 STORE_CONFIG promise.openStatus: " + promise.openStatus)
            // expect(promise.openStatus != data_Rdb.OpenStatus.ON_OPEN).assertFail();
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_OPEN);
            promise = null;
            promise = await data_Rdb.getRdbStore(context, STORE_CONFIG1);
            console.info("Get testRdbStore0015 STORE_CONFIG1 promise.openStatus: " + promise.openStatus)
            expect(promise.openStatus).assertEqual(data_Rdb.OpenStatus.ON_OPEN);
        }catch(err){
            console.info(TAG + "Get testRdbStore0015 fail catch err: " + err)
            expect(null).assertFail()
        }
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG.name)
        await data_Rdb.deleteRdbStore(context, STORE_CONFIG1.name)
        done();
        console.log("Get testRdbStore0015 successfully end.")
    })
    
    console.info(TAG + "*************Unit Test End*************");
})}
