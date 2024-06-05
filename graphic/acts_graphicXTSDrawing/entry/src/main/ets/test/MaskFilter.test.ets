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
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';

export default function maskFilterTest() {
  describe('maskFilter_test', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
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
     * @tc.number    : maskFilter_test_createBlurMaskFilter
     * @tc.name      : maskFilter_test_createBlurMaskFilter
     * @tc.desc      : Used to create a masking filter with a blurring effect.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('maskFilter_test_createBlurMaskFilter', DEFAULT, () => {
      const msg = 'maskFilter_test_createBlurMaskFilter';
      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        console.info(msg + 'createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + `createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : maskFilter_test_createBlurMaskFilter_param_null
     * @tc.name      : maskFilter_test_createBlurMaskFilter_param_null
     * @tc.desc      : Used to create a masking filter with a blurring effect. (Parameters are empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it("maskFilter_test_createBlurMaskFilter_param_null", DEFAULT, () => {
      const msg = 'maskFilter_test_createBlurMaskFilter_param_null';
      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, null);
        console.info(msg + 'createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + `createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.number    : maskFilter_test_createBlurMaskFilter_param_invalid
     * @tc.name      : maskFilter_test_createBlurMaskFilter_param_invalid
     * @tc.desc      : Used to create a masking filter with a blurring effect. (Parameters illegal)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it("maskFilter_test_createBlurMaskFilter_param_invalid", DEFAULT, () => {
      const msg = 'maskFilter_test_createBlurMaskFilter_param_invalid';
      try {
        drawing.MaskFilter.createBlurMaskFilter(9999, 10);
        console.info(msg + 'createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + `createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
  })
}