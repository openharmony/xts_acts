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
import { describe, beforeEach, it, expect, Level,beforeAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { ClickEvent } from '@ohos.arkui.component';

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


export default function BarStateTest() {
  describe('BarStateTest', () => {
    beforeAll(() => {
      console.info("BarStateTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });


    beforeEach(async (): Promise<void> => {
      console.info("BarStateTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/richEditorApi/richEditorApi2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BarStateTest state pages:" + JSON.stringify(pages));
        if (!("barState" == pages.name)) {
          console.info("get BarStateTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richEditorApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BarStateTest page error:" + err);
      }
      console.info("BarStateTest beforeEach end");
    });
    /**
     * @tc.number    SUB_ACE_BarStateTest_static_0010
     * @tc.name      BarStateTest_static_0010
     * @tc.desc      get RichEditor barState: BarState.Auto
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[BarStateTest_static_0010] START');
      let strJson =inspector.getInspectorByKey('RichEditor_BarState_Auto');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BarStateTest_static_0010] BarState: ' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
      expect(obj.getElement('$attrs').getInteger('barState')).assertEqual(1);
      console.info('[BarStateTest_static_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_static_0020
     * @tc.name      BarStateTest_static_0020
     * @tc.desc      set RichEditor barState: BarState.Off
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[BarStateTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('RichEditor_BarState_Off');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BarStateTest_static_0020] BarState: ' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
      expect(obj.getElement('$attrs').getInteger('barState')).assertEqual(0);
      console.info('[BarStateTest_static_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_static_0030
     * @tc.name      BarStateTest_static_0030
     * @tc.desc      set RichEditor barState: BarState.On
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[BarStateTest_static_0030] START');
      let strJson =inspector.getInspectorByKey('RichEditor_BarState_On');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BarStateTest_static_0030] BarState: ' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
      expect(obj.getElement('$attrs').getInteger('barState')).assertEqual(2);
      console.info('[BarStateTest_static_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_static_0040
     * @tc.name      BarStateTest_static_0040
     * @tc.desc      set RichEditor barState: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_static_0040', Level.LEVEL0,async (done: () => void): Promise<void> => {
      console.info('[BarStateTest_static_0040] START');
      let strJson =inspector.getInspectorByKey('RichEditor_barState_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BarStateTest_static_0040] BarState: ' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
      expect(obj.getElement('$attrs').getInteger('barState')).assertEqual(1);
      console.info('[BarStateTest_static_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_static_0050
     * @tc.name      BarStateTest_static_0050
     * @tc.desc      get RichEditor barState: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[BarStateTest_static_0050] START');
      let strJson = inspector.getInspectorByKey('RichEditor_barState_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[BarStateTest_static_0050] BarState: ' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
      expect(obj.getElement('$attrs').getInteger('barState')).assertEqual(1);
      console.info('[BarStateTest_static_0050] END');
      done();
    });
  })
}