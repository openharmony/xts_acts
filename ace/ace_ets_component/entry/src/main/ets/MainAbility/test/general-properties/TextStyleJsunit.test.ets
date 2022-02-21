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
import Utils from '../Utils.ets';

export default function textStyleJsunit() {
  describe('textStyleTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/general-properties/textStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textStyle state pages:" + JSON.stringify(pages));
        if (!("textStyle" == pages.name)) {
          console.info("get textStyle state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textStyle page error:" + JSON.stringify(result));
      }
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textStyle after each called");
    });

    it('testTextStyle001', 0, async function (done) {
      console.info('[testTextStyle001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('fontColor');
      console.info("[testTextStyle001] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle001] fontColor: " + obj.$attrs.fontColor);
      expect(obj.$attrs.fontColor).assertEqual('#FFFF0000');
      done();
    });

    it('testTextStyle002', 0, async function (done) {
      console.info('[testTextStyle002] START');
      try {
        let eventData = {
          data: {
            "fontColor": Color.Blue
          }
        }
        let indexEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle002] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle002] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('fontColor');
      console.info("[testTextStyle002] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle002] fontColor: " + obj.$attrs.fontColor);
      expect(obj.$attrs.fontColor).assertEqual('#FF0000FF');
      done();
    });

    it('testTextStyle003', 0, async function (done) {
      console.info('[testTextStyle003] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('fontSize');
      console.info("[testTextStyle003] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle003] fontSize: " + obj.$attrs.fontSize);
      expect(obj.$attrs.fontSize).assertEqual('20');
      done();
    });

    it('testTextStyle004', 0, async function (done) {
      console.info('[testTextStyle004] START');
      try {
        let eventData = {
          data: {
            "fontSize": 30
          }
        }
        let indexEvent = {
          eventId: 41,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle004] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('fontSize');
      console.info("[testTextStyle004] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle004] fontSize: " + obj.$attrs.fontSize);
      expect(obj.$attrs.fontSize).assertEqual('30');
      done();
    });

    it('testTextStyle005', 0, async function (done) {
      console.info('[testTextStyle005] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('fontStyle');
      console.info("[testTextStyle005] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle005] fontStyle: " + obj.$attrs.fontStyle);
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      done();
    });

    it('testTextStyle006', 0, async function (done) {
      console.info('[testTextStyle006] START');
      try {
        let eventData = {
          data: {
            "fontStyle": FontStyle.Normal
          }
        }
        let indexEvent = {
          eventId: 42,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle006] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('fontStyle');
      console.info("[testTextStyle006] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle006] fontStyle: " + obj.$attrs.fontStyle);
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
      done();
    });

    it('testTextStyle007', 0, async function (done) {
      console.info('[testTextStyle007] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('fontWeight');
      console.info("[testTextStyle007] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle007] fontWeight: " + obj.$attrs.fontWeight);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.700');
      done();
    });

    it('testTextStyle008', 0, async function (done) {
      console.info('[testTextStyle008] START');
      try {
        let eventData = {
          data: {
            "fontWeight": 400
          }
        }
        let indexEvent = {
          eventId: 43,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle008] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle008] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('fontWeight');
      console.info("[testTextStyle008] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle008] fontWeight: " + obj.$attrs.fontWeight);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.400');
      done();
    });

    it('testTextStyle009', 0, async function (done) {
      console.info('[testTextStyle009] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('fontFamily');
      console.info("[testTextStyle009] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle009] fontFamily: " + obj.$attrs.fontFamily);
      expect(obj.$attrs.fontFamily).assertEqual('sans-serif');
      done();
    });

    it('testTextStyle0010', 0, async function (done) {
      console.info('[testTextStyle0010] START');
      try {
        let eventData = {
          data: {
            "fontFamily": 'Arial'
          }
        }
        let indexEvent = {
          eventId: 44,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle0010] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle0010] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('fontFamily');
      console.info("[testTextStyle0010] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testTextStyle0010] fontFamily: " + obj.$attrs.fontFamily);
      expect(obj.$attrs.fontFamily).assertEqual('Arial');
      done();
    });
  });
}