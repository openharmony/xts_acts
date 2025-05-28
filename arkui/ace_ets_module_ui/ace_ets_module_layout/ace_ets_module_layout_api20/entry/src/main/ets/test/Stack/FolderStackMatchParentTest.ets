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

export default function FolderStackMatchParentTest() {
  describe('FolderStackMatchParentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FolderStackMatchParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/FolderStackMatchParent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FolderStackMatchParentTest state pages:" + JSON.stringify(pages));
        if (!("FlexLayoutPolicyPage" == pages.name)) {
          console.info("get FolderStackMatchParentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FolderStackMatchParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FolderStackMatchParentTest page error:" + err);
      }
      console.info("FolderStackMatchParentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    it('FolderStackMatchParentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FolderStackMatchParentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let FolderStack_parent: RectValue = CommonFunc.getComponentRect('FolderStack2');
      let FolderStack_child: RectValue = CommonFunc.getComponentRect('FolderStack1');
      let FolderStack_parent_width = FolderStack_parent.right - FolderStack_parent.left;
      let FolderStack_parent_height = FolderStack_parent.bottom - FolderStack_parent.top;
      let FolderStack_child_width = FolderStack_child.right - FolderStack_child.left;
      let FolderStack_child_height = FolderStack_child.bottom - FolderStack_child.top;
      console.log('[FolderStackMatchParentTest_0100] FolderStack_parent_width is:' + FolderStack_parent_width);
      console.log('[FolderStackMatchParentTest_0100] FolderStack_parent_height is:' + FolderStack_parent_height);
      console.log('[FolderStackMatchParentTest_0100] FolderStack_child_width is:' + FolderStack_child_width);
      console.log('[FolderStackMatchParentTest_0100] FolderStack_child_height is:' + FolderStack_child_height);
      console.log('[FolderStackMatchParentTest_0100] FolderStack_width-v2px(70) is:' + Math.floor(Math.abs(FolderStack_parent_width - FolderStack_child_width - vp2px(70))));
      console.log('[FolderStackMatchParentTest_0100] FolderStack_height-v2px(70) is:' + Math.floor(Math.abs(FolderStack_parent_height - FolderStack_child_height - vp2px(70))));
      
      // padding(20*2) + border(5*2) + safeAreaPadding(10*2)
      expect(Math.floor(Math.abs(FolderStack_parent_width - FolderStack_child_width - vp2px(70))) > 1).assertTrue();
      expect(Math.floor(Math.abs(FolderStack_parent_height - FolderStack_child_height - vp2px(70))) > 1).assertTrue();

      console.info('[FolderStackMatchParentTest_0100] END');
      done();
    });
  })
}