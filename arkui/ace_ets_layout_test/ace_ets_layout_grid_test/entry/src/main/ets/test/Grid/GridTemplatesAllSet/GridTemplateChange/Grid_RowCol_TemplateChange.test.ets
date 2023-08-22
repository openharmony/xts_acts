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
export default function Grid_RowCol_TemplateChange() {
  describe('Grid_RowCol_TemplateChangeTest', function () {
    beforeEach(async function (done) {
      console.info("Grid_RowCol_TemplateChangeTest beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/GridTemplatesAllSet/GridTemplateChange/Grid_RowCol_TemplateChange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_RowCol_TemplateChange state pages:" + JSON.stringify(pages));
        if (!("Grid_RowCol_TemplateChange" == pages.name)) {
          console.info("get Grid_RowCol_TemplateChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_RowCol_TemplateChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_RowCol_TemplateChange page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_RowCol_TemplateChangeTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_TemplateChange after each called")
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDTEMPLATECHANGE_0100
     * @tc.name      testGridRowColTemplateChange01
     * @tc.desc      Grid is divided into 4 equal parts, 4 components
     */
    it('testGridRowColTemplateChange01', 0, async function (done) {
      console.info('[testGridRowColTemplateChange01] START');
      await CommonFunc.sleep(1000);
      let gridContainerStrJson = getInspectorByKey('GridTemplateChange_Grid_01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      let GridTemplateChange_Grid_011 = CommonFunc.getComponentRect('GridTemplateChange_Grid_011');
      let GridTemplateChange_Grid_012 = CommonFunc.getComponentRect('GridTemplateChange_Grid_012');
      let GridTemplateChange_Grid_013 = CommonFunc.getComponentRect('GridTemplateChange_Grid_013');
      let GridTemplateChange_Grid_014 = CommonFunc.getComponentRect('GridTemplateChange_Grid_014');
      let GridTemplateChange_Grid_01 = CommonFunc.getComponentRect('GridTemplateChange_Grid_01');
      expect(GridTemplateChange_Grid_011.left).assertEqual(GridTemplateChange_Grid_01.left);
      expect(GridTemplateChange_Grid_013.left).assertEqual(GridTemplateChange_Grid_01.left);

      expect(GridTemplateChange_Grid_011.right).assertEqual(GridTemplateChange_Grid_012.left);
      expect(GridTemplateChange_Grid_013.right).assertEqual(GridTemplateChange_Grid_014.left);

      expect(GridTemplateChange_Grid_012.right).assertEqual(GridTemplateChange_Grid_01.right);
      expect(GridTemplateChange_Grid_014.right).assertEqual(GridTemplateChange_Grid_01.right);

      expect(GridTemplateChange_Grid_011.top).assertEqual(GridTemplateChange_Grid_01.top);
      expect(GridTemplateChange_Grid_012.top).assertEqual(GridTemplateChange_Grid_01.top);

      expect(GridTemplateChange_Grid_011.bottom).assertEqual(GridTemplateChange_Grid_013.top);
      expect(GridTemplateChange_Grid_012.bottom).assertEqual(GridTemplateChange_Grid_014.top);

      expect(GridTemplateChange_Grid_013.bottom).assertEqual(GridTemplateChange_Grid_01.bottom);
      expect(GridTemplateChange_Grid_014.bottom).assertEqual(GridTemplateChange_Grid_01.bottom);


      expect(Math.round(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_011.left)).assertEqual(vp2px(150));
      expect(Math.round(GridTemplateChange_Grid_012.right - GridTemplateChange_Grid_012.left)).assertEqual(vp2px(150));
      expect(Math.round(GridTemplateChange_Grid_013.right - GridTemplateChange_Grid_013.left)).assertEqual(vp2px(150));
      expect(Math.round(GridTemplateChange_Grid_014.right - GridTemplateChange_Grid_014.left)).assertEqual(vp2px(150));

      expect(Math.round(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_011.top)).assertEqual(vp2px(150));
      expect(Math.round(GridTemplateChange_Grid_012.bottom - GridTemplateChange_Grid_012.top)).assertEqual(vp2px(150));
      expect(Math.round(GridTemplateChange_Grid_013.bottom - GridTemplateChange_Grid_013.top)).assertEqual(vp2px(150));
      expect(Math.round(GridTemplateChange_Grid_014.bottom - GridTemplateChange_Grid_014.top)).assertEqual(vp2px(150));
      console.info('[testGridRowColTemplateChange01] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDTEMPLATECHANGE_0200
     * @tc.name      testGridRowColTemplateChange02
     * @tc.desc      Grid is divided into 9 equal parts, 4 components
     */
    it('testGridRowColTemplateChange02', 0, async function (done) {
      console.info('[testGridRowColTemplateChange02] START');
      globalThis.value.message.notify({name:'testColumnsTemplate', value:"1fr 1fr 1fr"});
      globalThis.value.message.notify({name:'testRowsTemplate', value:"1fr 1fr 1fr"});
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = getInspectorByKey('GridTemplateChange_Grid_01');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      let GridTemplateChange_Grid_011 = CommonFunc.getComponentRect('GridTemplateChange_Grid_011');
      let GridTemplateChange_Grid_012 = CommonFunc.getComponentRect('GridTemplateChange_Grid_012');
      let GridTemplateChange_Grid_013 = CommonFunc.getComponentRect('GridTemplateChange_Grid_013');
      let GridTemplateChange_Grid_014 = CommonFunc.getComponentRect('GridTemplateChange_Grid_014');
      let GridTemplateChange_Grid_01 = CommonFunc.getComponentRect('GridTemplateChange_Grid_01');
      expect(GridTemplateChange_Grid_011.left).assertEqual(GridTemplateChange_Grid_01.left);
      expect(GridTemplateChange_Grid_014.left).assertEqual(GridTemplateChange_Grid_01.left);

      expect(GridTemplateChange_Grid_011.right).assertEqual(GridTemplateChange_Grid_014.right);
      expect(GridTemplateChange_Grid_011.right).assertEqual(GridTemplateChange_Grid_012.left);
      expect(GridTemplateChange_Grid_012.right).assertEqual(GridTemplateChange_Grid_013.left);
      expect(GridTemplateChange_Grid_013.right).assertEqual(GridTemplateChange_Grid_01.right);

      expect(GridTemplateChange_Grid_011.top).assertEqual(GridTemplateChange_Grid_01.top);
      expect(GridTemplateChange_Grid_011.top).assertEqual(GridTemplateChange_Grid_012.top);
      expect(GridTemplateChange_Grid_011.top).assertEqual(GridTemplateChange_Grid_013.top);

      expect(GridTemplateChange_Grid_011.bottom).assertEqual(GridTemplateChange_Grid_014.top);
      expect(GridTemplateChange_Grid_011.bottom).assertEqual(GridTemplateChange_Grid_012.bottom);
      expect(GridTemplateChange_Grid_011.bottom).assertEqual(GridTemplateChange_Grid_013.bottom);

      expect(Math.round(GridTemplateChange_Grid_011.right - GridTemplateChange_Grid_011.left)).assertEqual(vp2px(100));
      expect(Math.round(GridTemplateChange_Grid_012.right - GridTemplateChange_Grid_012.left)).assertEqual(vp2px(100));
      expect(Math.round(GridTemplateChange_Grid_013.right - GridTemplateChange_Grid_013.left)).assertEqual(vp2px(100));
      expect(Math.round(GridTemplateChange_Grid_014.right - GridTemplateChange_Grid_014.left)).assertEqual(vp2px(100));

      expect(Math.round(GridTemplateChange_Grid_011.bottom - GridTemplateChange_Grid_011.top)).assertEqual(vp2px(100));
      expect(Math.round(GridTemplateChange_Grid_012.bottom - GridTemplateChange_Grid_012.top)).assertEqual(vp2px(100));
      expect(Math.round(GridTemplateChange_Grid_013.bottom - GridTemplateChange_Grid_013.top)).assertEqual(vp2px(100));
      expect(Math.round(GridTemplateChange_Grid_014.bottom - GridTemplateChange_Grid_014.top)).assertEqual(vp2px(100));
      console.info('[testGridRowColTemplateChange02] END');
      done();
    });

  })
}
