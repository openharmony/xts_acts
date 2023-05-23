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
export default function Grid_Row_Breakpoints_Change() {
  describe('Grid_Row_Breakpoints_Change', function () {
    beforeEach(async function (done) {
      console.info("Grid_Row_Breakpoints_Change beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Change",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Breakpoints_Change state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Change" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Change pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Breakpoints_Change page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Breakpoints_Change beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Breakpoints_Change after each called")
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWBREAKPOTINS_Value_0100
     * @tc.name      testBreakpoints
     * @tc.desc      Set the Breakpoints of GridRow to '50vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Value_0100', 0, async function (done) {
      console.info('SUB_ACE_GridRowBreakpoints_Value_0100 START');
      globalThis.value.message.notify({ name:'width', value:'50vp' })
      await CommonFunc.sleep(2000)

      let firstBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change0');
      let secondBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change1');
      let thirdBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change2');

      expect(Math.round(secondBreakpoints.top - firstBreakpoints.bottom)).assertEqual(Math.round(vp2px(5)));
      expect(Math.round(thirdBreakpoints.top - secondBreakpoints.bottom)).assertEqual(Math.round(vp2px(5)));

      console.info('SUB_ACE_GridRowBreakpoints_Value_0100 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWBREAKPOTINS_Value_0200
     * @tc.name      testBreakpoints
     * @tc.desc      Set the Breakpoints of GridRow to '150vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Value_0200', 0, async function (done) {
      console.info('SUB_ACE_GridRowBreakpoints_Value_0200 START');
      globalThis.value.message.notify({ name:'width', value:'150vp' })
      await CommonFunc.sleep(2000)

      let firstBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change0');
      let secondBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change1');
      let thirdBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change2');

      expect(Math.round(secondBreakpoints.left - firstBreakpoints.right)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(thirdBreakpoints.top - firstBreakpoints.bottom)).assertEqual(Math.round(vp2px(10)));

      console.info('SUB_ACE_GridRowBreakpoints_Value_0200 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWBREAKPOTINS_Value_0300
     * @tc.name      testBreakpoints
     * @tc.desc      Set the Breakpoints of GridRow to '300vp'
     */
    it('SUB_ACE_GridRowBreakpoints_Value_0300', 0, async function (done) {
      console.info('SUB_ACE_GridRowBreakpoints_Value_0300 START');
      globalThis.value.message.notify({ name:'width', value:'300vp' })
      await CommonFunc.sleep(2000)

      let firstBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change0');
      let secondBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change1');
      let thirdBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change2');
      let fourthBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change3');
      let fifthBreakpoints = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Change4');

      expect(Math.round(secondBreakpoints.left - firstBreakpoints.right)).assertEqual(Math.round(vp2px(15)));
      expect(Math.round(thirdBreakpoints.left - secondBreakpoints.right)).assertEqual(Math.round(vp2px(15)));
      expect(Math.round(fourthBreakpoints.top - firstBreakpoints.bottom)).assertEqual(Math.round(vp2px(15)));
      expect(Math.round(fifthBreakpoints.top - secondBreakpoints.bottom)).assertEqual(Math.round(vp2px(15)));

      console.info('SUB_ACE_GridRowBreakpoints_Value_0300 END');
      done();
    });

  })
}
