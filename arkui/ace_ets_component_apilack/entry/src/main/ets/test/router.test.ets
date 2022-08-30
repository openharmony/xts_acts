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

export default function routerEnableAlertBeforeBackPageJsunit() {
  describe('routerEnableAlertBeforeBackPageTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/router',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get router state success " + JSON.stringify(pages));
        if (!("router" == pages.name)) {
          console.info("get router state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push router page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push router page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("routerEnableAlertBeforeBackPage after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testrouterEnableAlertBeforeBackPage0001
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0001
     */
    it('testrouterEnableAlertBeforeBackPage0001', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testrouterEnableAlertBeforeBackPage0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testrouterEnableAlertBeforeBackPage0002
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0002
     */
    it('testrouterEnableAlertBeforeBackPage0002', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testrouterEnableAlertBeforeBackPage0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testrouterEnableAlertBeforeBackPage0003
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0003
     */
    it('testrouterEnableAlertBeforeBackPage0003', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testrouterEnableAlertBeforeBackPage0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testrouterEnableAlertBeforeBackPage0004
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0004
     */
    it('testrouterEnableAlertBeforeBackPage0004', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testrouterEnableAlertBeforeBackPage0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testrouterEnableAlertBeforeBackPage0005
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0005
     */
    it('testrouterEnableAlertBeforeBackPage0005', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testrouterEnableAlertBeforeBackPage0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testrouterEnableAlertBeforeBackPage0006
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0006
     */
    it('testrouterEnableAlertBeforeBackPage0006', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testrouterEnableAlertBeforeBackPage0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testrouterEnableAlertBeforeBackPage0007
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0007
     */
    it('testrouterEnableAlertBeforeBackPage0007', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testrouterEnableAlertBeforeBackPage0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testrouterEnableAlertBeforeBackPage0009
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0009
     */
    it('testrouterEnableAlertBeforeBackPage0009', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testrouterEnableAlertBeforeBackPage0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testrouterEnableAlertBeforeBackPage0010
     * @tc.desic         acerouterEnableAlertBeforeBackPageEtsTest0010
     */
    it('testrouterEnableAlertBeforeBackPage0010', 0, async function (done) {
      console.info('routerEnableAlertBeforeBackPage testrouterEnableAlertBeforeBackPage0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('enableAlertBeforeBackPageText');
      console.info("[testrouterEnableAlertBeforeBackPage0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testrouterEnableAlertBeforeBackPage0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
