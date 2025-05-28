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

export default function ColumnMatchParentTest() {
  describe('ColumnMatchParentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnMatchParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnMatchParent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnMatchParentTest state pages:" + JSON.stringify(pages));
        if (!("FlexLayoutPolicyPage" == pages.name)) {
          console.info("get ColumnMatchParentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnMatchParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnMatchParentTest page error:" + err);
      }
      console.info("ColumnMatchParentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    it('ColumnMatchParentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnMatchParentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let Column_parent: RectValue = CommonFunc.getComponentRect('Column2');
      let Column_child: RectValue = CommonFunc.getComponentRect('Column1');
      let Column_parent_width = Column_parent.right - Column_parent.left;
      let Column_parent_height = Column_parent.bottom - Column_parent.top;
      let Column_child_width = Column_child.right - Column_child.left;
      let Column_child_height = Column_child.bottom - Column_child.top;
      console.log('[ColumnMatchParentTest_0100] Column_parent_width is:' + Column_parent_width);
      console.log('[ColumnMatchParentTest_0100] Column_parent_height is:' + Column_parent_height);
      console.log('[ColumnMatchParentTest_0100] Column_child_width is:' + Column_child_width);
      console.log('[ColumnMatchParentTest_0100] Column_child_height is:' + Column_child_height);
      console.log('[ColumnMatchParentTest_0100] Column_width-v2px(70) is:' + Math.floor(Math.abs(Column_parent_width - Column_child_width - vp2px(70))));
      console.log('[ColumnMatchParentTest_0100] Column_height-v2px(70) is:' + Math.floor(Math.abs(Column_parent_height - Column_child_height - vp2px(70))));
      
      // padding(20*2) + border(5*2) + safeAreaPadding(10*2)
      expect(Math.floor(Math.abs(Column_parent_width - Column_child_width - vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_parent_height - Column_child_height - vp2px(70))) <= 1).assertTrue();

      console.info('[ColumnMatchParentTest_0100] END');
      done();
    });
  })
}