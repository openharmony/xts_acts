/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import dataShare from '@ohos.data.dataShare'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import * as pubfun from './DataSharePublicfunction_Promise'

//CreateDataShareHelper
let uri = ("datashare:///com.samples.datasharetest.DataShare");

//InsertValuesBucket
let InsertNumber = { "age": 1 };
let InsertString = { "name": "sun" };
let InsertBoolean = { "isStudent": true };
let InsertUint8Array = { "Binary": new Uint8Array([1, 2, 3]) };
let InsertNull = { "name": "" };
let BatchInsert = new Array(
  { "age": 1 },
  { "name": "sun" },
  { "isStudent": true },
  { "Binary": new Uint8Array([1, 2, 3]) });

//UpdateValuesBucket
let UpdateNumber = { "age": 11 };
let UpdateString = { "name": "suns" };
let UpdateBoolean = { "isStudent": false };
let UpdateUint8Array = { "Binary": new Uint8Array([1, 2, 3, 4]) };
let UpdateNull = { "name": "1" };

//Predicates
let PredicatesNumber = new dataSharePredicates.DataSharePredicates();
PredicatesNumber.equalTo("age", 1);
let PredicatesString = new dataSharePredicates.DataSharePredicates();
PredicatesString.equalTo("name", "sun");
let PredicatesBoolean = new dataSharePredicates.DataSharePredicates();
PredicatesBoolean.equalTo("isStudent", true);
let PredicatesUint8Array = new dataSharePredicates.DataSharePredicates();
PredicatesUint8Array.equalTo("Binary", new Uint8Array([1, 2, 3]));
let PredicatesNull = new dataSharePredicates.DataSharePredicates();
PredicatesNull.equalTo("name", "");
let PredicatesAll = new dataSharePredicates.DataSharePredicates();

//getColumnIndex
const IndexNumber = "age";
const IndexString = "name";
const IndexBoolean = "isStudent";
const IndexUint8Array = "Binary";
const IndexNull = "name";

//Return Expect
const DataProcessResultOne = 1;
const DataProcessResultFour = 4;
const GetType = "image";
const GetFileTypes = new Array("type01", "type02", "type03");
const Normalize = "normalize+" + uri;
const Denormalize = "denormalize+" + uri;
const ResultSetNumber = 1;
const ResultSetString = "sun";
const ResultSetBoolean = 1;
const ResultSetUint8Array = new Uint8Array([1, 2, 3]);
const ResultSetNull = "";
const Mode = "rwt";

function onChangeNotify() {
  console.info("===>onChangeNotify===>");
};

