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
export default function flexTextMargin_StretchJsunit() {
  describe('flexItemAlignStretchTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/FlexTextMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexTextMargin state success " + JSON.stringify(pages));
        if (!("FlexTextMargin" == pages.name)) {
          console.info("get FlexTextMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexTextMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexTextMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexTextMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_STRETCH_1400
     * @tc.name      testFlexItemAlignStretchSubSetMargin
     * @tc.desc      Subcomponents set margin within the scope of the parent component.
     */
    it('testFlexItemAlignStretchSubSetMargin', 0, async function (done) {
      console.info('new testFlexItemAlignStretchSubSetMargin START');
      globalThis.value.message.notify({name:'margin', value:10});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexTextMargin01');
      let obj1 = JSON.parse(strJson1);
      let textMargin01 = CommonFunc.getComponentRect('textMargin01');
      let textMargin02 = CommonFunc.getComponentRect('textMargin02');
      let textMargin03 = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01 = CommonFunc.getComponentRect('flexTextMargin01');
      expect(Math.round(textMargin01.left - flexTextMargin01.left)).assertEqual(vp2px(10))
      expect(Math.round(textMargin02.left - textMargin01.right)).assertEqual(vp2px(10))
      expect(textMargin03.left).assertEqual(textMargin02.right)
      expect(Math.round(flexTextMargin01.right - textMargin03.right)).assertEqual(vp2px(30))
      expect(textMargin02.top).assertEqual(textMargin03.top)
      expect(textMargin03.top).assertEqual(flexTextMargin01.top)
      expect(Math.round(textMargin01.top - flexTextMargin01.top)).assertEqual(vp2px(10))
      expect(textMargin02.bottom).assertEqual(textMargin03.bottom)
      expect(textMargin03.bottom).assertEqual(flexTextMargin01.bottom)
      expect(Math.round(flexTextMargin01.bottom - textMargin01.bottom)).assertEqual(vp2px(10))

      expect(Math.round(textMargin01.bottom - textMargin01.top)).assertEqual(vp2px(180))
      expect(Math.round(textMargin02.bottom - textMargin02.top)).assertEqual(vp2px(200))
      expect(Math.round(textMargin03.bottom - textMargin03.top)).assertEqual(vp2px(200))
      expect(Math.round(textMargin01.right - textMargin01.left)).assertEqual(vp2px(150))
      expect(Math.round(textMargin02.right - textMargin02.left)).assertEqual(vp2px(150))
      expect(Math.round(textMargin03.right - textMargin03.left)).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSubSetMargin END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_STRETCH_1500
     * @tc.name      testFlexItemAlignStretchSubSetMarginExceed
     * @tc.desc      Subcomponents set margin outside the scope of the parent component.
     */
    it('testFlexItemAlignStretchSubSetMarginExceed', 0, async function (done) {
      console.info('new testFlexItemAlignStretchSubSetMarginExceed START');
      globalThis.value.message.notify({name:'margin', value:30});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexTextMargin01');
      let obj1 = JSON.parse(strJson1);
      let textMargin01 = CommonFunc.getComponentRect('textMargin01');
      let textMargin02 = CommonFunc.getComponentRect('textMargin02');
      let textMargin03 = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01 = CommonFunc.getComponentRect('flexTextMargin01');
      expect(Math.round(textMargin01.left - flexTextMargin01.left)).assertEqual(vp2px(30))
      expect(Math.round(textMargin02.left - textMargin01.right)).assertEqual(vp2px(30))
      expect(textMargin03.left).assertEqual(textMargin02.right)
      expect(textMargin03.right).assertEqual(flexTextMargin01.right)
      expect(textMargin02.top).assertEqual(textMargin03.top)
      expect(textMargin03.top).assertEqual(flexTextMargin01.top)
      expect(Math.round(textMargin01.top - flexTextMargin01.top)).assertEqual(vp2px(30))
      expect(textMargin02.bottom).assertEqual(textMargin03.bottom)
      expect(textMargin03.bottom).assertEqual(flexTextMargin01.bottom)
      expect(Math.round(flexTextMargin01.bottom - textMargin01.bottom)).assertEqual(vp2px(30))
      expect(Math.round(textMargin01.bottom - textMargin01.top)).assertEqual(vp2px(140))
      expect(Math.round(textMargin02.bottom - textMargin02.top)).assertEqual(vp2px(200))
      expect(Math.round(textMargin03.bottom - textMargin03.top)).assertEqual(vp2px(200))
      expect(Math.round(textMargin01.right - textMargin01.left)).assertEqual(Math.round(vp2px(440/3)))
      expect(Math.round(textMargin02.right - textMargin02.left)).assertEqual(Math.round(vp2px(440/3)))
      expect(Math.round(textMargin03.right - textMargin03.left)).assertEqual(Math.round(vp2px(440/3)))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSubSetMarginExceed END');
      done();
    });
  })
}
