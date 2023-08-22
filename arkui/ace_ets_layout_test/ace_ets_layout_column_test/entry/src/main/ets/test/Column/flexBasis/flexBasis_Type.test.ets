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
export default function flexBasis_Type() {
  describe('flexBasis_Type', function () {
    beforeEach(async function (done) {
      console.info("flexBasis_Type beforeEach start");
      let options = {
        url: "MainAbility/pages/Column/flexBasis/flexBasis_Type",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexBasis_Type state pages:" + JSON.stringify(pages));
        if (!("flexBasis_Type" == pages.name)) {
          console.info("get flexBasis_Type pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexBasis_Type page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexBasis_Type page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("flexBasis_Type after each called")
    });
    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0100
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis(100) , the height of column1 is 100vp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0100] START');
      globalThis.value.message.notify({name:'addflexBasis1', value:100});
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011 = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012 = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013 = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01 = CommonFunc.getComponentRect('Column_flexBasis_01');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_011.left - Column_flexBasis_01.left)).assertEqual(Math.round(Column_flexBasis_01.right - Column_flexBasis_011.right));
      expect(Math.round(Column_flexBasis_012.left - Column_flexBasis_01.left)).assertEqual(Math.round(Column_flexBasis_01.right - Column_flexBasis_012.right));
      expect(Math.round(Column_flexBasis_013.left - Column_flexBasis_01.left)).assertEqual(Math.round(Column_flexBasis_01.right - Column_flexBasis_013.right));
      expect(Math.round(Column_flexBasis_012.top - Column_flexBasis_011.bottom)).assertEqual(Math.round(Column_flexBasis_013.top - Column_flexBasis_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexBasis_012.top - Column_flexBasis_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_013.top - Column_flexBasis_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexBasis_012.top - Column_flexBasis_011.bottom', + Column_flexBasis_012.top - Column_flexBasis_011.bottom)
      console.log('Column_flexBasis_013.top - Column_flexBasis_012.bottom', + Column_flexBasis_013.top - Column_flexBasis_012.bottom)
      expect(Column_flexBasis_01.top).assertEqual(Column_flexBasis_011.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_011.bottom - Column_flexBasis_011.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_011.bottom - Column_flexBasis_011.top', + Column_flexBasis_011.bottom - Column_flexBasis_011.top)
      expect(Math.round(Column_flexBasis_012.bottom - Column_flexBasis_012.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_012.bottom - Column_flexBasis_012.top', + Column_flexBasis_012.bottom - Column_flexBasis_012.top)
      expect(Math.round(Column_flexBasis_013.bottom - Column_flexBasis_013.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_013.bottom - Column_flexBasis_013.top', + Column_flexBasis_013.bottom - Column_flexBasis_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_011.right - Column_flexBasis_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_012.right - Column_flexBasis_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_013.right - Column_flexBasis_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0200
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis(0) , the height of column1 is  the original height
     */
    it('SUB_ACE_flexBasis_Type_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0200] START');
      globalThis.value.message.notify({name:'addflexBasis1', value:0});
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011 = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012 = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013 = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01 = CommonFunc.getComponentRect('Column_flexBasis_01');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_011.left - Column_flexBasis_01.left)).assertEqual(Math.round(Column_flexBasis_01.right - Column_flexBasis_011.right));
      expect(Math.round(Column_flexBasis_012.left - Column_flexBasis_01.left)).assertEqual(Math.round(Column_flexBasis_01.right - Column_flexBasis_012.right));
      expect(Math.round(Column_flexBasis_013.left - Column_flexBasis_01.left)).assertEqual(Math.round(Column_flexBasis_01.right - Column_flexBasis_013.right));
      expect(Math.round(Column_flexBasis_012.top - Column_flexBasis_011.bottom)).assertEqual(Math.round(Column_flexBasis_013.top - Column_flexBasis_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexBasis_012.top - Column_flexBasis_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_013.top - Column_flexBasis_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexBasis_012.top - Column_flexBasis_011.bottom', + Column_flexBasis_012.top - Column_flexBasis_011.bottom)
      console.log('Column_flexBasis_013.top - Column_flexBasis_012.bottom', + Column_flexBasis_013.top - Column_flexBasis_012.bottom)
      expect(Column_flexBasis_01.top).assertEqual(Column_flexBasis_011.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_011.bottom - Column_flexBasis_011.top)).assertEqual(vp2px(200));
      console.log('Column_flexBasis_011.bottom - Column_flexBasis_011.top', + Column_flexBasis_011.bottom - Column_flexBasis_011.top)
      expect(Math.round(Column_flexBasis_012.bottom - Column_flexBasis_012.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_012.bottom - Column_flexBasis_012.top', + Column_flexBasis_012.bottom - Column_flexBasis_012.top)
      expect(Math.round(Column_flexBasis_013.bottom - Column_flexBasis_013.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_013.bottom - Column_flexBasis_013.top', + Column_flexBasis_013.bottom - Column_flexBasis_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_011.right - Column_flexBasis_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_012.right - Column_flexBasis_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_013.right - Column_flexBasis_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0300
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis('auto') , the height of column1 is  the original height
     */
    it('SUB_ACE_flexBasis_Type_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0300] START');
      globalThis.value.message.notify({name:'addflexBasis2', value:'auto'});
      await CommonFunc.sleep(3000);
      let Column_flexBasis_021 = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022 = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023 = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02 = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_021.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_021.right));
      expect(Math.round(Column_flexBasis_022.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_022.right));
      expect(Math.round(Column_flexBasis_023.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_023.right));
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom)).assertEqual(vp2px(10));
      expect(Column_flexBasis_02.top).assertEqual(Column_flexBasis_021.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_021.bottom - Column_flexBasis_021.top)).assertEqual(vp2px(220));
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', + Column_flexBasis_021.bottom - Column_flexBasis_021.top)
      expect(Math.round(Column_flexBasis_022.bottom - Column_flexBasis_022.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', + Column_flexBasis_022.bottom - Column_flexBasis_022.top)
      expect(Math.round(Column_flexBasis_023.bottom - Column_flexBasis_023.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', + Column_flexBasis_023.bottom - Column_flexBasis_023.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_021.right - Column_flexBasis_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_022.right - Column_flexBasis_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_023.right - Column_flexBasis_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis('200vp') , the height of column1 is 200vp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0400', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] START');
      globalThis.value.message.notify({name:'addflexBasis2', value:'200vp'});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021 = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022 = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023 = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02 = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_021.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_021.right));
      expect(Math.round(Column_flexBasis_022.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_022.right));
      expect(Math.round(Column_flexBasis_023.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_023.right));
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom)).assertEqual(vp2px(10));
      expect(Column_flexBasis_02.top).assertEqual(Column_flexBasis_021.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_021.bottom - Column_flexBasis_021.top)).assertEqual(vp2px(200));
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', + Column_flexBasis_021.bottom - Column_flexBasis_021.top)
      expect(Math.round(Column_flexBasis_022.bottom - Column_flexBasis_022.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', + Column_flexBasis_022.bottom - Column_flexBasis_022.top)
      expect(Math.round(Column_flexBasis_023.bottom - Column_flexBasis_023.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', + Column_flexBasis_023.bottom - Column_flexBasis_023.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_021.right - Column_flexBasis_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_022.right - Column_flexBasis_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_023.right - Column_flexBasis_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0500
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis('200px') , the height of column1 is 200px
     */
    it('SUB_ACE_flexBasis_Type_TEST_0500', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] START');
      globalThis.value.message.notify({name:'addflexBasis2', value:'200px'});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021 = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022 = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023 = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02 = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_021.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_021.right));
      expect(Math.round(Column_flexBasis_022.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_022.right));
      expect(Math.round(Column_flexBasis_023.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_023.right));
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom)).assertEqual(vp2px(10));
      expect(Column_flexBasis_02.top).assertEqual(Column_flexBasis_021.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_021.bottom - Column_flexBasis_021.top)).assertEqual(200);
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', + Column_flexBasis_021.bottom - Column_flexBasis_021.top)
      expect(Math.round(Column_flexBasis_022.bottom - Column_flexBasis_022.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', + Column_flexBasis_022.bottom - Column_flexBasis_022.top)
      expect(Math.round(Column_flexBasis_023.bottom - Column_flexBasis_023.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', + Column_flexBasis_023.bottom - Column_flexBasis_023.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_021.right - Column_flexBasis_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_022.right - Column_flexBasis_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_023.right - Column_flexBasis_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0600
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis('200fp') , the height of column1 is 200fp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0600', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] START');
      globalThis.value.message.notify({name:'addflexBasis2', value:'200fp'});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021 = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022 = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023 = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02 = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_021.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_021.right));
      expect(Math.round(Column_flexBasis_022.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_022.right));
      expect(Math.round(Column_flexBasis_023.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_023.right));
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom)).assertEqual(vp2px(10));
      expect(Column_flexBasis_02.top).assertEqual(Column_flexBasis_021.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_021.bottom - Column_flexBasis_021.top)).assertEqual(fp2px(200));
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', + Column_flexBasis_021.bottom - Column_flexBasis_021.top)
      expect(Math.round(Column_flexBasis_022.bottom - Column_flexBasis_022.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', + Column_flexBasis_022.bottom - Column_flexBasis_022.top)
      expect(Math.round(Column_flexBasis_023.bottom - Column_flexBasis_023.top)).assertEqual(vp2px(100));
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', + Column_flexBasis_023.bottom - Column_flexBasis_023.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_021.right - Column_flexBasis_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_022.right - Column_flexBasis_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_023.right - Column_flexBasis_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexBasis_Type_TEST_0700
     * @tc.name      testFlexBasis
     * @tc.desc      column1 is set to flexBasis('200lpx') , the height of column1 is 200lpx
     */
    it('SUB_ACE_flexBasis_Type_TEST_0700', 0, async function (done) {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] START');
      globalThis.value.message.notify({name:'addflexBasis2', value:'200lpx'});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021 = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022 = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023 = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02 = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.round(Column_flexBasis_021.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_021.right));
      console.log('Column_flexBasis_021.left - Column_flexBasis_02.left', + Column_flexBasis_021.left - Column_flexBasis_02.left)
      expect(Math.round(Column_flexBasis_022.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_022.right));
      console.log('Column_flexBasis_022.left - Column_flexBasis_02.left', + Column_flexBasis_022.left - Column_flexBasis_02.left)
      expect(Math.round(Column_flexBasis_023.left - Column_flexBasis_02.left)).assertEqual(Math.round(Column_flexBasis_02.right - Column_flexBasis_023.right));
      console.log('Column_flexBasis_023.left - Column_flexBasis_02.left', + Column_flexBasis_023.left - Column_flexBasis_02.left)
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom));
      console.log('Column_flexBasis_022.top - Column_flexBasis_021.bottom', + Column_flexBasis_022.top - Column_flexBasis_021.bottom)

      console.log('assert space')
      expect(Math.round(Column_flexBasis_022.top - Column_flexBasis_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexBasis_023.top - Column_flexBasis_022.bottom)).assertEqual(vp2px(10));
      expect(Column_flexBasis_02.top).assertEqual(Column_flexBasis_021.top);
      console.log('assert height')
      expect(Math.round(Column_flexBasis_021.bottom - Column_flexBasis_021.top)).assertEqual(Math.round(lpx2px(200)));
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', + Column_flexBasis_021.bottom - Column_flexBasis_021.top)
      expect(Math.round(Column_flexBasis_022.bottom - Column_flexBasis_022.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', + Column_flexBasis_022.bottom - Column_flexBasis_022.top)
      expect(Math.round(Column_flexBasis_023.bottom - Column_flexBasis_023.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', + Column_flexBasis_023.bottom - Column_flexBasis_023.top)
      console.log('assert weight')
      expect(Math.round(Column_flexBasis_021.right - Column_flexBasis_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_022.right - Column_flexBasis_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexBasis_023.right - Column_flexBasis_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] END');
      done();
    });
  })
}