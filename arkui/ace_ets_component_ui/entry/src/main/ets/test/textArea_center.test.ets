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


export default function textArea_center() {
  describe('textArea_center', function () {
    beforeEach(async function (done) {
      console.info("textArea_center beforeEach start");
      let options = {
        uri: 'MainAbility/pages/textArea_center',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea_center state pages: " + JSON.stringify(pages));
        if (!("textArea_center" == pages.name)) {
          console.info("get textArea_center state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textArea_center page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textArea_center page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      // router.back()
      let driver = await UiDriver.create()
      await driver.pressBack();
      console.info("ListItem_Delete_End after each called");
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_TextArea_Center_001
    * @tc.name  : testSearch
    * @tc.desc  : When textArea is in the middle, clicking on the top of the input box triggers the keyboard
    * @tc.level : Level 2
    */
    it('textArea_center_001', 0, async function (done) {

      console.info('[textArea_center_001] START');
      await CommonFunc.sleep(1000);

      console.log('get click before  Initial value')
      let text_00 = CommonFunc.getComponentRect('textArea_center_text_0');
      let text_10 = CommonFunc.getComponentRect('textArea_center_text_10');
      let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');
      let column_01 = CommonFunc.getComponentRect('textArea_center_column_01');

      console.log('assert position')
      let y1 = textArea_01.top

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.click(
        (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45))
      );
      await CommonFunc.sleep(1000);

      console.log('get click after Initial value')
      let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
      let y2 = textArea_02.top
      expect(y1).assertEqual(y2);

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_TextArea_Center_001
    * @tc.name  : testSearch
    * @tc.desc  : When textArea is in the middle, clicking on the middle of the input box triggers the keyboard
    * @tc.level : Level 2
    */
    it('textArea_center_002', 0, async function (done) {

      console.info('[textArea_center_002] START');
      await CommonFunc.sleep(1000);

      console.log('get click before  Initial value')
      let text_00 = CommonFunc.getComponentRect('textArea_center_text_0');
      let text_10 = CommonFunc.getComponentRect('textArea_center_text_10');
      let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');
      let column_01 = CommonFunc.getComponentRect('textArea_center_column_01');

      console.log('assert position')
      let y1 = textArea_01.top

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.click(
        (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /2))
      );
      await CommonFunc.sleep(1000);

      console.log('get click after Initial value')
      let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
      let y2 = textArea_02.top
      expect(y2).assertLess(y1);

      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_TextArea_Center_001
    * @tc.name  : testSearch
    * @tc.desc  : When textArea is in the middle, clicking on the bottom of the input box triggers the keyboard
    * @tc.level : Level 2
    */
    it('textArea_center_003', 0, async function (done) {

      console.info('[textArea_center_003] START');
      await CommonFunc.sleep(1000);

      console.log('get click before  Initial value')
      let text_00 = CommonFunc.getComponentRect('textArea_center_text_0');
      let text_10 = CommonFunc.getComponentRect('textArea_center_text_10');
      let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');
      let column_01 = CommonFunc.getComponentRect('textArea_center_column_01');

      console.log('assert position')
      let y1 = textArea_01.bottom

      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.click(
        (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2)),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 *44))
      );
      await CommonFunc.sleep(1000);

      console.log('get click after Initial value')
      let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
      let y2 = textArea_02.bottom
      expect(y2).assertLess(y1);

      done();
    });


  })
}
