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

export default function scrollOnScrollBeginJsunit() {
  describe('scrollOnScrollBeginTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/scroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("scrollOnScrollBegin after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testscrollOnScrollBegin0001
     * @tc.desic         acescrollOnScrollBeginEtsTest0001
     */
    it('testscrollOnScrollBegin0001', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testscrollOnScrollBegin0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testscrollOnScrollBegin0002
     * @tc.desic         acescrollOnScrollBeginEtsTest0002
     */
    it('testscrollOnScrollBegin0002', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testscrollOnScrollBegin0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testscrollOnScrollBegin0003
     * @tc.desic         acescrollOnScrollBeginEtsTest0003
     */
    it('testscrollOnScrollBegin0003', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testscrollOnScrollBegin0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testscrollOnScrollBegin0004
     * @tc.desic         acescrollOnScrollBeginEtsTest0004
     */
    it('testscrollOnScrollBegin0004', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testscrollOnScrollBegin0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testscrollOnScrollBegin0005
     * @tc.desic         acescrollOnScrollBeginEtsTest0005
     */
    it('testscrollOnScrollBegin0005', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testscrollOnScrollBegin0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testscrollOnScrollBegin0006
     * @tc.desic         acescrollOnScrollBeginEtsTest0006
     */
    it('testscrollOnScrollBegin0006', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testscrollOnScrollBegin0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testscrollOnScrollBegin0007
     * @tc.desic         acescrollOnScrollBeginEtsTest0007
     */
    it('testscrollOnScrollBegin0007', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testscrollOnScrollBegin0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testscrollOnScrollBegin0009
     * @tc.desic         acescrollOnScrollBeginEtsTest0009
     */
    it('testscrollOnScrollBegin0009', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testscrollOnScrollBegin0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testscrollOnScrollBegin0010
     * @tc.desic         acescrollOnScrollBeginEtsTest0010
     */
    it('testscrollOnScrollBegin0010', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onScrollBeginText');
      console.info("[testscrollOnScrollBegin0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testscrollOnScrollBegin0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
