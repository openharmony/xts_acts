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
export default function ColumnSetOffset_SubChange() {
  describe('ColumnSetOffsetTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetOffset_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetOffset state success " + JSON.stringify(pages));
        if (!("SetOffset" == pages.name)) {
          console.info("get SetOffset state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetOffset page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetOffset page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("SetOffset after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1300
     * @tc.name      testColumnSubcomponentSetOffset
     * @tc.desc      The first subcomponent set offset attribute.
     */
    it('testColumnSubcomponentSetOffset', 0, async function (done) {
      console.info('new testColumnSubcomponentSetOffset START');
      globalThis.value.message.notify({name:'offset_x', value:10});
      globalThis.value.message.notify({name:'offset_y', value:10});
      await CommonFunc.sleep(2000);
      let columnOffset_1 = CommonFunc.getComponentRect('columnOffset_1');
      let columnOffset_2 = CommonFunc.getComponentRect('columnOffset_2');
      let columnOffset_3 = CommonFunc.getComponentRect('columnOffset_3');
      let columnOffset = CommonFunc.getComponentRect('columnOffset');
      expect(Math.round(columnOffset_1.left - columnOffset_2.left)).assertEqual(vp2px(10))
      expect(Math.round(columnOffset_1.top - columnOffset.top)).assertEqual(vp2px(10))
      expect(Math.round(columnOffset_2.top - columnOffset_1.bottom)).assertEqual(vp2px(20))
      expect(Math.round(columnOffset_3.top - columnOffset_2.bottom)).assertEqual(vp2px(30))
      expect(Math.round(columnOffset.bottom - columnOffset_3.bottom)).assertEqual(vp2px(40))
      console.info('new testColumnSubcomponentSetOffset END');
      done();
    });
  })
}
