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

export default function promptShowDialogJsunit() {
  describe('promptShowDialogTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/prompt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get prompt state success " + JSON.stringify(pages));
        if (!("prompt" == pages.name)) {
          console.info("get prompt state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push prompt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push prompt page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("promptShowDialog after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpromptShowDialog0001
     * @tc.desic         acepromptShowDialogEtsTest0001
     */
    it('testpromptShowDialog0001', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testpromptShowDialog0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpromptShowDialog0002
     * @tc.desic         acepromptShowDialogEtsTest0002
     */
    it('testpromptShowDialog0002', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testpromptShowDialog0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testpromptShowDialog0003
     * @tc.desic         acepromptShowDialogEtsTest0003
     */
    it('testpromptShowDialog0003', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testpromptShowDialog0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testpromptShowDialog0004
     * @tc.desic         acepromptShowDialogEtsTest0004
     */
    it('testpromptShowDialog0004', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testpromptShowDialog0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testpromptShowDialog0005
     * @tc.desic         acepromptShowDialogEtsTest0005
     */
    it('testpromptShowDialog0005', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testpromptShowDialog0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testpromptShowDialog0006
     * @tc.desic         acepromptShowDialogEtsTest0006
     */
    it('testpromptShowDialog0006', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testpromptShowDialog0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testpromptShowDialog0007
     * @tc.desic         acepromptShowDialogEtsTest0007
     */
    it('testpromptShowDialog0007', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testpromptShowDialog0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testpromptShowDialog0009
     * @tc.desic         acepromptShowDialogEtsTest0009
     */
    it('testpromptShowDialog0009', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testpromptShowDialog0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testpromptShowDialog0010
     * @tc.desic         acepromptShowDialogEtsTest0010
     */
    it('testpromptShowDialog0010', 0, async function (done) {
      console.info('promptShowDialog testpromptShowDialog0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showDialogText');
      console.info("[testpromptShowDialog0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testpromptShowDialog0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
