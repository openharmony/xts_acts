/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ReplaceDestination1Test() {
  describe('ReplaceDestination1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("ReplaceDestination1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ReplaceDestination1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ReplaceDestination1 state pages:" + JSON.stringify(pages));
        if (!("ReplaceDestination1" == pages.name)) {
          console.info("get ReplaceDestination1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReplaceDestination1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReplaceDestination1 page error:" + err);
      }
      console.info("ReplaceDestination1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ReplaceDestination1 after each called");
    });


    /**
     * @tc.number    ReplaceDestination1_0100
     * @tc.name      ReplaceDestination1_0100
     * @tc.desc      Test ReplaceDestination1
     * @tc.level     Level 2
     */
    it('ReplaceDestination1_0100', 0, async (done: Function) => {
      console.info('ReplaceDestination1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pageOneId'));
      await btn1.click()
      console.info('[ReplaceDestination1_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('id06');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ReplaceDestination1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[ReplaceDestination1_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100006');

      console.info('ReplaceDestination1_0100 END');
      done();
    });

  })
}