/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function Grid_RowCol_cellLength() {
  describe('Grid_RowCol_cellLengthTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_cellLengthTest beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_cellLength",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_cellLength state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_cellLength" == pages.name)) {
          console.info("get Grid_RowCol_cellLength pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_cellLength page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_cellLength page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_RowCol_cellLengthTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_cellLength after each called")
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_1100
     * @tc.name      testGridRowColGridCellLength
     * @tc.desc      The Grid layout cellLength property does not take effect
     */
    it('testGridRowColGridCellLength', 0, async function (done) {
      console.info('[testGridRowColGridCellLength] START');
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_cellLength_01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      let Grid_RowCol_cellLength_011 = CommonFunc.getComponentRect('Grid_RowCol_cellLength_011');
      let Grid_RowCol_cellLength_012 = CommonFunc.getComponentRect('Grid_RowCol_cellLength_012');
      let Grid_RowCol_cellLength_013 = CommonFunc.getComponentRect('Grid_RowCol_cellLength_013');
      let Grid_RowCol_cellLength_014 = CommonFunc.getComponentRect('Grid_RowCol_cellLength_014');
      let Grid_RowCol_cellLength_01 = CommonFunc.getComponentRect('Grid_RowCol_cellLength_01');
      expect(Grid_RowCol_cellLength_011.left).assertEqual(Grid_RowCol_cellLength_01.left);
      expect(Grid_RowCol_cellLength_013.left).assertEqual(Grid_RowCol_cellLength_01.left);

      expect(Grid_RowCol_cellLength_011.right).assertEqual(Grid_RowCol_cellLength_012.left);
      expect(Grid_RowCol_cellLength_013.right).assertEqual(Grid_RowCol_cellLength_014.left);

      expect(Grid_RowCol_cellLength_012.right).assertEqual(Grid_RowCol_cellLength_01.right);
      expect(Grid_RowCol_cellLength_014.right).assertEqual(Grid_RowCol_cellLength_01.right);

      expect(Grid_RowCol_cellLength_011.top).assertEqual(Grid_RowCol_cellLength_01.top);
      expect(Grid_RowCol_cellLength_012.top).assertEqual(Grid_RowCol_cellLength_01.top);

      expect(Grid_RowCol_cellLength_011.bottom).assertEqual(Grid_RowCol_cellLength_013.top);
      expect(Grid_RowCol_cellLength_012.bottom).assertEqual(Grid_RowCol_cellLength_014.top);

      expect(Grid_RowCol_cellLength_013.bottom).assertEqual(Grid_RowCol_cellLength_01.bottom);
      expect(Grid_RowCol_cellLength_014.bottom).assertEqual(Grid_RowCol_cellLength_01.bottom);


      expect(Math.round(Grid_RowCol_cellLength_011.right - Grid_RowCol_cellLength_011.left)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_cellLength_012.right - Grid_RowCol_cellLength_012.left)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_cellLength_013.right - Grid_RowCol_cellLength_013.left)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_cellLength_014.right - Grid_RowCol_cellLength_014.left)).assertEqual(vp2px(150));

      expect(Math.round(Grid_RowCol_cellLength_011.bottom - Grid_RowCol_cellLength_011.top)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_cellLength_012.bottom - Grid_RowCol_cellLength_012.top)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_cellLength_013.bottom - Grid_RowCol_cellLength_013.top)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_cellLength_014.bottom - Grid_RowCol_cellLength_014.top)).assertEqual(vp2px(150));
      console.info('[testGridRowColGridCellLength] END');
      done();
    });
  })
}
