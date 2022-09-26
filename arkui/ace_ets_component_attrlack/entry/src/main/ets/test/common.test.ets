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

export default function commonColorModeJsunit() {
  describe('commonColorModeTest', function () {
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
      console.info("commonColorMode after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testcommonColorMode0011
     * @tc.desic        acecommonColorModeEtsTest0011
     */
    it('testcommonColorMode0011', 0, async function (done) {
      console.info('commonColorMode testcommonColorMode0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ThinText');
      console.info("[testcommonColorMode0011] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.backgroundBlurStyle).assertEqual(undefined);
      console.info("[testcommonColorMode0011] backgroundBlurStyle value :" + obj.$attrs.backgroundBlurStyle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0012
     * @tc.name         testcommonColorMode0012
     * @tc.desic        acecommonColorModeEtsTest0012
     */
    it('testcommonColorMode0012', 0, async function (done) {
      console.info('commonColorMode testcommonColorMode0012 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ThickText');
      console.info("[testcommonColorMode0012] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.backgroundBlurStyle).assertEqual(undefined);
      console.info("[testcommonColorMode0012] backgroundBlurStyle value :" + obj.$attrs.backgroundBlurStyle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00017
     * @tc.name         testcommonMiddle0001
     * @tc.desic        acecommonMiddleEtsTest0001
     */
    it('testcommonMiddle0001', 0, async function (done) {
      console.info('commonMiddle testcommonMiddle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('middleText');
      console.info("[testcommonMiddle0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info("[testcommonMiddle0001] alignRules value :" + obj.$attrs.alignRules);
      expect(obj.$attrs.alignRules).assertEqual(undefined);
      console.info("[testcommonMiddle0001] alignRules value :" + obj.$attrs.alignRules);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00018
     * @tc.name         testcommonOutset0001
     * @tc.desic        acecommonOutsetEtsTest0001
     */
    it('testcommonOutset0001', 0, async function (done) {
      console.info('commonOutset testcommonOutset0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('outsetText');
      console.info("[testcommonOutset0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info("[testcommonOutset0001] borderImage value :" + obj.$attrs.borderImage);
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testcommonOutset0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00019
     * @tc.name         testcommonRepeat0001
     * @tc.desic        acecommonRepeatEtsTest0001
     */
    it('testcommonRepeat0001', 0, async function (done) {
      console.info('commonRepeat testcommonRepeat0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('RepeatText');
      console.info("[testcommonRepeat0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testcommonOutset0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00020
     * @tc.name         testcommonSpace0001
     * @tc.desic        acecommonSpaceEtsTest0001
     */
    it('testcommonSpace0001', 0, async function (done) {
      console.info('commonSpace testcommonSpace0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('SpaceText');
      console.info("[testcommonSpace0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testcommonSpace0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00021
     * @tc.name         testcommonSlice0001
     * @tc.desic        acecommonSliceEtsTest0001
     */
    it('testcommonSlice0001', 0, async function (done) {
      console.info('commonSlice testcommonSlice0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sliceText');
      console.info("[testcommonSlice0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info("[testcommonSlice0001] borderImage value :" + obj.$attrs.borderImage);
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testcommonSlice0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });
  })
}
