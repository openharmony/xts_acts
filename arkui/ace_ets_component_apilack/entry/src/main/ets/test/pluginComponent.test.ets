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

export default function pluginComponentRequestJsunit() {
  describe('pluginComponentRequestTest', function () {

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
      console.info('[pluginComponentRequestTest] before each called')

      let result;
      let options = {
        uri: 'pages/pluginComponent'
      }
      try {
        result = router.push(options)
        console.info("push pluginComponentRequestTest page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push pluginComponentRequestTest page error " + JSON.stringify(result));
      }
      await Utils.sleep(4000)
      done()
    });

    /**
    * run after testcase
    */
    afterAll(async function () {
      console.info('[pluginComponentRequestTest] after each called')
      await Utils.sleep(1000)
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpluginComponentRequest0001
     * @tc.desic         acepluginComponentRequestEtsTest0001
     */
    it('testpluginComponentRequest0001', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testpluginComponentRequest0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpluginComponentRequest0002
     * @tc.desic         acepluginComponentRequestEtsTest0002
     */
    it('testpluginComponentRequest0002', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testpluginComponentRequest0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testpluginComponentRequest0003
     * @tc.desic         acepluginComponentRequestEtsTest0003
     */
    it('testpluginComponentRequest0003', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testpluginComponentRequest0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testpluginComponentRequest0004
     * @tc.desic         acepluginComponentRequestEtsTest0004
     */
    it('testpluginComponentRequest0004', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testpluginComponentRequest0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testpluginComponentRequest0005
     * @tc.desic         acepluginComponentRequestEtsTest0005
     */
    it('testpluginComponentRequest0005', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testpluginComponentRequest0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testpluginComponentRequest0006
     * @tc.desic         acepluginComponentRequestEtsTest0006
     */
    it('testpluginComponentRequest0006', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testpluginComponentRequest0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testpluginComponentRequest0007
     * @tc.desic         acepluginComponentRequestEtsTest0007
     */
    it('testpluginComponentRequest0007', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testpluginComponentRequest0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testpluginComponentRequest0009
     * @tc.desic         acepluginComponentRequestEtsTest0009
     */
    it('testpluginComponentRequest0009', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testpluginComponentRequest0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testpluginComponentRequest0010
     * @tc.desic         acepluginComponentRequestEtsTest0010
     */
    it('testpluginComponentRequest0010', 0, async function (done) {
      console.info('pluginComponentRequest testpluginComponentRequest0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('requestText');
      console.info("[testpluginComponentRequest0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testpluginComponentRequest0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
