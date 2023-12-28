/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import relationalStore from '@ohos.data.relationalStore';
import ability_featureAbility from '@ohos.ability.featureAbility'

const TAG = "[RelationalStoreCloudCursor_Test]";
const STORE_NAME = "cursor_rdb.db";
var rdbStore = undefined;
var context = ability_featureAbility.getContext();

export default function relationalStoreCloudCursor() {
    describe('relationalStoreCloudCursor', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
            const config = {
                "name": STORE_NAME,
                securityLevel: relationalStore.SecurityLevel.S1,
                autoCleanDirtyData: false,
            }
            try {
                rdbStore = await relationalStore.getRdbStore(context, config);
                console.log(TAG + "create rdb store success")
                let sql = "CREATE TABLE IF NOT EXISTS query_tb (" +
                    "data TEXT, " +
                    "recycled BOOLEAN, " +
                    "recycledTime INTEGER, " +
                    "uuid TEXT PRIMARY KEY)";
                await rdbStore.executeSql(sql, null);
                console.log(TAG + "create table query_tb success");
                const setConfig = {
                    autoSync: false,
                }
                await rdbStore.setDistributedTables(
                    ["query_tb"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, setConfig);
                    console.log(TAG + "setDistributedTables table query_tb success");
            } catch (err) {
                console.log(TAG + `failed, err: ${JSON.stringify(err)}`)
                expect().assertFail()
            }
        })
    
        beforeEach(async function () {
            console.info(TAG + 'beforeEach');
            try {
                let vBucketArray1 = new Array();
                for (let i = 0; i < 5; i++) {
                    let valueBucket = {
                        "data": "cloud_cursor_insert",
                        "recycled": true,
                        "recycledTime": 12345,
                        "uuid": "test_key" + i.toString(),
                    }
                    vBucketArray1.push(valueBucket);
                }
                await rdbStore.batchInsert("query_tb", vBucketArray1);
                console.log(TAG + "batchInsert query_tb success");
            } catch (err) {
                console.log(TAG + `insert failed, err: ${JSON.stringify(err)}`)
                expect().assertFail()
            }
        })
    
        afterEach(async function () {
            console.info(TAG + 'afterEach');
            try {
                let predicates = new relationalStore.RdbPredicates("query_tb");
                predicates.equalTo("data", "cloud_cursor_insert");
                await rdbStore.delete(predicates);
                console.log(TAG + "delete table query_tb success");
            } catch (err) {
                console.log(TAG + `delete failed, err: ${JSON.stringify(err)}`)
                expect().assertFail()
            }
        })
    
        afterAll(async function () {
            console.info(TAG + 'afterAll');
            rdbStore = null;
            await rdbStore.deleteRdbStore(context, STORE_NAME);
            console.log(TAG + "deleteRdbStore success");
        })
    
        console.log(TAG + "*************Unit Test Begin*************");
        /**
         * @tc.name query with cursor
         * @tc.number  SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0100
         * @tc.desc query with cursor, and get all columns.
         */
        it('testRdbQueryWithCursor0001', 0, async function (done) {
            console.log(TAG + "************* testRdbQueryWithCursor0001 start *************");
    
            let predicates = new relationalStore.RdbPredicates("query_tb");
            predicates.greaterThan(relationalStore.Field.CURSOR_FIELD, 0);
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbQueryWithCursor0001 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let promise = rdbStore.query(predicates);
            await promise.then((resultSet) => {
                expect(6).assertEqual(resultSet.columnCount);
                let deletedIndex = resultSet.getColumnIndex(relationalStore.Field.DELETED_FLAG_FIELD);
                expect(5).assertEqual(deletedIndex);
                let cursorIndex = resultSet.getColumnIndex(relationalStore.Field.CURSOR_FIELD);
                expect(4).assertEqual(cursorIndex);
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed);
                done();
            }).catch((err) => {
                console.log(TAG + `testRdbQueryWithCursor0001 query cursor fail, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            });
            console.log(TAG + "************* testRdbQueryWithCursor0001 end *************");
        })
    
        /**
         * @tc.name query with cursor
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0200
         * @tc.desc query with cursor, and specific columns.
         */
        it('testRdbQueryWithCursor0002', 0, async function (done) {
            console.log(TAG + "************* testRdbQueryWithCursor0002 start *************");
    
            let predicates = new relationalStore.RdbPredicates("query_tb");
            predicates.greaterThan(relationalStore.Field.CURSOR_FIELD, 0);
            predicates.orderByAsc(relationalStore.Field.CURSOR_FIELD);
            predicates.orderByAsc("data");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbQueryWithCursor0002 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let promise = rdbStore.query(predicates, ["data", "uuid"]);
            await promise.then((resultSet) => {
                expect(4).assertEqual(resultSet.columnCount);
                expect(true).assertEqual(resultSet.goToFirstRow());
                expect(true).assertEqual(resultSet.goToNextRow());
                let cursor = resultSet.getLong(resultSet.getColumnIndex(relationalStore.Field.CURSOR_FIELD));
                expect(12).assertEqual(cursor);
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed);
                done();
            }).catch((err) => {
                console.log(TAG + `testRdbQueryWithCursor0002 query cursor fail, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            });
            console.log(TAG + "************* testRdbQueryWithCursor0002 end *************");
        })
    
        /**
         * @tc.name query with cursor
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0300
         * @tc.desc update data, and query with cursor.
         */
        it('testRdbQueryWithCursor0003', 0, async function (done) {
            console.log(TAG + "************* testRdbQueryWithCursor0003 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbQueryWithCursor0003 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            const valueBucket = {
                "recycledTime": "1234567890",
            }
            let updatePredicates = new relationalStore.RdbPredicates("query_tb");
            updatePredicates.equalTo("uuid", "test_key1");
            updatePredicates.or();
            updatePredicates.equalTo("uuid", "test_key2");
            await rdbStore.update(valueBucket, updatePredicates);
            console.log(TAG + `testRdbQueryWithCursor0003 update end.`);
            let predicates = new relationalStore.RdbPredicates("query_tb");
            predicates.greaterThanOrEqualTo(relationalStore.Field.CURSOR_FIELD, 26);
            predicates.equalTo(relationalStore.Field.ORIGIN_FIELD, relationalStore.Origin.LOCAL);
            predicates.orderByDesc(relationalStore.Field.CURSOR_FIELD);
            let promise = rdbStore.query(predicates);
            await promise.then((resultSet) => {
                expect(true).assertEqual(resultSet.goToFirstRow());
                let value1 = resultSet.getString(resultSet.getColumnIndex("recycledTime"));
                expect("1234567890").assertEqual(value1);
                expect(true).assertEqual(resultSet.goToNextRow());
                let value2 = resultSet.getString(resultSet.getColumnIndex("recycledTime"));
                expect("1234567890").assertEqual(value2);
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed);
                done();
            }).catch((err) => {
                console.log(TAG + `testRdbQueryWithCursor0003 query cursor fail, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            });
            console.log(TAG + "************* testRdbQueryWithCursor0003 end *************");
        })
    
        /**
         * @tc.name query with cursor
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0400
         * @tc.desc delete data, and query with cursor.
         */
        it('testRdbQueryWithCursor0004', 0, async function (done) {
            console.log(TAG + "************* testRdbQueryWithCursor0004 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbQueryWithCursor0004 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let deletedPred = new relationalStore.RdbPredicates("query_tb");
            deletedPred.equalTo("uuid", "test_key3");
            await rdbStore.delete(deletedPred);
            console.log(TAG + `delete end.`);
            let predicates = new relationalStore.RdbPredicates("query_tb");
            predicates.greaterThan(relationalStore.Field.CURSOR_FIELD, 37);
            predicates.orderByAsc(relationalStore.Field.CURSOR_FIELD);
            try {
                rdbStore.query(predicates, (err, resultSet) => {
                    expect(0).assertEqual(resultSet.rowCount);
                    resultSet.close();
                    expect(true).assertEqual(resultSet.isClosed);
                })
                done();
            } catch(err) {
                console.log(TAG + `testRdbQueryWithCursor0004 query cursor fail, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            }
            console.log(TAG + "************* testRdbQueryWithCursor0004 end *************");
        })
    
        /**
         * @tc.name query with cursor
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0500
         * @tc.desc query with cursor and origin.
         */
        it('testRdbQueryWithCursor0005', 0, async function (done) {
            console.log(TAG + "************* testRdbQueryWithCursor0005 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbQueryWithCursor0005 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let predicates = new relationalStore.RdbPredicates("query_tb");
            predicates.greaterThan(relationalStore.Field.CURSOR_FIELD, 0);
            predicates.and();
            predicates.beginWrap();
            predicates.equalTo(relationalStore.Field.ORIGIN_FIELD, relationalStore.Origin.CLOUD);
            predicates.or();
            predicates.equalTo(relationalStore.Field.ORIGIN_FIELD, relationalStore.Origin.REMOTE);
            predicates.endWrap();
            predicates.orderByAsc(relationalStore.Field.CURSOR_FIELD);
            try {
                rdbStore.query(predicates, (err, resultSet) => {
                    expect(0).assertEqual(resultSet.rowCount);
                    resultSet.close();
                    expect(true).assertEqual(resultSet.isClosed);
                })
                done();
            } catch(err) {
                console.log(TAG + `testRdbQueryWithCursor0005 query cursor fail, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            }
            console.log(TAG + "************* testRdbQueryWithCursor0005 end *************");
        })
        /**
         * @tc.name clean retain data with specified cursor.
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0600
         * @tc.desc clean retain data with specified cursor promise.
         */
         it('testRdbCleanDirtyData0001', 0, async function (done) {
            console.log(TAG + "************* testRdbCleanDirtyData0001 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbCleanDirtyData0001 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let cursor = 3;
            let promise = rdbStore.cleanDirtyData("query_tb", cursor);
            await promise.then((err) => {
                console.log(TAG + `testRdbCleanDirtyData0001 cleanDirtyData success`);
                done();
            }).catch((err) => {
                console.log(TAG + `testRdbCleanDirtyData0001 cleanDirtyData fail, errcode: ${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            });
            console.log(TAG + "************* testRdbCleanDirtyData0001 end *************");
        })
    
        /**
         * @tc.name clean retain data
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0700
         * @tc.desc clean retain data promise.
         */
        it('testRdbCleanDirtyData0002', 0, async function (done) {
            console.log(TAG + "************* testRdbCleanDirtyData0002 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbCleanDirtyData0002 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let promise = rdbStore.cleanDirtyData("query_tb");
            await promise.then((err) => {
                console.log(TAG + `testRdbCleanDirtyData0002 cleanDirtyData success`);
                done();
            }).catch((err) => {
                console.log(TAG + `testRdbCleanDirtyData0002 cleanDirtyData fail, errcode:${JSON.stringify(err)}.`);
                expect().assertFail();
                done();
            });
            console.log(TAG + "************* testRdbCleanDirtyData0002 end *************");
        })

        /**
         * @tc.name clean retain data
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0800
         * @tc.desc clean retain data callback.
         */
        it('testRdbCleanDirtyData0003', 0, async function (done) {
            console.log(TAG + "************* testRdbCleanDirtyData0003 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbCleanDirtyData0003 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            rdbStore.cleanDirtyData("query_tb", (err) =>{
                if (err) {
                    console.log(TAG + `testRdbCleanDirtyData0003 cleanDirtyData fail, errcode: ${JSON.stringify(err)}.`);
                    expect().assertFail();
                    done();
                  }
                console.log(TAG + `testRdbCleanDirtyData0003 cleanDirtyData success`);
            })
            done();
            console.log(TAG + "************* testRdbCleanDirtyData0003 end *************");
        })

        /**
         * @tc.name clean retain data with specified cursor.
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudCursorJsAPITest_0900
         * @tc.desc clean retain data with specified cursor callback.
         */
         it('testRdbCleanDirtyData0004', 0, async function (done) {
            console.log(TAG + "************* testRdbCleanDirtyData0004 start *************");
            if (rdbStore == undefined) {
                console.log(TAG + "testRdbCleanDirtyData0004 rdbStore == undefined");
                expect().assertFail();
                return;
            }
            let cursor = 3;
            rdbStore.cleanDirtyData("query_tb",cursor,(err) =>{
                if (err) {
                    console.log(TAG + `testRdbCleanDirtyData0004 cleanDirtyData fail, errcode:${JSON.stringify(err)}.`);
                    expect().assertFail();
                    done();
                  }
                console.log(TAG + `testRdbCleanDirtyData0004 cleanDirtyData success`);
            })
            done();
            console.log(TAG + "************* testRdbCleanDirtyData0004 end *************");
        })
        console.log(TAG + "*************Unit Test End*************");
    })
}

 