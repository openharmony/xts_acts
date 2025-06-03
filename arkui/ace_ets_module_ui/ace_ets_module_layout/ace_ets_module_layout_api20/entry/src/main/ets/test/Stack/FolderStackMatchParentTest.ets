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

      // padding(20) + border(5) + safeAreaPadding(10)
      console.log('[FolderStackMatchParentTest_0100] FolderStack_child.left - FolderStack_parent.left - vp2px(35) is:' + (FolderStack_child.left - FolderStack_parent.left - vp2px(35)));
      console.log('[FolderStackMatchParentTest_0100] FolderStack_parent.right - FolderStack_child.right - vp2px(35) is:' + (FolderStack_parent.right - FolderStack_child.right - vp2px(35)));
      console.log('[FolderStackMatchParentTest_0100] FolderStack_child.top - FolderStack_parent.top - vp2px(35) is:' + (FolderStack_child.top - FolderStack_parent.top - vp2px(35)));
      console.log('[FolderStackMatchParentTest_0100] FolderStack_parent.bottom - FolderStack_child.bottom - vp2px(35) is:' + (FolderStack_parent.bottom - FolderStack_child.bottom - vp2px(35)));
      expect(Math.floor(Math.abs(FolderStack_child.left - FolderStack_parent.left - vp2px(35))) > 1).assertTrue();
      expect(Math.floor(Math.abs(FolderStack_parent.right - FolderStack_child.right - vp2px(35))) > 1).assertTrue();
      expect(Math.floor(Math.abs(FolderStack_child.top - FolderStack_parent.top - vp2px(35))) > 1).assertTrue();
      expect(Math.floor(Math.abs(FolderStack_parent.bottom - FolderStack_child.bottom - vp2px(35))) > 1).assertTrue();

      console.info('[FolderStackMatchParentTest_0100] END');
      done();
    });
  })
}