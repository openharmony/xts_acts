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
import * as pubfun from './DataSharePublicfunction_Promise'

//CreateDataShareHelper
let uri = "datashare:///com.samples.datasharekvtest.DataShare";

//InsertValuesBucket
let Insert = { "name": "sun", "age": 1, "isStudent": true };

//UpdateValuesBucket
let Update = { "name": "sun", "age": 1, "isStudent": false };

//Predicates
let EqualTo = new dataSharePredicates.DataSharePredicates();
EqualTo.equalTo("$.age", 1);
let NotEqualTo = new dataSharePredicates.DataSharePredicates();
NotEqualTo.notEqualTo("$.age", 2);
let GreaterThan = new dataSharePredicates.DataSharePredicates();
GreaterThan.greaterThan("$.age", 0);
let LessThan = new dataSharePredicates.DataSharePredicates();
LessThan.lessThan("$.age", 3);
let GreaterThanOrEqualTo = new dataSharePredicates.DataSharePredicates();
GreaterThanOrEqualTo.greaterThanOrEqualTo("$.age", 1);
let LessThanOrEqualTo = new dataSharePredicates.DataSharePredicates();
LessThanOrEqualTo.lessThanOrEqualTo("$.age", 1);
let IsNull = new dataSharePredicates.DataSharePredicates();
IsNull.isNull("$.age");
let IsNotNull = new dataSharePredicates.DataSharePredicates();
IsNotNull.isNotNull("$.age");
let In = new dataSharePredicates.DataSharePredicates();
In.in("$.age", [1]);
let NotIn = new dataSharePredicates.DataSharePredicates();
NotIn.notIn("$.age", [2]);
let Like = new dataSharePredicates.DataSharePredicates();
Like.like("$.name", "%u%");
let UnLike = new dataSharePredicates.DataSharePredicates();
UnLike.unlike("$.name", "%i%");
let And = new dataSharePredicates.DataSharePredicates();
And.notEqualTo("$.age", 2).and().equalTo("$.age", 1);
let Or = new dataSharePredicates.DataSharePredicates();
Or.equalTo("$.isStudent", true).or().equalTo("$.age", 1);
let OrderByAsc = new dataSharePredicates.DataSharePredicates();
OrderByAsc.orderByAsc("$.age");
let OrderByDesc = new dataSharePredicates.DataSharePredicates();
OrderByDesc.orderByDesc("$.age");
let Limit = new dataSharePredicates.DataSharePredicates();
Limit.equalTo("$.age", 1).limit(1,0);
let InKeys = new dataSharePredicates.DataSharePredicates();
InKeys.inKeys(["testkey0"]);
let PrefixKey = new dataSharePredicates.DataSharePredicates();
PrefixKey.prefixKey("testkey");
let PredicatesDelete = new dataSharePredicates.DataSharePredicates();
PredicatesDelete.inKeys(["testkey0"]);

//Return Expect
const DataProcessResultOne = 1;
const ResultSetUpdate = { "name": "sun", "age": 1, "isStudent": "false" };
const ResultSetInsert = { "name": "sun", "age": 1, "isStudent": "true" };

export default function DataSharePredicatesKvdb() {
  describe('DataSharePredicatesKvdb', function () {
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
      await pubfun.publicinsert(globalThis.helper, uri, Insert).then((data) => {
        console.info("TestDataShare going Insert = " + data);
      })
    })
    afterEach(async function () {
      await pubfun.publicdelete(globalThis.helper, uri, PredicatesDelete).then((data) => {
        console.info("TestDataShare going deleteall = " + data);
      })
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0101
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0101', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, EqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0101 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, EqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0101 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0101 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0102
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0102', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, NotEqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0102 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, NotEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0102 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0102 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0103
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0103', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, GreaterThan, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0103 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, GreaterThan, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0103 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0103 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0104
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0104', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, LessThan, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0104 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, LessThan, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0104 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0104 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0105
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0105', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, GreaterThanOrEqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0105 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, GreaterThanOrEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0105 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0105 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0106
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0106', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, LessThanOrEqualTo, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0106 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, LessThanOrEqualTo, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0106 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb006 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0107
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0107', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, IsNull, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          expect(false).assertEqual(globalThis.ResultSet.goToLastRow());
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0107 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0107 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0108
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0108', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, IsNotNull, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0108 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, IsNotNull, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0108 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0108 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0109
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0109', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, In, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0109 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, In, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0109 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0109 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0110
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0110', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, NotIn, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0110 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, NotIn, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0110 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0110 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0111
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0111', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Like, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0111 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Like, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0111 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0111 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0112
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0112', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, UnLike, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0112 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Like, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0112 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0112 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0113
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0113', 1, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, And, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0113 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, And, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0113 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0113 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0114
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0114', 0, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, Or, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0114 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, Or, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0114 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0114 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0115
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0115', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, OrderByAsc, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetInsert)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0115 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0115 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0116
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0116', 1, async function (done) {
      try {
        await pubfun.publicquery(globalThis.helper, uri, OrderByAsc, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetInsert)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0116 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0116 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0118
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0118', 0, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, InKeys, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0118 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, InKeys, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0118 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0118 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })

    /*
      * @tc.number    : SUB_DDM_DataShare_ETS_DataSharePredicatesKvdb0119
      * @tc.name      : Use getEntries get the value by mixing the string key
      * @tc.desc      : DataShare Supports Predicates
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level 1
  */
    it('DataSharePredicatesKvdb0119', 0, async function (done) {
      try {
        await pubfun.publicupdate(globalThis.helper, uri, PrefixKey, Update).then((data) => {
          console.info("TestDataShare going update = " + data);
          expect(DataProcessResultOne).assertEqual(data);
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0118 Update err" + JSON.stringify(err));
          expect(err).assertFail();
        })
        await pubfun.publicquery(globalThis.helper, uri, PrefixKey, ["*"]).then((data) => {
          console.info("TestDataShare going query = " + data);
          globalThis.ResultSet.goToFirstRow();
          expect(JSON.stringify(ResultSetUpdate)).assertEqual(globalThis.ResultSet.getString(1));
          done();
        }).catch((err) => {
          console.info("DataSharePredicatesKvdb0119 query err" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (err) {
        console.info("DataSharePredicatesKvdb0119 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      }
    })
  })
}