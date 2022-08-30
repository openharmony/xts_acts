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

export default function sideBarShowSideBarJsunit() {
  describe('sideBarShowSideBarTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/sideBar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sideBar state success " + JSON.stringify(pages));
        if (!("sideBar" == pages.name)) {
          console.info("get sideBar state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push sideBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sideBar page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("sideBarShowSideBar after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testsideBarShowSideBar0001
     * @tc.desic         acesideBarShowSideBarEtsTest0001
     */
    it('testsideBarShowSideBar0001', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testsideBarShowSideBar0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testsideBarShowSideBar0002
     * @tc.desic         acesideBarShowSideBarEtsTest0002
     */
    it('testsideBarShowSideBar0002', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testsideBarShowSideBar0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testsideBarShowSideBar0003
     * @tc.desic         acesideBarShowSideBarEtsTest0003
     */
    it('testsideBarShowSideBar0003', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testsideBarShowSideBar0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testsideBarShowSideBar0004
     * @tc.desic         acesideBarShowSideBarEtsTest0004
     */
    it('testsideBarShowSideBar0004', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testsideBarShowSideBar0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testsideBarShowSideBar0005
     * @tc.desic         acesideBarShowSideBarEtsTest0005
     */
    it('testsideBarShowSideBar0005', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testsideBarShowSideBar0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testsideBarShowSideBar0006
     * @tc.desic         acesideBarShowSideBarEtsTest0006
     */
    it('testsideBarShowSideBar0006', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testsideBarShowSideBar0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testsideBarShowSideBar0007
     * @tc.desic         acesideBarShowSideBarEtsTest0007
     */
    it('testsideBarShowSideBar0007', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testsideBarShowSideBar0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testsideBarShowSideBar0009
     * @tc.desic         acesideBarShowSideBarEtsTest0009
     */
    it('testsideBarShowSideBar0009', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testsideBarShowSideBar0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testsideBarShowSideBar0010
     * @tc.desic         acesideBarShowSideBarEtsTest0010
     */
    it('testsideBarShowSideBar0010', 0, async function (done) {
      console.info('sideBarShowSideBar testsideBarShowSideBar0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('showSideBarText');
      console.info("[testsideBarShowSideBar0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testsideBarShowSideBar0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
