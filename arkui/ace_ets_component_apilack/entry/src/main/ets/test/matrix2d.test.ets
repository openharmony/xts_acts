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

export default function matrix2dMultiplyJsunit() {
  describe('matrix2dMultiplyTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/matrix2d',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get matrix2d state success " + JSON.stringify(pages));
        if (!("matrix2d" == pages.name)) {
          console.info("get matrix2d state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push matrix2d page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push matrix2d page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("matrix2dMultiply after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testmatrix2dMultiply0001
     * @tc.desic         acematrix2dMultiplyEtsTest0001
     */
    it('testmatrix2dMultiply0001', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testmatrix2dMultiply0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testmatrix2dMultiply0002
     * @tc.desic         acematrix2dMultiplyEtsTest0002
     */
    it('testmatrix2dMultiply0002', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testmatrix2dMultiply0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testmatrix2dMultiply0003
     * @tc.desic         acematrix2dMultiplyEtsTest0003
     */
    it('testmatrix2dMultiply0003', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testmatrix2dMultiply0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testmatrix2dMultiply0004
     * @tc.desic         acematrix2dMultiplyEtsTest0004
     */
    it('testmatrix2dMultiply0004', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testmatrix2dMultiply0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testmatrix2dMultiply0005
     * @tc.desic         acematrix2dMultiplyEtsTest0005
     */
    it('testmatrix2dMultiply0005', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testmatrix2dMultiply0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testmatrix2dMultiply0006
     * @tc.desic         acematrix2dMultiplyEtsTest0006
     */
    it('testmatrix2dMultiply0006', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testmatrix2dMultiply0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testmatrix2dMultiply0007
     * @tc.desic         acematrix2dMultiplyEtsTest0007
     */
    it('testmatrix2dMultiply0007', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testmatrix2dMultiply0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testmatrix2dMultiply0009
     * @tc.desic         acematrix2dMultiplyEtsTest0009
     */
    it('testmatrix2dMultiply0009', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testmatrix2dMultiply0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testmatrix2dMultiply0010
     * @tc.desic         acematrix2dMultiplyEtsTest0010
     */
    it('testmatrix2dMultiply0010', 0, async function (done) {
      console.info('matrix2dMultiply testmatrix2dMultiply0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('multiplyText');
      console.info("[testmatrix2dMultiply0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testmatrix2dMultiply0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
