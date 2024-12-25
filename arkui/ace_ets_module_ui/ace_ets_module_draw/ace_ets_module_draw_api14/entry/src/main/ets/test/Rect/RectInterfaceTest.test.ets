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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function RectInterfaceTest() {
  describe('RectInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RectInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Rect/RectInterfaceTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectInterfaceTest state pages: " + JSON.stringify(pages));
        if (!("RectInterfaceTest" == pages.name)) {
          console.info("get RectInterfaceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RectInterfaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectInterfaceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      RectInterfaceTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RectInterfaceTest_0100', 0, async (done: Function) => {
      console.info('[RectInterfaceTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RectInterface');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RectInterfaceTest_0100] width is: " + JSON.stringify(obj.$attrs.width));
      console.info("[RectInterfaceTest_0100] height is: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('50.00vp');

      console.info('[RectInterfaceTest_0100] END');
      done();
    });
  })
}

