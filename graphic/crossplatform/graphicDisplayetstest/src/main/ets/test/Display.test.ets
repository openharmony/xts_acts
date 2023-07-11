/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import window from '@ohos.window'
import display from '@ohos.display'

export default function DisplayTest() {
  describe('DisplayTest', function () {

    beforeAll(function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {
    })
    afterAll(function () {
    })

    /**
     * @tc.number: TEST_GET_DEFAULT_DISPLAY_SYNC_001
     * @tc.name  : testGetDefaultDisplaySync001
     * @tc.desc  : To test the sync function of obtaining the default display.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testGetDefaultDisplaySync001', 0, async function (done) {
      console.info('displayTest getDefaultDisplaySyncTest1 begin');
      try {
        var dsp = display.getDefaultDisplaySync();
        expect(dsp.id != null).assertTrue();
        expect(dsp.refreshRate != null).assertTrue();
        expect(dsp.width != null).assertTrue();
        expect(dsp.height != null).assertTrue();
        expect(dsp.rotation != null).assertTrue();
        expect(dsp.densityDPI != null).assertTrue();
        expect(dsp.name != null).assertTrue();
        expect(dsp.alive).assertTrue();
        expect(dsp.state != null).assertTrue();
        expect(dsp.densityPixels != null).assertTrue();
        expect(dsp.scaledDensity != null).assertTrue();
        expect(dsp.xDPI != null).assertTrue();
        expect(dsp.yDPI != null).assertTrue();
        done();
      } catch (err) {
        console.error('getDefaultDisplaySyncTest1 error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: TEST_RECT_LEFT_001
     * @tc.name  : testRect_Left001
     * @tc.desc  : To test value of RECT.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testRect_Left001', 0, async function (done) {
      try {
        var rect = {
          left : 20,
          top : 40,
          width : 100,
          height : 200
        }
        expect(rect.left).assertEqual(20);
        done();
      } catch (err) {
        console.error('test value of rect error :' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: TEST_RECT_TOP_001
     * @tc.name  : testRect_Top001
     * @tc.desc  : To test value of RECT.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testRect_Top001', 0, async function (done) {
      try {
        var rect = {
          left : 20,
          top : 40,
          width : 100,
          height : 200
        }
        expect(rect.top).assertEqual(40);
        done();
      } catch (err) {
        console.error('test value of rect error :' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: TEST_RECT_WIDTH_001
     * @tc.name  : testRect_Width001
     * @tc.desc  : To test value of RECT.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testRect_Width001', 0, async function (done) {
      try {
        var rect = {
          left : 20,
          top : 40,
          width : 100,
          height : 200
        }
        expect(rect.width).assertEqual(100);
        done();
      } catch (err) {
        console.error('test value of rect error :' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: TEST_RECT_HEIGHT_001
     * @tc.name  : testRect_Height001
     * @tc.desc  : To test value of RECT.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testRect_Height001', 0, async function (done) {
      try {
        var rect = {
          left : 20,
          top : 40,
          width : 100,
          height : 200
        }
        expect(rect.height).assertEqual(200);
        done();
      } catch (err) {
        console.error('test value of rect error :' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: TEST_DISPLAY_ORIENTATION_001
     * @tc.name  : testDisplay_Orientation001
     * @tc.desc  : To test value of Display.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testDisplay_Orientation001', 0, async function (done) {
      var dsp = display.getDefaultDisplaySync();
      expect(dsp.id != null).assertTrue();
      expect(dsp.width != null).assertTrue();
      expect(dsp.height != null).assertTrue();
      expect(dsp.orientation != null).assertTrue();
      done();
    });

    /**
     * @tc.number: TEST_ORIENTATION_001
     * @tc.name  : testOrientation001
     * @tc.desc  : To test value of Orientation.
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it('testOrientation001', 0, async function (done) {
      var dsp = display.getDefaultDisplaySync();
      expect(dsp.orientation == 0).assertTrue();
      expect(dsp.orientation != 1).assertTrue();
      expect(dsp.orientation != 2).assertTrue();
      expect(dsp.orientation != 3).assertTrue();
      done();
    });


  })
}

