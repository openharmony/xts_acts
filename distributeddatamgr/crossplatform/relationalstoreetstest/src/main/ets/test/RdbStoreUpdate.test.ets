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
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT UNIQUE, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
  name: "UpdataTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

let rdbStore = undefined;

export default function rdbStoreUpdateTest() {
  describe("rdbStoreUpdateTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
    });

    beforeEach(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    });

    afterEach(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "UpdataTest.db");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    async function createTest() {
      console.info(TAG + "createTest start");
      {
        var u8 = new Uint8Array([1, 2, 3]);
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: u8,
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0100
     * @tc.name   : testRdbStoreUpdate001
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate001", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate001 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertTrue();
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
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
            expect("lisi").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0200
     * @tc.name   : testRdbStoreUpdate002
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate002", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate002 start *************");
      try {
        const emptyBucket = {};

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(emptyBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is 6").assertTrue();
            console.info(TAG + "update with wrong valueBucket");
            done();
          }
          console.info(`Updated row count: ${rows}`);
        });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0300
     * @tc.name   : testRdbStoreUpdate003
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate003", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate003 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        await predicates.equalTo("aaa", "null");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is -1").assertTrue();
            console.info(TAG + "update with wrong condition");
            done();
          }
          console.info(`Updated row count: ${rows}`);
        });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0400
     * @tc.name   : testRdbStoreUpdate004
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate004", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate004 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("wrongTable");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is -1").assertTrue();
            console.info(TAG + "update with wrong table name");
            done();
          }
          console.info(`Updated row count: ${rows}`);
        });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0500
     * @tc.name   : testRdbStoreUpdate005
     * @tc.desc   : RdbStore update callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate005", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate005 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is -1").assertTrue();
            console.info(TAG + "update with wrong column name");
            done();
          }
          console.info(`Updated row count: ${rows}`);
        });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      done();
      console.info(TAG + "************* testRdbStoreUpdate005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0600
     * @tc.name   : testRdbStoreUpdate006
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate006", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate006 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates);
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
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0700
     * @tc.name   : testRdbStoreUpdate007
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate007", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate007 start *************");
      try {
        const emptyBucket = {};

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        let promise = rdbStore.update(emptyBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is 6").assertTrue();
            console.info(TAG + "update with wrong valueBucket");
            done();
          });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate007 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0800
     * @tc.name   : testRdbStoreUpdate008
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate008", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate008 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        await predicates.equalTo("aaa", "null");
        let promise = rdbStore.update(valueBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is -1").assertTrue();
            console.info(TAG + "update with wrong condition");
            done();
          });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate008 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_0900
     * @tc.name   : testRdbStoreUpdate009
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate009", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate009 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("wrongTable");
        predicates.equalTo("id", "1");
        let promise = rdbStore.update(valueBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is -1").assertTrue();
            console.info(TAG + "update with null table name");
            done();
          });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate009 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_1000
     * @tc.name   : testRdbStoreUpdate010
     * @tc.desc   : RdbStore update promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate010", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate010 start *************");
      try {
        const valueBucket = {
          name: "zhangsan",
          age: 23,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
          wrongColumn: 100.5,
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        let promise = rdbStore.update(valueBucket, predicates);
        promise
          .then(async (rows) => {
            console.info(`Updated row count: ${rows}`);
          })
          .catch((err) => {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect(err.code === 14800000 && err.message === "Inner error. Inner code is -1").assertTrue();
            console.info(TAG + "update with wrong column name");
            done();
          });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate010 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_1100
     * @tc.name   : testRdbStoreUpdate011
     * @tc.desc   : RdbStore update callback with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate011", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate011 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([4, 5, 6]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL, async (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            return;
          }
          try {
            console.info(`Updated row count: ${rows}`);
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
            expect("lisi").assertEqual(name);
            expect(20).assertEqual(age);
            expect(200.5).assertEqual(salary);
            expect(4).assertEqual(blobType[0]);
            expect(5).assertEqual(blobType[1]);
            expect(6).assertEqual(blobType[2]);
            resultSet.close();
            done();
          } catch (e) {
            console.info("update error " + e);
            expect(!e).assertTrue();
          }
        });
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate011 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_UPDATE_1200
     * @tc.name   : testRdbStoreUpdate012
     * @tc.desc   : RdbStore update promise with ConflictResolution test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreUpdate012", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreUpdate012 start *************");
      try {
        const valueBucket = {
          name: "lisi",
          age: 20,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };

        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("id", "1");
        await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
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
        expect("lisi").assertEqual(name);
        expect(20).assertEqual(age);
        expect(200.5).assertEqual(salary);
        expect(1).assertEqual(blobType[0]);
        expect(2).assertEqual(blobType[1]);
        expect(3).assertEqual(blobType[2]);
        resultSet.close();
        done();
      } catch (e) {
        console.info("update error " + e);
        expect(!e).assertTrue();
      }
      console.info(TAG + "************* testRdbStoreUpdate012 end *************");
    });
  });
}
