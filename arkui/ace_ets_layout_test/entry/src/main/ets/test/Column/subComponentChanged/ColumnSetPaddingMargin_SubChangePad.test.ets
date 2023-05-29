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
export default function ColumnSetPaddingMargin_SubChange() {
  describe('ColumnSetPaddingMarginTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChangePad',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetPaddingMargin state success " + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin" == pages.name)) {
          console.info("get ColumnSetPaddingMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetPaddingMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("ColumnSetPaddingMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_0900
     * @tc.name      testColumnParentMarPadSubPaddding
     * @tc.desc      Parent component set paddding and margin,subcomponent set paddding.
     */
    it('testColumnParentMarPadSubPaddding', 0, async function (done) {
      console.info('new testColumnParentMarPadSubPaddding START');
      await CommonFunc.sleep(2000);
      let setPaddingMargin_SubPad01 = CommonFunc.getComponentRect('setPaddingMargin_SubPad01');
      let setPaddingMargin_SubPad02 = CommonFunc.getComponentRect('setPaddingMargin_SubPad02');
      let setPaddingMargin_SubPad03 = CommonFunc.getComponentRect('setPaddingMargin_SubPad03');
      let setPaddingMargin_SubPad = CommonFunc.getComponentRect('setPaddingMargin_SubPad');
      expect(Math.round(setPaddingMargin_SubPad01.top - setPaddingMargin_SubPad.top)).assertEqual(vp2px(20))
      expect(Math.round(setPaddingMargin_SubPad02.top - setPaddingMargin_SubPad01.bottom)).assertEqual(vp2px(30))
      expect(Math.round(setPaddingMargin_SubPad03.top - setPaddingMargin_SubPad02.bottom)).assertEqual(vp2px(30))
      expect(Math.round(setPaddingMargin_SubPad.bottom - setPaddingMargin_SubPad03.bottom)).assertEqual(vp2px(20))
      expect(Math.round(setPaddingMargin_SubPad01.right - setPaddingMargin_SubPad01.left)).assertEqual(vp2px(300))
      expect(Math.round(setPaddingMargin_SubPad02.right - setPaddingMargin_SubPad02.left)).assertEqual(vp2px(300))
      expect(Math.round(setPaddingMargin_SubPad03.right - setPaddingMargin_SubPad03.left)).assertEqual(vp2px(300))
      console.info('new testColumnParentMarPadSubPaddding END');
      done();
    });
  })
}
