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
  $r,
  Color
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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

export default function textAreaUIJsunit() {
  describe('textAreaUIJsunit', () : void=> {
    beforeAll(() => {
      console.info("textAreaUIJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaUI",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaUIJsunit state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get textAreaUIJsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaUIJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaUIJsunit page error:" + err);
      }
      console.info("textAreaUIJsunit beforeEach end");
    });

    it('textAreaUIJsunit_static_0100', Level.LEVEL0, async (done: ()=>void) => {
       console.info('textAreaUIJsunit_0100');
       await CommonFunc.sleep(1000);
       // get the textArea component and test attribute
       let strJson = inspector.getInspectorByKey('textArea');
       // let obj: ESObject = JSON.parse(strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_0100 component obj is: ' +obj.getElement('$attrs').getString('placeholderFont') + "---" + obj.getElement('$attrs').getString('text') + "--" + obj.getElement('$attrs').getString('placeholderColor') + "--" + obj.getElement('$attrs').getString('placeholder')
      + "--" + obj.getElement('$attrs').getString('textAlign') + "--" + obj.getElement('$attrs').getString('caretColor') + "--" + obj.getElement('$attrs').getString('fontSize') + "--" + obj.getElement('$attrs').getString('inputFilter') + "--" + obj.getElement('$attrs').getString('copyOption'));
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"16.00fp","weight":"400","fontFamily":"sans-serif"}');
      expect(obj.getElement('$attrs').getString('placeholder')).assertEqual('The text area can hold an unlimited amount of text. input your word...');
      expect(obj.getElement('$attrs').getString('text')).assertEqual('test1');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFAACCEE');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.End');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFACDEFF');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Local');
       done();
    });

   it('textAreaUIJsunit_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_0200 START');
     const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
     message.notify({name:'sizeT', value:20})
      await CommonFunc.sleep(2000);
     const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
     message1.notify({name:'weightT', value:300})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
     let obj = JSON.parseJsonElement(strJson);
     console.info('textAreaUIJsunit_0200 component obj is: ' + obj.getElement('$attrs').getString('placeholderFont'));
     expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"20.00fp","weight":"300","fontFamily":"sans-serif"}');
      done();
    });

    it('textAreaUIJsunit_static_0300', Level.LEVEL0, async (done: ()=>void) => {
      console.info('marqueeJsunit_0300 START');
      await CommonFunc.sleep(1000);
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'sizeT', value:-30})
      await CommonFunc.sleep(200);
      const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message1.notify({name:'weightT', value:-300})
      await CommonFunc.sleep(200);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_0300 component obj is: ' + obj.getElement('$attrs').getString('placeholderFont'));
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertEqual('{"style":"FontStyle.Normal","size":"-30.00fp","fontWeight":"FontWeight.Normal","fontFamily":"sans-serif"}');
      done();
   });

    it('textAreaUIJsunit_static_0400', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_0400 START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'placeholderColor', value:'#FFFFFF'})
      await CommonFunc.sleep(2000);
      const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message1.notify({name:'caretColor', value:'#EEFFFF'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_0400 component obj is: ' + obj.getElement('$attrs').getString('placeholderColor') + '--' +  obj.getElement('$attrs').getString('caretColor') );
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFEEFFFF');
      done();
    });

    it('textAreaUIJsunit_static_0500', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_0500 START');
      // modify the Color attribute normal value of textArea dynamically
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'placeholderColor', value:'rgb(238, 130, 238)'})
      await CommonFunc.sleep(2000);
      const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message1.notify({name:'caretColor', value:'rgb(238, 131, 233)'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_0500 component obj is: ' + obj.getElement('$attrs').getString('placeholderColor') + '--' +  obj.getElement('$attrs').getString('caretColor') );
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFEE82EE');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFEE83E9');
      done();
    });

    it('textAreaUIJsunit_static_0600', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_0600 START');
      // modify the Color attribute normal value of textArea dynamically
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'placeholderColor', value:Color.Green})
      await CommonFunc.sleep(2000);
      const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message1.notify({name:'caretColor', value:Color.Red})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_0600 component obj is: ' + obj.getElement('$attrs').getString('placeholderColor') + '--' +  obj.getElement('$attrs').getString('caretColor') );
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FF008000');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFFF0000');
      done();
    });

   it('textAreaUIJsunit_static_0700', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_0700 START');
      // modify the Color attribute illegal value of textArea dynamically
     const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
     message.notify({name:'placeholderColor', value:'#AED'})
      await CommonFunc.sleep(2000);
     const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
     message1.notify({name:'caretColor', value:'#ACD'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
     let obj = JSON.parseJsonElement(strJson);
     console.info('textAreaUIJsunit_0700 component obj is: ' + obj.getElement('$attrs').getString('placeholderColor') + '--' +  obj.getElement('$attrs').getString('caretColor') );
     expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFAAEEDD');
     expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFAACCDD');
      done();
   });

   it('textAreaUIJsunit_static_0800', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_0800 START');
     const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
     message.notify({name:'text', value:''})
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      // test the change event
      let text = await driver.findComponent(ON.id('textArea'));
      await (text?.inputText('123') as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('change');
     let obj = JSON.parseJsonElement(strJson);
     console.info('textAreaUIJsunit_0800 component obj is: ' + obj.getElement('$attrs').getString('content'));
     expect(obj.getElement('$attrs').getString('content')).assertEqual('123');
      done();
    });

    it('textAreaUIJsunit_static_0900', Level.LEVEL0, async (done: ()=>void) => {
      console.info('marqueeJsunit_0900 START');
      await CommonFunc.sleep(1000);
      // test the copy event
      let driver = Driver.create();
      let driverX =  Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'));
      if (allSelect != null) {
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(ON.text('复制'));
      if (copy != null) {
        await copy.click();
        await CommonFunc.sleep(1000);
      }
      await CommonFunc.sleep(2000);
      let textIn = await driver.findComponent(ON.id('copy'));
      let txt = await (textIn?.getText() as Promise<string>);
      console.info('textAreaUIJsunit_0900 component obj is: ' + txt);
      expect(txt).assertEqual('copy');

      // test the paste event
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let paste = await driver.findComponent(ON.text('粘贴'));
      if (paste != null) {
        await paste.click();
        await CommonFunc.sleep(1000);
      }
      await CommonFunc.sleep(2000);
      let textPaste = await driver.findComponent(ON.id('paste'));
      let text1 = await (textPaste?.getText() as Promise<string>);
      console.info('textAreaUIJsunit_0900 text1: ' + text1);
      expect(text1).assertEqual('paste');
      done();
    });

    it('textAreaUIJsunit_static_1000', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_1000 START');
      await CommonFunc.sleep(1000);
      // test the cut event
      let driver = Driver.create();
      let textArea = await driver.findComponent(ON.id('textArea'));
      await (textArea?.inputText('123') as Promise<void>);
      await CommonFunc.sleep(1000);
      let driverX =  Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'));
      if (allSelect != null) {
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let cutComponent = await driver.findComponent(ON.text('剪切'));
      if (cutComponent != null) {
        await cutComponent.click();
        await CommonFunc.sleep(1000);
      }
      await CommonFunc.sleep(2000);
      let textCut = await driver.findComponent(ON.id('cut'));
      let text = await (textCut?.getText() as Promise<string>);
      console.info('textAreaUIJsunit_1000 component obj is: ' + text);
      expect(text).assertEqual('cut');
      done();
    });

    it('textAreaUIJsunit_static_1100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_1100 START');
      // modify the Color attribute normal value of textArea dynamically
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'caretColor', value:'rgba(0, 255, 0, 1)'})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_1100 component obj is: ' + obj.getElement('$attrs').getString('placeholderColor') + '--' +  obj.getElement('$attrs').getString('caretColor') );
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF00FF00');
      done();
    });

    it('textAreaUIJsunit_static_1200', Level.LEVEL0, async (done: ()=>void) => {
      console.info('textAreaUIJsunit_1200 START');
      // modify the Color attribute normal value of textArea dynamically
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'caretColor', value:0xffc0cb})
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textAreaUIJsunit_1200 component obj is: ' + obj.getElement('$attrs').getString('placeholderColor') + '--' +  obj.getElement('$attrs').getString('caretColor') );
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFFFC0CB');
      done();
    });

    it('textAreaUIJsunit_static_1300', Level.LEVEL0, async (done: ()=>void) => {
      console.info("[textAreaUIJsunit_1300] start");
      let newJson = inspector.getInspectorByKey('textArea');
      console.info("[textAreaUIJsunit_1300]: " + JSON.stringify(newJson));

      let caretColor = $r('sys.color.ohos_id_color_connected');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'caretColor', value:`${$r('sys.color.ohos_id_color_connected')}`})
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('textArea');
      let strJson2 = inspector.getInspectorByKey('textAreaResource');
      console.info("[textAreaUIJsunit_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[textAreaUIJsunit_1300111]: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[textAreaUIJsunit_1300111]: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual(obj.getElement('$attrs').getString('caretColor'));
      console.info("[textAreaUIJsunit_1300] end");
      done();
    });
  })
}