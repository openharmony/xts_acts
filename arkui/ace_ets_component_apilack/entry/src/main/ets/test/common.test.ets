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

export default function commonBackgroundBlurStyleJsunit() {
  describe('commonBackgroundBlurStyleTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/common',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get common state success " + JSON.stringify(pages));
        if (!("common" == pages.name)) {
          console.info("get common state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push common page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push common page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("commonBackgroundBlurStyle after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcommonBackgroundBlurStyle0001
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0001
     */
    it('testcommonBackgroundBlurStyle0001', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("320.00vp");
      console.info("[testcommonBackgroundBlurStyle0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcommonBackgroundBlurStyle0002
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0002
     */
    it('testcommonBackgroundBlurStyle0002', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("50.00vp");
      console.info("[testcommonBackgroundBlurStyle0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testcommonBackgroundBlurStyle0003
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0003
     */
    it('testcommonBackgroundBlurStyle0003', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testcommonBackgroundBlurStyle0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testcommonBackgroundBlurStyle0004
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0004
     */
    it('testcommonBackgroundBlurStyle0004', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testcommonBackgroundBlurStyle0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testcommonBackgroundBlurStyle0005
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0005
     */
    it('testcommonBackgroundBlurStyle0005', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testcommonBackgroundBlurStyle0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testcommonBackgroundBlurStyle0006
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0006
     */
    it('testcommonBackgroundBlurStyle0006', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testcommonBackgroundBlurStyle0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testcommonBackgroundBlurStyle0007
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0007
     */
    it('testcommonBackgroundBlurStyle0007', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testcommonBackgroundBlurStyle0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testcommonBackgroundBlurStyle0009
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0009
     */
    it('testcommonBackgroundBlurStyle0009', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testcommonBackgroundBlurStyle0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testcommonBackgroundBlurStyle0010
     * @tc.desic         acecommonBackgroundBlurStyleEtsTest0010
     */
    it('testcommonBackgroundBlurStyle0010', 0, async function (done) {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testcommonBackgroundBlurStyle0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
