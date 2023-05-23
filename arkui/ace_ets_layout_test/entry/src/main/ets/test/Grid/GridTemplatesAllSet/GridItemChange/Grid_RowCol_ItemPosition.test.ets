
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function grid_RowCol_ItemPositionTest() {
  describe('Grid_RowCol_ItemPositionTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_ItemPositionTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPosition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemPosition state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemPosition" == pages.name)) {
          console.info("get Grid_RowCol_ItemPosition state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemPosition page error:" + err);
      }
      console.info("Grid_RowCol_ItemPositionTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemPositionTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0500
     * @tc.name      testGridRowColItemPosition
     * @tc.desc      The second griditem set position to {x:20,y:20}
     */
    it('testGridRowColItemPosition', 0, async function (done) {
      console.info('[testGridRowColItemPosition] START');
      globalThis.value.message.notify({name:'secondGridItemPosition', value:{x:20,y:20}});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition01');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition02');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition03');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition04');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPosition_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round(secondGridItem.left - gridContainer.left)).assertEqual(vp2px(20));
      expect(Math.round(secondGridItem.top - gridContainer.top)).assertEqual(vp2px(20)); //position {x:20,y:20}

      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top);
      expect(thirdGridItem.left).assertEqual(gridContainer.left);
      expect(thirdGridItem.top).assertEqual(firstGridItem.bottom);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(thirdGridItem.top);

      expect(Math.round(firstGridItem.right - firstGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(firstGridItem.bottom - firstGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(secondGridItem.right - secondGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(secondGridItem.bottom - secondGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(thirdGridItem.right - thirdGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(thirdGridItem.bottom - thirdGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(fourthGridItem.right - fourthGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(fourthGridItem.bottom - fourthGridItem.top)).assertEqual(vp2px(150));
      console.info('[testGridRowColItemPosition] END');
      done();
    });
  })
}
