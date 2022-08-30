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

export default function featureAbilityStartAbilityJsunit() {
  describe('featureAbilityStartAbilityTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/featureAbility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get featureAbility state success " + JSON.stringify(pages));
        if (!("featureAbility" == pages.name)) {
          console.info("get featureAbility state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push featureAbility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push featureAbility page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("featureAbilityStartAbility after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testfeatureAbilityStartAbility0001
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0001
     */
    it('testfeatureAbilityStartAbility0001', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("320.00vp");
      console.info("[testfeatureAbilityStartAbility0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testfeatureAbilityStartAbility0002
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0002
     */
    it('testfeatureAbilityStartAbility0002', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testfeatureAbilityStartAbility0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testfeatureAbilityStartAbility0003
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0003
     */
    it('testfeatureAbilityStartAbility0003', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testfeatureAbilityStartAbility0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testfeatureAbilityStartAbility0004
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0004
     */
    it('testfeatureAbilityStartAbility0004', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testfeatureAbilityStartAbility0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testfeatureAbilityStartAbility0005
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0005
     */
    it('testfeatureAbilityStartAbility0005', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testfeatureAbilityStartAbility0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testfeatureAbilityStartAbility0006
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0006
     */
    it('testfeatureAbilityStartAbility0006', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testfeatureAbilityStartAbility0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testfeatureAbilityStartAbility0007
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0007
     */
    it('testfeatureAbilityStartAbility0007', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testfeatureAbilityStartAbility0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testfeatureAbilityStartAbility0009
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0009
     */
    it('testfeatureAbilityStartAbility0009', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testfeatureAbilityStartAbility0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testfeatureAbilityStartAbility0010
     * @tc.desic         acefeatureAbilityStartAbilityEtsTest0010
     */
    it('testfeatureAbilityStartAbility0010', 0, async function (done) {
      console.info('featureAbilityStartAbility testfeatureAbilityStartAbility0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('startAbilityText');
      console.info("[testfeatureAbilityStartAbility0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testfeatureAbilityStartAbility0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