export default function DataShareSingleRdb_Promise() {
  describe('DataShareSingleRdb_Promise', function () {
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
      await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
        console.info("TestDataShare going insert = " + data);
        globalThis.Count = data;
      })
      await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
        console.info("TestDataShare going delete = " + data);
      })
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_JS_DataShareInsertRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Insert number type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareInsertRdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareInsertRdb0101 fail err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareInsertRdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareInsertRdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Insert string type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareInsertRdb0102', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertString).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareInsertRdb0102 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareInsertRdb0102 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareInsertRdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Insert boolean type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareInsertRdb0103', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertBoolean).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareInsertRdb0103 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareInsertRdb0103 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareInsertRdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Insert Uint8Array type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareInsertRdb0104', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertUint8Array).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareInsertRdb0104 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareInsertRdb0104 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareInsertRdb0105
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Insert null type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareInsertRdb0105', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNull).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareInsertRdb0105 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareInsertRdb0105 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareUpdateRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update number type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareUpdateRdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesNumber, UpdateNumber).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareUpdateRdb0101 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareUpdateRdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareUpdateRdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update string type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareUpdateRdb0102', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertString).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesString, UpdateString).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareUpdateRdb0102 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareUpdateRdb0102 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareUpdateRdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update boolean type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareUpdateRdb0103', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertBoolean).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesBoolean, UpdateBoolean).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareUpdateRdb0103 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareUpdateRdb0103 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareUpdateRdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update Uint8Array type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareUpdateRdb0104', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertUint8Array).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesUint8Array, UpdateUint8Array).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareUpdateRdb0104 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareUpdateRdb0104 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareUpdateRdb0105
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update null type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareUpdateRdb0105', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNull).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesNull, UpdateNull).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareUpdateRdb0105 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareUpdateRdb0105 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareQueryRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query number type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareQueryRdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesNumber, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetNumber))
            .assertEqual(globalThis.ResultSet.getString(globalThis.ResultSet.getColumnIndex(IndexNumber)));
        }).catch((err) => {
          console.info("DataShareQueryRdb0101 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareQueryRdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareQueryRdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query string type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareQueryRdb0102', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertString).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesString, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(ResultSetString)
            .assertEqual(globalThis.ResultSet.getString(globalThis.ResultSet.getColumnIndex(IndexString)));
        }).catch((err) => {
          console.info("DataShareQueryRdb0102 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareQueryRdb0102 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareQueryRdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query boolean type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareQueryRdb0103', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertBoolean).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesBoolean, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetBoolean))
            .assertEqual(globalThis.ResultSet.getString(globalThis.ResultSet.getColumnIndex(IndexBoolean)));
        }).catch((err) => {
          console.info("DataShareQueryRdb0103 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareQueryRdb0103 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareQueryRdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query Uint8Array type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareQueryRdb0104', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertUint8Array).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesUint8Array, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUint8Array))
            .assertEqual(
            JSON.stringify(globalThis.ResultSet.getBlob(globalThis.ResultSet.getColumnIndex(IndexUint8Array))));
        }).catch((err) => {
          console.info("DataShareQueryRdb0104 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareQueryRdb0104 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareQueryRdb0105
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query null type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareQueryRdb0105', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNull).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesNull, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(ResultSetNull)
            .assertEqual(globalThis.ResultSet.getString(globalThis.ResultSet.getColumnIndex(IndexNull)));
        }).catch((err) => {
          console.info("DataShareQueryRdb0105 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareQueryRdb0105 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDeleteRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete number type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDeleteRdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNumber).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesNumber).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDeleteRdb0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDeleteRdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDeleteRdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete string type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDeleteRdb0102', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertString).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesString).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDeleteRdb0102 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDeleteRdb0102 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDeleteRdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete boolean type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDeleteRdb0103', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertBoolean).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesBoolean).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDeleteRdb0103 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDeleteRdb0103 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDeleteRdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete Uint8Array type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDeleteRdb0104', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertUint8Array).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesUint8Array).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDeleteRdb0104 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDeleteRdb0104 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDeleteRdb0105
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete nul type data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDeleteRdb0105', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, InsertNull).then((data) => {
          console.info("TestDataShare going insert = " + data);
          globalThis.Count += 1;
          expect(globalThis.Count).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesNull).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDeleteRdb0105 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDeleteRdb0105 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : BatchInsert data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchRdb0101', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          globalThis.Count += DataProcessResultFour;
          expect(DataProcessResultFour).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharebatchRdb001 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultFour).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataSharebatchRdb001 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchRdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchRdb0102', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          globalThis.Count += DataProcessResultFour;
          expect(DataProcessResultFour).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, PredicatesAll, UpdateNumber).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultFour).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareBatchRdb0102 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultFour).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareBatchRdb0102 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchRdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchRdb0103', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          globalThis.Count += DataProcessResultFour;
          expect(DataProcessResultFour).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, PredicatesAll, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToLastRow();
          expect(JSON.stringify(ResultSetUint8Array))
            .assertEqual(
            JSON.stringify(globalThis.ResultSet.getBlob(globalThis.ResultSet.getColumnIndex(IndexUint8Array))));
        }).catch((err) => {
          console.info("DataShareBatchRdb003 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultFour).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareBatchRdb003 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchRdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete data in Rdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchRdb0104', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          globalThis.Count += DataProcessResultFour;
          expect(DataProcessResultFour).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultFour).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareBatchRdb0104 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareBatchRdb0104 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareGetType0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support GetType function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('DataShareGetType0101', 0, async function (done) {
      try {
        await pubfun.publicgetType(globalThis.helper, uri).then((data) => {
          console.info("TestDataShare going getType = " + data);
          expect(GetType).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareGetType0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareGetType0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareGetFileTypes0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support GetFileTypes function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareGetFileTypes0101', 0, async function (done) {
      try {
        await pubfun.publicgetFileTypes(globalThis.helper, uri, "image/*").then((data) => {
          console.info("TestDataShare going getFileTypes = " + data);
          expect(JSON.stringify(GetFileTypes)).assertEqual(JSON.stringify(data));
          done();
        }).catch((err) => {
          console.info("DataShareGetFileTypes0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareGetFileTypes0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareNormalizeUri0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support NormalizeUri function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareNormalizeUri0101', 0, async function (done) {
      try {
        await pubfun.publicnormalizeUri(globalThis.helper, uri).then((data) => {
          console.info("TestDataShare going NormalizeUri = " + data);
          expect(Normalize).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareNormalizeUri0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareNormalizeUri0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDenormalizeUri0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support DenormalizeUri function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDenormalizeUri0101', 0, async function (done) {
      try {
        await pubfun.publicdenormalizeUri(globalThis.helper, uri).then((data) => {
          console.info("TestDataShare going denormalizeUri = " + data);
          expect(Denormalize).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDenormalizeUri0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDenormalizeUri0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareOnRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support On function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareOnRdb0101', 0, function () {
      try {
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going on");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going off");
      } catch (err) {
        console.info("DataShareOnRdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareOffRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support Off function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareOffRdb0101', 0, function () {
      try {
        globalThis.helper.off("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going off");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going off");
      } catch (err) {
        console.info("DataShareOffRdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareTypeErr0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Cannot on off operate
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 2
  */
    it('DataShareTypeErr0101', 2, function () {
      try {
        globalThis.helper.on(null, uri, onChangeNotify);
        console.info("TestDataShare going on");
        globalThis.helper.off(null, uri);
        console.info("TestDataShare going off");
      } catch (err) {
        console.info("DataShareTypeErr0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_CreateDataSharePromise0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : CreateDataShareHelperPromise
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('CreateDataSharePromise0101', 0, async function (done) {
      try {
        await dataShare.createDataShareHelper(globalThis.abilityContext, uri).then((data) => {
          console.info("TestDataShare CreateDataShareHelper = " + data);
          expect(true).assertEqual(data != undefined);
          done();
        }).catch((err) => {
          console.info("CreateDataSharePromise0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("CreateDataSharePromise0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareOpenFile0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support OpenFile function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareOpenFile0101', 0, async function (done) {
      try {
        await pubfun.publicopenFile(globalThis.helper, uri, Mode).then((data) => {
          console.info("TestDataShare going openFile = " + data);
          expect(true).assertEqual(data != null);
          done();
        }).catch((err) => {
          console.info("DataShareOpenFile0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareOpenFile0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })
  })
}