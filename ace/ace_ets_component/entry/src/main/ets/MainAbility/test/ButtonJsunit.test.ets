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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function buttonJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("button beforeEach start");
      let options = {
        uri: 'pages/button',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get button state pages: " + JSON.stringify(pages));
        if (!("appear" == pages.name)) {
          console.info("get button state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push button page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push button page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("button after each called");
    })

    it('testButton01', 0, async function (done) {
      console.info('[testButton01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button');
      let obj = JSON.parse(strJson);
      console.info("[testButton01] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal');
      done();
    });

    it('testButton02', 0, async function (done) {
      console.info('[testButton02] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button1');
      let obj = JSON.parse(strJson);
      console.info("[testButton02] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Button');
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal');
      done();
    });

    it('testButton03', 0, async function (done) {
      console.info('[testButton03] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('button2');
      let obj = JSON.parse(strJson);
      console.info("[testButton03] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontSize).assertEqual('20');
      done();
    });

    it('testButton04', 0, async function (done) {
      console.info('[testButton04] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "buttonTypeValue": "ButtonType.Capsule",
          }
        }
        var innerEvent = {
          eventId: 80,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton04] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton04] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.type).assertEqual('ButtonType.Capsule');
      done();
    });

    it('testButton05', 0, async function (done) {
      console.info('[testButton05] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": "30",
          }
        }
        var innerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton05] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton05] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton05] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('30');
      done();
    });

    it('testButton06', 0, async function (done) {
      console.info('[testButton06] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": "-1",
          }
        }
        var innerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton06] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton06] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton06] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('0');
      done();
    });

    it('testButton07', 0, async function (done) {
      console.info('[testButton07] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": "121212121",
          }
        }
        var innerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton07] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton07] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton07] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('121212121');
      done();
    });

    it('testButton08', 0, async function (done) {
      console.info('[testButton08] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "fontSizeValue": "121212121vaas",
          }
        }
        var innerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testButton08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testButton08] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('button2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testButton08] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontSize).assertEqual('121212121');
      done();
    });

  })
}
