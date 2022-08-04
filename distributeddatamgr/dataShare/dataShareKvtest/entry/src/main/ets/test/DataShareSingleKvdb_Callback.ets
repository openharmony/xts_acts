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
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import * as pubfun from './DataSharePublicfunction_Callback'

//CreateDataShareHelper
let uri = ("datashare:///com.samples.datasharekvtest.DataShare");

//InsertValuesBucket
let Insert = { "name": "sun", "age": 1, "isStudent": true };
let BatchInsert = new Array(
  { "name": "sun", "age": 1, "isStudent": true },
  { "name": "sunn", "age": 10, "isStudent": false });

//UpdateValuesBucket
let Update = { "name": "suns", "age": 2, "isStudent": false };

//Predicates
let EqualTo = new dataSharePredicates.DataSharePredicates();
EqualTo.equalTo("$.age", 1);
let PredicatesDelete0 = new dataSharePredicates.DataSharePredicates();
PredicatesDelete0.inKeys(["testkey0"]);
let PredicatesDelete1 = new dataSharePredicates.DataSharePredicates();
PredicatesDelete1.inKeys(["testkey1"]);

//Return Expect
const DataProcessResultOne = 1;
const GetType = "image";
const GetFileTypes = new Array("type01", "type02", "type03");
const Normalize = "normalize+" + uri;
const Denormalize = "denormalize+" + uri;
const ResultSetInsert = { "name": "sun", "age": 1, "isStudent": "true" };
const Mode = "rwt";

function onChangeNotify() {
  console.info("===>onChangeNotify===>");
};

export default function DataShareSingleKvdb_Callback() {
  describe('DataShareSingleKvdb_Callback', function () {
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
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareInsertKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Insert All type data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareInsertKvdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareInsertKvdb0101 fail err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareInsertKvdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareUpdateKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update All type data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareUpdateKvdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareUpdateKvdb0101 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareUpdateKvdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareQueryKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query All type data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareQueryKvdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetInsert)).assertEqual(globalThis.ResultSet.getString(1));
        }).catch((err) => {
          console.info("DataShareQueryKvdb0101 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareQueryKvdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareDeleteKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete number type data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareDeleteKvdb0101', 0, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going insert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareDeleteKvdb0101 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareDeleteKvdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : BatchInsert data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchKvdb0101', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharebatchKvdb001 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete 0 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete1).then((data) => {
          console.info("TestDataShare going delete 1 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataSharebatchKvdb001 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchKvdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Update data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchKvdb0102', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareBatchKvdb0102 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete 0 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete1).then((data) => {
          console.info("TestDataShare going delete 1 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareBatchKvdb0102 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchKvdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Query data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchKvdb0103', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetInsert)).assertEqual(globalThis.ResultSet.getString(1));
        }).catch((err) => {
          console.info("DataShareBatchKvdb003 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete 0 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete1).then((data) => {
          console.info("TestDataShare going delete 1 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        })
      } catch (err) {
        console.info("DataShareBatchKvdb003 fail " + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareBatchKvdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Delete data in Kvdb
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareBatchKvdb0104', 0, async function (done) {
      try {
        await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete0).then((data) => {
          console.info("TestDataShare going delete 0 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataShareBatchKvdb0104 delete 0 err " + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete1).then((data) => {
          console.info("TestDataShare going delete 1 = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataShareBatchKvdb0104 delete 1 err " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataShareBatchKvdb0104 fail " + JSON.stringify(err));
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
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareOnKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support On function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareOnKvdb0101', 0, function () {
      try {
        globalThis.helper.on("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going on");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going off");
      } catch (err) {
        console.info("DataShareOnKvdb0101 fail " + JSON.stringify(err));
        expect(err).assertFail();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataShareOffKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : Support Off function
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 0
  */
    it('DataShareOffKvdb0101', 0, function () {
      try {
        globalThis.helper.off("dataChange", uri, onChangeNotify);
        console.info("TestDataShare going off");
        globalThis.helper.off("dataChange", uri);
        console.info("TestDataShare going off");
      } catch (err) {
        console.info("DataShareOffKvdb0101 fail " + JSON.stringify(err));
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