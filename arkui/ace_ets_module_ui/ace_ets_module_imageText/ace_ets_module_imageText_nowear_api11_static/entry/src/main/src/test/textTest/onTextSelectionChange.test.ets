/*
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

import router from '@ohos.router';
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton, loadAndSetUpUiTest } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
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
export default function OnTextSelectionChangeTest() {
  describe('OnTextSelectionChangeTest', () : void=> {
    beforeAll(() => {
      console.info("OnTextSelectionChangeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OnTextSelectionChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/onTextSelectionChange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnTextSelectionChangeTest state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get OnTextSelectionChangeTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OnTextSelectionChangeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnTextSelectionChangeTest page error:" + err);
      }
      console.info("OnTextSelectionChangeTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnTextSelectionChangeTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_UI_COMPONENT_TEXT_ONTEXTSELECTIONCHANGE_0010
    * @tc.name         OnTextSelectionChangeTest_0010
    * @tc.desc         test Text OnTextSelectionChange: Mouse box selection
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('OnTextSelectionChangeTest_static_0010', Level.LEVEL2, async (done: ()=> void) => {
      console.info('[OnTextSelectionChangeTest_0010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
      let clickX1 = Math.round(textRect.left + 2)
      let clickX2 = Math.round(textRect.right - 2)
      let clickX3 = Math.round(textRect.right + 10)
      let clickY = Math.round((textRect.bottom + textRect.top)/2)
      await driver.mouseDrag({ x: clickX1, y: clickY },{ x: clickX2, y: clickY }, 600);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0010] get1: ' + AppStorage.get('OnTextSelectionChange', Type.from<string>()));
      expect(AppStorage.get('OnTextSelectionChange', Type.from<string>())).assertEqual('start:0,end:11');
      await driver.mouseClick({ x: clickX3, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0010] get2: ' + AppStorage.get('OnTextSelectionChange', Type.from<string>()));
      expect(AppStorage.get('OnTextSelectionChange', Type.from<string>())).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0010] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_UI_COMPONENT_TEXT_ONTEXTSELECTIONCHANGE_0020
    * @tc.name         OnTextSelectionChangeTest_0020
    * @tc.desc         test Text OnTextSelectionChange: Press shift and arrow keys to select
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('OnTextSelectionChangeTest_static_0020', Level.LEVEL2, async (done: ()=> void) => {
      console.info('[OnTextSelectionChangeTest_0020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      // 点击tab键(2049),Text控件获焦
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      // 点击shift键(2047)+向右方向键(2015)
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await CommonFunc.sleep(500);
      console.info('[OnTextSelectionChangeTest_0020] get1: ' + AppStorage.get('OnTextSelectionChange', Type.from<string>()));
      expect(AppStorage.get('OnTextSelectionChange', Type.from<string>())).assertEqual('start:3,end:11');
      let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
      let clickX = Math.round((textRect.left + textRect.right)/2)
      let clickY = Math.round(textRect.bottom - 10)
      // 鼠标左键点击文本外，文本取消选中
      await driver.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0020] get2: ' + AppStorage.get('OnTextSelectionChange', Type.from<string>()));
      expect(AppStorage.get('OnTextSelectionChange', Type.from<string>())).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0020] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_UI_COMPONENT_TEXT_ONTEXTSELECTIONCHANGE_0030
    * @tc.name         OnTextSelectionChangeTest_0030
    * @tc.desc         test Text OnTextSelectionChange: Shortcut key shift and mouse selection
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('OnTextSelectionChangeTest_static_0030', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[OnTextSelectionChangeTest_0030] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      console.info('[OnTextSelectionChangeTest_0030] get1: ' + AppStorage.get('OnTextSelectionChange', Type.from<string>()));
      expect(AppStorage.get('OnTextSelectionChange', Type.from<string>())).assertEqual('start:3,end:8');
      let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
      let clickX = Math.round(textRect.right + 10)
      let clickY = Math.round((textRect.bottom + textRect.top)/2)
      await driver.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('[OnTextSelectionChangeTest_0030] get2: ' +
      AppStorage.get('OnTextSelectionChange', Type.from<string>()));
      expect(AppStorage.get('OnTextSelectionChange', Type.from<string>())).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0030] END");
      done();
    });
  })
}