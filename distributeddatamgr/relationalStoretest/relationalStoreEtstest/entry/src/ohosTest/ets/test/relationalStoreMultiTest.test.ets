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





import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from "@ohos.data.relationalStore"
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "[RELATIONAL_STORE_JS_KITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "TransactionInsertTest.db",
  securityLevel: relationalStore.SecurityLevel.S3,
}



let options:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.DEFERRED
}

let options2:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.IMMEDIATE
}


let options3:relationalStore.TransactionOptions = {
  transactionType:relationalStore.TransactionType.EXCLUSIVE
}


let rdbStore: relationalStore.RdbStore;

@Concurrent
async function insertInThread(
  context: Context,
  options:relationalStore.TransactionOptions,
  insertCount = 1
) {
  const TAG = "[RELATIONAL_STORE_JS_KITS_TEST]"
  let rdbTrans: relationalStore.Transaction | undefined;
  try {
    const STORE_CONFIG: relationalStore.StoreConfig = {
      name: "TransactionInsertTest.db",
      securityLevel: relationalStore.SecurityLevel.S3,
    }

    console.log(TAG + 'insertInThread before getRdbStore');
    const rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    console.log(TAG + 'insertInThread after getRdbStore');
    rdbTrans = await rdbStore.createTransaction();
    console.log(TAG + 'insertInThread after createTrans');

    const u8 = new Uint8Array([1, 2, 3]);
    const valueBuckets = new Array(insertCount).fill(0).map<relationalStore.ValuesBucket>(() => {
      return {
        "name": "lisi",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
      };
    });
    const resultCount = await rdbTrans.batchInsert("test", valueBuckets);
    await rdbTrans.commit();
    console.log(TAG + 'insertInThread after commit');
    return resultCount;
  } catch (err) {
    if (rdbTrans) {
      rdbTrans.rollback();
    }
    console.error(TAG + "************* testRdbTransInsert error thread insert *************");
    console.error(TAG + JSON.stringify(err));
    return (err as BusinessError).code;
  }
}

@Concurrent
async function queryInThread(
  context: Context,
  options:relationalStore.TransactionOptions,
  querySql: string,
) {
  const TAG = "[RELATIONAL_STORE_JS_KITS_TEST]"
  let rdbTrans: relationalStore.Transaction | undefined;
  try {
    const STORE_CONFIG: relationalStore.StoreConfig = {
      name: "TransactionInsertTest.db",
      securityLevel: relationalStore.SecurityLevel.S3,
    }

    const rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    rdbTrans = await rdbStore.createTransaction();

    const resultSet = await rdbTrans.querySql(querySql);
    const rowCount = resultSet.rowCount;

    await rdbTrans.commit();
    return rowCount;
  } catch (err) {
    if (rdbTrans) {
      rdbTrans.rollback();
    }
    console.error(TAG + "************* testRdbTransInsert error thread insert *************");
    console.error(TAG + JSON.stringify(err));
    return (err as BusinessError).code;
  }
}

