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
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';


export default function springBack() {
  describe('springBack', function () {
    beforeEach(async function (done) {
      console.info("springBack beforeEach start");
      let options = {
        uri: 'MainAbility/pages/bindSheet/springBack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get springBack state pages: " + JSON.stringify(pages));
        if (!("springBack" == pages.name)) {
          console.info("get springBack state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push springBack success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push springBack page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : springBack_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('springBack_0100', 0, async function (done) {
      console.info('springBack_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('RegisterSpringback'));
      await button.click();
      await CommonFunc.sleep(1000);

      let bindSheetButton = CommonFunc.getComponentRect('springBackButton');
      console.log('bindSheetButton.top: ' + bindSheetButton.top + ' bindSheetButton.bottom: ' + bindSheetButton.bottom 
      + ' bindSheetButton.right: ' + bindSheetButton.right + ' bindSheetButton.left: ' + bindSheetButton.left )
      let bindSheetButtonOne = bindSheetButton.right - (bindSheetButton.right - bindSheetButton.left) / 2;
      let bindSheetButtonTwo = bindSheetButton.bottom - (bindSheetButton.bottom - bindSheetButton.top) / 2;
      console.log("bindSheetButtonOne " + bindSheetButtonOne + " bindSheetButtonTwo " + bindSheetButtonTwo)
      await driver.swipe(
        Math.round(bindSheetButtonOne), Math.round(bindSheetButtonTwo), Math.round(bindSheetButtonOne), Math.round(bindSheetButtonTwo + 800)
      );
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('onWillSpringBackWhenDismiss');
      let obj = JSON.parse(strJson);
      console.info("[springBack_0100] component obj is: " + JSON.stringify(obj));
      console.info("[springBack_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("springBack success");

      let strJson2 = getInspectorByKey('Dismiss_3');
      let obj2 = JSON.parse(strJson2);
      console.info("[springBack_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[springBack_0100] title: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("reason: 3");

      console.info('[springBack_0100] END');
      done();
    });


  })
}

