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
export default function ColumnSetMargin_SubChangeMar() {
  describe('ColumnSetMarginTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetMargin_SubChangeMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetMargin_SubChangeMar state success " + JSON.stringify(pages));
        if (!("ColumnSetMargin_SubChangeMar" == pages.name)) {
          console.info("get ColumnSetMargin_SubChangeMar state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetMargin_SubChangeMar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetMargin_SubChangeMar page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(3000);
      console.info("ColumnSetMargin_SubChangeMar after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0700
     * @tc.name      testColumnParentMarginSubMargin
     * @tc.desc      Parent component and subcomponent both set margin.
     */
    it('testColumnParentMarginSubMargin', 0, async function (done) {
      console.info('new testColumnParentMarginSubMargin START');
      await CommonFunc.sleep(2000);
      let columnSetMar_1 = CommonFunc.getComponentRect('columnSetMar_1');
      let columnSetMar_2 = CommonFunc.getComponentRect('columnSetMar_2');
      let columnSetMar_3 = CommonFunc.getComponentRect('columnSetMar_3');
      let columnSetMar = CommonFunc.getComponentRect('columnSetMar');
      expect(Math.round(columnSetMar_1.top - columnSetMar.top)).assertEqual(vp2px(20))
      expect(Math.round(columnSetMar_2.top - columnSetMar_1.bottom)).assertEqual(vp2px(50))
      expect(Math.round(columnSetMar_3.top - columnSetMar_2.bottom)).assertEqual(vp2px(30))
      expect(Math.round(columnSetMar_1.right - columnSetMar_1.left)).assertEqual(vp2px(300))
      expect(Math.round(columnSetMar_2.right - columnSetMar_2.left)).assertEqual(vp2px(300))
      expect(Math.round(columnSetMar_3.right - columnSetMar_3.left)).assertEqual(vp2px(300))
      expect(columnSetMar.bottom).assertEqual(columnSetMar_3.bottom)
      console.info('new testColumnParentMarginSubMargin END');
      done();
    });
  })
}
