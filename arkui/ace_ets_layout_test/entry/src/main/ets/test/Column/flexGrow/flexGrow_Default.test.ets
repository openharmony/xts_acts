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
export default function flexGrow_Default() {
  describe('flexGrow_Default', function () {
    beforeEach(async function (done) {
      console.info("flexGrow_Default beforeEach start");
      let options = {
        url: "MainAbility/pages/Column/flexGrow/flexGrow_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexGrow_Default state pages:" + JSON.stringify(pages));
        if (!("flexGrow_Default" == pages.name)) {
          console.info("get flexGrow_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexGrow_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexGrow_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("flexGrow_Default after each called")
    });

    /**
     * @tc.number    SUB_ACE_flexGrow_Default_TEST_0100
     * @tc.name      testFlexGrow
     * @tc.desc      colum1、colum2、colum3 set flexGrow(null)
     */
    it('SUB_ACE_flexGrow_Default_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_flexGrow_Default_TEST_0100] START');
      globalThis.value.message.notify({name:'addflexGrow', value:null});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_Default_011 = CommonFunc.getComponentRect('Column_flexGrow_Default_011');
      let Column_flexGrow_Default_012 = CommonFunc.getComponentRect('Column_flexGrow_Default_012');
      let Column_flexGrow_Default_013 = CommonFunc.getComponentRect('Column_flexGrow_Default_013');
      let Column_flexGrow_Default_01 = CommonFunc.getComponentRect('Column_flexGrow_Default_01');
      console.log('assert position')
      expect(Math.round(Column_flexGrow_Default_011.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_011.right));
      expect(Math.round(Column_flexGrow_Default_012.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_012.right));
      expect(Math.round(Column_flexGrow_Default_013.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_013.right));
      expect(Math.round(Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)).assertEqual(Math.round(Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom', + Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)
      console.log('Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom', + Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom)
      expect(Column_flexGrow_Default_01.top).assertEqual(Column_flexGrow_Default_011.top);
      console.log('assert height')
      expect(Math.round(Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top', + Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top)
      expect(Math.round(Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top', + Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top)
      expect(Math.round(Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top', + Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexGrow_Default_011.right - Column_flexGrow_Default_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_012.right - Column_flexGrow_Default_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_013.right - Column_flexGrow_Default_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexGrow_Default_TEST_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexGrow_Default_TEST_0200
     * @tc.name      testFlexGrow
     * @tc.desc      colum1、colum2、colum3 set flexGrow(undefined)
     */
    it('SUB_ACE_flexGrow_Default_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_flexGrow_Default_TEST_0200] START');
      globalThis.value.message.notify({name:'addflexGrow', value:undefined});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_Default_011 = CommonFunc.getComponentRect('Column_flexGrow_Default_011');
      let Column_flexGrow_Default_012 = CommonFunc.getComponentRect('Column_flexGrow_Default_012');
      let Column_flexGrow_Default_013 = CommonFunc.getComponentRect('Column_flexGrow_Default_013');
      let Column_flexGrow_Default_01 = CommonFunc.getComponentRect('Column_flexGrow_Default_01');
      console.log('assert position')
      expect(Math.round(Column_flexGrow_Default_011.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_011.right));
      expect(Math.round(Column_flexGrow_Default_012.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_012.right));
      expect(Math.round(Column_flexGrow_Default_013.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_013.right));
      expect(Math.round(Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)).assertEqual(Math.round(Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom', + Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)
      console.log('Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom', + Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom)
      expect(Column_flexGrow_Default_01.top).assertEqual(Column_flexGrow_Default_011.top);
      console.log('assert height')
      expect(Math.round(Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top', + Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top)
      expect(Math.round(Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top', + Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top)
      expect(Math.round(Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top', + Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexGrow_Default_011.right - Column_flexGrow_Default_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_012.right - Column_flexGrow_Default_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_013.right - Column_flexGrow_Default_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexGrow_Default_TEST_0200] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexGrow_Default_TEST_0300
     * @tc.name      testFlexGrow
     * @tc.desc      colum1、colum2、colum3 set flexGrow(-5)
     */
    it('SUB_ACE_flexGrow_Default_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_flexGrow_Default_TEST_0300] START');
      globalThis.value.message.notify({name:'addflexGrow', value:-5});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_Default_011 = CommonFunc.getComponentRect('Column_flexGrow_Default_011');
      let Column_flexGrow_Default_012 = CommonFunc.getComponentRect('Column_flexGrow_Default_012');
      let Column_flexGrow_Default_013 = CommonFunc.getComponentRect('Column_flexGrow_Default_013');
      let Column_flexGrow_Default_01 = CommonFunc.getComponentRect('Column_flexGrow_Default_01');
      console.log('assert position')
      expect(Math.round(Column_flexGrow_Default_011.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_011.right));
      expect(Math.round(Column_flexGrow_Default_012.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_012.right));
      expect(Math.round(Column_flexGrow_Default_013.left - Column_flexGrow_Default_01.left)).assertEqual(Math.round(Column_flexGrow_Default_01.right - Column_flexGrow_Default_013.right));
      expect(Math.round(Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)).assertEqual(Math.round(Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom', + Column_flexGrow_Default_012.top - Column_flexGrow_Default_011.bottom)
      console.log('Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom', + Column_flexGrow_Default_013.top - Column_flexGrow_Default_012.bottom)
      expect(Column_flexGrow_Default_01.top).assertEqual(Column_flexGrow_Default_011.top);
      console.log('assert height')
      expect(Math.round(Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top', + Column_flexGrow_Default_011.bottom - Column_flexGrow_Default_011.top)
      expect(Math.round(Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top', + Column_flexGrow_Default_012.bottom - Column_flexGrow_Default_012.top)
      expect(Math.round(Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top', + Column_flexGrow_Default_013.bottom - Column_flexGrow_Default_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexGrow_Default_011.right - Column_flexGrow_Default_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_012.right - Column_flexGrow_Default_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_013.right - Column_flexGrow_Default_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexGrow_Default_TEST_0300] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexGrow_Default_TEST_0400
     * @tc.name      testFlexGrow
     * @tc.desc      colum1、colum2 and colum3 do not set flexGrow
     */
    it('SUB_ACE_flexGrow_Default_TEST_0400', 0, async function (done) {
      console.info('[SUB_ACE_flexGrow_Default_TEST_0400] START');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_Default_021 = CommonFunc.getComponentRect('Column_flexGrow_Default_021');
      let Column_flexGrow_Default_022 = CommonFunc.getComponentRect('Column_flexGrow_Default_022');
      let Column_flexGrow_Default_023 = CommonFunc.getComponentRect('Column_flexGrow_Default_023');
      let Column_flexGrow_Default_02 = CommonFunc.getComponentRect('Column_flexGrow_Default_02');
      console.log('assert position')
      expect(Math.round(Column_flexGrow_Default_021.left - Column_flexGrow_Default_02.left)).assertEqual(Math.round(Column_flexGrow_Default_02.right - Column_flexGrow_Default_021.right));
      expect(Math.round(Column_flexGrow_Default_022.left - Column_flexGrow_Default_02.left)).assertEqual(Math.round(Column_flexGrow_Default_02.right - Column_flexGrow_Default_022.right));
      expect(Math.round(Column_flexGrow_Default_023.left - Column_flexGrow_Default_02.left)).assertEqual(Math.round(Column_flexGrow_Default_02.right - Column_flexGrow_Default_023.right));
      expect(Math.round(Column_flexGrow_Default_022.top - Column_flexGrow_Default_021.bottom)).assertEqual(Math.round(Column_flexGrow_Default_023.top - Column_flexGrow_Default_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexGrow_Default_022.top - Column_flexGrow_Default_021.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexGrow_Default_023.top - Column_flexGrow_Default_022.bottom)).assertEqual(vp2px(10));
      expect(Column_flexGrow_Default_02.top).assertEqual(Column_flexGrow_Default_021.top);
      console.log('assert height')
      expect(Math.round(Column_flexGrow_Default_021.bottom - Column_flexGrow_Default_021.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_021.bottom - Column_flexGrow_Default_021.top', + Column_flexGrow_Default_021.bottom - Column_flexGrow_Default_021.top)
      expect(Math.round(Column_flexGrow_Default_022.bottom - Column_flexGrow_Default_022.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_022.bottom - Column_flexGrow_Default_022.top', + Column_flexGrow_Default_022.bottom - Column_flexGrow_Default_022.top)
      expect(Math.round(Column_flexGrow_Default_023.bottom - Column_flexGrow_Default_023.top)).assertEqual(vp2px(100));
      console.log('Column_flexGrow_Default_023.bottom - Column_flexGrow_Default_023.top', + Column_flexGrow_Default_023.bottom - Column_flexGrow_Default_023.top)
      console.log('assert weight')
      expect(Math.round(Column_flexGrow_Default_021.right - Column_flexGrow_Default_021.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_022.right - Column_flexGrow_Default_022.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexGrow_Default_023.right - Column_flexGrow_Default_023.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexGrow_Default_TEST_0400] END');
      done();
    });

  })
}