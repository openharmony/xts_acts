// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets";
import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function textJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("text beforeEach start");
      let options = {
        uri: 'pages/text',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get text state pages:" + JSON.stringify(pages));
        if (!("text" == pages.name)) {
          console.info("get text state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push text page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push text page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("text after each called");
    });

    it('testText_0100', 0, async function (done) {
      console.info('testText_0100 START');
      let strJson = getInspectorByKey('text');
      console.info("testText_0100 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("testText_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual('9.000000fp');
      console.info('testText_0100 END');
      done();
    });

    it('testText_0200', 0, async function (done) {
      console.info('testText_0200 START');
      let strJson = getInspectorByKey('text1');
      console.info("testText_0200 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("testText_0200 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual('28.000000px');
      console.info('testText_0200 END');
      done();
    });

    it('testText_0300', 0, async function (done) {
      console.info('testText_0300 START');
      let strJson = getInspectorByKey('text1');
      console.info("testText_0300 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("testText_0300 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Hello');
      console.info('testText_0300 END');
      done();
    });

    it('testText_0400', 0, async function (done) {
      console.info('testText_0400 START');
      let strJson = getInspectorByKey('text1');
      console.info("testText_0400 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("testText_0400 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontColor).assertEqual('#FFFF0000');
      console.info('testText_0400 END');
      done();
    });

    it('testText_0500', 0, async function (done) {
      console.info('testText_0500 START');
      let strJson = getInspectorByKey('image');
      console.info("testText_0500 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("testText_0500 component obj is: " + JSON.stringify(obj));
      var res = obj.$attrs.src.indexOf('rawfile/test.png');
      console.info("testText_0500 result is: " + res);
      var sres = obj.$attrs.src.slice(res,res + 16);
      console.info("testText_0500 slice result is: " + sres);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.src.slice(res,res + 16)).assertEqual('rawfile/test.png');
      console.info('testText_0500 END');
      done();
    });

    it('testText_0600', 0, async function (done) {
      console.info('testText_0600 START');
      try {
        let eventData = {
          data: {
            "fontSize": "10",
          }
        }
        let indexEvent = {
          eventId: 60,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testText_0600 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testText_0600 change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJsonNew = getInspectorByKey('text');
      let objNew = JSON.parse(strJsonNew);
      console.info("testText_0600 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('10.000000fp');
      console.info('testText_0600 END');
      done();
    });
  })
}