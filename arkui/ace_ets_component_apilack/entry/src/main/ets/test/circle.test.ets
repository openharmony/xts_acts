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

export default function circleNeJsunit() {
  describe('circleNeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/circle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get circle state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push circle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("circleNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcircleNe0001
     * @tc.desic         acecircleNeEtsTest0001
     */
    it('testcircleNe0001', 0, async function (done) {
      console.info('circleNe testcircleNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testcircleNe0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcircleNe0002
     * @tc.desic         acecircleNeEtsTest0002
     */
    it('testcircleNe0002', 0, async function (done) {
      console.info('circleNe testcircleNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testcircleNe0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testcircleNe0003
     * @tc.desic         acecircleNeEtsTest0003
     */
    it('testcircleNe0003', 0, async function (done) {
      console.info('circleNe testcircleNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testcircleNe0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testcircleNe0004
     * @tc.desic         acecircleNeEtsTest0004
     */
    it('testcircleNe0004', 0, async function (done) {
      console.info('circleNe testcircleNe0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testcircleNe0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testcircleNe0005
     * @tc.desic         acecircleNeEtsTest0005
     */
    it('testcircleNe0005', 0, async function (done) {
      console.info('circleNe testcircleNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testcircleNe0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testcircleNe0006
     * @tc.desic         acecircleNeEtsTest0006
     */
    it('testcircleNe0006', 0, async function (done) {
      console.info('circleNe testcircleNe0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testcircleNe0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testcircleNe0007
     * @tc.desic         acecircleNeEtsTest0007
     */
    it('testcircleNe0007', 0, async function (done) {
      console.info('circleNe testcircleNe0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testcircleNe0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testcircleNe0009
     * @tc.desic         acecircleNeEtsTest0009
     */
    it('testcircleNe0009', 0, async function (done) {
      console.info('circleNe testcircleNe009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testcircleNe0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testcircleNe0010
     * @tc.desic         acecircleNeEtsTest0010
     */
    it('testcircleNe0010', 0, async function (done) {
      console.info('circleNe testcircleNe0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testcircleNe0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testcircleNe0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testcircleNe0011
     * @tc.desic         acecircleNeEtsTest0011
     */
    it('testcircleNe0011', 0, async function (done) {
      console.info('circleNe testcircleNe0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNe0011] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Shape');
      expect(obj.$attrs.width).assertEqual("100.00px");
      console.info("[testcircleNe0011] width value :" + obj.$attrs.width);
      done();
    });
  })
}
