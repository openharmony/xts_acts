/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function gaugeColorsJsunit() {
  describe('gaugeColorsTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/gauge',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gauge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gauge page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gaugeColors after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgaugeColors0001
     * @tc.desic         acegaugeColorsEtsTest0001
     */
    it('testgaugeColors0001', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testgaugeColors0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgaugeColors0002
     * @tc.desic         acegaugeColorsEtsTest0002
     */
    it('testgaugeColors0002', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testgaugeColors0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgaugeColors0003
     * @tc.desic         acegaugeColorsEtsTest0003
     */
    it('testgaugeColors0003', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testgaugeColors0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgaugeColors0004
     * @tc.desic         acegaugeColorsEtsTest0004
     */
    it('testgaugeColors0004', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testgaugeColors0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgaugeColors0005
     * @tc.desic         acegaugeColorsEtsTest0005
     */
    it('testgaugeColors0005', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testgaugeColors0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgaugeColors0006
     * @tc.desic         acegaugeColorsEtsTest0006
     */
    it('testgaugeColors0006', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testgaugeColors0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testgaugeColors0007
     * @tc.desic         acegaugeColorsEtsTest0007
     */
    it('testgaugeColors0007', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testgaugeColors0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testgaugeColors0009
     * @tc.desic         acegaugeColorsEtsTest0009
     */
    it('testgaugeColors0009', 0, async function (done) {
      console.info('gaugeColors testgaugeColors009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testgaugeColors0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testgaugeColors0010
     * @tc.desic         acegaugeColorsEtsTest0010
     */
    it('testgaugeColors0010', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('colorsText');
      console.info("[testgaugeColors0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testgaugeColors0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
