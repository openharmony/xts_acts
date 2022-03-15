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

export default function textInputJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("textInput beforeEach start");
      let options = {
        uri: 'pages/textInput',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInput state pages:" + JSON.stringify(pages));
        if (!("textInput" == pages.name)) {
          console.info("get textInput state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInput page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInput page error:" + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInput after each called");
    });

    it('textInput01', 0, async function (done) {
      console.info('[textInput01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextInput');
      let obj = JSON.parse(strJson);
      console.info("[textInput01] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs).assertEqual('textInput');
      expect(obj.$attrs.fontSize).assertEqual('30');
      console.info('textInput01 END');
      done();
    });

    it('textInput02', 0, async function (done) {
      console.info('[textInput02] START');
      try {
        var eventData = {
          data: {
            "fontSize": '50',
          }
        }
        var innerEvent = {
          eventId: 1315,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInput02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInput02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextInput');
      let obj = JSON.parse(strJson);
      console.info("[textInput02] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontSize).assertEqual('50');
      console.info('textInput02 END');
      done();
    });

    it('textInput03', 0, async function (done) {
      console.info('[textInput04] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextInput');
      let obj = JSON.parse(strJson);
      console.info("[textInput03] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual('Color.Red');
      console.info('textInput03 END');
      done();
    });

    it('textInput04', 0, async function (done) {
      console.info('[textInput04] START');
      try {
        var eventData = {
          data: {
            "fontColor": 'Color.Green',
          }
        }
        var innerEvent = {
          eventId: 1316,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInput04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInput04] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextInput');
      let obj = JSON.parse(strJson);
      console.info("[textInput04] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual('Color.Green');
      console.info('textInput04 END');
      done();
    });

    it('textInput05', 0, async function (done) {
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("textInput05 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 3020,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("textInput05 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('textInput05 END');
      done();
    });

    it('textInput06', 0, async function (done) {
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("textInput06 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 3021,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("textInput06 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('textInput06 END');
      done();
    });

    it('textInput07', 0, async function (done) {
      console.info('[textInput07] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextInput');
      let obj = JSON.parse(strJson);
      console.info("[textInput07] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('InputType.Normal');
      console.info('textInput07 END');
      done();
    });

    it('textInput08', 0, async function (done) {
      console.info('[textInput08] START');
      try {
        var eventData = {
          data: {
            "type": 'TextAlign.Start',
          }
        }
        var innerEvent = {
          eventId: 1317,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInput08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInput08] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextInput');
      let obj = JSON.parse(strJson);
      console.info("[textInput08] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('TextAlign.Start');
      console.info('textInput08 END');
      done();
    });

    it('textInput09', 0, async function (done) {
      console.info('[textInput09] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textInput09] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.Text).assertEqual('TextInput');
      console.info('textInput09 END');
      done();
    });

    it('textInput10', 0, async function (done) {
      console.info('[textInput10] START');
      try {
        var eventData = {
          data: {
            "Text": 'TextInput_1',
          }
        }
        var innerEvent = {
          eventId: 1118,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textInput10] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textInput10] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textInput10] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('TextInput_1');
      console.info('textInput10 END');
      done();
    });
  })
}
