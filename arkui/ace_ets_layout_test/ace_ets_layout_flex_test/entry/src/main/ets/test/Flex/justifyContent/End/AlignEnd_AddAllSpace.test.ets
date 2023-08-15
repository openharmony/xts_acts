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
export default function AlignEnd_AddAllSpace() {
  describe('AlignEnd_AddAllSpace', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddAllSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddAllSpace state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddAllSpace" == pages.name)) {
          console.info("get AlignEnd_AddAllSpace state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddAllSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignAlignEnd_AddAllSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignAlignEnd_AddAllSpace after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0600
     * @tc.name      testFlexAlignEndFlexSpaceOverflow
     * @tc.desc      the space of parent component set to 30
     */
    it('testFlexAlignEndFlexSpaceOverflow', 0, async function (done) {
      console.info('[testFlexAlignEndFlexSpaceOverflow] START');
      globalThis.value.message.notify({name:'DadAllSpace', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddAllSpace_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddAllSpace_011 = CommonFunc.getComponentRect('End_AddAllSpace_011');
      let End_AddAllSpace_012 = CommonFunc.getComponentRect('End_AddAllSpace_012');
      let End_AddAllSpace_013 = CommonFunc.getComponentRect('End_AddAllSpace_013');
      let End_AddAllSpace_01 = CommonFunc.getComponentRect('End_AddAllSpace_01');
      let End_AddAllSpace_01_Box = CommonFunc.getComponentRect('End_AddAllSpace_01_Box');
      expect(End_AddAllSpace_011.top).assertEqual(End_AddAllSpace_012.top);
      expect(End_AddAllSpace_012.top).assertEqual(End_AddAllSpace_013.top);
      expect(End_AddAllSpace_012.left).assertEqual(End_AddAllSpace_011.right);
      expect(End_AddAllSpace_013.left).assertEqual(End_AddAllSpace_012.right);
      expect(Math.round(End_AddAllSpace_011.left - End_AddAllSpace_01.left)).assertEqual(vp2px(30));
      expect(Math.round(End_AddAllSpace_01.right - End_AddAllSpace_013.right)).assertEqual(vp2px(30));
      expect(Math.round(End_AddAllSpace_011.top - End_AddAllSpace_01.top)).assertEqual(vp2px(30));
      expect(Math.round(End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left)).assertEqual(vp2px(10));
      expect(Math.round(End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top)).assertEqual(vp2px(10));
      expect(Math.round(End_AddAllSpace_011.bottom - End_AddAllSpace_011.top)).assertEqual(vp2px(50));
      expect(Math.round(End_AddAllSpace_012.bottom - End_AddAllSpace_012.top)).assertEqual(vp2px(100));
      expect(Math.round(End_AddAllSpace_013.bottom - End_AddAllSpace_013.top)).assertEqual(vp2px(150));
      expect(Math.round(End_AddAllSpace_011.right - End_AddAllSpace_011.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(End_AddAllSpace_012.right - End_AddAllSpace_012.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(End_AddAllSpace_013.right - End_AddAllSpace_013.left)).assertEqual(Math.round(vp2px(440/3)));
      console.info('[testFlexAlignEndFlexSpaceOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0700
     * @tc.name      testFlexAlignEndFlexSpaceMeet
     * @tc.desc      the space of parent component set to 20
     */
    it('testFlexAlignEndFlexSpaceMeet', 0, async function (done) {
      console.info('[testFlexAlignEndFlexSpaceMeet] START');
      globalThis.value.message.notify({name:'DadAllSpace', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddAllSpace_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddAllSpace_011 = CommonFunc.getComponentRect('End_AddAllSpace_011');
      let End_AddAllSpace_012 = CommonFunc.getComponentRect('End_AddAllSpace_012');
      let End_AddAllSpace_013 = CommonFunc.getComponentRect('End_AddAllSpace_013');
      let End_AddAllSpace_01 = CommonFunc.getComponentRect('End_AddAllSpace_01');
      let End_AddAllSpace_01_Box = CommonFunc.getComponentRect('End_AddAllSpace_01_Box');
      expect(End_AddAllSpace_011.top).assertEqual(End_AddAllSpace_012.top);
      expect(End_AddAllSpace_012.top).assertEqual(End_AddAllSpace_013.top);
      expect(End_AddAllSpace_012.left).assertEqual(End_AddAllSpace_011.right);
      expect(End_AddAllSpace_013.left).assertEqual(End_AddAllSpace_012.right);
      expect(Math.round(End_AddAllSpace_011.left - End_AddAllSpace_01.left)).assertEqual(vp2px(30));
      expect(Math.round(End_AddAllSpace_01.right - End_AddAllSpace_013.right)).assertEqual(vp2px(20));
      expect(Math.round(End_AddAllSpace_011.top - End_AddAllSpace_01.top)).assertEqual(vp2px(20));
      expect(Math.round(End_AddAllSpace_01.left - End_AddAllSpace_01_Box.left)).assertEqual(vp2px(10));
      expect(Math.round(End_AddAllSpace_01.top - End_AddAllSpace_01_Box.top)).assertEqual(vp2px(10));
      expect(Math.round(End_AddAllSpace_011.right - End_AddAllSpace_011.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddAllSpace_012.right - End_AddAllSpace_012.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddAllSpace_013.right - End_AddAllSpace_013.left)).assertEqual(vp2px(150));
      expect(Math.round(End_AddAllSpace_011.bottom - End_AddAllSpace_011.top)).assertEqual(vp2px(50));
      expect(Math.round(End_AddAllSpace_012.bottom - End_AddAllSpace_012.top)).assertEqual(vp2px(100));
      expect(Math.round(End_AddAllSpace_013.bottom - End_AddAllSpace_013.top)).assertEqual(vp2px(150));
      console.info('[testFlexAlignEndFlexSpaceMeet] END');
      done();
    });
  })
}
