/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';


function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function InterstitialDialogActionTest() {

  const SUITE: string = 'InterstitialDialogAction'
  const waitUiReadyMs: number = 500;


  describe('InterstitialDialogActionTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "TestAbility/pages/InterstitialDialogAction",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("InterstitialDialogAction" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((error: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${error.code}, message is ${error.message}`);
          })
         await sleep(2000);
        }
      } catch (err) {

        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number    : ArkUI_InterstitialDialogAction_0001
     * @tc.name      : test initial state
     * @tc.desc      : expect dialog at 88vp to bottom
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('ArkUI_InterstitialDialogAction_0001', 0, async (done: Function) => {
      let CASE = 'ArkUI_InterstitialDialogAction_0001'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'InterstitialDialogAction_Dialog1'
      let strJson = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.bottomOffsetType).assertEqual('BottomOffset.OFFSET_FOR_BAR')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}
