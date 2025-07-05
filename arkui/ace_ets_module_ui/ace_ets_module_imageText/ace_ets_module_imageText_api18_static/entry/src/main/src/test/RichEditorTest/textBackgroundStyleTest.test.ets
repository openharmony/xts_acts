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
import { Driver, ON, loadAndSetUpUiTest, MouseButton } from '@ohos.UiTest';
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

export default function textBackgroundStyleTest() {
  describe('textBackgroundStyleTest', () => {
    beforeAll(() => {
      console.info("textBackgroundStyleTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textBackgroundStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/textBackgroundStyleTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textBackgroundStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get textBackgroundStyleTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textBackgroundStyleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textBackgroundStyleTest page error:" + err);
      }
      console.info("textBackgroundStyleTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textBackgroundStyleTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         textBackgroundStyleTest_static_0001
    * @tc.desic        The TextBackgroundStyle  not set
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textBackgroundStyleTest_static_0001', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual(undefined);
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual(undefined);
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         textBackgroundStyleTest_static_0002
    * @tc.desic        The TextBackgroundStyle  color set undefined  radius not set
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textBackgroundStyleTest_static_0002', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle1'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual("#00000000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual("radiusTopLeft: [NA]radiusTopRight: [NA]radiusBottomLeft: [NA]radiusBottomRight: [NA]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0002] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0003
   * @tc.name         textBackgroundStyleTest_static_0003
   * @tc.desic        The TextBackgroundStyle set Normal Value
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('textBackgroundStyleTest_static_0003', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0003 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle2'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual("#FFFF0000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual("radiusTopLeft: [5.00vp]radiusTopRight: [5.00vp]radiusBottomLeft: [5.00vp]radiusBottomRight: [5.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0003] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0004
   * @tc.name         textBackgroundStyleTest_static_0004
   * @tc.desic        The TextBackgroundStyle  color not set and radius  set 5vp
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('textBackgroundStyleTest_static_0004', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0004 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle3'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual("#00000000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual("radiusTopLeft: [5.00vp]radiusTopRight: [5.00vp]radiusBottomLeft: [5.00vp]radiusBottomRight: [5.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0004] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0005
   * @tc.name         textBackgroundStyleTest_static_0005
   * @tc.desic        The TextBackgroundStyle  color set Color.Red and radius set {topLeft:10,topRight:5,bottomLeft:20,bottomRight:15}
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('textBackgroundStyleTest_static_0005', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0005 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle4'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual("#FFFF0000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual("radiusTopLeft: [10.00vp]radiusTopRight: [5.00vp]radiusBottomLeft: [20.00vp]radiusBottomRight: [15.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0005] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0006
   * @tc.name         textBackgroundStyleTest_static_0006
   * @tc.desic        The TextBackgroundStyle  color set #e0dbeb  radius set -1vp
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('textBackgroundStyleTest_static_0006', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0006 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle5'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual("#FFE0DBEB");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual("radiusTopLeft: [-1.00vp]radiusTopRight: [-1.00vp]radiusBottomLeft: [-1.00vp]radiusBottomRight: [-1.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0006] end");
      done();
    });


    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0007
   * @tc.name         textBackgroundStyleTest_static_0007
   * @tc.desic        The TextBackgroundStyle  color set ResourceColor  radius set undefined
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('textBackgroundStyleTest_static_0007', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0007 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle6'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor', Type.from<string>())).assertEqual("#FFF04B3D");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius', Type.from<string>())).assertEqual("radiusTopLeft: [NA]radiusTopRight: [NA]radiusBottomLeft: [NA]radiusBottomRight: [NA]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0007] end");
      done();
    });
  })
}
