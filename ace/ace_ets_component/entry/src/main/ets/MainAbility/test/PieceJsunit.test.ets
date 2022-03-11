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

export default function pieceJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/PieceCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PieceCode state success " + JSON.stringify(pages));
        if (!("PieceCode" == pages.name)) {
          console.info("get PieceCode pages success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push PieceCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PieceCode page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info("PieceCode after each called");
    });

    it('test_pieceCode_001', 0, async function (done) {
      console.info('[test_pieceCode_001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('piece');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('piece');
      expect(obj.$attrs.iconPosition).assertEqual('1');
      expect(obj.$attrs.fontColor).assertEqual('#FF008000');
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.showDelete).assertEqual('false');
      console.info("[test_pieceCode_001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(1000);
      done();
    });

    it('test_pieceCode_002', 0, async function (done) {
      console.info('[test_pieceCode_002] START');
      try {
        let obj = {
          content: 'piece test',
          icon: '2',
        }
        let eventData = {
          data: {
            "pieceObj": JSON.stringify(obj)
          }
        }
        var innerEvent = {
          eventId: 82,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_pieceCode_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_pieceCode_002] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('piece');
      let obj = JSON.parse(strJsonNew);
      console.info("test_pieceCode_002 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("piece test");
      expect(obj.$attrs.icon).assertEqual("2");
      console.info('test_pieceCode_002 END');
      done();
    });

    it('test_pieceCode_03', 0, async function (done) {
      console.info('test_pieceCode_03 START');
      let strJson1 = getInspectorByKey('piece');
      let objLP = JSON.parse(strJson1);
      console.info("testPatternLock_03 component objLP is: " + objLP.$attrs.sideLength);
      await Utils.sleep(1000);
      try {
        let eventData = {
          data: {
            "iconPosition": IconPosition.Start,
          }
        }
        var innerEvent = {
          eventId: 82,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("test_pieceCode_03 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("test_pieceCode_03 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('piece');
      let obj = JSON.parse(strJson);
      console.info("test_pieceCode_03 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.iconPosition).assertEqual("IconPosition.Start");
      console.info('test_pieceCode_03 END');
      done();
    });

    it('test_pieceCode_04', 0, async function (done) {
      console.info('test_pieceCode_04 START');
      let strJson1 = getInspectorByKey('piece');
      let objLP = JSON.parse(strJson1);
      console.info("test_pieceCode_04 component objLP is: " + objLP.$attrs.sideLength);
      await Utils.sleep(1000);
      try {
        let eventData = {
          data: {
            "Color": '#FFFFB6C1',
          }
        }
        var innerEvent = {
          eventId: 82,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("test_pieceCode_04 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("test_pieceCode_04 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('piece');
      let obj = JSON.parse(strJson);
      console.info("test_pieceCode_04 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontColor).assertEqual("#FFFFB6C1");
      console.info('test_pieceCode_04 END');
      done();
    });

    it('test_pieceCode_05', 0, async function (done) {
      console.info('test_pieceCode_05 START');
      let strJson1 = getInspectorByKey('piece');
      let objLP = JSON.parse(strJson1);
      console.info("test_pieceCode_05 component objLP is: " + objLP.$attrs.sideLength);
      await Utils.sleep(1000);
      try {
        let eventData = {
          data: {
            "fontStyle": FontStyle.Normal,
          }
        }
        var innerEvent = {
          eventId: 82,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("test_pieceCode_05 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("test_pieceCode_05 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('piece');
      let obj = JSON.parse(strJson);
      console.info("test_pieceCode_05 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.fontStyle).assertEqual("FontStyle.Normal");
      console.info('test_pieceCode_05 END');
      done();
    });

    it('test_pieceCode_06', 0, async function (done) {
      console.info('test_pieceCode_06 START');
      let strJson1 = getInspectorByKey('piece');
      let objLP = JSON.parse(strJson1);
      console.info("test_pieceCode_06 component objLP is: " + objLP.$attrs.sideLength);
      await Utils.sleep(1000);
      try {
        let eventData = {
          data: {
            "showDelete": true,
          }
        }
        var innerEvent = {
          eventId: 82,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("test_pieceCode_06 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("test_pieceCode_06 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('piece');
      let obj = JSON.parse(strJson);
      console.info("test_pieceCode_06 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.showDelete).assertEqual("true");
      console.info('test_pieceCode_06 END');
      done();
    });

    it('test_pieceCode_07', 0, async function (done) {
      console.info('test_pieceCode_07 START');
      await Utils.sleep(1500);
      let callback = (indexEvent) => {
        console.info("test_pieceCode_07 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.showDelete).assertEqual(true);
      }
      let indexEvent = {
        eventId: 80,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("test_pieceCode_07 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("test_pieceCode_07 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(1000);
      var callback1 = (eventData) => {
        console.info("test_pieceCode_07 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data.ACTION).assertEqual(true);
      }
      var innerEventOne = {
        eventId: 81,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("test_pieceCode_07 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('test_pieceCode_07 END');
      done();
    });

  })
}