/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import str, { str1, str2, str3, typeStr } from '../default/DefaultLetString'
import * as str5 from '../utils/StringAll'
import { str4 } from '../utils/StringNameAll'
import defaultStr from '../default/DefaultString'
import defaultTypeStr from "../default/DefaultTypeString";
import { sleep } from "../utils/Utils";

export default function exportStringTest() {
  describe('ExportStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0100
     * @tc.name exportStringTestTest1001
     * @tc.desc Test default let string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('exportStringTestTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(str).assertEqual("test");
    });

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0200
     * @tc.name exportStringTestTest1002
     * @tc.desc Test type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportStringTestTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let str: typeStr = 'typeStrTest';
      expect(str).assertEqual("typeStrTest");
    });

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0300
     * @tc.name exportStringTestTest1003
     * @tc.desc Test let inline string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportStringTestTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str1).assertEqual("test1");
    });

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0400
     * @tc.name exportStringTestTest1004
     * @tc.desc Test let string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportStringTestTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str2).assertEqual("test2");
    })

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0500
     * @tc.name exportStringTestTest1005
     * @tc.desc Test name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportStringTestTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str3).assertEqual("test2");
    })

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0600
     * @tc.name exportStringTestTest1006
     * @tc.desc Test *
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportStringTestTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str5.str1).assertEqual("test1");
      expect(str5.str2).assertEqual("test2");
      expect(str5.str3).assertEqual("test2");
    })

    /**
     * @tc.number SUB_EXPORT_STRING_TEST_0700
     * @tc.name exportStringTestTest1007
     * @tc.desc Test name *
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportStringTestTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str4.default).assertEqual("test");
      expect(str4.str1).assertEqual("test1");
      expect(str4.str2).assertEqual("test2");
      expect(str4.str3).assertEqual("test2");
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0800
     * @tc.name exportArrayTestTest1008
     * @tc.desc Test default string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(defaultStr).assertEqual('TestDefault');
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0900
     * @tc.name exportArrayTestTest1009
     * @tc.desc Test default type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: defaultTypeStr = "TestTypeDefault";
      expect(arr).assertEqual("TestTypeDefault");
    })
  });
}