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

export default function panelBackgroundMaskJsunit() {
  describe('panelBackgroundMaskTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/panel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panel state success " + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get panel state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push panel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("panelBackgroundMask after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpanelBackgroundMask0001
     * @tc.desic         acepanelBackgroundMaskEtsTest0001
     */
    it('testpanelBackgroundMask0001', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testpanelBackgroundMask0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpanelBackgroundMask0002
     * @tc.desic         acepanelBackgroundMaskEtsTest0002
     */
    it('testpanelBackgroundMask0002', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testpanelBackgroundMask0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testpanelBackgroundMask0003
     * @tc.desic         acepanelBackgroundMaskEtsTest0003
     */
    it('testpanelBackgroundMask0003', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testpanelBackgroundMask0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testpanelBackgroundMask0004
     * @tc.desic         acepanelBackgroundMaskEtsTest0004
     */
    it('testpanelBackgroundMask0004', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testpanelBackgroundMask0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testpanelBackgroundMask0005
     * @tc.desic         acepanelBackgroundMaskEtsTest0005
     */
    it('testpanelBackgroundMask0005', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testpanelBackgroundMask0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testpanelBackgroundMask0006
     * @tc.desic         acepanelBackgroundMaskEtsTest0006
     */
    it('testpanelBackgroundMask0006', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testpanelBackgroundMask0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testpanelBackgroundMask0007
     * @tc.desic         acepanelBackgroundMaskEtsTest0007
     */
    it('testpanelBackgroundMask0007', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testpanelBackgroundMask0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testpanelBackgroundMask0009
     * @tc.desic         acepanelBackgroundMaskEtsTest0009
     */
    it('testpanelBackgroundMask0009', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testpanelBackgroundMask0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testpanelBackgroundMask0010
     * @tc.desic         acepanelBackgroundMaskEtsTest0010
     */
    it('testpanelBackgroundMask0010', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('backgroundMaskText');
      console.info("[testpanelBackgroundMask0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testpanelBackgroundMask0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
