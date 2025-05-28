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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';
import { regExpSymbolMatch, regExpSymbolMatchAll } from '../testability/pages/RegexpUtils';

export default function builtinsRegExpSymbolMatchAllTest() {
  describe('builtinsRegExpSymbolMatchAllTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_MATCH_ALL_TEST_0100
     * @tc.name builtinsRegExpSymbolMatchAllTest0100
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpSymbolMatchAllTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpSymbolMatchAllTest0100';
      console.info(`${caseName} test start`);
      let reg = regExpSymbolMatchAll(/a/, 'abc');
      expect(reg.next().value).assertDeepEquals(['a']);
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_REGEXP_SYMBOL_MATCH_ALL_TEST_0200
     * @tc.name builtinsRegExpSymbolMatchAllTest0200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsRegExpSymbolMatchAllTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsRegExpSymbolMatchAllTest0200';
      console.info(`${caseName} test start`);
      let reg = regExpSymbolMatchAll(/[0-9]+/g, '2016-01-02');
      expect(reg.next().value).assertDeepEquals(['2016']);
      expect(reg.next().value).assertDeepEquals(['01']);
      expect(reg.next().value).assertDeepEquals(['02']);
      done();
      console.info(`${caseName} test end`);
    })
  })
}