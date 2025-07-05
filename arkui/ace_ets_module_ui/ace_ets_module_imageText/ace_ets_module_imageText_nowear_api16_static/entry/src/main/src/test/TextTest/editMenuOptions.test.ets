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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function editMenuOptions() {
  describe('editMenuOptions', () : void => {
    beforeAll(() => {
      console.info("editMenuOptions beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("editMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/editMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get editMenuOptions state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get editMenuOptions pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push editMenuOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push editMenuOptions page error:" + err);
      }
      console.info("editMenuOptions beforeEach end");
    });
    
    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         editMenuOptions0001
     * @tc.desic        The labelinfo property is added to the customized menu of the text component
     */
    it('editMenuOptions_static_0001', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0001 START');
      await CommonFunc.sleep(500);
      let text = await driver.findComponent(ON.id('text'));
      await CommonFunc.sleep(500);
      await (text?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('123456'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      let search2 = await driver.findComponent(ON.id('search2'));
      await CommonFunc.sleep(500);
      await (search2?.click()  as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0001---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0001---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("abc123456");
      console.info("[editMenuOptions0001] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         editMenuOptions0002
     * @tc.desic        The labelinfo property is added to the customized menu of the textArea component
     */
    it('editMenuOptions_static_0002', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0002 START');
      await CommonFunc.sleep(500);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await (textArea?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('111111'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      let search2 = await driver.findComponent(ON.id('search2'));
      await CommonFunc.sleep(500);
      await (search2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textAreaLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0002---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0002---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("");
      console.info("[editMenuOptions0002] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         editMenuOptions0003
     * @tc.desic        The labelinfo property is added to the customized menu of the textInput component
     */
    it('editMenuOptions_static_0003', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0003 START');
      await CommonFunc.sleep(500);
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await (textInput?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('custom2'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      let search2 = await driver.findComponent(ON.id('search2'));
      await CommonFunc.sleep(500);
      await (search2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textInputLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0003---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0003---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("2222222");
      console.info("[editMenuOptions0003] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         editMenuOptions0004
     * @tc.desic        The labelinfo property is added to the customized menu of the richEditor component
     */
    it('editMenuOptions_static_0004', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0004 START');
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('richEditor'));
      await CommonFunc.sleep(500);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('123456'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      console.log('editMenuOptions0004 button click succ');
      let search2 = await driver.findComponent(ON.id('search2'));
      await CommonFunc.sleep(500);
      await (search2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('richEditorLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0004---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0004---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("");
      console.info("[editMenuOptions0004] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         editMenuOptions0005
     * @tc.desic        The labelinfo property is added to the customized menu of the search component
     */
    it('editMenuOptions_static_0005', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      let driver = Driver.create();
      console.info('editMenuOptions editMenuOptions0005 START');
      await CommonFunc.sleep(500);
      let search = await driver.findComponent(ON.id('search'));
      await CommonFunc.sleep(500);
      await (search?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.text('111111'));
      await CommonFunc.sleep(500);
      await (button?.click() as Promise<void>);
      console.log('editMenuOptions0005 button click succ');
      let search2 = await driver.findComponent(ON.id('search2'));
      await CommonFunc.sleep(500);
      await (search2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('searchLabelInfo');
      let obj = JSON.parseJsonElement(strJson);
      console.log('editMenuOptions0005---obj.$attrs---' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.log('editMenuOptions0005---obj.$attrs.content---' + obj.getElement('$attrs').getString('content'));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("");
      console.info("[editMenuOptions0005] end");
      done();
    });
  })
}
