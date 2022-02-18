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

export default function listJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("list beforeEach start");
      let options = {
        uri: 'pages/list',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list state pages:" + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push list page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list page error:" + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("list after each called");
    });

    it('testList01', 0, async function (done) {
      console.info('[testList01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('list');
      let obj = JSON.parse(strJson);
      console.info("[testList01] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.listDirection).assertEqual('Axis.Vertical');
      expect(obj.$attrs.editMode).assertEqual('false');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.None');
      expect(obj.$attrs.chainAnimation).assertEqual('false');
      expect(obj.$attrs.divider.strokeWidth).assertEqual("2.000000vp");
      expect(obj.$attrs.divider.color).assertEqual("#FFFFFFFF");
      expect(obj.$attrs.divider.startMargin).assertEqual("20.000000vp");
      expect(obj.$attrs.divider.endMargin).assertEqual("20.000000vp");
      console.info('[testList01] END');
      done();
    });

    it('testList02', 0, async function (done) {
      console.info('[testList02] START');
      try {
        var eventData = {
          data: {
            "listDirection": Axis.Horizontal,
            "editMode": true,
            "edgeEffect": EdgeEffect.Spring,
            "chainAnimation": true
          }
        }
        var innerEvent = {
          eventId: 80,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testList02] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('list');
      let obj = JSON.parse(strJson);
      console.info("[testList02] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.listDirection).assertEqual('Axis.Horizontal');
      expect(obj.$attrs.editMode).assertEqual('true');
      expect(obj.$attrs.edgeEffect).assertEqual('EdgeEffect.Spring');
      expect(obj.$attrs.chainAnimation).assertEqual('true');
      console.info('testList02 END');
      done();
    });

    it('testList03', 0, async function (done) {
      console.info('[testList03] START');
      try {
        var eventData = {
          data: {
            "strokeWidth": "3.000000vp",
            "color": "#FF0000FF",
            "startMargin": "30.000000vp",
            "endMargin": "30.000000vp"
          }
        }
        var innerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testList03] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testList03] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('list');
      let obj = JSON.parse(strJson);
      console.info("[testList03] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.divider.strokeWidth).assertEqual("3.000000vp");
      expect(obj.$attrs.divider.color).assertEqual("#FF0000FF");
      expect(obj.$attrs.divider.startMargin).assertEqual("30.000000vp");
      expect(obj.$attrs.divider.endMargin).assertEqual("30.000000vp");
      console.info('testList03 END');
      done();
    });
  })
}
