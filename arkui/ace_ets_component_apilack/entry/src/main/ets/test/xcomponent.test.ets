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

export default function xcomponentGetXComponentContextJsunit() {
  describe('xcomponentGetXComponentContextTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/xcomponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get xcomponent state success " + JSON.stringify(pages));
        if (!("xcomponent" == pages.name)) {
          console.info("get xcomponent state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push xcomponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push xcomponent page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("xcomponentGetXComponentContext after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testxcomponentGetXComponentContext0001
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0001
     */
    it('testxcomponentGetXComponentContext0001', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testxcomponentGetXComponentContext0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testxcomponentGetXComponentContext0002
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0002
     */
    it('testxcomponentGetXComponentContext0002', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testxcomponentGetXComponentContext0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testxcomponentGetXComponentContext0003
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0003
     */
    it('testxcomponentGetXComponentContext0003', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testxcomponentGetXComponentContext0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testxcomponentGetXComponentContext0004
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0004
     */
    it('testxcomponentGetXComponentContext0004', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testxcomponentGetXComponentContext0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testxcomponentGetXComponentContext0005
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0005
     */
    it('testxcomponentGetXComponentContext0005', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testxcomponentGetXComponentContext0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testxcomponentGetXComponentContext0006
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0006
     */
    it('testxcomponentGetXComponentContext0006', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testxcomponentGetXComponentContext0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testxcomponentGetXComponentContext0007
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0007
     */
    it('testxcomponentGetXComponentContext0007', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testxcomponentGetXComponentContext0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testxcomponentGetXComponentContext0009
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0009
     */
    it('testxcomponentGetXComponentContext0009', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testxcomponentGetXComponentContext0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testxcomponentGetXComponentContext0010
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0010
     */
    it('testxcomponentGetXComponentContext0010', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getXComponentContextText');
      console.info("[testxcomponentGetXComponentContext0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testxcomponentGetXComponentContext0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
