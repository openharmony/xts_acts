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
export default function AlignSpaceEvenly_AddOneMargin() {
  describe('AlignSpaceEvenly_AddOneMargin', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddOneMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddOneMargin state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddOneMargin" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddOneMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddOneMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddOneMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddOneMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1500
     * @tc.name      testFlexAlignSpaceEvenlyTextMarginMeet
     * @tc.desc      After setting margin for the first subcomponent, the layout of the parent component's spindle
     * meets the interface display of the subcomponent's layout
     */
    it('testFlexAlignSpaceEvenlyTextMarginMeet', 0, async function (done) {
      console.info('[testFlexAlignSpaceEvenlyTextMarginMeet] START');
      globalThis.value.message.notify({name:'OneMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddOneMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddOneMargin_011 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_011');
      let SpaceEvenly_AddOneMargin_012 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_012');
      let SpaceEvenly_AddOneMargin_013 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_013');
      let SpaceEvenly_AddOneMargin_01 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_01');
      expect(Math.round(SpaceEvenly_AddOneMargin_011.top - SpaceEvenly_AddOneMargin_01.top)).assertEqual(vp2px(20));
      expect(Math.round((SpaceEvenly_AddOneMargin_011.left - SpaceEvenly_AddOneMargin_01.left)*100)/100)
        .assertEqual(Math.round(vp2px(22.5)*100)/100);
      expect(Math.round((SpaceEvenly_AddOneMargin_013.left - SpaceEvenly_AddOneMargin_012.right)*100)/100)
        .assertEqual(Math.round(vp2px(2.5)*100)/100);
      expect(Math.round(SpaceEvenly_AddOneMargin_012.left - SpaceEvenly_AddOneMargin_011.right - vp2px(20)))
        .assertEqual(Math.round(SpaceEvenly_AddOneMargin_013.left - SpaceEvenly_AddOneMargin_012.right));
      expect(SpaceEvenly_AddOneMargin_013.top).assertEqual(SpaceEvenly_AddOneMargin_012.top);
      expect(SpaceEvenly_AddOneMargin_012.top).assertEqual(SpaceEvenly_AddOneMargin_01.top);
      expect(Math.round((SpaceEvenly_AddOneMargin_01.right - SpaceEvenly_AddOneMargin_013.right)*100)/100)
        .assertEqual(Math.round(vp2px(2.5)*100)/100);
      expect(Math.round(SpaceEvenly_AddOneMargin_011.bottom - SpaceEvenly_AddOneMargin_011.top)).assertEqual(vp2px(50));
      expect(Math.round(SpaceEvenly_AddOneMargin_012.bottom - SpaceEvenly_AddOneMargin_012.top)).assertEqual(vp2px(100));
      expect(Math.round(SpaceEvenly_AddOneMargin_013.bottom - SpaceEvenly_AddOneMargin_013.top)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddOneMargin_011.right - SpaceEvenly_AddOneMargin_011.left)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddOneMargin_012.right - SpaceEvenly_AddOneMargin_012.left)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddOneMargin_013.right - SpaceEvenly_AddOneMargin_013.left)).assertEqual(vp2px(150));
      console.info('[testFlexAlignSpaceEvenlyTextMarginMeet] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1600
     * @tc.name      testFlexAlignSpaceEvenlyTextMarginOverflow
     * @tc.desc      After setting margin for the first subcomponent, the layout of the parent component's spindle does
     * not meet the interface display of the subcomponent's layout
     */
    it('testFlexAlignSpaceEvenlyTextMarginOverflow', 0, async function (done) {
      console.info('[testFlexAlignSpaceEvenlyTextMarginOverflow] START');
      globalThis.value.message.notify({name:'OneMargin', value:30});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddOneMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddOneMargin_011 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_011');
      let SpaceEvenly_AddOneMargin_012 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_012');
      let SpaceEvenly_AddOneMargin_013 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_013');
      let SpaceEvenly_AddOneMargin_01 = CommonFunc.getComponentRect('SpaceEvenly_AddOneMargin_01');
      expect(Math.round(SpaceEvenly_AddOneMargin_011.top - SpaceEvenly_AddOneMargin_01.top)).assertEqual(vp2px(30));
      expect(Math.round(SpaceEvenly_AddOneMargin_011.left - SpaceEvenly_AddOneMargin_01.left))
        .assertEqual(vp2px(30));
      expect(Math.round(SpaceEvenly_AddOneMargin_012.left - SpaceEvenly_AddOneMargin_011.right))
        .assertEqual(Math.round(SpaceEvenly_AddOneMargin_011.left - SpaceEvenly_AddOneMargin_01.left));
      expect(SpaceEvenly_AddOneMargin_013.right).assertEqual(SpaceEvenly_AddOneMargin_01.right);
      expect(SpaceEvenly_AddOneMargin_013.top).assertEqual(SpaceEvenly_AddOneMargin_012.top);
      expect(SpaceEvenly_AddOneMargin_012.top).assertEqual(SpaceEvenly_AddOneMargin_01.top);
      expect(SpaceEvenly_AddOneMargin_012.right).assertEqual(SpaceEvenly_AddOneMargin_013.left);
      expect(Math.round(SpaceEvenly_AddOneMargin_011.bottom - SpaceEvenly_AddOneMargin_011.top)).assertEqual(vp2px(50));
      expect(Math.round(SpaceEvenly_AddOneMargin_012.bottom - SpaceEvenly_AddOneMargin_012.top)).assertEqual(vp2px(100));
      expect(Math.round(SpaceEvenly_AddOneMargin_013.bottom - SpaceEvenly_AddOneMargin_013.top)).assertEqual(vp2px(150));
      expect(Math.round(SpaceEvenly_AddOneMargin_011.right - SpaceEvenly_AddOneMargin_011.left))
        .assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(SpaceEvenly_AddOneMargin_012.right - SpaceEvenly_AddOneMargin_012.left))
        .assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(SpaceEvenly_AddOneMargin_013.right - SpaceEvenly_AddOneMargin_013.left))
        .assertEqual(Math.round(vp2px(440/3)));
      console.info('[testFlexAlignSpaceEvenlyTextMarginOverflow] END');
      done();
    })
  })
}
