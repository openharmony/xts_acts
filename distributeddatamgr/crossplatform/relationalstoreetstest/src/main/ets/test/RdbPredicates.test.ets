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

const TAG = "[RDB_JSKITS _TEST]";
const CREATE_TABLE_ALL_DATA_TYPE_SQL =
  "CREATE TABLE IF NOT EXISTS AllDataType " +
  "(id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "integerValue INTEGER , longValue INTEGER , shortValue INTEGER , booleanValue INTEGER , " +
  "doubleValue REAL , floatValue REAL , stringValue TEXT , blobValue BLOB , clobValue TEXT , " +
  "byteValue INTEGER , dateValue INTEGER , timeValue INTEGER , timestampValue INTEGER , " +
  "calendarValue INTEGER , characterValue TEXT , primIntValue INTEGER , primLongValue INTEGER , " +
  "primShortValue INTEGER , primFloatValue REAL , primDoubleValue REAL , " +
  "primBooleanValue INTEGER , primByteValue INTEGER , primCharValue TEXT, `order` INTEGER);";

const STORE_CONFIG = {
  name: "Predicates.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
let rdbStore = undefined;
let DOUBLE_MAX = 9223372036854775807;
export default function rdbPredicatesTest() {
  describe("rdbPredicatesTest", function () {
    beforeAll(async function () {
      console.info(TAG + "beforeAll");
    });

    beforeEach(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL, null);
      await buildAllDataType1();
      await buildAllDataType2();
      await buildAllDataType3();
    });

    afterEach(async function () {
      let context = globalThis.abilityContext;
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "Predicates.db");
    });

    afterAll(async function () {
      console.info(TAG + "afterAll");
    });

    async function buildAllDataType1() {
      console.info(TAG + "buildAllDataType1 start");
      {
        var u8 = new Uint8Array([1, 2, 3]);
        const valueBucket = {
          integerValue: 2147483647,
          doubleValue: DOUBLE_MAX,
          booleanValue: true,
          floatValue: -0.123,
          longValue: 9223372036854775807,
          shortValue: 32767,
          characterValue: " ",
          stringValue: "ABCDEFGHIJKLMN",
          blobValue: u8,
          byteValue: 127,
        };
        await rdbStore.insert("AllDataType", valueBucket);
      }
    }

    async function buildAllDataType2() {
      console.info(TAG + "buildAllDataType2 start");
      {
        var u8 = new Uint8Array([1, 2, 3]);
        const valueBucket = {
          integerValue: 1,
          doubleValue: 1.0,
          booleanValue: false,
          floatValue: 1.0,
          longValue: 1,
          shortValue: 1,
          characterValue: "中",
          stringValue: "ABCDEFGHIJKLMN",
          blobValue: u8,
          byteValue: 1,
        };
        await rdbStore.insert("AllDataType", valueBucket);
      }
    }

    async function buildAllDataType3() {
      console.info(TAG + "buildAllDataType3 start");
      {
        var u8 = new Uint8Array([1, 2, 3]);
        const valueBucket = {
          integerValue: -2147483648,
          doubleValue: Number.MIN_VALUE,
          booleanValue: false,
          floatValue: 0.1234567,
          longValue: -9223372036854775808,
          shortValue: -32768,
          characterValue: "#",
          stringValue: "ABCDEFGHIJKLMN",
          blobValue: u8,
          byteValue: -128,
        };
        await rdbStore.insert("AllDataType", valueBucket);
      }
    }

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_CONSTRUCTOR_0100
     * @tc.name   : testRdbPredicatesConstructor001
     * @tc.desc   : Test the constructor method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesConstructor001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesConstructor001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_CONSTRUCTOR_0200
     * @tc.name   : testRdbPredicatesConstructor002
     * @tc.desc   : Test the constructor() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesConstructor002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesConstructor002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0100
     * @tc.name   : testRdbPredicatesEqualTo001
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo001 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0200
     * @tc.name   : testRdbPredicatesEqualTo002
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("byteValue", -128).or().equalTo("byteValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo002 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0300
     * @tc.name   : testRdbPredicatesEqualTo003
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo003 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0400
     * @tc.name   : testRdbPredicatesEqualTo004
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo004 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0500
     * @tc.name   : testRdbPredicatesEqualTo005
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("shortValue", -32768.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo005 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0600
     * @tc.name   : testRdbPredicatesEqualTo006
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0));
        result.close();
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo006 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0700
     * @tc.name   : testRdbPredicatesEqualTo007
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo007", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0));
        result.close();
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo007 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_EQUALTO_0800
     * @tc.name   : testRdbPredicatesEqualTo008
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo008", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEqualTo008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo008 end   *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0100
     * @tc.name   : testRdbPredicatesNotEqualTo001
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0200
     * @tc.name   : testRdbPredicatesNotEqualTo002
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("byteValue", -128);
        predicates.notEqualTo("byteValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0300
     * @tc.name   : testRdbPredicatesNotEqualTo003
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0400
     * @tc.name   : testRdbPredicatesNotEqualTo004
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0500
     * @tc.name   : testRdbPredicatesNotEqualTo005
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("shortValue", -32768);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0600
     * @tc.name   : testRdbPredicatesNotEqualTo006
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0700
     * @tc.name   : testRdbPredicatesNotEqualTo007
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo007", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo007 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_EQUALTO_0800
     * @tc.name   : testRdbPredicatesNotEqualTo008
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo008", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo008 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINWRAP_AND_ENDWRAP_0100
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap001
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("integerValue", 1).or().equalTo("integerValue", 2147483647).endWrap();
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINWRAP_AND_ENDWRAP_0200
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap002
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("characterValue", " ").endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINWRAP_AND_ENDWRAP_0300
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap003
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("characterValue", "中").endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINWRAP_AND_ENDWRAP_0400
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap004
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").equalTo("characterValue", "中").endWrap();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINWRAP_AND_ENDWRAP_0500
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap005
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("characterValue", "中");
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_OR_0100
     * @tc.name   : testRdbPredicatesOr001
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOr001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("integerValue", 1).or().equalTo("integerValue", 2147483647).endWrap();
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_AND_0100
     * @tc.name   : testRdbPredicatesAnd001
     * @tc.desc   : Test the and() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesAnd001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").and().equalTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_CONTAINS_0100
     * @tc.name   : testRdbPredicatesContains001
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesContains001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("stringValue", "DEF");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_CONTAINS_0200
     * @tc.name   : testRdbPredicatesContains002
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesContains002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("stringValue", "DEFX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_CONTAINS_0300
     * @tc.name   : testRdbPredicatesContains003
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesContains003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_CONTAINS_0400
     * @tc.name   : testRdbPredicatesContains004
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesContains004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINSWITH_0100
     * @tc.name   : testRdbPredicatesBeginsWith001
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginsWith001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("stringValue", "ABC");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINSWITH_0200
     * @tc.name   : testRdbPredicatesBeginsWith002
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginsWith002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("stringValue", "ABCX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINSWITH_0300
     * @tc.name   : testRdbPredicatesBeginsWith003
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginsWith003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BEGINSWITH_0400
     * @tc.name   : testRdbPredicatesBeginsWith004
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBeginsWith004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ENDSWITH_0100
     * @tc.name   : testRdbPredicatesEndsWith001
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEndsWith001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("stringValue", "LMN");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ENDSWITH_0200
     * @tc.name   : testRdbPredicatesEndsWith002
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEndsWith002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("stringValue", "LMNX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ENDSWITH_0300
     * @tc.name   : testRdbPredicatesEndsWith003
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEndsWith003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ENDSWITH_0400
     * @tc.name   : testRdbPredicatesEndsWith004
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesEndsWith004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NULL_0100
     * @tc.name   : testRdbPredicatesIsNull001
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNull001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NULL_0200
     * @tc.name   : testRdbPredicatesIsNull002
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNull002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NULL_0300
     * @tc.name   : testRdbPredicatesIsNull003
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNull003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NULL_0400
     * @tc.name   : testRdbPredicatesIsNull004
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNull004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NOT_NULL_0100
     * @tc.name   : testRdbPredicatesIsNotNull001
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNotNull001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NOT_NULL_0200
     * @tc.name   : testRdbPredicatesIsNotNull002
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNotNull002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NOT_NULL_0300
     * @tc.name   : testRdbPredicatesIsNotNull003
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNotNull003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IS_NOT_NULL_0400
     * @tc.name   : testRdbPredicatesIsNotNull004
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIsNotNull004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIKE_0100
     * @tc.name   : testRdbPredicatesLike001
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLike001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "%LMN%");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIKE_0200
     * @tc.name   : testRdbPredicatesLike002
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLike002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "%LMNX%");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIKE_0300
     * @tc.name   : testRdbPredicatesLike003
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLike003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("characterValue", "%中%");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIKE_0400
     * @tc.name   : testRdbPredicatesLike004
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLike004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("characterValue", "%#%");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GLOB_0100
     * @tc.name   : testRdbPredicatesGlob001
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGlob001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "ABCDEFGHIJKLM?");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GLOB_0200
     * @tc.name   : testRdbPredicatesGlob002
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGlob002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "?BCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GLOB_0300
     * @tc.name   : testRdbPredicatesGlob003
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin and end with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGlob0006", 0, async function (done) {
      console.info(TAG + "************* testGlob0006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "?BCDEFGHIJKLM?");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testGlob0006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GLOB_0400
     * @tc.name   : testRdbPredicatesGlob004
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGlob004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "ABC*");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GLOB_0500
     * @tc.name   : testRdbPredicatesGlob005
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGlob005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "*LMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GLOB_0600
     * @tc.name   : testRdbPredicatesGlob006
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin and end with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGlob006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "*FGHI*");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0100
     * @tc.name   : testRdbPredicatesBetween001
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0200
     * @tc.name   : testRdbPredicatesBetween002
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", 0.0, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0300
     * @tc.name   : testRdbPredicatesBetween003
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0400
     * @tc.name   : testRdbPredicatesBetween004
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 0, 2);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0500
     * @tc.name   : testRdbPredicatesBetween005
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "ABB");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0600
     * @tc.name   : testRdbPredicatesBetween006
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", DOUBLE_MAX, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0700
     * @tc.name   : testRdbPredicatesBetween007
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween007", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 1, 0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween007 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_BETWEEN_0800
     * @tc.name   : testRdbPredicatesBetween008
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween008", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesBetween008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 2, -1);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween008 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_BETWEEN_0100
     * @tc.name   : testRdbPredicatesNotBetween001
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotBetween001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "ABB", "ABD");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_BETWEEN_0200
     * @tc.name   : testRdbPredicatesNotBetween002
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotBetween002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("doubleValue", 0.0, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_BETWEEN_0300
     * @tc.name   : testRdbPredicatesNotBetween003
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotBetween003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_BETWEEN_0400
     * @tc.name   : testRdbPredicatesNotBetween004
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotBetween004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", 0, 2);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0100
     * @tc.name   : testRdbPredicatesGreaterThan001
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0200
     * @tc.name   : testRdbPredicatesGreaterThan002
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0300
     * @tc.name   : testRdbPredicatesGreaterThan003
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0400
     * @tc.name   : testRdbPredicatesGreaterThan004
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0500
     * @tc.name   : testRdbPredicatesGreaterThan005
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ZZZ");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0600
     * @tc.name   : testRdbPredicatesGreaterThan006
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 999.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0700
     * @tc.name   : testRdbPredicatesGreaterThan007
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan007", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", -999);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan007 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_0800
     * @tc.name   : testRdbPredicatesGreaterThan008
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan008", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThan008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", -999);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan008 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0100
     * @tc.name   : testRdbPredicatesLessThan001
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0200
     * @tc.name   : testRdbPredicatesLessThan002
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0300
     * @tc.name   : testRdbPredicatesLessThan003
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0400
     * @tc.name   : testRdbPredicatesLessThan004
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0500
     * @tc.name   : testRdbPredicatesLessThan005
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0600
     * @tc.name   : testRdbPredicatesLessThan006
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 1.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0700
     * @tc.name   : testRdbPredicatesLessThan007
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan007", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", -2147483648);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan007 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_0800
     * @tc.name   : testRdbPredicatesLessThan008
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan008", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThan008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", -9223372036854775808);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan008 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_OR_EQUALT0_0100
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo001
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_OR_EQUALT0_0200
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo002
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_OR_EQUALT0_0300
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo003
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GREATER_THAN_OR_EQUALT0_0400
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo004
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_OR_EQUALT0_0100
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo001
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_OR_EQUALT0_0200
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo002
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_OR_EQUALT0_0300
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo003
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LESS_THAN_OR_EQUALT0_0400
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo004
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ORDER_BY_ASC_0100
     * @tc.name   : testRdbPredicatesOrderByAsc001
     * @tc.desc   : Test the orderByAsc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByAsc001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOrderByAsc001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValue").distinct();
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        expect(true).assertEqual(result.goToFirstRow());
        expect(3).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(2).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(1).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByAsc001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ORDER_BY_ASC_0200
     * @tc.name   : testRdbPredicatesOrderByAsc002
     * @tc.desc   : Test the orderByAsc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByAsc002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOrderByAsc002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValueX").distinct();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByAsc002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ORDER_BY_DESC_0100
     * @tc.name   : testRdbPredicatesOrderByDesc001
     * @tc.desc   : Test the orderByDesc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByDesc001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOrderByDesc001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValue").distinct();
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(2).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(3).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByDesc001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_ORDER_BY_DESC_0200
     * @tc.name   : testRdbPredicatesOrderByDesc002
     * @tc.desc   : Test the orderByDesc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByDesc002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOrderByDesc002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValueX").distinct();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByDesc002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIMIT_AS_0100
     * @tc.name   : testRdbPredicatesLimitAs001
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLimitAs001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(1);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIMIT_AS_0200
     * @tc.name   : testRdbPredicatesLimitAs002
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLimitAs002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIMIT_AS_0300
     * @tc.name   : testRdbPredicatesLimitAs003
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLimitAs003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(100);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIMIT_AS_0400
     * @tc.name   : testRdbPredicatesLimitAs004
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLimitAs004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "中").limitAs(1);
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIMIT_AS_0500
     * @tc.name   : testRdbPredicatesLimitAs005
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs005", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLimitAs005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(0);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs005 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_LIMIT_AS_0600
     * @tc.name   : testRdbPredicatesLimitAs006
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs006", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesLimitAs006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(-1);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs006 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_OFFSET_AS_0100
     * @tc.name   : testRdbPredicatesOffsetAs001
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOffsetAs001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(1);
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_OFFSET_AS_0200
     * @tc.name   : testRdbPredicatesOffsetAs002
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOffsetAs002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(0);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_OFFSET_AS_0300
     * @tc.name   : testRdbPredicatesOffsetAs003
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOffsetAs003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(5);
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_OFFSET_AS_0400
     * @tc.name   : testRdbPredicatesOffsetAs004
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesOffsetAs004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(-1);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GROUP_BY_0100
     * @tc.name   : testRdbPredicatesGroupBy001
     * @tc.desc   : Test the groupBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGroupBy001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGroupBy001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValue"]);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesGroupBy001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_GROUP_BY_0200
     * @tc.name   : testRdbPredicatesGroupBy002
     * @tc.desc   : Test the groupBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGroupBy002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesGroupBy002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValueX"]);
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesGroupBy002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_INDEXED_BY_0100
     * @tc.name   : testRdbPredicatesIndexedBy001
     * @tc.desc   : Test the indexedBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    //
    it("testIndexedBy0001", 0, async function (done) {
      console.info(TAG + "************* testIndexedBy0001 start *************");
      await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValue);", null);
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.indexedBy("index_name");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        done();
      } catch (err) {
        console.info(TAG + "err = " + err);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testIndexedBy0001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_INDEXED_BY_0200
     * @tc.name   : testRdbPredicatesIndexedBy002
     * @tc.desc   : Test the indexedBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIndexedBy002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIndexedBy002 start *************");
      try {
        await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValueX);", null);
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.indexedBy("index_name");
        expect().assertFail();
      } catch (errInfo) {
        expect(errInfo != null).assertTrue();
        console.info(TAG + "testRdbPredicatesIndexedBy002 error: " + errInfo);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesIndexedBy002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IN_0100
     * @tc.name   : testRdbPredicatesIn001
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIn001 start *************");
      var values = [Number.MIN_VALUE.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IN_0200
     * @tc.name   : testRdbPredicatesIn002
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIn002 start *************");
      var values = ["1.0"];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IN_0300
     * @tc.name   : testRdbPredicatesIn003
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIn003 start *************");
      var values = [DOUBLE_MAX.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn003 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_IN_0400
     * @tc.name   : testRdbPredicatesIn004
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn004", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesIn004 start *************");
      var values = [Number.MIN_VALUE.toString(), "1.0", DOUBLE_MAX.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn004 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_IN_0100
     * @tc.name   : testRdbPredicatesNotIn001
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn001", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotIn001 start *************");
      var values = [1, -2147483648];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn001 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_IN_0200
     * @tc.name   : testRdbPredicatesNotIn002
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn002", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotIn002 start *************");
      let values = [1, 2147483647];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn002 end *************");
    });

    /**
     * @tc.number : SUB_DDM_TEST_RDB_PREDICATES_NOT_IN_0300
     * @tc.name   : testRdbPredicatesNotIn003
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn003", 0, async function (done) {
      console.info(TAG + "************* testRdbPredicatesNotIn003 start *************");
      var values = [-2147483648, 2147483647];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn003 end *************");
    });
  });
}
