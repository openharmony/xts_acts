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
export default function AlignStart_AddPadding() {
  describe('AlignStart_AddPadding', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddPadding state success " + JSON.stringify(pages));
        if (!("AlignStart_AddPadding" == pages.name)) {
          console.info("get AlignStart_AddPadding state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddPadding page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0300
     * @tc.name      Align_Start_Row_AddPadding
     * @tc.desc      aceFlexAlignStartTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0300', 0, async function (done) {
      //await CommonFunc.sleep(2000);
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0300] START');
      globalThis.value.message.notify({name:'DadPadding', value:30});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddPadding_011 = CommonFunc.getComponentRect('Start_AddPadding_011');
      let Start_AddPadding_012 = CommonFunc.getComponentRect('Start_AddPadding_012');
      let Start_AddPadding_013 = CommonFunc.getComponentRect('Start_AddPadding_013');
      let Start_AddPadding_01 = CommonFunc.getComponentRect('Start_AddPadding_01');
      expect(Start_AddPadding_011.top).assertEqual(Start_AddPadding_012.top);
      expect(Start_AddPadding_012.top).assertEqual(Start_AddPadding_013.top);
      expect(Start_AddPadding_012.left).assertEqual(Start_AddPadding_011.right);
      expect(Start_AddPadding_013.left).assertEqual(Start_AddPadding_012.right);
      expect(Start_AddPadding_011.left - Start_AddPadding_01.left).assertEqual(vp2px(30));
      expect(Start_AddPadding_01.right - Start_AddPadding_013.right).assertEqual(vp2px(30));
      expect(Start_AddPadding_011.top - Start_AddPadding_01.top).assertEqual(vp2px(30));
      expect(Start_AddPadding_011.right - Start_AddPadding_011.left).assertEqual(vp2px(440/3));
      expect(Start_AddPadding_012.right - Start_AddPadding_012.left).assertEqual(vp2px(440/3));
      expect(Start_AddPadding_013.right - Start_AddPadding_013.left).assertEqual(vp2px(440/3));
      expect(Start_AddPadding_011.bottom - Start_AddPadding_011.top).assertEqual(vp2px(50));
      expect(Start_AddPadding_012.bottom - Start_AddPadding_012.top).assertEqual(vp2px(100));
      expect(Start_AddPadding_013.bottom - Start_AddPadding_013.top).assertEqual(vp2px(150));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0300] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0400
     * @tc.name      Align_Start_Row_AddPadding
     * @tc.desc      aceFlexAlignStartTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0400', 0, async function (done) {
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0400] START');
      globalThis.value.message.notify({name:'DadPadding', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddPadding_011 = CommonFunc.getComponentRect('Start_AddPadding_011')
      let Start_AddPadding_012 = CommonFunc.getComponentRect('Start_AddPadding_012')
      let Start_AddPadding_013 = CommonFunc.getComponentRect('Start_AddPadding_013')
      let Start_AddPadding_01 = CommonFunc.getComponentRect('Start_AddPadding_01')
      expect(Start_AddPadding_011.top).assertEqual(Start_AddPadding_012.top)
      expect(Start_AddPadding_012.top).assertEqual(Start_AddPadding_013.top)
      expect( Start_AddPadding_012.left ).assertEqual(Start_AddPadding_011.right)
      expect( Start_AddPadding_013.left ).assertEqual(Start_AddPadding_012.right)
      expect(Start_AddPadding_011.left - Start_AddPadding_01.left).assertEqual(vp2px(20));
      expect(Start_AddPadding_01.right - Start_AddPadding_013.right).assertEqual(vp2px(30));
      expect(Start_AddPadding_011.top - Start_AddPadding_01.top).assertEqual(vp2px(20));
      expect(Start_AddPadding_011.right - Start_AddPadding_011.left).assertEqual(vp2px(150));
      expect(Start_AddPadding_012.right - Start_AddPadding_012.left).assertEqual(vp2px(150));
      expect(Start_AddPadding_013.right - Start_AddPadding_013.left).assertEqual(vp2px(150));
      expect(Start_AddPadding_011.bottom - Start_AddPadding_011.top).assertEqual(vp2px(50));
      expect(Start_AddPadding_012.bottom - Start_AddPadding_012.top).assertEqual(vp2px(100));
      expect(Start_AddPadding_013.bottom - Start_AddPadding_013.top).assertEqual(vp2px(150));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0400] END');
      done();
    });
  })
}
