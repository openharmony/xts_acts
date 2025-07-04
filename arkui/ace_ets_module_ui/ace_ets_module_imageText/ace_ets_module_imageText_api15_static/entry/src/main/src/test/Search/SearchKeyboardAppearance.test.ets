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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router'
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

export default function SearchKeyboardAppearanceTest() {
  describe('SearchKeyboardAppearanceTest', (): void => {
    beforeAll(() => {
      console.info("SearchKeyboardAppearanceTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchKeyboardAppearance",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SearchKeyboardAppearanceTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SearchKeyboardAppearanceTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SearchKeyboardAppearanceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchKeyboardAppearanceTest page error:" + err);
      }
      console.info("SearchKeyboardAppearanceTest beforeEach end");
    });

    /**
     * @tc.number   SUB_ACE_Search_KeyboardAppearanceTest_0010
     * @tc.name     SearchKeyboardAppearanceTest_static_0010
     * @tc.desc     set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:   Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Search_KeyboardAppearance_NONE_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchKeyboardAppearanceTest_0010] component obj is: " + obj.getElement('$attrs').getInteger('keyboardAppearance'));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[SearchKeyboardAppearanceTest_0010] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_Search_KeyboardAppearanceTest_0020
     * @tc.name     SearchKeyboardAppearanceTest_static_0020
     * @tc.desc     set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:   Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_0020] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Search_KeyboardAppearance_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchKeyboardAppearanceTest_0020] component obj is: " + obj.getElement('$attrs').getInteger('keyboardAppearance'));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(1);
      console.info('[SearchKeyboardAppearanceTest_0020] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_Search_KeyboardAppearanceTest_0030
     * @tc.name     SearchKeyboardAppearanceTest_static_0030
     * @tc.desc     set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:   Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_0030] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Search_KeyboardAppearance_LIGHT_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchKeyboardAppearanceTest_0030] component obj is: " + obj.getElement('$attrs').getInteger('keyboardAppearance'));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(2);
      console.info('[SearchKeyboardAppearanceTest_0030] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_Search_KeyboardAppearanceTest_0040
     * @tc.name     SearchKeyboardAppearanceTest_static_0040
     * @tc.desc     set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:   Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_0040] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Search_KeyboardAppearance_DARK_IMMERSIVE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchKeyboardAppearanceTest_0040] component obj is: " + obj.getElement('$attrs').getInteger('keyboardAppearance'));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(3);
      console.info('[SearchKeyboardAppearanceTest_0040] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_Search_KeyboardAppearanceTest_0050
     * @tc.name     SearchKeyboardAppearanceTest_static_0050
     * @tc.desc     set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:   Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_static_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_0050] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Search_KeyboardAppearance_DEFAULT');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchKeyboardAppearanceTest_0050] component obj is: " + obj.getElement('$attrs').getInteger('keyboardAppearance'));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[SearchKeyboardAppearanceTest_0050] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_Search_KeyboardAppearanceTest_0060
     * @tc.name     SearchKeyboardAppearanceTest_static_0060
     * @tc.desc     set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:   Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_static_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SearchKeyboardAppearanceTest_0060] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Search_KeyboardAppearance_UNDEFINED');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchKeyboardAppearanceTest_0060] component obj is: " + obj.getElement('$attrs').getInteger('keyboardAppearance'));
      expect(obj.getElement('$attrs').getInteger('keyboardAppearance')).assertEqual(0);
      console.info('[SearchKeyboardAppearanceTest_0060] END');
      done();
    });
  })
}

