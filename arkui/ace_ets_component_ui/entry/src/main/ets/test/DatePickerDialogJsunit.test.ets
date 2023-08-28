/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function DatePickerDialogJsunit() {
  describe('DatePickerDialogJsunit', function () {
    beforeEach(async function (done) {
      console.info("DatePickerDialogJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/DatePickerDialogOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDialogJsunit state pages: " + JSON.stringify(pages));
        if (!("DatePickerDialogOptions" == pages.name)) {
          console.info("get DatePickerDialogJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDialogJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDialogJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    it('DatePickerDialogJsunit_0100', 0, async function (done) {

      console.info('DatePickerDialogJsunit_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('DatePickerDialog');
      let obj = JSON.parse(strJson);
      console.info("[DatePickerDialogJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[DatePickerDialogJsunit_0100] alignment:" + JSON.stringify(obj.$attrs.alignment));
      console.info("[DatePickerDialogJsunit_0100] offset:" + JSON.stringify(obj.$attrs.offset));
      console.info("[DatePickerDialogJsunit_0100] maskRect:" + JSON.stringify(obj.$attrs.maskRect));
      console.info("[DatePickerDialogJsunit_0100] selected:" + JSON.stringify(obj.$attrs.selected));
      console.info("[DatePickerDialogJsunit_0100] showTime:" + JSON.stringify(obj.$attrs.showTime));
      expect(obj.$attrs.selected).assertEqual("2023-7-24");
      expect(obj.$attrs.showTime).assertEqual(true);

      console.info('[DatePickerDialogJsunit_0100] END');
      done();
    });

  })
}
