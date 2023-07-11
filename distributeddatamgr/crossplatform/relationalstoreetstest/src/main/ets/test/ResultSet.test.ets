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
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "data1 text," + "data2 long, " + "data3 double," + "data4 blob)";

const STORE_CONFIG = {
  name: "Resultset.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
const COLOUNM_NAMES = ["id", "data1", "data2", "data3", "data4"];
var rdbStore = undefined;

export default function rdbResultSetTest() {
  describe("rdbResultSetTest", function () {
    beforeAll(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "beforeAll");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await createTest();
    });

    beforeEach(async function () {
      console.info(TAG + "beforeEach");
    });

    afterEach(function () {
      console.info(TAG + "afterEach");
    });

    afterAll(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "afterAll");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "Resultset.db");
    });

    async function createTest() {
      console.info(TAG + "createTest data start");
      {
        var u8 = new Uint8Array([1, 2, 3]);
        const valueBucket = {
          data1: "hello",
          data2: 10,
          data3: 1.0,
          data4: u8,
        };
        await rdbStore.insert("test", valueBucket);
      }
      {
        var u8 = new Uint8Array([3, 4, 5]);
        const valueBucket = {
          data1: "2",
          data2: -5,
          data3: 2.5,
          data4: u8,
        };
        await rdbStore.insert("test", valueBucket);
      }
      {
        var u8 = new Uint8Array(0);
        const valueBucket = {
          data1: "hello world",
          data2: 3,
          data3: 1.8,
          data4: u8,
        };
        await rdbStore.insert("test", valueBucket);
      }
      console.info(TAG + "createTest data end");
    }

    /**
     * @tc.number : TEST_RESULT_SET_COLUMN_NAMES_001
     * @tc.name   : testResultSetColumnNames001
     * @tc.desc   : ResultSet columnNames test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetColumnNames001", 0, async function (done) {
      console.info(TAG + "************* testResultSetColumnNames001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertTrue(COLOUNM_NAMES == resultSet.columnNames);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetColumnNames001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_COLUMN_COUNT_001
     * @tc.name   : testResultSetColumnCount001
     * @tc.desc   : ResultSet columnCount test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetColumnCount001", 0, async function (done) {
      console.info(TAG + "************* testResultSetColumnCount001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(5).assertEqual(resultSet.columnCount);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetColumnCount001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_COLUMN_COUNT_002
     * @tc.name   : testResultSetColumnCount002
     * @tc.desc   : ResultSet columnCount test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetColumnCount002", 0, async function (done) {
      console.info(TAG + "************* testResultSetColumnCount002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(0).assertEqual(resultSet.columnCount);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetColumnCount002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_ROW_COUNT_001
     * @tc.name   : testResultSetRowCount001
     * @tc.desc   : ResultSet rowCount test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetRowCount001", 0, async function (done) {
      console.info(TAG + "************* testResultSetRowCount001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(3).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_ROW_COUNT_002
     * @tc.name   : testResultSetRowCount002
     * @tc.desc   : ResultSet rowCount test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetRowCount002", 0, async function (done) {
      console.info(TAG + "************* testResultSetRowCount002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(-1).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_ROW_COUNT_003
     * @tc.name   : testResultSetRowCount003
     * @tc.desc   : ResultSet rowCount test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetRowCount003", 0, async function (done) {
      console.info(TAG + "************* testResultSetRowCount003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let resultSet = await rdbStore.query(predicates);
      expect(1).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_ROW_COUNT_004
     * @tc.name   : testResultSetRowCount004
     * @tc.desc   : ResultSet rowCount test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetRowCount004", 0, async function (done) {
      console.info(TAG + "************* testResultSetRowCount004 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      predicates.equalTo("data2", 3);
      let resultSet = await rdbStore.query(predicates);
      expect(0).assertEqual(resultSet.rowCount);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetRowCount004 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_ROW_INDEX_001
     * @tc.name   : testResultSetRowIndex001
     * @tc.desc   : ResultSet rowIndex test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetRowIndex001", 0, async function (done) {
      console.info(TAG + "************* testResultSetRowIndex001 *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(0).assertEqual(resultSet.rowIndex);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetRowIndex001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_ROW_INDEX_002
     * @tc.name   : testResultSetRowIndex002
     * @tc.desc   : ResultSet rowIndex test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetRowIndex002", 0, async function (done) {
      console.info(TAG + "************* testResultSetRowIndex002 *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToLastRow());
        expect(2).assertEqual(resultSet.rowIndex);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetRowIndex002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_FIRST_ROW_001
     * @tc.name   : testResultSetIsAtFirstRow001
     * @tc.desc   : ResultSet isAtFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtFirstRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtFirstRow001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_FIRST_ROW_002
     * @tc.name   : testResultSetIsAtFirstRow002
     * @tc.desc   : ResultSet isAtFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtFirstRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtFirstRow002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(false).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_FIRST_ROW_003
     * @tc.name   : testResultSetIsAtFirstRow003
     * @tc.desc   : ResultSet isAtFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtFirstRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtFirstRow003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.goToNextRow());
        expect(false).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_FIRST_ROW_004
     * @tc.name   : testResultSetIsAtFirstRow004
     * @tc.desc   : ResultSet isAtFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtFirstRow004", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtFirstRow004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToLastRow());
        expect(false).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow004 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_FIRST_ROW_005
     * @tc.name   : testResultSetIsAtFirstRow005
     * @tc.desc   : ResultSet isAtFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtFirstRow005", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtFirstRow005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        resultSet.goToRow(0);
        expect(true).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow005 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_FIRST_ROW_006
     * @tc.name   : testResultSetIsAtFirstRow006
     * @tc.desc   : ResultSet isAtFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtFirstRow006", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtFirstRow006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.isAtFirstRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtFirstRow006 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_LAST_ROW_001
     * @tc.name   : testResultSetIsAtLastRow001
     * @tc.desc   : ResultSet isAtLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtLastRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtLastRow001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToLastRow());
        expect(true).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_LAST_ROW_002
     * @tc.name   : testResultSetIsAtLastRow002
     * @tc.desc   : ResultSet isAtLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtLastRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtLastRow002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(false).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_LAST_ROW_003
     * @tc.name   : testResultSetIsAtLastRow003
     * @tc.desc   : ResultSet isAtLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtLastRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtLastRow003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(true).assertEqual(resultSet.goToNextRow());
        expect(false).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_LAST_ROW_004
     * @tc.name   : testResultSetIsAtLastRow004
     * @tc.desc   : ResultSet isAtLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtLastRow004", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtLastRow004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(false).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow004 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_LAST_ROW_005
     * @tc.name   : testResultSetIsAtLastRow005
     * @tc.desc   : ResultSet isAtLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtLastRow005", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtLastRow005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        resultSet.goToRow(2);
        expect(true).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow005 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_AT_LAST_ROW_006
     * @tc.name   : testResultSetIsAtLastRow006
     * @tc.desc   : ResultSet isAtLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsAtLastRow006", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsAtLastRow006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        expect(true).assertEqual(resultSet.goToLastRow());
        expect(true).assertEqual(resultSet.isAtLastRow);
        resultSet.close();
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsAtLastRow006 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_ENDED_001
     * @tc.name   : testResultSetIsEnded001
     * @tc.desc   : ResultSet isEnded test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsEnded001", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsEnded001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(false).assertEqual(resultSet.isEnded);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsEnded001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_ENDED_002
     * @tc.name   : testResultSetIsEnded002
     * @tc.desc   : ResultSet isEnded test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsEnded002", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsEnded002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(false).assertEqual(resultSet.isEnded);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsEnded002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_ENDED_003
     * @tc.name   : testResultSetIsEnded003
     * @tc.desc   : ResultSet isEnded test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsEnded003", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsEnded003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goToRow(3);
      expect(true).assertEqual(resultSet.isEnded);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsEnded003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_STARTED_001
     * @tc.name   : testResultSetIsStarted001
     * @tc.desc   : ResultSet isStarted test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsStarted001", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsStarted001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isStarted);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsStarted001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_STARTED_002
     * @tc.name   : testResultSetIsStarted002
     * @tc.desc   : ResultSet isStarted test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsStarted002", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsStarted002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      resultSet.goTo(1);
      expect(true).assertEqual(resultSet.isStarted);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsStarted002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_STARTED_003
     * @tc.name   : testResultSetIsStarted003
     * @tc.desc   : ResultSet isStarted test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsStarted003", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsStarted003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isStarted);
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.isStarted);
      expect(true).assertEqual(resultSet.isStarted);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsStarted003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_CLOSED_001
     * @tc.name   : testResultSetIsClosed001
     * @tc.desc   : ResultSet isClosed test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsClosed001", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsClosed001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);

      expect(3).assertEqual(resultSet.rowCount);
      resultSet.close();
      expect(true).assertEqual(resultSet.isClosed);

      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsClosed001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_CLOSED_002
     * @tc.name   : testResultSetIsClosed002
     * @tc.desc   : ResultSet isClosed test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsClosed002", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsClosed002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isClosed);
      resultSet.close();

      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsClosed002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_CLOSED_003
     * @tc.name   : testResultSetIsClosed003
     * @tc.desc   : ResultSet isClosed test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsClosed003", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsClosed003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.isClosed);
      resultSet.close();

      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetIsClosed003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_INDEX_001
     * @tc.name   : testResultSetGetColumnIndex001
     * @tc.desc   : ResultSet getColumnIndex test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnIndex001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnIndex001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getColumnIndex("data1"));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnIndex001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_INDEX_002
     * @tc.name   : testResultSetGetColumnIndex002
     * @tc.desc   : ResultSet getColumnIndex test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnIndex002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnIndex002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        expect(-1).assertEqual(resultSet.getColumnIndex("data1"));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnIndex002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_INDEX_003
     * @tc.name   : testResultSetGetColumnIndex003
     * @tc.desc   : ResultSet getColumnIndex test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnIndex003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnIndex003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        expect(-1).assertEqual(resultSet.getColumnIndex("dataX"));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnIndex003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_NAME_001
     * @tc.name   : testResultSetGetColumnName001
     * @tc.desc   : ResultSet getColumnName test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnName001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnName001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);

        expect("data1").assertEqual(resultSet.getColumnName(1));
        expect("data4").assertEqual(resultSet.getColumnName(4));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_NAME_002
     * @tc.name   : testResultSetGetColumnName002
     * @tc.desc   : ResultSet getColumnName test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnName002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnName002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);

        expect("").assertEqual(resultSet.getColumnName(1));
        expect("").assertEqual(resultSet.getColumnName(4));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_NAME_003
     * @tc.name   : testResultSetGetColumnName003
     * @tc.desc   : ResultSet getColumnName test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnName003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnName003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);

        expect("").assertEqual(resultSet.getColumnName(10));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_COLUMN_NAME_004
     * @tc.name   : testResultSetGetColumnName004
     * @tc.desc   : ResultSet getColumnName test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetColumnName004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetColumnName004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);

        expect("").assertEqual(resultSet.getColumnName(10));
        resultSet.close();

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetColumnName004 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_001
     * @tc.name   : testResultSetGoTo001
     * @tc.desc   : ResultSet goTo test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoTo001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          resultSet.goTo(1);
          expect(1).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_002
     * @tc.name   : testResultSetGoTo002
     * @tc.desc   : ResultSet goTo test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoTo002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goTo(1);
          expect(-1).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_003
     * @tc.name   : testResultSetGoTo003
     * @tc.desc   : ResultSet goTo test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoTo003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          resultSet.goTo(1);
          expect(2).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_004
     * @tc.name   : testResultSetGoTo004
     * @tc.desc   : ResultSet goTo test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoTo004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToLastRow());
          resultSet.goTo(5);
          //console.info("************* testResultSetGoTo004 start 1*************"+resultSet.rowIndex);
          expect(3).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoTo004 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_ROW_001
     * @tc.name   : testResultSetGoToRow001
     * @tc.desc   : ResultSet goToRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToRow001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          resultSet.goToRow(1);
          expect(1).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoToRow001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_ROW_002
     * @tc.name   : testResultSetGoToRow002
     * @tc.desc   : ResultSet goToRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToRow002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(1);
          expect(-1).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoToRow002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_ROW_003
     * @tc.name   : testResultSetGoToRow003
     * @tc.desc   : ResultSet goToRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToRow003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          resultSet.goToRow(1);
          expect(1).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoToRow003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_ROW_004
     * @tc.name   : testResultSetGoToRow004
     * @tc.desc   : ResultSet goToRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToRow004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToRow004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          expect(true).assertEqual(resultSet.goToLastRow());
          resultSet.goToRow(5);
          expect(3).assertEqual(resultSet.rowIndex);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGoToRow004 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_FIRST_ROW_001
     * @tc.name   : testResultSetGoToFirstRow001
     * @tc.desc   : ResultSet goToFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToFirstRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToFirstRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.isAtFirstRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToFirstRow001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_FIRST_ROW_002
     * @tc.name   : testResultSetGoToFirstRow002
     * @tc.desc   : ResultSet goToFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToFirstRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToFirstRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToFirstRow());
      expect(false).assertEqual(resultSet.isAtFirstRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToFirstRow002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_FIRST_ROW_003
     * @tc.name   : testResultSetGoToFirstRow003
     * @tc.desc   : ResultSet goToFirstRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToFirstRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToFirstRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.isAtFirstRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToFirstRow003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_LAST_ROW_001
     * @tc.name   : testResultSetGoToLastRow001
     * @tc.desc   : ResultSet goToLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToLastRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToLastRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.isAtLastRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToLastRow001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_Last_ROW_002
     * @tc.name   : testResultSetGoToLastRow002
     * @tc.desc   : ResultSet goToLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToLastRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToLastRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToLastRow());
      expect(false).assertEqual(resultSet.isAtLastRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToLastRow002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_Last_ROW_003
     * @tc.name   : testResultSetGoToLastRow003
     * @tc.desc   : ResultSet goToLastRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToLastRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToLastRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.isAtLastRow);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToLastRow003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_NEXT_ROW_001
     * @tc.name   : testResultSetGoToNextRow001
     * @tc.desc   : ResultSet goToNextRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToNextRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToNextRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToNextRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_NEXT_ROW_002
     * @tc.name   : testResultSetGoToNextRow002
     * @tc.desc   : ResultSet goToNextRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToNextRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToNextRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToNextRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_NEXT_ROW_003
     * @tc.name   : testResultSetGoToNextRow003
     * @tc.desc   : ResultSet goToNextRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToNextRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToNextRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(2).assertEqual(resultSet.rowIndex);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_NEXT_ROW_004
     * @tc.name   : testResultSetGoToNextRow004
     * @tc.desc   : ResultSet goToNextRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToNextRow004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToNextRow004 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(false).assertEqual(resultSet.goToNextRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToNextRow004 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_PREVIOUS_ROW_001
     * @tc.name   : testResultSetGoToPreviousRow001
     * @tc.desc   : ResultSet goToPreviousRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToPreviousRow001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToPreviousRow001 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_PREVIOUS_ROW_002
     * @tc.name   : testResultSetGoToPreviousRow002
     * @tc.desc   : ResultSet goToPreviousRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToPreviousRow002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToPreviousRow002 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "wangwu");
      let resultSet = await rdbStore.query(predicates);
      expect(false).assertEqual(resultSet.goToPreviousRow());
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_PREVIOUS_ROW_003
     * @tc.name   : testResultSetGoToPreviousRow003
     * @tc.desc   : ResultSet goToPreviousRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToPreviousRow003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToPreviousRow003 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(true).assertEqual(resultSet.goToNextRow());
      expect(true).assertEqual(resultSet.goToPreviousRow());
      expect(0).assertEqual(resultSet.rowIndex);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GO_TO_PREVIOUS_ROW_004
     * @tc.name   : testResultSetGoToPreviousRow004
     * @tc.desc   : ResultSet goToPreviousRow test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGoToPreviousRow004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGoToPreviousRow004 start *************");

      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      expect(true).assertEqual(resultSet.goToLastRow());
      expect(true).assertEqual(resultSet.goToPreviousRow());
      expect(1).assertEqual(resultSet.rowIndex);
      resultSet.close();
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGoToPreviousRow004 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_BLOB_001
     * @tc.name   : testResultSetGetBlob001
     * @tc.desc   : ResultSet getBlob test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetBlob001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetBlob001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          console.info(TAG + "id=" + id + ", data4=" + data4);
          expect(1).assertEqual(data4[0]);
          expect(2).assertEqual(data4[1]);
          expect(3).assertEqual(data4[2]);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testGetBlob0001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_BLOB_002
     * @tc.name   : testResultSetGetBlob002
     * @tc.desc   : ResultSet getBlob test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetBlob002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetBlob002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          resultSet.goToRow(1);
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const data4 = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          console.info(TAG + "id=" + id + ", data4=" + data4);
          expect(3).assertEqual(data4[0]);
          expect(4).assertEqual(data4[1]);
          expect(5).assertEqual(data4[2]);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetBlob002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_STRING_001
     * @tc.name   : testResultSetGetString001
     * @tc.desc   : ResultSet getString test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetString001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetString001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        expect(true).assertEqual(resultSet.goToFirstRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        expect("hello").assertEqual(data1);
        resultSet.close();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_STRING_002
     * @tc.name   : testResultSetGetString002
     * @tc.desc   : ResultSet getString test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetString002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetString002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        expect(true).assertEqual(resultSet.goToFirstRow());
        const data2 = resultSet.getString(resultSet.getColumnIndex("data2"));
        expect("10").assertEqual(data2);
        resultSet.close();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_STRING_003
     * @tc.name   : testResultSetGetString003
     * @tc.desc   : ResultSet getString test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetString003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetString003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        resultSet.goToRow(1);
        const data3 = resultSet.getString(resultSet.getColumnIndex("data3"));
        expect("2.5").assertEqual(data3);
        resultSet.close();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_STRING_004
     * @tc.name   : testResultSetGetString004
     * @tc.desc   : ResultSet getString test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetString004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetString004 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      {
        resultSet.goToRow(2);
        const data1 = resultSet.getString(resultSet.getColumnIndex("data1"));
        const data2 = resultSet.getString(resultSet.getColumnIndex("data2"));
        const data3 = resultSet.getString(resultSet.getColumnIndex("data3"));
        expect("hello world").assertEqual(data1);
        expect("3").assertEqual(data2);
        expect("1.8").assertEqual(data3);
        resultSet.close();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetString004 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_LONG_001
     * @tc.name   : testResultSetGetLong001
     * @tc.desc   : ResultSet getLong test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetLong001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetLong001 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          const id = resultSet.getLong(resultSet.getColumnIndex("id"));
          const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
          console.info(TAG + "id=" + id + ", data2=" + data2);
          expect(10).assertEqual(data2);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong001 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_LONG_002
     * @tc.name   : testResultSetGetLong002
     * @tc.desc   : ResultSet getLong test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetLong002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetLong002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          const data1 = resultSet.getLong(resultSet.getColumnIndex("data1"));
          expect(2).assertEqual(data1);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong002 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_LONG_003
     * @tc.name   : testResultSetGetLong003
     * @tc.desc   : ResultSet getLong test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetLong003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetLong003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          expect(true).assertEqual(resultSet.goToNextRow());
          const data2 = resultSet.getLong(resultSet.getColumnIndex("data2"));
          expect(-5).assertEqual(data2);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(null).assertFail();
      }
      resultSet = null;
      done();
      console.info(TAG + "************* testResultSetGetLong003 end *************");
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_DOUBLE_001
     * @tc.name   : testResultSetGetDouble001
     * @tc.desc   : ResultSet getDouble test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetDouble001", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetDouble001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(0);
          const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          expect(1.0).assertEqual(data3);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_DOUBLE_002
     * @tc.name   : testResultSetGetDouble002
     * @tc.desc   : ResultSet getDouble test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetDouble002", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetDouble002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(1);
          const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          expect(2.5).assertEqual(data3);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_DOUBLE_003
     * @tc.name   : testResultSetGetDouble003
     * @tc.desc   : ResultSet getDouble test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetDouble003", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetDouble003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          const data3 = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          expect(1.8).assertEqual(data3);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_GET_DOUBLE_004
     * @tc.name   : testResultSetGetDouble004
     * @tc.desc   : ResultSet getDouble test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetGetDouble004", 0, async function (done) {
      console.info(TAG + "************* testResultSetGetDouble004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(0);
          const data2 = resultSet.getDouble(resultSet.getColumnIndex("data2"));
          expect(10).assertEqual(data2);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetGetDouble004 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_COLUMN_NULL_001
     * @tc.name   : testResultSetIsColumnNull001
     * @tc.desc   : ResultSet isColumnNull test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsColumnNull001", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsColumnNull001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          const isColumnNull1 = resultSet.isColumnNull(resultSet.getColumnIndex("data1"));
          expect(false).assertEqual(isColumnNull1);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_COLUMN_NULL_002
     * @tc.name   : testResultSetIsColumnNull002
     * @tc.desc   : ResultSet isColumnNull test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsColumnNull002", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsColumnNull002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          const isColumnNull4 = resultSet.isColumnNull(resultSet.getColumnIndex("data4"));
          expect(true).assertEqual(isColumnNull4);
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull002 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_IS_COLUMN_NULL_003
     * @tc.name   : testResultSetIsColumnNull003
     * @tc.desc   : ResultSet isColumnNull test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetIsColumnNull003", 0, async function (done) {
      console.info(TAG + "************* testResultSetIsColumnNull003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        {
          resultSet.goToRow(2);
          expect(false).assertEqual(resultSet.isColumnNull(1));
          resultSet.close();
        }
        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetIsColumnNull003 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_CLOSE_001
     * @tc.name   : testResultSetClose001
     * @tc.desc   : ResultSet close test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetClose001", 0, async function (done) {
      console.info(TAG + "************* testResultSetClose001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        resultSet.goToRow(1);
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetClose001 end *************");
      }
    });

    /**
     * @tc.number : TEST_RESULT_SET_CLOSE_002
     * @tc.name   : testResultSetClose002
     * @tc.desc   : ResultSet close test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testResultSetClose002", 0, async function (done) {
      console.info(TAG + "************* testResultSetClose002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "wangwu");
        let resultSet = await rdbStore.query(predicates);
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        resultSet = null;
        done();
        console.info(TAG + "************* testResultSetClose002 end *************");
      }
    });
  });
}
