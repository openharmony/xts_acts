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

export default function curvesStepsJsunit() {
  describe('curvesStepsTest', function () {

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
      console.info('[curvesStepsTest] before each called')

      let result;
      let options = {
        uri: 'pages/curves'
      }
      try {
        result = router.push(options)
        console.info("push curves page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push curves page error " + JSON.stringify(result));
      }
      await Utils.sleep(4000)
      done()
    });

    /**
    * run after testcase
    */
    afterAll(async function () {
      console.info('[curvesStepsTest] after each called')
      await Utils.sleep(1000)
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcurvesSteps0001
     * @tc.desic         acecurvesStepsEtsTest0001
     */
    it('testcurvesSteps0001', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testcurvesSteps0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcurvesSteps0002
     * @tc.desic         acecurvesStepsEtsTest0002
     */
    it('testcurvesSteps0002', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testcurvesSteps0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testcurvesSteps0003
     * @tc.desic         acecurvesStepsEtsTest0003
     */
    it('testcurvesSteps0003', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testcurvesSteps0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testcurvesSteps0004
     * @tc.desic         acecurvesStepsEtsTest0004
     */
    it('testcurvesSteps0004', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testcurvesSteps0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testcurvesSteps0005
     * @tc.desic         acecurvesStepsEtsTest0005
     */
    it('testcurvesSteps0005', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testcurvesSteps0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testcurvesSteps0006
     * @tc.desic         acecurvesStepsEtsTest0006
     */
    it('testcurvesSteps0006', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testcurvesSteps0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testcurvesSteps0007
     * @tc.desic         acecurvesStepsEtsTest0007
     */
    it('testcurvesSteps0007', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testcurvesSteps0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testcurvesSteps0009
     * @tc.desic         acecurvesStepsEtsTest0009
     */
    it('testcurvesSteps0009', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testcurvesSteps0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testcurvesSteps0010
     * @tc.desic         acecurvesStepsEtsTest0010
     */
    it('testcurvesSteps0010', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('stepsText');
      console.info("[testcurvesSteps0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testcurvesSteps0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
