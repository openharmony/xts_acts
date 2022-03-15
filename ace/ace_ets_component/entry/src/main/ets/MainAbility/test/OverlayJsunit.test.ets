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

export default function enableJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("overlay beforeEach start");
      let options = {
        uri: 'pages/overlay',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get overlay state pages: " + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get overlay state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push overlay page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push overlay page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("overlay after each called");
    });

    it('testOverlay01', 0, async function (done) {
      console.info('[testOverlay01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('overlay');
      let obj = JSON.parse(strJson);
      console.info("[testOverlay01] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.title).assertEqual("old title");
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.Bottom");
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('0.000000vp');
      expect(obj.$attrs.overlay.options.offset.y).assertEqual('-15.000000vp');
      console.info('[testOverlay01] END');
      done();
    });

    it('testOverlay02', 0, async function (done) {
      console.info('[testOverlay02] START');
      try {
        var eventData = {
          data: {
            "title": "new title",
            "align": "Alignment.TopStart",
            "x": 30,
            "y": -30
          }
        }
        var innerEvent = {
          eventId: 83,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testOverlay02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay02] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('overlay');
      let obj = JSON.parse(strJson);
      console.info("[testOverlay02] obj is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.title).assertEqual("new title");
      expect(obj.$attrs.overlay.options.align).assertEqual("Alignment.TopStart");
      expect(obj.$attrs.overlay.options.offset.x).assertEqual('30.000000vp');
      expect(obj.$attrs.overlay.options.offset.y).assertEqual('-30.000000vp');
      console.info('testOverlay02 END');
      done();
    });
  })
}
