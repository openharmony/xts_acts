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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@system.router';
import CommonFunc from '../MainAbility/utils/Common';

export default function getContextMenuController() {

  describe('getContextMenuController', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/getContextMenuController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getContextMenuController state pages: " + JSON.stringify(pages));
        if (!("getContextMenuController" == pages.name)) {
          console.info("get getContextMenuController state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getContextMenuController success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getContextMenuController page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("getContextMenuController after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      testGetImageAttr010
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */

    it('getContextMenuController_0100', 0, async function (done) {
      console.info('getContextMenuController_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let closeBtn = await driver.findComponent(ON.id('CloseMenu1'));
      await closeBtn.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('TextContextMenu1'));
      await button1.longClick();
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('CloseMenu1');
      let obj = JSON.parse(strJson);
      console.info("[link1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[link1_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('启动定时器');
      await CommonFunc.sleep(1000);
      console.info('[getContextMenuController_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
