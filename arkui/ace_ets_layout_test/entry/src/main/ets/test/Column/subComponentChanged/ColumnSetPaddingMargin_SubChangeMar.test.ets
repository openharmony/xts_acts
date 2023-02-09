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
export default function ColumnSetPaddingMargin_SubChangeMar() {
  describe('ColumnSetPaddingMarginTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChangeMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetPaddingMargin_SubChangeMar state success " + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin_SubChangeMar" == pages.name)) {
          console.info("get ColumnSetPaddingMargin_SubChangeMar state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetPaddingMargin_SubChangeMar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingMargin_SubChangeMar page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("ColumnSetPaddingMargin_SubChangeMar after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1000
     * @tc.name      testColumnParentMarPadSubMargin
     * @tc.desc      Parent component set paddding and margin,subcomponent set margin.
     */
    it('testColumnParentMarPadSubMargin', 0, async function (done) {
      console.info('new testColumnParentMarPadSubMargin START');
      await CommonFunc.sleep(2000);
      let setPadMar01 = CommonFunc.getComponentRect('setPadMar01');
      let setPadMar02 = CommonFunc.getComponentRect('setPadMar02');
      let setPadMar03 = CommonFunc.getComponentRect('setPadMar03');
      let setPadMar = CommonFunc.getComponentRect('setPadMar');
      expect(Math.round(setPadMar01.top - setPadMar.top)).assertEqual(vp2px(40))
      expect(Math.round(setPadMar02.top - setPadMar01.bottom)).assertEqual(vp2px(50))
      expect(Math.round(setPadMar03.top - setPadMar02.bottom)).assertEqual(vp2px(30))
      expect(setPadMar.bottom).assertLess(setPadMar03.bottom)
      expect(Math.round(setPadMar01.right - setPadMar01.left)).assertEqual(vp2px(300))
      expect(Math.round(setPadMar02.right - setPadMar02.left)).assertEqual(vp2px(300))
      expect(Math.round(setPadMar03.right - setPadMar03.left)).assertEqual(vp2px(300))
      console.info('new testColumnParentMarPadSubMargin END');
      done();
    });
  })
}
