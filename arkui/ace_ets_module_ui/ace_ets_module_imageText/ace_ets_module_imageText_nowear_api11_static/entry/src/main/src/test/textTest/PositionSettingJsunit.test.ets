/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Alignment,
  Direction
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
class Data1 {
  x: number | string = 0;
  y: number | string = 0;
}
export default function positionSettingJsunit() {
  describe('borderTest_five_3', () : void=> {
    beforeAll(() => {
      console.info("positionSettingJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("positionSettingJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/positionSetting",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get positionSettingJsunit state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get positionSettingJsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push positionSettingJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push positionSettingJsunit page error:" + err);
      }
      console.info("positionSettingJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("positionSettingJsunit after each called");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("positionSetting after each called");
    });

    it('testPositionSetting001_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textAlign');
      console.info("[testPositionSetting001] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting001] textAlign: " + obj.getElement('$attrs').getString('textAlign') + "_" + obj.getElement('$attrs').getString('align'));
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('[testPositionSetting001] END');
      done();
    });

    it('testPositionSetting002_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('rowDirection');
      console.info("[testPositionSetting002] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting002] rowDirection: " + obj.getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      console.info('[testPositionSetting002] END');
      done();
    });

    it('testPositionSetting003_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": Alignment.BottomEnd
          } as Record<string,Object>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting003] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err:Error) {
        console.log("[testPositionSetting003] change component data error: " + err.message );
      }
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('textAlign');
      console.info("[testPositionSetting003] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting003] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
      console.info('[testPositionSetting003] END');
      done();
    });

    it('testPositionSetting004_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction": Direction.Ltr
          } as Record<string,Object>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 26,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err : Error) {
        console.log("[testPositionSetting004] change component data error: " + err?.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('rowDirection');
      console.info("[testPositionSetting004] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting004] rowDirection: " + obj.getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
      console.info('[testPositionSetting004] END');
      done();
    });

    it('testPositionSetting005_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting005] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('position1');
      console.info("[testPositionSetting005] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting005] position: " + JSON.stringify(obj.getElement('$attrs').getElement('position')));
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('25.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('15.00vp');
      let strJson1 = inspector.getInspectorByKey('position2');
      console.info("[testPositionSetting005] component strJson1:" + strJson1);
      let obj1 = JSON.parseJsonElement(strJson1)
      console.info("[testPositionSetting005] position1: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('position')));
      expect(obj1.getElement('$attrs').getElement('position').getString('x')).assertEqual('50.00%');
      expect(obj1.getElement('$attrs').getElement('position').getString('y')).assertEqual('70.00%');
      console.info('[testPositionSetting005] END');
      done();
    });

    it('testPositionSetting006_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting006] START');
      await CommonFunc.sleep(1000);
      try {
        let data: Data1 = {
          x: 10, y: 25
        };
        let data2: Data1 = {
          x: '30%', y: '50%'
        };
        let eventData: events_emitter.EventData = {
          data: {
            "position1": JSON.stringify(data),
            "position2": JSON.stringify(data2)
          }as Record<string,Object>
        } as events_emitter.EventData

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 27,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err:Error) {
        console.log("[testPositionSetting006] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('position1');
      console.info("[testPositionSetting006] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)

      console.info("[testPositionSetting006] position1: " + JSON.stringify(obj.getElement('$attrs').getElement('position')));
      expect(obj.getElement('$attrs').getElement('position').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('position').getString('y')).assertEqual('25.00vp');
      let strJson2 = inspector.getInspectorByKey('position2');
      console.info("[testPositionSetting006] component strJson2:" + strJson2);
      let obj1= JSON.parseJsonElement(strJson2) ;

      console.info("[testPositionSetting006] position2: " + JSON.stringify(obj.getElement('$attrs').getElement('position')));
      expect(obj1.getElement('$attrs').getElement('position').getString('x')).assertEqual('30.00%');
      expect(obj1.getElement('$attrs').getElement('position').getString('y')).assertEqual('50.00%');
      done();
    });

    it('testPositionSetting007_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting007] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('markAnchor');
      console.info("[testPositionSetting007] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting007] position: " + JSON.stringify(obj.getElement('$attrs').getElement('markAnchor')));
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('25.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('25.00vp');
      console.info('[testPositionSetting007] END');
      done();
    });

    it('testPositionSetting008_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting008] START');
      await CommonFunc.sleep(1000);
      try {
        let data: Data1 = {
          x: 0, y: 0
        };
        let eventData: events_emitter.EventData = {
          data: {
            "markAnchor": JSON.stringify(data),
          }as Record<string,Object>
        } as events_emitter.EventData

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 28,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting008] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err :Error) {
        console.log("[testPositionSetting008] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('markAnchor');
      console.info("[testPositionSetting008] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting008] markAnchor: " + JSON.stringify(obj.getElement('$attrs').getElement('markAnchor')));
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual('0.00vp');
      console.info('[testPositionSetting008] END');
      done();
    });

    it('testPositionSetting009_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting009] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('offset');
      console.info("[testPositionSetting009] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting009] offset: " + JSON.stringify(obj.getElement('$attrs').getElement('offset')));
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('15.00vp');
      console.info('[testPositionSetting009] END');
      done();
    });

    it('testPositionSetting010_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting010] START');
      await CommonFunc.sleep(1000);
      try {
        let data: Data1 = {
          x: 150, y: 10
        };
        let eventData: events_emitter.EventData = {
          data: {
            "offset": JSON.stringify(data),
          }as Record<string,Object>
        } as events_emitter.EventData

        let indexEvent: events_emitter.InnerEvent = {
          eventId: 29,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting010] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err :Error) {
        console.log("[testPositionSetting010] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('offset');
      console.info("[testPositionSetting010] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting010] offset: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('offset')));
      expect(obj.getElement('$attrs').getElement('offset').getString('x')).assertEqual('150.00vp');
      expect(obj.getElement('$attrs').getElement('offset').getString('y')).assertEqual('10.00vp');
      console.info('[testPositionSetting010] END');
      done();
    });

    it('testPositionSetting011_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting011] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('opacity');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[testPositionSetting011] component JSON.parse(strJson) is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getInteger('opacity')).assertEqual(1);
      console.info('[testPositionSetting011] END');
      done();
    });

    it('testPositionSetting012_static', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testPositionSetting012] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "opacityValue": "0.7"
          }as Record<string,Object>
        } as events_emitter.EventData

        let innerEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting012] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err :Error) {
        console.log("[testPositionSetting012] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('opacity');
      let obj = JSON.parseJsonElement(strJsonNew)

      console.info("[testPositionSetting012] component objNew is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(0.7);
      console.info('[testPositionSetting012] END');
      done();
    });
  })
}