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
import { MessageManager,Callback } from '../../../../MainAbility/common/MessageManager';
export default function flexExceed_CenterJsunit() {
  describe('flexItemAlignCenterTest2', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/FlexExceed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexExceed state success " + JSON.stringify(pages));
        if (!("FlexExceed" == pages.name)) {
          console.info("get FlexExceed state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexExceed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexExceed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexExceed after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_CENTER_0600
     * @tc.name      testFlexItemAlignCenterSetMarPad
     * @tc.desc      Subcomponent inside when parent component set margin and padding.
     */
    it('testFlexItemAlignCenterSetMarPad', 0, async function (done) {
      console.info('new testFlexItemAlignCenterSetMarPad START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexExceed01');
      let obj1 = JSON.parse(strJson1);
      let textExceed01 = CommonFunc.getComponentRect('textExceed01');
      let textExceed02 = CommonFunc.getComponentRect('textExceed02');
      let textExceed03 = CommonFunc.getComponentRect('textExceed03');
      let flexExceed01 = CommonFunc.getComponentRect('flexExceed01');
      expect(Math.round(textExceed01.left - flexExceed01.left)).assertEqual(vp2px(10))
      expect(textExceed03.right).assertLess(flexExceed01.right)
      expect(textExceed01.top - flexExceed01.top).assertEqual(flexExceed01.bottom - textExceed01.bottom)
      expect(textExceed02.top - flexExceed01.top).assertEqual(flexExceed01.bottom - textExceed02.bottom)
      expect(textExceed03.top - flexExceed01.top).assertEqual(flexExceed01.bottom - textExceed03.bottom)
      expect(Math.round(textExceed01.bottom - textExceed01.top)).assertEqual(vp2px(50))
      expect(Math.round(textExceed02.bottom - textExceed02.top)).assertEqual(vp2px(100))
      expect(Math.round(textExceed03.bottom - textExceed03.top)).assertEqual(vp2px(150))
      expect(Math.round(textExceed01.right - textExceed01.left)).assertEqual(vp2px(150))
      expect(Math.round(textExceed02.right - textExceed02.left)).assertEqual(vp2px(150))
      expect(Math.round(textExceed03.right - textExceed03.left)).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterSetMarPad END');
      done();
    });

   
  })
}
