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
export default function AlignSpaceEvenly_AddMargin() {
  describe('AlignSpaceEvenly_AddMargin', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddMargin state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddMargin" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0500
     * @tc.name      testFlexAlignSpaceEvenlyFlexMargin
     * @tc.desc      The interface display where the child component is offset by the margin setting of the parent
     * component
     */
    it('testFlexAlignSpaceEvenlyFlexMargin', 0, async function (done) {
      console.info('[testFlexAlignSpaceEvenlyFlexMargin] START');
      globalThis.value.message.notify({name:'DadMargin',value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddMargin_011 = CommonFunc.getComponentRect('SpaceEvenly_AddMargin_011');
      let SpaceEvenly_AddMargin_012 = CommonFunc.getComponentRect('SpaceEvenly_AddMargin_012');
      let SpaceEvenly_AddMargin_013 = CommonFunc.getComponentRect('SpaceEvenly_AddMargin_013');
      let SpaceEvenly_AddMargin_01 = CommonFunc.getComponentRect('SpaceEvenly_AddMargin_01');
      let SpaceEvenly_AddMargin_01_Box = CommonFunc.getComponentRect('SpaceEvenly_AddMargin_01_Box');
      expect(Math.round(SpaceEvenly_AddMargin_011.top)).assertEqual(Math.round(SpaceEvenly_AddMargin_012.top));
      expect(Math.round(SpaceEvenly_AddMargin_013.top)).assertEqual(Math.round(SpaceEvenly_AddMargin_012.top));
      expect(Math.round(SpaceEvenly_AddMargin_011.top)).assertEqual(Math.round(SpaceEvenly_AddMargin_01.top));
      expect(Math.round(SpaceEvenly_AddMargin_011.left - SpaceEvenly_AddMargin_01.left))
        .assertEqual(Math.round(vp2px(12.5)));
      expect(Math.round(SpaceEvenly_AddMargin_012.left - SpaceEvenly_AddMargin_011.right))
        .assertEqual(Math.round(vp2px(12.5)));
      expect(Math.round(SpaceEvenly_AddMargin_013.left - SpaceEvenly_AddMargin_012.right))
        .assertEqual(Math.round(vp2px(12.5)));
      expect(Math.round(SpaceEvenly_AddMargin_01.left - SpaceEvenly_AddMargin_01_Box.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(SpaceEvenly_AddMargin_01.top - SpaceEvenly_AddMargin_01_Box.top)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(SpaceEvenly_AddMargin_011.right - SpaceEvenly_AddMargin_011.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(SpaceEvenly_AddMargin_012.right - SpaceEvenly_AddMargin_012.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(SpaceEvenly_AddMargin_013.right - SpaceEvenly_AddMargin_013.left)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(SpaceEvenly_AddMargin_011.bottom - SpaceEvenly_AddMargin_011.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(SpaceEvenly_AddMargin_012.bottom - SpaceEvenly_AddMargin_012.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(SpaceEvenly_AddMargin_013.bottom - SpaceEvenly_AddMargin_013.top)).assertEqual(Math.round(vp2px(150)));
      console.info('[testFlexAlignSpaceEvenlyFlexMargin] END');
      done();
    });
  })
}
