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
export default function ColumnSetPosition_SubChange() {
  describe('ColumnSetPositionTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPosition_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetPosition state success " + JSON.stringify(pages));
        if (!("SetPosition" == pages.name)) {
          console.info("get SetPosition state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetPosition page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetPosition page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("SetPosition after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1200
     * @tc.name      testColumnSubcomponentSetPosition
     * @tc.desc      The first subcomponent set position attribute.
     */
    it('testColumnSubcomponentSetPosition', 0, async function (done) {
      console.info('new testColumnSubcomponentSetPosition START');
      globalThis.value.message.notify({name:'position_x', value:10});
      globalThis.value.message.notify({name:'position_y', value:10});
      await CommonFunc.sleep(2000);
      let columnPosition_1 = CommonFunc.getComponentRect('columnPosition_1');
      let columnPosition_2 = CommonFunc.getComponentRect('columnPosition_2');
      let columnPosition_3 = CommonFunc.getComponentRect('columnPosition_3');
      let columnPosition = CommonFunc.getComponentRect('columnPosition');

      expect(Math.round(columnPosition_1.top - columnPosition.top)).assertEqual(vp2px(10))
      expect(Math.round(columnPosition_1.left - columnPosition.left)).assertEqual(vp2px(10))
      expect(columnPosition_2.top).assertEqual (columnPosition.top)
      expect(Math.round(columnPosition_3.top - columnPosition_2.bottom)).assertEqual(vp2px(30))
      expect(columnPosition_3.bottom).assertLess( columnPosition.bottom)
      console.info('new testColumnSubcomponentSetPosition END');
      done();
    });
  })
}
