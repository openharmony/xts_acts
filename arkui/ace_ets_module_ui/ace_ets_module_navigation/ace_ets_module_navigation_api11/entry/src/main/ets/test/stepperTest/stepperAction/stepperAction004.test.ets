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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import {Driver, Component, ON} from '@ohos.UiTest';
import Utils from '../../../MainAbility/common/Utils.ets'

export default function stepperAction004() {
  describe('stepperAction004', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperAction/stepperAction004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperAction004 state success " + JSON.stringify(pages));
        if (!("stepperAction004" == pages.name)) {
          console.info("get stepperAction004 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperAction004 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperAction004 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperAction004 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_ACTION_0040
     * @tc.name         stepperAction0040
     * @tc.desic         stepperAction0040
     */
    it('stepperAction0040', 0, async (done: Function) => {
      console.info('stepperAction0040 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let button: Component = await driver.findComponent(ON.type('Button'));
      await driver.delayMs(1000);
      let isFocused001= await button.isFocused()
      await driver.delayMs(1000);
      console.info('isFocused 001：'+isFocused001);
      await driver.delayMs(1000);

      let buttonCom: Component = await driver.findComponent(ON.text('Content1'));
      await driver.delayMs(1000);
      let isFocusedCom001= await buttonCom.isFocused()
      await driver.delayMs(1000);
      console.info('isFocusedCom001：'+isFocusedCom001);

      await driver.triggerKey(2049);
      await driver.delayMs(1000);
      button = await driver.findComponent(ON.type('Button'));
      await driver.delayMs(1000);
      let isFocused002= await button.isFocused()
      await driver.delayMs(1000);
      console.info('isFocused 002：'+isFocused002);

      buttonCom = await driver.findComponent(ON.text('Content1'));
      await driver.delayMs(1000);
      let isFocusedCom002= await buttonCom.isFocused()
      await driver.delayMs(1000);
      console.info('isFocusedCom002：'+isFocusedCom002);


      await driver.triggerKey(2049);
      await driver.delayMs(1000);
      button = await driver.findComponent(ON.type('Button'));
      await driver.delayMs(1000);
      let isFocused003= await button.isFocused()
      await driver.delayMs(1000);
      console.info('isFocused 003：'+isFocused003);

      buttonCom = await driver.findComponent(ON.text('Content1'));
      await driver.delayMs(1000);
      let isFocusedCom003= await buttonCom.isFocused()
      await driver.delayMs(1000);
      console.info('isFocusedCom003：'+isFocusedCom003);

      await driver.triggerKey(2049);
      await driver.delayMs(1000);
      button = await driver.findComponent(ON.type('Button'));
      await driver.delayMs(1000);
      let isFocused004= await button.isFocused()
      await driver.delayMs(1000);
      console.info('isFocused 004：'+isFocused004);

      buttonCom = await driver.findComponent(ON.text('Content1'));
      await driver.delayMs(1000);
      let isFocusedCom004= await buttonCom.isFocused()
      await driver.delayMs(1000);
      console.info('isFocusedCom004：'+isFocusedCom004);

      await driver.triggerKey(2013);
      await driver.delayMs(1000);
      await driver.triggerKey(2013);
      await driver.delayMs(1000);
      await driver.triggerKey(2013);
      await driver.delayMs(1000);
      await driver.triggerKey(2013);
      await driver.delayMs(1000);
      await driver.triggerKey(2012);
      await driver.delayMs(1000);
      await driver.triggerKey(2012);
      await driver.delayMs(1000);
      await driver.triggerKey(2012);
      await driver.delayMs(1000);
      await driver.triggerKey(2012);
      await driver.delayMs(1000);
      await driver.triggerKey(2015);
      await driver.delayMs(1000);
      await driver.triggerKey(2015);
      await driver.delayMs(1000);
      await driver.triggerKey(2015);
      await driver.delayMs(1000);
      await driver.triggerKey(2014);
      await driver.delayMs(1000);
      await driver.triggerKey(2014);
      await driver.delayMs(1000);
      await driver.triggerKey(2014);
      await driver.delayMs(1000);
      await driver.triggerKey(2014);
      await driver.delayMs(1000);
      //expect(isFocused).assertTrue();
      done();
    });
  })
}
