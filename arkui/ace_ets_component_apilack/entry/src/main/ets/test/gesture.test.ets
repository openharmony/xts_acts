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

export default function gestureSetDirectionJsunit() {
  describe('gestureSetDirectionTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/gesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gesture state success " + JSON.stringify(pages));
        if (!("gesture" == pages.name)) {
          console.info("get gesture state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gesture page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gesture page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gestureSetDirection after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgestureSetDirection0001
     * @tc.desic         acegestureSetDirectionEtsTest0001
     */
    it('testgestureSetDirection0001', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testgestureSetDirection0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgestureSetDirection0002
     * @tc.desic         acegestureSetDirectionEtsTest0002
     */
    it('testgestureSetDirection0002', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testgestureSetDirection0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgestureSetDirection0003
     * @tc.desic         acegestureSetDirectionEtsTest0003
     */
    it('testgestureSetDirection0003', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testgestureSetDirection0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgestureSetDirection0004
     * @tc.desic         acegestureSetDirectionEtsTest0004
     */
    it('testgestureSetDirection0004', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testgestureSetDirection0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgestureSetDirection0005
     * @tc.desic         acegestureSetDirectionEtsTest0005
     */
    it('testgestureSetDirection0005', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testgestureSetDirection0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgestureSetDirection0006
     * @tc.desic         acegestureSetDirectionEtsTest0006
     */
    it('testgestureSetDirection0006', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testgestureSetDirection0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testgestureSetDirection0007
     * @tc.desic         acegestureSetDirectionEtsTest0007
     */
    it('testgestureSetDirection0007', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testgestureSetDirection0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testgestureSetDirection0009
     * @tc.desic         acegestureSetDirectionEtsTest0009
     */
    it('testgestureSetDirection0009', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testgestureSetDirection0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testgestureSetDirection0010
     * @tc.desic         acegestureSetDirectionEtsTest0010
     */
    it('testgestureSetDirection0010', 0, async function (done) {
      console.info('gestureSetDirection testgestureSetDirection0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setDirectionText');
      console.info("[testgestureSetDirection0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testgestureSetDirection0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
