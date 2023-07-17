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
        console.error('getDefaultDisplaySync message ' + JSON.stringify(dsp));
        console.log("testGetDefaultDisplaySync001 1");
        expect(dsp.id != null).assertTrue();
        console.log("testGetDefaultDisplaySync001 2");
        expect(dsp.width != null).assertTrue();
        console.log("testGetDefaultDisplaySync001 3");
        expect(dsp.height != null).assertTrue();
        console.log("testGetDefaultDisplaySync001 4");
        expect(dsp.orientation != null).assertTrue();
        console.log("testGetDefaultDisplaySync001 5");
        done();
      } catch (err) {
        console.error('getDefaultDisplaySyncTest1 error ' + JSON.stringify(err));
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
      console.log("testDisplay_Orientation001 1");
      expect(dsp.id != null).assertTrue();
      console.log("testDisplay_Orientation001 2");
      expect(dsp.width != null).assertTrue();
      console.log("testDisplay_Orientation001 3");
      expect(dsp.height != null).assertTrue();
      console.log("testDisplay_Orientation001 4");
      expect(dsp.orientation != null).assertTrue();
      console.log("testDisplay_Orientation001 5");
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
      console.log("testOrientation001 1...orientation:" + dsp.orientation);
        expect(dsp.orientation == 0).assertTrue();
      console.log("testOrientation001 2");
        expect(dsp.orientation != 1).assertTrue();
      console.log("testOrientation001 3");
        expect(dsp.orientation != 2).assertTrue();
      console.log("testOrientation001 4");
        expect(dsp.orientation != 3).assertTrue();
      console.log("testOrientation001 5");
      done();
    });


  })
}

