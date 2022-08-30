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

export default function gridMaxCountJsunit() {
  describe('gridMaxCountTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/grid',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("grid" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gridMaxCount after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgridMaxCount0001
     * @tc.desic         acegridMaxCountEtsTest0001
     */
    it('testgridMaxCount0001', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testgridMaxCount0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgridMaxCount0002
     * @tc.desic         acegridMaxCountEtsTest0002
     */
    it('testgridMaxCount0002', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testgridMaxCount0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgridMaxCount0003
     * @tc.desic         acegridMaxCountEtsTest0003
     */
    it('testgridMaxCount0003', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testgridMaxCount0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgridMaxCount0004
     * @tc.desic         acegridMaxCountEtsTest0004
     */
    it('testgridMaxCount0004', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testgridMaxCount0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgridMaxCount0005
     * @tc.desic         acegridMaxCountEtsTest0005
     */
    it('testgridMaxCount0005', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testgridMaxCount0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgridMaxCount0006
     * @tc.desic         acegridMaxCountEtsTest0006
     */
    it('testgridMaxCount0006', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testgridMaxCount0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testgridMaxCount0007
     * @tc.desic         acegridMaxCountEtsTest0007
     */
    it('testgridMaxCount0007', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testgridMaxCount0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testgridMaxCount0009
     * @tc.desic         acegridMaxCountEtsTest0009
     */
    it('testgridMaxCount0009', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testgridMaxCount0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testgridMaxCount0010
     * @tc.desic         acegridMaxCountEtsTest0010
     */
    it('testgridMaxCount0010', 0, async function (done) {
      console.info('gridMaxCount testgridMaxCount0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountText');
      console.info("[testgridMaxCount0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testgridMaxCount0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
