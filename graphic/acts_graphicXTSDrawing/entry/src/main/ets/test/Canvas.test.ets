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

export default function canvasTest() {
  describe('canvas_test', () => {
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
     * @tc.number    : canvas_test_drawPoint
     * @tc.name      : canvas_test_drawPoint
     * @tc.desc      : Used to draw a point.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_drawPoint', DEFAULT, () => {
      const msg = 'canvas_test_drawPoint';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawPoint(10, 10);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_drawPoint_param_null
     * @tc.name      : canvas_test_drawPoint_param_null
     * @tc.desc      : Used to draw a point. (Parameters are empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_drawPoint_param_null', DEFAULT, () => {
      const msg = 'canvas_test_drawPoint_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawPoint(10, null);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawPoint(null, 0);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawPoint(null, null);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_save
     * @tc.name      : canvas_test_save
     * @tc.desc      : Used to save the current canvas state (canvas matrix) to the top of the stack.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_save', DEFAULT, () => {
      const msg = 'canvas_test_save';
      try {
        const canvas = new drawing.Canvas(pixel);
        let rect: common2D.Rect = {
          left: 10, right: 200, top: 100, bottom: 300
        };
        canvas.drawRect(rect);
        let saveCount = canvas.save();
        console.info(msg + 'save successed');
      } catch (e) {
        console.info(msg + `save errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_save
     * @tc.name      : canvas_test_save
     * @tc.desc      : Used to restore the canvas state (canvas matrix) saved at the top of the stack.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_restore', DEFAULT, () => {
      const msg = 'canvas_test_restore';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.restore();
        canvas.detachPen();
        console.info(msg + 'restore successed');
      } catch (e) {
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_restoreToCount
     * @tc.name      : canvas_test_restoreToCount
     * @tc.desc      : Used to revert to a specified number of canvas states (canvas matrices).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_restoreToCount', DEFAULT, () => {
      const msg = 'canvas_test_restoreToCount';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 10, right: 200, top: 100, bottom: 300
        });
        canvas.save();
        canvas.drawRect({
          left: 10, right: 200, top: 100, bottom: 500
        });
        canvas.save();
        canvas.drawRect({
          left: 100, right: 300, top: 100, bottom: 500
        });
        canvas.save();
        canvas.restoreToCount(2);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_restoreToCount_param_null
     * @tc.name      : canvas_test_restoreToCount_param_null
     * @tc.desc      : Used to revert to a specified number of canvas states (canvas matrices). (parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_restoreToCount_param_null', DEFAULT, () => {
      const msg = 'canvas_test_restoreToCount_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 10, right: 200, top: 100, bottom: 300
        });
        canvas.save();
        canvas.drawRect({
          left: 10, right: 200, top: 100, bottom: 500
        });
        canvas.save();
        canvas.drawRect({
          left: 100, right: 300, top: 100, bottom: 500
        });
        canvas.save();
        canvas.restoreToCount(null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_getSaveCount
     * @tc.name      : canvas_test_getSaveCount
     * @tc.desc      : Used to get the number of canvas states (canvas matrix) saved in the stack.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_getSaveCount', DEFAULT, () => {
      const msg = 'canvas_test_getSaveCount';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 10, right: 200, top: 100, bottom: 300
        });
        canvas.save();
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.getSaveCount();
        canvas.detachPen();
        console.info(msg + 'getSaveCount successed');
      } catch (e) {
        console.info(msg + `getSaveCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_scale
     * @tc.name      : canvas_test_scale
     * @tc.desc      : Used for canvas scaling.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_scale', DEFAULT, () => {
      const msg = 'canvas_test_scale';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.scale(2, 0.5);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_scale_param_null
     * @tc.name      : canvas_test_scale_param_null
     * @tc.desc      : Used for canvas scaling. (Parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_scale_param_null', DEFAULT, () => {
      const msg = 'canvas_test_scale_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.scale(null, null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.scale(2, null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.scale(null, 0.5);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_skew
     * @tc.name      : canvas_test_skew
     * @tc.desc      : Used for canvas tilt transformations, including offsets on the horizontal and vertical axes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_skew', DEFAULT, () => {
      const msg = 'canvas_test_skew';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.skew(0.1, 0.1);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_skew_param_null
     * @tc.name      : canvas_test_skew_param_null
     * @tc.desc      : Used for canvas tilt transformations, including offsets on the horizontal and vertical axes. (Parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_skew_param_null', DEFAULT, () => {
      const msg = 'canvas_test_skew_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.skew(null, null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.skew(0.1, null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.skew(null, 0.1);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_rotate
     * @tc.name      : canvas_test_rotate
     * @tc.desc      : Used to rotate the canvas by a certain angle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_rotate', DEFAULT, () => {
      const msg = 'canvas_test_rotate';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.rotate(30, 100, 100);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_rotate_param_null
     * @tc.name      : canvas_test_rotate_param_null
     * @tc.desc      : Used to rotate the canvas by a certain angle. (Parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_rotate_param_null', DEFAULT, () => {
      const msg = 'canvas_test_rotate_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.rotate(null, null, null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_translate
     * @tc.name      : canvas_test_translate
     * @tc.desc      : Used to pan the canvas a distance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_translate', DEFAULT, () => {
      const msg = 'canvas_test_translate';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.translate(10, 10);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'translate successed');
      } catch (e) {
        console.info(msg + `translate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_translate
     * @tc.name      : canvas_test_translate
     * @tc.desc      : Used to pan the canvas a distance. (parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_translate_param_null', DEFAULT, () => {
      const msg = 'canvas_test_translate_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.translate(null, null);
        canvas.drawRect({
          left: 10, right: 500, top: 300, bottom: 900
        });
        canvas.detachPen();
        console.info(msg + 'translate successed');
      } catch (e) {
        console.info(msg + `translate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_clipPath
     * @tc.name      : canvas_test_clipPath
     * @tc.desc      : Used to crop a custom path.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_clipPath', DEFAULT, () => {
      const msg = 'canvas_test_clipPath';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_clipPath_param_null
     * @tc.name      : canvas_test_clipPath_param_null
     * @tc.desc      : Used to crop a custom path. (parameter is empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_clipPath_param_null', DEFAULT, () => {
      const msg = 'canvas_test_clipPath_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(null, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_clipPath_param_invalid
     * @tc.name      : canvas_test_clipPath_param_invalid
     * @tc.desc      : Used to crop a custom path. (Illegal parameter)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_clipPath_param_invalid', DEFAULT, () => {
      const msg = 'canvas_test_clipPath_param_invalid';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, 9999, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_clipRect
     * @tc.name      : canvas_test_clipRect
     * @tc.desc      : Used to crop a rectangle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_clipRect', DEFAULT, () => {
      const msg = 'canvas_test_clipRect';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.clipRect({
          left: 10, right: 500, top: 300, bottom: 900
        }, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : canvas_test_clipRect_param_null
     * @tc.name      : canvas_test_clipRect_param_null
     * @tc.desc      : Used to crop a rectangle. (Parameters are empty)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_clipRect_param_null', DEFAULT, () => {
      const msg = 'canvas_test_clipRect_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.clipRect(null, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : canvas_test_clipRect_param_invalid
     * @tc.name      : canvas_test_clipRect_param_invalid
     * @tc.desc      : Used to crop a rectangle. (Parameters illegal)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('canvas_test_clipRect_param_invalid', DEFAULT, () => {
      const msg = 'canvas_test_clipRect_param_null';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.clipRect({
          left: 10, right: 500, top: 300, bottom: 900
        }, 9999, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

  })
}