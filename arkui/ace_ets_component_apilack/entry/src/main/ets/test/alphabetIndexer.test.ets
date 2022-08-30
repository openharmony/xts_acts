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

export default function alphabetIndexerOnSelectJsunit() {
  describe('alphabetIndexerOnSelectTest', function () {

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
      console.info('[alphabetIndexerOnSelectTest] before each called')

      let result;
      let options = {
        uri: 'pages/alphabetIndexer'
      }
      try {
        result = router.push(options)
        console.info("push alphabetIndexerOnSelectTest page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push alphabetIndexerOnSelectTest page error " + JSON.stringify(result));
      }
      await Utils.sleep(4000)
      done()
    });

    /**
    * run after testcase
    */
    afterAll(async function () {
      console.info('[alphabetIndexerOnSelectTest] after each called')
      await Utils.sleep(1000)
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testalphabetIndexerOnSelect0001
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0001
     */
    it('testalphabetIndexerOnSelect0001', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("100.00vp");
      console.info("[testalphabetIndexerOnSelect0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testalphabetIndexerOnSelect0002
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0002
     */
    it('testalphabetIndexerOnSelect0002', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.height).assertEqual("70.00vp");
      console.info("[testalphabetIndexerOnSelect0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testalphabetIndexerOnSelect0003
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0003
     */
    it('testalphabetIndexerOnSelect0003', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testalphabetIndexerOnSelect0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testalphabetIndexerOnSelect0004
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0004
     */
    it('testalphabetIndexerOnSelect0004', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testalphabetIndexerOnSelect0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testalphabetIndexerOnSelect0005
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0005
     */
    it('testalphabetIndexerOnSelect0005', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testalphabetIndexerOnSelect0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testalphabetIndexerOnSelect0006
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0006
     */
    it('testalphabetIndexerOnSelect0006', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testalphabetIndexerOnSelect0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testalphabetIndexerOnSelect0007
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0007
     */
    it('testalphabetIndexerOnSelect0007', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testalphabetIndexerOnSelect0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testalphabetIndexerOnSelect0009
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0009
     */
    it('testalphabetIndexerOnSelect0009', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.padding).assertEqual("10.00vp");
      console.info("[testalphabetIndexerOnSelect0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testalphabetIndexerOnSelect0010
     * @tc.desic         acealphabetIndexerOnSelectEtsTest0010
     */
    it('testalphabetIndexerOnSelect0010', 0, async function (done) {
      console.info('alphabetIndexerOnSelect testalphabetIndexerOnSelect0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onSelectText');
      console.info("[testalphabetIndexerOnSelect0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testalphabetIndexerOnSelect0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });
  })
}
