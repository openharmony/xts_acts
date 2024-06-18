/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import drawing from "@ohos.graphics.drawing"

export default function graphicDrawingFontInterfaceTest(context, windowStage, abilityStorage) {
  describe('graphicDrawingFontInterfaceTest', function () {
    console.log('describe graphicDrawingFontInterfaceTest start!!!')

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    let pixel;
    beforeAll(async function () {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_001
     * @tc.name      : testFontMetricsFlags
     * @tc.desc      : Font Metric Flag Enumeration, used to indicate whether the data in each field in the font metric is valid.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFontMetricsFlags', 1, async function (done) {
      let msg = " ====testFontMetricsFlags==== "
      try {
        console.info(msg + ' Succeeded in FontMetricsFlags.');
        expect(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID !== undefined).assertTrue()
        console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID: ' + drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID: ' + drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID: ' + drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID: ' + drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.BOUNDS_INVALID: ' + drawing.FontMetricsFlags.BOUNDS_INVALID);
        done()
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        console.log(msg + " Faild in createPixelMapSync " + err)
        expect().assertFail()
        done()
      }
    })
    
  })
}