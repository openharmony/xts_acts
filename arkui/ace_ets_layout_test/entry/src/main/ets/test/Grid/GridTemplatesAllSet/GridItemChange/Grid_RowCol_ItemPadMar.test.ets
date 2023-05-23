
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
export default function grid_RowCol_ItemPadMarTest() {
  describe('Grid_RowCol_ItemPadMarTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_ItemPadMarTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPadMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemPadMar state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemPadMar" == pages.name)) {
          console.info("get Grid_RowCol_ItemPadMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemPadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemPadMar page error:" + err);
      }
      console.info("Grid_RowCol_ItemPadMarTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({name:'secondGridItemPadding', value:0});
      globalThis.value.message.notify({name:'secondGridItemMargin', value:0});
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemPadMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0100
     * @tc.name      testGridRowColItemMargin
     * @tc.desc      The second griditem set margin to 10
     */
    it('testGridRowColItemMargin', 0, async function (done) {
      console.info('[testGridRowColItemMargin] START');
      globalThis.value.message.notify({name:'secondGridItemMargin', value:10});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round(secondGridItem.left - firstGridItem.right)).assertEqual(vp2px(10));
      expect(Math.round(secondGridItem.top - gridContainer.top)).assertEqual(vp2px(10)); //margin = 10

      expect(secondGridItem.left).assertEqual(secondText.left);
      expect(secondGridItem.top).assertEqual(secondText.top);
      expect(Math.round(secondGridItem.right - secondGridItem.left))
        .assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(secondGridItem.bottom - secondGridItem.top))
        .assertEqual(Math.round(secondText.bottom - secondText.top));

      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top);
      expect(thirdGridItem.left).assertEqual(gridContainer.left);
      expect(thirdGridItem.top).assertEqual(firstGridItem.bottom);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(thirdGridItem.top);

      expect(Math.round(firstGridItem.right - firstGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(firstGridItem.bottom - firstGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(secondGridItem.right - secondGridItem.left)).assertEqual(vp2px(130));
      expect(Math.round(secondGridItem.bottom - secondGridItem.top)).assertEqual(vp2px(130));

      expect(Math.round(thirdGridItem.right - thirdGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(thirdGridItem.bottom - thirdGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(fourthGridItem.right - fourthGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(fourthGridItem.bottom - fourthGridItem.top)).assertEqual(vp2px(150));

      console.info('[testGridRowColItemMargin] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0200
     * @tc.name      testGridRowColItemPadding
     * @tc.desc      The second griditem set padding to 10
     */
    it('testGridRowColItemPadding', 0, async function (done) {
      console.info('[testGridRowColItemPadding] START');
      globalThis.value.message.notify({name:'secondGridItemPadding', value:10});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      expect(Math.round(secondText.left - secondGridItem.left)).assertEqual(vp2px(10));
      expect(Math.round(secondText.top - secondGridItem.top)).assertEqual(vp2px(10));
      expect(Math.round(secondGridItem.right - secondText.right)).assertEqual(vp2px(10));
      expect(Math.round(secondGridItem.bottom - secondText.bottom)).assertEqual(vp2px(10)); //padding = 10

      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top);
      expect(secondGridItem.left).assertEqual(firstGridItem.right);
      expect(secondGridItem.top).assertEqual(gridContainer.top);
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
      console.info('[testGridRowColItemPadding] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0300
     * @tc.name      testGridRowColItemMarPad
     * @tc.desc      The second griditem set padding to 10,margin to 10
     */
    it('testGridRowColItemMarPad', 0, async function (done) {
      console.info('[testGridRowColItemMarPad] START');
      globalThis.value.message.notify({name:'secondGridItemPadding', value:10});
      globalThis.value.message.notify({name:'secondGridItemMargin', value:10});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round(secondGridItem.left - firstGridItem.right)).assertEqual(vp2px(10));
      expect(Math.round(secondGridItem.top - gridContainer.top)).assertEqual(vp2px(10)); //margin = 10

      expect(Math.round(secondText.left - secondGridItem.left)).assertEqual(vp2px(10));
      expect(Math.round(secondText.top - secondGridItem.top)).assertEqual(vp2px(10));
      expect(Math.round(secondGridItem.right - secondText.right)).assertEqual(vp2px(10));
      expect(Math.round(secondGridItem.bottom - secondText.bottom)).assertEqual(vp2px(10)); //padding = 10

      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top);
      expect(thirdGridItem.left).assertEqual(gridContainer.left);
      expect(thirdGridItem.top).assertEqual(firstGridItem.bottom);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(thirdGridItem.top);

      expect(Math.round(firstGridItem.right - firstGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(firstGridItem.bottom - firstGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(secondGridItem.right - secondGridItem.left)).assertEqual(vp2px(130));
      expect(Math.round(secondGridItem.bottom - secondGridItem.top)).assertEqual(vp2px(130));

      expect(Math.round(thirdGridItem.right - thirdGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(thirdGridItem.bottom - thirdGridItem.top)).assertEqual(vp2px(150));

      expect(Math.round(fourthGridItem.right - fourthGridItem.left)).assertEqual(vp2px(150));
      expect(Math.round(fourthGridItem.bottom - fourthGridItem.top)).assertEqual(vp2px(150));

      console.info('[testGridRowColItemMarPad] END');
      done();
    });
  })
}
