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

export default function stateManagementGetSharedJsunit() {
  describe('stateManagementGetSharedTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/stateManagement',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stateManagement state success " + JSON.stringify(pages));
        if (!("stateManagement" == pages.name)) {
          console.info("get stateManagement state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stateManagement page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateManagement page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("stateManagementGetShared after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         teststateManagementGetShared0001
     * @tc.desic         acestateManagementGetSharedEtsTest0001
     */
    it('teststateManagementGetShared0001', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[teststateManagementGetShared0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         teststateManagementGetShared0002
     * @tc.desic         acestateManagementGetSharedEtsTest0002
     */
    it('teststateManagementGetShared0002', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[teststateManagementGetShared0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         teststateManagementGetShared0003
     * @tc.desic         acestateManagementGetSharedEtsTest0003
     */
    it('teststateManagementGetShared0003', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[teststateManagementGetShared0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         teststateManagementGetShared0004
     * @tc.desic         acestateManagementGetSharedEtsTest0004
     */
    it('teststateManagementGetShared0004', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[teststateManagementGetShared0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         teststateManagementGetShared0005
     * @tc.desic         acestateManagementGetSharedEtsTest0005
     */
    it('teststateManagementGetShared0005', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[teststateManagementGetShared0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         teststateManagementGetShared0006
     * @tc.desic         acestateManagementGetSharedEtsTest0006
     */
    it('teststateManagementGetShared0006', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[teststateManagementGetShared0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         teststateManagementGetShared0007
     * @tc.desic         acestateManagementGetSharedEtsTest0007
     */
    it('teststateManagementGetShared0007', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[teststateManagementGetShared0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         teststateManagementGetShared0009
     * @tc.desic         acestateManagementGetSharedEtsTest0009
     */
    it('teststateManagementGetShared0009', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[teststateManagementGetShared0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         teststateManagementGetShared0010
     * @tc.desic         acestateManagementGetSharedEtsTest0010
     */
    it('teststateManagementGetShared0010', 0, async function (done) {
      console.info('stateManagementGetShared teststateManagementGetShared0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GetSharedText');
      console.info("[teststateManagementGetShared0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[teststateManagementGetShared0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
