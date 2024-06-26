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
import { getEnumCount } from './utils';

export default function colorFilterTest() {
  describe('DrawingTsColorFilterTest', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0100
     * @tc.name      : testColorFilterCreateBlendModeColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateBlendModeColorFilterNormal', DEFAULT, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterNormal';

      try {
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.CLEAR);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_OVER);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_OVER);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_IN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_IN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_OUT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_OUT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_ATOP);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_ATOP);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.XOR);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.MODULATE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SCREEN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.OVERLAY);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DARKEN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.LIGHTEN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR_DODGE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR_BURN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.HARD_LIGHT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SOFT_LIGHT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DIFFERENCE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.EXCLUSION);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.MULTIPLY);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.HUE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SATURATION);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.LUMINOSITY);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 254.66, red: 254.555, green: 125.3, blue: 10.222
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0101
     * @tc.name      : testColorFilterCreateBlendModeColorFilterNull
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterNull', DEFAULT, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterNull';

      try {
        drawing.ColorFilter.createBlendModeColorFilter(undefined, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, undefined);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter(undefined, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, undefined);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: undefined, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: undefined, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: undefined, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: undefined
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: null, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: null, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: null, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: null
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0102
     * @tc.name      : testColorFilterCreateBlendModeColorFilterMismatch
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterMismatch', DEFAULT, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterMismatch';

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter('s', drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0103
     * @tc.name      : testColorFilterCreateBlendModeColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterMultipleCalls', DEFAULT, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterMultipleCalls';

      for (let i = 0; i < 20; i++) {
        const randomColor: common2D.Color = {
          alpha: Math.floor(Math.random() * 256),
          red: Math.floor(Math.random() * 256),
          green: Math.floor(Math.random() * 256),
          blue: Math.floor(Math.random() * 256)
        };
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.BlendMode));

        try {
          drawing.ColorFilter.createBlendModeColorFilter(randomColor, randomEnum);
          console.info(msg + ' createBlendModeColorFilter succeeded');
        } catch (e) {
          console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0104
     * @tc.name      : testColorFilterCreateBlendModeColorFilterBoundaryValue
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterBoundaryValue.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterBoundaryValue', DEFAULT, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterBoundaryValue';

      const randomColor = {
        alpha: Math.floor(Math.random() * 256),
        red: Math.floor(Math.random() * 256),
        green: Math.floor(Math.random() * 256),
        blue: Math.floor(Math.random() * 256)
      };
      const enumCount = getEnumCount(drawing.BlendMode);
      for (let i = 0; i < enumCount; i++) {
        try {
          drawing.ColorFilter.createBlendModeColorFilter(randomColor, i);
          console.info(msg + ' createBlendModeColorFilter succeeded');
        } catch (e) {
          console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: -1, red: 255, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 256, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: -1, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 256, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: -1, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 256
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: -1
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0200
     * @tc.name      : testColorFilterCreateComposeColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateComposeColorFilterNormal', DEFAULT, () => {
      const msg = 'testColorFilterCreateComposeColorFilterNormal';

      let colorFilter1: drawing.ColorFilter | null = null;
      try {
        colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      let colorFilter2: drawing.ColorFilter | null = null;
      try {
        colorFilter2 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.DST);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, colorFilter2);
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, drawing.ColorFilter.createSRGBGammaToLinear());
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(drawing.ColorFilter.createSRGBGammaToLinear(), colorFilter2);
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(drawing.ColorFilter.createSRGBGammaToLinear(), drawing.ColorFilter.createLumaColorFilter());
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0201
     * @tc.name      : testColorFilterCreateComposeColorFilterNull
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateComposeColorFilterNull', DEFAULT, () => {
      const msg = 'testColorFilterCreateComposeColorFilterNull';

      let colorFilter1: drawing.ColorFilter | null = null;
      let colorFilter2: drawing.ColorFilter | null = null;
      try {
        colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        colorFilter2 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.DST);
      } catch (e) {
        console.info(`createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(undefined, colorFilter2);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, undefined);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(null, colorFilter2);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, null);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0202
     * @tc.name      : testColorFilterCreateComposeColorFilterMismatch
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateComposeColorFilterMismatch', DEFAULT, () => {
      const msg = 'testColorFilterCreateComposeColorFilterMismatch';

      try {
        const filter1 = drawing.ColorFilter.createSRGBGammaToLinear();
        const filter2 = drawing.ColorFilter.createLumaColorFilter();
        drawing.ColorFilter.createComposeColorFilter(filter1, filter2);
        drawing.ColorFilter.createLumaColorFilter();
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const filter = drawing.ColorFilter.createSRGBGammaToLinear();
        drawing.ColorFilter.createComposeColorFilter(filter);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const filter = drawing.ColorFilter.createLumaColorFilter();
        drawing.ColorFilter.createComposeColorFilter(111, filter);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0203
     * @tc.name      : testColorFilterCreateComposeColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateComposeColorFilterMultipleCalls', DEFAULT, () => {
      const msg = 'testColorFilterCreateComposeColorFilterMultipleCalls';
      const filters = [
        drawing.ColorFilter.createSRGBGammaToLinear(),
        drawing.ColorFilter.createLumaColorFilter(),
        drawing.ColorFilter.createLinearToSRGBGamma(),
      ];
      for (let i = 0; i < 20; i++) {
        const randomFilter1 = filters[Math.floor(Math.random() * 3)];
        const randomFilter2 = filters[Math.floor(Math.random() * 3)];
        try {
          drawing.ColorFilter.createComposeColorFilter(randomFilter1, randomFilter2);
          console.info(msg + ' createComposeColorFilter succeeded');
        } catch (e) {
          console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0300
     * @tc.name      : testColorFilterCreateLinearToSRGBGammaNormal
     * @tc.desc      : Test for testColorFilterCreateLinearToSRGBGammaNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateLinearToSRGBGammaNormal', DEFAULT, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaNormal';
      try {
        drawing.ColorFilter.createLinearToSRGBGamma();
        console.info(msg + ' createLinearToSRGBGamma successed');
      } catch (e) {
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0301
     * @tc.name      : testColorFilterCreateLinearToSRGBGammaMismatch
     * @tc.desc      : Test for testColorFilterCreateLinearToSRGBGammaMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLinearToSRGBGammaMismatch', DEFAULT, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaMismatch';
      try {
        drawing.ColorFilter.createLinearToSRGBGamma(11);
        console.info(msg + ' createLinearToSRGBGamma successed');
      } catch (e) {
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0302
     * @tc.name      : testColorFilterCreateLinearToSRGBGammaMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateLinearToSRGBGammaMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLinearToSRGBGammaMultipleCalls', DEFAULT, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaMultipleCalls';
      try {
        for (let i = 0; i < 20; i++) {
          drawing.ColorFilter.createLinearToSRGBGamma();
          console.info(msg + ' createLinearToSRGBGamma successed');
        }
      } catch (e) {
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0400
     * @tc.name      : testColorFilterCreateSRGBGammaToLinearNormal
     * @tc.desc      : Test for testColorFilterCreateSRGBGammaToLinearNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateSRGBGammaToLinearNormal', DEFAULT, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearNormal';
      try {
        drawing.ColorFilter.createSRGBGammaToLinear();
        console.info(msg + ' createSRGBGammaToLinear successed');
      } catch (e) {
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0401
     * @tc.name      : testColorFilterCreateSRGBGammaToLinearMismatch
     * @tc.desc      : Test for testColorFilterCreateSRGBGammaToLinearMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateSRGBGammaToLinearMismatch', DEFAULT, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearMismatch';
      try {
        drawing.ColorFilter.createSRGBGammaToLinear(11);
        console.info(msg + ' createSRGBGammaToLinear successed');
      } catch (e) {
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0402
     * @tc.name      : testColorFilterCreateSRGBGammaToLinearMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateSRGBGammaToLinearMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateSRGBGammaToLinearMultipleCalls', DEFAULT, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearMultipleCalls';
      try {
        for (let i = 0; i < 20; i++) {
          drawing.ColorFilter.createSRGBGammaToLinear();
          console.info(msg + ' createSRGBGammaToLinear successed');
        }
      } catch (e) {
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0500
     * @tc.name      : testColorFilterCreateLumaColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateLumaColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateLumaColorFilterNormal', DEFAULT, () => {
      const msg = 'testColorFilterCreateLumaColorFilterNormal';
      try {
        drawing.ColorFilter.createLumaColorFilter();
        console.info(msg + ' createLumaColorFilter successed');
      } catch (e) {
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0501
     * @tc.name      : testColorFilterCreateLumaColorFilterMismatch
     * @tc.desc      : Test for testColorFilterCreateLumaColorFilterMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLumaColorFilterMismatch', DEFAULT, () => {
      const msg = 'testColorFilterCreateLumaColorFilterMismatch';
      try {
        drawing.ColorFilter.createLumaColorFilter(11);
        console.info(msg + ' createLumaColorFilter successed');
      } catch (e) {
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0502
     * @tc.name      : testColorFilterCreateLumaColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateLumaColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLumaColorFilterMultipleCalls', DEFAULT, () => {
      const msg = 'testColorFilterCreateLumaColorFilterMultipleCalls';
      try {
        for (let i = 0; i < 20; i++) {
          drawing.ColorFilter.createLumaColorFilter();
          console.info(msg + ' createLumaColorFilter successed');
        }
      } catch (e) {
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

  });
}