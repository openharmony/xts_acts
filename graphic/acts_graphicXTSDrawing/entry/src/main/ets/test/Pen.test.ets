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

export default function penTest() {
  describe('pen_test', () => {
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
     * @tc.number    : pen_test_constructor
     * @tc.name      : pen_test_constructor
     * @tc.desc      : Pen's constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_constructor', DEFAULT, () => {
      const msg = 'pen_test_constructor';
      try {
        const pen = new drawing.Pen();
        console.info(msg + 'constructor successed');
      } catch (e) {
        console.info(msg + `constructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_setMaskFilter
     * @tc.name      : pen_test_setMaskFilter
     * @tc.desc      : Used to add an additional masking filter to the brush.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setMaskFilter', DEFAULT, () => {
      const msg = 'pen_test_setMaskFilter';
      try {
        const pen = new drawing.Pen();
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        pen.setMaskFilter(maskFilter);
        console.info(msg + 'setMaskFilter successed');
      } catch (e) {
        console.info(msg + `setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_setMaskFilter_param_null
     * @tc.name      : pen_test_setMaskFilter_param_null
     * @tc.desc      : Used to add an additional masking filter to the brush. (Parameters are empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setMaskFilter_param_null', DEFAULT, () => {
      const msg = 'pen_test_setMaskFilter_param_null';
      try {
        const pen = new drawing.Pen();
        pen.setMaskFilter(null);
        console.info(msg + 'setMaskFilter successed');
      } catch (e) {
        console.info(msg + `setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.number    : pen_test_setPathEffect
     * @tc.name      : pen_test_setPathEffect
     * @tc.desc      : Set the brush path effect.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setPathEffect', DEFAULT, () => {
      const msg = 'pen_test_setPathEffect';
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        let pathEffect = drawing.PathEffect.createDashPathEffect([30, 10], 0);
        pen.setPathEffect(pathEffect);
        console.info(msg + 'setPathEffect successed');
      } catch (e) {
        console.info(msg + `setPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_setPathEffect_param_null
     * @tc.name      : pen_test_setPathEffect_param_null
     * @tc.desc      : Set the brush path effect. (Parameters are empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setPathEffect_param_null', DEFAULT, () => {
      const msg = 'pen_test_setPathEffect_param_null';
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        pen.setPathEffect(null);
        console.info(msg + 'setPathEffect successed');
      } catch (e) {
        console.info(msg + `setPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.number    : pen_test_setShadowLayer
     * @tc.name      : pen_test_setShadowLayer
     * @tc.desc      : Sets the brush shadow layer effect. Empty means that the shadow layer effect is cleared and is currently only effective on text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setShadowLayer', DEFAULT, () => {
      const msg = 'pen_test_setShadowLayer';
      try {
        const pen = new drawing.Pen();
        let color: common2D.Color = {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        };
        let shadowLayer = drawing.ShadowLayer.create(3, -3, 3, color);
        pen.setShadowLayer(shadowLayer);
        console.info(msg + 'setShadowLayer successed');
      } catch (e) {
        console.info(msg + `setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_setShadowLayer_param_null
     * @tc.name      : pen_test_setShadowLayer_param_null
     * @tc.desc      : Sets the brush shadow layer effect. Empty means that the shadow layer effect is cleared and is currently only effective on text. (Parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setShadowLayer_param_null', DEFAULT, () => {
      const msg = 'pen_test_setShadowLayer_param_null';
      try {
        const pen = new drawing.Pen();
        pen.setShadowLayer(null);
        console.info(msg + 'setShadowLayer successed');
      } catch (e) {
        console.info(msg + `setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.number    : pen_test_setJoinStyle
     * @tc.name      : pen_test_setJoinStyle
     * @tc.desc      : Used to set the style in which the brush draws corners.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setJoinStyle', DEFAULT, () => {
      const msg = 'pen_test_setJoinStyle';
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        console.info(msg + 'setJoinStyle successed');
      } catch (e) {
        console.info(msg + `setJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_getJoinStyle
     * @tc.name      : pen_test_getJoinStyle
     * @tc.desc      : Used to get the style of the corner drawn by the brush.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_getJoinStyle', DEFAULT, () => {
      const msg = 'pen_test_getJoinStyle';
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        let joinStyle = pen.getJoinStyle();
        expect(joinStyle).assertEqual(drawing.JoinStyle.ROUND_JOIN)
        console.info(msg + 'getJoinStyle successed');
      } catch (e) {
        console.info(msg + `getJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_setCapStyle
     * @tc.name      : pen_test_setCapStyle
     * @tc.desc      : Used to set the line cap style.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_setCapStyle', DEFAULT, () => {
      const msg = 'pen_test_setCapStyle';
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        console.info(msg + 'setCapStyle successed');
      } catch (e) {
        console.info(msg + `setCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : pen_test_getCapStyle
     * @tc.name      : pen_test_getCapStyle
     * @tc.desc      : Used to get the line cap style.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('pen_test_getCapStyle', DEFAULT, () => {
      const msg = 'pen_test_getCapStyle';
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        let capStyle = pen.getCapStyle();
        expect(capStyle).assertEqual(drawing.CapStyle.SQUARE_CAP)
        console.info(msg + 'getCapStyle successed');
      } catch (e) {
        console.info(msg + `getCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

  })
}