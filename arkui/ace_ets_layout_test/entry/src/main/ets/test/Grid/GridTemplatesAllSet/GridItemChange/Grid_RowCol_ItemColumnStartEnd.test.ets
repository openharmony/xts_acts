
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
export default function grid_RowCol_ItemColumnStartEndTest() {
  describe('Grid_RowCol_ItemColumnStartEndTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_ItemColumnStartEndTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemColumnStartEnd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemColumnStartEnd state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemColumnStartEnd" == pages.name)) {
          console.info("get Grid_RowCol_ItemColumnStartEnd state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemColumnStartEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemColumnStartEnd page error:" + err);
      }
      console.info("Grid_RowCol_ItemColumnStartEndTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemColumnStartEndTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1200
     * @tc.name      testGridRowColItemColumnStartToZeroEndToThree
     * @tc.desc      The first griditem set columnStart to 0,columnEnd to 3
     */
    it('testGridRowColItemColumnStartToZeroEndToThree', 0, async function (done) {
      console.info('[testGridRowColItemColumnStartToZeroEndToThree] START');
      globalThis.value.message.notify({name:'ColumnStart', value:0});
      globalThis.value.message.notify({name:'ColumnEnd', value:3});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd1');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd2');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd3');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd4');
      let fifthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd5');
      let sixthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd6');
      let seventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd7');
      let eighthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd8');
      let ninthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd9');
      let tenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd10');
      let eleventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd11');
      let twelfthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd12');
      let thirteenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd13');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round(firstGridItem.right - firstGridItem.left)).assertEqual(vp2px(300));
      expect(Math.round((firstGridItem.bottom - firstGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top); //firstGridItem

      expect(Math.round((secondGridItem.right - secondGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((secondGridItem.bottom - secondGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(secondGridItem.left).assertEqual(gridContainer.left);
      expect(secondGridItem.top).assertEqual(firstGridItem.bottom);
      expect(Math.round((thirdGridItem.right - thirdGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirdGridItem.left).assertEqual(secondGridItem.right);
      expect(thirdGridItem.top).assertEqual(secondGridItem.top);
      expect(thirdGridItem.bottom).assertEqual(secondGridItem.bottom);
      expect(Math.round((fourthGridItem.right - fourthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(secondGridItem.top);
      expect(fourthGridItem.bottom).assertEqual(secondGridItem.bottom);
      expect(Math.round((fifthGridItem.right - fifthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fifthGridItem.left).assertEqual(fourthGridItem.right);
      expect(fifthGridItem.right).assertEqual(gridContainer.right);
      expect(fifthGridItem.top).assertEqual(secondGridItem.top);
      expect(fifthGridItem.bottom).assertEqual(secondGridItem.bottom);  //first row

      expect(Math.round((sixthGridItem.right - sixthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((sixthGridItem.bottom - sixthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(sixthGridItem.left).assertEqual(gridContainer.left);
      expect(sixthGridItem.top).assertEqual(secondGridItem.bottom);
      expect(Math.round((seventhGridItem.right - seventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(seventhGridItem.left).assertEqual(sixthGridItem.right);
      expect(seventhGridItem.top).assertEqual(sixthGridItem.top);
      expect(seventhGridItem.bottom).assertEqual(sixthGridItem.bottom);
      expect(Math.round((eighthGridItem.right - eighthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eighthGridItem.left).assertEqual(seventhGridItem.right);
      expect(eighthGridItem.top).assertEqual(sixthGridItem.top);
      expect(eighthGridItem.bottom).assertEqual(sixthGridItem.bottom);
      expect(Math.round((ninthGridItem.right - ninthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(ninthGridItem.left).assertEqual(eighthGridItem.right);
      expect(ninthGridItem.top).assertEqual(sixthGridItem.top);
      expect(ninthGridItem.bottom).assertEqual(sixthGridItem.bottom);

      expect(Math.round((tenthGridItem.right - tenthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((tenthGridItem.bottom - tenthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(tenthGridItem.left).assertEqual(gridContainer.left);
      expect(tenthGridItem.top).assertEqual(sixthGridItem.bottom);
      expect(Math.round((eleventhGridItem.right - eleventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eleventhGridItem.left).assertEqual(tenthGridItem.right);
      expect(eleventhGridItem.top).assertEqual(tenthGridItem.top);
      expect(eleventhGridItem.bottom).assertEqual(tenthGridItem.bottom);
      expect(Math.round((twelfthGridItem.right - twelfthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(twelfthGridItem.left).assertEqual(eleventhGridItem.right);
      expect(twelfthGridItem.top).assertEqual(tenthGridItem.top);
      expect(twelfthGridItem.bottom).assertEqual(tenthGridItem.bottom);
      expect(Math.round((thirteenthGridItem.right - thirteenthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirteenthGridItem.left).assertEqual(twelfthGridItem.right);
      expect(thirteenthGridItem.top).assertEqual(tenthGridItem.top);
      expect(thirteenthGridItem.bottom).assertEqual(gridContainer.bottom); //third row
      console.info('[testGridRowColItemColumnStartToZeroEndToThree] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1300
     * @tc.name      testGridRowColItemColumnStartToZeroEndToTwo
     * @tc.desc      The first griditem set columnStart to 0,columnEnd to 2
     */
    it('testGridRowColItemColumnStartToZeroEndToTwo', 0, async function (done) {
      console.info('[testGridRowColItemColumnStartToZeroEndToTwo] START');
      globalThis.value.message.notify({name:'ColumnStart', value:0});
      globalThis.value.message.notify({name:'ColumnEnd', value:2});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd1');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd2');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd3');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd4');
      let fifthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd5');
      let sixthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd6');
      let seventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd7');
      let eighthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd8');
      let ninthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd9');
      let tenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd10');
      let eleventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd11');
      let twelfthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd12');
      let thirteenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd13');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round((firstGridItem.right - firstGridItem.left)*10)/10).assertEqual(Math.round(vp2px(225)*10)/10);
      expect(Math.round((firstGridItem.bottom - firstGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top); //firstGridItem
      expect(secondGridItem.left).assertEqual(firstGridItem.right);
      expect(secondGridItem.right).assertEqual(gridContainer.right);
      expect(secondGridItem.top).assertEqual(gridContainer.top);
      expect(secondGridItem.bottom).assertEqual(firstGridItem.bottom); //first Row


      expect(Math.round((thirdGridItem.right - thirdGridItem.left )*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((thirdGridItem.bottom - thirdGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirdGridItem.left).assertEqual(gridContainer.left);
      expect(thirdGridItem.top).assertEqual(firstGridItem.bottom);
      expect(Math.round((fourthGridItem.right - fourthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(thirdGridItem.top);
      expect(fourthGridItem.bottom).assertEqual(thirdGridItem.bottom);
      expect(Math.round((fifthGridItem.right - fifthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fifthGridItem.left).assertEqual(fourthGridItem.right);
      expect(fifthGridItem.top).assertEqual(thirdGridItem.top);
      expect(fifthGridItem.bottom).assertEqual(thirdGridItem.bottom);
      expect(Math.round((sixthGridItem.right - sixthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(sixthGridItem.left).assertEqual(fifthGridItem.right);
      expect(sixthGridItem.right).assertEqual(gridContainer.right);
      expect(sixthGridItem.top).assertEqual(thirdGridItem.top);
      expect(sixthGridItem.bottom).assertEqual(thirdGridItem.bottom); //second row

      expect(Math.round((seventhGridItem.right - seventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((seventhGridItem.bottom - seventhGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(seventhGridItem.left).assertEqual(gridContainer.left);
      expect(seventhGridItem.top).assertEqual(thirdGridItem.bottom);
      expect(Math.round((eighthGridItem.right - eighthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eighthGridItem.left).assertEqual(seventhGridItem.right);
      expect(eighthGridItem.top).assertEqual(seventhGridItem.top);
      expect(eighthGridItem.bottom).assertEqual(seventhGridItem.bottom);
      expect(Math.round((ninthGridItem.right - ninthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(ninthGridItem.left).assertEqual(eighthGridItem.right);
      expect(ninthGridItem.top).assertEqual(seventhGridItem.top);
      expect(ninthGridItem.bottom).assertEqual(seventhGridItem.bottom);
      expect(Math.round((tenthGridItem.right - tenthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(tenthGridItem.left).assertEqual(ninthGridItem.right);
      expect(tenthGridItem.top).assertEqual(seventhGridItem.top);
      expect(tenthGridItem.bottom).assertEqual(seventhGridItem.bottom); //third row

      expect(Math.round((eleventhGridItem.right - eleventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((eleventhGridItem.bottom - eleventhGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eleventhGridItem.left).assertEqual(gridContainer.left);
      expect(eleventhGridItem.top).assertEqual(seventhGridItem.bottom);
      expect(Math.round((twelfthGridItem.right - twelfthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(twelfthGridItem.left).assertEqual(eleventhGridItem.right);
      expect(twelfthGridItem.top).assertEqual(eleventhGridItem.top);
      expect(twelfthGridItem.bottom).assertEqual(eleventhGridItem.bottom);
      expect(Math.round((thirteenthGridItem.right - thirteenthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirteenthGridItem.left).assertEqual(twelfthGridItem.right);
      expect(thirteenthGridItem.top).assertEqual(eleventhGridItem.top);
      expect(thirteenthGridItem.bottom).assertEqual(gridContainer.bottom);  //fourth row
      console.info('[testGridRowColItemColumnStartToZeroEndToTwo] END');
      done();
    });
  })
}
