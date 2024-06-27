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
import CommonFunc from '../../MainAbility/utils/Common';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function menuItemDivider() {
  describe("menuItemDivider", function () {
    beforeEach(async function (done) {
      console.log("menuItemDivider beforeEach start");
      try {
        router.clear();
        let myPages = router.getState();
        console.info("get menuItemDivider state myPages:" + JSON.stringify(myPages));
        if (!("menuItemDivider" == myPages.name)) {
          console.info("get menuItemDivider myPages.name:" + JSON.stringify(myPages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Menu/menuItemDivider"})
          await CommonFunc.sleep(2000);
          console.info("push menuItemDivider myPage result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuItemDivider myPages error:" + err);
      }
      console.info("menuItemDivider forEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("menuItemDivider after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_001
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_001', 0, async function (done) {
      console.info('[menuItemDivider_001] START');

      await CommonFunc.sleep(1000);
      let myJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj1 = JSON.parse(myJson);
      console.info("[menuItemDivider_001] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.menuItemDivider.strokeWidth).assertEqual('1.5vp');
      console.info('[menuItemDivider_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_002
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_002', 0, async function (done){
      console.info('[menuItemDivider_002] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(strJson);
      console.info("[menuItemDivider_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.menuItemDivider.color).assertEqual('Color.Pink');
      console.info('[menuItemDivider_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_003
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_003', 0, async function (done) {
      console.info('[menuItemDivider_003] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(strJson);
      console.info("[menuItemDivider_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.menuItemDivider.startMargin).assertEqual('2vp');
      console.info('[menuItemDivider_003] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Common_menuItemDivider_004
     * @tc.desc      menuItemDivider test
     * @tc.level     Level 3
     * @tc.type
     */

    it('menuItemDivider_004', 0, async function (done) {
      console.info('[menuItemDivider_004] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(strJson);
      console.info("[menuItemDivider_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.menuItemDivider.endMargin).assertEqual('2vp');
      console.info('[menuItemDivider_004] END');
      done();
    });

  })
}