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
  describe('fontWeightTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/gestureMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureMode state success " + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get gestureMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push gestureMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureMode page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gestureMode after each called");
    });

      it('fillModeText_0100', 0, async function (done) {
        console.info('fillModeText_0100 START');
        let strJson = getInspectorByKey('gestureMode');
        console.info("fillModeText_0100 component strJson:" + strJson);
        let obj = JSON.parse(strJson);
        console.info("fillModeText_0100 component obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('PanGesture');
        done();
      });

    it('fillModeText_0200', 0, async function (done) {
      console.info('fillModeText_0200 START');
      let strJson = getInspectorByKey('PanGesture');
      console.info("fillModeText_0200 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("fillModeText_0200 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.mode).assertEqual('GestureMode.Sequence');
      done();
    });

    it('fillModeText_0300', 0, async function (done) {
      console.info('fillModeText_0300 START');
      try {
        let eventData = {
          data: {
            "mode": "GestureMode.Exclusive",
          }
        }
        let indexEvent = {
          eventId: 47,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("fillModeText_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("fillModeText_0300 change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJsonNew = getInspectorByKey('PanGesture');
      let objNew = JSON.parse(strJsonNew);
      console.info("fillModeText_0300 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.mode).assertEqual('GestureMode.Exclusive');
      console.info('fillModeText_0300 END');
      done();
    });
  })
}