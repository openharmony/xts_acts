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
import common2D from '@ohos.graphics.common2D';

export default function brushTest() {
  describe('brush_test', () => {
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
     * @tc.number    : brush_test_setMaskFilter
     * @tc.name      : brush_test_setMaskFilter
     * @tc.desc      : Used to add additional masking filters to brushes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('brush_test_setMaskFilter', DEFAULT, () => {
      const msg = 'brush_test_setMaskFilter';
      try {
        const brush = new drawing.Brush();
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        brush.setMaskFilter(maskFilter);
        console.info(msg + 'setMaskFilter successed');
      } catch (e) {
        console.info(msg + `setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : brush_test_setMaskFilter_param_null
     * @tc.name      : brush_test_setMaskFilter_param_null
     * @tc.desc      : Used to add an additional masking filter to the brush (parameter is empty).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('brush_test_setMaskFilter_param_null', DEFAULT, () => {
      const msg = 'brush_test_setMaskFilter_param_null';
      try {
        const brush = new drawing.Brush();
        brush.setMaskFilter(null);
        console.info(msg + 'setMaskFilter successed');
      } catch (e) {
        console.info(msg + `setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.number    : brush_test_setShadowLayer
     * @tc.name      : brush_test_setShadowLayer
     * @tc.desc      : Sets the brush shadow layer effect. Empty means that the shadow layer effect is cleared and is currently only effective on text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('brush_test_setShadowLayer', DEFAULT, () => {
      const msg = 'brush_test_setShadowLayer';
      try {
        let color: common2D.Color = {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        };
        let shadowLayer = drawing.ShadowLayer.create(3, -3, 3, color);
        const brush = new drawing.Brush();
        brush.setShadowLayer(shadowLayer);
        console.info(msg + 'setShadowLayer successed');
      } catch (e) {
        console.info(msg + `setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : brush_test_setShadowLayer_param_null
     * @tc.name      : brush_test_setShadowLayer_param_null
     * @tc.desc      : Sets the brush shadow layer effect. Empty means clear the shadow layer effect, which currently only works on text (parameter is empty).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('brush_test_setShadowLayer_param_null', DEFAULT, () => {
      const msg = 'brush_test_setShadowLayer_param_null';
      try {
        const brush = new drawing.Brush();
        brush.setShadowLayer(null);
        console.info(msg + 'setShadowLayer successed');
      } catch (e) {
        console.info(msg + `setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

  })
}