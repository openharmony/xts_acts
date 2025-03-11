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
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import router from '@ohos.router';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

  export default function CalendarPickerOnChangeModifierJsunit() {
    describe('calendarPickerOnChangeModifierTest', () => {
      beforeEach(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/CalendarPicker/calendarPickerOnChangeModifier',
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info("get calendarPickerOnChangeModifier state success " + JSON.stringify(pages));
          if (!("calendarPickerOnChangeModifier" == pages.name)) {
            console.info("get calendarPickerOnChangeModifier state success " + JSON.stringify(pages.name));
            await router.pushUrl(options);
            await Utils.sleep(1000);
          }
        } catch (err) {
          console.error("push calendarPickerOnChangeModifier page error: " + err);
        }
        done();
      });
  
   /* *
    * @tc.number: CalendarPicker_OnChange_Modifier_001
    * @tc.name  : CalendarPicker_OnChange_Modifier_001
    * @tc.desc  : To test the OnChange
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
   it('CalendarPicker_OnChange_Modifier_001', 0, async (done: Function) => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      console.info("CalendarPicker_OnChange_Modifier_001 click");
      let Rect = Utils.getComponentRect('calendarPicker')
      let top = Rect.top
      let bottom = Rect.bottom
      let right = Rect.right
      let middle = (bottom-top) / 2 + top
      let left = Rect.left
      await driver.click(Math.round(globalThis.winLeft+right-top/2+top/3),  Math.round(globalThis.winTop+middle-top))
      await Utils.sleep(2000)
      await driver.click(Math.round(globalThis.winLeft+right*2-middle),  Math.round(globalThis.winTop+middle-top))
      await Utils.sleep(2000)
      let strJsonNew:string = getInspectorByKey('onChangeOff');

      console.info("CalendarPicker_OnChange_Modifier_001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('true');
      console.info('CalendarPicker_OnChange_Modifier_001 END');
      done();
  });
  })
}