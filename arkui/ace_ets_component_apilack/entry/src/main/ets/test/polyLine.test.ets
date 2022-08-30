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

export default function polyLineNeJsunit() {
  describe('polyLineNeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/polyLine',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get polyLine state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get polyLine state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push polyLine page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polyLine page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("polyLineNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpolyLineNe0001
     * @tc.desic         acepolyLineNeEtsTest0001
     */
    it('testpolyLineNe0001', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testpolyLineNe0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpolyLineNe0002
     * @tc.desic         acepolyLineNeEtsTest0002
     */
    it('testpolyLineNe0002', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testpolyLineNe0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testpolyLineNe0003
     * @tc.desic         acepolyLineNeEtsTest0003
     */
    it('testpolyLineNe0003', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testpolyLineNe0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testpolyLineNe0004
     * @tc.desic         acepolyLineNeEtsTest0004
     */
    it('testpolyLineNe0004', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testpolyLineNe0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testpolyLineNe0005
     * @tc.desic         acepolyLineNeEtsTest0005
     */
    it('testpolyLineNe0005', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testpolyLineNe0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testpolyLineNe0006
     * @tc.desic         acepolyLineNeEtsTest0006
     */
    it('testpolyLineNe0006', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testpolyLineNe0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testpolyLineNe0007
     * @tc.desic         acepolyLineNeEtsTest0007
     */
    it('testpolyLineNe0007', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testpolyLineNe0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testpolyLineNe0009
     * @tc.desic         acepolyLineNeEtsTest0009
     */
    it('testpolyLineNe0009', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testpolyLineNe0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testpolyLineNe0010
     * @tc.desic         acepolyLineNeEtsTest0010
     */
    it('testpolyLineNe0010', 0, async function (done) {
      console.info('polyLineNe testpolyLineNe0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpolyLineNe0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testpolyLineNe0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
