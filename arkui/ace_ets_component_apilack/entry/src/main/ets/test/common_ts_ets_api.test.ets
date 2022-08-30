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

export default function common_ts_ets_apiStaticClearJsunit() {
  describe('common_ts_ets_apiStaticClearTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/common_ts_ets_api',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get common_ts_ets_api state success " + JSON.stringify(pages));
        if (!("common_ts_ets_api" == pages.name)) {
          console.info("get common_ts_ets_api state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push common_ts_ets_api page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push common_ts_ets_api page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("common_ts_ets_apiStaticClear after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcommon_ts_ets_apiStaticClear0001
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0001
     */
    it('testcommon_ts_ets_apiStaticClear0001', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("320.00vp");
      console.info("[testcommon_ts_ets_apiStaticClear0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcommon_ts_ets_apiStaticClear0002
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0002
     */
    it('testcommon_ts_ets_apiStaticClear0002', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testcommon_ts_ets_apiStaticClear0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testcommon_ts_ets_apiStaticClear0003
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0003
     */
    it('testcommon_ts_ets_apiStaticClear0003', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testcommon_ts_ets_apiStaticClear0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testcommon_ts_ets_apiStaticClear0004
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0004
     */
    it('testcommon_ts_ets_apiStaticClear0004', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testcommon_ts_ets_apiStaticClear0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testcommon_ts_ets_apiStaticClear0005
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0005
     */
    it('testcommon_ts_ets_apiStaticClear0005', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testcommon_ts_ets_apiStaticClear0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testcommon_ts_ets_apiStaticClear0006
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0006
     */
    it('testcommon_ts_ets_apiStaticClear0006', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testcommon_ts_ets_apiStaticClear0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testcommon_ts_ets_apiStaticClear0007
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0007
     */
    it('testcommon_ts_ets_apiStaticClear0007', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testcommon_ts_ets_apiStaticClear0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testcommon_ts_ets_apiStaticClear0009
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0009
     */
    it('testcommon_ts_ets_apiStaticClear0009', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testcommon_ts_ets_apiStaticClear0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testcommon_ts_ets_apiStaticClear0010
     * @tc.desic         acecommon_ts_ets_apiStaticClearEtsTest0010
     */
    it('testcommon_ts_ets_apiStaticClear0010', 0, async function (done) {
      console.info('common_ts_ets_apiStaticClear testcommon_ts_ets_apiStaticClear0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('staticClearText');
      console.info("[testcommon_ts_ets_apiStaticClear0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testcommon_ts_ets_apiStaticClear0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
