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
export default function AlignCenter_AddOneMargin() {
  describe('AlignCenter_AddOneMargin', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddOneMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddOneMargin state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddOneMargin" == pages.name)) {
          console.info("get AlignCenter_AddOneMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddOneMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddOneMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddOneMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1400
     * @tc.name      Align_Center_Row_AddOneMargin
     * @tc.desc      aceFlexAlignCenterTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1400', 0, async function (done) {
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1400] START');
      globalThis.value.message.notify({name:'OneMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddOneMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddOneMargin_011 = CommonFunc.getComponentRect('Center_AddOneMargin_011');
      let Center_AddOneMargin_012 = CommonFunc.getComponentRect('Center_AddOneMargin_012');
      let Center_AddOneMargin_013 = CommonFunc.getComponentRect('Center_AddOneMargin_013');
      let Center_AddOneMargin_01 = CommonFunc.getComponentRect('Center_AddOneMargin_01');
      expect(Center_AddOneMargin_012.top).assertEqual(Center_AddOneMargin_01.top);
      expect(Center_AddOneMargin_013.top).assertEqual(Center_AddOneMargin_012.top);
      expect(Center_AddOneMargin_013.left).assertEqual(Center_AddOneMargin_012.right);
      expect(Center_AddOneMargin_011.left - Center_AddOneMargin_01.left).assertLess(vp2px(25));
      expect(Center_AddOneMargin_011.top - Center_AddOneMargin_01.top).assertLess(vp2px(20));
      expect(Center_AddOneMargin_012.left - Center_AddOneMargin_011.right).assertEqual(vp2px(20));
      expect(Center_AddOneMargin_01.right - Center_AddOneMargin_013.right).assertEqual(vp2px(5));
      expect(Center_AddOneMargin_011.bottom - Center_AddOneMargin_011.top).assertEqual(vp2px(50));
      expect(Center_AddOneMargin_012.bottom - Center_AddOneMargin_012.top).assertEqual(vp2px(100));
      expect(Center_AddOneMargin_013.bottom - Center_AddOneMargin_013.top).assertEqual(vp2px(150));
      expect(Center_AddOneMargin_011.left - Center_AddOneMargin_011.right).assertEqual(vp2px(150));
      expect(Center_AddOneMargin_012.left - Center_AddOneMargin_012.right).assertEqual(vp2px(150));
      expect(Center_AddOneMargin_013.left - Center_AddOneMargin_013.right).assertEqual(vp2px(150));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1400] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1500
     * @tc.name      Align_Center_Row_AddOneMargin
     * @tc.desc      aceFlexAlignCenterTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1500', 0, async function (done) {
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1500] START');
      globalThis.value.message.notify({name:'OneMargin', value:30});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddOneMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddOneMargin_011 = CommonFunc.getComponentRect('Center_AddOneMargin_011');
      let Center_AddOneMargin_012 = CommonFunc.getComponentRect('Center_AddOneMargin_012');
      let Center_AddOneMargin_013 = CommonFunc.getComponentRect('Center_AddOneMargin_013');
      let Center_AddOneMargin_01 = CommonFunc.getComponentRect('Center_AddOneMargin_01');
      expect(Center_AddOneMargin_01.top).assertEqual(Center_AddOneMargin_012.top);
      expect(Center_AddOneMargin_013.top).assertEqual(Center_AddOneMargin_012.top);
      expect(Center_AddOneMargin_011.left - Center_AddOneMargin_01.left).assertLess(vp2px(30));
      expect(Center_AddOneMargin_011.top - Center_AddOneMargin_01.top).assertLess(vp2px(30));
      expect(Center_AddOneMargin_012.left - Center_AddOneMargin_011.right).assertEqual(vp2px(30));
      expect(Center_AddOneMargin_012.right).assertEqual(Center_AddOneMargin_013.left);
      expect(Center_AddOneMargin_011.bottom - Center_AddOneMargin_011.top).assertEqual(vp2px(50));
      expect(Center_AddOneMargin_012.bottom - Center_AddOneMargin_012.top).assertEqual(vp2px(100));
      expect(Center_AddOneMargin_013.bottom - Center_AddOneMargin_013.top).assertEqual(vp2px(150));
      expect(Center_AddOneMargin_011.left - Center_AddOneMargin_011.right).assertEqual(vp2px(440/3));
      expect(Center_AddOneMargin_012.left - Center_AddOneMargin_012.right).assertEqual(vp2px(440/3));
      expect(Center_AddOneMargin_013.left - Center_AddOneMargin_013.right).assertEqual(vp2px(440/3));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1500] END');
      done();
    })
  })
}
