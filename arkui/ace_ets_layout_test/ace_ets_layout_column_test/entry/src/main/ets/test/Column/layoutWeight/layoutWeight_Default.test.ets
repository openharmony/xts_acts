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
export default function layoutWeight_Default() {
  describe('layoutWeight_Default', function () {
    beforeEach(async function (done) {
      console.info("layoutWeight_Default beforeEach start");
      let options = {
        url: "MainAbility/pages/Column/layoutWeight/layoutWeight_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get layoutWeight_Default state pages:" + JSON.stringify(pages));
        if (!("layoutWeight_Default" == pages.name)) {
          console.info("get layoutWeight_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push layoutWeight_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push layoutWeight_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("layoutWeight_Default after each called")
    });
    /**
     * @tc.number    SUB_ACE_layoutWeight_Default_TEST_0100
     * @tc.name      testLayoutWeight
     * @tc.desc      colum1 set layoutWeight(undefined),column1, column2, and column3 are displayed according to their own height
     */
    it('SUB_ACE_layoutWeight_Default_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0100] START');
      globalThis.value.message.notify({name:'layoutWeight1', value:undefined});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_011 = CommonFunc.getComponentRect('Column_layoutWeight_011');
      let Column_layoutWeight_012 = CommonFunc.getComponentRect('Column_layoutWeight_012');
      let Column_layoutWeight_013 = CommonFunc.getComponentRect('Column_layoutWeight_013');
      let Column_layoutWeight_01 = CommonFunc.getComponentRect('Column_layoutWeight_01');
      console.log('assert position')
      expect(Math.round(Column_layoutWeight_011.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_011.right));
      expect(Math.round(Column_layoutWeight_012.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_012.right));
      expect(Math.round(Column_layoutWeight_013.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_013.right));
      expect(Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)).assertEqual(Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_layoutWeight_012.top - Column_layoutWeight_011.bottom', + Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)
      console.log('Column_layoutWeight_013.top - Column_layoutWeight_012.bottom', + Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)
      expect(Column_layoutWeight_01.top).assertEqual(Column_layoutWeight_011.top);
      console.log('assert height')
      expect(Math.round(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_011.bottom - Column_layoutWeight_011.top', + Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)
      expect(Math.round(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_012.bottom - Column_layoutWeight_012.top', + Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)
      expect(Math.round(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_013.bottom - Column_layoutWeight_013.top', + Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)
      console.log('assert weight')
      expect(Math.round(Column_layoutWeight_011.right - Column_layoutWeight_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_012.right - Column_layoutWeight_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_013.right - Column_layoutWeight_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_layoutWeight_Default_TEST_0200
     * @tc.name      testLayoutWeight
     * @tc.desc      colum1 set layoutWeight(null),column1, column2, and column3 are displayed according to their own height
     */
    it('SUB_ACE_layoutWeight_Default_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0200] START');
      globalThis.value.message.notify({name:'layoutWeight1', value:null});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_011 = CommonFunc.getComponentRect('Column_layoutWeight_011');
      let Column_layoutWeight_012 = CommonFunc.getComponentRect('Column_layoutWeight_012');
      let Column_layoutWeight_013 = CommonFunc.getComponentRect('Column_layoutWeight_013');
      let Column_layoutWeight_01 = CommonFunc.getComponentRect('Column_layoutWeight_01');
      console.log('assert position')
      expect(Math.round(Column_layoutWeight_011.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_011.right));
      expect(Math.round(Column_layoutWeight_012.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_012.right));
      expect(Math.round(Column_layoutWeight_013.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_013.right));
      expect(Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)).assertEqual(Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_layoutWeight_012.top - Column_layoutWeight_011.bottom', + Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)
      console.log('Column_layoutWeight_013.top - Column_layoutWeight_012.bottom', + Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)
      expect(Column_layoutWeight_01.top).assertEqual(Column_layoutWeight_011.top);
      console.log('assert height')
      expect(Math.round(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_011.bottom - Column_layoutWeight_011.top', + Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)
      expect(Math.round(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_012.bottom - Column_layoutWeight_012.top', + Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)
      expect(Math.round(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_013.bottom - Column_layoutWeight_013.top', + Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)
      console.log('assert weight')
      expect(Math.round(Column_layoutWeight_011.right - Column_layoutWeight_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_012.right - Column_layoutWeight_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_013.right - Column_layoutWeight_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_layoutWeight_Default_TEST_0300
     * @tc.name      testLayoutWeight
     * @tc.desc      colum1 set layoutWeight(-10),column1, column2, and column3 are displayed according to their own height
     */
    it('SUB_ACE_layoutWeight_Default_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0300] START');
      globalThis.value.message.notify({name:'layoutWeight1', value:-10});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_011 = CommonFunc.getComponentRect('Column_layoutWeight_011');
      let Column_layoutWeight_012 = CommonFunc.getComponentRect('Column_layoutWeight_012');
      let Column_layoutWeight_013 = CommonFunc.getComponentRect('Column_layoutWeight_013');
      let Column_layoutWeight_01 = CommonFunc.getComponentRect('Column_layoutWeight_01');
      console.log('assert position')
      expect(Math.round(Column_layoutWeight_011.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_011.right));
      expect(Math.round(Column_layoutWeight_012.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_012.right));
      expect(Math.round(Column_layoutWeight_013.left - Column_layoutWeight_01.left)).assertEqual(Math.round(Column_layoutWeight_01.right - Column_layoutWeight_013.right));
      expect(Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)).assertEqual(Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_layoutWeight_012.top - Column_layoutWeight_011.bottom', + Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)
      console.log('Column_layoutWeight_013.top - Column_layoutWeight_012.bottom', + Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)
      expect(Column_layoutWeight_01.top).assertEqual(Column_layoutWeight_011.top);
      console.log('assert height')
      expect(Math.round(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_011.bottom - Column_layoutWeight_011.top', + Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)
      expect(Math.round(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_012.bottom - Column_layoutWeight_012.top', + Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)
      expect(Math.round(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_013.bottom - Column_layoutWeight_013.top', + Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)
      console.log('assert weight')
      expect(Math.round(Column_layoutWeight_011.right - Column_layoutWeight_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_012.right - Column_layoutWeight_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_013.right - Column_layoutWeight_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0300] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_layoutWeight_Default_TEST_0400
     * @tc.name      testLayoutWeight
     * @tc.desc      colum1 set layoutWeight('aaa'),column1, column2, and column3 are displayed according to their own height
     */
    it('SUB_ACE_layoutWeight_Default_TEST_0400', 0, async function (done) {
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0400] START');
      globalThis.value.message.notify({name:'layoutWeight2', value:'aaa'});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_021 = CommonFunc.getComponentRect('Column_layoutWeight_021');
      let Column_layoutWeight_022 = CommonFunc.getComponentRect('Column_layoutWeight_022');
      let Column_layoutWeight_023 = CommonFunc.getComponentRect('Column_layoutWeight_023');
      let Column_layoutWeight_02 = CommonFunc.getComponentRect('Column_layoutWeight_02');
      console.log('assert position')
      expect(Math.round(Column_layoutWeight_021.left - Column_layoutWeight_02.left)).assertEqual(Math.round(Column_layoutWeight_02.right - Column_layoutWeight_021.right));
      expect(Math.round(Column_layoutWeight_022.left - Column_layoutWeight_02.left)).assertEqual(Math.round(Column_layoutWeight_02.right - Column_layoutWeight_022.right));
      expect(Math.round(Column_layoutWeight_023.left - Column_layoutWeight_02.left)).assertEqual(Math.round(Column_layoutWeight_02.right - Column_layoutWeight_023.right));
      expect(Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)).assertEqual(Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom)).assertEqual(vp2px(10));
      expect(Column_layoutWeight_02.top).assertEqual(Column_layoutWeight_021.top);
      console.log('assert height')
      expect(Math.round(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_021.bottom - Column_layoutWeight_021.top', + Column_layoutWeight_021.bottom - Column_layoutWeight_021.top)
      expect(Math.round(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_022.bottom - Column_layoutWeight_022.top', + Column_layoutWeight_022.bottom - Column_layoutWeight_022.top)
      expect(Math.round(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top)).assertEqual(vp2px(100));
      console.log('Column_layoutWeight_023.bottom - Column_layoutWeight_023.top', + Column_layoutWeight_023.bottom - Column_layoutWeight_023.top)
      console.log('assert weight')
      expect(Math.round(Column_layoutWeight_021.right - Column_layoutWeight_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_022.right - Column_layoutWeight_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_layoutWeight_023.right - Column_layoutWeight_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_layoutWeight_Default_TEST_0400] END');
      done();
    });
  })
}