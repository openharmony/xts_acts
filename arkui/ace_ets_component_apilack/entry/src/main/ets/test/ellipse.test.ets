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

export default function ellipseNeJsunit() {
  describe('ellipseNeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/ellipse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ellipse state success " + JSON.stringify(pages));
        if (!("ellipse" == pages.name)) {
          console.info("get ellipse state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push ellipse page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ellipse page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("ellipseNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testellipseNe0001
     * @tc.desic         aceellipseNeEtsTest0001
     */
    it('testellipseNe0001', 0, async function (done) {
      console.info('ellipseNe testellipseNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testellipseNe0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testellipseNe0002
     * @tc.desic         aceellipseNeEtsTest0002
     */
    it('testellipseNe0002', 0, async function (done) {
      console.info('ellipseNe testellipseNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testellipseNe0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testellipseNe0003
     * @tc.desic         aceellipseNeEtsTest0003
     */
    it('testellipseNe0003', 0, async function (done) {
      console.info('ellipseNe testellipseNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testellipseNe0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testellipseNe0004
     * @tc.desic         aceellipseNeEtsTest0004
     */
    it('testellipseNe0004', 0, async function (done) {
      console.info('ellipseNe testellipseNe0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testellipseNe0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testellipseNe0005
     * @tc.desic         aceellipseNeEtsTest0005
     */
    it('testellipseNe0005', 0, async function (done) {
      console.info('ellipseNe testellipseNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testellipseNe0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testellipseNe0006
     * @tc.desic         aceellipseNeEtsTest0006
     */
    it('testellipseNe0006', 0, async function (done) {
      console.info('ellipseNe testellipseNe0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testellipseNe0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testellipseNe0007
     * @tc.desic         aceellipseNeEtsTest0007
     */
    it('testellipseNe0007', 0, async function (done) {
      console.info('ellipseNe testellipseNe0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testellipseNe0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testellipseNe0009
     * @tc.desic         aceellipseNeEtsTest0009
     */
    it('testellipseNe0009', 0, async function (done) {
      console.info('ellipseNe testellipseNe009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testellipseNe0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testellipseNe0010
     * @tc.desic         aceellipseNeEtsTest0010
     */
    it('testellipseNe0010', 0, async function (done) {
      console.info('ellipseNe testellipseNe0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testellipseNe0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testellipseNe0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
