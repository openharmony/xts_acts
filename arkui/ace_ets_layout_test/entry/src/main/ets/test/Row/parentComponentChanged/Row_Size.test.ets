/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../../MainAbility/common/Common'
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function Row_Size() {

  describe('Row_Size', function () {
    beforeEach(async function (done) {
      console.info("Row_Size beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Row/parentComponentChanged/Row_Size',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Row_Size state success " + JSON.stringify(pages));
        if (!("Row_Size" == pages.name)) {
          console.info("get Row_Size state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_Size page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_Size page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_Size beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("Row_Size after each called");
    });

    /**
     * @tc.number    SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0100
     * @tc.name      testRowSizeBothSatisfy
     * @tc.desc      The height and width of the row component meet the requirements of the subcomponent
     */

    it('testRowSizeBothSatisfy', 0, async function (done) {
      console.info('testRowSizeBothSatisfy START');
      globalThis.value.message.notify({ name:'width', value:350 });
      globalThis.value.message.notify({ name:'height', value:200 });
      await CommonFunc.sleep(3000);
      let Row = CommonFunc.getComponentRect('Row_Size_Row');
      let Text1 = CommonFunc.getComponentRect('Row_Size_Text1');
      let Text2 = CommonFunc.getComponentRect('Row_Size_Text2');
      let Text3 = CommonFunc.getComponentRect('Row_Size_Text3');
      
      console.log('Row rect_value is:'+ JSON.stringify(Row));
      
      console.log('Text1 rect_value is:'+ JSON.stringify(Text1));
      console.log('Text2 rect_value is:'+ JSON.stringify(Text2));
      console.log('Text3 rect_value is:'+ JSON.stringify(Text3));
      
      expect(Math.round(Text1.bottom - Text1.top)).assertEqual(vp2px(50));
      expect(Math.round(Text2.bottom - Text2.top)).assertEqual(vp2px(100));
      expect(Math.round(Text3.bottom - Text3.top)).assertEqual(vp2px(150));
      expect(Math.round(Text1.right - Text1.left)).assertEqual(vp2px(100));
      expect(Math.round(Text2.right - Text2.left)).assertEqual(vp2px(100));
      expect(Math.round(Text3.right - Text3.left)).assertEqual(vp2px(100));
      
      expect(Text1.left).assertEqual(Row.left);
      
      expect(Text1.top - Row.top).assertEqual(Row.bottom - Text1.bottom);
      expect(Text2.top - Row.top).assertEqual(Row.bottom - Text2.bottom);
      expect(Text3.top - Row.top).assertEqual(Row.bottom - Text3.bottom);
      
      expect(Math.round(Text2.left - Text1.right)).assertEqual(vp2px(10));
      expect(Math.round(Text3.left - Text2.right)).assertEqual(vp2px(10));
      
      expect(Row.right).assertLarger(Text3.right);
      console.info('testRowSizeBothSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0200
     * @tc.name      testRowSizeWidthNOSatisfy
     * @tc.desc      Set the height and width of the row component. The width of the row component does not meet the 
     *               requirements of the subcomponent
     */

    it('testRowSizeWidthNOSatisfy', 0, async function (done) {
      console.info('testRowSizeWidthNOSatisfy START');
      globalThis.value.message.notify({ name:'width', value:200 });
      globalThis.value.message.notify({ name:'height', value:200 });
      await CommonFunc.sleep(3000)
      let Row = CommonFunc.getComponentRect('Row_Size_Row');
      let Text1 = CommonFunc.getComponentRect('Row_Size_Text1');
      let Text2 = CommonFunc.getComponentRect('Row_Size_Text2');
      let Text3 = CommonFunc.getComponentRect('Row_Size_Text3');
      
      console.log('Row rect_value is:'+ JSON.stringify(Row));
      
      console.log('Text1 rect_value is:'+ JSON.stringify(Text1));
      console.log('Text2 rect_value is:'+ JSON.stringify(Text2));
      console.log('Text3 rect_value is:'+ JSON.stringify(Text3));
      
      expect(Math.round(Text1.bottom - Text1.top)).assertEqual(vp2px(50));
      expect(Math.round(Text2.bottom - Text2.top)).assertEqual(vp2px(100));
      expect(Math.round(Text3.bottom - Text3.top)).assertEqual(vp2px(150));
      expect(Math.round(Text1.right - Text1.left)).assertEqual(vp2px(100));
      expect(Math.round(Text2.right - Text2.left)).assertEqual(vp2px(100));
      expect(Math.round(Text3.right - Text3.left)).assertEqual(vp2px(100));
      expect(Text1.left).assertEqual(Row.left);
      expect(Text1.top - Row.top).assertEqual(Row.bottom - Text1.bottom);
      expect(Text2.top - Row.top).assertEqual(Row.bottom - Text2.bottom);
      expect(Text3.top - Row.top).assertEqual(Row.bottom - Text3.bottom);
      expect(Math.round(Text2.left - Text1.right)).assertEqual(vp2px(10));
      expect(Math.round(Text3.left - Text2.right)).assertEqual(vp2px(10));
      expect(Text3.right).assertLarger(Row.right);
      
      console.info('testRowSizeWidthNOSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ROW_PARENTCOMPONENTCHANGED_0300
     * @tc.name      testRowSizeHeightNOSatisfy
     * @tc.desc      Set the height and width of the row component. The height of the row component does not meet the 
     *               requirements of the subcomponent
     */

    it('testRowSizeHeightNOSatisfy', 0, async function (done) {
      console.info('testRowSizeHeightNOSatisfy START');
      globalThis.value.message.notify({ name:'width', value:350 });
      globalThis.value.message.notify({ name:'height', value:100 });
      await CommonFunc.sleep(3000)
      let Row = CommonFunc.getComponentRect('Row_Size_Row');
      let Text1 = CommonFunc.getComponentRect('Row_Size_Text1');
      let Text2 = CommonFunc.getComponentRect('Row_Size_Text2');
      let Text3 = CommonFunc.getComponentRect('Row_Size_Text3');
      
      console.log('Row rect_value is:'+ JSON.stringify(Row));
      
      console.log('Text1 rect_value is:'+ JSON.stringify(Text1));
      console.log('Text2 rect_value is:'+ JSON.stringify(Text2));
      console.log('Text3 rect_value is:'+ JSON.stringify(Text3));
      
      expect(Math.round(Text1.bottom - Text1.top)).assertEqual(vp2px(50));
      expect(Math.round(Text2.bottom - Text2.top)).assertEqual(vp2px(100));
      expect(Math.round(Text3.bottom - Text3.top)).assertEqual(vp2px(150));
      expect(Math.round(Text1.right - Text1.left)).assertEqual(vp2px(100));
      expect(Math.round(Text2.right - Text2.left)).assertEqual(vp2px(100));
      expect(Math.round(Text3.right - Text3.left)).assertEqual(vp2px(100));
      
      expect(Text1.left).assertEqual(Row.left);
      expect(Text1.top - Row.top).assertEqual(Row.bottom - Text1.bottom);
      expect(Text2.top - Row.top).assertEqual(Row.bottom - Text2.bottom);
      expect(Text3.top - Row.top).assertEqual(Row.bottom - Text3.bottom);
      expect(Math.round(Text2.left - Text1.right)).assertEqual(vp2px(10));
      expect(Math.round(Text3.left - Text2.right)).assertEqual(vp2px(10));
      expect(Text3.bottom).assertLarger(Row.bottom);
      expect(Row.top).assertLarger(Text3.top);
      
      console.info('testRowSizeHeightNOSatisfy END');
      done();
    });
  })
}
