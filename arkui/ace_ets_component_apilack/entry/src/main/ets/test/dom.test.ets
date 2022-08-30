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

export default function domCreateElementJsunit() {
  describe('domCreateElementTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/dom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dom state success " + JSON.stringify(pages));
        if (!("dom" == pages.name)) {
          console.info("get dom state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push dom page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dom page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("domCreateElement after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testdomCreateElement0001
     * @tc.desic         acedomCreateElementEtsTest0001
     */
    it('testdomCreateElement0001', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testdomCreateElement0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testdomCreateElement0002
     * @tc.desic         acedomCreateElementEtsTest0002
     */
    it('testdomCreateElement0002', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testdomCreateElement0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testdomCreateElement0003
     * @tc.desic         acedomCreateElementEtsTest0003
     */
    it('testdomCreateElement0003', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testdomCreateElement0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testdomCreateElement0004
     * @tc.desic         acedomCreateElementEtsTest0004
     */
    it('testdomCreateElement0004', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testdomCreateElement0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testdomCreateElement0005
     * @tc.desic         acedomCreateElementEtsTest0005
     */
    it('testdomCreateElement0005', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testdomCreateElement0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testdomCreateElement0006
     * @tc.desic         acedomCreateElementEtsTest0006
     */
    it('testdomCreateElement0006', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testdomCreateElement0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testdomCreateElement0007
     * @tc.desic         acedomCreateElementEtsTest0007
     */
    it('testdomCreateElement0007', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testdomCreateElement0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testdomCreateElement0009
     * @tc.desic         acedomCreateElementEtsTest0009
     */
    it('testdomCreateElement0009', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testdomCreateElement0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testdomCreateElement0010
     * @tc.desic         acedomCreateElementEtsTest0010
     */
    it('testdomCreateElement0010', 0, async function (done) {
      console.info('domCreateElement testdomCreateElement0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('createElementText');
      console.info("[testdomCreateElement0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testdomCreateElement0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
