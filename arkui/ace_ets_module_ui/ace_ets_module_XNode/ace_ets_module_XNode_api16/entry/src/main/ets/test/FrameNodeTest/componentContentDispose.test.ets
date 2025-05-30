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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function componentContentDisposeTest() {
  describe('componentContentDisposeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("componentContentDisposeTest_0100 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/componentContentDisposeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get componentContentDisposeTest_0100 state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get componentContentDisposeTest_0100 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push componentContentDisposeTest_0100 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push componentContentDisposeTest_0100 page error:" + err);
      }
      console.info("componentContentDisposeTest_0100 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("componentContentDisposeTest_0100 after each called");
    });

    /**
     * @tc.number    componentContentDisposeTest_0100
     * @tc.name      componentContentDisposeTest_0100
     * @tc.desc      ComponentContent dispose test
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('componentContentDisposeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('componentContentDisposeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('dispose_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('ret_id'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dispose_ret');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[componentContentDisposeTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[componentContentDisposeTest_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('9');
      console.info('[componentContentDisposeTest_0100] END');
      done();
    });
  })
}