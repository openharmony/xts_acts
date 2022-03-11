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
import Utils from './Utils';

export default function selectJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/select',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get select state success " + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get select success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push select page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info("select after each called");
    });

    it('selectTest_0100', 0, async function (done) {
      console.info('selectTest_0100 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select');
      let obj = JSON.parse(strJson);
      console.info("selectTest_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.value).assertEqual('10');
      await Utils.sleep(1000);
      done();
    });

    it('selectTest_0200', 0, async function (done) {
      console.info('[selectTest_0200] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "value": "5"
          }
        }
        var innerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('select');
      let objNew = JSON.parse(strJsonNew);
      console.info("[selectTest_0200] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.value).assertEqual('5');
      done();
    });

    it('selectTest_0300', 0, async function (done) {
      console.info('[selectTest_0300] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('select');
      console.info("[selectTest_0300] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[selectTest_0300] font:" + obj.$attrs.font);
      expect(obj.$attrs.font.size).assertEqual('24.00vp');
      expect(obj.$attrs.font.weight).assertEqual('500');
      expect(obj.$attrs.font.family).assertEqual('sans-serif');
      expect(obj.$attrs.font.style).assertEqual('FontStyle.Normal');
      done();
    });

    it('selectTest_0400', 0, async function (done) {
      console.info('[selectTest_0400] START');
      await Utils.sleep(1000);
      let font = {size: 30, weight:400, family: 'serif', style: FontStyle.Normal };
      try {
        var eventData = {
          data: {
            "font": JSON.stringify(font)
          }
        }
        var innerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('select');
      console.info("[selectTest_0400] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[selectTest_0400] font:" + obj.$attrs.font);
      expect(obj.$attrs.font.size).assertEqual('20.00vp');
      expect(obj.$attrs.font.weight).assertEqual('50');
      expect(obj.$attrs.font.family).assertEqual('sans-serif');
      expect(obj.$attrs.font.style).assertEqual('FontStyle.Normal');
      done();
    });

    it('selectTest_0500', 0, async function (done) {
      console.info('[selectTest_0500] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('select');
      console.info("[selectTest_0500] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[selectTest_0500] fontColor:" + obj.$attrs.fontColor);
      expect(obj.$attrs.fontColor).assertEqual('#FFCCCCCC');
      done();
    });

    it('selectTest_0600', 0, async function (done) {
      console.info('[selectTest_0600] START');
      try {
        let eventData = {
          data: {
            "fontColor": '#FF000990'
          }
        }
        let indexEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0600] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0600] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('select');
      console.info("[selectTest_0600] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[selectTest_0600] fontColor:" + obj.$attrs.fontColor);
      expect(obj.$attrs.fontColor).assertEqual('#FF000990');
      done();
    });
  })
}
