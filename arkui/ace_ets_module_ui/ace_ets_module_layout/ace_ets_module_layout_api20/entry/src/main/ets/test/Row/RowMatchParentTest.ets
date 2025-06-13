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

export default function RowMatchParentTest() {
  describe('RowMatchParentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RowMatchParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowMatchParent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowMatchParentTest state pages:" + JSON.stringify(pages));
        if (!("FlexLayoutPolicyPage" == pages.name)) {
          console.info("get RowMatchParentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RowMatchParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowMatchParentTest page error:" + err);
      }
      console.info("RowMatchParentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    it('RowMatchParentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RowMatchParentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let row_parent: RectValue = CommonFunc.getComponentRect('Row2');
      let row_child: RectValue = CommonFunc.getComponentRect('Row1');

      // padding(20) + border(5) + safeAreaPadding(10)
      console.log('[RowMatchParentTest_0100] row_child.left - row_parent.left - vp2px(35) is:' + (row_child.left - row_parent.left - vp2px(35)));
      console.log('[RowMatchParentTest_0100] row_parent.right - row_child.right - vp2px(35) is:' + (row_parent.right - row_child.right - vp2px(35)));
      console.log('[RowMatchParentTest_0100] row_child.top - row_parent.top - vp2px(35) is:' + (row_child.top - row_parent.top - vp2px(35)));
      console.log('[RowMatchParentTest_0100] row_parent.bottom - row_child.bottom - vp2px(35) is:' + (row_parent.bottom - row_child.bottom - vp2px(35)));
      expect(Math.floor(Math.abs(row_child.left - row_parent.left - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(row_parent.right - row_child.right - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(row_child.top - row_parent.top - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(row_parent.bottom - row_child.bottom - vp2px(35))) <= 1).assertTrue();

      console.info('[RowMatchParentTest_0100] END');
      done();
    });
  })
}