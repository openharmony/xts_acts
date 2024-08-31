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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';
import { accessibility } from '@kit.AccessibilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function accessibilityHoverTest() {
  describe('accessibilityHoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info("accessibilityHoverTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAccessibilityHover/accessibilityHover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get accessibilityHoverTest state pages:" + JSON.stringify(pages));
        if (!("accessibilityHover" == pages.name)) {
          console.info("get accessibilityHoverTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push accessibilityHoverTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push  accessibilityHoverTest page error:" + err);
      }
      console.info("accessibilityHoverTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("accessibilityHoverTest  after each called");
    });

    /**
     * @tc.number
     * @tc.name      accessibilityHoverTest_0010
     * @tc.desc      test hover event when accessiblity function start
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('accessibilityHoverTest_0010', 0, async (done: Function) => {
      console.info('accessibilityHoverTest_0010 START');
      await CommonFunc.sleep(150);
      let status: boolean = accessibility.isOpenAccessibilitySync();
      console.info("the accessibility is open " + status);
      if(status) {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id("hoverButton"));
        await button.click();
        await CommonFunc.sleep(1500);
        await button.doubleClick();
        await CommonFunc.sleep(1500);
        let tt1 = getInspectorByKey('hoverTest1');
        let obj1: ESObject = JSON.parse(tt1);
        console.info('accessibilityHoverTest_0010 obj $attrs content '+ obj1.$attrs.content);
        // check the reponse result
        expect(obj1.$attrs.content).assertEqual("HOVER_ENTER")
        let tt3 = getInspectorByKey('hoverTest3');
        let obj3: ESObject = JSON.parse(tt3);
        console.info('accessibilityHoverTest_0010 obj $attrs content '+ obj3.$attrs.content);
        // check the reponse result
        expect(obj3.$attrs.content).assertEqual("HOVER_EXIT")

      } else {
         expect(true).assertTrue();
      }
      console.info('accessibilityHoverTest_0010  end');
      done();
    });

  })
}
