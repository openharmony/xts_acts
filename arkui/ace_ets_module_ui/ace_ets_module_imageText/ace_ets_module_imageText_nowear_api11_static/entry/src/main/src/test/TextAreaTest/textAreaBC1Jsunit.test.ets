/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton, loadAndSetUpUiTest} from '@ohos.UiTest';
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
export default function textAreaBC1Jsunit() {
  describe('textAreaBC1Jsunit', () :void=> {
    beforeAll(() => {
      console.info("textAreaBC1Jsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaBC1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaBC1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaBC1Jsunit state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get textAreaBC1Jsunit pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaBC1Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaBC1Jsunit page error:" + err);
      }
      console.info("textAreaBC1Jsunit beforeEach end");
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_011
    * @tc.name  : textAreaBC1Jsunit_static_0100
    * @tc.desc  : Move the cursor out of the TextArea component
    * @tc.level : Level 3
    */
    it('textAreaBC1Jsunit_static_0100', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let Storage11Button1 = await driver.findComponent(ON.id('textArea1'));
      await (Storage11Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Storage12Button1 = await driver.findComponent(ON.id('textArea2'));
      await (Storage12Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0100 Storage12Button1 clicked');
      let strJsont = inspector.getInspectorByKey('isEdit');
      let objt = JSON.parseJsonElement(strJsont);
      console.info('textAreaBC1Jsunit_0200 objt is: ' + objt.getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(objt.getElement('$attrs').getString('content')).assertEqual('Nodoing');

      done();
    });
    /* *
   * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_005
   * @tc.name  : textAreaBC1Jsunit_static_0200
   * @tc.desc  : In the TextArea, delete and add the text content verification effect in the TextArea
   * @tc.level : Level 3
   */
    it('textAreaBC1Jsunit_static_0200', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      // 第一次设置文本
      let text = await driver.findComponent(ON.id('textArea1'));
      await (text?.inputText('123') as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('change');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('textAreaBC1Jsunit_0200 obj1 is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('doing');
      let strJsont = inspector.getInspectorByKey('isEdit');
      let objt = JSON.parseJsonElement(strJsont);
      console.info('textAreaBC1Jsunit_0200 objt is: ' + objt.getElement('$attrs').getString('content'));
      expect(objt.getElement('$attrs').getString('content')).assertEqual('doing');
      await CommonFunc.sleep(2000);
      await (text?.inputText('123456') as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('change');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textAreaBC1Jsunit_0200 obj2 is: ' + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('123456');
      let strJsont1 = inspector.getInspectorByKey('isEdit');
      let objt1 = JSON.parseJsonElement(strJsont1);
      console.info('textAreaBC1Jsunit_0200 objt1 is: ' + objt1.getElement('$attrs').getString('content'));
      expect(objt1.getElement('$attrs').getString('content')).assertEqual('doing');
      done();
    });
    /* *
  * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_004
  * @tc.name  : textAreaBC1Jsunit_static_0300
  * @tc.desc  : Set the text color and text size
  * @tc.level : Level 3
  */
    it('textAreaBC1Jsunit_static_0300', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('textArea1'));
      await (text?.inputText('444') as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('change');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('textAreaBC1Jsunit_0300 obj1 is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('444');

      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0300 START');
      const message:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message.notify({name:'placeholderColor', value:'#FFFFFFFF'})
      await CommonFunc.sleep(2000);
      const message1:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message1.notify({name:'textColor', value:'#FF66DD00'})
      await CommonFunc.sleep(2000);
      const message2:MessageManager = AppStorage.get<MessageManager>("messageManager", Type.from<string>())!
      message2.notify({name:'fontSize', value:12})
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('textArea1');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0300 lala: ' + obj.getElement('$attrs'));
      console.info('textAreaBC1Jsunit_0300 obj is: ' + obj.getElement('$attrs').getString('placeholderColor')+ '--' + obj.getElement('$attrs').getString('fontColor'));

      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF66DD00');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');

      let strJsontw = inspector.getInspectorByKey('isEdit');
      let objtw = JSON.parseJsonElement(strJsontw);
      console.info('textAreaBC1Jsunit_0300 objtw is: ' + objtw.getElement('$attrs').getString('content'));
      expect(objtw.getElement('$attrs').getString('content')).assertEqual('doing');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_008
    * @tc.name  : textAreaBC1Jsunit_static_0400
    * @tc.desc  : Activate the handle inside the textArea component to verify the effect
    * @tc.level : Level 3
    */
    it('textAreaBC1Jsunit_static_0400', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0400 START');
      let driver =  Driver.create()
      let Storage12Button1 = await driver.findComponent(ON.id('textArea1'));
      await CommonFunc.sleep(1000);
      await (Storage12Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('textArea1'));
      await (text?.inputText('rrr') as Promise<void>);
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('change');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('textAreaBC1Jsunit_0400 obj1 is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('rrr');
      await CommonFunc.sleep(1000);
      let strJsont = inspector.getInspectorByKey('isEdit');
      let objt = JSON.parseJsonElement(strJsont);
      console.info('textAreaBC1Jsunit_0400 objt is: ' + objt.getElement('$attrs').getString('content'));
      expect(objt.getElement('$attrs').getString('content')).assertEqual('doing');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_001
    * @tc.name  : textAreaBC1Jsunit_static_0500
    * @tc.desc  : View the default in the TextArea component
    * @tc.level : Level 3
    */
    it('textAreaBC1Jsunit_static_0500', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0500 START');
      let driver =  Driver.create()
      let Storage12Button1 = await driver.findComponent(ON.id('textArea1'));
      await CommonFunc.sleep(1000);
      console.log('dududud',Storage12Button1)
      await (Storage12Button1?.click()  as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJsont = inspector.getInspectorByKey('isEdit');
      let objt = JSON.parseJsonElement(strJsont);
      console.info('textAreaBC1Jsunit_0500 objt is: ' + objt.getElement('$attrs').getString('content'));
      expect(objt.getElement('$attrs').getString('content')).assertEqual('doing');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_003；SUB_ACE_TS_COMPONENT_SR000HTP2G_006；
    * @tc.name  : textAreaBC1Jsunit_static_0600
    * @tc.desc  : Raise the handle in the TextArea component and copy and paste the text
    * @tc.level : Level 3
    */
    it('textAreaBC1Jsunit_static_0600', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0600 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let driverX =  Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea1')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'));
      await CommonFunc.sleep(1000);
      console.log('0600allSelectallSelect',allSelect)
      if (allSelect != null) {
        console.log('0600我进来了--全选')
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(ON.text('复制'));
      await CommonFunc.sleep(1000);
      console.log('0600allSelectallSelect复制',copy)
      if (copy != null) {
        console.log('0600我进来了--复制')
        await copy.click();
        await CommonFunc.sleep(1000);
      }
      let textIn = await driver.findComponent(ON.id('copy'));
      await CommonFunc.sleep(1000);
      let txt = await (textIn?.getText() as Promise<string>);
      await CommonFunc.sleep(1000);
      console.info('textAreaBC1Jsunit_0600 component obj is: ' + txt);
      expect(txt).assertEqual('copy');
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let paste = await driver.findComponent(ON.text('粘贴'));
      if (paste != null) {
        await paste.click();
        await CommonFunc.sleep(1000);
      }
      let textPaste = await driver.findComponent(ON.id('paste'));
      let text1 = await (textPaste?.getText() as Promise<string>);
      console.info('textAreaJsunit_0900 text1: ' + text1);
      expect(text1).assertEqual('paste');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_003
    * @tc.name  : textAreaBC1Jsunit_static_0700
    * @tc.desc  : Cut text in the TextArea component
    * @tc.level : Level 3
    */
    it('textAreaBC1Jsunit_static_0700', Level.LEVEL3, async (done: ()=>void) => {
      console.info('textAreaBC1Jsunit_0700 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let textArea = await driver.findComponent(ON.id('textArea1'));
      await (textArea?.inputText('123') as Promise<void>);
      await CommonFunc.sleep(1000);
      let driverX =  Driver.create()
      let textAreaRect = CommonFunc.getComponentRectOnScreen('textArea1')
      let clickX = Math.round((textAreaRect.right + textAreaRect.left)/2)
      let clickY = Math.round((textAreaRect.bottom + textAreaRect.top)/2)
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let allSelect = await driver.findComponent(ON.text('全选'));
      await CommonFunc.sleep(2000);
      if (allSelect != null) {
        await allSelect.click();
        await CommonFunc.sleep(1000);
      }
      await driverX.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);
      let cutComponent = await driver.findComponent(ON.text('剪切'));
      await CommonFunc.sleep(2000);
      if (cutComponent != null) {
        await cutComponent.click();
        await CommonFunc.sleep(1000);
      }
      let textCut = await driver.findComponent(ON.id('cut'));
      let text = await (textCut?.getText() as Promise<string>);
      console.info('textAreaBC1Jsunit_0700 component obj is: ' + text);
      expect(text).assertEqual('cut');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_002
    * @tc.name  : textAreaBC1Jsunit_static_0800
    * @tc.desc  : Move position within the textArea by hand keyboard and mouse in the TextArea component
    * @tc.level : Level 2
    */
    it('textAreaBC1Jsunit_static_0800', Level.LEVEL2, async (done: ()=>void) => {
      let driver =  Driver.create()
      let text = await driver.findComponent(ON.id('textArea1'));
      await (text?.inputText('ee') as Promise<void>);
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('change');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('textAreaBC1Jsunit_0800 obj1 is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('ee');
      await CommonFunc.sleep(1000);
      let y = await driver.findComponent(ON.id('button1'));
      await (y?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJsont = inspector.getInspectorByKey('isEdit');
      let objt = JSON.parseJsonElement(strJsont);
      console.info('textAreaBC1Jsunit_0800 objt is: ' + objt.getElement('$attrs').getString('content'));
      expect(objt.getElement('$attrs').getString('content')).assertEqual('doing');
      done();
    });
    /* *
   * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2G_012
   * @tc.name  : textAreaBC1Jsunit_static_0800
   * @tc.desc  : Move position inside the textArea by hand keyboard and mouse outside the TextArea component
   * @tc.level : Level 3
   */
    it('textAreaBC1Jsunit_static_0900', Level.LEVEL3, async (done: ()=>void) => {
      let driver =  Driver.create()
      let text = await driver.findComponent(ON.id('textArea2'));
      await (text?.inputText('yy') as Promise<void>);
	  await driver.triggerKey(2047)
      await CommonFunc.sleep(2000);
      let y = await driver.findComponent(ON.id('button2'));
      await (y?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJsont = inspector.getInspectorByKey('isEdit');
      let objt = JSON.parseJsonElement(strJsont);
      console.info('textAreaBC1Jsunit_0900 objt is: ' + objt.getElement('$attrs').getString('content'));
      expect(objt.getElement('$attrs').getString('content')).assertEqual('Nodoing');
      done();
    });
  })
}