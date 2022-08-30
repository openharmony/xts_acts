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

export default function progressStyleJsunit() {
  describe('progressStyleTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/progress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push progress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("progressStyle after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testprogressStyle0001
     * @tc.desic         aceprogressStyleEtsTest0001
     */
    it('testprogressStyle0001', 0, async function (done) {
      console.info('progressStyle testprogressStyle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testprogressStyle0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testprogressStyle0002
     * @tc.desic         aceprogressStyleEtsTest0002
     */
    it('testprogressStyle0002', 0, async function (done) {
      console.info('progressStyle testprogressStyle0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testprogressStyle0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testprogressStyle0003
     * @tc.desic         aceprogressStyleEtsTest0003
     */
    it('testprogressStyle0003', 0, async function (done) {
      console.info('progressStyle testprogressStyle0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testprogressStyle0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testprogressStyle0004
     * @tc.desic         aceprogressStyleEtsTest0004
     */
    it('testprogressStyle0004', 0, async function (done) {
      console.info('progressStyle testprogressStyle0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testprogressStyle0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testprogressStyle0005
     * @tc.desic         aceprogressStyleEtsTest0005
     */
    it('testprogressStyle0005', 0, async function (done) {
      console.info('progressStyle testprogressStyle0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testprogressStyle0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testprogressStyle0006
     * @tc.desic         aceprogressStyleEtsTest0006
     */
    it('testprogressStyle0006', 0, async function (done) {
      console.info('progressStyle testprogressStyle0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testprogressStyle0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testprogressStyle0007
     * @tc.desic         aceprogressStyleEtsTest0007
     */
    it('testprogressStyle0007', 0, async function (done) {
      console.info('progressStyle testprogressStyle0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testprogressStyle0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testprogressStyle0009
     * @tc.desic         aceprogressStyleEtsTest0009
     */
    it('testprogressStyle0009', 0, async function (done) {
      console.info('progressStyle testprogressStyle009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testprogressStyle0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testprogressStyle0010
     * @tc.desic         aceprogressStyleEtsTest0010
     */
    it('testprogressStyle0010', 0, async function (done) {
      console.info('progressStyle testprogressStyle0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('styleText');
      console.info("[testprogressStyle0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testprogressStyle0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
