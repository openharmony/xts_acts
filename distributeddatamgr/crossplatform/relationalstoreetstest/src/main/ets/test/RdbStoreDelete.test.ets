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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";

const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT UNIQUE, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const STORE_CONFIG = {
  name: "Delete.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

let rdbStore = undefined;

export default function rdbStoreDeleteTest() {
  describe("rdbStoreDeleteTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
    });

    beforeEach(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest1();
      await createTest2();
      await createTest3();
    });

    afterEach(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "Delete.db");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    async function createTest1() {
      console.info(TAG + "createTest start");
      {
        const valueBucket = {
          name: "zhangsan",
          age: 18,
          salary: 100.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    async function createTest2() {
      console.info(TAG + "createTest start");
      {
        const valueBucket = {
          name: "lisi",
          age: 28,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    async function createTest3() {
      console.info(TAG + "createTest start");
      {
        const valueBucket = {
          name: "lisi2",
          age: 28,
          salary: 200.5,
          blobType: new Uint8Array([1, 2, 3]),
        };
        await rdbStore.insert("test", valueBucket);
      }
    }

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_DELETE_0100
     * @tc.name   : testRdbStoreDelete001
     * @tc.desc   : RdbStore delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreDelete001", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreDelete001 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("age", 18);
      let resultSet = await rdbStore.query(predicates);
      expect(1).assertEqual(resultSet.rowCount);
      resultSet.close();
      rdbStore.delete(predicates, async (err, rows) => {
        if (err) {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
        }
        console.info(`Delete rows: ${rows}`);
        expect(1).assertEqual(rows);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("age", 18);
        let resultSet = await rdbStore.query(predicates);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
        done();
      });
      console.info(TAG + "************* testRdbStoreDelete001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_DELETE_0200
     * @tc.name   : testRdbStoreDelete002
     * @tc.desc   : RdbStore delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreDelete002", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreDelete002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("aaa id", 1);
      rdbStore.delete(predicates, async (err, rows) => {
        if (err) {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          expect(err.code === 14800000).assertTrue();
          console.info(TAG + "delete with wrong conditions");
          done();
        }
      });
      console.info(TAG + "************* testRdbStoreDelete002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_DELETE_0300
     * @tc.name   : testRdbStoreDelete003
     * @tc.desc   : RdbStore delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreDelete003", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreDelete003 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("age", 28);
      rdbStore.delete(predicates, async (err, rows) => {
        if (err) {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        console.info(`Delete rows: ${rows}`);
        expect(2).assertEqual(rows);
        done();
      });
      console.info(TAG + "************* testRdbStoreDelete003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_DELETE_0400
     * @tc.name   : testRdbStoreDelete004
     * @tc.desc   : RdbStore delete promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreDelete004", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreDelete004 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("age", 18);
      let resultSet = await rdbStore.query(predicates);
      expect(1).assertEqual(resultSet.rowCount);
      resultSet.close();
      rdbStore
        .delete(predicates)
        .then(async (ret) => {
          expect(1).assertEqual(ret);
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("age", 18);
          let resultSet = await rdbStore.query(predicates);
          expect(0).assertEqual(resultSet.rowCount);
          console.info(TAG + "Delete done: " + ret);
          resultSet.close();
          done();
        })
        .catch((err) => {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
        });
      console.info(TAG + "************* testRdbStoreDelete004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_DELETE_0500
     * @tc.name   : testRdbStoreDelete005
     * @tc.desc   : RdbStore delete promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreDelete005", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreDelete005 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("aaa id", 1);
      rdbStore
        .delete(predicates)
        .then(async (ret) => {
          console.info(TAG + "Delete done: " + ret);
        })
        .catch((err) => {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          expect(err.code === 14800000).assertTrue();
          console.info(TAG + "delete with wrong conditions");
          done();
        });
      console.info(TAG + "************* testRdbStoreDelete005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_STORE_DELETE_0600
     * @tc.name   : testRdbStoreDelete006
     * @tc.desc   : RdbStore delete promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbStoreDelete006", 0, async function (done) {
      console.info(TAG + "************* testRdbStoreDelete006 start *************");
      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("age", "28");
      rdbStore
        .delete(predicates)
        .then(async (ret) => {
          expect(2).assertEqual(ret);
          console.info(TAG + "Delete done: " + ret);
          done();
        })
        .catch((err) => {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
        });
      console.info(TAG + "************* testRdbStoreDelete006 end *************");
    });
  });
}
