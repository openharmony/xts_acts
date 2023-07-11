/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";

const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
  name: "InsertTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

var rdbStore = undefined;
var resultSet = undefined;
var context = null;

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function InsertTest() {
  describe("InsertTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
      context = globalThis.abilityContext;
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.log("InsertTestrdbStore" + rdbStore);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    });

    beforeEach(async function () {
      console.info(TAG + "beforeEach");
      await rdbStore.executeSql("DELETE FROM test");
    });

    afterEach(async function () {
      console.info(TAG + "afterEach");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "InsertTest.db").then(() => {
        sleep(2);
      });
    });

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : TEST_RDB_STORE_VERSION_001
     * @tc.name   : testRdbStoreVersion001
     * @tc.desc   : RdbStore version test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("testRdbStoreVersion001", 0, async function (done) {
      console.log(TAG + "************* testRdbStoreVersion001 start *************");
      rdbStore.version = 3;
      expect(3).assertEqual(rdbStore.version);
      done();
      console.log(TAG + "************* testRdbStoreVersion001 end   *************");
    });

    /**
     * @tc.number : TEST_RDB_STORE_INSERT_001
     * @tc.name   : testRdbStoreInsert001
     * @tc.desc   : RdbStore insert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert001", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreInsert001 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        rdbStore.insert("test", valueBucket, async (err, rowId) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
            done();
          }
          try {
            console.info(`Insert is successful, rowId = ${rowId}`);
            let predicates = new relationalStore.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan");
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(1).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(18).assertEqual(age);
            expect(100.5).assertEqual(salary);
            expect(1).assertEqual(blobType[0]);
            expect(2).assertEqual(blobType[1]);
            expect(3).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("Insert error " + e);
          }
        });
      } catch (e) {
        console.info("Insert error " + e);
      }

      console.info(TAG + "************* testRdbStoreInsert001 end *************");
    });

    /**
     * @tc.number : TEST_RDB_STORE_INSERT_002
     * @tc.name   : testRdbStoreInsert002
     * @tc.desc   : RdbStore insert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert002", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreInsert002 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(2).assertEqual(id);
        expect("zhangsan").assertEqual(name);
        expect(18).assertEqual(age);
        expect(100.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("Insert error " + e);
      }
      console.info(TAG + "************* testRdbStoreInsert002 end *************");
    });

    /**
     * @tc.number : TEST_RDB_STORE_INSERT_003
     * @tc.name   : testRdbStoreInsert003
     * @tc.desc   : RdbStore insert callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert003", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreInsert003 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        // @ts-ignore
        rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, async (err, rowId) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
            done();
          }
          try {
            console.info(`Insert is successful, rowId = ${rowId}`);
            let predicates = new relationalStore.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan");
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(3).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(18).assertEqual(age);
            expect(100.5).assertEqual(salary);
            expect(1).assertEqual(blobType[0]);
            expect(2).assertEqual(blobType[1]);
            expect(3).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("Insert error " + e);
          }
        });
      } catch (e) {
        console.info("Insert error " + e);
      }

      console.info(TAG + "************* testRdbStoreInsert003 end *************");
    });

    /**
     * @tc.number : TEST_RDB_STORE_INSERT_004
     * @tc.name   : testRdbStoreInsert004
     * @tc.desc   : RdbStore insert promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreInsert004", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreInsert004 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        // @ts-ignore
        await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
        expect(4).assertEqual(id);
        expect("zhangsan").assertEqual(name);
        expect(18).assertEqual(age);
        expect(100.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("Insert error " + e);
      }
      console.info(TAG + "************* testRdbStoreInsert004 end *************");
    });

    /**
     * @tc.number : TEST_RDB_STORE_BATCH_INSERT_001
     * @tc.name   : testRdbStoreBatchInsert001
     * @tc.desc   : RdbStore batchInsert callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsert001", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreBatchInsert001 start *************");
      try {
        const valueBucket1 = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket2 = {
          name: "lisi",
          age: 23,
          salary: 200,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket3 = {
          name: "wangwu",
          age: 20,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
        rdbStore.batchInsert("test", valueBuckets, async (err, insertNum) => {
          if (err) {
            console.error(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
            done();
          }
          try {
            console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
            let predicates = new relationalStore.RdbPredicates("test");
            predicates.equalTo("name", "zhangsan");
            let resultSet = await rdbStore.query(predicates);
            console.info(TAG + "resultSet query done");
            expect(true).assertEqual(resultSet.goToFirstRow());
            const id = resultSet.getLong(resultSet.getColumnIndex("id"));
            const name = resultSet.getString(resultSet.getColumnIndex("name"));
            const age = resultSet.getLong(resultSet.getColumnIndex("age"));
            const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary + ", blobType=" + blobType);
            expect(5).assertEqual(id);
            expect("zhangsan").assertEqual(name);
            expect(18).assertEqual(age);
            expect(100.5).assertEqual(salary);
            expect(1).assertEqual(blobType[0]);
            expect(2).assertEqual(blobType[1]);
            expect(3).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("Insert error " + e);
          }
        });
      } catch (e) {
        console.info("BatchInsert error " + e);
      }
      console.info(TAG + "************* testRdbStoreBatchInsert001 end *************");
    });

    /**
     * @tc.number : TEST_RDB_STORE_BATCH_INSERT_002
     * @tc.name   : testRdbStoreBatchInsert002
     * @tc.desc   : RdbStore batchInsert promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreBatchInsert002", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreBatchInsert002 start *************");
      try {
        const valueBucket1 = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket2 = {
          name: "lisi",
          age: 23,
          salary: 200,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBucket3 = {
          name: "wangwu",
          age: 20,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
        await rdbStore.batchInsert("test", valueBuckets);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "lisi");
        let resultSet = await rdbStore.query(predicates);
        console.info(TAG + "resultSet query done");
        expect(true).assertEqual(resultSet.goToFirstRow());
        const id = resultSet.getLong(resultSet.getColumnIndex("id"));
        const name = resultSet.getString(resultSet.getColumnIndex("name"));
        const age = resultSet.getLong(resultSet.getColumnIndex("age"));
        const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        console.info(TAG + "id=" + id + ", name=" + name + ", age=" + age + ", salary=" + salary);
        expect(9).assertEqual(id);
        expect("lisi").assertEqual(name);
        expect(23).assertEqual(age);
        expect(200).assertEqual(salary);
        resultSet.close();
        done();
      } catch (e) {
        console.info("BatchInsert error " + e);
      }
      console.info(TAG + "************* testRdbStoreBatchInsert002 end *************");
    });
  });
}
