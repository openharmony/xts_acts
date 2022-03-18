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

export default function animateJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      console.info("animate beforeEach start");
      let options = {
        uri: 'pages/animate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animate state pages:" + JSON.stringify(pages));
        if (!("animate" == pages.name)) {
          console.info("get animate state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push animate page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animate page error:" + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("animate after each called");
    });

    it('animateTest_0100', 0, async function (done) {
      console.info('animateTest_0100 START');
      await Utils.sleep(1500);
      let indexEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0100 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.duration).assertEqual('100')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0100 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0100 END');
      done();
    });

    it('animateTest_0200', 0, async function (done) {
      console.info('animateTest_0200 START');
      await Utils.sleep(1500);
      let indexEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0500 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.curve).assertEqual('Ease')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0200 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0200 END');
      done();
    });

    it('animateTest_0300', 0, async function (done) {
      console.info('animateTest_0300 START');
      await Utils.sleep(1500);
      let indexEvent = {
        eventId: 53,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0500 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.iteration).assertEqual('1')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0300 click result is: " + JSON.stringify(sendEventByKey('button3',10,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0300 END');
      done();
    });

    it('animateTest_0400', 0, async function (done) {
      console.info('animateTest_0400 START');
      await Utils.sleep(1500);
      let indexEvent = {
        eventId: 54,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0400 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.tempo).assertEqual(1000)
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0400 click result is: " + JSON.stringify(sendEventByKey('button4',10,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0400 END');
      done();
    });

    it('animateTest_0500', 0, async function (done) {
      console.info('animateTest_0500 START');
      await Utils.sleep(1500);
      let indexEvent = {
        eventId: 55,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0500 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.playmode).assertEqual('normal')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0500 click result is: " + JSON.stringify(sendEventByKey('button5',10,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0500 END');
      done();
    });

    it('animateTest_0600', 0, async function (done) {
      console.info('animateTest_0500 START');
      try {
        let eventData = {
          data: {
            "duration":'2000'
          }
        }
        let indexEventOne = {
          eventId: 50,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("animateTest_0600 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("animateTest_0600 change component data error: " + err.message);
      }
      let indexEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0600 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.duration).assertEqual('2000')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0600 click result is: " + JSON.stringify(sendEventByKey('button1',10 ,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0600 END');
      done();
    });

    it('animateTest_0700', 0, async function (done) {
      console.info('animateTest_0700 START');
      try {
        let eventData = {
          data: {
            "curve": "Linear"
          }
        }
        let indexEventOne = {
          eventId: 50,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("animateTest_0700 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("animateTest_0700 change component data error: " + err.message);
      }
      let indexEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0700 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.curve).assertEqual('Linear')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0700 click result is: " + JSON.stringify(sendEventByKey('button2',10 ,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0700 END');
      done();
    });

    it('animateTest_0800', 0, async function (done) {
      console.info('animateTest_0800 START');
      try {
        let eventData = {
          data: {
            "iteration":"2"
          }
        }
        let indexEventOne = {
          eventId: 50,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("animateTest_0800 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("animateTest_0800 change component data error: " + err.message);
      }
      let indexEvent = {
        eventId: 53,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0800 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.iteration).assertEqual('2')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0800 click result is: " + JSON.stringify(sendEventByKey('button3',10 ,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0800 END');
      done();
    });

    it('animateTest_0900', 0, async function (done) {
      console.info('animateTest_0900 START');
      try {
        let eventData = {
          data: {
            "tempo": "20000"
          }
        }
        let indexEventOne = {
          eventId: 50,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("animateTest_0900 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("animateTest_0900 change component data error: " + err.message);
      }
      let indexEvent = {
        eventId: 54,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_0900 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.tempo).assertEqual('20000')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0900 click result is: " + JSON.stringify(sendEventByKey('button4',10 ,"")));
      await Utils.sleep(2000);
      console.info('animateTest_0900 END');
      done();
    });

    it('animateTest_1000', 0, async function (done) {
      console.info('animateTest_1000 START');
      try {
        let eventData = {
          data: {
            "playmode":"PlayMode.Alternate"
          }
        }
        let indexEventOne = {
          eventId: 50,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("animateTest_1000 start to publish emit");
        events_emitter.emit(indexEventOne, eventData);
      } catch (err) {
        console.log("animateTest_1000 change component data error: " + err.message);
      }
      let indexEvent = {
        eventId: 55,
        priority: events_emitter.EventPriority.LOW
      }
      let callback= (indexEvent) => {
        console.info("animateTest_1000 get state result is: " + JSON.stringify(indexEvent))
        except(indexEvent.data.playmode).assertEqual('alternate')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1000 click result is: " + JSON.stringify(sendEventByKey('button5',10 ,"")));
      await Utils.sleep(2000);
      console.info('animateTest_1000 END');
      done();
    });
  })
}
