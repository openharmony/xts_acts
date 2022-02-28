// @ts-nocheck

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function motionPathJsunit() {
  describe('motionPathTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/motionPath',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get motionPath state success " + JSON.stringify(pages));
        if (!("motionPath" == pages.name)) {
          console.info("get motionPath state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push motionPath page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push motionPath page error " + JSON.stringify(result));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("motionPath after each called");
    });

    it('motionPathTest_0100', 0, async function (done) {
      console.info('motionPathTest_0100 START');
      let strJson = getInspectorByKey('motionPath');
      console.info("motionPathTest_0100 component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("motionPathTest_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Column');
      done();
    });

    it('motionPathTest_0200', 0, async function (done) {
      console.info('motionPathTest_0200 START');
      let callback = (indexEventOne) => {
        console.info("motionPathTest_0200 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data.fromX).assertEqual(0);
        expect(indexEventOne.data.toY).assertEqual(1);
      }
      let indexEventOne = {
        eventId: 3,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("motionPathTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("motionPathTest_0200 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(1000);
      console.info('motionPathTest_0200 END');
      done();
    });

    it('motionPathTest_0300', 0, async function (done) {
      console.info('motionPathTest_0300 START');
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("motionPathTest_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual(true);
      }
      let indexEvent = {
        eventId: 2,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("motionPathTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("motionPathTest_0300 click result is: " + JSON.stringify(sendEventByKey('button',10,"")));
      await Utils.sleep(1000);
      console.info('motionPathTest_0300 END');
      done();
    });
  })
}
