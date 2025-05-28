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

      let Row_parent: RectValue = CommonFunc.getComponentRect('Row2');
      let Row_child: RectValue = CommonFunc.getComponentRect('Row1');
      let Row_parent_width = Row_parent.right - Row_parent.left;
      let Row_parent_height = Row_parent.bottom - Row_parent.top;
      let Row_child_width = Row_child.right - Row_child.left;
      let Row_child_height = Row_child.bottom - Row_child.top;
      console.log('[RowMatchParentTest_0100] Row_parent_width is:' + Row_parent_width);
      console.log('[RowMatchParentTest_0100] Row_parent_height is:' + Row_parent_height);
      console.log('[RowMatchParentTest_0100] Row_child_width is:' + Row_child_width);
      console.log('[RowMatchParentTest_0100] Row_child_height is:' + Row_child_height);
      console.log('[RowMatchParentTest_0100] Row_width-v2px(70) is:' + Math.floor(Math.abs(Row_parent_width - Row_child_width - vp2px(70))));
      console.log('[RowMatchParentTest_0100] Row_height-v2px(70) is:' + Math.floor(Math.abs(Row_parent_height - Row_child_height - vp2px(70))));
      
      // padding(20*2) + border(5*2) + safeAreaPadding(10*2)
      expect(Math.floor(Math.abs(Row_parent_width - Row_child_width - vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row_parent_height - Row_child_height - vp2px(70))) <= 1).assertTrue();

      console.info('[RowMatchParentTest_0100] END');
      done();
    });
  })
}