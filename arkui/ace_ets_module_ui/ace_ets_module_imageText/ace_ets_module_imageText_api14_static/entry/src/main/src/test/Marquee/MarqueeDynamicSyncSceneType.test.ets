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
import { describe, beforeEach, it, expect, Level, beforeAll } from "../../../../hypium/index"
import { Driver, ON, loadAndSetUpUiTest } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  State,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage
} from '@ohos.arkui.stateManagement'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MarqueeDynamicSyncSceneTest() {
  describe('MarqueeDynamicSyncSceneTest', ():void => {
    beforeAll(() => {
      console.info("MarqueeDynamicSyncSceneTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("MarqueeDynamicSyncSceneTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Marquee/MarqueeDynamicSyncSceneType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get MarqueeDynamicSyncSceneTest state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get MarqueeDynamicSyncSceneTest pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push MarqueeDynamicSyncSceneTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarqueeDynamicSyncSceneTest page error:" + err);
      }
      console.info("MarqueeDynamicSyncSceneTest beforeEach end");
    });

    /**
     * @tc.number    MarqueeDynamicSyncSceneTest_static_0010
     * @tc.name      MarqueeDynamicSyncSceneTest_static_0010
     * @tc.desc      test MarqueeDynamicSyncSceneType: ANIMATION
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('MarqueeDynamicSyncSceneTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('MarqueeDynamicSyncSceneTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.type('Button'));
      if (Button != null) {
        Button.click();
        await CommonFunc.sleep(1000);
        console.info("[MarqueeDynamicSyncSceneTest_0010] MarqueeDynamicSyncSceneType:"
          + String(AppStorage.get('MarqueeDynamicSyncSceneType', Type.from<string>())));
        expect(AppStorage.get('MarqueeDynamicSyncSceneType', Type.from<string>())).assertEqual('ANIMATION');
        AppStorage.delete('MarqueeDynamicSyncSceneType')
        console.info('[MarqueeDynamicSyncSceneTest_0010] END');
      }
      done();
    });
  })
}
