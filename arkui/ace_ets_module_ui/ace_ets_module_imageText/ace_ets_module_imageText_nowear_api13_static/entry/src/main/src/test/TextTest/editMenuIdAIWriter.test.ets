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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, loadAndSetUpUiTest, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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
const waitUiReadyMs = 1000;

export default function editMenuIdAIWriterTest() {
  describe('editMenuIdAIWriterTest', (): void => {
    beforeAll(() => {
      console.info("editMenuIdAIWriterTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("editMenuIdAIWriterTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/editMenuIdAIWriter",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get editMenuIdAIWriterTest state pages:" + "");
        if (!("editMenuIdAIWriter" == pages.name)) {
          console.info("get editMenuIdAIWriterTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push editMenuIdAIWriterTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editMenuIdAIWriterTest page error:" + err);
      }
      console.info("editMenuIdAIWriterTest beforeEach end");
    });
    
    /**
     * @tc.number    editMenuIdAIWriterTest_0100
     * @tc.name      editMenuIdAIWriterTest_0100
     * @tc.desc      Text: editMenuIdAIWriter
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('editMenuIdAIWriterTest_static_0100', Level.LEVEL0, async (done: () =>void) => {
      console.info('editMenuIdAIWriterTest_0100 START');
      let driver: Driver =  Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('TextAreaEditMenuOptions'));
      await (button?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let density = await driver.getDisplayDensity();
      await CommonFunc.sleep(1000);
      console.info("[editMenuIdAIWriterTest_0100] getDisplayDensity is: " + String(density));
      let strJson =  inspector.getInspectorByKey('flag')
      let obj = JSON.parseJsonElement(strJson);
      console.info("[editMenuIdAIWriterTest_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      if(obj.getElement('$attrs').getString('content') == 'true'){
        await driver.assertComponentExist(ON.text('小艺帮写'));
      }else{
        await driver.assertComponentExist(ON.text('全选'));
      }
      console.info('editMenuIdAIWriterTest_0100 END');
      done();
    });

    /**
     * @tc.number    editMenuIdAIWriterTest_0200
     * @tc.name      editMenuIdAIWriterTest_0200
     * @tc.desc      Text: editMenuIdAIWriter
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('editMenuIdAIWriterTest_static_0200', Level.LEVEL0, async (done: () =>void) => {
      console.info('editMenuIdAIWriterTest_0200 START');
      let driver: Driver =  Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('TextInputEditMenuOptions'));
      await (button?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let density = await driver.getDisplayDensity();
      await CommonFunc.sleep(1000);
      console.info("[editMenuIdAIWriterTest_0200] getDisplayDensity is: " + String(density));
      let strJson =  inspector.getInspectorByKey('flag')
      let obj = JSON.parseJsonElement(strJson);
      console.info("[editMenuIdAIWriterTest_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      if(obj.getElement('$attrs').getString('content') == 'true'){
        await driver.assertComponentExist(ON.text('小艺帮写'));
      }else{
        await driver.assertComponentExist(ON.text('全选'));
      }
      console.info('editMenuIdAIWriterTest_0200 END');
      done();
    });
  })
}