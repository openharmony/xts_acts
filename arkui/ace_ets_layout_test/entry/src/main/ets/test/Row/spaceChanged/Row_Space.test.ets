/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../MainAbility/common/MessageManager';
export default function Row_Space() {
  describe('row_SpaceTest', function () {
    beforeEach(async function (done) {
      console.info("Row_Space beforeEach start");
      let options = {
        url: "MainAbility/pages/Row/spaceChanged/Row_Space",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_Space state pages:" + JSON.stringify(pages));
        if (!("Row_Space" == pages.name)) {
          console.info("get Row_Space pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Row_Space after each called")
    });
    /**
     * @tc.number    SUB_ACE_ROW_SPACE_TEST_0100
     * @tc.name      Row_Space
     * @tc.desc      aceRowSpaceTest
     */
    it('SUB_ACE_ROW_SPACE_0100', 0, async function (done) {
      console.info('[SUB_ACE_ROW_SPACE_TEST_0100] START');
      globalThis.value.message.notify({name:'addSpace', value:10});
      await CommonFunc.sleep(3000);
      let Row_Sapace_011 = CommonFunc.getComponentRect('Row_Sapace_011');
      let Row_Sapace_012 = CommonFunc.getComponentRect('Row_Sapace_012');
      let Row_Sapace_013 = CommonFunc.getComponentRect('Row_Sapace_013');
      let Row_Sapace_01 = CommonFunc.getComponentRect('Row_Sapace_01');
      expect(Row_Sapace_011.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_011.bottom);
      expect(Row_Sapace_012.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_012.bottom);
      expect(Row_Sapace_013.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_013.bottom);
      expect(Row_Sapace_012.left - Row_Sapace_011.right).assertEqual(Row_Sapace_013.left - Row_Sapace_012.right);
      expect(Row_Sapace_012.left - Row_Sapace_011.right).assertEqual(vp2px(10))
      expect(Row_Sapace_01.left).assertEqual(Row_Sapace_011.left);
      expect(Row_Sapace_013.right).assertLess(Row_Sapace_01.right);
      expect(Row_Sapace_011.bottom - Row_Sapace_011.top).assertEqual(vp2px(50));
      expect(Row_Sapace_012.bottom - Row_Sapace_012.top).assertEqual(vp2px(100));
      expect(Row_Sapace_013.bottom - Row_Sapace_013.top).assertEqual(vp2px(150));
      expect(Row_Sapace_011.right - Row_Sapace_011.left).assertEqual(vp2px(100));
      expect(Row_Sapace_012.right - Row_Sapace_012.left).assertEqual(vp2px(100));
      expect(Row_Sapace_013.right - Row_Sapace_013.left).assertEqual(vp2px(100));
      console.info('[SUB_ACE_ROW_SPACE_TEST_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SPACE_TEST_0200
     * @tc.name      Row_Space
     * @tc.desc      aceRowSpaceTest
     */
    it('SUB_ACE_ROW_SPACE_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_ROW_SPACE_TEST_0200] START');
      globalThis.value.message.notify({name:'addSpace', value:25});
      await CommonFunc.sleep(3000);
      let Row_Sapace_011 = CommonFunc.getComponentRect('Row_Sapace_011');
      let Row_Sapace_012 = CommonFunc.getComponentRect('Row_Sapace_012');
      let Row_Sapace_013 = CommonFunc.getComponentRect('Row_Sapace_013');
      let Row_Sapace_01 = CommonFunc.getComponentRect('Row_Sapace_01');
      expect(Row_Sapace_011.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_011.bottom);
      expect(Row_Sapace_012.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_012.bottom);
      expect(Row_Sapace_013.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_013.bottom);
      expect(Row_Sapace_012.left - Row_Sapace_011.right).assertEqual(Row_Sapace_013.left - Row_Sapace_012.right);
      expect(Row_Sapace_012.left - Row_Sapace_011.right).assertEqual(vp2px(25));
      expect(Row_Sapace_01.left).assertEqual(Row_Sapace_011.left);
      expect(Row_Sapace_013.right).assertEqual(Row_Sapace_01.right);
      expect(Row_Sapace_011.bottom - Row_Sapace_011.top).assertEqual(vp2px(50));
      expect(Row_Sapace_012.bottom - Row_Sapace_012.top).assertEqual(vp2px(100));
      expect(Row_Sapace_013.bottom - Row_Sapace_013.top).assertEqual(vp2px(150));
      expect(Row_Sapace_011.right - Row_Sapace_011.left).assertEqual(vp2px(100));
      expect(Row_Sapace_012.right - Row_Sapace_012.left).assertEqual(vp2px(100));
      expect(Row_Sapace_013.right - Row_Sapace_013.left).assertEqual(vp2px(100));
      console.info('[SUB_ACE_ROW_SPACE_TEST_0200] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SPACE_TEST_0300
     * @tc.name      Row_Space
     * @tc.desc      aceRowSpaceTest
     */
    it('SUB_ACE_ROW_SPACE_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_ROW_SPACE_TEST_0300] START');
      globalThis.value.message.notify({name:'addSpace', value:30});
      await CommonFunc.sleep(3000);
      let Row_Sapace_011 = CommonFunc.getComponentRect('Row_Sapace_011');
      let Row_Sapace_012 = CommonFunc.getComponentRect('Row_Sapace_012');
      let Row_Sapace_013 = CommonFunc.getComponentRect('Row_Sapace_013');
      let Row_Sapace_01 = CommonFunc.getComponentRect('Row_Sapace_01');
      expect(Row_Sapace_011.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_011.bottom);
      expect(Row_Sapace_012.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_012.bottom);
      expect(Row_Sapace_013.top - Row_Sapace_01.top).assertEqual(Row_Sapace_01.bottom - Row_Sapace_013.bottom);
      expect(Row_Sapace_012.left - Row_Sapace_011.right).assertEqual(Row_Sapace_013.left - Row_Sapace_012.right);
      expect(Row_Sapace_012.left - Row_Sapace_011.right).assertEqual(vp2px(30))
      expect(Row_Sapace_01.left).assertEqual(Row_Sapace_011.left);
      expect(Row_Sapace_013.right).assertLarger(Row_Sapace_01.right);
      expect(Row_Sapace_011.bottom - Row_Sapace_011.top).assertEqual(vp2px(50));
      expect(Row_Sapace_012.bottom - Row_Sapace_012.top).assertEqual(vp2px(100));
      expect(Row_Sapace_013.bottom - Row_Sapace_013.top).assertEqual(vp2px(150));
      expect(Row_Sapace_011.right - Row_Sapace_011.left).assertEqual(vp2px(100));
      expect(Row_Sapace_012.right - Row_Sapace_012.left).assertEqual(vp2px(100));
      expect(Row_Sapace_013.right - Row_Sapace_013.left).assertEqual(vp2px(100));
      console.info('[SUB_ACE_ROW_SPACE_TEST_0300] END');
      done();
    });
  })
}
