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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RichEditorSymbolSpanStyleTest() {
  describe('RichEditorSymbolSpanStyleTest', () => {
    beforeAll(() => {
      console.info("RichEditorSymbolSpanStyleTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorSymbolSpanStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditorSymbolSpanStyleTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get RichEditorSymbolSpanStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get RichEditorSymbolSpanStyleTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RichEditorSymbolSpanStyleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSymbolSpanStyleTest page error:" + err);
      }
      console.info("RichEditorSymbolSpanStyleTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorSymbolSpanStyleTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         RichEditorSymbolSpanStyleTest0001
    * @tc.desic        set offset: 10,fontColor: [Color.Red],fontSize: 30,fontWeight: 200,
    *                  effectStrategy: SymbolEffectStrategy.NONE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorSymbolSpanStyleTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorSymbolSpanStyleTest0001 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan1'))
      await CommonFunc.sleep(500);
      await (addSymbolSpan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await (getSymbolSpanStyle?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('symbolSpanStyleFontColor', Type.from<string>())).assertEqual('#FFFF0000');
      expect(''+AppStorage.get('symbolSpanStyleFontSize', Type.from<string>())).assertEqual('30');
      expect(''+AppStorage.get('symbolSpanStyleFontWeight', Type.from<string>())).assertEqual('1');
      expect(''+AppStorage.get('symbolSpanStyleEffectStrategy', Type.from<string>())).assertEqual('0');
      expect(''+AppStorage.get('symbolSpanStyleSpanIndex', Type.from<string>())).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         RichEditorSymbolSpanStyleTest0002
    * @tc.desic        set offset: 20,fontColor: [Color.Red, Color.Blue, Color.Pink], fontSize: '40',
    *                  fontWeight: FontWeight.Normal,effectStrategy: SymbolEffectStrategy.SCALE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('RichEditorSymbolSpanStyleTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorSymbolSpanStyleTest0002 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan2'))
      await CommonFunc.sleep(500);
      await (addSymbolSpan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await (getSymbolSpanStyle?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('symbolSpanStyleFontColor', Type.from<string>())).assertEqual('#FFFF0000,#FF0000FF,#FFFFC0CB');
      expect(''+AppStorage.get('symbolSpanStyleFontSize', Type.from<string>())).assertEqual('40');
      expect(''+AppStorage.get('symbolSpanStyleFontWeight', Type.from<string>())).assertEqual('10');
      expect(''+AppStorage.get('symbolSpanStyleEffectStrategy', Type.from<string>())).assertEqual('0');
      expect(''+AppStorage.get('symbolSpanStyleSpanIndex', Type.from<string>())).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0002] end");
      done();
    });

    /*
   * @tc.number       SUB_ACE_BASIC_ETS_API_0003
   * @tc.name         RichEditorSymbolSpanStyleTest0003
   * @tc.desic        set offset: 30,fontColor: [$r('app.color.red'), Color.Blue, Color.Pink],
   *                  fontSize: $r('app.string.fontSize'),fontWeight: '900',effectStrategy: SymbolEffectStrategy.HIERARCHICAL
   * @tc.size         MediumTest
   * @tc.type         Function
   * @tc.level        1
    */
    it('RichEditorSymbolSpanStyleTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info(' RichEditorSymbolSpanStyleTest0003 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan3'))
      await CommonFunc.sleep(500);
      await (addSymbolSpan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await (getSymbolSpanStyle?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('symbolSpanStyleFontColor', Type.from<string>())).assertEqual('#FFF04B3D,#FF0000FF,#FFFFC0CB');
      expect(''+AppStorage.get('symbolSpanStyleFontSize', Type.from<string>())).assertEqual('50');
      expect(''+AppStorage.get('symbolSpanStyleFontWeight', Type.from<string>())).assertEqual('8');
      expect(''+AppStorage.get('symbolSpanStyleEffectStrategy', Type.from<string>())).assertEqual('0');
      expect(''+AppStorage.get('symbolSpanStyleSpanIndex', Type.from<string>())).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0003] end");
      done();
    });

  })
}