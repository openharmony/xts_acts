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
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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
export default function richTextJsunitFOURFOUR() {
  describe('richTextJsunitFOURFOUR', () => {
    beforeAll(() => {
      console.info("richTextJsunitFOUR beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richTextJsunitFOUR beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/richText",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get richTextJsunitFOUR state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get richTextJsunitFOUR pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richTextJsunitFOUR page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richTextJsunitFOUR page error:" + err);
      }
      console.info("richTextJsunitFOUR beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richText after each called");
    });

    /**
     * @tc.number RichEditor01_001
     * @tc.name testRichText_static_01
     * @tc.desc RichEditor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testRichText_static_01', Level.LEVEL0, async (done: () => void) => {
      try {
        console.info('[testRichText01] START');
        let strJson: string = inspector.getInspectorByKey('richText');
        console.info('[testRichText01]' + strJson);
        console.info('[testRichText01] END');
      } catch (err) {
        console.error("[testRichText01] error: " + err);
        expect().assertFail();
      }
      done();
    });
  });
}