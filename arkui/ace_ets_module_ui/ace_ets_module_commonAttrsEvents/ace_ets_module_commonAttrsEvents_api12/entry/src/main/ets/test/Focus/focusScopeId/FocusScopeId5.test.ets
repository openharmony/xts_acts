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


export default function FocusScopeId5() {
  describe('FocusScopeId5', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId5 state success " + JSON.stringify(pages));
        if (!("FocusScopeId5" == pages.name)) {
          console.info("get FocusScopeId5 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId5 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId5 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId5 after each called");
    });

    /**
     * @tc.number    FocusScopeId5_0100
     * @tc.name      FocusScopeId5_0100
     * @tc.desc      Test support for directional key focus group penetration ability
     * @tc.level     Level 2
     */
    it('FocusScopeId5_0100', 0, async function (done) {
      console.info('[FocusScopeId5_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let bnt3_6 = await driver.findComponent(ON.id('FocusScopeId5_btn3_6'));
      let bnt3_6_isFocusedValue = await bnt3_6.isFocused()
      expect(bnt3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_0100] bnt3_6 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let bnt_clearFocus = await driver.findComponent(ON.id('FocusScopeId5_clearFocus'));
      let bnt_clearFocus_isFocusedValue = await bnt_clearFocus.isFocused()
      expect(bnt_clearFocus_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_0100] bnt_clearFocus isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let bnt_requestFocus = await driver.findComponent(ON.id('FocusScopeId5_requestFocus'));
      let bnt_requestFocus_isFocusedValue = await bnt_requestFocus.isFocused()
      expect(bnt_requestFocus_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_0100] bnt_requestFocus isFocused');

      console.info('[FocusScopeId5_0100] END');
      done();
    });
  })
}

