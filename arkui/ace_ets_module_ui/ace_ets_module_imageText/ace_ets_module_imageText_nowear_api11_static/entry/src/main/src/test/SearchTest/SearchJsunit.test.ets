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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Color, Font, TextAlign, CopyOptions } from '@ohos.arkui.component'
import router from '@ohos.router';
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
let testAbilityContext: common.UIAbilityContext;

class MyClass {
  name: string;
  messageManager: MessageManager;
  message: MessageManager;

  constructor() {
    this.name = 'messageManager';
    this.messageManager = new MessageManager();
    this.message = this.messageManager;
  }
}

export default function SearchJsunit() {
  describe('SearchJsunit', (): void => {
    beforeAll(() => {
      console.info("SearchJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchJsunit state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get SearchJsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SearchJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchJsunit page error:" + err);
      }
      console.info("SearchJsunit beforeEach end");
    });

      /* *
       * @tc.number: SearchJsunit_static_0100
       * @tc.name  : SearchJsunit_static_0100
       * @tc.desc  : click different position and check caret
       * @tc.level : Level 2
       * @tc.type : Function
       * @tc.size : MediumTest
       */
    it('SearchJsunit_static_0100', Level.LEVEL0, async (done: () => void) => {
      // Get the information of the Search component
      console.info('[SearchJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchJsunit_0100] icon: " + obj.getElement('$attrs').getString('icon'));
      console.info("[SearchJsunit_0100] searchButton: " + obj.getElement('$attrs').getString('searchButton'));
      console.info("[SearchJsunit_0100] placeholderColor: " + obj.getElement('$attrs').getString('placeholderColor'));
      console.info("[SearchJsunit_0100] value: " + obj.getElement('$attrs').getString('value'));
      console.info("[SearchJsunit_0100] placeholder: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0100] placeholderFont: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0100] textFont: " + obj.getElement('$attrs').getString('textFont'));
      console.info("[SearchJsunit_0100] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      console.info("[SearchJsunit_0100] copyOption: " + obj.getElement('$attrs').getString('copyOption'));
      expect(obj.getElement('$attrs').getString('icon')).assertEqual(983081);
      expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('SEARCH');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('textFont')).assertEqual('{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('Type to search...');
      console.info('[SearchJsunit_0100] END');
      done();
    });

      /* *
       * @tc.number: SearchJsunit_static_0200
       * @tc.name  : SearchJsunit_static_0200
       * @tc.desc  : click different position and check caret
       * @tc.level : Level 2
       * @tc.type : Function
       * @tc.size : MediumTest
       */
    it('SearchJsunit_static_0200', Level.LEVEL0, async (done: () => void) => {
      // Modify the properties of component Search
      console.info('[SearchJsunit_0200] START');
      await CommonFunc.sleep(500);
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'icon',value:'./resources/base/media/star_3.png'})
      await CommonFunc.sleep(500);
      message.notify({name:'searchButton',value:'search'})
      await CommonFunc.sleep(500);
      message.notify({name:'placeholderColor',value:Color.Green})
      await CommonFunc.sleep(500);
      message.notify({name:'changeValue',value:'hello'})
      await CommonFunc.sleep(500);
      message.notify({name:'placeholder',value:'Type to search...'})
      await CommonFunc.sleep(500);
      message.notify({name:'placeholderFont',value:'{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}'})
      await CommonFunc.sleep(500);
      message.notify({name:'textFont',value:'{"fontSize":"14.00fp","fontStyle":"FontStyle.Normal","fontWeight":"400","fontFamily":"HarmonyOS Sans"}'})
      await CommonFunc.sleep(500);
      message.notify({name:'textAlign',value:TextAlign.Center})
      await CommonFunc.sleep(500);
      message.notify({name:'copyOption',value:CopyOptions.LocalDevice})
      await CommonFunc.sleep(500);
      message.notify({name:'positionValue',value:2})
      await CommonFunc.sleep(2000);

      // Get the properties of the Search component
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[SearchJsunit_0200] icon: " + obj.getElement('$attrs').getString('icon'));
      console.info("[SearchJsunit_0200] searchButton: " + obj.getElement('$attrs').getString('searchButton'));
      console.info("[SearchJsunit_0200] placeholderColor: " + obj.getElement('$attrs').getString('placeholderColor'));
      console.info("[SearchJsunit_0200] value: " + obj.getElement('$attrs').getString('value'));
      console.info("[SearchJsunit_0200] placeholder: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0200] placeholderFont: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0200] textFont: " + obj.getElement('$attrs').getString('textFont'));
      console.info("[SearchJsunit_0200] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      console.info("[SearchJsunit_0200] copyOption: " + obj.getElement('$attrs').getString('copyOption'));
      expect(obj.getElement('$attrs').getString('icon')).assertEqual('./resources/base/media/star_3.png');
      expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('search');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('hello');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('textFont')).assertEqual('{"fontSize":"16.00fp","fontStyle":"FontStyle.Normal","fontWeight":"FontWeight.Normal","fontFamily":"HarmonyOS Sans"}');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Local');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('Type to search...');
      console.info('[SearchJsunit_0200] END');
      done();
    });

      /* *
       * @tc.number: SearchJsunit_static_0300
       * @tc.name  : SearchJsunit_static_0300
       * @tc.desc  : click different position and check caret
       * @tc.level : Level 2
       * @tc.type : Function
       * @tc.size : MediumTest
       */
    it('SearchJsunit_static_0300', Level.LEVEL0, async (done: () => void) => {
      // Verify the functions of the Search component
      console.info('[SearchJsunit_0300] START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'changeValue',value:''})
      await CommonFunc.sleep(1000);
      // Verify the onChange function of the Search component
      let driver: Driver = Driver.create()
      let textComponent1: Component|null = await driver.findComponent(ON.id('search'));
      if (textComponent1 != null && textComponent1 != undefined) {
        await (textComponent1.inputText("hello")  as Promise<void>)
        await driver.triggerKey(2047)
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('change');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('content')).assertEqual('onChange:hello');
        await CommonFunc.sleep(1000);
      }

      // Verify the onSubmit function of the Search component
      let textComponent2 = await driver.findComponent(ON.text('search'));
      if(!textComponent2){
        textComponent2 = await driver.findComponent(ON.text('SEARCH'));
      }
      if (textComponent2 != null && textComponent2 != undefined) {
        await (textComponent2.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info("[SearchJsunit_0300] CLICK_SEARCH succ ");
        let strJson2 = inspector.getInspectorByKey('submit');
        let obj2 = JSON.parseJsonElement(strJson2);
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('onSubmit:hello');
      }

      // Verify the onCopy function of the Search component
      let driverX = Driver.create()
      let searchRect = CommonFunc.getComponentRectOnScreen('search')
      let clickX = Math.round((searchRect.right + searchRect.left)/2)
      let clickY = Math.round((searchRect.bottom + searchRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] first mouseClick succ ");
      let textComponent3 = await driver.findComponent(ON.text('全选'));
      if (textComponent3 != null && textComponent3 != undefined) {
        await (textComponent3?.click() as Promise<void>)
        await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
        await CommonFunc.sleep(1000);
      }
      let textComponent4 = await driver.findComponent(ON.text('复制'));
      if ( textComponent4 == null ) {
        console.info("[SearchJsunit_0300] after mouseClick can not find component 复制");
      }
      if (textComponent4 != null && textComponent4 != undefined) {
        await (textComponent4.click() as Promise<void>)
        await CommonFunc.sleep(3000);
        console.info("[SearchJsunit_0300] click copy succ ");
        let strJson3 = inspector.getInspectorByKey('copy');
        let obj3 = JSON.parseJsonElement(strJson3);
        expect(obj3.getElement('$attrs').getString('content')).assertEqual('onCopy:hello');
      }

      // Verify the onCut function of the Search component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      console.info("[SearchJsunit_0300] secand mouseClick succ ");
      let textComponent5 = await driver.findComponent(ON.text('全选'));
      if (textComponent5 != null && textComponent5 != undefined) {
        await (textComponent5?.click() as Promise<void>)
        await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
        await CommonFunc.sleep(1000);
      }

      let textComponent6 = await driver.findComponent(ON.text('剪切'));
      if ( textComponent6 == null ) {
        console.info("[SearchJsunit_0300] after mouseClick can not find component 剪切");
      }
      if (textComponent6 != null && textComponent6 != undefined) {
        await (textComponent6.click() as Promise<void>)
        await CommonFunc.sleep(3000);
        console.info("[SearchJsunit_0300] click cut succ ");
        let strJson4 = inspector.getInspectorByKey('cut');
        let obj4 = JSON.parseJsonElement(strJson4);
        console.info("[SearchJsunit_0300] obj4: " + JSON.stringify(obj4));
        expect(obj4.getElement('$attrs').getString('content')).assertEqual('onCut:hello');
      }

      // Verify the onPaste function of the Search component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent8 = await driver.findComponent(ON.text('粘贴'));
      if ( textComponent8 == null ) {
        console.info("[SearchJsunit_0300] after mouseClick can not find component 粘贴");
      }
      if (textComponent8 != null && textComponent8 != undefined) {
        await (textComponent8.click() as Promise<void>)
        await CommonFunc.sleep(3000);
        console.info("[SearchJsunit_0300] click paste succ ");
        let strJson5 = inspector.getInspectorByKey('paste');
        let obj5 = JSON.parseJsonElement(strJson5);
        expect(obj5.getElement('$attrs').getString('content')).assertEqual('onPaste:hello');
      }

      // Verify the caretPosition function of the Search component
      let textComponent7 = await driver.findComponent(ON.id('button'));
      if (textComponent7 != null && textComponent7 != undefined) {
        await (textComponent7.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info("[SearchJsunit_0300] click button succ ");
        let strJson6 = inspector.getInspectorByKey('button');
        let obj6 = JSON.parseJsonElement(strJson6);
        expect(obj6.getElement('$attrs').getString('label')).assertEqual('Set caretPosition 2');
      }
      console.info('[SearchJsunit_0300] END');
      done();
    });

      /* *
       * @tc.number: SearchJsunit_static_0400
       * @tc.name  : SearchJsunit_static_0400
       * @tc.desc  : click different position and check caret
       * @tc.level : Level 2
       * @tc.type : Function
       * @tc.size : MediumTest
       */
    it('SearchJsunit_static_0400', Level.LEVEL0, async (done: () => void) => {
      // Illegal modification of properties of component Search
      console.info('[SearchJsunit_0400] START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      await CommonFunc.sleep(1000);
      message.notify({name:'icon',value:10})
      await CommonFunc.sleep(1000);
      message.notify({name:'searchButton',value:10})
      await CommonFunc.sleep(1000);
      message.notify({name:'placeholderColor',value:10})
      await CommonFunc.sleep(200);
      message.notify({name:'changeValue',value:10})
      await CommonFunc.sleep(200);
      message.notify({name:'placeholder',value:168})
      await CommonFunc.sleep(200);
      message.notify({name:'placeholderFont',value:'aaa'})
      await CommonFunc.sleep(500);
      message.notify({name:'textFont',value:'bbb'})
      await CommonFunc.sleep(200);
      message.notify({name:'textAlign',value:'test'})
      await CommonFunc.sleep(200);
      message.notify({name:'copyOption',value:10})
      await CommonFunc.sleep(2000);

      // Get the properties of the Search component
      let strJson = inspector.getInspectorByKey('search');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[SearchJsunit_0400] icon: " + obj.getElement('$attrs').getString('icon'));
      console.info("[SearchJsunit_0400] searchButton: " + obj.getElement('$attrs').getString('searchButton'));
      console.info("[SearchJsunit_0400] placeholderColor: " + obj.getElement('$attrs').getString('placeholderColor'));
      console.info("[SearchJsunit_0400] value: " + obj.getElement('$attrs').getString('value'));
      console.info("[SearchJsunit_0400] placeholderFont: " + obj.getElement('$attrs').getString('placeholder'));
      console.info("[SearchJsunit_0400] textFont: " + obj.getElement('$attrs').getString('textFont'));
      console.info("[SearchJsunit_0400] textAlign: " + obj.getElement('$attrs').getString('textAlign'));
      console.info("[SearchJsunit_0400] copyOption: " + obj.getElement('$attrs').getString('copyOption'));
      console.info("[SearchJsunit_0400] placeholder: " + obj.getElement('$attrs').getString('placeholder'));
      expect(obj.getElement('$attrs').getString('icon')).assertEqual(983081);
      expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF00000A');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('hello');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('textFont')).assertEqual('{"fontSize":"16.00fp","fontStyle":"FontStyle.Normal","fontWeight":"FontWeight.Normal","fontFamily":"HarmonyOS Sans"}');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('Type to search...');
      console.info('[SearchJsunit_0400] END');
      done();
    });
  })
}
