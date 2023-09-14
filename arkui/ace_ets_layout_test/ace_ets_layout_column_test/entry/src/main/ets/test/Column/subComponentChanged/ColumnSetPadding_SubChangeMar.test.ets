/*
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
import router from '@system.router';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function ColumnSetPadding__SubChangeMar() {
  describe('ColumnSetPaddingTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPadding_SubChangeMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get parentComponentSetPadding state success " + JSON.stringify(pages));
        if (!("parentComponentSetPadding" == pages.name)) {
          console.info("get parentComponentSetPadding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push parentComponentSetPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push parentComponentSetPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("parentComponentSetPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0400
     * @tc.name      testColumnParentPaddingSubMargin
     * @tc.desc      Parent component set paddding,subcomponent set margin.
     */
    it('testColumnParentPaddingSubMargin', 0, async function (done) {
      console.info('new testColumnParentPaddingSubMargin START');
      await CommonFunc.sleep(2000);
      let columnSetPad_1 = CommonFunc.getComponentRect('columnSetPad_1');
      let columnSetPad_2 = CommonFunc.getComponentRect('columnSetPad_2');
      let columnSetPad_3 = CommonFunc.getComponentRect('columnSetPad_3');
      let columnSetPad = CommonFunc.getComponentRect('columnSetPad');
      expect(Math.round(columnSetPad_1.top - columnSetPad.top)).assertEqual(vp2px(40))
      expect(Math.round(columnSetPad_2.top - columnSetPad_1.bottom)).assertEqual(vp2px(50))
      expect(Math.round(columnSetPad_3.top - columnSetPad_2.bottom)).assertEqual(vp2px(30))
      expect(columnSetPad.bottom).assertLess(columnSetPad_3.bottom)
      expect(Math.round(columnSetPad_1.right - columnSetPad_1.left)).assertEqual(vp2px(300))
      expect(Math.round(columnSetPad_2.right - columnSetPad_2.left)).assertEqual(vp2px(300))
      expect(Math.round(columnSetPad_3.right - columnSetPad_3.left)).assertEqual(vp2px(300))
      console.info('new testColumnParentPaddingSubMargin END');
      done();
    });
  })
}
