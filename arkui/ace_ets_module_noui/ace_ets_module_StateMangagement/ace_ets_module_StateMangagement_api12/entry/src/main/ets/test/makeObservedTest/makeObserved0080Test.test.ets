/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function makeObserved0080Test() {
  describe('makeObserved0080Test', () => {
    beforeEach(async (done: Function) => {
      console.info("makeObserved0080Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/makeObserved/makeObserved0080',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get makeObserved0080Test state pages: " + JSON.stringify(pages));
        if (!("makeObserved0080" == pages.name)) {
          console.info("get makeObserved0080Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push makeObserved0080Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push makeObserved0080Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number makeObserved0080Test_01
     * @tc.name makeObserved0080Test_01
     * @tc.desc api
     * @tc.level: Level 0
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('makeObserved0080Test_01', 0, async (done: Function) => {
      await CommonFunc.sleep(1000)

      console.info('makeObserved0080Test_01 START');

      let driver = await Driver.create()
      let textJson = getInspectorByKey('listTest')
      let textJsonObj: ESObject = JSON.parse(textJson);
      let initH = parseInt(textJsonObj.$attrs.height)
      console.info("MR031[makeObserved0080Test_01]: " + parseInt(textJsonObj.$attrs.height));
      let testArr: testType[] = [
        {
          buttonKey: 'buttonChangeDefault',
          key: 'listTest',
          value: initH + 50
        },
        {
          buttonKey: 'buttonSplice',
          key: 'listTest',
          value: initH + 80
        },
        {
          buttonKey: 'buttonUpdate',
          key: 'listTest',
          value: initH + 90
        },
      ]
      for (const item of testArr) {
        let button = await driver.findComponent(ON.id(item.buttonKey));
        await button.click();
        await CommonFunc.sleep(1000)
        let textJson = getInspectorByKey(item.key)
        let textJsonObj: ESObject = JSON.parse(textJson);
        console.info("MR031[makeObserved0080Test_01]: " + item.key + ' : ' + item.value);
        console.info("MR031[makeObserved0080Test_01]: " + parseInt(textJsonObj.$attrs.height));
        expect(parseInt(textJsonObj.$attrs.height)).assertEqual(item.value);
      }
      console.info('makeObserved0080Test_01 END');
      done()
    })

  })
}

interface testType {
  buttonKey: string,
  key: string,
  value: number
}

