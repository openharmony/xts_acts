
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
export default function grid_RowCol_ItemRowStartEndTest() {
  describe('Grid_RowCol_ItemRowStartEndTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_ItemRowStartEndTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemRowStartEnd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_ItemRowStartEnd state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemRowStartEnd" == pages.name)) {
          console.info("get Grid_RowCol_ItemRowStartEnd state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_ItemRowStartEnd page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemRowStartEnd page error:" + err);
      }
      console.info("Grid_RowCol_ItemRowStartEndTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemRowStartEndTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1000
     * @tc.name      testGridRowColItemRowStartToZeroEndToThree
     * @tc.desc      The first griditem set rowStart to 0,rowEnd to 3
     */
    it('testGridRowColItemRowStartToZeroEndToThree', 0, async function (done) {
      console.info('[testGridRowColItemRowStartToZeroEndToThree] START');
      globalThis.value.message.notify({name:'RowStart', value:0});
      globalThis.value.message.notify({name:'RowEnd', value:3});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd1');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd2');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd3');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd4');
      let fifthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd5');
      let sixthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd6');
      let seventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd7');
      let eighthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd8');
      let ninthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd9');
      let tenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd10');
      let eleventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd11');
      let twelfthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd12');
      let thirteenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd13');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemRowStartEnd_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round((firstGridItem.right - firstGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round(firstGridItem.bottom - firstGridItem.top)).assertEqual(vp2px(300));
      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(firstGridItem.top).assertEqual(gridContainer.top);

      expect(Math.round((secondGridItem.right- secondGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((secondGridItem.bottom - secondGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(secondGridItem.left).assertEqual(firstGridItem.right);
      expect(secondGridItem.top).assertEqual(firstGridItem.top);
      expect(Math.round((thirdGridItem.right - thirdGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirdGridItem.left).assertEqual(secondGridItem.right);
      expect(thirdGridItem.top).assertEqual(firstGridItem.top);
      expect(thirdGridItem.bottom).assertEqual(secondGridItem.bottom);
      expect(Math.round((fourthGridItem.right - fourthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(firstGridItem.top);
      expect(fourthGridItem.bottom).assertEqual(secondGridItem.bottom);
      expect(fourthGridItem.right).assertEqual(gridContainer.right); // first row

      expect(Math.round((fifthGridItem.right - fifthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((fifthGridItem.bottom - fifthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fifthGridItem.left).assertEqual(firstGridItem.right);
      expect(fifthGridItem.top).assertEqual(secondGridItem.bottom);
      expect(Math.round((sixthGridItem.right - sixthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(sixthGridItem.left).assertEqual(fifthGridItem.right);
      expect(sixthGridItem.top).assertEqual(fifthGridItem.top);
      expect(sixthGridItem.bottom).assertEqual(fifthGridItem.bottom);
      expect(Math.round((seventhGridItem.right - seventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(seventhGridItem.left).assertEqual(sixthGridItem.right);
      expect(seventhGridItem.top).assertEqual(fifthGridItem.top);
      expect(seventhGridItem.right).assertEqual(gridContainer.right); // second row

      expect(Math.round((eighthGridItem.right - eighthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((eighthGridItem.bottom - eighthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eighthGridItem.left).assertEqual(firstGridItem.right);
      expect(eighthGridItem.top).assertEqual(fifthGridItem.bottom);
      expect(Math.round((ninthGridItem.right - ninthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(ninthGridItem.left).assertEqual(eighthGridItem.right);
      expect(ninthGridItem.top).assertEqual(eighthGridItem.top);
      expect(ninthGridItem.bottom).assertEqual(eighthGridItem.bottom);
      expect(Math.round((tenthGridItem.right - tenthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(tenthGridItem.left).assertEqual(ninthGridItem.right);
      expect(tenthGridItem.top).assertEqual(eighthGridItem.top);
      expect(tenthGridItem.bottom).assertEqual(eighthGridItem.bottom);
      expect(tenthGridItem.right).assertEqual(gridContainer.right); // third row

      expect(Math.round((eleventhGridItem.right - eleventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((eleventhGridItem.bottom - eleventhGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eleventhGridItem.left).assertEqual(firstGridItem.right);
      expect(eleventhGridItem.top).assertEqual(eighthGridItem.bottom);
      expect(Math.round((eleventhGridItem.right - eleventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(twelfthGridItem.left).assertEqual(eleventhGridItem.right);
      expect(twelfthGridItem.top).assertEqual(eleventhGridItem.top);
      expect(twelfthGridItem.bottom).assertEqual(eleventhGridItem.bottom);
      expect(thirteenthGridItem.left).assertEqual(twelfthGridItem.right);
      expect(thirteenthGridItem.top).assertEqual(eleventhGridItem.top);
      expect(thirteenthGridItem.right).assertEqual(gridContainer.right);
      expect(thirteenthGridItem.bottom).assertEqual(gridContainer.bottom); // fourth row
      console.info('[testGridRowColItemRowStartToZeroEndToThree] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_1100
     * @tc.name      testGridRowColItemRowStartToTwoEndToFour
     * @tc.desc      The first griditem set rowStart to 1,rowEnd to 3
     */
    it('testGridRowColItemRowStartToOneEndToThree', 0, async function (done) {
      console.info('[testGridRowColItemRowStartToOneEndToThree] START');
      globalThis.value.message.notify({name:'RowStart', value:1});
      globalThis.value.message.notify({name:'RowEnd', value:3});
      await CommonFunc.sleep(3000);
      let firstGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd1');
      let secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd2');
      let thirdGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd3');
      let fourthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd4');
      let fifthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd5');
      let sixthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd6');
      let seventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd7');
      let eighthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd8');
      let ninthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd9');
      let tenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd10');
      let eleventhGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd11');
      let twelfthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd12');
      let thirteenthGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd13');
      let gridContainer = CommonFunc.getComponentRect('Grid_RowCol_ItemRowStartEnd_Container01');
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_ItemRowStartEnd_Container01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');

      expect(Math.round((firstGridItem.right - firstGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((firstGridItem.bottom - firstGridItem.top)*10)/10).assertEqual(Math.round(vp2px(225)*10)/10);
      expect(firstGridItem.left).assertEqual(gridContainer.left);
      expect(Math.round((firstGridItem.top - gridContainer.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10); //firstGridItem

      expect(Math.round((secondGridItem.right - secondGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((secondGridItem.bottom - secondGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(secondGridItem.left).assertEqual(gridContainer.left);
      expect(secondGridItem.top).assertEqual(gridContainer.top);
      expect(Math.round((thirdGridItem.right - thirdGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirdGridItem.left).assertEqual(secondGridItem.right);
      expect(thirdGridItem.top).assertEqual(secondGridItem.top);
      expect(thirdGridItem.bottom).assertEqual(secondGridItem.bottom);
      expect(Math.round((fourthGridItem.right - fourthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(fourthGridItem.left).assertEqual(thirdGridItem.right);
      expect(fourthGridItem.top).assertEqual(secondGridItem.top);
      expect(fourthGridItem.bottom).assertEqual(secondGridItem.bottom);
      expect(fifthGridItem.left).assertEqual(fourthGridItem.right);
      expect(fifthGridItem.right).assertEqual(gridContainer.right);
      expect(fifthGridItem.top).assertEqual(secondGridItem.top);
      expect(fifthGridItem.bottom).assertEqual(secondGridItem.bottom);  //first row

      expect(Math.round((sixthGridItem.right - sixthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((sixthGridItem.bottom - sixthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(sixthGridItem.left).assertEqual(firstGridItem.right);
      expect(sixthGridItem.top).assertEqual(thirdGridItem.bottom);
      expect(Math.round((seventhGridItem.right - seventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(seventhGridItem.left).assertEqual(sixthGridItem.right);
      expect(seventhGridItem.top).assertEqual(sixthGridItem.top);
      expect(Math.round((eighthGridItem.right - eighthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eighthGridItem.left).assertEqual(seventhGridItem.right);
      expect(eighthGridItem.top).assertEqual(sixthGridItem.top);
      expect(eighthGridItem.bottom).assertEqual(sixthGridItem.bottom); //second row

      expect(Math.round((ninthGridItem.right - ninthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((ninthGridItem.bottom - ninthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(ninthGridItem.left).assertEqual(firstGridItem.right);
      expect(ninthGridItem.top).assertEqual(sixthGridItem.bottom);
      expect(Math.round((tenthGridItem.right - tenthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(tenthGridItem.left).assertEqual(ninthGridItem.right);
      expect(tenthGridItem.top).assertEqual(ninthGridItem.top);
      expect(tenthGridItem.bottom).assertEqual(ninthGridItem.bottom);
      expect(Math.round((eleventhGridItem.right - eleventhGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(eleventhGridItem.left).assertEqual(tenthGridItem.right);
      expect(eleventhGridItem.top).assertEqual(ninthGridItem.top);
      expect(eleventhGridItem.bottom).assertEqual(ninthGridItem.bottom); //third row

      expect(Math.round((twelfthGridItem.right - twelfthGridItem.left)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(Math.round((twelfthGridItem.bottom - twelfthGridItem.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(twelfthGridItem.left).assertEqual(firstGridItem.right);
      expect(twelfthGridItem.top).assertEqual(ninthGridItem.bottom);
      expect(twelfthGridItem.bottom).assertEqual(gridContainer.bottom);
      expect(thirteenthGridItem.left).assertEqual(twelfthGridItem.right);
      expect(thirteenthGridItem.top).assertEqual(twelfthGridItem.top);
      expect(Math.round((gridContainer.right - thirteenthGridItem.right)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10);
      expect(thirteenthGridItem.bottom).assertEqual(gridContainer.bottom); // fourth row
      console.info('[testGridRowColItemRowStartToOneEndToThree] END');
      done();
    });
  })
}
