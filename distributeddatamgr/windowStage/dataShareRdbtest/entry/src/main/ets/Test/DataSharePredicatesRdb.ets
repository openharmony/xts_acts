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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import dataShare from '@ohos.data.dataShare'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import * as pubfun from './DataSharePublicfunction_Promise'

//CreateDataShareHelper
let uri = "datashare:///com.samples.datasharetest.DataShare";

//InsertValuesBucket
let BatchInsert = new Array(
  { "name": "LiSi", "age": 18 },
  { "name": "WangWu", "age": 20 },
  { "name": "ZhaoLiu"});
let Insert = { "Name": "LiSi", "age": 18 };

//UpdateValuesBucket
let UpdateLiSi = { "name": "LiSii" };
let UpdateWangWu = { "name": "WangWuu" };
let UpdateZhaoLiu = { "name": "ZhaoLiuu" };

//Predicates
let EqualTo = new dataSharePredicates.DataSharePredicates();
EqualTo.equalTo("age", 18);
let NotEqualTo = new dataSharePredicates.DataSharePredicates();
NotEqualTo.notEqualTo("age", 18);
let GreaterThan = new dataSharePredicates.DataSharePredicates();
GreaterThan.greaterThan("age", 18);
let LessThan = new dataSharePredicates.DataSharePredicates();
LessThan.lessThan("age", 20);
let GreaterThanOrEqualTo = new dataSharePredicates.DataSharePredicates();
GreaterThanOrEqualTo.greaterThanOrEqualTo("age", 20);
let LessThanOrEqualTo = new dataSharePredicates.DataSharePredicates();
LessThanOrEqualTo.lessThanOrEqualTo("age", 18);
let IsNull = new dataSharePredicates.DataSharePredicates();
IsNull.isNull("age");
let IsNotNull = new dataSharePredicates.DataSharePredicates();
IsNotNull.isNotNull("age");
let In = new dataSharePredicates.DataSharePredicates();
In.in("age", [18]);
let NotIn = new dataSharePredicates.DataSharePredicates();
NotIn.notIn("age", [20]);
let Like = new dataSharePredicates.DataSharePredicates();
Like.like("name", "%iS%");
let And = new dataSharePredicates.DataSharePredicates();
And.beginsWith("name", "Li").and().equalTo("age", 18);
let Or = new dataSharePredicates.DataSharePredicates();
Or.beginsWith("name", "Li").or().equalTo("age", 18);
let OrderByAsc = new dataSharePredicates.DataSharePredicates();
OrderByAsc.orderByAsc("age");
let OrderByDesc = new dataSharePredicates.DataSharePredicates();
OrderByDesc.orderByDesc("age");
let Wrap = new dataSharePredicates.DataSharePredicates();
Wrap.beginsWith("name", "Li").beginWrap().equalTo("age", 18).endWrap();
let Contains = new dataSharePredicates.DataSharePredicates();
Contains.contains("name", "LiSi");
let BeginsWith = new dataSharePredicates.DataSharePredicates();
BeginsWith.beginsWith("name", "Li");
let EndsWith = new dataSharePredicates.DataSharePredicates();
EndsWith.endsWith("name", "i");
let Glob = new dataSharePredicates.DataSharePredicates();
Glob.glob("name", "*i");
let Between = new dataSharePredicates.DataSharePredicates();
Between.between("age", 18, 19)
let NotBetween = new dataSharePredicates.DataSharePredicates();
NotBetween.notBetween("age", 19, 20);
let Distinct = new dataSharePredicates.DataSharePredicates();
Distinct.equalTo("age", 18).distinct();
let GroupBy = new dataSharePredicates.DataSharePredicates();
GroupBy.groupBy(["name"]);
let IndexedBy = new dataSharePredicates.DataSharePredicates();
let PredicatesAll = new dataSharePredicates.DataSharePredicates();

//Return Expect
const DataProcessResultOne = 1;
const DataProcessResultTwo = 2;
const RetLiSii = "LiSii";
const RetLiSi = "LiSi";
const RetWangWuu = "WangWuu";
const RetWangWu = "WangWu";
const RetZhaoLiuu = "ZhaoLiuu";
const RetZhaoLiu = "ZhaoLiu";

const Name = "name";

let Column;

