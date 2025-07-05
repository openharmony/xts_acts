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
import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index.ets"
import CommonFunc from '../../../ets/MainAbility/common/Common';
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

export default function ImageLoadResultTest() {
  describe('ImageLoadResultTest', (): void => {
    beforeAll(async (): Promise<void>  => {
      console.info("ImageLoadResultTest beforeAll start");

      try{
        let p = new Promise<void>(async (resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
          let timer: number;
          timer = setTimeout(() => {
            reject(new Error('execute timeout ' + 1000 + 'ms'));
          }, 4000);
        })
        await p
      }catch(e: Error){
        console.log("ImageLoadResultTest beforeAll start error " + e)
      }
      // await UtilsTest.loadAndSetUpUiTest();
      console.info("ImageLoadResultTest beforeAll start22");
      // await UtilsTest.sleep(10000)
      console.info("ImageLoadResultTest beforeAll start33");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
      console.info("ImageLoadResultTest beforeAll start44");
      // await UtilsTest.sleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageLoadResultTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ImageSpan/ImageLoadResult",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ImageLoadResultTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ImageLoadResultTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageLoadResultTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageLoadResultTest page error:" + err);
      }
      console.info("ImageLoadResultTest beforeEach end");
    });

    /**
     * @tc.number    SUB_ACE_ImageLoadResultTest_0010
     * @tc.name      ImageLoadResultTest_0010
     * @tc.desc      test ImageSpan ImageLoadResult: width and height
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageLoadResultTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageLoadResultTest_0010 START');
      await CommonFunc.sleep(500);
      console.info("[ImageLoadResultTest_0010] width:" + JSON.stringify(AppStorage.get('ImageLoadResult.width', Type.from<number>())));
      console.info("[ImageLoadResultTest_0010] height:" + JSON.stringify(AppStorage.get('ImageLoadResult.height', Type.from<number>())));
      expect(AppStorage.get('ImageLoadResult.width', Type.from<number>())).assertEqual(AppStorage.get('ImageLoadResult.height', Type.from<number>()));
      AppStorage.delete('ImageLoadResult.width')
      AppStorage.delete('ImageLoadResult.height')
      console.info('[ImageLoadResultTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ImageLoadResultTest_0020
     * @tc.name      ImageLoadResultTest_0020
     * @tc.desc      test ImageSpan ImageLoadResult: componentWidth and componentHeight
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageLoadResultTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageLoadResultTest_0020] START');
      await CommonFunc.sleep(500);
      console.info("[ImageLoadResultTest_0020] componentWidth:"
        + JSON.stringify(AppStorage.get('ImageLoadResult.componentWidth', Type.from<number>())));
      console.info("[ImageLoadResultTest_0020] componentHeight:"
        + JSON.stringify(AppStorage.get('ImageLoadResult.componentHeight', Type.from<number>())));
      expect(AppStorage.get('ImageLoadResult.componentWidth', Type.from<number>())).assertEqual(AppStorage.get('ImageLoadResult.componentHeight', Type.from<number>()));
      AppStorage.delete('ImageLoadResult.componentWidth')
      AppStorage.delete('ImageLoadResult.componentHeight')
      console.info('[ImageLoadResultTest_0020] END');
      done();
    });
  })
}
