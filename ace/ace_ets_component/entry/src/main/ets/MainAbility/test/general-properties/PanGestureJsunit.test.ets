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
import Utils from '../Utils';

export default function PanGestureJsunit() {
  describe('appInfoTest', function () {
    var x_value;
    var y_value;

    beforeEach(async function (done) {
      console.info("PanGesture beforeEach start");
      let options = {
        uri: 'pages/general-properties/PanGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGesture state pages:" + JSON.stringify(pages));
        if (!("PanGesture" == pages.name)) {
          console.info("get PanGesture state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push PanGesture page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGesture page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("PanGesture after each called");
    });

    it('testPanGesture01', 0, async function (done) {
      console.info('[testPanGesture01] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('PanGesture');
      let obj = JSON.parse(strJson);
      console.info("[testPanGesture01] obj is: " + JSON.stringify(obj));
      console.info('[testPanGesture01] END');
      done();
    });

    it('testPanGesture02', 0, async function (done) {
      console.info('[testPanGesture02] START');
      try {
        var eventData = {
          data: {
            "touchable": true,
          }
        }
        var innerEvent = {
          eventId: 140,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPanGesture02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testPanGesture02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      console.info('[testPanGesture02] END');
      done();
    });

    it('testPanGesture03', 0, async function (done) {
      let rect = await Utils.getComponentRect('PanGesture')
      console.info("[testPanGesture03] rectInfo is " + JSON.stringify(rect));
      x_value = rect.left + (rect.right - rect.left) / 10
      y_value = rect.top + (rect.bottom - rect.top) / 10
      console.info("[testPanGesture03] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Move,
      }
      var callbackTwo = (eventData) => {
        console.info("[testPanGesture03] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data.ACTION).assertEqual(true)
        expect(eventData.data.EVENT_TYPE).assertEqual('Move')
      }
      var innerEventTwo = {
        eventId: 85,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventTwo, callbackTwo)
      } catch (err) {
        console.info("[testPanGesture03] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testPanGesture03] testSendTouchEvent ' + sendTouchEvent(point));
      await Utils.sleep(1000)
      console.info('[testPanGesture03] END');
      done();
    });

  })
}
