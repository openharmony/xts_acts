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
export default function flexShrink_Part() {
  describe('flexShrink_Part', function () {
    beforeEach(async function (done) {
      console.info("flexShrink_Part beforeEach start");
      let options = {
        url: "MainAbility/pages/Column/flexShrink/flexShrink_Part",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexShrink_Part state pages:" + JSON.stringify(pages));
        if (!("flexShrink_Part" == pages.name)) {
          console.info("get flexShrink_Part pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexShrink_Part page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexShrink_Part page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("flexShrink_Part after each called")
    });

    /**
     * @tc.number    SUB_ACE_flexShrink_Part_TEST_0100
     * @tc.name      testflexShrink
     * @tc.desc      colum2、colum3 set flexShrink(1)
     */
    it('SUB_ACE_flexShrink_Part_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_flexShrink_Part_TEST_0100] START');
      globalThis.value.message.notify({name:'addflexShrink', value:1});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011 = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012 = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013 = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01 = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left)).assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right));
      expect(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left)).assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right));
      expect(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left)).assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right));
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', + Column_flexShrink_012.top - Column_flexShrink_011.bottom)
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', + Column_flexShrink_013.top - Column_flexShrink_012.bottom)
      expect(Column_flexShrink_01.top).assertEqual(Column_flexShrink_011.top);
      expect(Column_flexShrink_013.bottom).assertEqual(Column_flexShrink_01.bottom);
      console.log('assert height')
      expect(Math.round(Column_flexShrink_011.bottom - Column_flexShrink_011.top)).assertEqual(vp2px(300));
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', + Column_flexShrink_011.bottom - Column_flexShrink_011.top)
      expect(Column_flexShrink_012.bottom - Column_flexShrink_012.top).assertEqual(vp2px(65));
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', + Column_flexShrink_012.bottom - Column_flexShrink_012.top)
      expect(Column_flexShrink_013.bottom - Column_flexShrink_013.top).assertEqual(vp2px(65));
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', + Column_flexShrink_013.bottom - Column_flexShrink_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexShrink_011.right - Column_flexShrink_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexShrink_012.right - Column_flexShrink_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexShrink_013.right - Column_flexShrink_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexShrink_Part_TEST_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_flexShrink_Part_TEST_0200
     * @tc.name      testflexShrink
     * @tc.desc     colum2、colum3 set flexShrink(2)
     */
    it('SUB_ACE_flexShrink_Part_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_flexShrink_Part_TEST_0200] START');
      globalThis.value.message.notify({name:'addflexShrink', value:2});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011 = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012 = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013 = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01 = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left)).assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right));
      expect(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left)).assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right));
      expect(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left)).assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right));
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(vp2px(10));
      expect(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)).assertEqual(vp2px(10));
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', + Column_flexShrink_012.top - Column_flexShrink_011.bottom)
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', + Column_flexShrink_013.top - Column_flexShrink_012.bottom)
      expect(Column_flexShrink_01.top).assertEqual(Column_flexShrink_011.top);
      expect(Column_flexShrink_013.bottom).assertEqual(Column_flexShrink_01.bottom);
      console.log('assert height')
      expect(Math.round(Column_flexShrink_011.bottom - Column_flexShrink_011.top)).assertEqual(vp2px(300));
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', + Column_flexShrink_011.bottom - Column_flexShrink_011.top)
      expect(Column_flexShrink_012.bottom - Column_flexShrink_012.top).assertEqual(vp2px(65));
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', + Column_flexShrink_012.bottom - Column_flexShrink_012.top)
      expect(Column_flexShrink_013.bottom - Column_flexShrink_013.top).assertEqual(vp2px(65));
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', + Column_flexShrink_013.bottom - Column_flexShrink_013.top)
      console.log('assert weight')
      expect(Math.round(Column_flexShrink_011.right - Column_flexShrink_011.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexShrink_012.right - Column_flexShrink_012.left)).assertEqual(vp2px(300));
      expect(Math.round(Column_flexShrink_013.right - Column_flexShrink_013.left)).assertEqual(vp2px(300));
      console.info('[SUB_ACE_flexShrink_Part_TEST_0200] END');
      done();
    });

  })
}