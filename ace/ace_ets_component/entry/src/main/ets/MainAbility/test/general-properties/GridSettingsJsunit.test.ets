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

export default function gridSettingsJsunit() {
  describe('gridSettingsTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/general-properties/gridSettings',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridSettings state pages:" + JSON.stringify(pages));
        if (!("textStyle" == pages.name)) {
          console.info("get gridSettings state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gridSettings page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridSettings page error:" + err);
      }
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gridSettings after each called");
    });

    it('testGridSettings001', 0, async function (done) {
      console.info('[testGridSettings001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('gridRow');
      console.info("[testGridSettings001] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testGridSettings001] gridRow useSizeType: " + JSON.stringify(obj.$attrs.useSizeType));
      expect(obj.$attrs.useSizeType.sm.span).assertEqual(2);
      expect(obj.$attrs.useSizeType.sm.offset).assertEqual(1);
      done();
    });

    it('testGridSettings002', 0, async function (done) {
      console.info('[testGridSettings002] START');
      try {
        let eventData = {
          data: {
            "span": 1,
            "offset": 2
          }
        }
        let indexEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGridSettings002] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testGridSettings002] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('gridRow');
      console.info("[testGridSettings002] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testGridSettings002] gridRow useSizeType: " + JSON.stringify(obj.$attrs.useSizeType));
      expect(obj.$attrs.useSizeType.sm.span).assertEqual(1);
      expect(obj.$attrs.useSizeType.sm.offset).assertEqual(2);
      done();
    });

    it('testGridSettings003', 0, async function (done) {
      console.info('[testGridSettings003] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('gridOffset');
      console.info("[testGridSettings003] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testGridSettings003] gridOffset: " + JSON.stringify(obj.$attrs.gridOffset));
      expect(obj.$attrs.gridOffset).assertEqual(0);
      done();
    });

    it('testGridSettings004', 0, async function (done) {
      console.info('[testGridSettings004] START');
      try {
        let eventData = {
          data: {
            "gridOffset": 1
          }
        }
        let indexEvent = {
          eventId: 46,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGridSettings004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testGridSettings004] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('gridOffset');
      console.info("[testGridSettings004] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testGridSettings004] gridOffset: " + JSON.stringify(obj.$attrs.gridOffset));
      expect(obj.$attrs.gridOffset).assertEqual(1);
      done();
    });

    it('testGridSettings005', 0, async function (done) {
      console.info('[testGridSettings005] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('gridSpan');
      console.info("[testGridSettings005] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testGridSettings005] gridSpan: " + JSON.stringify(obj.$attrs.gridSpan));
      expect(obj.$attrs.gridSpan).assertEqual(1);
      done();
    });

    it('testGridSettings006', 0, async function (done) {
      console.info('[testGridSettings006] START');
      try {
        let eventData = {
          data: {
            "gridSpan": 2
          }
        }
        let indexEvent = {
          eventId: 47,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGridSettings006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testGridSettings006] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('gridSpan');
      console.info("[testGridSettings006] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testGridSettings006] gridSpan: " + JSON.stringify(obj.$attrs.gridSpan));
      expect(obj.$attrs.gridSpan).assertEqual(2);
      done();
    });
  });
}