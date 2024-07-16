/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../../MainAbility/common/Utils.ets'
import {Driver, Component, ON} from '@ohos.UiTest';

export default function stepperAction007() {
  describe('stepperAction007', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperAction/stepperAction007',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperAction007 state success " + JSON.stringify(pages));
        if (!("stepperAction007" == pages.name)) {
          console.info("get stepperAction007 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperAction007 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperAction007 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperAction007 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_ACTION_0070
     * @tc.name         stepperAction0070
     * @tc.desic         stepperAction0070
     */
    it('stepperAction0070', 0, async (done: Function) => {
      console.info('stepperAction0070 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('Page One'));
      let button: Component = await driver.findComponent(ON.text('Next1111111111111111111111111111111111111111111111111'));
      await button.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('Page Two'));
      let button1: Component = await driver.findComponent(ON.text('Next2222222222222222222222222222222222222222222222222'));
      await button1.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('Page Three'));
      let button2: Component = await driver.findComponent(ON.text('Previous2222222222222222222222222222222222222222222222222222'));
      await button2.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('Page Two'));
      let button3: Component = await driver.findComponent(ON.text('Previous111111111111111111111111111111111111111111111111111'));
      await button3.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('Page One'));
      done();
    });
  })
}
