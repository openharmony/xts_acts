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
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function RichEditorAttributeStrings006() {
  describe('RichEditorAttributeStrings006', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorAttributeStrings006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorAttributeStrings/RichEditorAttributeStrings006',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAttributeStrings006 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAttributeStrings006" == pages.name)) {
          console.info("get RichEditorAttributeStrings006 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorAttributeStrings006 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAttributeStrings006 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0035
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0035
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0035 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0035', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0035 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorAttributeStrings006'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let toStyledString = await driver.findComponent(ON.id('toStyledString'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:01');
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0036
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0036
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0036 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0036', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0036 START');
      let driver = Driver.create();
      let toStyledString = await driver.findComponent(ON.id('toStyledString100'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:');
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0037
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0037
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0037 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0037', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0037 START');
      let driver = Driver.create();
      let toStyledString = await driver.findComponent(ON.id('toStyledString1'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789';
      expect(spansText).assertEqual(str);
      let toStyledString2 = await driver.findComponent(ON.id('toStyledString2'));
      await toStyledString2.click();
      await CommonFunc.sleep(500);
      spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:');
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0038
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0038
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0038 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0038', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0038 START');
      let driver = Driver.create();
      let toStyledString = await driver.findComponent(ON.id('toStyledString3'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789';
      expect(spansText).assertEqual(str);
      done();
    });

  })
}


