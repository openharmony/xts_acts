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
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, loadAndSetUpUiTest, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichTextJsunit() {
  describe('RichTextJsunit', () => {
    beforeAll(() => {
      console.info("RichTextJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichTextJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichTextPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichTextJsunit state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get RichTextJsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RichTextJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichTextJsunit page error:" + err);
      }
      console.info("RichTextJsunit beforeEach end");
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name RichTextJsunit_static_0100
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RichTextJsunit_static_0100', Level.LEVEL0, async (done: () => void) => {
      // Get the data of the RichText component
      console.info('[RichTextJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('richText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichTextJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('<h1 style="text-align: center;">h1标题</h1>' +
  '<h1 style="text-align: center;"><i>h1斜体</i></h1>' +
  '<h1 style="text-align: center;"><u>h1下划线</u></h1>' +
  '<h2 style="text-align: center;">h2标题</h2>' +
  '<h3 style="text-align: center;">h3标题</h3>' +
  '<p style="text-align: center;">p常规</p><hr/>' +
  '<div style="width: 500px;height: 500px;border: 1px solid;margin: 0auto;">' +
  '<p style="font-size: 35px;text-align: center;font-weight: bold; color: rgb(24,78,228)">字体大小35px,行高45px</p>' +
  '<p style="background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;">' +
  '<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>');
      console.info('[RichTextJsunit_0100] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name RichTextJsunit_static_0200
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RichTextJsunit_static_0200', Level.LEVEL0, async (done: () => void) => {
      // Verify the onStart of the RichText component
      console.info('[RichTextJsunit_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let textComponent = await (driver.findComponent(ON.id('text1')) as Promise<Component|null>);
      let text = await (textComponent?.getText() as Promise<string>);
      expect(text == 'startOn').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[RichTextJsunit_0200] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name RichTextJsunit_static_0300
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RichTextJsunit_static_0300', Level.LEVEL0, async (done: () => void) => {
      // Verify the onComplete of the RichText component
      console.info('[RichTextJsunit_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let textComponent = await (driver.findComponent(ON.id('text2')) as Promise<Component>);
      let text = await (textComponent.getText() as Promise<string>);
      expect(text == 'completeOn').assertTrue();
      console.info('[RichTextJsunit_0300] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name RichTextJsunit_static_0400
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RichTextJsunit_static_0400', Level.LEVEL0, async (done: () => void) => {
      // Modify data of the RichText component
      console.info('[RichTextJsunit_0400] START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'RichTextData',value:'<h1 style="text-align: center;">h1Test标题</h1>'})
      await CommonFunc.sleep(2000);
      // Get the value of the QRCode component
      let strJson = inspector.getInspectorByKey('richText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('<h1 style="text-align: center;">h1Test标题</h1>');
      console.info('[RichTextJsunit_0400] END');
      done();
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name RichTextJsunit_static_0500
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RichTextJsunit_static_0500', Level.LEVEL0, async (done: () => void) => {
      // Illegal modification content of the RichText component
      console.info('[RichTextJsunit_0500] START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'RichTextData',value:1})
      await CommonFunc.sleep(2000);
      // Get the content of the RichText component
      let strJson = inspector.getInspectorByKey('richText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RichTextJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('<h1 style="text-align: center;">h1Test标题</h1>');
      console.info('[RichTextJsunit_0500] END');
      done();
    });
  })
}
