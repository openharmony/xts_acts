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

import { describe, beforeAll,beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON, Point, loadAndSetUpUiTest } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextMenuItemId() {
  describe('TextMenuItemId', () => {
    beforeAll(() => {
      console.info("TextMenuItemId beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextMenuItemId beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/TextMenuItemId",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        // console.info("get TextMenuItemId state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          // console.info("get TextMenuItemId pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextMenuItemId page result:" + "");
        }
      } catch (err) {
        console.error("push TextMenuItemId page error:" + err);
      }
      console.info("TextMenuItemId beforeEach end");
    }); 


    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         TextMenuItemId0001
     * @tc.desic        set TextMenuItem for text
     */
    it('TextMenuItemId_static_0001', Level.LEVEL0,async (done: () => void): Promise<void> => {
      console.info("[TextMenuItemId0001] start");
      let driver = Driver.create();
      console.info('TextMenuItemId TextMenuItemId0001 START');
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('text'));
      console.info('TextMenuItemId TextMenuItemId0001 START2');
      await CommonFunc.sleep(500);
      let point:Point = await (text?.getBoundsCenter() as Promise<Point>)
      console.info('TextMenuItemId TextMenuItemId0001 START3');
      await CommonFunc.sleep(500);
      console.info('TextMenuItemId TextMenuItemId0001 START3.1 x ' + point.x + 'y' + point.y);
      await driver.longClick(point.x, point.y);
      console.info('TextMenuItemId TextMenuItemId0001 START4');
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('翻译'));
      console.info('TextMenuItemId TextMenuItemId0001 START5');
      await driver.assertComponentExist(ON.text('搜索'));
      console.info('TextMenuItemId TextMenuItemId0001 START6');
      console.info("[TextMenuItemId0001] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         TextMenuItemId0002
     * @tc.desic        set TextMenuItem for textArea
     */
    it('TextMenuItemId_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[TextMenuItemId0002] start");
      let driver = Driver.create();
      console.info('TextMenuItemId TextMenuItemId0002 START');
      await CommonFunc.sleep(500);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      let point:Point = await (textArea?.getBoundsCenter() as Promise<Point>)
      await CommonFunc.sleep(500);
      await driver.longClick(point.x, point.y);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('翻译'));
      await driver.assertComponentExist(ON.text('搜索'));
      console.info("[TextMenuItemId0002] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         TextMenuItemId0003
     * @tc.desic        set TextMenuItem for textInput
     */
    it('TextMenuItemId_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[TextMenuItemId0003] start");
      let driver = Driver.create();
      console.info('TextMenuItemId TextMenuItemId0003 START');
      await CommonFunc.sleep(500);
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      let point:Point = await (textInput?.getBoundsCenter() as Promise<Point>)
      await CommonFunc.sleep(500);
      await driver.longClick(point.x, point.y);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('翻译'));
      await driver.assertComponentExist(ON.text('搜索'));
      console.info("[TextMenuItemId0003] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         TextMenuItemId0004
     * @tc.desic        set TextMenuItem for richEditor
     */
    it('TextMenuItemId_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[TextMenuItemId0004] start");
      let driver = Driver.create();
      console.info('TextMenuItemId TextMenuItemId0004 START');
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('richEditor'));
      await CommonFunc.sleep(500);
      let point:Point = await (richEditor?.getBoundsCenter() as Promise<Point>)
      await CommonFunc.sleep(500);
      await driver.longClick(point.x, point.y);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('翻译'));
      await driver.assertComponentExist(ON.text('搜索'));
      console.info("[TextMenuItemId0004] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         TextMenuItemId0005
     * @tc.desic        set TextMenuItem for search
     */
    it('TextMenuItemId_static_0005', Level.LEVEL0,async (done: () => void): Promise<void> => {
      console.info("[TextMenuItemId0005] start");
      let driver = Driver.create();
      console.info('TextMenuItemId TextMenuItemId0005 START');
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('search'));
      await CommonFunc.sleep(500);
      let point:Point = await (search?.getBoundsCenter() as Promise<Point>)
      await CommonFunc.sleep(500);
      await driver.longClick(point.x, point.y);
      await CommonFunc.sleep(500);
      await driver.assertComponentExist(ON.text('翻译'));
      await driver.assertComponentExist(ON.text('搜索'));
      console.info("[TextMenuItemId0005] end");
      done();
    });
  })
}