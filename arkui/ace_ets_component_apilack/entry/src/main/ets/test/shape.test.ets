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

export default function shapeNeJsunit() {
  describe('shapeNeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/shape',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shape state success " + JSON.stringify(pages));
        if (!("shape" == pages.name)) {
          console.info("get shape state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push shape page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shape page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("shapeNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testshapeNe0001
     * @tc.desic         aceshapeNeEtsTest0001
     */
    it('testshapeNe0001', 0, async function (done) {
      console.info('shapeNe testshapeNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testshapeNe0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testshapeNe0002
     * @tc.desic         aceshapeNeEtsTest0002
     */
    it('testshapeNe0002', 0, async function (done) {
      console.info('shapeNe testshapeNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testshapeNe0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testshapeNe0003
     * @tc.desic         aceshapeNeEtsTest0003
     */
    it('testshapeNe0003', 0, async function (done) {
      console.info('shapeNe testshapeNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testshapeNe0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testshapeNe0004
     * @tc.desic         aceshapeNeEtsTest0004
     */
    it('testshapeNe0004', 0, async function (done) {
      console.info('shapeNe testshapeNe0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testshapeNe0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testshapeNe0005
     * @tc.desic         aceshapeNeEtsTest0005
     */
    it('testshapeNe0005', 0, async function (done) {
      console.info('shapeNe testshapeNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testshapeNe0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testshapeNe0006
     * @tc.desic         aceshapeNeEtsTest0006
     */
    it('testshapeNe0006', 0, async function (done) {
      console.info('shapeNe testshapeNe0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testshapeNe0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testshapeNe0007
     * @tc.desic         aceshapeNeEtsTest0007
     */
    it('testshapeNe0007', 0, async function (done) {
      console.info('shapeNe testshapeNe0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testshapeNe0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testshapeNe0009
     * @tc.desic         aceshapeNeEtsTest0009
     */
    it('testshapeNe0009', 0, async function (done) {
      console.info('shapeNe testshapeNe009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testshapeNe0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testshapeNe0010
     * @tc.desic         aceshapeNeEtsTest0010
     */
    it('testshapeNe0010', 0, async function (done) {
      console.info('shapeNe testshapeNe0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testshapeNe0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testshapeNe0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
