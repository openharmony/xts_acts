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
export default function AlignSpaceEvenly_AddAllSpace() {
  describe('AlignSpaceEvenly_AddAllSpace', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddAllSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddAllSpace state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddAllSpace" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddAllSpace state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddAllSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignAlignSpaceEvenly_AddAllSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignAlignSpaceEvenly_AddAllSpace after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0600
     * @tc.name      testFlexAlignSpaceEvenlyFlexSpaceOverflow
     * @tc.desc      the space of parent component set to 30
     */
    it('testFlexAlignSpaceEvenlyFlexSpaceOverflow', 0, async function (done) {
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceOverflow] START');
      globalThis.value.message.notify({name:'DadAllSpace', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddAllSpace_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddAllSpace_011 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_011');
      let SpaceEvenly_AddAllSpace_012 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_012');
      let SpaceEvenly_AddAllSpace_013 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_013');
      let SpaceEvenly_AddAllSpace_01 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01');
      let SpaceEvenly_AddAllSpace_01_Box = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01_Box');
      expect(SpaceEvenly_AddAllSpace_011.top).assertEqual(SpaceEvenly_AddAllSpace_012.top);
      expect(SpaceEvenly_AddAllSpace_012.top).assertEqual(SpaceEvenly_AddAllSpace_013.top);
      expect(Math.round(SpaceEvenly_AddAllSpace_011.top - SpaceEvenly_AddAllSpace_01.top)).assertEqual(vp2px(30));
      expect(Math.round(SpaceEvenly_AddAllSpace_01.right - SpaceEvenly_AddAllSpace_013.right)).assertEqual(vp2px(30));
      expect(Math.round(SpaceEvenly_AddAllSpace_011.left - SpaceEvenly_AddAllSpace_01.left)).assertEqual(vp2px(30));
      expect(SpaceEvenly_AddAllSpace_012.left).assertEqual(SpaceEvenly_AddAllSpace_011.right);
      expect(SpaceEvenly_AddAllSpace_013.left).assertEqual(SpaceEvenly_AddAllSpace_012.right);
      expect(Math.round(SpaceEvenly_AddAllSpace_01.left - SpaceEvenly_AddAllSpace_01_Box.left)).assertEqual(vp2px(10));
      expect(Math.round(SpaceEvenly_AddAllSpace_01.top - SpaceEvenly_AddAllSpace_01_Box.top)).assertEqual(vp2px(10));
      expect(Math.round(SpaceEvenly_AddAllSpace_011.bottom - SpaceEvenly_AddAllSpace_011.top)).assertEqual(vp2px(50));
      expect(Math.round(SpaceEvenly_AddAllSpace_012.bottom - SpaceEvenly_AddAllSpace_012.top)).assertEqual(vp2px(100));
      expect(Math.round(SpaceEvenly_AddAllSpace_013.bottom - SpaceEvenly_AddAllSpace_013.top)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddAllSpace_011.right - SpaceEvenly_AddAllSpace_011.left))
        .assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(SpaceEvenly_AddAllSpace_012.right - SpaceEvenly_AddAllSpace_012.left))
        .assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(SpaceEvenly_AddAllSpace_013.right - SpaceEvenly_AddAllSpace_013.left))
        .assertEqual(Math.round(vp2px(440/3)));
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0700
     * @tc.name      testFlexAlignSpaceEvenlyFlexSpaceMeet
     * @tc.desc      the space of parent component set to 20
     */
    it('testFlexAlignSpaceEvenlyFlexSpaceMeet', 0, async function (done) {
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceMeet] START');
      globalThis.value.message.notify({name:'DadAllSpace', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddAllSpace_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddAllSpace_011 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_011');
      let SpaceEvenly_AddAllSpace_012 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_012');
      let SpaceEvenly_AddAllSpace_013 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_013');
      let SpaceEvenly_AddAllSpace_01 = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01');
      let SpaceEvenly_AddAllSpace_01_Box = CommonFunc.getComponentRect('SpaceEvenly_AddAllSpace_01_Box');
      expect(SpaceEvenly_AddAllSpace_011.top).assertEqual(SpaceEvenly_AddAllSpace_012.top);
      expect(SpaceEvenly_AddAllSpace_012.top).assertEqual(SpaceEvenly_AddAllSpace_013.top);
      expect(Math.round(SpaceEvenly_AddAllSpace_011.top - SpaceEvenly_AddAllSpace_01.top)).assertEqual(vp2px(20));
      expect(Math.round((SpaceEvenly_AddAllSpace_01.right - SpaceEvenly_AddAllSpace_013.right)*100)/100)
        .assertEqual(Math.round(vp2px(22.5)*100)/100);
      expect(Math.round((SpaceEvenly_AddAllSpace_011.left - SpaceEvenly_AddAllSpace_01.left)*100)/100)
        .assertEqual(Math.round(vp2px(22.5)*100)/100);
      expect(Math.round(SpaceEvenly_AddAllSpace_01.left - SpaceEvenly_AddAllSpace_01_Box.left)).assertEqual(vp2px(10));
      expect(Math.round(SpaceEvenly_AddAllSpace_01.top - SpaceEvenly_AddAllSpace_01_Box.top)).assertEqual(vp2px(10));
      expect(Math.round(SpaceEvenly_AddAllSpace_011.right - SpaceEvenly_AddAllSpace_011.left)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddAllSpace_012.right - SpaceEvenly_AddAllSpace_012.left)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddAllSpace_013.right - SpaceEvenly_AddAllSpace_013.left)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddAllSpace_011.bottom - SpaceEvenly_AddAllSpace_011.top)).assertEqual(vp2px(50));
      expect(Math.round(SpaceEvenly_AddAllSpace_012.bottom - SpaceEvenly_AddAllSpace_012.top)).assertEqual(vp2px(100));
      expect(Math.round(SpaceEvenly_AddAllSpace_013.bottom - SpaceEvenly_AddAllSpace_013.top)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddAllSpace_012.left - SpaceEvenly_AddAllSpace_011.right))
        .assertEqual(Math.round(SpaceEvenly_AddAllSpace_013.left - SpaceEvenly_AddAllSpace_012.right));
      expect(Math.round((SpaceEvenly_AddAllSpace_012.left - SpaceEvenly_AddAllSpace_011.right)*100)/100)
        .assertEqual(Math.round(vp2px(2.5)*100)/100);
      console.info('[testFlexAlignSpaceEvenlyFlexSpaceMeet] END');
      done();
    });
  })
}
