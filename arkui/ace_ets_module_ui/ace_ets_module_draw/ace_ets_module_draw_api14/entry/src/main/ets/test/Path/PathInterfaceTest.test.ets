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
export default function PathInterfaceTest() {
  describe('PathInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PathInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Path/PathInterfaceTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PathInterfaceTest state pages: " + JSON.stringify(pages));
        if (!("PathInterfaceTest" == pages.name)) {
          console.info("get PathInterfaceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PathInterfaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PathInterfaceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      PathInterfaceTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('PathInterfaceTest_0100', 0, async (done: Function) => {
      console.info('[PathInterfaceTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('PathInterface');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PathInterfaceTest_0100] obj is: " + JSON.stringify(obj));
      console.info("[PathInterfaceTest_0100] width is: " + JSON.stringify(obj.$attrs.width));
      console.info("[PathInterfaceTest_0100] height is: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.width).assertEqual('600.00vp');
      expect(obj.$attrs.height).assertEqual('10.00vp');

      console.info('[PathInterfaceTest_0100] END');
      done();
    });
  })
}

