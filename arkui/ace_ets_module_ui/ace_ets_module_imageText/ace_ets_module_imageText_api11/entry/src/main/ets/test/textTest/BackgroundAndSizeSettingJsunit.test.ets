/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function backgroundAndSizeSettingJsunit() {
  describe('backgroundAndSizeSettingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("backgroundAndSizeSetting beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/backgroundAndSizeSetting',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundAndSizeSetting state success " + JSON.stringify(pages));
        if (!("backgroundAndSizeSetting" == pages.name)) {
          console.info("get backgroundAndSizeSetting state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundAndSizeSetting page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundAndSizeSetting page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("backgroundAndSizeSetting after each called");
    });

    it('testBackgroundAndSizeSetting_0100', Level.LEVEL1, async (done: Function) => {
      console.info('testBackgroundAndSizeSetting_0100 START');
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('fontColor');
      console.info("testBackgroundAndSizeSetting_0100 component strJson:" + strJson);
      console.info("testBackgroundAndSizeSetting_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFFF0000");
      console.info('testBackgroundAndSizeSetting_0100 END');
      done();
    });

    it('testBackgroundAndSizeSetting_0200', Level.LEVEL1, async (done: Function) => {
      console.info('testBackgroundAndSizeSetting_0200 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": '0xFF0000'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testBackgroundAndSizeSetting_0200 start pages");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testBackgroundAndSizeSetting_0200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('backgroundColor');
      console.info("testBackgroundAndSizeSetting_0200 component strJson:" + strJson);
      console.info("testBackgroundAndSizeSetting_0200 rowDirection: " + JSON.parse(strJson).$attrs.direction);
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FFEEEE00");
      done();
    });

    it('testBackgroundAndSizeSetting_0300', Level.LEVEL1, async (done: Function) => {
      console.info('testBackgroundAndSizeSetting_0300 START');
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('backgroundColor');
      console.info("testBackgroundAndSizeSetting_0300 component strJson:" + strJson);
      console.info("testBackgroundAndSizeSetting_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.borderWidth).assertEqual("1.00vp");
      console.info('testBackgroundAndSizeSetting_0300 END');
      done();
    });

    it('testBackgroundAndSizeSetting_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[testBackgroundAndSizeSetting_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('centerRow');
      console.info("[testBackgroundAndSizeSetting_0400] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('80.00vp');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('80.00vp');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual('20.00vp');
      expect(JSON.parse(strJson).$attrs.margin).assertEqual('20.00vp');
      console.info('[testBackgroundAndSizeSetting_0400] END');
      done();
    });

    it('testBackgroundAndSizeSetting_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[testBackgroundAndSizeSetting_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('innerRow');
      console.info("[testBackgroundAndSizeSetting_0500] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('100.00%');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('100.00%');
      console.info('[testBackgroundAndSizeSetting_0500] END');
      done();
    });

    it('testBackgroundAndSizeSetting_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[testBackgroundAndSizeSetting_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '200',
            "height": '200',
            "padding": '10',
            "margin": '40'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 34,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBackgroundAndSizeSetting_0600] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testBackgroundAndSizeSetting_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('centerRow');
      console.info("[testBackgroundAndSizeSetting_0600] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('200.00vp');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('200.00vp');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual('10.00vp');
      expect(JSON.parse(strJson).$attrs.margin).assertEqual('40.00vp');
      console.info('[testBackgroundAndSizeSetting_0600] END');
      done();
    });

    it('testBackgroundAndSizeSetting_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[testBackgroundAndSizeSetting_0700] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '80%',
            "height": '80%'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 35,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBackgroundAndSizeSetting_0700] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testBackgroundAndSizeSetting_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('innerRow');
      console.info("[testBackgroundAndSizeSetting_0700] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('80.00%');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('80.00%');
      console.info('[testBackgroundAndSizeSetting_0700] END');
      done();
    });

    it('testBackgroundAndSizeSetting_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[testBackgroundAndSizeSetting_0800] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('layoutWeight1');
      console.info("[testBackgroundAndSizeSetting_0800] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.layoutWeight).assertEqual(1);
      console.info('[testBackgroundAndSizeSetting_0800] END');
      done();
    });

    it('testBackgroundAndSizeSetting_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[testBackgroundAndSizeSetting_0900] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "weight": '3'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 36,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBackgroundAndSizeSetting_0900] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testBackgroundAndSizeSetting_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('layoutWeight1');
      console.info("[testBackgroundAndSizeSetting_0900] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.layoutWeight).assertEqual(3);
      console.info('[testBackgroundAndSizeSetting_0900] END');
      done();
    });
  })
}
