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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
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

export default function SearchFontFeatureTest() {
  describe('SearchFontFeatureTest', (): void => {
    beforeAll(() => {
      console.info("SearchFontFeatureTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchFontFeatureTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchFontFeature",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SearchFontFeatureTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get SearchFontFeatureTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SearchFontFeatureTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchFontFeatureTest page error:" + err);
      }
      console.info("SearchFontFeatureTest beforeEach end");
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0010
     * @tc.name      SearchFontFeatureTest_0010
     * @tc.desc      test Search fontFeature: on
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SearchFontFeatureTest_0010] START');
      let strJson:string = inspector.getInspectorByKey('Search_fontFeature_on');
      console.info('[SearchFontFeatureTest_0010] Search_fontFeature_on: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchFontFeatureTest_0010] fontFeature: ' + obj.getElement('$attrs').getString('fontFeature'));
      expect(obj.getElement('$attrs').getString('fontFeature')).assertEqual('"ss01" on');
      console.info('[SearchFontFeatureTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0020
     * @tc.name      SearchFontFeatureTest_0020
     * @tc.desc      set Search fontFeature: fontFeature.Off
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SearchFontFeatureTest_0020] START');
      let strJson = inspector.getInspectorByKey('Search_fontFeature_off');
      console.info('[SearchFontFeatureTest_0020] fontFeature: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchFontFeatureTest_0020] fontFeature: ' + obj.getElement('$attrs').getString('fontFeature'));
      expect(obj.getElement('$attrs').getString('fontFeature')).assertEqual('"ss01" off');
      console.info('[SearchFontFeatureTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0030
     * @tc.name      SearchFontFeatureTest_0030
     * @tc.desc      set Search fontFeature: default
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_static_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SearchFontFeatureTest_0030] START');
      let strJson = inspector.getInspectorByKey('Search_fontFeature_default');
      console.info('[SearchFontFeatureTest_0030] Search_fontFeature_default: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchFontFeatureTest_0030] fontFeature: ' + obj.getElement('$attrs').getString('fontFeature'));
      expect(obj.getElement('$attrs').getString('fontFeature')).assertEqual('');
      console.info('[SearchFontFeatureTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0040
     * @tc.name      SearchFontFeatureTest_0040
     * @tc.desc      set Search fontFeature: undefined
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_static_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SearchFontFeatureTest_0040] START');
      let strJson = inspector.getInspectorByKey('Search_fontFeature_undefined');
      console.info('[SearchFontFeatureTest_0040] fontFeature: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SearchFontFeatureTest_0040] fontFeature: ' + obj.getElement('$attrs').getString('fontFeature'));
      expect(obj.getElement('$attrs').getString('fontFeature')).assertEqual('');
      console.info('[SearchFontFeatureTest_0040] END');
      done();
    });
  })
}