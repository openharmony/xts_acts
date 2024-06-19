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


export default function FocusScopeId3() {
  describe('FocusScopeId3', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId3 state success " + JSON.stringify(pages));
        if (!("FocusScopeId3" == pages.name)) {
          console.info("get FocusScopeId3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId3 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId3 after each called");
    });

    /**
     * @tc.number    FocusScopeId3_0100
     * @tc.name      FocusScopeId3_0100
     * @tc.desc      Test support for directional key focus group penetration ability
     * @tc.level     Level 2
     */
    it('FocusScopeId3_0100', 0, async function (done) {
      console.info('[FocusScopeId3_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('FocusScopeId3_pushPageOne'));
      await btn1.click()
      await CommonFunc.sleep(2000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let bnt1 = await driver.findComponent(ON.id('FocusScopeId3_btn1'));
      let bnt1_isFocusedValue = await bnt1.isFocused()
      expect(bnt1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId3_0100] bnt1 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let bnt2 = await driver.findComponent(ON.id('FocusScopeId3_btn2'));
      let bnt2_isFocusedValue = await bnt2.isFocused()
      expect(bnt2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId3_0100] bnt2 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let bnt3 = await driver.findComponent(ON.id('FocusScopeId3_btn3'));
      let bnt3_isFocusedValue = await bnt3.isFocused()
      expect(bnt3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId3_0100] bnt3 isFocused');

      console.info('[FocusScopeId3_0100] END');
      done();
    });
  })
}

