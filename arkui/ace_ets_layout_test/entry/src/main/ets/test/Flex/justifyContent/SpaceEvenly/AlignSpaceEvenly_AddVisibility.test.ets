/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "./../../../../MainAbility/common/Common"
import {MessageManager,Callback} from './../../../../MainAbility/common/MessageManager';
export default function AlignSpaceEvenly_AddVisibility() {
  describe('AlignSpaceEvenly_AddVisibility', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddVisibility state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddVisibility" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddVisibility state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddVisibility page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddVisibility after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1000
     * @tc.name      Align_SpaceEvenly_Row_AddVisibility
     * @tc.desc      aceFlexAlignSpaceEvenlyTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1000', 0, async function (done) {
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1000] START');
      globalThis.value.message.notify({name:'OneVisibility', value:Visibility.None});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddVisibility_01');
      let obj = JSON.parse(strJson);
      let strJson2 = getInspectorByKey('SpaceEvenly_AddVisibility_011');
      let obj2 = JSON.parse(strJson2);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      expect(obj2.$attrs.visibility).assertEqual("Visibility.None");
      let SpaceEvenly_AddVisibility_012 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
      let SpaceEvenly_AddVisibility_013 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
      let SpaceEvenly_AddVisibility_01 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');
      expect(SpaceEvenly_AddVisibility_012.top).assertEqual(SpaceEvenly_AddVisibility_013.top);
      expect(SpaceEvenly_AddVisibility_012.top).assertEqual(SpaceEvenly_AddVisibility_01.top);
      expect(SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_01.left).assertEqual(vp2px(200/3));
      expect(SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right).assertEqual(vp2px(200/3));
      expect(SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right).assertEqual(vp2px(200/3));
      expect(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left ).assertEqual(vp2px(150));
      expect(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left ).assertEqual(vp2px(150));
      expect(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top ).assertEqual(vp2px(100));
      expect(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top ).assertEqual(vp2px(150));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1000] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1100
     * @tc.name      Align_SpaceEvenly_Row_AddVisibility
     * @tc.desc      aceFlexAlignSpaceEvenlyTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1100', 0, async function (done) {
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1100] START');
      globalThis.value.message.notify({name:'OneVisibility',value:Visibility.Hidden});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddVisibility_01');
      let obj = JSON.parse(strJson);
      let strJson2 = getInspectorByKey('SpaceEvenly_AddVisibility_011');
      let obj2 = JSON.parse(strJson2);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      expect(obj2.$attrs.visibility).assertEqual("Visibility.Hidden");
      let SpaceEvenly_AddVisibility_011 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
      let SpaceEvenly_AddVisibility_012 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
      let SpaceEvenly_AddVisibility_013 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
      let SpaceEvenly_AddVisibility_01 = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');
      expect(SpaceEvenly_AddVisibility_012.top).assertEqual(SpaceEvenly_AddVisibility_013.top);
      expect(SpaceEvenly_AddVisibility_012.top).assertEqual(SpaceEvenly_AddVisibility_01.top);
      expect(SpaceEvenly_AddVisibility_012.top).assertEqual(SpaceEvenly_AddVisibility_011.top);
      expect(SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left).assertEqual(vp2px(12.5));
      expect(SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right).assertEqual(vp2px(12.5));
      expect(SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right).assertEqual(vp2px(12.5));
      expect(SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right).assertEqual(vp2px(12.5));
      expect(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left).assertEqual(vp2px(150));
      expect(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left).assertEqual(vp2px(150));
      expect(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left).assertEqual(vp2px(150));
      expect(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top ).assertEqual(vp2px(50));
      expect(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top ).assertEqual(vp2px(100));
      expect(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top ).assertEqual(vp2px(150));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1100] END');
      done();
    });
  })
}
