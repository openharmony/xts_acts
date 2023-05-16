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
export default function flexBase_EndJsunit() {
  describe('flexItemAlignEndTest3', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/FlexBase',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexBase state success " + JSON.stringify(pages));
        if (!("FlexBase" == pages.name)) {
          console.info("get FlexBase state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexBase page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexBase page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexBase after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_END_0100
     * @tc.name      testFlexItemAlignEnd
     * @tc.desc      The subcomponent is inside the parent component.
     */
    it('testFlexItemAlignEnd', 0, async function (done) {
      console.info('new testFlexItemAlignEnd START');
      globalThis.value.message.notify({name:'height', value:200});
      globalThis.value.message.notify({name:'width', value:500});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flex01');
      let obj1 = JSON.parse(strJson1);
      let textFlex01 = CommonFunc.getComponentRect('textFlex01');
      let textFlex02 = CommonFunc.getComponentRect('textFlex02');
      let textFlex03 = CommonFunc.getComponentRect('textFlex03');
      let flex01 = CommonFunc.getComponentRect('flex01');
      expect(flex01.bottom).assertEqual(textFlex01.bottom)
      expect(textFlex01.bottom).assertEqual(textFlex02.bottom)
      expect(textFlex02.bottom).assertEqual(textFlex03.bottom)

      expect(textFlex01.right).assertEqual(textFlex02.left)
      expect(textFlex02.right).assertEqual(textFlex03.left)
      expect(Math.round(flex01.right - textFlex03.right)).assertEqual(vp2px(50))

      expect(Math.round(textFlex01.bottom - textFlex01.top)).assertEqual(vp2px(50))
      expect(Math.round(textFlex02.bottom - textFlex02.top)).assertEqual(vp2px(100))
      expect(Math.round(textFlex03.bottom - textFlex03.top)).assertEqual(vp2px(150))
      expect(Math.round(textFlex01.right - textFlex01.left)).assertEqual(vp2px(150))
      expect(Math.round(textFlex02.right - textFlex02.left)).assertEqual(vp2px(150))
      expect(Math.round(textFlex03.right - textFlex03.left)).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEnd END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_END_0200
     * @tc.name      testFlexItemAlignEndExceed
     * @tc.desc      The subcomponent exceeds the parent component.
     */
    it('testFlexItemAlignEndExceed', 0, async function (done) {
      console.info('new testFlexItemAlignEndExceed START');
      globalThis.value.message.notify({name:'height', value:140});
      globalThis.value.message.notify({name:'width', value:420});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flex01');
      let obj1 = JSON.parse(strJson1);
      let textFlex01 = CommonFunc.getComponentRect('textFlex01');
      let textFlex02 = CommonFunc.getComponentRect('textFlex02');
      let textFlex03 = CommonFunc.getComponentRect('textFlex03');
      let flex01 = CommonFunc.getComponentRect('flex01');
      expect(flex01.bottom).assertEqual(textFlex01.bottom)
      expect(textFlex01.bottom).assertEqual(textFlex02.bottom)
      expect(textFlex02.bottom).assertEqual(textFlex03.bottom)
      expect(textFlex03.bottom).assertEqual(flex01.bottom)
      expect(textFlex03.right).assertEqual(flex01.right)

      expect(Math.round(textFlex01.bottom - textFlex01.top)).assertEqual(vp2px(50))
      expect(Math.round(textFlex02.bottom - textFlex02.top)).assertEqual(vp2px(100))
      expect(Math.round(textFlex03.bottom - textFlex03.top)).assertEqual(vp2px(150))
      expect(Math.round(textFlex01.right - textFlex01.left)).assertEqual(vp2px(140))
      expect(Math.round(textFlex02.right - textFlex02.left)).assertEqual(vp2px(140))
      expect(Math.round(textFlex03.right - textFlex03.left)).assertEqual(vp2px(140))

      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEndExceed END');
      done();
    });
  })
}
