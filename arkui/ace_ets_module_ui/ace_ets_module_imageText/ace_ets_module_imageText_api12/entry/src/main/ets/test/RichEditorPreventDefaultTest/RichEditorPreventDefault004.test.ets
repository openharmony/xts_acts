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

export default function RichEditorPreventDefault004() {
  describe('RichEditorPreventDefault004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPreventDefault004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPreventDefault004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault004" == pages.name)) {
          console.info("get RichEditorPreventDefault004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1000);
          console.info("push RichEditorPreventDefault004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0005 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorPreventDefault004'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(100);

      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);

      let callClick = await driver.findComponent(ON.id('callClick'));
      let callClickText = await callClick.getText();
      await CommonFunc.sleep(100);
      expect(callClickText).assertEqual('callClick:false');

      let callLongPress = await driver.findComponent(ON.id('callLongPress'));
      let callLongPressText = await callLongPress.getText();
      await CommonFunc.sleep(100);
      expect(callLongPressText).assertEqual('callLongPress:true');

      let selectAll = await driver.findComponent(ON.text('全选'));
      await selectAll.click();
      await CommonFunc.sleep(100);
      let cut = await driver.findComponent(ON.text('剪切'));
      await cut.click();
      await CommonFunc.sleep(100);
      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);
      let paste = await driver.findComponent(ON.text('粘贴'));
      await paste.click();
      await CommonFunc.sleep(100);

      let boundsCenter = await rich.getBoundsCenter();
      await CommonFunc.sleep(100);
      await driver.longClick(boundsCenter.x, boundsCenter.y);
      await CommonFunc.sleep(100);
      selectAll = await driver.findComponent(ON.text('全选'));
      await selectAll.click();
      await CommonFunc.sleep(100);
      let copy = await driver.findComponent(ON.text('复制'));
      await copy.click();
      await CommonFunc.sleep(100);
      await driver.longClick(boundsCenter.x, boundsCenter.y);
      await CommonFunc.sleep(100);
      paste = await driver.findComponent(ON.text('粘贴'));
      await paste.click();
      await CommonFunc.sleep(100);
      done();
    });

  })
}


