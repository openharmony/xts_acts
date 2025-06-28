/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import common from "@ohos.app.ability.common";
import data_dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { ValueType, ValuesBucket} from '@ohos.data.ValuesBucket'

let domain: number = 0x0000;
let tag: string = 'testTag';

const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS test "
  + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "name TEXT NOT NULL  , age INTEGER , salary REAL , blobType BLOB ) ;";

let context: common.UIAbilityContext;
let str: ValueType = "zhangSan";
let num: ValueType = 18;
let bool: ValueType = true;
let vb: ValuesBucket = {
  "name": str,
  "age": num,
  "isStudent": bool
}

export default function dataSharePredicatesTest() {
  describe('dataSharePredicatesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll')
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext", Type.from<common.UIAbilityContext>()) as common.UIAbilityContext
    })

    /**
     * @tc.name       : testOrderByAsc0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0010
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOrderByAsc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan");
        predicates.orderByAsc("id");
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e: BusinessError) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name       : testOrderByDesc0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0020
     * @tc.desc       : predicates orderByDesc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOrderByDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan");
        predicates.orderByDesc("id");
        hilog.info(domain, tag, "update predicates " + predicates)
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e: BusinessError) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

/**
     * @tc.name       : testAnd0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0030
     * @tc.desc       : predicates and normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan");
        predicates.and();
        predicates.equalTo("age", 18);
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e: BusinessError) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name       : testIn0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0040
     * @tc.desc       : predicates in normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {

      try {
        let numbersArr = new Array<ValueType>(255, 11.6, 13.0);
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in("age", numbersArr);
        expect(predicates != null && predicates != undefined).assertTrue()
      } catch (e: BusinessError) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " + e.message)
      }
    })

    /**
     * @tc.name       : testLimit0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0050
     * @tc.desc       : predicates limit normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLimit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try{
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan").limit(10, 3);
        expect(predicates != null && predicates != undefined).assertTrue()
      }catch (e: BusinessError) {
        expect().assertFail()
        hilog.info(domain, tag, "update fail err.code is " + e.code + "err.message is " +e.message)
      }
    })
  })
}