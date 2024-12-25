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

export default function RichEditorTransformation005() {
  describe('RichEditorTransformation005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTransformation005 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTransformation/RichEditorTransformation005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTransformation005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTransformation005" == pages.name)) {
          console.info("get RichEditorTransformation005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorTransformation005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTransformation005 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_010
     * @tc.name SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_010
     * @tc.desc SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_010 test
     * @tc.level Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_010', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_010 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorTransformation005'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let getLength = await driver.findComponent(ON.id('getLength'));
      await getLength.click();
      await CommonFunc.sleep(500);
      let length = await driver.findComponent(ON.id('length'));
      let lengthText = await length.getText();
      expect(lengthText).assertEqual('length:10');
      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'));
      await selectAll.click();
      await CommonFunc.sleep(500);
      let cut = await driver.findComponent(ON.text('剪切'));
      await cut.click();
      await CommonFunc.sleep(500);
      let setTypingStyle = await driver.findComponent(ON.id('setTypingStyle'));
      await setTypingStyle.click();
      await CommonFunc.sleep(500);
      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let paste = await driver.findComponent(ON.text('粘贴'));
      await paste.click();
      await CommonFunc.sleep(500);
      let getTypingStyle = await driver.findComponent(ON.id('getTypingStyle'));
      await getTypingStyle.click();
      await CommonFunc.sleep(500);
      let textStyle = await driver.findComponent(ON.id('textStyle'));
      let textStyleText = await textStyle.getText();
      let str = 'textStyle:{"fontColor":"#FF008000","fontSize":30,"fontStyle":1,"fontWeight":12,' +
        '"fontFamily":"Arial","decoration":{"type":1,"color":"#FFFFA500"},"fontFeature":""}';
      expect(textStyleText).assertEqual(str);
      await getLength.click();
      lengthText = await length.getText();
      expect(lengthText).assertEqual('length:6');
      done();
    });

  })
}


