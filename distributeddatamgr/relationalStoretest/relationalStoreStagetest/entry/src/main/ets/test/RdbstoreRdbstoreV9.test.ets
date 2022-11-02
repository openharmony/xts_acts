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
import dataRdb from '@ohos.data.rdb';

const TAG = "[RDB_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export default function rdbStoreV9Test(context){
describe('rdbStoreV9Test', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(function () {
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S1
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0100
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S1
     * @tc.require: I5PIL6
     */
    it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0100', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0100 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S1
        }
        let storePromise = dataRdb.getRdbStoreV9(context, config, 1);
        storePromise.then(async (store) => {
            try {
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (err) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        await storePromise
        storePromise = null
        await dataRdb.deleteRdbStore(context,"secure.db");
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0100 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S2
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0200
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S2
     * @tc.require: I5PIL6
     */
     it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0200', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0200 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S2
        }
        let storePromise = dataRdb.getRdbStoreV9(context, config, 1);
        storePromise.then(async (store) => {
            try {
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (err) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        await storePromise
        storePromise = null
        await dataRdb.deleteRdbStore(context,"secure.db");
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0200 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S3
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0300
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S3
     * @tc.require: I5PIL6
     */
    it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0300', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0300 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S3
        }
        let storePromise = dataRdb.getRdbStoreV9(context, config, 1);
        storePromise.then(async (store) => {
            try {
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (err) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        await storePromise
        storePromise = null
        await dataRdb.deleteRdbStore(context,"secure.db");
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0300 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S4
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0400
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S4
     * @tc.require: I5PIL6
     */
    it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0400', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0400 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S4
        }
        let storePromise = dataRdb.getRdbStoreV9(context, config, 1);
        storePromise.then(async (store) => {
            try {
                await store.executeSql(CREATE_TABLE_TEST);
            } catch (err) {
                expect(null).assertFail();
            }
        }).catch((err) => {
            expect(null).assertFail();
        })
        await storePromise
        storePromise = null
        await dataRdb.deleteRdbStore(context,"secure.db");
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_PROMISE_0400 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S1
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0100
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S1
     * @tc.require: I5PIL6
     */
     it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0100', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0100 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S1
        }
        dataRdb.getRdbStoreV9(context, config, 1, async (err,data) => {
            if(err != null){
                console.info(TAG + "get rdb store error" + err.message)
                expect(null).assertFail();
            }else{
                console.info(TAG + "create table success")
            }
            done();
        });
        await dataRdb.deleteRdbStore(context,"secure.db");
        await sleep(1000)
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0100 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S2
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0200
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S2
     * @tc.require: I5PIL6
     */
     it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0200', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0200 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S2
        }
        dataRdb.getRdbStoreV9(context, config, 1,async (err,data) => {
            if(err != null){
                console.info(TAG + "get rdb store error")
                expect(null).assertFail();
            }else{
                console.info(TAG + "create table success")
            }
            done();
        });
        await dataRdb.deleteRdbStore(context,"secure.db");
        await sleep(1000)
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0200 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S3
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0300
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S3
     * @tc.require: I5PIL6
     */
     it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0300', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0300 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S3
        }
        dataRdb.getRdbStoreV9(context, config, 1,async (err,data) => {
            if(err != null){
                console.info(TAG + "get rdb store error")
                expect(null).assertFail();
            }else{
                console.info(TAG + "create table success")
            }
            done();
        });
        await dataRdb.deleteRdbStore(context,"secure.db");
        await sleep(1000)
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0300 end   *************");
    })

    /**
     * @tc.name rdb store getRdbStoreV9 with securityLevel S4
     * @tc.number SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0400
     * @tc.desc rdb store getRdbStoreV9 with securityLevel S4
     * @tc.require: I5PIL6
     */
     it('SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0400', 0, async function (done) {
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0400 start *************");
        let config = {
            name: "secure.db",
            securityLevel: dataRdb.SecurityLevel.S4
        }
        dataRdb.getRdbStoreV9(context, config, 1,async (err,data) => {
            if(err != null){
                console.info(TAG + "get rdb store error")
                expect(null).assertFail();
            }else{
                console.info(TAG + "create table success")
            }
            done();
        });
        await dataRdb.deleteRdbStore(context,"secure.db");
        await sleep(1000)
        done();
        console.log(TAG + "************* SUB_DDM_RELATIONALETS_GETRDBSTOREV9_CALLBACK_0400 end   *************");
    })
    console.log(TAG + "*************Unit Test End*************");
})
}