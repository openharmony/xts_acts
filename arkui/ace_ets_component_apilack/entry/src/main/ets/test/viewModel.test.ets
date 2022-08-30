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

export default function viewModelMatrixJsunit() {
  describe('viewModelMatrixTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/viewModel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get viewModel state success " + JSON.stringify(pages));
        if (!("viewModel" == pages.name)) {
          console.info("get viewModel state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push viewModel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push viewModel page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("viewModelMatrix after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testviewModelMatrix0001
     * @tc.desic         aceviewModelMatrixEtsTest0001
     */
    it('testviewModelMatrix0001', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testviewModelMatrix0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testviewModelMatrix0002
     * @tc.desic         aceviewModelMatrixEtsTest0002
     */
    it('testviewModelMatrix0002', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testviewModelMatrix0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testviewModelMatrix0003
     * @tc.desic         aceviewModelMatrixEtsTest0003
     */
    it('testviewModelMatrix0003', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testviewModelMatrix0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testviewModelMatrix0004
     * @tc.desic         aceviewModelMatrixEtsTest0004
     */
    it('testviewModelMatrix0004', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testviewModelMatrix0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testviewModelMatrix0005
     * @tc.desic         aceviewModelMatrixEtsTest0005
     */
    it('testviewModelMatrix0005', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testviewModelMatrix0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testviewModelMatrix0006
     * @tc.desic         aceviewModelMatrixEtsTest0006
     */
    it('testviewModelMatrix0006', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testviewModelMatrix0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testviewModelMatrix0007
     * @tc.desic         aceviewModelMatrixEtsTest0007
     */
    it('testviewModelMatrix0007', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testviewModelMatrix0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testviewModelMatrix0009
     * @tc.desic         aceviewModelMatrixEtsTest0009
     */
    it('testviewModelMatrix0009', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testviewModelMatrix0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testviewModelMatrix0010
     * @tc.desic         aceviewModelMatrixEtsTest0010
     */
    it('testviewModelMatrix0010', 0, async function (done) {
      console.info('viewModelMatrix testviewModelMatrix0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('matrixText');
      console.info("[testviewModelMatrix0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testviewModelMatrix0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
