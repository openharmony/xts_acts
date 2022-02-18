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
// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';

export default function rotationGestureJsUnit() {
  describe('rotationGestureTest', function () {
    var x_value;
    var y_value;
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/general-properties/rotationGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rotationGesture state success " + JSON.stringify(pages));
        if (!("rotationGesture" == pages.name)) {
          console.info("get rotationGesture state name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push rotationGesture page result " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rotationGesture page error " + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("rotationGesture after each called");
    });

    it('rotationGestureTest_0100', 0, async function (done) {
      console.info('rotationGestureTest_0100 START');
      let strJson = getInspectorByKey('gesture');
      console.info("rotationGestureTest_0100 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("rotationGestureTest_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Flex');
      console.info('rotationGestureTest_0100 END');
      done();
    });

    it('rotationGestureTest_0200', 0, async function (done) {
      console.info('rotationGestureTest_0200 START');
      let rect = await Utils.getComponentRect('gesture')
      console.info("rotationGestureTest_0200 rectInfo is " + JSON.stringify(rect));
      x_value = rect.left + (rect.right - rect.left) / 20
      y_value = rect.top + (rect.bottom - rect.top) / 20
      console.info("rotationGestureTest_0200 onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 2,
        x: x_value,
        y: y_value,
        type: TouchType.Down,
      }
      await Utils.sleep(1000)
      var callback = (eventData) => {
        console.info("rotationGestureTest_0200 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data.ACTION).assertEqual(true)
        expect(eventData.data.EVENT_TYPE).assertEqual('Down')
      }
      var innerEvent = {
        eventId: 56,
        priority: events_emitter.EventPriority.LOW
      }

      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("rotationGestureTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('rotationGestureTest_0200 testSendTouchEvent ' + sendTouchEvent(point));
      await Utils.sleep(1000)
      console.info('rotationGestureTest_0200 END');
      done();
    });
  })
}