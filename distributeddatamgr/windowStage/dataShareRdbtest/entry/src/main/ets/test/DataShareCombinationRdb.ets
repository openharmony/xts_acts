/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import dataShare from '@ohos.data.dataShare'
import * as pubfun from './DataSharePublicfunction_Promise'
import dataSharePredicates from '@ohos.data.dataSharePredicates'

//CreateDataShareHelper
let uri = "datashare:///com.samples.datasharetest.DataShare";

//InsertValuesBucket
let InsertNumber = { "age": 1 };
let BatchInsert = new Array(
  { "age": 1 },
  { "name": "sun" },
  { "isStudent": true },
  { "Binary": new Uint8Array([1, 2, 3]) });
let ErrBatchInsert = new Array(
  { "age": 1 },
  { "age": true },
  { "name": "sun" });
let Insert100 = new Array();
for (let i = 0; i < 100; i++) {
  Insert100.push({ "name": "sun", "age": i + 1 });
}

let InsertString = { "name": "sun" };
let InsertLong = { "age": 1234 };
let InsertDouble = { "phoneNumber": 1.0 };
let InsertBlob = { "Binary": new Uint8Array([1, 2, 3]) };

//UpdateValuesBucket
let UpdateNumber = { "age": 11 };
let Update100 = { "name": "suns", "age": 1 };

//Predicates
let PredicatesNumber = new dataSharePredicates.DataSharePredicates();
PredicatesNumber.equalTo("age", 1);
let PredicatesAll = new dataSharePredicates.DataSharePredicates();

//getColumnIndex
const IndexNumber = "age";
const IndexString = "name";
const IndexUint8Array = "Binary";

//Return Expect
const ResultSetNumber = 11;
const ResultSetDouble = "phoneNumber";
const ResultSetUpdate100 = "suns";
const DataProcessResultZero = 0;
const DataProcessResultOne = 1;
const DataProcessResultTwo = 2;
const DataProcessResultThree = 3;
const DataProcessResultFour = 4;
const DataProcessResultOnehundred = 100;
const DataProcessResultString = "sun";
const DataProcessResultLong = 1234;
const DataProcessResultBlob = new Uint8Array([1, 2, 3]);
const DataProcessResultDouble = 1.0;
const column = 1;

let Column;

function onChangeNotify() {
  console.info("===>onChangeNotify===>");
};

function notifyChangeCallback() {
  console.info("===>notifyChangeCallback===>");
};