export default function relationalStoreMultiTransTest() {
  describe('relationalStoreMultiTransTest', () => {

    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      return rdbStore.executeSql(CREATE_TABLE_TEST, null);
    })
    beforeEach(() => {
      console.info(TAG + 'beforeEach')
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach')
      await rdbStore.executeSql("DELETE FROM test");
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, "TransactionInsertTest.db");
    })





    /**
     * @tc.name testRdbTransInsert0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0100
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsert0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0100 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0100 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransInsert0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0200
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsert0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0200 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0200 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsert0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0300
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsert0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0300 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0300 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsert0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0400
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsert0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0400 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0400 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsert0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0500
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsert0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0500 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0500 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsert0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0600
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsert0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsert0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsert0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsert0600 failed");
      }

      console.log(TAG + "************* testRdbTransInsert0600 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsertSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0700
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsertSync0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0100 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsertSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0800
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsertSync0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0200 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransInsertSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_0900
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsertSync0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0300 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsertSync0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1000
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsertSync0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0400 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsertSync0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1100
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsertSync0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0500 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransInsertSync0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1200
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransInsertSync0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransInsertSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = rdbTrans.insertSync("test", valueBucket);
        expect(1).assertEqual(rowId);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransInsertSync0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransInsertSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransInsertSync0600 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsert0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1300
     * @tc.desc RelationalStore TransBatchInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsert0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0100 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0100 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0100 end *************");
      done();
    })





    /**
     * @tc.name testRdbTransBatchInsert0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1400
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsert0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0200 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0200 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0200 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsert0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1500
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsert0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0300 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0300 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0300 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsert0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1600
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsert0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0400 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0400 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsert0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1700
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsert0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0500 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0500 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsert0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1800
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsert0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsert0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = await rdbTrans.batchInsert("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsert0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsert0600 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsert0600 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsertSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_1900
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsertSync0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0100 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0100 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsertSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2000
     * @tc.desc RelationalStore TransBatchInsertSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsertSync0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0200 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0200 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsertSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2100
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsertSync0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0300 result count " + resultSet.rowCount);
        expect(100).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0300 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsertSync0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2200
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsertSync0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0400 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0400 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsertSync0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2300
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsertSync0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0500 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0500 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransBatchInsertSync0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2400
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransBatchInsertSync0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransBatchInsertSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBuckets = new Array(100).fill(0).map<relationalStore.ValuesBucket>(() => {
          const valueBucket: relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
          return valueBucket;
        })
        const rowCount = rdbTrans.batchInsertSync("test", valueBuckets);
        expect(rowCount).assertEqual(100);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransBatchInsertSync0600 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransBatchInsertSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransBatchInsertSync0600 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdate0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2500
     * @tc.desc RelationalStore TransUpdate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdate0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0100 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0100 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdate0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2600
     * @tc.desc RelationalStore TransUpdate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdate0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0200 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0200 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdate0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2700
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdate0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0300 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0300 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdate0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2800
     * @tc.desc RelationalStore TransUpdate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdate0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0400 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0400 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0400 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdate0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_2900
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdate0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0500 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0500 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0500 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdate0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3000
     * @tc.desc RelationalStore TransInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdate0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdate0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.update({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdate0600 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdate0600 failed");
      }

      console.log(TAG + "************* testRdbTransUpdate0600 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransUpdateSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3100
     * @tc.desc RelationalStore TransUpdateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdateSync0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0100 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdateSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3200
     * @tc.desc RelationalStore TransUpdateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdateSync0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0200 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdateSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3300
     * @tc.desc RelationalStore TransUpdateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdateSync0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbTrans.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(20);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0300 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdateSync0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3400
     * @tc.desc RelationalStore TransUpdateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdateSync0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0400 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0400 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdateSync0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3500
     * @tc.desc RelationalStore TransUpdateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdateSync0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0500 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0500 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransUpdateSync0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3600
     * @tc.desc RelationalStore TransUpdateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransUpdateSync0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransUpdateSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        const rowId = await rdbStore.insert("test", valueBucket);
        expect(rowId).assertEqual(1);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        rdbTrans.updateSync({
          age: 20
        }, updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransUpdateSync0600 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        const rowData = resultSet.getRow();
        expect(rowData['age']).assertEqual(18);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransUpdateSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransUpdateSync0600 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDelete0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3700
     * @tc.desc RelationalStore TransDelete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDelete0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = await rdbTrans.delete(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0100 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0100 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0100 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDelete0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3800
     * @tc.desc RelationalStore TransDelete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDelete0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = await rdbTrans.delete(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0200 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0200 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0200 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDelete0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_3900
     * @tc.desc RelationalStore TransDelete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDelete0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = await rdbTrans.delete(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0300 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0300 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0300 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDelete0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4000
     * @tc.desc RelationalStore TransDelete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDelete0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.delete(updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0400 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0400 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDelete0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4100
     * @tc.desc RelationalStore TransDelete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDelete0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.delete(updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0500 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0500 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0500 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDelete0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4200
     * @tc.desc RelationalStore TransDelete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDelete0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        await rdbTrans.delete(updatePredicates);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDelete0600 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDelete0600 failed");
      }

      console.log(TAG + "************* testRdbTransDelete0600 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDeleteSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4300
     * @tc.desc RelationalStore TransDeleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDeleteSync0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDelete0700 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0100 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0100 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0100 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDeleteSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4400
     * @tc.desc RelationalStore TransDeleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDeleteSync0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0200 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0200 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0200 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDeleteSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4500
     * @tc.desc RelationalStore TransDeleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDeleteSync0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.commit();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0300 result count " + resultSet.rowCount);
        expect(0).assertEqual(resultSet.rowCount);
        resultSet.goToFirstRow();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0300 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0300 end *************");
      done();
    })



    /**
     * @tc.name testRdbTransDeleteSync0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4600
     * @tc.desc RelationalStore TransDeleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDeleteSync0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0400 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0400 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0400 end *************");
      done();
    })





    /**
     * @tc.name testRdbTransDeleteSync0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4700
     * @tc.desc RelationalStore TransDeleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDeleteSync0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0500 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0500 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0500 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransDeleteSync0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4800
     * @tc.desc RelationalStore TransDeleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransDeleteSync0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransDeleteSync0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBuckets = new Array(3).fill(0).map<relationalStore.ValuesBucket>(() => {
          return {
            "name": "lisi",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
          };
        })
        const rowId = await rdbStore.batchInsert("test", valueBuckets);
        expect(rowId).assertEqual(3);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const updatePredicates = new relationalStore.RdbPredicates("test");
        updatePredicates.equalTo('name', 'lisi');
        const deleteRows = rdbTrans.deleteSync(updatePredicates);
        expect(deleteRows).assertEqual(3);
        await rdbTrans.rollback();
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "testRdbTransDeleteSync0600 result count " + resultSet.rowCount);
        expect(3).assertEqual(resultSet.rowCount);
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransDeleteSync0600 failed");
      }

      console.log(TAG + "************* testRdbTransDeleteSync0600 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransQuery0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_4900
     * @tc.desc RelationalStore TransQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransQuery0100', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0100 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbTrans.query(predicates);
        console.log(TAG + "testRdbTransQuery0100 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0100 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0100 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransQuery0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_5000
     * @tc.desc RelationalStore TransQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransQuery0200', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0200 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbTrans.query(predicates);
        console.log(TAG + "testRdbTransQuery0200 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0200 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0200 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransQuery0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_5100
     * @tc.desc RelationalStore TransQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransQuery0300', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0300 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = await rdbTrans.query(predicates);
        console.log(TAG + "testRdbTransQuery0300 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0300 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0300 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransQuery0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_5200
     * @tc.desc RelationalStore TransQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransQuery0400', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0400 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbTrans.querySync(predicates);
        console.log(TAG + "testRdbTransQuery0400 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0400 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0400 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransQuery0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_5300
     * @tc.desc RelationalStore TransQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransQuery0500', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0500 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options3);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbTrans.querySync(predicates);
        console.log(TAG + "testRdbTransQuery0500 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0500 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0500 end *************");
      done();
    })




    /**
     * @tc.name testRdbTransQuery0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransactionAPITest_5400
     * @tc.desc RelationalStore TransQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testRdbTransQuery0600', TestType.FUNCTION, async (done: () => void) => {
      console.log(TAG + "************* testRdbTransQuery0600 start *************");
      try {
        const u8 = new Uint8Array([1, 2, 3]);
        const rdbTrans = await rdbStore.createTransaction(options2);
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbTrans.insert("test", valueBucket);
        let predicates = new relationalStore.RdbPredicates("test");
        let resultSet = rdbTrans.querySync(predicates);
        console.log(TAG + "testRdbTransQuery0600 result count " + resultSet.rowCount);
        expect(1).assertEqual(resultSet.rowCount);
        await rdbTrans.commit();
        resultSet.close();
      } catch (e) {
        console.log(TAG + e);
        expect(null).assertFail();
        console.log(TAG + "testRdbTransQuery0600 failed");
      }

      console.log(TAG + "************* testRdbTransQuery0600 end *************");
      done();
    })
  })
}