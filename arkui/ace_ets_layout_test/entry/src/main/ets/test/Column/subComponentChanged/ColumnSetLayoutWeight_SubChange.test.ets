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
export default function ColumnSetLayoutWeight_SubChange() {
  describe('ColumnSetLayoutWeightTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetLayoutWeight_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SetLayoutWeight state success " + JSON.stringify(pages));
        if (!("SetLayoutWeight" == pages.name)) {
          console.info("get SetLayoutWeight state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SetLayoutWeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetLayoutWeight page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("SetLayoutWeight after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1700
     * @tc.name      testColumnSetLayoutWeightWithRateThreeTwoOne
     * @tc.desc      Subcomponents set layout weight(3-2-1) attribute.
     */
    it('testColumnSetLayoutWeightWithRateThreeTwoOne', 0, async function (done) {
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoOne START');
      await CommonFunc.sleep(1000);
      let layoutExpectHeight1 = 510/3;
      let layoutExpectHeight2 = 340/3;
      let layoutExpectHeight3 = 170/3;
      let setLayoutWeight1 = CommonFunc.getComponentRect('setLayoutWeight1');
      let setLayoutWeight2 = CommonFunc.getComponentRect('setLayoutWeight2');
      let setLayoutWeight3 = CommonFunc.getComponentRect('setLayoutWeight3');
      let setLayoutWeight = CommonFunc.getComponentRect('setLayoutWeight');

      expect(setLayoutWeight1.top).assertEqual(setLayoutWeight.top)
      expect(Math.round(setLayoutWeight2.top - setLayoutWeight1.bottom)).assertEqual(vp2px(30))
      expect(Math.round(setLayoutWeight3.top - setLayoutWeight2.bottom)).assertEqual(vp2px(30))
      expect(setLayoutWeight.bottom).assertEqual(setLayoutWeight3.bottom)

      expect(Math.round(setLayoutWeight1.bottom - setLayoutWeight1.top)).assertEqual(Math.round(vp2px(510/3)))
      expect(Math.round(setLayoutWeight2.bottom - setLayoutWeight2.top)).assertEqual(Math.round(vp2px(340/3)))
      expect(Math.round(setLayoutWeight3.bottom - setLayoutWeight3.top)).assertEqual(Math.round(vp2px(170/3)))
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoOne END');
      done();
    });
  })
}
