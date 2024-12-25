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
import Utils from '../../MainAbility/common/Utils';

export default function RichEditorStabillity002() {
  describe('RichEditorStabillity002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorStabillity/RichEditorStabillity002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStabillity002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorStabillity002" == pages.name)) {
          console.info("get RichEditorStabillity002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorStabillity002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStabillity002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0002
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0002
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0002 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0002', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0002 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity002'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'));
      await selectAll.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      getPosition.click();
      await CommonFunc.sleep(500);
      let pointPosition = await driver.findComponent(ON.id('pointPosition'));
      let pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(500);
      expect(pointPositionText).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0003
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0003
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0003 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0003', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0003 START');
      let driver = Driver.create();
      let updateSpanStyles = await driver.findComponent(ON.id('UpdateSpanStyles'));
      updateSpanStyles.click();
      await CommonFunc.sleep(2000);
      let getSpans = await driver.findComponent(ON.id('getSpans'));
      getSpans.click();
      await CommonFunc.sleep(500);
      let style = await driver.findComponent(ON.id('style'));
      let styleText = await style.getText();
      await CommonFunc.sleep(500);
      let styles = '"textStyle":{"fontColor":"#FF0000FF","fontSize":30,"fontStyle":1,"fontWeight":11,' +
        '"fontFamily":"' + Utils.FONT_FAMILY + '","decoration":{"type":3,"color":"#FF000000","style":0}';
      expect(styleText).assertContain(styles);
      done();
    });

  })
}