export default function DataSharePredicatesRdb() {
  describe('DataSharePredicatesRdb', function () {
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

    beforeEach(async function () {
      await pubfun.publicbatchInsert(globalThis.helper, uri, BatchInsert).then((data) => {
        console.info("TestDataShare going batchInsert = " + data);
      })
    })
    afterEach(async function () {
      await pubfun.publicdelete(globalThis.helper, uri, PredicatesAll).then((data) => {
        console.info("TestDataShare going deleteall = " + data);
      })
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0101', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0101 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, EqualTo).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0101 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0102', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, NotEqualTo, UpdateWangWu).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0102 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, NotEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetWangWuu).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0102 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, NotEqualTo).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0102 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0102 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0103', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, GreaterThan, UpdateWangWu).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0103 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, GreaterThan, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetWangWuu).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0103 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, GreaterThan).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0103 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0103 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0104', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, LessThan, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0104 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, LessThan, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0104 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, LessThan).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0104 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0104 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0105
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0105', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, GreaterThanOrEqualTo, UpdateWangWu).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0105 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, GreaterThanOrEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetWangWuu).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0105 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, GreaterThanOrEqualTo).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0105 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0105 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0106
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0106', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, LessThanOrEqualTo, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0106 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, LessThanOrEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0106 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, LessThanOrEqualTo).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0106 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb006 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0107
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0107', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, IsNull, UpdateZhaoLiu).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0107 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, IsNull, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToLastRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetZhaoLiuu).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0107 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, IsNull).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0107 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0107 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0108
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0108', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, IsNotNull, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultTwo).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0108 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, IsNotNull, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0108 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, IsNotNull).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultTwo).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0108 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0108 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0109
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0109', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, In, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0109 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, In, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0109 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, In).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0109 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0109 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0110
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0110', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, NotIn, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0110 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, NotIn, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0110 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, NotIn).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0110 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0110 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0111
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0111', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Like, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0111 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Like, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0111 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, Like).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0111 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0111 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0112
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0112', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, And, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0112 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, And, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0112 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, And).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0112 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0112 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0113
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0113', 0, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Or, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0113 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Or, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0113 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, Or).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0113 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0113 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0114
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0114', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, OrderByAsc, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetZhaoLiu).assertEqual(globalThis.ResultSet.getString(Column));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0114 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0114 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0115
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0115', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, OrderByDesc, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetWangWu).assertEqual(globalThis.ResultSet.getString(Column));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0115 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0115 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0116
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0116', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, Wrap, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSi).assertEqual(globalThis.ResultSet.getString(Column));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0116 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0116 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0117
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0117', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Contains, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0117 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Contains, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0117 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, Contains).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0117 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0117 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0118
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0118', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, BeginsWith, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0118 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, BeginsWith, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0118 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, BeginsWith).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0118 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0118 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0119
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0119', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, EndsWith, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0119 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EndsWith, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0119 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, EndsWith).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0119 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0119 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0120
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0120', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Glob, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0120 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Glob, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0120 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, Glob).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0120 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0120 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0121
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0121', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Between, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0121 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Between, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0121 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, Between).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0121 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0121 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0122
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0122', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, NotBetween, UpdateLiSi).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0122 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, NotBetween, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSii).assertEqual(globalThis.ResultSet.getString(Column));
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0122 query err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicdelete(globalThis.helper, uri, NotBetween).then((data) => {
          console.info("TestDataShare going delete = " + data);
          expect(DataProcessResultOne).assertEqual(data);
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0122 delete err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0122 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0123
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0123', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, Distinct, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSi).assertEqual(globalThis.ResultSet.getString(Column));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0123 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0123 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0124
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0124', 1, async function (done) {
      try {
        pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
        })
        await pubfun.publicquery(globalThis.helper, uri, GroupBy, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSi).assertEqual(globalThis.ResultSet.getString(Column));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0124 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0124 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesRdb0125
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesRdb0125', 1, async function (done) {
      try {
        await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
          console.info("TestDataShare going batchInsert = " + data);
          IndexedBy.indexedBy(globalThis.insertdata);
        })
        await pubfun.publicquery(globalThis.helper, uri, IndexedBy, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToLastRow();
          Column = globalThis.ResultSet.getColumnIndex(Name);
          expect(RetLiSi).assertEqual(globalThis.ResultSet.getString(Column));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesRdb0125 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesRdb0125 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })
  })
}