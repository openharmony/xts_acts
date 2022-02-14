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
import Utils from './Utils';
import events_emitter from '@ohos.emitter';

export default function swiperJsunit() {
  describe('swiperTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/swiper',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("stepper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper page error " + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("swiper after each called");
    });

    it('swiperTest_0100', 0, async function (done) {
      console.info('swiperTest_0100 START');
      let strJson = getInspectorByKey('swiper');
      console.info("swiperTest_0100 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("swiperTest_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Swiper');
      expect(obj.$attrs.index).assertEqual('1');
      expect(obj.$attrs.autoPlay).assertEqual('true');
      expect(obj.$attrs.interval).assertEqual('4000');
      expect(obj.$attrs.indicator).assertEqual('true');
      expect(obj.$attrs.loop).assertEqual('false');
      expect(obj.$attrs.duration).assertEqual('1000.000000');
      expect(obj.$attrs.vertical).assertEqual('false');
      expect(obj.$attrs.itemSpace).assertEqual('0.000000vp');
      expect(obj.$attrs.disableSwipe).assertEqual('false');
      console.info('swiperTest_0100 END');
      done();
    });

    it('swiperTest_0200', 0, async function (done) {
      console.info('swiperTest_0200 START');
      try {
        let eventData = {
          data: {
            "index": "3",
            "autoPlay": "false",
            "interval": "3000",
            "indicator": "false",
            "duration": "500",
            "itemSpace": "1",
          }
        }
        let indexEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("swiperTest_0200 change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');
      let objNew = JSON.parse(strJsonNew);
      console.info("swiperTest_0200 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.index).assertEqual('3');
      expect(objNew.$attrs.autoPlay).assertEqual('false');
      expect(objNew.$attrs.interval).assertEqual('3000');
      expect(objNew.$attrs.indicator).assertEqual('false');
      expect(objNew.$attrs.duration).assertEqual('500.000000');
      expect(objNew.$attrs.itemSpace).assertEqual('1.000000vp');
      console.info('swiperTest_0200 END');
      done();
    });

    it('swiperTest_0300', 0, async function (done) {
      console.info('swiperTest_0300 START');
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("swiperTest_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 18,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("swiperTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_0300 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(1000);
      console.info('swiperTest_0300 END');
      done();
    });

    it('swiperTest_0400', 0, async function (done) {
      console.info('swiperTest_0400 START');
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("swiperTest_0400 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 19,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("swiperTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_0400 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await Utils.sleep(1000);
      console.info('swiperTest_0400 END');
      done();
    });

    it('swiperTest_0500', 0, async function (done) {
      console.info('swiperTest_0500 START');
      await Utils.sleep(1500);
      let callbackOne = (indexEventOne) => {
        console.info("swiperTest_0500 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data.ACTION).assertEqual(true);
      }
      let indexEventOne = {
        eventId: 19,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("swiperTest_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_0500 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("swiperTest_0500 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 20,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("swiperTest_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('swiperTest_0500 END');
      done();
    });

    it('swiperTest_0600', 0, async function (done) {
      console.info('swiperTest_0600 START');
      try {
        let eventData = {
          data: {
            "loop": true,
            "vertical": true,
          }
        }
        let indexEvent = {
          eventId: 55,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_0600 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("swiperTest_0600 change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJsonNew = getInspectorByKey('swiper');
      let objNew = JSON.parse(strJsonNew);
      console.info("swiperTest_0600 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.loop).assertEqual('true');
      expect(objNew.$attrs.vertical).assertEqual('true');
      console.info('swiperTest_0600 END');
      done();
    });
  })
}