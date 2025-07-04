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
import { Driver, ON, loadAndSetUpUiTest } from '@ohos.UiTest';
import { describe, beforeAll, it, expect, Level, beforeEach, afterEach } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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

export default function TextInputGetTextTest() {
  describe('TextInputGetTextTest', () => {
    beforeAll(() => {
      console.info("TextInputGetTextTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputGetTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputGetText",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputGetTextTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextInputGetTextTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextInputGetTextTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputGetTextTest page error:" + err);
      }
      console.info("TextInputGetTextTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputGetTextTest after each called");
    });
    
    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0010
     * @tc.name      TextInputGetTextTest_static_0010
     * @tc.desc      test TextInput getText: set start and end
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0010', Level.LEVEL0, async (done: ()=>void) => {
      console.info('TextInputGetTextTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_1'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0010] getText1:" + JSON.stringify(AppStorage.get('getText_1', Type.from<string>())));
      expect(AppStorage.get('getText_1', Type.from<string>())).assertEqual('cd');
      AppStorage.delete('getText_1')
      console.info('[TextInputGetTextTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0020
     * @tc.name      TextInputGetTextTest_static_0020
     * @tc.desc      test TextInput getText: only set start
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0020', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_2'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0010] getText2:" + JSON.stringify(AppStorage.get('getText_2', Type.from<string>())));
      expect(AppStorage.get('getText_2', Type.from<string>())).assertEqual('bcdef');
      AppStorage.delete('getText_2')
      console.info('[TextInputGetTextTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0030
     * @tc.name      TextInputGetTextTest_static_0030
     * @tc.desc      test TextInput getText: only set end
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0030', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_3'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0030] getText3:" + JSON.stringify(AppStorage.get('getText_3', Type.from<string>())));
      expect(AppStorage.get('getText_3', Type.from<string>())).assertEqual('abc');
      AppStorage.delete('getText_3')
      console.info('[TextInputGetTextTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0040
     * @tc.name      TextInputGetTextTest_static_0040
     * @tc.desc      test TextInput getText: set start undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0040', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_4'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0040] getText4:" + JSON.stringify(AppStorage.get('getText_4', Type.from<string>())));
      expect(AppStorage.get('getText_4', Type.from<string>())).assertEqual('abcdef');
      AppStorage.delete('getText_4')
      console.info('[TextInputGetTextTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0050
     * @tc.name      TextInputGetTextTest_static_0050
     * @tc.desc      test TextInput getText: set end undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0050', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_5'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0050] getText5:" + JSON.stringify(AppStorage.get('getText_5', Type.from<string>())));
      expect(AppStorage.get('getText_5', Type.from<string>())).assertEqual('abcdef');
      AppStorage.delete('getText_5')
      console.info('[TextInputGetTextTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0060
     * @tc.name      TextInputGetTextTest_static_0060
     * @tc.desc      test TextInput getText: set start and end: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0060', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_6'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0060] getText6:" + JSON.stringify(AppStorage.get('getText_6', Type.from<string>())));
      expect(AppStorage.get('getText_6', Type.from<string>())).assertEqual('abcdef');
      AppStorage.delete('getText_6')
      console.info('[TextInputGetTextTest_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0070
     * @tc.name      TextInputGetTextTest_static_0070
     * @tc.desc      test TextInput getText: not set TextRange
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0070', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_getText_7'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0070] getText7:" + JSON.stringify(AppStorage.get('getText_7', Type.from<string>())));
      expect(AppStorage.get('getText_7', Type.from<string>())).assertEqual('abcdef');
      AppStorage.delete('getText_7')
      console.info('[TextInputGetTextTest_0070] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextInputGetTextTest_0080
     * @tc.name      TextInputGetTextTest_static_0080
     * @tc.desc      test TextInput: clearPreviewText
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('TextInputGetTextTest_static_0080', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[TextInputGetTextTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('TextInput_clearPreViewText'));
      await (Button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info("[TextInputGetTextTest_0080] TextInput:" + JSON.stringify(AppStorage.get('clearPreViewText_TextInput', Type.from<string>())));
      expect(AppStorage.get('clearPreViewText_TextInput', Type.from<string>())).assertEqual('succ');
      AppStorage.delete('clearPreViewText_TextInput')
      console.info('[TextInputGetTextTest_0080] END');
      done();
    });
  })
}
