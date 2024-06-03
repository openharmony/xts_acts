/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import hilog from '@ohos.hilog';

export default function samplingOptionsTest() {
  describe('samplingOptions_test', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number    : samplingOptions_test_constructor
     * @tc.name      : samplingOptions_test_constructor
     * @tc.desc      : Constructor for SamplingOptions.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('samplingOptions_test_constructor', DEFAULT, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const msg = 'samplingOptions_test_constructor';
      try {
        let samplingOptions = new drawing.SamplingOptions();
        console.info(msg + 'constructor successed');
        // Determine if an instance of SamplingOptions can be generated properly
        expect(samplingOptions instanceof drawing.SamplingOptions).assertTrue();
      } catch (e) {
        console.info(msg + `constructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}