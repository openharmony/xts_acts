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
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import {Component, Driver, loadAndSetUpUiTest, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function richEditorApi1() {
  describe('richEditorApi1', () => {
    beforeAll(() => {
      console.info("richEditorApi1 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richEditorApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/richEditorApi/richEditorApi1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get richEditorApi1 state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get richEditorApi1 pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richEditorApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi1 page error:" + err);
      }
      console.info("richEditorApi1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi1 after each called");
    });

    /**
     * @tc.number    SUB_ACE_RICHEDITOR_RICHEDITORAPI1_0100
     * @tc.name      richEditorApi1_static_0100
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('richEditorApi1_static_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('[richEditorApi1_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let richEditor1 = await driver.findComponent(ON.id('RichEditor1'));
      // doubleClick
      let centerPoint = await (richEditor1?.getBoundsCenter() as Promise<Point>);
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await CommonFunc.sleep(2000);

      let button1: Component|null = await driver.findComponent(ON.text('复制'));
      button1?.click()
      await CommonFunc.sleep(1000);

      await driver.click(centerPoint.x, centerPoint.y);
      await CommonFunc.sleep(2000);

      let button2: Component|null = await driver.findComponent(ON.text('粘贴'));
      button2?.click()
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('richEditorApi1_text1');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getElement("content")).assertEqual('222');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
