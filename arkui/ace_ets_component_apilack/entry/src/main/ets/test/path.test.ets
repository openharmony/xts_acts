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

export default function pathNeJsunit() {
  describe('pathNeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/path',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push path page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("pathNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpathNe0001
     * @tc.desic         acepathNeEtsTest0001
     */
    it('testpathNe0001', 0, async function (done) {
      console.info('pathNe testpathNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testpathNe0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpathNe0002
     * @tc.desic         acepathNeEtsTest0002
     */
    it('testpathNe0002', 0, async function (done) {
      console.info('pathNe testpathNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testpathNe0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testpathNe0003
     * @tc.desic         acepathNeEtsTest0003
     */
    it('testpathNe0003', 0, async function (done) {
      console.info('pathNe testpathNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testpathNe0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testpathNe0004
     * @tc.desic         acepathNeEtsTest0004
     */
    it('testpathNe0004', 0, async function (done) {
      console.info('pathNe testpathNe0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testpathNe0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testpathNe0005
     * @tc.desic         acepathNeEtsTest0005
     */
    it('testpathNe0005', 0, async function (done) {
      console.info('pathNe testpathNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testpathNe0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testpathNe0006
     * @tc.desic         acepathNeEtsTest0006
     */
    it('testpathNe0006', 0, async function (done) {
      console.info('pathNe testpathNe0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testpathNe0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testpathNe0007
     * @tc.desic         acepathNeEtsTest0007
     */
    it('testpathNe0007', 0, async function (done) {
      console.info('pathNe testpathNe0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testpathNe0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testpathNe0009
     * @tc.desic         acepathNeEtsTest0009
     */
    it('testpathNe0009', 0, async function (done) {
      console.info('pathNe testpathNe009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testpathNe0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testpathNe0010
     * @tc.desic         acepathNeEtsTest0010
     */
    it('testpathNe0010', 0, async function (done) {
      console.info('pathNe testpathNe0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('neText');
      console.info("[testpathNe0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testpathNe0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
