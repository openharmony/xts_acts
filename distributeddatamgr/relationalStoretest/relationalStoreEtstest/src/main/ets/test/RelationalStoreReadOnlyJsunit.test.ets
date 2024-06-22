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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';

let context: common.UIAbilityContext;

const TAG = "[RELATIONAL_STORE_JS_READ_ONLY_TEST]";

let STORE_CONFIG = {
  name: "store.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let STORE_CONFIG1 = {
  name: "test.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

let STORE_CONFIG2 = {
  name: "readOnly.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

let STORE_CONFIG3 = {
  name: "readOnly3.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

const valueBucket = {
  'name': 'zhangsan',
  'age': 18,
  'salary': 25000,
  'blobType': new Uint8Array([1, 2, 3]),
};

const valueBucket2 = {
  'name': 'lisi',
  'age': 19,
  'salary': 30000,
  'blobType': new Uint8Array([1, 2, 3]),
};

export default function RdbStoreReadOnlyTest() {
  describe('RdbStoreReadOnlyTest', function () {
    beforeAll(async function () {
      console.log(TAG + 'beforeAll');
      try {
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext

        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(rdbStore === null).assertFalse();

        const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "name TEXT, age INTEGER, salary REAL, blobType BLOB)";
        await rdbStore.executeSql(CREATE_TABLE_SQL);

        await rdbStore.insert('test', valueBucket);
        await rdbStore.insert('test', valueBucket2);

        rdbStore.backup(STORE_CONFIG2.name);
        rdbStore.backup(STORE_CONFIG3.name);

        await relationalStore.deleteRdbStore(context, STORE_CONFIG);

      } catch (err) {
        console.error(TAG, `init database failed, errCode:${err.code}, message:${err.message}`);
      }
    })

    beforeEach(async function () {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
      console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      await relationalStore.deleteRdbStore(context, STORE_CONFIG2);
    })

    console.info(TAG + "*************JS Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0100
     * @tc.name readOnlyTest0100
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0100', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0100 start *************");
      try {
        let store3 = await relationalStore.getRdbStore(context, STORE_CONFIG3);
        console.info(TAG + 'getRdbStore  successfully.');
        expect(store3 === undefined).assertFalse();
        done();
      } catch (err) {
        console.error(TAG, `open read-only database failed, errCode:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* readOnlyTest0100 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0200
     * @tc.name readOnlyTest0200
     * @tc.desc 1. set isReadOnly as true
     *          2. delete read-only database
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0200', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0200 start *************");
      try {
        let store3 = await relationalStore.getRdbStore(context, STORE_CONFIG3);
        console.info(TAG + 'getRdbStore  successfully.');
        expect(store3 === undefined).assertFalse();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG3).then(()=>{
          store3 = undefined;
          console.info('Delete RdbStore successfully.');
          done();
        }).catch((err) => {
          console.error(`Delete RdbStore failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.error(TAG, `open read-only database failed, errCode:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* readOnlyTest0200 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0300
     * @tc.name readOnlyTest0300
     * @tc.desc 1. set isReadOnly as true
     *          2. open read-only database  if the database is not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0300', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0300 start *************");
      try {
        await relationalStore.getRdbStore(context, STORE_CONFIG1);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `open read-only database failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(14800030);
        done();
      }
      console.log(TAG + "************* readOnlyTest0300 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0400
     * @tc.name readOnlyTest0400
     * @tc.desc insert data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0400', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0400 start *************");
      let store = undefined;
      try {
        store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();

        const valueBucketTest = {
          'name': 'zhangsan',
          'age': 18,
          'salary': 25000,
          'blobType': new Uint8Array([1, 2, 3]),
        };
        await store.insert('test', valueBucketTest);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `insert failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest0400 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0500
     * @tc.name readOnlyTest0500
     * @tc.desc insertSync data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0500', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0500 start *************");
      let store = undefined;
      try {
        store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();

        const valueBucketTest = {
          'name': 'zhangsan',
          'age': 18,
          'salary': 25000,
          'blobType': new Uint8Array([1, 2, 3]),
        };        
        await store.insertSync('test', valueBucketTest);

        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `insert failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest0500 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0600
     * @tc.name readOnlyTest0600
     * @tc.desc batchInsert data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0600', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0600 start *************");
      let store = undefined;
      try {
        store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();

        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await store.batchInsert("test", valueBucketArray);

        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `insert failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest0600 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0700
     * @tc.name readOnlyTest0700
     * @tc.desc batchInsertSync data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0700', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0700 start *************");
      let store = undefined;
      try {
        store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();

        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray = new Array();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await store.batchInsertSync("test", valueBucketArray);

        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `insert failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest0700 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0800
     * @tc.name readOnlyTest0800
     * @tc.desc update data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0800', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0800 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        let predicates = new relationalStore.RdbPredicates('test')
        predicates.equalTo('id', 1)
        await store.update(valueBucket, predicates);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `update failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest0800 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0900
     * @tc.name readOnlyTest0900
     * @tc.desc updateSync data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest0900', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest0900 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        let predicates = new relationalStore.RdbPredicates('test')
        predicates.equalTo('id', 1)
        await store.updateSync(valueBucket, predicates);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `update failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest0900 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1000
     * @tc.name readOnlyTest1000
     * @tc.desc delete data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1000', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1000 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        let predicates = new relationalStore.RdbPredicates('test')
        await store.delete(predicates);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `delete failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }

      console.info(TAG + "************* readOnlyTest1000 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1100
     * @tc.name readOnlyTest1100
     * @tc.desc deleteSync data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1100', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1100 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        let predicates = new relationalStore.RdbPredicates('test')
        await store.deleteSync(predicates);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyTest1100 delete failed, errCode:${err.code}, message:${err.message}`);
        console.info(TAG +  "readOnlyTest1100 typeof(err.code)"+ typeof(err.code));
        expect(err.code).assertEqual(801);
        done();
      }

      console.info(TAG + "************* readOnlyTest1100 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1200
     * @tc.name readOnlyTest1200
     * @tc.desc begin transaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1200', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1200 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        await store.beginTransaction();
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyTest1200 begin transaction failed, errCode:${err.code}, message:${err.message}`);
        console.info(TAG +  "readOnlyTest1200 typeof(err.code)"+ typeof(err.code));
        expect(err.code).assertEqual("801");
        done();
      }
      console.info(TAG + "************* readOnlyTest1200 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1300
     * @tc.name readOnlyTest1300
     * @tc.desc query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1300', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1300 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        let predicates = await new relationalStore.RdbPredicates('test')
        let resultSet = await store.query(predicates);
        expect(resultSet.rowCount).assertEqual(2);
        done();
      } catch (err) {
        console.error(TAG, `query failed, errCode:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* readOnlyTest1300 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1400
     * @tc.name readOnlyTest1400
     * @tc.desc querySql data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1400', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1400 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        expect(store.version).assertEqual(0);
        let resultSet = await store.querySql('PRAGMA user_version');
        resultSet.goToFirstRow();
        expect(resultSet.getValue(0)).assertEqual(0);
        done();
      } catch (err) {
        console.error(TAG, `restore failed, errCode:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* readOnlyTest1400 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1500
     * @tc.name readOnlyTest1500
     * @tc.desc querySqlSync data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1500', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1500 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        expect(store.version).assertEqual(0);
        let resultSet = await store.querySqlSync('PRAGMA user_version');
        resultSet.goToFirstRow();
        expect(resultSet.getValue(0)).assertEqual(0);
        done();
      } catch (err) {
        console.error(TAG, `restore failed, errCode:${err.code}, message:${err.message}`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* readOnlyTest1500 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1600
     * @tc.name readOnlyTest1600
     * @tc.desc  execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1600', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1600 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        expect(store.version).assertEqual(0);
        await store.execute('PRAGMA user_version=5');
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `get user_version failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest1600 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1700
     * @tc.name readOnlyTest1700
     * @tc.desc  executeSql
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1700', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1700 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        expect(store.version).assertEqual(0);
        await store.executeSql('PRAGMA user_version');
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest1700 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1800
     * @tc.name readOnlyTest1800
     * @tc.desc  executeSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1800', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1800 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        expect(store.version).assertEqual(0);
        await store.executeSync('PRAGMA user_version');
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `set user_version failed, errCode:${err.code}, message:${err.message}`);
        expect(err.code).assertEqual(801);
        done();
      }
      console.info(TAG + "************* readOnlyTest1800 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_1900
     * @tc.name readOnlyTest1900
     * @tc.desc set user_version by store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readOnlyTest1900', 0, async function (done) {
      console.info(TAG + "************* readOnlyTest1900 start *************");
      try {
        let store = await relationalStore.getRdbStore(context, STORE_CONFIG2);
        expect(store === undefined).assertFalse();
        store.version = 5;
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, `readOnlyTest1900 set user_version failed, errCode:${err.code}, message:${err.message}`);
        console.info(TAG +  "readOnlyTest1900 typeof(err.code)"+ typeof(err.code));
        expect(err.code).assertEqual("801");
        done();
      }
      console.info(TAG + "************* readOnlyTest1900 end *************");
    })

    console.info(TAG + "*************Unit Test End*************");
  })
}

