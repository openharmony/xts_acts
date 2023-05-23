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
export default function Row_flexBasis_Default() {
  describe('Row_flexBasis_Default', function () {
    beforeEach(async function (done) {
      console.info("Row_flexBasis_Default beforeEach start");
      let options = {
        url: "MainAbility/pages/Row/flexBasis/Row_flexBasis_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_flexBasis_Default state pages:" + JSON.stringify(pages));
        if (!("Row_flexBasis_Default" == pages.name)) {
          console.info("get Row_flexBasis_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_flexBasis_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_flexBasis_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Row_flexBasis_Default after each called")
    });
    /**
     * @tc.number    SUB_ACE_Row_flexBasis_Default_TEST_0100
     * @tc.name      testFlexBasis
     * @tc.desc      row1 is set to flexBasis(null) , the width of row1 is  the original width
     */
    it('SUB_ACE_Row_flexBasis_Default_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0100] START');
      globalThis.value.message.notify({name:'addflexBasis', value:null});

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_011 = CommonFunc.getComponentRect('Row_flexBasis_Default_011');
      let Row_flexBasis_Default_012 = CommonFunc.getComponentRect('Row_flexBasis_Default_012');
      let Row_flexBasis_Default_013 = CommonFunc.getComponentRect('Row_flexBasis_Default_013');
      let Row_flexBasis_Default_01 = CommonFunc.getComponentRect('Row_flexBasis_Default_01');

      console.log('assert position')
      expect(Math.round(Row_flexBasis_Default_011.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_011.bottom));
      expect(Math.round(Row_flexBasis_Default_012.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_012.bottom));
      expect(Math.round(Row_flexBasis_Default_013.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_013.bottom));

      console.log('assert space')
      expect(Math.round(Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)).assertEqual(vp2px(10));
      expect(Math.round(Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)).assertEqual(vp2px(10));
      console.log('Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right', + Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)
      console.log('Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right', + Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)

      console.log('assert height')
      expect(Math.round(Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top', + Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)
      expect(Math.round(Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top', + Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)
      expect(Math.round(Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top', + Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)
      console.log('assert weight')
      expect(Math.round(Row_flexBasis_Default_011.right - Row_flexBasis_Default_011.left)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Row_flexBasis_Default_012.right - Row_flexBasis_Default_012.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(Row_flexBasis_Default_013.right - Row_flexBasis_Default_013.left)).assertEqual(Math.round(vp2px(100)));
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Row_flexBasis_Default_TEST_0200
     * @tc.name      testFlexBasis
     * @tc.desc      row1 is set to flexBasis(undefined) , the width of row1 is  the original width
     */
    it('SUB_ACE_Row_flexBasis_Default_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0200] START');
      globalThis.value.message.notify({name:'addflexBasis', value:undefined});

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_011 = CommonFunc.getComponentRect('Row_flexBasis_Default_011');
      let Row_flexBasis_Default_012 = CommonFunc.getComponentRect('Row_flexBasis_Default_012');
      let Row_flexBasis_Default_013 = CommonFunc.getComponentRect('Row_flexBasis_Default_013');
      let Row_flexBasis_Default_01 = CommonFunc.getComponentRect('Row_flexBasis_Default_01');

      console.log('assert position')
      expect(Math.round(Row_flexBasis_Default_011.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_011.bottom));
      expect(Math.round(Row_flexBasis_Default_012.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_012.bottom));
      expect(Math.round(Row_flexBasis_Default_013.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_013.bottom));

      console.log('assert space')
      expect(Math.round(Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)).assertEqual(vp2px(10));
      expect(Math.round(Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)).assertEqual(vp2px(10));
      console.log('Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right', + Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)
      console.log('Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right', + Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)

      console.log('assert height')
      expect(Math.round(Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top', + Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)
      expect(Math.round(Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top', + Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)
      expect(Math.round(Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top', + Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)
      console.log('assert weight')
      expect(Math.round(Row_flexBasis_Default_011.right - Row_flexBasis_Default_011.left)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Row_flexBasis_Default_012.right - Row_flexBasis_Default_012.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(Row_flexBasis_Default_013.right - Row_flexBasis_Default_013.left)).assertEqual(Math.round(vp2px(100)));
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0200] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_Row_flexBasis_Default_TEST_0300
     * @tc.name      testFlexBasis
     * @tc.desc      row1 is set to flexBasis(-5) , the width of row1 is  the original width
     */
    it('SUB_ACE_Row_flexBasis_Default_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0300] START');
      globalThis.value.message.notify({name:'addflexBasis', value:-5});

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_011 = CommonFunc.getComponentRect('Row_flexBasis_Default_011');
      let Row_flexBasis_Default_012 = CommonFunc.getComponentRect('Row_flexBasis_Default_012');
      let Row_flexBasis_Default_013 = CommonFunc.getComponentRect('Row_flexBasis_Default_013');
      let Row_flexBasis_Default_01 = CommonFunc.getComponentRect('Row_flexBasis_Default_01');

      console.log('assert position')
      expect(Math.round(Row_flexBasis_Default_011.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_011.bottom));
      expect(Math.round(Row_flexBasis_Default_012.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_012.bottom));
      expect(Math.round(Row_flexBasis_Default_013.top - Row_flexBasis_Default_01.top)).assertEqual(Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_013.bottom));

      console.log('assert space')
      expect(Math.round(Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)).assertEqual(vp2px(10));
      expect(Math.round(Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)).assertEqual(vp2px(10));
      console.log('Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right', + Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)
      console.log('Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right', + Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)

      console.log('assert height')
      expect(Math.round(Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top', + Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)
      expect(Math.round(Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top', + Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)
      expect(Math.round(Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top', + Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)
      console.log('assert weight')
      expect(Math.round(Row_flexBasis_Default_011.right - Row_flexBasis_Default_011.left)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Row_flexBasis_Default_012.right - Row_flexBasis_Default_012.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(Row_flexBasis_Default_013.right - Row_flexBasis_Default_013.left)).assertEqual(Math.round(vp2px(100)));
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.name      testFlexBasis
     * @tc.desc      row1、row2 and row3 do not set  flexBasis, the width of column1 is  the original width
     */
    it('SUB_ACE_flexBasis_Type_TEST_0400', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] START');

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_021 = CommonFunc.getComponentRect('Row_flexBasis_Default_021');
      let Row_flexBasis_Default_022 = CommonFunc.getComponentRect('Row_flexBasis_Default_022');
      let Row_flexBasis_Default_023 = CommonFunc.getComponentRect('Row_flexBasis_Default_023');
      let Row_flexBasis_Default_02 = CommonFunc.getComponentRect('Row_flexBasis_Default_02');
      console.log('assert position')
      expect(Math.round(Row_flexBasis_Default_021.top - Row_flexBasis_Default_02.top)).assertEqual(Math.round(Row_flexBasis_Default_02.bottom - Row_flexBasis_Default_021.bottom));
      expect(Math.round(Row_flexBasis_Default_022.top - Row_flexBasis_Default_02.top)).assertEqual(Math.round(Row_flexBasis_Default_02.bottom - Row_flexBasis_Default_022.bottom));
      expect(Math.round(Row_flexBasis_Default_023.top - Row_flexBasis_Default_02.top)).assertEqual(Math.round(Row_flexBasis_Default_02.bottom - Row_flexBasis_Default_023.bottom));

      console.log('assert space')
      expect(Math.round(Row_flexBasis_Default_022.left - Row_flexBasis_Default_021.right)).assertEqual(vp2px(10));
      expect(Math.round(Row_flexBasis_Default_023.left - Row_flexBasis_Default_022.right)).assertEqual(vp2px(10));


      console.log('assert height')
      expect(Math.round(Row_flexBasis_Default_021.bottom - Row_flexBasis_Default_021.top)).assertEqual(vp2px(100));
      console.log('Row_flexBasis_Default_021.bottom - Row_flexBasis_Default_021.top', + Row_flexBasis_Default_021.bottom - Row_flexBasis_Default_021.top)
      expect(Math.round(Row_flexBasis_Default_022.bottom - Row_flexBasis_Default_022.top)).assertEqual(vp2px(100));
      console.log('Row_flexBasis_Default_022.bottom - Row_flexBasis_Default_022.top', + Row_flexBasis_Default_022.bottom - Row_flexBasis_Default_022.top)
      expect(Math.round(Row_flexBasis_Default_023.bottom - Row_flexBasis_Default_023.top)).assertEqual(vp2px(100));
      console.log('Row_flexBasis_Default_023.bottom - Row_flexBasis_Default_023.top', + Row_flexBasis_Default_023.bottom - Row_flexBasis_Default_023.top)
      console.log('assert weight')
      expect(Math.round(Row_flexBasis_Default_021.right - Row_flexBasis_Default_021.left)).assertEqual(vp2px(200));
      expect(Math.round(Row_flexBasis_Default_022.right - Row_flexBasis_Default_022.left)).assertEqual(vp2px(100));
      expect(Math.round(Row_flexBasis_Default_023.right - Row_flexBasis_Default_023.left)).assertEqual(vp2px(100));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
      done();
    });
  })
}