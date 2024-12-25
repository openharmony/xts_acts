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
export default function PolylineInterfaceTest() {
  describe('PolylineInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PolylineInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Polyline/PolylineInterfaceTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PolylineInterfaceTest state pages: " + JSON.stringify(pages));
        if (!("PolylineInterfaceTest" == pages.name)) {
          console.info("get PolylineInterfaceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PolylineInterfaceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PolylineInterfaceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      PolylineInterfaceTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('PolylineInterfaceTest_0100', 0, async (done: Function) => {
      console.info('[PolylineInterfaceTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('PolylineInterface');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PolylineInterfaceTest_0100] width is: " + JSON.stringify(obj.$attrs.width));
      console.info("[PolylineInterfaceTest_0100] height is: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');

      console.info('[PolylineInterfaceTest_0100] END');
      done();
    });
  })
}

