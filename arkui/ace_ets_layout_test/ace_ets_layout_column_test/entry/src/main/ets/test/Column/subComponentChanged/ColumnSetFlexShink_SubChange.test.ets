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
export default function ColumnSetFlexShink_SubChange() {
  describe('ColumnSetFlexShinkTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetFlexShink_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetFlexShink state success " + JSON.stringify(pages));
        if (!("SetFlexShink" == pages.name)) {
          console.info("get SetFlexShink state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetFlexShink page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetFlexShink page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("SetFlexShink after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1800
     * @tc.name      testColumnSetFlexShink
     * @tc.desc      Subcomponents set flexshink (3-2-1) attribute.
     */
    it('testColumnSetFlexShink', 0, async function (done) {
      console.info('new testColumnSetFlexShink START');
      await CommonFunc.sleep(2000);
      let columnSetFlexShink_1 = CommonFunc.getComponentRect('columnSetFlexShink_1');
      let columnSetFlexShink_2 = CommonFunc.getComponentRect('columnSetFlexShink_2');
      let columnSetFlexShink_3 = CommonFunc.getComponentRect('columnSetFlexShink_3');
      let columnSetFlexShink = CommonFunc.getComponentRect('columnSetFlexShink');

      expect(columnSetFlexShink.top).assertEqual(columnSetFlexShink_1.top)
      expect(Math.round(columnSetFlexShink_2.top - columnSetFlexShink_1.bottom)).assertEqual(vp2px(30))
      expect(Math.round(columnSetFlexShink_3.top - columnSetFlexShink_2.bottom)).assertEqual(vp2px(30))
      expect(Math.round(columnSetFlexShink.bottom - columnSetFlexShink_3.bottom)).assertEqual(vp2px(40))
      console.info('new testColumnSetFlexShink END');
      done();
    });
  })
}
