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

export default function stackAlignContentJsunit() {
  describe('stackAlignContentTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/stack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stack state success " + JSON.stringify(pages));
        if (!("stack" == pages.name)) {
          console.info("get stack state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stack page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stack page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("stackAlignContent after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         teststackAlignContent0001
     * @tc.desic         acestackAlignContentEtsTest0001
     */
    it('teststackAlignContent0001', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[teststackAlignContent0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         teststackAlignContent0002
     * @tc.desic         acestackAlignContentEtsTest0002
     */
    it('teststackAlignContent0002', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[teststackAlignContent0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         teststackAlignContent0003
     * @tc.desic         acestackAlignContentEtsTest0003
     */
    it('teststackAlignContent0003', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[teststackAlignContent0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         teststackAlignContent0004
     * @tc.desic         acestackAlignContentEtsTest0004
     */
    it('teststackAlignContent0004', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[teststackAlignContent0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         teststackAlignContent0005
     * @tc.desic         acestackAlignContentEtsTest0005
     */
    it('teststackAlignContent0005', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[teststackAlignContent0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         teststackAlignContent0006
     * @tc.desic         acestackAlignContentEtsTest0006
     */
    it('teststackAlignContent0006', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[teststackAlignContent0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         teststackAlignContent0007
     * @tc.desic         acestackAlignContentEtsTest0007
     */
    it('teststackAlignContent0007', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[teststackAlignContent0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         teststackAlignContent0009
     * @tc.desic         acestackAlignContentEtsTest0009
     */
    it('teststackAlignContent0009', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[teststackAlignContent0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         teststackAlignContent0010
     * @tc.desic         acestackAlignContentEtsTest0010
     */
    it('teststackAlignContent0010', 0, async function (done) {
      console.info('stackAlignContent teststackAlignContent0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('alignContentText');
      console.info("[teststackAlignContent0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[teststackAlignContent0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
