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
import CommonFunc from "../../../../MainAbility/common/Common";
export default function flexMargin_CenterJsunit() {
  describe('flexItemAlignCenterTest5', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/FlexMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexMargin state success " + JSON.stringify(pages));
        if (!("FlexMargin" == pages.name)) {
          console.info("get FlexMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_CENTER_0500
     * @tc.name      testItemAlignCenterParentSetMargin
     * @tc.desc      Parent component set margin attribute.
     */
    it('testItemAlignCenterParentSetMargin', 0, async function (done) {
      console.info('new testItemAlignCenterParentSetMargin START');
      let strJson1 = getInspectorByKey('flexMargin');
      let obj1 = JSON.parse(strJson1);
      let textFlexMargin01 = CommonFunc.getComponentRect('textFlexMargin01');
      let textFlexMargin02 = CommonFunc.getComponentRect('textFlexMargin02');
      let textFlexMargin03 = CommonFunc.getComponentRect('textFlexMargin03');
      let flexMargin = CommonFunc.getComponentRect('flexMargin');
      expect(textFlexMargin01.left).assertEqual(flexMargin.left)
      expect(textFlexMargin01.right).assertEqual(textFlexMargin02.left)
      expect(textFlexMargin02.right).assertEqual(textFlexMargin03.left)

      expect(Math.round(flexMargin.right - textFlexMargin03.right)).assertEqual(vp2px(50))
      expect(textFlexMargin01.top - flexMargin.top).assertEqual(flexMargin.bottom - textFlexMargin01.bottom)
      expect(textFlexMargin02.top - flexMargin.top).assertEqual(flexMargin.bottom - textFlexMargin02.bottom)
      expect(textFlexMargin03.top - flexMargin.top).assertEqual(flexMargin.bottom - textFlexMargin03.bottom)
      expect(Math.round(textFlexMargin01.bottom - textFlexMargin01.top)).assertEqual(vp2px(50))
      expect(Math.round(textFlexMargin02.bottom - textFlexMargin02.top)).assertEqual(vp2px(100))
      expect(Math.round(textFlexMargin03.bottom - textFlexMargin03.top)).assertEqual(vp2px(150))
      expect(Math.round(textFlexMargin01.right - textFlexMargin01.left)).assertEqual(vp2px(150))
      expect(Math.round(textFlexMargin02.right - textFlexMargin02.left)).assertEqual(vp2px(150))
      expect(Math.round(textFlexMargin03.right - textFlexMargin03.left)).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Center')
      console.info('new testItemAlignCenterParentSetMargin END');
      done();
    });

  })
}
