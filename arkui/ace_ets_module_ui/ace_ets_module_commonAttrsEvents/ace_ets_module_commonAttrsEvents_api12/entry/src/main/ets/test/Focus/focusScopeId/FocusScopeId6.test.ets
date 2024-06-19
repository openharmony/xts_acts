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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function FocusScopeId6() {
  describe('FocusScopeId6', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId6 state success " + JSON.stringify(pages));
        if (!("FocusScopeId6" == pages.name)) {
          console.info("get FocusScopeId6 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId6 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId6 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId6 after each called");
    });

    /**
     * @tc.number    FocusScopeId6_0100
     * @tc.name      FocusScopeId6_0100
     * @tc.desc      Test support for directional key focus group penetration ability
     * @tc.level     Level 2
     */
    it('FocusScopeId6_0100', 0, async function (done) {
      console.info('[FocusScopeId6_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let bnt1_1 = await driver.findComponent(ON.id('FocusScopeId6_btn1_1'));
      let bnt1_1_isFocusedValue = await bnt1_1.isFocused()
      expect(bnt1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_0100] bnt1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_del = await driver.findComponent(ON.id('FocusScopeId6_btn_del'));
      let btn_del_isFocusedValue = await btn_del.isFocused()
      expect(btn_del_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_0100] btn_del isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2 = await driver.findComponent(ON.id('FocusScopeId6_btn1_2'));
      let btn1_2_isFocusedValue = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_0100] btn1_2 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let bnt_btn = await driver.findComponent(ON.id('FocusScopeId6_btn_btn'));
      let bnt_btn_isFocusedValue = await bnt_btn.isFocused()
      expect(bnt_btn_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId6_0100] bnt_btn isFocused');

      console.info('[FocusScopeId6_0100] END');
      done();
    });
  })
}

