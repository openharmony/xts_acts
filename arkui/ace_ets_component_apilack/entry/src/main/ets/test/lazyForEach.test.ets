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

export default function lazyForEachOnDataAddJsunit() {
  describe('lazyForEachOnDataAddTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/lazyForEach',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get lazyForEach state success " + JSON.stringify(pages));
        if (!("lazyForEach" == pages.name)) {
          console.info("get lazyForEach state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push lazyForEach page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lazyForEach page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("lazyForEachOnDataAdd after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlazyForEachOnDataAdd0001
     * @tc.desic         acelazyForEachOnDataAddEtsTest0001
     */
    it('testlazyForEachOnDataAdd0001', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("300.00vp");
      console.info("[testlazyForEachOnDataAdd0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testlazyForEachOnDataAdd0002
     * @tc.desic         acelazyForEachOnDataAddEtsTest0002
     */
    it('testlazyForEachOnDataAdd0002', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testlazyForEachOnDataAdd0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testlazyForEachOnDataAdd0003
     * @tc.desic         acelazyForEachOnDataAddEtsTest0003
     */
    it('testlazyForEachOnDataAdd0003', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testlazyForEachOnDataAdd0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testlazyForEachOnDataAdd0004
     * @tc.desic         acelazyForEachOnDataAddEtsTest0004
     */
    it('testlazyForEachOnDataAdd0004', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testlazyForEachOnDataAdd0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testlazyForEachOnDataAdd0005
     * @tc.desic         acelazyForEachOnDataAddEtsTest0005
     */
    it('testlazyForEachOnDataAdd0005', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testlazyForEachOnDataAdd0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testlazyForEachOnDataAdd0006
     * @tc.desic         acelazyForEachOnDataAddEtsTest0006
     */
    it('testlazyForEachOnDataAdd0006', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testlazyForEachOnDataAdd0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testlazyForEachOnDataAdd0007
     * @tc.desic         acelazyForEachOnDataAddEtsTest0007
     */
    it('testlazyForEachOnDataAdd0007', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testlazyForEachOnDataAdd0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testlazyForEachOnDataAdd0009
     * @tc.desic         acelazyForEachOnDataAddEtsTest0009
     */
    it('testlazyForEachOnDataAdd0009', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testlazyForEachOnDataAdd0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testlazyForEachOnDataAdd0010
     * @tc.desic         acelazyForEachOnDataAddEtsTest0010
     */
    it('testlazyForEachOnDataAdd0010', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testlazyForEachOnDataAdd0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
