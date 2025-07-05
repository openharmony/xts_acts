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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import { Driver, ON, loadAndSetUpUiTest, MouseButton, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

export default function HapticFeedbackModeTest() {
  describe('HapticFeedbackModeTest', () => {
    beforeAll(() => {
      console.info("HapticFeedbackModeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageSpanVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/HapticFeedbackMode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageSpanVisibility state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ImageSpanVisibility pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageSpanVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageSpanVisibility page error:" + err);
      }
      console.info("ImageSpanVisibility beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("HapticFeedbackModeTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         HapticFeedbackModeTest_static_0001
    * @tc.desic        Test HapticFeedbackMode: ENABLED
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        0
    */
    it('HapticFeedbackModeTest_static_0001', Level.LEVEL0, async (done: () => void) => {
        let driver = Driver.create();
        console.info('[HapticFeedbackModeTest0001] START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update_Button'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('HapticFeedbackMode.ENABLED'))
        await CommonFunc.sleep(500);
        let point = await (richEditor?.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(500);
        await (driver?.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT) as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0001] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         HapticFeedbackModeTest_static_0002
    * @tc.desic        Test HapticFeedbackMode: DISABLED
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        0
    */
    it('HapticFeedbackModeTest_static_0002', Level.LEVEL0, async (done: () => void) => {
        let driver = Driver.create();
        console.info('HapticFeedbackModeTest HapticFeedbackModeTest0002 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update_Button'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('HapticFeedbackMode.DISABLED'))
        await CommonFunc.sleep(500);
        await (richEditor?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0002] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         HapticFeedbackModeTest_static_0003
    * @tc.desic        Test HapticFeedbackMode: AUTO
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        0
    */
    it('HapticFeedbackModeTest_static_0003', Level.LEVEL0, async (done: () => void) => {
        let driver = Driver.create();
        console.info('[HapticFeedbackModeTest0003] START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update_Button'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let image = await driver.findComponent(ON.id('HapticFeedbackMode.AUTO'))
        await CommonFunc.sleep(500);
        let point = await (image?.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(500);
        await (driver?.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT) as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0003] end");
        done();
    });
  })
}