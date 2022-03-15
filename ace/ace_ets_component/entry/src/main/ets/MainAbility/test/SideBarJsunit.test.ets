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
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function sidebarJsunit() {
  describe('appInfoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/sideBar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sideBar state success " + JSON.stringify(pages));
        if (!("sideBar" == pages.name)) {
          console.info("get sideBar success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push sideBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sideBar page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info("sideBar after each called");
    });

    it('testSideBar001', 0, async function (done) {
      console.info('[testSideBar001] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sidebar');
      console.info("[testSideBar001] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testSideBar001] width:" + obj.$attrs.width);
      expect(obj.$attrs.width).assertEqual('10.000000vp');
      done();
    });

    it('testSideBar002', 0, async function (done) {
      console.info('testSideBar002 START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "widthValue": '20',
          }
        }
        var innerEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testSideBar002 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testSideBar002 change component color error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sidebar');
      let  obj = JSON.parse(strJson);
      console.info("testSideBar002 component obj is: " + JSON.stringify(obj.$attrs.widthValue));
      expect(obj.$attrs.widthValue).assertEqual('20');
      done();
    });

    it('testSideBar003', 0, async function (done) {
      console.info('[testSideBar003] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sidebar');
      console.info("[testSideBar003] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testSideBar003] height:" + obj.$attrs.height);
      expect(obj.$attrs.height).assertEqual('10.000000vp');
      done();
    });

    it('testSideBar004', 0, async function (done) {
      console.info('[testSideBar004] START');
      try {
        let eventData = {
          data: {
            "heightValue":"30"
          }
        }
        let indexEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSideBar004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSideBar004] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('sidebar');
      console.info("[testSideBar004] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testSideBar004] height:" + obj.$attrs.height);
      expect(obj.$attrs.height).assertEqual('30');
      done();
    });

    it('testSidebar005', 0, async function (done) {
      console.info('[testSidebar005] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sidebar');
      console.info("[testSidebar005] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testSidebar005] icons:" + obj.$attrs.icons);
      expect(obj.$attrs.icons).assertEqual('10.000000vp');
      done();
    });

    it('testSidebar006', 0, async function (done) {
      console.info('[testSidebar006] START');
      await Utils.sleep(1000);
      let  iconsValue: object= {shown: string=20, hidden: string=30, switching:string=10 };
      try {
        var eventData = {
          data: {
            "iconsValue": JSON.stringify(iconsValue)
          }
        }
        var innerEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSidebar006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSidebar006] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('sidebar');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testSidebar006] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.icons.shown).assertEqual("20.000000");
      expect(objNew.$attrs.icons.hidden).assertEqual("30.000000");
      expect(objNew.$attrs.icons.switching).assertEqual("10.000000");
      done();
    });

    it('testSidebar007', 0, async function (done) {
      console.info('[testSidebar007] START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sidebar');
      console.info("[testSidebar007] component strJson:" + strJson);
      let obj = JSON.parse(strJson);
      console.info("[testSidebar007] controlButton:" + obj.$attrs.controlButton);
      expect(obj.$attrs.controlButton).assertEqual('10.000000vp');
      done();
    });

    it('testSidebar008', 0, async function (done) {
      console.info('[testSidebar008] START');
      await Utils.sleep(1000);
      try {
        var eventData = {
          data: {
            "controlButton": controlButton.top
          }
        }
        var innerEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSidebar008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSidebar008] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('sidebar');
      let objNew = JSON.parse(strJsonNew);
      console.info("[testSidebar008] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.controlButton).assertEqual("controlButton.top");
      done();
    });
  })
}