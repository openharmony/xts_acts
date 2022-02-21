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

export default function gaugeJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/gauge',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gauge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gauge page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info("gauge after each called");
    });

    it('testGauge001', 0, async function (done) {
      console.info('[testGauge001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('gauge');
      let obj = JSON.parse(strJson);
      console.info("[testGauge001] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.strokeWidth).assertEqual('20.000000vp');
      expect(obj.$attrs.width).assertEqual('200.000000vp');
      expect(obj.$attrs.height).assertEqual('200.000000vp');
      expect(obj.$attrs.value).assertEqual('50.00');
      done();
    });

    it('testGauge002', 0, async function (done) {
      console.info('[testGauge002] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "gaugeValue": "10",
            "strokeWidthValue": "30",
            "startAngleValue": "200",
            "endAngleValue": "200"
          }
        }
        var innerEvent = {
          eventId: 1,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge002] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('gauge');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testGauge002] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.strokeWidth).assertEqual('30.000000vp');
      expect(objNew.$attrs.value).assertEqual('10.00');
      done();
    });

    it('testGauge003', 0, async function (done) {
      console.info('[testGauge003] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "colorValues": JSON.stringify([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1]])
          }
        }
        var innerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge003] change component data error: " + err.message);
      }
      done();
    });
  })
}
