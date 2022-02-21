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
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function imageEffectsJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/general-properties/imageEffects',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageEffects state success " + JSON.stringify(pages));
        if (!("imageEffects" == pages.name)) {
          console.info("get imageEffects state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push imageEffects page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageEffects page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info("imageEffects after each called");
    });

    it('testImageEffects001', 0, async function (done) {
      console.info('[testSizeSetting001] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow');
      console.info("[testImageEffects001] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.blur).assertEqual(100);
      done();
    });

    it('testImageEffects002', 0, async function (done) {
      console.info('[testImageEffects002] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "blurValue": "10"
          }
        }
        var innerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects002] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects002] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.blur).assertEqual(10);
      done();
    });

    it('testImageEffects003', 0, async function (done) {
      console.info('[testImageEffects003] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow3');
      let obj = JSON.parse(strJson);
      console.info("[testImageEffects003] component strJson:" + obj.$attrs.shadow);
      expect(obj.$attrs.shadow.radius).assertEqual("10.000000");
      expect(obj.$attrs.shadow.color).assertEqual("#FF808080");
      expect(obj.$attrs.shadow.offsetX).assertEqual("5.000000");
      expect(obj.$attrs.shadow.offsetY).assertEqual("5.000000");
      done();
    });

    it('testImageEffects004', 0, async function (done) {
      console.info('[testImageEffects004] START');
      await Utils.sleep(1000);
      let shadowValue = { radius: 20, color: Color.Gray, offsetX: 10, offsetY: 10 };
      try {
        var eventData = {
          data: {
            "shadowValue": JSON.stringify(shadowValue)
          }
        }
        var innerEvent = {
          eventId: 41,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects004] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow3');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects004] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.shadow.radius).assertEqual("20.000000");
      expect(objNew.$attrs.shadow.color).assertEqual("4289014314");
      expect(objNew.$attrs.shadow.offsetX).assertEqual("10.000000");
      expect(objNew.$attrs.shadow.offsetY).assertEqual("10.000000");
      done();
    });

    it('testImageEffects007', 0, async function (done) {
      console.info('[testSizeSetting007] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow5');
      console.info("[testImageEffects007] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.brightness).assertEqual(20);
      done();
    });

    it('testImageEffects008', 0, async function (done) {
      console.info('[testImageEffects002] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "brightnessValue": "15"
          }
        }
        var innerEvent = {
          eventId: 43,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects008] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow5');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects008] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.brightness).assertEqual(15);
      done();
    });

    it('testImageEffects009', 0, async function (done) {
      console.info('[testImageEffects009] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow6');
      console.info("[testImageEffects009] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testImageEffects009] component strJson:" + obj.$attrs.saturate);
      expect(obj.$attrs.saturate).assertEqual(50);
      done();
    });

    it('testImageEffects010', 0, async function (done) {
      console.info('[testImageEffects010] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "saturateValue": "40"
          }
        }
        var innerEvent = {
          eventId: 44,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects010] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow6');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects010] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.saturate).assertEqual(40);
      done();
    });

    it('testImageEffects011', 0, async function (done) {
      console.info('[testSizeSetting011] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow7');
      console.info("[testImageEffects011] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.contrast).assertEqual(20);
      done();
    });

    it('testImageEffects012', 0, async function (done) {
      console.info('[testImageEffects012] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "contrastValue": "10"
          }
        }
        var innerEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects012] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects012] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow7');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects012] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.contrast).assertEqual(10);
      done();
    });

    it('testImageEffects013', 0, async function (done) {
      console.info('[testSizeSetting0013] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow8');
      console.info("[testImageEffects013] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.invert).assertEqual(10);
      done();
    });

    it('testImageEffects014', 0, async function (done) {
      console.info('[testImageEffects014] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "invertValue": "20"
          }
        }
        var innerEvent = {
          eventId: 46,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects014] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects014] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow8');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects014] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.invert).assertEqual(20);
      done();
    });

    it('testImageEffects015', 0, async function (done) {
      console.info('[testImageEffects015] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('centerRow9');
      console.info("[testImageEffects015] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testImageEffects015] component strJson:" + obj.$attrs.shadow);
      expect(obj.$attrs.hueRotate).assertEqual(10);
      done();
    });

    it('testImageEffects016', 0, async function (done) {
      console.info('[testImageEffects016] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "hueRotateValue": "20"
          }
        }
        var innerEvent = {
          eventId: 47,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects016] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects016] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow9');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testImageEffects016] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.hueRotate).assertEqual(20);
      done();
    });

  })
}












