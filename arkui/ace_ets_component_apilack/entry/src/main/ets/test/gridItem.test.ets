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

export default function gridItemOnSelectJsunit() {
  describe('gridItemOnSelectTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/gridItem',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gridItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gridItemOnSelect after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgridItemOnSelect0001
     * @tc.desic         acegridItemOnSelectEtsTest0001
     */
    it('testgridItemOnSelect0001', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testgridItemOnSelect0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgridItemOnSelect0002
     * @tc.desic         acegridItemOnSelectEtsTest0002
     */
    it('testgridItemOnSelect0002', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testgridItemOnSelect0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgridItemOnSelect0003
     * @tc.desic         acegridItemOnSelectEtsTest0003
     */
    it('testgridItemOnSelect0003', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testgridItemOnSelect0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgridItemOnSelect0004
     * @tc.desic         acegridItemOnSelectEtsTest0004
     */
    it('testgridItemOnSelect0004', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testgridItemOnSelect0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgridItemOnSelect0005
     * @tc.desic         acegridItemOnSelectEtsTest0005
     */
    it('testgridItemOnSelect0005', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testgridItemOnSelect0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgridItemOnSelect0006
     * @tc.desic         acegridItemOnSelectEtsTest0006
     */
    it('testgridItemOnSelect0006', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testgridItemOnSelect0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testgridItemOnSelect0007
     * @tc.desic         acegridItemOnSelectEtsTest0007
     */
    it('testgridItemOnSelect0007', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testgridItemOnSelect0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testgridItemOnSelect0009
     * @tc.desic         acegridItemOnSelectEtsTest0009
     */
    it('testgridItemOnSelect0009', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testgridItemOnSelect0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testgridItemOnSelect0010
     * @tc.desic         acegridItemOnSelectEtsTest0010
     */
    it('testgridItemOnSelect0010', 0, async function (done) {
      console.info('gridItemOnSelect testgridItemOnSelect0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testgridItemOnSelect0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testgridItemOnSelect0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
