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

export default function patternLockJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("patternLock beforeEach start");
      let options = {
        uri: 'pages/patternLock',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get patternLock state pages: " + JSON.stringify(pages));
        if (!("button" == pages.name)) {
          console.info("get patternLock state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push patternLock page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push patternLock page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("patternLock after each called");
    })

    it('testPatternLock01', 0, async function (done) {
      console.info('[testPatternLock01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('PatternLock');
      let obj = JSON.parse(strJson);
      console.info("[testPatternLock01] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('PatternLock');
      expect(obj.$attrs.sideLength).assertEqual('150');
      expect(obj.$attrs.circleRadius).assertEqual('7');
      expect(obj.$attrs.pathStrokeWidth).assertEqual('17');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF008000');
      expect(obj.$attrs.autoReset).assertEqual('true');
      done();
    });

    it('testPatternLock_02', 0, async function (done) {
      console.info('testPatternLock_02 START');
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("testPatternLock_02 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 70,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testPatternLock_02 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testPatternLock_02 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(1000);
      console.info('testPatternLock_02 END');
      done();
    });

    it('testPatternLock_03', 0, async function (done) {
      console.info('testPatternLock_03 START');
      let strJson1 = getInspectorByKey('PatternLock');
      let objLP = JSON.parse(strJson1);
      console.info("testPatternLock_03 component objLP is: " + objLP.$attrs.sideLength);
      await Utils.sleep(1000);
      try {
        let eventData = {
          data: {
            "backgroundColor": '#FFFFB6C1',
          }
        }
        var innerEvent = {
          eventId: 71,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testPatternLock_03 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testPatternLock_03 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('PatternLock');
      let obj = JSON.parse(strJson);
      console.info("testPatternLock_03 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.backgroundColor).assertEqual("#FFFFB6C1");
      console.info('testPatternLock_03 END');
      done();
    });

  })
}
