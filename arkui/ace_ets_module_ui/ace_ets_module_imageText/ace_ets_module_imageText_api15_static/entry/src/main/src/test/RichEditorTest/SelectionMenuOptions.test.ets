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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton, Point, loadAndSetUpUiTest, Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SelectionMenuOptions() {
  describe('SelectionMenuOptions', () => {
    beforeAll(() => {
      console.info("ResourceDefaultTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SelectionMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/SelectionMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SelectionMenuOptions state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SelectionMenuOptions pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SelectionMenuOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectionMenuOptions page error:" + err);
      }
      console.info("SelectionMenuOptions beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SelectionMenuOptions after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         SelectionMenuOptions0001
    * @tc.desic        Test Text by mouseClick
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions_static_0001', Level.LEVEL1, async  (done: () => void): Promise<void> => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0001 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update')) as Component
        console.info('SelectionMenuOptions SelectionMenuOptions0001 START111');
        await CommonFunc.sleep(500);
        await update.click();
        console.info('SelectionMenuOptions SelectionMenuOptions0001 START2222');
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'))
        await CommonFunc.sleep(500);
        let point:Point = await (richEditor?.getBoundsCenter() as Promise<Point>)
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0001] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         SelectionMenuOptions0002
    * @tc.desic        Test Text by longClick
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0002 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'))
        await CommonFunc.sleep(500);
        await (richEditor?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0002] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0004
    * @tc.name         SelectionMenuOptions0004
    * @tc.desic        Test image text by mouseClick
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0004 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let image = await driver.findComponent(ON.id('image'))
        await CommonFunc.sleep(500);
        let point:Point = await (image?.getBoundsCenter() as Promise<Point>)
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0004] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0005
    * @tc.name         SelectionMenuOptions0005
    * @tc.desic        Test image text by longClick
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions_static_0005', Level.LEVEL1, async  (done: () => void): Promise<void> => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0005 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let image = await driver.findComponent(ON.id('image'))
        await CommonFunc.sleep(500);
        await (image?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0005] end");
        done();
    });


    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0007
    * @tc.name         SelectionMenuOptions0007
    * @tc.desic        Test mixed Text by mouseClick
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions_static_0007', Level.LEVEL1, async  (done: () => void): Promise<void> => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0007 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let mixed = await driver.findComponent(ON.id('mixed'))
        await CommonFunc.sleep(500);
        let point:Point = await (mixed?.getBoundsCenter() as Promise<Point>)
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0007] end");
        done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0008
    * @tc.name         SelectionMenuOptions0008
    * @tc.desic        Test mixed Text by longClick
	* @tc.size         MediumTest
	* @tc.type         Function
	* @tc.level        1
     */
    it('SelectionMenuOptions_static_0008', Level.LEVEL1, async  (done: () => void): Promise<void> => {
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0008 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let mixed = await driver.findComponent(ON.id('mixed'))
        await CommonFunc.sleep(500);
        await (mixed?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('自定义菜单'));
        console.info("[SelectionMenuOptions0008] end");
        done();
    });

  })
}