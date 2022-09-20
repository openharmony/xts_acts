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

export default function swiperCurveJsunit() {
  describe('swiperCurveTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/swiper',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("swiperCurve after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testswiperCurve0001
     * @tc.desic         aceswiperCurveEtsTest0001
     */
    it('testswiperCurve0001', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testswiperCurve0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testswiperCurve0002
     * @tc.desic         aceswiperCurveEtsTest0002
     */
    it('testswiperCurve0002', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testswiperCurve0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testswiperCurve0003
     * @tc.desic         aceswiperCurveEtsTest0003
     */
    it('testswiperCurve0003', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testswiperCurve0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testswiperCurve0004
     * @tc.desic         aceswiperCurveEtsTest0004
     */
    it('testswiperCurve0004', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testswiperCurve0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testswiperCurve0005
     * @tc.desic         aceswiperCurveEtsTest0005
     */
    it('testswiperCurve0005', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testswiperCurve0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testswiperCurve0006
     * @tc.desic         aceswiperCurveEtsTest0006
     */
    it('testswiperCurve0006', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testswiperCurve0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testswiperCurve0007
     * @tc.desic         aceswiperCurveEtsTest0007
     */
    it('testswiperCurve0007', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testswiperCurve0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testswiperCurve0009
     * @tc.desic         aceswiperCurveEtsTest0009
     */
    it('testswiperCurve0009', 0, async function (done) {
      console.info('swiperCurve testswiperCurve009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testswiperCurve0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testswiperCurve0010
     * @tc.desic         aceswiperCurveEtsTest0010
     */
    it('testswiperCurve0010', 0, async function (done) {
      console.info('swiperCurve testswiperCurve0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('curveText');
      console.info("[testswiperCurve0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testswiperCurve0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
