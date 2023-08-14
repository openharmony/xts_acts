/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
export default function columnNesting_alignItems() {
  describe('columnNesting_alignItems', function () {
    beforeEach(async function (done) {
      console.info("columnNesting_alignItems beforeEach start");
      let options = {
        url: "MainAbility/pages/Column/columnNesting/columnNesting_alignItems",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnNesting_alignItems state pages1:" + JSON.stringify(pages));
        if (!("columnNesting_alignItems" == pages.name)) {
          console.info("get columnNesting_alignItems pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          pages = router.getState();
          console.info("get columnNesting_alignItems state pages2:" + JSON.stringify(pages));
          console.info("push columnNesting_alignItems page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnNesting_alignItems page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("columnNesting_alignItems after each called")
    });

    /**
     * @tc.number    SUB_ACE_columnNesting_alignItems_TEST_0100
     * @tc.name      testColumnSpace
     * @tc.desc      column_1 and column_01, column_02 settings justifyContent do not affect each other
     */
    it('SUB_ACE_columnNesting_alignItems_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_columnNesting_alignItems_TEST_0100] START');
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let columnNesting_alignItems_011 = CommonFunc.getComponentRect('columnNesting_alignItems_011');
      let columnNesting_alignItems_012 = CommonFunc.getComponentRect('columnNesting_alignItems_012');
      let columnNesting_alignItems_013 = CommonFunc.getComponentRect('columnNesting_alignItems_013');
      let columnNesting_alignItems_01 = CommonFunc.getComponentRect('columnNesting_alignItems_01');
      let columnNesting_alignItems_021 = CommonFunc.getComponentRect('columnNesting_alignItems_021');
      let columnNesting_alignItems_022 = CommonFunc.getComponentRect('columnNesting_alignItems_022');
      let columnNesting_alignItems_023 = CommonFunc.getComponentRect('columnNesting_alignItems_023');
      let columnNesting_alignItems_02 = CommonFunc.getComponentRect('columnNesting_alignItems_02');
      let columnNesting_alignItems_1 = CommonFunc.getComponentRect('columnNesting_alignItems_1');
      console.log('assert position')
      expect(columnNesting_alignItems_011.left).assertEqual(columnNesting_alignItems_01.left );
      expect(columnNesting_alignItems_012.left).assertEqual(columnNesting_alignItems_01.left );
      expect(columnNesting_alignItems_013.left).assertEqual(columnNesting_alignItems_01.left );

      expect(columnNesting_alignItems_021.right).assertEqual(columnNesting_alignItems_02.right);
      expect(columnNesting_alignItems_022.right).assertEqual(columnNesting_alignItems_02.right);
      expect(columnNesting_alignItems_023.right).assertEqual(columnNesting_alignItems_02.right);

      expect(columnNesting_alignItems_01.top).assertEqual(columnNesting_alignItems_011.top);
      expect(columnNesting_alignItems_1.top).assertEqual(columnNesting_alignItems_01.top);

      console.log('assert space')
      expect(Math.round(columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom)).assertEqual(Math.round(columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom))
      expect(Math.round(columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom)).assertEqual(Math.round(columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom))

      expect(Math.round(columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom', + columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom)
      expect(Math.round(columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom', + columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom)
      expect(Math.round(columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom', + columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom)
      expect(Math.round(columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom', + columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom)
      expect(Math.round(columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom)).assertEqual(Math.round(vp2px(30)));
      console.log('columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom', + columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom)

      console.log('assert height')
      console.log('column_01 assert height')
      expect(Math.round(columnNesting_alignItems_011.bottom - columnNesting_alignItems_011.top)).assertEqual(vp2px(50));
      expect(Math.round(columnNesting_alignItems_012.bottom - columnNesting_alignItems_012.top)).assertEqual(vp2px(100));
      expect(Math.round(columnNesting_alignItems_013.bottom - columnNesting_alignItems_013.top)).assertEqual(vp2px(150));

      console.log('column_02 assert height')
      expect(Math.round(columnNesting_alignItems_021.bottom - columnNesting_alignItems_021.top)).assertEqual(vp2px(50));
      expect(Math.round(columnNesting_alignItems_022.bottom - columnNesting_alignItems_022.top)).assertEqual(vp2px(100));
      expect(Math.round(columnNesting_alignItems_023.bottom - columnNesting_alignItems_023.top)).assertEqual(vp2px(150));

      expect(Math.round(columnNesting_alignItems_01.bottom - columnNesting_alignItems_01.top)).assertEqual(vp2px(400));
      expect(Math.round(columnNesting_alignItems_02.bottom - columnNesting_alignItems_02.top)).assertEqual(vp2px(400));

      console.log('assert weight')
      console.log('column_01 assert weight')
      expect(Math.round(columnNesting_alignItems_011.right - columnNesting_alignItems_011.left)).assertEqual(vp2px(300));
      expect(Math.round(columnNesting_alignItems_012.right - columnNesting_alignItems_012.left)).assertEqual(vp2px(300));
      expect(Math.round(columnNesting_alignItems_013.right - columnNesting_alignItems_013.left)).assertEqual(vp2px(300));

      console.log('column_02 assert weight')
      expect(Math.round(columnNesting_alignItems_021.right - columnNesting_alignItems_021.left)).assertEqual(vp2px(300));
      expect(Math.round(columnNesting_alignItems_022.right - columnNesting_alignItems_022.left)).assertEqual(vp2px(300));
      expect(Math.round(columnNesting_alignItems_023.right - columnNesting_alignItems_023.left)).assertEqual(vp2px(300));

      expect(Math.round(columnNesting_alignItems_01.right - columnNesting_alignItems_01.left)).assertEqual(vp2px(350));
      expect(Math.round(columnNesting_alignItems_02.right - columnNesting_alignItems_02.left)).assertEqual(vp2px(350));

      console.info('[SUB_ACE_columnNesting_alignItems_TEST_0100] END');
      done();
    });
  })
}