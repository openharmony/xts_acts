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
import { describe, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
let testAbilityContext:common.UIAbilityContext;

export default function ResourceDefaultTest() {
  describe('ResourceDefaultTest', () => {
    beforeAll(() => {
      console.info("ResourceDefaultTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ResourceDefaultTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ImageAttachment/ResourceDefault",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ResourceDefaultTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ResourceDefaultTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ResourceDefaultTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceDefaultTest page error:" + err);
      }
      console.info("ResourceDefaultTest beforeEach end");
    });
    
    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0010
     * @tc.name      ResourceDefaultTest_static_0010
     * @tc.desc      set ImageAttachment resourceValue: resource
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_resourceValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0010] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('resource');
      console.info('[ResourceDefaultTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0020
     * @tc.name      ResourceDefaultTest_static_0020
     * @tc.desc      set ImageAttachment resourceValue: string
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_resourceValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0020] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('resource');
      console.info('[ResourceDefaultTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0030
     * @tc.name      ResourceDefaultTest_static_0030
     * @tc.desc      test ImageAttachment default: size
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_size');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0030] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[ResourceDefaultTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0040
     * @tc.name      ResourceDefaultTest_static_0040
     * @tc.desc      test ImageAttachment default: verticalAlign
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0040] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[ResourceDefaultTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0050
     * @tc.name      ResourceDefaultTest_static_0050
     * @tc.desc      test ImageAttachment default: objectFit
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_objectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0050] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('2');
      console.info('[ResourceDefaultTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0060
     * @tc.name      ResourceDefaultTest_static_0060
     * @tc.desc      test ImageAttachment default: layoutStyle
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_layoutStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0060] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{}');
      console.info('[ResourceDefaultTest_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0070
     * @tc.name      ResourceDefaultTest_static_0070
     * @tc.desc      test ImageAttachment default: colorFilter
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_default_append_resource'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_colorFilter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0070] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]');
      console.info('[ResourceDefaultTest_0070] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0080
     * @tc.name      ResourceDefaultTest_static_0080
     * @tc.desc      test ImageAttachment size: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_size');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0080] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[ResourceDefaultTest_0080] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0090
     * @tc.name      ResourceDefaultTest_static_0090
     * @tc.desc      test ImageAttachment verticalAlign: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0090] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_verticalAlign');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0090] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[ResourceDefaultTest_0090] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0100
     * @tc.name      ResourceDefaultTest_static_0100
     * @tc.desc      test ImageAttachment objectFit: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_objectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0100] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('2');
      console.info('[ResourceDefaultTest_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0110
     * @tc.name      ResourceDefaultTest_static_0110
     * @tc.desc      test ImageAttachment layoutStyle: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_layoutStyle');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0110] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{}');
      console.info('[ResourceDefaultTest_0110] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Resource_DefaultTest_0120
     * @tc.name      ResourceDefaultTest_static_0120
     * @tc.desc      test ImageAttachment colorFilter: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ResourceDefaultTest_static_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ResourceDefaultTest_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('set_colorFilter_append_str'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let Button1 = await driver.findComponent(ON.id('get_default_styles'));
      await (Button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('default_colorFilter');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ResourceDefaultTest_0120] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]');
      console.info('[ResourceDefaultTest_0120] END');
      done();
    });
  })
}