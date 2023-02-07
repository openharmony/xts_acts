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
export default function AlignCenter_AddLayoutWeight() {
  describe('AlignCenter_AddLayoutWeight', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddLayoutWeight'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddLayoutWeight state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddLayoutWeight" == pages.name)) {
          console.info("get AlignCenter_AddLayoutWeight state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddLayoutWeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddLayoutWeight page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddLayoutWeight after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1200
     * @tc.name      Align_Center_Row_AddLayoutWeight
     * @tc.desc      aceFlexAlignCenterTest
     */
    it('SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1200', 0, async function (done) {
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1200] START');
      globalThis.value.message.notify({name:'OneLayoutWeight', value:1});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddLayoutWeight_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddLayoutWeight_011 = CommonFunc.getComponentRect('Center_AddLayoutWeight_011');
      let Center_AddLayoutWeight_012 = CommonFunc.getComponentRect('Center_AddLayoutWeight_012');
      let Center_AddLayoutWeight_013 = CommonFunc.getComponentRect('Center_AddLayoutWeight_013');
      let Center_AddLayoutWeight_01 = CommonFunc.getComponentRect('Center_AddLayoutWeight_01');
      expect(Center_AddLayoutWeight_011.top).assertEqual(Center_AddLayoutWeight_012.top);
      expect(Center_AddLayoutWeight_013.top).assertEqual(Center_AddLayoutWeight_012.top);
      expect(Center_AddLayoutWeight_011.top).assertEqual(Center_AddLayoutWeight_01.top);
      expect(Center_AddLayoutWeight_011.right).assertEqual(Center_AddLayoutWeight_012.left);
      expect(Center_AddLayoutWeight_012.right).assertEqual(Center_AddLayoutWeight_013.left);
      expect(Center_AddLayoutWeight_011.left).assertEqual(Center_AddLayoutWeight_01.left);
      expect(Center_AddLayoutWeight_013.right).assertEqual(Center_AddLayoutWeight_01.right);
      expect(Center_AddLayoutWeight_011.right - Center_AddLayoutWeight_011.left).assertEqual(vp2px(200));
      expect(Center_AddLayoutWeight_012.right - Center_AddLayoutWeight_012.left).assertEqual(vp2px(150));
      expect(Center_AddLayoutWeight_013.right - Center_AddLayoutWeight_013.left).assertEqual(vp2px(150));
      expect(Center_AddLayoutWeight_011.bottom - Center_AddLayoutWeight_011.top).assertEqual(vp2px(50));
      expect(Center_AddLayoutWeight_012.bottom - Center_AddLayoutWeight_012.top).assertEqual(vp2px(100));
      expect(Center_AddLayoutWeight_013.bottom - Center_AddLayoutWeight_013.top).assertEqual(vp2px(150));
      console.info('[SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1200] END');
      done();
    });
  })
}
