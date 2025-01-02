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
import {UiComponent, MouseButton, Driver, UiDriver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function OnDoubleClickTest() {
  describe('OnDoubleClickTest', () => {
    beforeEach(async (done: Function) => {
      console.info("OnDoubleClickTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onDoubleClick',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnDoubleClickTest state pages: " + JSON.stringify(pages));
        if (!("onDoubleClick" == pages.name)) {
          console.info("get OnDoubleClickTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OnDoubleClickTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnDoubleClickTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_OnDoubleClickTest_0010
     * @tc.name      OnDoubleClickTest_0010
     * @tc.desc      set api RichEditor: onDoubleClick
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('OnDoubleClickTest_0010', 0, async (done: Function) => {
      console.info('OnDoubleClickTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let image = await driver.findComponent(ON.type('Image'));
      await image.doubleClick();
      let Obj = CommonFunc.getComponentRectOnScreen('onDoubleClick_id');
      await driver.mouseDoubleClick({x:Math.round((Obj.right + Obj.left) / 2), y:Math.round((Obj.top + Obj.bottom) / 2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onDoubleClick_text');
      console.log('OnDoubleClickTest_0010', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onDoubleClick succ');
      console.info('[OnDoubleClickTest_0010] END');
      done();
    });
  })
}

