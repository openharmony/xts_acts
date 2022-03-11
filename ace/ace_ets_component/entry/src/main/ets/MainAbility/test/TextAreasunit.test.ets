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

export default function textAreaJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("textArea beforeEach start");
      let options = {
        uri: 'pages/textArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea state pages:" + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textArea state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textArea page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea page error:" + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textArea after each called");
    });

    it('textArea01', 0, async function (done) {
      console.info('[textArea01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj = JSON.parse(strJson);
      console.info("[textArea01] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs).assertEqual('textArea');
      expect(obj.$attrs.fontSize).assertEqual('30');
      console.info('textArea01 END');
      done();
    });

    it('textArea02', 0, async function (done) {
      console.info('[textArea02] START');
      try {
        var eventData = {
          data: {
            "fontSize": '50',
          }
        }
        var innerEvent = {
          eventId: 1115,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textArea02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textArea02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj = JSON.parse(strJson);
      console.info("[textArea02] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontSize).assertEqual('50');
      console.info('textArea02 END');
      done();
    });

    it('textArea03', 0, async function (done) {
      console.info('[textArea03] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj = JSON.parse(strJson);
      console.info("[textArea03] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual('Color.Red');
      console.info('textArea03 END');
      done();
    });

    it('textArea04', 0, async function (done) {
      console.info('[textArea04] START');
      try {
        var eventData = {
          data: {
            "fontColor": 'Color.Green',
          }
        }
        var innerEvent = {
          eventId: 1116,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textArea04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textArea04] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj = JSON.parse(strJson);
      console.info("[textArea04] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual('Color.Green');
      console.info('textArea04 END');
      done();
    });

    it('textArea05', 0, async function (done) {
      console.info('[testArea05] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj = JSON.parse(strJson);
      console.info("[textArea05] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('textArea05 END');
      done();
    });

    it('textArea06', 0, async function (done) {
      console.info('[textArea06] START');
      try {
        var eventData = {
          data: {
            "textAlign": 'TextAlign.Start',
          }
        }
        var innerEvent = {
          eventId: 1117,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textArea06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textArea06] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      let obj = JSON.parse(strJson);
      console.info("[textArea06] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('textArea06 END');
      done();
    });

    it('textArea07', 0, async function (done) {
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("textArea07 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 2020,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("textArea07 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('textArea07 END');
      done();
    });

    it('textArea08', 0, async function (done) {
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("textArea08 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 2021,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("textArea08 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('textArea08 END');
      done();
    });

    it('textArea09', 0, async function (done) {
      console.info('[textArea09] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textArea09] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.Text).assertEqual('TextArea');
      console.info('textArea09 END');
      done();
    });

    it('textArea09', 0, async function (done) {
      console.info('[textArea09] START');
      try {
        var eventData = {
          data: {
            "Text": 'TextArea_1',
          }
        }
        var innerEvent = {
          eventId: 1318,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textArea09] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textArea09] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textArea09] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.type).assertEqual('TextArea_1');
      console.info('textArea09 END');
      done();
    });
  })
}
