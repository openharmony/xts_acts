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
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function fontWeightJsunit() {
  describe('swipeDirectionTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/swipeDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swipeDirection state success " + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get swipeDirection state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push swipeDirection page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swipeDirection page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("swipeDirection after each called");
    });

    it('swipeDirectionText_0100', 0, async function (done) {
      console.info('swipeDirectionText_0100 START');
      let strJson = getInspectorByKey('swipeDirection');
      console.info("swipeDirectionText_0100 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("swipeDirectionText_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Flex');
      done();
    });

    it('swipeDirectionText_0200', 0, async function (done) {
      console.info('swipeDirectionText_0200 START');
      let strJson = getInspectorByKey('fontWeight');
      console.info("swipeDirectionText_0200 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("swipeDirectionText_0200 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual('All');
      done();
    });

    it('swipeDirectionText_0300', 0, async function (done) {
      console.info('swipeDirectionText_0300 START');
      try {
        let eventData = {
          data: {
            "direction": "None",
          }
        }
        let indexEvent = {
          eventId: 167,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swipeDirectionText_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("swipeDirectionText_0300 change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJsonNew = getInspectorByKey('swipeDirection');
      let objNew = JSON.parse(strJsonNew);
      console.info("swipeDirectionText_0300 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.direction).assertEqual('None');
      console.info('swipeDirectionText_0300 END');
      done();
    });
  })
}