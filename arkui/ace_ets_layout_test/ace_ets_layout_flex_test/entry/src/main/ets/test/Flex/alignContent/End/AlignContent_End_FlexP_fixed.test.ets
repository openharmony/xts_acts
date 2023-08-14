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
import CommonFunc from '../../../../MainAbility/common/Common'
import { MessageManager,Callback } from '../../../../MainAbility/common/MessageManager';
export default function AlignContent_End_FlexP_fixed() {

  describe('AlignContent_End_FlexP_fixed', function () {
    beforeEach(async function (done) {
	  console.info("AlignContent_End_FlexP_fixed beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/End/AlignContent_End_FlexP_fixed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_End_FlexP_fixed state success " + JSON.stringify(pages));
        if (!("AlignContent_End_FlexP_fixed" == pages.name)) {
          console.info("get AlignContent_End_FlexP_fixed state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_End_FlexP_fixed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_End_FlexP_fixed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
	  console.info("AlignContent_End_FlexP_fixed beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_End_FlexP_fixed after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_END_0800
     * @tc.name      testAlignContentEndFlexFixedSatisfy
     * @tc.desc      Set the AlignContent property of the Flex component to FlexAlign.End, and set the height of the 
     *               subcomponent to meet the height requirements of the subcomponent in the container.
     */

    it('testAlignContentEndFlexFixedSatisfy', 0, async function (done) {
      console.info('testAlignContentEndFlexFixedSatisfy START');
      globalThis.value.message.notify({ name:'height', value:80 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEndP_fixed_flex001');
      let obj = JSON.parse(strJson);
      console.info('flex [getInspectorByKey] is:'+ JSON.stringify(obj));
      console.info('flex obj.$attrs.constructor is:' +  JSON.stringify(obj.$attrs.constructor));
      let AlignContentFlexEnd_flex001 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_flex001');
      let AlignContentFlexEnd_1 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_1');
      let AlignContentFlexEnd_2 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_2');
      let AlignContentFlexEnd_3 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_3');
      let AlignContentFlexEnd_4 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_4');

      console.log('AlignContentFlexEnd_flex001 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_flex001));
 
      console.log('AlignContentFlexEnd_1 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_4));

      expect(Math.round(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top)).assertEqual(vp2px(80));
      expect(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top)).assertEqual(vp2px(100));
      expect(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top)).assertEqual(vp2px(200));
      expect(Math.round(AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left)).assertEqual(vp2px(150));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.End");
      expect(AlignContentFlexEnd_flex001.bottom).assertEqual(AlignContentFlexEnd_4.bottom);
      expect(AlignContentFlexEnd_4.top).assertEqual(AlignContentFlexEnd_3.bottom);
      expect(Math.round(AlignContentFlexEnd_2.top - AlignContentFlexEnd_flex001.top)).assertEqual(vp2px(50));
	  
      console.info('testAlignContentEndFlexFixedSatisfy END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_END_0900
     * @tc.name      testAlignContentEndFlexFixedNoSatisfy
     * @tc.desc      Set the AlignContent property of the Flex component to FlexAlign.End, and set the height of the 
     *               subcomponent to meet the height requirements of the subcomponent in the container.
     */

    it('testAlignContentEndFlexFixedNoSatisfy', 0, async function (done) {
      console.info('testAlignContentEndFlexFixedNoSatisfy START');
      globalThis.value.message.notify({ name:'height', value:300 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexEndP_fixed_flex001');
      let obj = JSON.parse(strJson);
      let AlignContentFlexEnd_flex002 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_flex001');
      let AlignContentFlexEnd_1 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_1');
      let AlignContentFlexEnd_2 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_2');
      let AlignContentFlexEnd_3 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_3');
      let AlignContentFlexEnd_4 = CommonFunc.getComponentRect('AlignContentFlexEndP_fixed_4');
  
      console.log('AlignContentFlexEndP_fixed_flex002 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_flex002))

      console.log('AlignContentFlexEnd_1 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:'+
      JSON.stringify(AlignContentFlexEnd_4));
      
      expect(Math.round(AlignContentFlexEnd_1.bottom - AlignContentFlexEnd_1.top)).assertEqual(vp2px(300));
      expect(Math.round(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top)).assertEqual(vp2px(100));
      expect(Math.round(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top)).assertEqual(vp2px(200));
      expect(Math.round(AlignContentFlexEnd_1.right - AlignContentFlexEnd_1.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left)).assertEqual(vp2px(150));
	  
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.End")
      expect(AlignContentFlexEnd_1.top).assertEqual(AlignContentFlexEnd_flex002.top);    
      expect(AlignContentFlexEnd_4.bottom).assertLarger(AlignContentFlexEnd_flex002.bottom);
      expect(AlignContentFlexEnd_1.bottom).assertEqual(AlignContentFlexEnd_4.top);
	  
      console.info('testAlignContentEndFlexFixedNoSatisfy END');
      done();
    });
  })
}
