/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';


let context: common.UIAbilityContext;
const TAG = "[RelationalStore_JSKITS _TEST]"
const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS AllDataType "
  + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "integerValue INTEGER , longValue INTEGER , shortValue INTEGER , booleanValue INTEGER , "
  + "doubleValue REAL , floatValue REAL , stringValue TEXT , blobValue BLOB , clobValue TEXT , "
  + "byteValue INTEGER , dateValue INTEGER , timeValue INTEGER , timestampValue INTEGER , "
  + "calendarValue INTEGER , characterValue TEXT , primIntValue INTEGER , primLongValue INTEGER , "
  + "primShortValue INTEGER , primFloatValue REAL , primDoubleValue REAL , "
  + "primBooleanValue INTEGER , primByteValue INTEGER , primCharValue TEXT, `order` INTEGER);";

const STORE_CONFIG = {
  name: "Predicates.db",
  securityLevel: data_Rdb.SecurityLevel.S1
}
var rdbStore = undefined;
var DOUBLE_MAX = 9223372036854775807;

export default function relationalStorePredicatesTest() {
  describe('relationalStorePredicatesTest', function () {
    beforeAll(async function () {
      console.info(TAG + 'beforeAll')
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
      rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL, null);
      await buildAllDataType1();
      await buildAllDataType2();
      await buildAllDataType3();
      await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValue);", null);
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach')
    })

    afterEach(function () {
      console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll')
      rdbStore = null
      await data_Rdb.deleteRdbStore(context, "Predicates.db");
    })

    async function buildAllDataType1() {
      console.info(TAG + "buildAllDataType1 start");
      {
        var u8 = new Uint8Array([1, 2, 3])
        const valueBucket = {
          "integerValue": 2147483647,
          "doubleValue": DOUBLE_MAX,
          "booleanValue": true,
          "floatValue": -0.123,
          "longValue": 9223372036854775807,
          "shortValue": 32767,
          "characterValue": ' ',
          "stringValue": "ABCDEFGHIJKLMN",
          "blobValue": u8,
          "byteValue": 127,
        }
        await rdbStore.insert("AllDataType", valueBucket)
      }
    }

    async function buildAllDataType2() {
      console.info(TAG + "buildAllDataType2 start");
      {
        var u8 = new Uint8Array([1, 2, 3])
        const valueBucket = {
          "integerValue": 1,
          "doubleValue": 1.0,
          "booleanValue": false,
          "floatValue": 1.0,
          "longValue": 1,
          "shortValue": 1,
          "characterValue": '中',
          "stringValue": "ABCDEFGHIJKLMN",
          "blobValue": u8,
          "byteValue": 1,
        }
        await rdbStore.insert("AllDataType", valueBucket)
      }
    }

    async function buildAllDataType3() {
      console.info(TAG + "buildAllDataType3 start");
      {
        var u8 = new Uint8Array([1, 2, 3])
        const valueBucket = {
          "integerValue": -2147483648,
          "doubleValue": Number.MIN_VALUE,
          "booleanValue": false,
          "floatValue": 0.1234567,
          "longValue": -9223372036854775808,
          "shortValue": -32768,
          "characterValue": '#',
          "stringValue": "ABCDEFGHIJKLMN",
          "blobValue": u8,
          "byteValue": -128,
        }
        await rdbStore.insert("AllDataType", valueBucket)
      }
    }

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name testEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0010
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0001', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0001 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      {
        predicates.equalTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0001 end   *************");
    })

    /**
     * @tc.name testEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0020
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0002', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0002 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("byteValue", -128).or().equalTo("byteValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0002 end   *************");
    })

    /**
     * @tc.name testEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0030
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0003', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0003 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0003 end   *************");
    })

    /**
     * @tc.name testEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0040
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0004', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0004 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0004 end   *************");
    })

    /**
     * @tc.name testEqualTo0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0050
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0005', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0005 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("shortValue", -32768.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0005 end   *************");
    })

    /**
     * @tc.name testEqualTo0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0060
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0006', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0006 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0));
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0006 end   *************");
    })

    /**
     * @tc.name testEqualTo0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0070
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0007', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0007 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0))
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0007 end   *************");
    })

    /**
     * @tc.name testEqualTo0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0080
     * @tc.desc predicates equalTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEqualTo0008', 0, async function (done) {
      console.info(TAG + "************* testEqualTo0008 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.equalTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0))
        result.close();
      }
      done();
      console.info(TAG + "************* testEqualTo0008 end   *************");
    })

    /**
     * @tc.name testNotEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0090
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0001', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0001 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0001 end *************");
    })

    /**
     * @tc.name testNotEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0100
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0002', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0002 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("byteValue", -128);
        predicates.notEqualTo("byteValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0002 end *************");
    })

    /**
     * @tc.name testNotEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0110
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0003', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0003 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0003 end *************");
    })

    /**
     * @tc.name testNotEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0120
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0004', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0004 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0004 end *************");
    })

    /**
     * @tc.name testNotEqualTo0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0130
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0005', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0005 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("shortValue", -32768);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0005 end *************");
    })

    /**
     * @tc.name testNotEqualTo0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0140
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0006', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0006 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0006 end *************");
    })

    /**
     * @tc.name testNotEqualTo0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0150
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0007', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0007 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0007 end *************");
    })

    /**
     * @tc.name testNotEqualTo0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0160
     * @tc.desc predicates notEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNotEqualTo0008', 0, async function (done) {
      console.info(TAG + "************* testNotEqualTo0008 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.notEqualTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testNotEqualTo0008 end *************");
    })

    /**
     * @tc.name testIsNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0170
     * @tc.desc predicates isNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNull0001', 0, async function (done) {
      console.info(TAG + "************* testIsNull001 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNull0001 end *************");
    })

    /**
     * @tc.name testIsNull0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0180
     * @tc.desc predicates isNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNull0002', 0, async function (done) {
      console.info(TAG + "************* testIsNull0002 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNull0002 end *************");
    })

    /**
     * @tc.name testIsNull0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0190
     * @tc.desc predicates isNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNull0003', 0, async function (done) {
      console.info(TAG + "************* testIsNull0003 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNull0003 end *************");
    })

    /**
     * @tc.name testIsNull0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0200
     * @tc.desc predicates isNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNull0004', 0, async function (done) {
      console.info(TAG + "************* testIsNull0004 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNull0004 end *************");
    })

    /**
     * @tc.name testIsNotNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0210
     * @tc.desc predicates isNotNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNotNull0001', 0, async function (done) {
      console.info(TAG + "************* testIsNotNull0001 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNotNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNotNull0001 end *************");
    })

    /**
     * @tc.name testIsNotNull0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0220
     * @tc.desc predicates isNotNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNotNull0002', 0, async function (done) {
      console.info(TAG + "************* testIsNotNull0002 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNotNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNotNull0002 end *************");
    })

    /**
     * @tc.name testIsNotNull0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0230
     * @tc.desc predicates isNotNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNotNull0003', 0, async function (done) {
      console.info(TAG + "************* testIsNotNull0003 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNotNull0003 end *************");
    })

    /**
     * @tc.name testIsNotNull0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0240
     * @tc.desc predicates isNotNull normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNotNull0004', 0, async function (done) {
      console.info(TAG + "************* testIsNotNull0004 start *************");
      let predicates = await new data_Rdb.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testIsNotNull0004 end *************");
    })

    /**
     * @tc.name testGreaterThan0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0250
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0001', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0001 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0001 end *************");
    })

    /**
     * @tc.name testGreaterThan0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0260
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0002', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0002 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0002 end *************");
    })

    /**
     * @tc.name testGreaterThan0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0270
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0003', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0003 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0003 end *************");
    })

    /**
     * @tc.name testGreaterThan0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0280
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0004', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0004 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0004 end *************");
    })

    /**
     * @tc.name testGreaterThan0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0290
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0005', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0005 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ZZZ");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0005 end *************");
    })

    /**
     * @tc.name testGreaterThan0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0300
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0006', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0006 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 999.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0006 end *************");
    })

    /**
     * @tc.name testGreaterThan0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0310
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0007', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0007 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", -999);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0007 end *************");
    })

    /**
     * @tc.name testGreaterThan0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0320
     * @tc.desc predicates greaterThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThan0008', 0, async function (done) {
      console.info(TAG + "************* testGreaterThan0008 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", -999);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThan0008 end *************");
    })

    /**
     * @tc.name testGreaterThanOrEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0330
     * @tc.desc predicates greaterThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThanOrEqualTo0001', 0, async function (done) {
      console.info(TAG + "************* testGreaterThanOrEqualTo0001 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name testGreaterThanOrEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0340
     * @tc.desc predicates greaterThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThanOrEqualTo0002', 0, async function (done) {
      console.info(TAG + "************* testGreaterThanOrEqualTo0002 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThanOrEqualTo0002 end *************");
    })

    /**
     * @tc.name testGreaterThanOrEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0350
     * @tc.desc predicates greaterThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThanOrEqualTo0003', 0, async function (done) {
      console.info(TAG + "************* testGreaterThanOrEqualTo0003 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThanOrEqualTo0003 end *************");
    })

    /**
     * @tc.name testGreaterThanOrEqualTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0360
     * @tc.desc predicates greaterThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGreaterThanOrEqualTo0004', 0, async function (done) {
      console.info(TAG + "************* testGreaterThanOrEqualTo0004 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testGreaterThanOrEqualTo0004 end *************");
    })

    /**
     * @tc.name testLessThan0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0370
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0001', 0, async function (done) {
      console.info(TAG + "************* testLessThan0001 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0001 end *************");
    })

    /**
     * @tc.name testLessThan0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0380
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0002', 0, async function (done) {
      console.info(TAG + "************* testLessThan0002 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0002 end *************");
    })

    /**
     * @tc.name testLessThan0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0390
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0003', 0, async function (done) {
      console.info(TAG + "************* testLessThan0003 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0003 end *************");
    })

    /**
     * @tc.name testLessThan0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0400
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0004', 0, async function (done) {
      console.info(TAG + "************* testLessThan0004 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0004 end *************");
    })

    /**
     * @tc.name testLessThan0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0410
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0005', 0, async function (done) {
      console.info(TAG + "************* testLessThan0005 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0005 end *************");
    })

    /**
     * @tc.name testLessThan0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0420
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0006', 0, async function (done) {
      console.info(TAG + "************* testLessThan0006 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 1.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0006 end *************");
    })

    /**
     * @tc.name testLessThan0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0430
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0007', 0, async function (done) {
      console.info(TAG + "************* testLessThan0007 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", -2147483648);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0007 end *************");
    })

    /**
     * @tc.name testLessThan0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0440
     * @tc.desc predicates lessThan normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThan0008', 0, async function (done) {
      console.info(TAG + "************* testLessThan0008 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", -9223372036854775808);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThan0008 end *************");
    })

    /**
     * @tc.name testLessThanOrEqualTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0450
     * @tc.desc predicates lessThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThanOrEqualTo0001', 0, async function (done) {
      console.info(TAG + "************* testLessThanOrEqualTo0001 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThanOrEqualTo0001 end *************");
    })

    /**
     * @tc.name testLessThanOrEqualTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0460
     * @tc.desc predicates lessThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThanOrEqualTo0002', 0, async function (done) {
      console.info(TAG + "************* testLessThanOrEqualTo0002 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThanOrEqualTo0002 end *************");
    })

    /**
     * @tc.name testLessThanOrEqualTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_0470
     * @tc.desc predicates lessThanOrEqualTo normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLessThanOrEqualTo0003', 0, async function (done) {
      console.info(TAG + "************* testLessThanOrEqualTo0003 start *************");
      {
        let predicates = await new data_Rdb.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
      }
      done();
      console.info(TAG + "************* testLessThanOrEqualTo0003 end *************");
    })



    console.info(TAG + "*************Unit Test End*************");
  })
}
