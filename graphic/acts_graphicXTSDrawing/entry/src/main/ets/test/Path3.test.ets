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
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';

export default function drawingTsPath3Test() {
  describe('DrawingTsPath3Test', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1800
     * @tc.name      : testPathGetLengthNormal
     * @tc.desc      : testPathGetLengthNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathGetLengthNormal', DEFAULT, () => {
      const msg = 'testPathGetLengthNormal';

      try {
        let path = new drawing.Path();
        let len = path.getLength(false);

        path.moveTo(0, 0);
        path.arcTo(20, 20, 180, 180, 180, 90);
        len = path.getLength(false);

        len = path.getLength(true);

        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1801
     * @tc.name      : testPathGetLengthMultipleCalls
     * @tc.desc      : testPathGetLengthMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetLengthMultipleCalls', DEFAULT, () => {
      const msg = 'testPathGetLengthMultipleCalls';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          path.getLength(true);
        }

        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1802
     * @tc.name      : testPathGetLengthToNull
     * @tc.desc      : testPathGetLengthToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetLengthToNull', DEFAULT, () => {
      const msg = 'testPathGetLengthToNull';

      try {
        let path = new drawing.Path();
        path.getLength(null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let path = new drawing.Path();
        path.getLength(undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })

  })
}