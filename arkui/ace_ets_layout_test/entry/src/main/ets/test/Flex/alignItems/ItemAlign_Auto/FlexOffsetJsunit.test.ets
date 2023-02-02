/**
 * Copyright (c) 2023-2030 iSoftStone Information Technology (Group) Co.,Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "../../../../MainAbility/common/Common";

export default function flexOffset_AutoJsunit() {
  describe('flexItemAlignAutoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/FlexOffset',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get flexOffsetTest state success " + JSON.stringify(pages));
        if (!("flexOffsetTest" == pages.name)) {
          console.info("get flexOffsetTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push flexOffsetTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexOffsetTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("flexOffsetTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_AUTO_0900
     * @tc.name      ItemAlign_Auto_FlexOffset
     * @tc.desc      aceFlexAlignItemTest
     */
    it('SUB_ACE_FLEXALIGNITEMS_AUTO_0900', 0, async function (done) {
      console.info('new SUB_ACE_FLEXALIGNITEMS_AUTO_0900 START');
      let strJson1 = getInspectorByKey('flexOffset');
      let obj1 = JSON.parse(strJson1);
      let textOffset01 = CommonFunc.getComponentRect('textOffset01');
      let textOffset02 = CommonFunc.getComponentRect('textOffset02');
      let textOffset03 = CommonFunc.getComponentRect('textOffset03');
      let flexOffset = CommonFunc.getComponentRect('flexOffset');
      expect(textOffset01.right - textOffset02.left).assertEqual(vp2px(15))
      expect(textOffset01.top - flexOffset.top).assertEqual(vp2px(30))
      expect(textOffset01.left - flexOffset.left).assertEqual(vp2px(15))
      expect(textOffset02.top).assertEqual(textOffset03.top)
      expect(textOffset03.top).assertEqual(flexOffset.top)

      expect(textOffset01.bottom - textOffset01.top).assertEqual(vp2px(50))
      expect(textOffset02.bottom - textOffset02.top).assertEqual(vp2px(100))
      expect(textOffset03.bottom - textOffset03.top).assertEqual(vp2px(150))
      expect(textOffset01.right - textOffset01.left).assertEqual(vp2px(150))
      expect(textOffset02.right - textOffset02.left).assertEqual(vp2px(150))
      expect(textOffset03.right - textOffset03.left).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Auto')
      console.info('new SUB_ACE_FLEXALIGNITEMS_AUTO_0900 END');
      done();
    });
  })
}
