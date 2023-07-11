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
import curves from "@ohos.curves";

const TAG = "[RDB_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

var context;
var rdbStore;

export default function relationalStoreTest() {
  describe("relationalStoreTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
      context = globalThis.abilityContext;
    });

    beforeEach(function () {
      console.info(TAG + "beforeEach");
    });

    afterEach(function () {
      console.info(TAG + "afterEach");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : TEST_GET_RDB_STORE_001
     * @tc.name   : testGetRdbStore001
     * @tc.desc   : getRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStore001", 0, async function (done) {
      console.log(TAG + "************* testGetRdbStore001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let getResult = false;
      relationalStore.getRdbStore(context, config, async (err, rdbStore) => {
        expect(err == null).assertTrue();
        if (err == null) {
          getResult = true;
        } else {
          console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        }
        try {
          await rdbStore.executeSql(CREATE_TABLE_TEST);
        } catch (err) {
          expect().assertFail();
          done();
        }
        await relationalStore.deleteRdbStore(context, "secure.db");
        expect(getResult).assertTrue();
        done();
        console.info(`Get RdbStore successfully.`);
      });
      console.log(TAG + "************* testGetRdbStore001 end   *************");
    });

    /**
     * @tc.number : TEST_GET_RDB_STORE_002
     * @tc.name   : testGetRdbStore002
     * @tc.desc   : getRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetRdbStore002", 0, async function (done) {
      console.log(TAG + "************* testGetRdbStore002 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let storePromise = relationalStore.getRdbStore(context, config);
      let getResult = false;
      storePromise
        .then(async (rdbStore) => {
          getResult = true;
          try {
            await rdbStore.executeSql(CREATE_TABLE_TEST);
          } catch (err) {
            expect().assertFail();
          }
          await relationalStore.deleteRdbStore(context, "secure.db");
          expect(getResult).assertTrue();
          done();
        })
        .catch((err) => {
          expect().assertFail();
          done();
        });
      console.log(TAG + "************* testGetRdbStore002 end   *************");
    });

    /**
     * @tc.number : TEST_DELETE_RDB_STORE_001
     * @tc.name   : testDeleteRdbStore001
     * @tc.desc   : deleteRdbStore callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStore001", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStore001 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      relationalStore.deleteRdbStore(context, "secure.db", async (err) => {
        if (err) {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        }
        if (err == undefined) {
          deleteResult = true;
        }
        console.info(`Delete RdbStore successfully.`);
        await sleep(1000);
        expect(deleteResult).assertTrue();
        done();
      });
      console.log(TAG + "************* testDeleteRdbStore001 end   *************");
    });

    /**
     * @tc.number : TEST_DELETE_RDB_STORE_002
     * @tc.name   : testDeleteRdbStore002
     * @tc.desc   : deleteRdbStore promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testDeleteRdbStore002", 0, async function (done) {
      console.log(TAG + "************* testDeleteRdbStore002 start *************");
      let config = {
        name: "secure.db",
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      rdbStore = await relationalStore.getRdbStore(context, config);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      let deleteResult = false;
      let promise = relationalStore.deleteRdbStore(context, "RdbTest.db");
      promise
        .then(async () => {
          console.info(`Delete RdbStore successfully.`);
          deleteResult = true;
          await sleep(1000);
          expect(deleteResult).assertTrue();
          done();
        })
        .catch((err) => {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        });
      console.log(TAG + "************* testDeleteRdbStore002 end   *************");
    });

    /**
     * @tc.number : TEST_SYNC_MODE_001
     * @tc.name   : testSyncMode001
     * @tc.desc   : SYNC_MODE_PUSH test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testSyncMode001", 0, async function (done) {
      console.log(TAG + "************* testSyncMode001 start *************");
      expect(0).assertEqual(relationalStore.SyncMode.SYNC_MODE_PUSH);
      done();
      console.log(TAG + "************* testSyncMode001 end   *************");
    });

    /**
     * @tc.number : TEST_SYNC_MODE_002
     * @tc.name   : testSyncMode002
     * @tc.desc   : SYNC_MODE_PULL test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testSyncMode002", 0, async function (done) {
      console.log(TAG + "************* testSyncMode002 start *************");
      expect(1).assertEqual(relationalStore.SyncMode.SYNC_MODE_PULL);
      done();
      console.log(TAG + "************* testSyncMode002 end   *************");
    });

    /**
     * @tc.number : TEST_CONFLICT_RESOLUTION_001
     * @tc.name   : testConflictResolution001
     * @tc.desc   : ON_CONFLICT_NONE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution001", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution001 start *************");
      // @ts-ignore
      expect(0).assertEqual(relationalStore.ConflictResolution.ON_CONFLICT_NONE);
      done();
      console.log(TAG + "************* testConflictResolution001 end   *************");
    });

    /**
     * @tc.number : TEST_CONFLICT_RESOLUTION_002
     * @tc.name   : testConflictResolution002
     * @tc.desc   : ON_CONFLICT_ROLLBACK test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution002", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution002 start *************");
      // @ts-ignore
      expect(1).assertEqual(relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
      done();
      console.log(TAG + "************* testConflictResolution002 end   *************");
    });

    /**
     * @tc.number : TEST_CONFLICT_RESOLUTION_003
     * @tc.name   : testConflictResolution003
     * @tc.desc   : ON_CONFLICT_ABORT test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution003", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution003 start *************");
      // @ts-ignore
      expect(2).assertEqual(relationalStore.ConflictResolution.ON_CONFLICT_ABORT);
      done();
      console.log(TAG + "************* testConflictResolution003 end   *************");
    });

    /**
     * @tc.number : TEST_CONFLICT_RESOLUTION_004
     * @tc.name   : testConflictResolution004
     * @tc.desc   : ON_CONFLICT_FAIL test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution004", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution004 start *************");
      // @ts-ignore
      expect(3).assertEqual(relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
      done();
      console.log(TAG + "************* testConflictResolution004 end   *************");
    });

    /**
     * @tc.number : TEST_CONFLICT_RESOLUTION_005
     * @tc.name   : testConflictResolution005
     * @tc.desc   : ON_CONFLICT_IGNORE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution005", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution005 start *************");
      // @ts-ignore
      expect(4).assertEqual(relationalStore.ConflictResolution.ON_CONFLICT_IGNORE);
      done();
      console.log(TAG + "************* testConflictResolution005 end   *************");
    });

    /**
     * @tc.number : TEST_CONFLICT_RESOLUTION_006
     * @tc.name   : testConflictResolution006
     * @tc.desc   : ON_CONFLICT_REPLACE test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it("testConflictResolution006", 0, async function (done) {
      console.log(TAG + "************* testConflictResolution006 start *************");
      // @ts-ignore
      expect(5).assertEqual(relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      done();
      console.log(TAG + "************* testConflictResolution006 end   *************");
    });
  });
}