export default function DataShareCombinationRdb() {
  describe('DataShareCombinationRdb', function () {
    function sleep(time) {
      return new Promise(resolve => {
        setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
    }

    beforeAll(async () => {
      await globalThis.connectDataShareExtAbility();
      await sleep(2000);
      console.info("[ttt] helper = " + globalThis.helper + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationRdb0101
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Insert Update Query Delete in Rdb
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationRdb0101', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareCombinationRdb0101 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesNumber, UpdateNumber).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationRdb0101 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexNumber);
          expect(JSON.stringify(ResultSetNumber)).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataShareCombinationRdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareCombinationRdb0101 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareCombinationRdb0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationRdb0102
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : BatchInsert Update Query Delete in Rdb
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationRdb0102', 1, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultFour).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationRdb0102 batchInsert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesAll, UpdateNumber).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultFour).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationRdb0102 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToLastRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexNumber)
          expect(JSON.stringify(ResultSetNumber)).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataShareCombinationRdb0102 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultFour).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareCombinationRdb0102 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareCombinationRdb0102 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationRdb0104
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : On on
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationRdb0104', 1, function () {
      try {
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going On 1");
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going On 2");
      } catch (err) {
        console.info("DataShareCombinationRdb0104 fail" + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationRdb005
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Off off
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationRdb0105', 1, function () {
      try {
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going On 1");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going Off 1");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going Off 2");
      } catch (err) {
        console.info("DataShareCombinationRdb0105  fail" + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationRdb0106
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : BatchInsert Update Query Delete in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 2
  */
    it('DataShareCombinationRdb0106', 2, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, Insert100).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOnehundred).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationRdb0106 batchInsert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesAll, Update100).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOnehundred).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationRdb0106 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToLastRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexString);
          expect(ResultSetUpdate100).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataShareCombinationRdb0106 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOnehundred).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareCombinationRdb0106 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareCombinationRdb0106 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareNotifyChangeRdb0101
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : NotifyChange
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('DataShareNotifyChangeRdb0101', 1, async function (done) {
      try {
        let Count = 1;
        globalThis.helper.on("dataChange", uri, function (err,data) {
          if (Count < 4) {
            console.info("TestDataShare notifyChange err = " + err);
			console.info("TestDataShare notifyChange data = " + data);
            expect(true).assertEqual(err == null);
			expect(true).assertEqual(data == null);
            Count = Count + 1;
          } else {
            console.info("TestDataShare notifyChange err = " + err);
			console.info("TestDataShare notifyChange data = " + data);
            expect(true).assertEqual(err == null);
			expect(true).assertEqual(data == null);
            globalThis.helper.off("dataChange", uri);
            console.info("TestDataShare off");
            done();
          }
        })
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.helper.notifyChange(uri, notifyChangeCallback);
        }).catch((err) => {
          console.info("DataShareNotifyChangeRdb0101 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesAll, UpdateNumber).then((data) => {
          console.info("TestDataShare going update = " + data);
          globalThis.helper.notifyChange(uri, notifyChangeCallback);
        }).catch((err) => {
          console.info("DataShareNotifyChangeRdb0101 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.helper.notifyChange(uri);
        }).catch((err) => {
          console.info("DataShareNotifyChangeRdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          globalThis.helper.notifyChange(uri);
        }).catch((err) => {
          console.info("DataShareNotifyChangeRdb0101 delete err" + JSON.stringify(err));
          expect(err).assertFail();
        })
      } catch (err) {
        console.info("DataShareNotifyChangeRdb0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0101
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetRdb0101', 1, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb0101 batchInsert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          expect(true).assertEqual(globalThis.ResultSet.goToFirstRow());
          expect(true).assertEqual(globalThis.ResultSet.goToNextRow());
          expect(true).assertEqual(globalThis.ResultSet.goToLastRow());
          expect(true).assertEqual(globalThis.ResultSet.goToPreviousRow());
          expect(true).assertEqual(globalThis.ResultSet.goTo(column));
          expect(true).assertEqual(globalThis.ResultSet.goToRow(column));
          globalThis.ResultSet.close()
        }).catch((err) => {
          console.info("DataShareResultSetRdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0101 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb001 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0102
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetRdb0102', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          expect(false).assertEqual(globalThis.ResultSet.goToFirstRow());
          expect(false).assertEqual(globalThis.ResultSet.goToNextRow());
          expect(false).assertEqual(globalThis.ResultSet.goToLastRow());
          expect(false).assertEqual(globalThis.ResultSet.goToPreviousRow());
          expect(false).assertEqual(globalThis.ResultSet.goTo(column));
          expect(false).assertEqual(globalThis.ResultSet.goToRow(column));
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0102 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0102 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0103
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetRdb0103', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertString).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb0103 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexString);
          expect(DataProcessResultString).assertEqual(globalThis.ResultSet.getString(Column));
          expect(DataProcessResultThree).assertEqual(globalThis.ResultSet.getDataType(Column));
        }).catch((err) => {
          console.info("DataShareResultSetRdb0103 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0103 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0103 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0104
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetRdb0104', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertLong).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb0104 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexNumber);
          expect(DataProcessResultLong).assertEqual(globalThis.ResultSet.getLong(Column));
          expect(DataProcessResultOne).assertEqual(globalThis.ResultSet.getDataType(Column));
        }).catch((err) => {
          console.info("DataShareResultSetRdb0104 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0104 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0104 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0105
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/

    it('DataShareResultSetRdb0105', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertDouble).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb005 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(ResultSetDouble)
          expect(DataProcessResultDouble).assertEqual(globalThis.ResultSet.getDouble(Column));
          expect(DataProcessResultTwo).assertEqual(globalThis.ResultSet.getDataType(Column));
        }).catch((err) => {
          console.info("DataShareResultSetRdb0105 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0105 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0105 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0106
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetRdb0106', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertBlob).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb0106 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexUint8Array)
          expect(JSON.stringify(DataProcessResultBlob))
            .assertEqual(JSON.stringify(globalThis.ResultSet.getBlob(Column)));
          expect(DataProcessResultFour).assertEqual(globalThis.ResultSet.getDataType(Column));
        }).catch((err) => {
          console.info("DataShareResultSetRdb0106 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0106 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0106 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
       * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0107
       * @tc.name      : Use getEntries get the value by mixing the string key
       * @tc.desc      : DataShare Supports ResultSet
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
   */
    it('DataShareResultSetRdb0107', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertString).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb0107 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexNumber)
          expect(DataProcessResultZero).assertEqual(globalThis.ResultSet.getDataType(Column));
        }).catch((err) => {
          console.info("DataShareResultSetRdb0107 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0107 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0107 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetRdb0108
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetRdb0108', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetRdb0108 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(IndexNumber);
          expect(DataProcessResultTwo).assertEqual(Column);
          expect(IndexNumber).assertEqual(globalThis.ResultSet.getColumnName(Column));
        }).catch((err) => {
          console.info("DataShareResultSetRdb0108 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetRdb0108 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetRdb0108 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })
  })
}