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
export default function Grid_RowCol_PadMar() {
  describe('Grid_RowCol_PadMarTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_PadMarTest beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_PadMar",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_PadMar state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_PadMar" == pages.name)) {
          console.info("get Grid_RowCol_PadMar pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_PadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_PadMar page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_RowCol_PadMarTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_PadMar after each called")
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0300
     * @tc.name      testGridRowColGridPad
     * @tc.desc      Add padding,Grid is divided into 4 equal parts, 4 components
     */
    it('testGridRowColGridPad', 0, async function (done) {
      console.info('[testGridRowColGridPad] START');
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_PadMar_01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      let Grid_RowCol_PadMar_011 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_011');
      let Grid_RowCol_PadMar_012 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_012');
      let Grid_RowCol_PadMar_013 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_013');
      let Grid_RowCol_PadMar_014 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_014');
      let Grid_RowCol_PadMar_01 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_01');
      expect(Math.round(Grid_RowCol_PadMar_011.left - Grid_RowCol_PadMar_01.left)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_013.left).assertEqual(Grid_RowCol_PadMar_011.left);

      expect(Grid_RowCol_PadMar_011.right).assertEqual(Grid_RowCol_PadMar_012.left);
      expect(Grid_RowCol_PadMar_013.right).assertEqual(Grid_RowCol_PadMar_014.left);

      expect(Math.round(Grid_RowCol_PadMar_01.right - Grid_RowCol_PadMar_012.right)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_014.right).assertEqual(Grid_RowCol_PadMar_012.right);

      expect(Math.round(Grid_RowCol_PadMar_011.top - Grid_RowCol_PadMar_01.top)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_012.top).assertEqual(Grid_RowCol_PadMar_011.top);

      expect(Grid_RowCol_PadMar_011.bottom).assertEqual(Grid_RowCol_PadMar_013.top);
      expect(Grid_RowCol_PadMar_012.bottom).assertEqual(Grid_RowCol_PadMar_014.top);

      expect(Math.round(Grid_RowCol_PadMar_01.bottom - Grid_RowCol_PadMar_013.bottom)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_013.bottom).assertEqual(Grid_RowCol_PadMar_014.bottom);


      expect(Math.round(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_013.left)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_014.left)).assertEqual(vp2px(140));

      expect(Math.round(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_013.top)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_014.bottom - Grid_RowCol_PadMar_014.top)).assertEqual(vp2px(140));
      console.info('[testGridRowColGridPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0400
     * @tc.name      testGridRowColGridMargin
     * @tc.desc     Add margin,Grid is divided into 4 equal parts, 4 components
     */
    it('testGridRowColGridMargin', 0, async function (done) {
      console.info('[testGridRowColGridMargin] START');
      globalThis.value.message.notify({name:'addPadding', value:0});
      globalThis.value.message.notify({name:'addMargin', value:10});
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_PadMar_01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      let Grid_RowCol_PadMar_011 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_011');
      let Grid_RowCol_PadMar_012 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_012');
      let Grid_RowCol_PadMar_013 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_013');
      let Grid_RowCol_PadMar_014 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_014');
      let Grid_RowCol_PadMar_01 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_01');
      let Grid_RowCol_PadMar_Box_01 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_Box_01');
      expect(Grid_RowCol_PadMar_011.left).assertEqual(Grid_RowCol_PadMar_01.left);
      expect(Grid_RowCol_PadMar_013.left).assertEqual(Grid_RowCol_PadMar_01.left);

      expect(Grid_RowCol_PadMar_011.right).assertEqual(Grid_RowCol_PadMar_012.left);
      expect(Grid_RowCol_PadMar_013.right).assertEqual(Grid_RowCol_PadMar_014.left);

      expect(Grid_RowCol_PadMar_01.right).assertEqual(Grid_RowCol_PadMar_012.right);
      expect(Grid_RowCol_PadMar_014.right).assertEqual(Grid_RowCol_PadMar_012.right);

      expect(Grid_RowCol_PadMar_011.top).assertEqual(Grid_RowCol_PadMar_01.top);
      expect(Grid_RowCol_PadMar_012.top).assertEqual(Grid_RowCol_PadMar_011.top);

      expect(Grid_RowCol_PadMar_011.bottom).assertEqual(Grid_RowCol_PadMar_013.top);
      expect(Grid_RowCol_PadMar_012.bottom).assertEqual(Grid_RowCol_PadMar_014.top);

      expect(Grid_RowCol_PadMar_01.bottom).assertEqual(Grid_RowCol_PadMar_013.bottom);
      expect(Grid_RowCol_PadMar_013.bottom).assertEqual(Grid_RowCol_PadMar_014.bottom);

      expect(Math.round(Grid_RowCol_PadMar_01.left - Grid_RowCol_PadMar_Box_01.left)).assertEqual(vp2px(10));
      expect(Math.round(Grid_RowCol_PadMar_01.top - Grid_RowCol_PadMar_Box_01.top)).assertEqual(vp2px(10));
      expect(Math.round(Grid_RowCol_PadMar_Box_01.right - Grid_RowCol_PadMar_01.right)).assertEqual(vp2px(10));
      expect(Math.round(Grid_RowCol_PadMar_Box_01.bottom - Grid_RowCol_PadMar_01.bottom)).assertEqual(vp2px(10));

      expect(Math.round(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_013.left)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_014.left)).assertEqual(vp2px(150));

      expect(Math.round(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_013.top)).assertEqual(vp2px(150));
      expect(Math.round(Grid_RowCol_PadMar_014.bottom - Grid_RowCol_PadMar_014.top)).assertEqual(vp2px(150));
      console.info('[testGridRowColGridMargin] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0500
     * @tc.name      testGridRowColGridPadMar
     * @tc.desc      Add padding and margin,Grid is divided into 4 equal parts, 4 components
     */
    it('testGridRowColGridPadMar', 0, async function (done) {
      console.info('[testGridRowColGridPadMar] START');
      globalThis.value.message.notify({name:'addPadding', value:10});
      globalThis.value.message.notify({name:'addMargin', value:10});
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('Grid_RowCol_PadMar_01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      let Grid_RowCol_PadMar_011 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_011');
      let Grid_RowCol_PadMar_012 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_012');
      let Grid_RowCol_PadMar_013 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_013');
      let Grid_RowCol_PadMar_014 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_014');
      let Grid_RowCol_PadMar_01 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_01');
      let Grid_RowCol_PadMar_Box_01 = CommonFunc.getComponentRect('Grid_RowCol_PadMar_Box_01');
      expect(Math.round(Grid_RowCol_PadMar_011.left - Grid_RowCol_PadMar_01.left)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_013.left).assertEqual(Grid_RowCol_PadMar_011.left);

      expect(Grid_RowCol_PadMar_011.right).assertEqual(Grid_RowCol_PadMar_012.left);
      expect(Grid_RowCol_PadMar_013.right).assertEqual(Grid_RowCol_PadMar_014.left);

      expect(Math.round(Grid_RowCol_PadMar_01.right - Grid_RowCol_PadMar_012.right)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_014.right).assertEqual(Grid_RowCol_PadMar_012.right);

      expect(Math.round(Grid_RowCol_PadMar_011.top - Grid_RowCol_PadMar_01.top)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_012.top).assertEqual(Grid_RowCol_PadMar_011.top);

      expect(Grid_RowCol_PadMar_011.bottom).assertEqual(Grid_RowCol_PadMar_013.top);
      expect(Grid_RowCol_PadMar_012.bottom).assertEqual(Grid_RowCol_PadMar_014.top);

      expect(Math.round(Grid_RowCol_PadMar_01.bottom - Grid_RowCol_PadMar_013.bottom)).assertEqual(vp2px(10));
      expect(Grid_RowCol_PadMar_013.bottom).assertEqual(Grid_RowCol_PadMar_014.bottom);

      expect(Math.round(Grid_RowCol_PadMar_01.left - Grid_RowCol_PadMar_Box_01.left)).assertEqual(vp2px(10));
      expect(Math.round(Grid_RowCol_PadMar_01.top - Grid_RowCol_PadMar_Box_01.top)).assertEqual(vp2px(10));
      expect(Math.round(Grid_RowCol_PadMar_Box_01.right - Grid_RowCol_PadMar_01.right)).assertEqual(vp2px(10));
      expect(Math.round(Grid_RowCol_PadMar_Box_01.bottom - Grid_RowCol_PadMar_01.bottom)).assertEqual(vp2px(10));


      expect(Math.round(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_013.left)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_014.left)).assertEqual(vp2px(140));

      expect(Math.round(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_013.top)).assertEqual(vp2px(140));
      expect(Math.round(Grid_RowCol_PadMar_014.bottom - Grid_RowCol_PadMar_014.top)).assertEqual(vp2px(140));
      console.info('[testGridRowColGridPadMar] END');
      done();
    });

  })
}
