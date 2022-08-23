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
let uri = "datashare:///com.samples.datasharekvtest.DataShare";

//InsertValuesBucket
let Insert = { "name": "sun", "age": 1, "isStudent": true };

let BatchInsert = new Array(
  { "name": "sun", "age": 1, "isStudent": true },
  { "name": "sun", "age": 10, "isStudent": false });

let Insert100 = new Array();
for (let i = 0; i < 100; i++) {
  Insert100.push({ "name": "sun", "age": i + 1, "isStudent": true });
}

//UpdateValuesBucket
let Update = { "name": "suns", "age": 1, "isStudent": false };

//Predicates
let EqualTo = new dataSharePredicates.DataSharePredicates();
EqualTo.equalTo("$.age", 1);
let ResultSetEqualTo = new dataSharePredicates.DataSharePredicates();
ResultSetEqualTo.equalTo("$.name", "sun");
let PredicatesDelete0 = new dataSharePredicates.DataSharePredicates();
PredicatesDelete0.inKeys(["testkey0"]);
let PredicatesDelete1 = new dataSharePredicates.DataSharePredicates();
PredicatesDelete1.inKeys(["testkey1"]);

//getColumnIndex
const IndexValue = "value";

//Return Expect

const ResultSetInsert = { "name": "sun", "age": 1, "isStudent": "true" };
const ResultSetUpdate = { "name": "suns", "age": 1, "isStudent": "false" };
const DataProcessResultOne = 1;
const DataProcessResultThree = 3;
const column = 1;
let Delete = 0;

function onChangeNotify() {
  console.info("===>onChangeNotify===>");
};

function notifyChangeCallback() {
  console.info("===>notifyChangeCallback===>");
};

export default function DataShareCombinationKvdb() {
  describe('DataShareCombinationKvdb', function () {
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
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationKvdb0101
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Insert Update Query Delete in Kvdb
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationKvdb0101', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0101 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0101 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0101 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareCombinationKvdb0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationKvdb0102
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : BatchInsert Update Query Delete in Kvdb
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationKvdb0102', 1, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0102 batchInsert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0102 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0102 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0102 delete err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete1).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0102 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareCombinationKvdb0102 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationKvdb0104
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : On on
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationKvdb0104', 1, function () {
      try {
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going On 1");
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going On 2");
      } catch (err) {
        console.info("DataShareCombinationKvdb0104 fail" + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationKvdb005
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Off off
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareCombinationKvdb0105', 1, function () {
      try {
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going On 1");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going Off 1");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going Off 2");
      } catch (err) {
        console.info("DataShareCombinationKvdb0105  fail" + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareCombinationKvdb0106
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : BatchInsert Update Query Delete in Kvdb
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
*/
    it('DataShareCombinationKvdb0106', 2, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, Insert100).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0106 batchInsert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0106 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
        }).catch((err) => {
          console.info("DataShareCombinationKvdb0106 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        for (let i = 0; i < 100; i++) {
          let PredicatesDelete = new dataSharePredicates.DataSharePredicates();
          PredicatesDelete.inKeys(["testkey" + Delete]);
          await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete).then((data) => {
            console.info("TestDataShare going delete " + Delete + "=" + data);
            expect(DataProcessResultOne).assertEqual(data);
          })
          Delete++;
        }
        done();
      } catch (err) {
        console.info("DataShareCombinationKvdb0106 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareNotifyChangeKvdb0101
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : NotifyChange
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareNotifyChangeKvdb0101', 1, async function (done) {
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
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.helper.notifyChange(uri, notifyChangeCallback);
        }).catch((err) => {
          console.info("DataShareNotifyChangeKvdb0101 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          globalThis.helper.notifyChange(uri, notifyChangeCallback);
        }).catch((err) => {
          console.info("DataShareNotifyChangeKvdb0101 update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.helper.notifyChange(uri, notifyChangeCallback);
        }).catch((err) => {
          console.info("DataShareNotifyChangeKvdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          globalThis.helper.notifyChange(uri, notifyChangeCallback);
        }).catch((err) => {
          console.info("DataShareNotifyChangeKvdb0101 delete err" + JSON.stringify(err));
          expect(err).assertFail();
        })
      } catch (err) {
        console.info("DataShareNotifyChangeKvdb0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetKvdb0101
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetKvdb0101', 1, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0101 batchInsert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, ResultSetEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          expect(true).assertEqual(globalThis.ResultSet.goToFirstRow());
          expect(true).assertEqual(globalThis.ResultSet.goToNextRow());
          expect(true).assertEqual(globalThis.ResultSet.goToLastRow());
          expect(true).assertEqual(globalThis.ResultSet.goToPreviousRow());
          expect(true).assertEqual(globalThis.ResultSet.goTo(column));
          expect(true).assertEqual(globalThis.ResultSet.goToRow(column));
          globalThis.ResultSet.close()
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete0 = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0101 delete0 err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete1).then((data) => {
          console.info("TestDataShare going delete1 = " + data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0101 delete1 err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetKvdb001 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetKvdb0102
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetKvdb0102', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          expect(false).assertEqual(globalThis.ResultSet.goToFirstRow());
          expect(false).assertEqual(globalThis.ResultSet.goToNextRow());
          expect(false).assertEqual(globalThis.ResultSet.goToLastRow());
          expect(false).assertEqual(globalThis.ResultSet.goToPreviousRow());
          expect(false).assertEqual(globalThis.ResultSet.goTo(column));
          expect(false).assertEqual(globalThis.ResultSet.goToRow(column));
          done();
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0102 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetKvdb0102 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetKvdb0103
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetKvdb0103', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0103 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetInsert)).assertEqual(globalThis.ResultSet.getString(1));
          expect(DataProcessResultThree).assertEqual(globalThis.ResultSet.getDataType(1));
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0103 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0103 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetKvdb0103 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
    * @tc.number    : SUB_DDM_DataShare_ETS_DataShareResultSetKvdb0108
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : DataShare Supports ResultSet
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
*/
    it('DataShareResultSetKvdb0108', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0108 insert err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(DataProcessResultOne).assertEqual(globalThis.ResultSet.getColumnIndex(IndexValue));
          expect(IndexValue).assertEqual(globalThis.ResultSet.getColumnName(DataProcessResultOne));
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0108 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going deleteall = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareResultSetKvdb0108 deleteall err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareResultSetKvdb0108 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })
  })
}