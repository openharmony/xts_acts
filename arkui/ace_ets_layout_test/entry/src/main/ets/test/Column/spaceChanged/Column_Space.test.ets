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
export default function Column_Space() {
  describe('column_SpaceTest', function () {
    beforeEach(async function (done) {
      console.info("Column_Space beforeEach start");
      let options = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Column_Space state pages:" + JSON.stringify(pages));
        if (!("Column_Space" == pages.name)) {
          console.info("get Column_Space pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Column_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Column_Space after each called")
    });
    /**
     * @tc.number    SUB_ACE_COLUMN_SPACE_TEST_0100
     * @tc.name      Column_Space
     * @tc.desc      aceColumnSpaceTest
     */
    it('SUB_ACE_COLUMN_SPACE_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_COLUMN_SPACE_TEST_0100] START');
      globalThis.value.message.notify({name:'addSpace', value:30});
      await CommonFunc.sleep(3000);
      let Column_Sapace_011 = CommonFunc.getComponentRect('Column_Sapace_011');
      let Column_Sapace_012 = CommonFunc.getComponentRect('Column_Sapace_012');
      let Column_Sapace_013 = CommonFunc.getComponentRect('Column_Sapace_013');
      let Column_Sapace_01 = CommonFunc.getComponentRect('Column_Sapace_01');
      expect(Column_Sapace_011.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_011.right);
      expect(Column_Sapace_012.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_012.right);
      expect(Column_Sapace_013.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_013.right);
      expect(Column_Sapace_012.top - Column_Sapace_011.bottom).assertEqual(Column_Sapace_013.top - Column_Sapace_012.bottom)
      expect(Column_Sapace_012.top - Column_Sapace_011.bottom).assertEqual(vp2px(30));
      expect(Column_Sapace_01.top).assertEqual(Column_Sapace_011.top);
      expect(Column_Sapace_013.bottom).assertLess(Column_Sapace_01.bottom);
      expect(Column_Sapace_011.bottom - Column_Sapace_011.top).assertEqual(vp2px(50));
      expect(Column_Sapace_012.bottom - Column_Sapace_012.top).assertEqual(vp2px(100));
      expect(Column_Sapace_013.bottom - Column_Sapace_013.top).assertEqual(vp2px(150));
      expect(Column_Sapace_011.right - Column_Sapace_011.left).assertEqual(vp2px(300));
      expect(Column_Sapace_012.right - Column_Sapace_012.left).assertEqual(vp2px(300));
      expect(Column_Sapace_013.right - Column_Sapace_013.left).assertEqual(vp2px(300));
      console.info('[SUB_ACE_COLUMN_SPACE_TEST_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_COLUMN_SPACE_TEST_0200
     * @tc.name      Column_Space
     * @tc.desc      aceColumnSpaceTest
     */
    it('SUB_ACE_COLUMN_SPACE_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_COLUMN_SPACE_TEST_0200] START');
      globalThis.value.message.notify({name:'addSpace', value:50});
      await CommonFunc.sleep(3000);
      let Column_Sapace_011 = CommonFunc.getComponentRect('Column_Sapace_011');
      let Column_Sapace_012 = CommonFunc.getComponentRect('Column_Sapace_012');
      let Column_Sapace_013 = CommonFunc.getComponentRect('Column_Sapace_013');
      let Column_Sapace_01 = CommonFunc.getComponentRect('Column_Sapace_01');
      expect(Column_Sapace_011.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_011.right);
      expect(Column_Sapace_012.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_012.right);
      expect(Column_Sapace_013.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_013.right);
      expect(Column_Sapace_012.top - Column_Sapace_011.bottom).assertEqual(Column_Sapace_013.top - Column_Sapace_012.bottom);
      expect(Column_Sapace_012.top - Column_Sapace_011.bottom).assertEqual(vp2px(50));
      expect(Column_Sapace_01.top).assertEqual(Column_Sapace_011.top);
      expect(Column_Sapace_013.bottom).assertEqual(Column_Sapace_01.bottom);
      expect(Column_Sapace_011.bottom - Column_Sapace_011.top).assertEqual(vp2px(50));
      expect(Column_Sapace_012.bottom - Column_Sapace_012.top).assertEqual(vp2px(100));
      expect(Column_Sapace_013.bottom - Column_Sapace_013.top).assertEqual(vp2px(150));
      expect(Column_Sapace_011.right - Column_Sapace_011.left).assertEqual(vp2px(300));
      expect(Column_Sapace_012.right - Column_Sapace_012.left).assertEqual(vp2px(300));
      expect(Column_Sapace_013.right - Column_Sapace_013.left).assertEqual(vp2px(300));
      console.info('[SUB_ACE_COLUMN_SPACE_TEST_0200] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_COLUMN_SPACE_TEST_0300
     * @tc.name      Column_Space
     * @tc.desc      aceColumnSpaceTest
     */
    it('SUB_ACE_COLUMN_SPACE_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_COLUMN_SPACE_TEST_0300] START');
      globalThis.value.message.notify({name:'addSpace', value:70});
      await CommonFunc.sleep(3000);
      let Column_Sapace_011 = CommonFunc.getComponentRect('Column_Sapace_011');
      let Column_Sapace_012 = CommonFunc.getComponentRect('Column_Sapace_012');
      let Column_Sapace_013 = CommonFunc.getComponentRect('Column_Sapace_013');
      let Column_Sapace_01 = CommonFunc.getComponentRect('Column_Sapace_01');
      expect(Column_Sapace_011.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_011.right);
      expect(Column_Sapace_012.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_012.right);
      expect(Column_Sapace_013.left - Column_Sapace_01.left).assertEqual(Column_Sapace_01.right - Column_Sapace_013.right);
      expect(Column_Sapace_012.top - Column_Sapace_011.bottom).assertEqual(Column_Sapace_013.top - Column_Sapace_012.bottom);
      expect(Column_Sapace_012.top - Column_Sapace_011.bottom).assertEqual(vp2px(70));
      expect(Column_Sapace_01.top).assertEqual(Column_Sapace_011.top);
      expect(Column_Sapace_013.bottom).assertLarger(Column_Sapace_01.bottom);
      expect(Column_Sapace_011.bottom - Column_Sapace_011.top).assertEqual(vp2px(50));
      expect(Column_Sapace_012.bottom - Column_Sapace_012.top).assertEqual(vp2px(100));
      expect(Column_Sapace_013.bottom - Column_Sapace_013.top).assertEqual(vp2px(150));
      expect(Column_Sapace_011.right - Column_Sapace_011.left).assertEqual(vp2px(300));
      expect(Column_Sapace_012.right - Column_Sapace_012.left).assertEqual(vp2px(300));
      expect(Column_Sapace_013.right - Column_Sapace_013.left).assertEqual(vp2px(300));
      console.info('[SUB_ACE_COLUMN_SPACE_TEST_0300] END');
      done();
    });
  })
}
