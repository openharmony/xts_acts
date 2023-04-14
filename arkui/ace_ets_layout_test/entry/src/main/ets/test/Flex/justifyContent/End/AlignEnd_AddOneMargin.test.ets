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
import CommonFunc from "./../../../../MainAbility/common/Common"
export default function AlignEnd_AddOneMargin() {
  describe('AlignEnd_AddOneMargin', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddOneMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddOneMargin state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddOneMargin" == pages.name)) {
          console.info("get AlignEnd_AddOneMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddOneMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_AddOneMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddOneMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1400
     * @tc.name      testFlexAlignEndTextMarginMeet
     * @tc.desc      After setting margin for the first subcomponent, the layout of the parent component's spindle
     * meets the interface display of the subcomponent's layout
     */
    it('testFlexAlignEndTextMarginMeet', 0, async function (done) {
      console.info('[testFlexAlignEndTextMarginMeet] START');
      globalThis.value.message.notify({name:'OneMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddOneMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddOneMargin_011 = CommonFunc.getComponentRect('End_AddOneMargin_011');
      let End_AddOneMargin_012 = CommonFunc.getComponentRect('End_AddOneMargin_012');
      let End_AddOneMargin_013 = CommonFunc.getComponentRect('End_AddOneMargin_013');
      let End_AddOneMargin_01 = CommonFunc.getComponentRect('End_AddOneMargin_01');
      expect(Math.round(End_AddOneMargin_011.top - End_AddOneMargin_01.top)).assertEqual(vp2px(20));
      expect(Math.round(End_AddOneMargin_012.left - End_AddOneMargin_011.right)).assertEqual(vp2px(20));
      expect(Math.round(End_AddOneMargin_011.left - End_AddOneMargin_01.left)).assertEqual(vp2px(30));
      expect(End_AddOneMargin_013.top).assertEqual(End_AddOneMargin_012.top);
      expect(End_AddOneMargin_012.top).assertEqual(End_AddOneMargin_01.top);
      expect(End_AddOneMargin_013.left).assertEqual(End_AddOneMargin_012.right);
      expect(End_AddOneMargin_013.right).assertEqual(End_AddOneMargin_01.right);
      expect(Math.round(End_AddOneMargin_011.bottom - End_AddOneMargin_011.top)).assertEqual(vp2px(50));
      expect(Math.round(End_AddOneMargin_012.bottom - End_AddOneMargin_012.top)).assertEqual(vp2px(100));
      expect(Math.round(End_AddOneMargin_013.bottom - End_AddOneMargin_013.top)).assertEqual(vp2px(150));
      expect(Math.round(End_AddOneMargin_011.right - End_AddOneMargin_011.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddOneMargin_012.right - End_AddOneMargin_012.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddOneMargin_013.right - End_AddOneMargin_013.left)).assertEqual(vp2px(150));
      console.info('[testFlexAlignEndTextMarginMeet] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_1500
     * @tc.name      testFlexAlignEndTextMarginOverflow
     * @tc.desc      After setting margin for the first subcomponent, the layout of the parent component's spindle does
     * not meet the interface display of the subcomponent's layout
     */
    it('testFlexAlignEndTextMarginOverflow', 0, async function (done) {
      console.info('[testFlexAlignEndTextMarginOverflow] START');
      globalThis.value.message.notify({name:'OneMargin', value:30});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddOneMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddOneMargin_011 = CommonFunc.getComponentRect('End_AddOneMargin_011');
      let End_AddOneMargin_012 = CommonFunc.getComponentRect('End_AddOneMargin_012');
      let End_AddOneMargin_013 = CommonFunc.getComponentRect('End_AddOneMargin_013');
      let End_AddOneMargin_01 = CommonFunc.getComponentRect('End_AddOneMargin_01');
      expect(Math.round(End_AddOneMargin_011.top - End_AddOneMargin_01.top)).assertEqual(vp2px(30));
      expect(Math.round(End_AddOneMargin_012.left - End_AddOneMargin_011.right)).assertEqual(vp2px(30));
      expect(Math.round(End_AddOneMargin_011.left - End_AddOneMargin_01.left)).assertEqual(vp2px(30));
      expect(End_AddOneMargin_013.top).assertEqual(End_AddOneMargin_012.top);
      expect(End_AddOneMargin_012.top).assertEqual(End_AddOneMargin_01.top);
      expect(End_AddOneMargin_013.left).assertEqual(End_AddOneMargin_012.right);
      expect(End_AddOneMargin_013.right).assertEqual(End_AddOneMargin_01.right);
      expect(Math.round(End_AddOneMargin_011.bottom - End_AddOneMargin_011.top)).assertEqual(vp2px(50));
      expect(Math.round(End_AddOneMargin_012.bottom - End_AddOneMargin_012.top)).assertEqual(vp2px(100));
      expect(Math.round(End_AddOneMargin_013.bottom - End_AddOneMargin_013.top)).assertEqual(vp2px(150));
      expect(Math.round(End_AddOneMargin_011.right - End_AddOneMargin_011.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(End_AddOneMargin_012.right - End_AddOneMargin_012.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(End_AddOneMargin_013.right - End_AddOneMargin_013.left)).assertEqual(Math.round(vp2px(440/3)));
      console.info('[testFlexAlignEndTextMarginOverflow] END');
      done();
    })
  })
}
