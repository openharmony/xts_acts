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
export default function AlignEnd_AddPadding() {
  describe('AlignEnd_AddPadding', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddPadding'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddPadding state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddPadding" == pages.name)) {
          console.info("get AlignEnd_AddPadding state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_AddPadding page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0300
     * @tc.name      testFlexAlignEndFlexPadOverflow
     * @tc.desc      After subtracting the padding from the parent component layout space, the interface
     * display that does not meet the spindle layout of the child component
     */
    it('testFlexAlignEndFlexPadOverflow', 0, async function (done) {
      console.info('[testFlexAlignEndFlexPadOverflow] START');
      globalThis.value.message.notify({name:'DadPadding', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddPadding_011 = CommonFunc.getComponentRect('End_AddPadding_011');
      let End_AddPadding_012 = CommonFunc.getComponentRect('End_AddPadding_012');
      let End_AddPadding_013 = CommonFunc.getComponentRect('End_AddPadding_013');
      let End_AddPadding_01 = CommonFunc.getComponentRect('End_AddPadding_01');
      expect(End_AddPadding_011.top).assertEqual(End_AddPadding_012.top);
      expect(End_AddPadding_012.top).assertEqual(End_AddPadding_013.top);
      expect(End_AddPadding_012.left).assertEqual(End_AddPadding_011.right);
      expect(End_AddPadding_013.left).assertEqual(End_AddPadding_012.right);
      expect(Math.round(End_AddPadding_011.top - End_AddPadding_01.top)).assertEqual(vp2px(30));
      expect(Math.round(End_AddPadding_011.left - End_AddPadding_01.left)).assertEqual(vp2px(30));
      expect(Math.round(End_AddPadding_01.right - End_AddPadding_013.right)).assertEqual(vp2px(30));
      expect(Math.round(End_AddPadding_011.bottom - End_AddPadding_011.top)).assertEqual(vp2px(50));
      expect(Math.round(End_AddPadding_012.bottom - End_AddPadding_012.top)).assertEqual(vp2px(100));
      expect(Math.round(End_AddPadding_013.bottom - End_AddPadding_013.top)).assertEqual(vp2px(150));
      expect(Math.round(End_AddPadding_011.right - End_AddPadding_011.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(End_AddPadding_012.right - End_AddPadding_012.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(End_AddPadding_013.right - End_AddPadding_013.left)).assertEqual(Math.round(vp2px(440/3)));
      console.info('[testFlexAlignEndFlexPadOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0400
     * @tc.name      testFlexAlignEndFlexPadMeet
     * @tc.desc      After subtracting the padding from the parent component layout space, the interface that
     * satisfies the spindle layout of the child component is displayed
     */
    it('testFlexAlignEndFlexPadMeet', 0, async function (done) {
      console.info('[testFlexAlignEndFlexPadMeet] START');
      globalThis.value.message.notify({name:'DadPadding', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddPadding_011 = CommonFunc.getComponentRect('End_AddPadding_011');
      let End_AddPadding_012 = CommonFunc.getComponentRect('End_AddPadding_012');
      let End_AddPadding_013 = CommonFunc.getComponentRect('End_AddPadding_013');
      let End_AddPadding_01 = CommonFunc.getComponentRect('End_AddPadding_01');
      expect(End_AddPadding_011.top).assertEqual(End_AddPadding_012.top);
      expect(End_AddPadding_012.top).assertEqual(End_AddPadding_013.top);
      expect(End_AddPadding_011.right).assertEqual(End_AddPadding_012.left);
      expect(End_AddPadding_012.right).assertEqual(End_AddPadding_013.left);
      expect(Math.round(End_AddPadding_011.top - End_AddPadding_01.top)).assertEqual(vp2px(20));
      expect(Math.round(End_AddPadding_011.left - End_AddPadding_01.left)).assertEqual(vp2px(30));
      expect(Math.round(End_AddPadding_01.right - End_AddPadding_013.right)).assertEqual(vp2px(20));
      expect(Math.round(End_AddPadding_011.right - End_AddPadding_011.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddPadding_012.right - End_AddPadding_012.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddPadding_013.right - End_AddPadding_013.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddPadding_011.bottom - End_AddPadding_011.top)).assertEqual(vp2px(50));
      expect(Math.round(End_AddPadding_012.bottom - End_AddPadding_012.top)).assertEqual(vp2px(100));
      expect(Math.round(End_AddPadding_013.bottom - End_AddPadding_013.top)).assertEqual(vp2px(150));
      console.info('[testFlexAlignEndFlexPadMeet] END');
      done();
    });
  })
}
