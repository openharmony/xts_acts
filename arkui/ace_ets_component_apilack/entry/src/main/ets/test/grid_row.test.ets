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

export default function grid_rowOnBreakpointChangeJsunit() {
  describe('grid_rowOnBreakpointChangeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/grid_row',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid_row state success " + JSON.stringify(pages));
        if (!("grid_row" == pages.name)) {
          console.info("get grid_row state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push grid_row page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid_row page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("grid_rowOnBreakpointChange after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgrid_rowOnBreakpointChange0001
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0001
     */
    it('testgrid_rowOnBreakpointChange0001', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testgrid_rowOnBreakpointChange0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgrid_rowOnBreakpointChange0002
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0002
     */
    it('testgrid_rowOnBreakpointChange0002', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testgrid_rowOnBreakpointChange0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgrid_rowOnBreakpointChange0003
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0003
     */
    it('testgrid_rowOnBreakpointChange0003', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testgrid_rowOnBreakpointChange0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgrid_rowOnBreakpointChange0004
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0004
     */
    it('testgrid_rowOnBreakpointChange0004', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testgrid_rowOnBreakpointChange0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgrid_rowOnBreakpointChange0005
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0005
     */
    it('testgrid_rowOnBreakpointChange0005', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testgrid_rowOnBreakpointChange0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgrid_rowOnBreakpointChange0006
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0006
     */
    it('testgrid_rowOnBreakpointChange0006', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testgrid_rowOnBreakpointChange0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testgrid_rowOnBreakpointChange0007
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0007
     */
    it('testgrid_rowOnBreakpointChange0007', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testgrid_rowOnBreakpointChange0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testgrid_rowOnBreakpointChange0009
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0009
     */
    it('testgrid_rowOnBreakpointChange0009', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testgrid_rowOnBreakpointChange0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testgrid_rowOnBreakpointChange0010
     * @tc.desic         acegrid_rowOnBreakpointChangeEtsTest0010
     */
    it('testgrid_rowOnBreakpointChange0010', 0, async function (done) {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onBreakpointChangeText');
      console.info("[testgrid_rowOnBreakpointChange0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testgrid_rowOnBreakpointChange0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
