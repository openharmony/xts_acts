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

export default function textClockJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("text beforeEach start");
      let options = {
        uri: 'pages/textClock',
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
        console.error("push text page error:" + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("text after each called");
    });

    it('textClock01', 0, async function (done) {
      console.info('[textClock01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textClock01] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs).assertEqual('textClock');
      expect(obj.$attrs.fontSize).assertEqual('30');
      console.info('textClock01 END');
      done();
    });

    it('textClock02', 0, async function (done) {
      console.info('[textClock02] START');
      try {
        var eventData = {
          data: {
            "fontSize": '50',
          }
        }
        var innerEvent = {
          eventId: 1215,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClock02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textClock02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textClock02] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontSize).assertEqual('50');
      console.info('textClock02 END');
      done();
    });

    it('textClock03', 0, async function (done) {
      console.info('[textClock03] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textClock03] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual('Color.Red');
      console.info('textClock03 END');
      done();
    });

    it('textClock04', 0, async function (done) {
      console.info('[textClock04] START');
      try {
        var eventData = {
          data: {
            "fontColor": 'Color.Blue',
          }
        }
        var innerEvent = {
          eventId: 1216,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClock04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textClock04] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textClock04] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual('Color.Blue');
      console.info('textClock04 END');
      done();
    });

    it('textClock05', 0, async function (done) {
      console.info('[textClock05] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textClock');
      let obj = JSON.parse(strJson);
      console.info("[textClock05] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.format).assertEqual('hhmmss');
      console.info('textClock05 END');
      done();
    });

    it('textClock06', 0, async function (done) {
      console.info('[textClock06] START');
      try {
        var eventData = {
          data: {
            "format": 'yyyymmmmss',
          }
        }
        var innerEvent = {
          eventId: 1217,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClock06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textClock06] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textClock06] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.format).assertEqual('yyyymmmmss');
      console.info('textClock06 END');
      done();
    });

    it('textClock07', 0, async function (done) {
      console.info('textClock07 START');
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("textClock07 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 1129,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("textClock07 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("textClock07 click result is: " + JSON.stringify(sendEventByKey('button',10,"")));
      await Utils.sleep(1000);
      console.info('textClock07 END');
      done();
    });

    it('textClock10', 0, async function (done) {
      console.info('[textClock10] START');
      try {
        var eventData = {
          data: {
            "format": 'yyyymmmmss',
          }
        }
        var innerEvent = {
          eventId: 1217,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[textClock10] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[textClock10] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj = JSON.parse(strJson);
      console.info("[textClock10] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.Text).assertEqual('yyyymmmmss');
      console.info('textClock10 END');
      done();
    });
  })
}
