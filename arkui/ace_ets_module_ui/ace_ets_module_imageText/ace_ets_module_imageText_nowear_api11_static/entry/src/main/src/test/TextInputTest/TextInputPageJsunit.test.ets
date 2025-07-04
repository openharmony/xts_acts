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
  InputType,
  Color,
  EnterKeyType,
  TextAlign
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
// import { resourceManager } from '@kit.LocalizationKit';
// import { BusinessError } from '@kit.BasicServicesKit';
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

export default function TextInputPageJsunit() {
  describe('TextInputPageJsunit', () :void=> {
    beforeAll(() => {
      console.info("TextInputPageJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputPageJsunit state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextInputPageJsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextInputPageJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputPageJsunit page error:" + err);
      }
      console.info("TextInputPageJsunit beforeEach end");
    });
    
    it('TextInputPageJsunit_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      // Get the information of the TextInput component
      console.info('[TextInputPageJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textInput');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0100] placeholder: " + JSON.stringify(obj.getElement('$attrs').getString('placeholder')));
      console.info("[TextInputPageJsunit_0100] type: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[TextInputPageJsunit_0100] placeholderColor: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderColor')));
      console.info("[TextInputPageJsunit_0100] placeholderFont: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderFont')));
      console.info("[TextInputPageJsunit_0100] enterKeyType: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[TextInputPageJsunit_0100] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[TextInputPageJsunit_0100] maxLength: " + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
      console.info("[TextInputPageJsunit_0100] copyOption: " + JSON.stringify(obj.getElement('$attrs').getString('copyOption')));
      console.info("[TextInputPageJsunit_0100] showPasswordIcon: " + JSON.stringify(obj.getElement('$attrs').getString('showPasswordIcon')));
      console.info("[TextInputPageJsunit_0100] style: " + JSON.stringify(obj.getElement('$attrs').getString('style')));
      console.info("[TextInputPageJsunit_0100] textAlign: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')));
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('input your word...');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"14.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF0000FF');
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('10');
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextInputStyle.Default');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      expect(obj.getElement('$attrs').getString('showPasswordIcon')).assertEqual(false);
      console.info('[TextInputPageJsunit_0100] END');
      done();
    });

    it('TextInputPageJsunit_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      // Get default attributes of TextInput component
      console.info('[TextInputPageJsunit_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('input');
      const uiContext = new UIContext();
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0200] placeholder: " + JSON.stringify(obj.getElement('$attrs').getString('placeholder')));
      console.info("[TextInputPageJsunit_0200] type: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[TextInputPageJsunit_0200] placeholderColor: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderColor')));
      console.info("[TextInputPageJsunit_0200] placeholderFont: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderFont')));
      console.info("[TextInputPageJsunit_0200] enterKeyType: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[TextInputPageJsunit_0200] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[TextInputPageJsunit_0200] maxLength: " + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
      console.info("[TextInputPageJsunit_0200] copyOption: " + JSON.stringify(obj.getElement('$attrs').getString('copyOption')));
      console.info("[TextInputPageJsunit_0200] showPasswordIcon: " + JSON.stringify(obj.getElement('$attrs').getString('showPasswordIcon')));
      console.info("[TextInputPageJsunit_0200] style: " + JSON.stringify(obj.getElement('$attrs').getString('style')));
      console.info("[TextInputPageJsunit_0200] textAlign: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')));
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('inline style');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      // let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_size_body1').id)
      // console.info("[TextInputPageJsunit_0200] size: " +uiContext.px2fp(resourceSize));
      // expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"'+uiContext.px2fp(resourceSize)+'.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      expect(obj.getElement('$attrs').getString('showPasswordIcon')).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('[TextInputPageJsunit_0200] END');
      done();
    });

    it('TextInputPageJsunit_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      // Modify the properties of TextInput component
      console.info('[TextInputPageJsunit_0300] START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'placeholder', value:'place input your word...'})
      await CommonFunc.sleep(1000);
      const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message1.notify({name:'type', value:InputType.Normal})
      await CommonFunc.sleep(1000);
      const message2:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message2.notify({name:'placeholderColor', value:Color.Green})
      await CommonFunc.sleep(1000);
      const message3:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message3.notify({name:'placeholderFont', value:{ size: 18, weight: 500 }})
      await CommonFunc.sleep(1000);
      const message4:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message4.notify({name:'enterKeyType', value:EnterKeyType.Done})
      await CommonFunc.sleep(1000);
      const message5:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message5.notify({name:'caretColor', value:Color.Red})
      await CommonFunc.sleep(1000);
      const message6:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message6.notify({name:'maxLength', value:8})
      await CommonFunc.sleep(1000);
      const message7:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message7.notify({name:'textAlign', value:TextAlign.Start})
      await CommonFunc.sleep(1000);

      // Get the propoties value of the TextInput component
      let strJson = inspector.getInspectorByKey('textInput');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[TextInputPageJsunit_0300] placeholder: " + JSON.stringify(obj.getElement('$attrs').getString('placeholder')));
      console.info("[TextInputPageJsunit_0300] type: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[TextInputPageJsunit_0300] placeholderColor: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderColor')));
      console.info("[TextInputPageJsunit_0300] placeholderFont: " + JSON.stringify(obj.getElement('$attrs').getString('placeholderFont')));
      console.info("[TextInputPageJsunit_0300] enterKeyType: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[TextInputPageJsunit_0300] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[TextInputPageJsunit_0300] maxLength: " + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
      console.info("[TextInputPageJsunit_0300] textAlign: " + JSON.stringify(obj.getElement('$attrs').getString('textAlign')));
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('place input your word...');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"18.00fp","weight":"500","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('maxLength')).assertEqual('8');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('[TextInputPageJsunit_0300] END');
      done();
    });

    it('TextInputPageJsunit_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      // Verify functions of TextInput component
      console.info('[TextInputPageJsunit_0400] START');

      // Verify change function of the TextInput component
      let driver = Driver.create()
      let textComponent = await driver.findComponent(ON.id('textInput'));
      await (textComponent?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      await (textComponent?.inputText("hello") as Promise<void>)
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(1000);
      let component = await driver.findComponent(ON.id('text'));
      let text = await (component?.getText() as Promise<string>);
      expect(text).assertEqual('hello');
      console.info("[TextInputPageJsunit_0400] inputText hello succ !");

      // Verify submit function of TextInput component
      let textComponent1 = await driver.findComponent(ON.id('submit'));
      let text1 = await (textComponent1?.getText()  as Promise<string>);
      expect(text1).assertEqual('onSubmit:');
      console.info("[TextInputPageJsunit_0400] Verify submit succ !");

      // Verify editChange function of TextInput component
      let textComponent2 = await driver.findComponent(ON.id('editChange'));
      let text2 = await (textComponent2?.getText() as Promise<string>);
      expect(text2).assertEqual('onEditChange:true');
      let password = await driver.findComponent(ON.id('password'));
      await (password?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let textFalse = await (textComponent2?.getText() as Promise<string>);
      expect(textFalse).assertEqual('onEditChange:false');
      console.info("[TextInputPageJsunit_0400] Verify editChange succ !");

      // Verify onCopy function of TextInput component
      let driverX = Driver.create()
      let textInputRect = CommonFunc.getComponentRectOnScreen('textInput')
      let clickX = Math.round((textInputRect.right + textInputRect.left)/2)
      let clickY = Math.round((textInputRect.bottom + textInputRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(3000);
      let textComponent3 = await driver.findComponent(ON.text('全选'));
      await (textComponent3?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent4 = await driver.findComponent(ON.text('复制'));
      await (textComponent4?.click() as Promise<void>)
      await (textComponent?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('copy');
      await CommonFunc.sleep(3000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextInputPageJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onCopy:hello');


      console.info("[TextInputPageJsunit_0400] Verify copy succ !");

      // Verify onCut function of TextInput component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent5 = await driver.findComponent(ON.text('全选'));
      await (textComponent5?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent6 = await driver.findComponent(ON.text('剪切'));
      await (textComponent6?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('cut');

      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextInputPageJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onCut:hello');
      console.info("[TextInputPageJsunit_0400] Verify cut succ !");

      // Verify onPaste function of TextInput component
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let textComponent7 = await driver.findComponent(ON.text('粘贴'));
      await (textComponent7?.click() as Promise<void>)
      await CommonFunc.sleep(3000);
      let strJson2 = inspector.getInspectorByKey('paste');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputPageJsunit_0400] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onPaste:hello');
      console.info("[TextInputPageJsunit_0400] Verify paste succ !");
      console.info('[TextInputPageJsunit_0400] END');
      done();
    });
  })
}
