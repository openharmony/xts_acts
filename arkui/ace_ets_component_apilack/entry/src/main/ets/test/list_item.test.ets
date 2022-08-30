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

export default function list_itemOnSelectJsunit() {
  describe('list_itemOnSelectTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/list_item',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list_item state success " + JSON.stringify(pages));
        if (!("list_item" == pages.name)) {
          console.info("get list_item state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push list_item page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("list_itemOnSelect after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlist_itemOnSelect0001
     * @tc.desic         acelist_itemOnSelectEtsTest0001
     */
    it('testlist_itemOnSelect0001', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testlist_itemOnSelect0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testlist_itemOnSelect0002
     * @tc.desic         acelist_itemOnSelectEtsTest0002
     */
    it('testlist_itemOnSelect0002', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testlist_itemOnSelect0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testlist_itemOnSelect0003
     * @tc.desic         acelist_itemOnSelectEtsTest0003
     */
    it('testlist_itemOnSelect0003', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testlist_itemOnSelect0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testlist_itemOnSelect0004
     * @tc.desic         acelist_itemOnSelectEtsTest0004
     */
    it('testlist_itemOnSelect0004', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testlist_itemOnSelect0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testlist_itemOnSelect0005
     * @tc.desic         acelist_itemOnSelectEtsTest0005
     */
    it('testlist_itemOnSelect0005', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testlist_itemOnSelect0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testlist_itemOnSelect0006
     * @tc.desic         acelist_itemOnSelectEtsTest0006
     */
    it('testlist_itemOnSelect0006', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testlist_itemOnSelect0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testlist_itemOnSelect0007
     * @tc.desic         acelist_itemOnSelectEtsTest0007
     */
    it('testlist_itemOnSelect0007', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testlist_itemOnSelect0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testlist_itemOnSelect0009
     * @tc.desic         acelist_itemOnSelectEtsTest0009
     */
    it('testlist_itemOnSelect0009', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testlist_itemOnSelect0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testlist_itemOnSelect0010
     * @tc.desic         acelist_itemOnSelectEtsTest0010
     */
    it('testlist_itemOnSelect0010', 0, async function (done) {
      console.info('list_itemOnSelect testlist_itemOnSelect0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testlist_itemOnSelect0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testlist_itemOnSelect0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
