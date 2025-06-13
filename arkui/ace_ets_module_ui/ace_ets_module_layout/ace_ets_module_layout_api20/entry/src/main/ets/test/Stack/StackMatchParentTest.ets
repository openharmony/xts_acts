/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackMatchParentTest() {
  describe('StackMatchParentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackMatchParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackMatchParent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackMatchParentTest state pages:" + JSON.stringify(pages));
        if (!("FlexLayoutPolicyPage" == pages.name)) {
          console.info("get StackMatchParentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackMatchParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackMatchParentTest page error:" + err);
      }
      console.info("StackMatchParentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    it('StackMatchParentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackMatchParentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let stack_parent: RectValue = CommonFunc.getComponentRect('Stack2');
      let stack_child: RectValue = CommonFunc.getComponentRect('Stack1');

      // padding(20) + border(5) + safeAreaPadding(10)
      console.log('[StackMatchParentTest_0100] stack_child.left - stack_parent.left - vp2px(35) is:' + (stack_child.left - stack_parent.left - vp2px(35)));
      console.log('[StackMatchParentTest_0100] stack_parent.right - stack_child.right - vp2px(35) is:' + (stack_parent.right - stack_child.right - vp2px(35)));
      console.log('[StackMatchParentTest_0100] stack_child.top - stack_parent.top - vp2px(35) is:' + (stack_child.top - stack_parent.top - vp2px(35)));
      console.log('[StackMatchParentTest_0100] stack_parent.bottom - stack_child.bottom - vp2px(35) is:' + (stack_parent.bottom - stack_child.bottom - vp2px(35)));
      expect(Math.floor(Math.abs(stack_child.left - stack_parent.left - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(stack_parent.right - stack_child.right - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(stack_child.top - stack_parent.top - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(stack_parent.bottom - stack_child.bottom - vp2px(35))) <= 1).assertTrue();

      console.info('[StackMatchParentTest_0100] END');
      done();
    });
  })
}