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

export default function AlignContent_FlexAlign_Center_Margin() {

  describe('AlignContent_FlexAlign_Center_Margin', function () {
    beforeEach(async function (done) {
    console.info("AlignContent_FlexAlign_Center_Margin beforeEach start")
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/Center/AlignContent_FlexAlign_Center_Margin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);

        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_Center_Margin state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_Center_Margin" == pages.name)) {
          console.info("get AlignContent_FlexAlign_Center_Margin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_FlexAlign_Center_Margin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_Center_Margin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
    console.info("AlignContent_FlexAlign_Center_Margin beforeEach end")
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)

      console.info("AlignContent_FlexAlign_Center_Margin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_CENTER_0500
     * @tc.name      testAlignContentCenterFlexMarginSatisfy
     * @tc.desc      Set the AlignContent property of the Flex component to FlexAlign.Center, and set the margin for 
     *               the flex component to meet the size requirements of the subcomponent.
     */

    it('testAlignContentCenterFlexMarginSatisfy', 0, async function (done) {
      console.info('testAlignContentCenterFlexMarginSatisfy START');
      let strJson = getInspectorByKey('AlignContentFlexCenterMargin_flex');
      let obj = JSON.parse(strJson);
      let Center_Margin_Column = CommonFunc.getComponentRect('AlignContentFlexCenterMargin_Column');
      let AlignContentFlexCenter_flex001 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin_flex');
      let AlignContentFlexCenter_1 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin_flex_1');
      let AlignContentFlexCenter_2 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin_flex_2');
      let AlignContentFlexCenter_3 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin_flex_3');
      let AlignContentFlexCenter_4 = CommonFunc.getComponentRect('AlignContentFlexCenterMargin_flex_4');

      console.log('AlignContentFlexCenterMargin_flex rect_value is:'+
      JSON.stringify(AlignContentFlexCenter_flex001));
      console.log('AlignContentFlexCenterMargin_flex_1 rect_value is:'+
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenterMargin_flex_2 rect_value is:'+
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenterMargin_flex_3 rect_value is:'+
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenterMargin_flex_4 rect_value is:'+
      JSON.stringify(AlignContentFlexCenter_4));

      expect(Math.round(AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top)).assertEqual(vp2px(50));
      expect(Math.round(AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top)).assertEqual(vp2px(100));
      expect(Math.round(AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top)).assertEqual(vp2px(200));
      expect(Math.round(AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left)).assertEqual(vp2px(150));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Center");
      
      expect(Math.round((AlignContentFlexCenter_flex001.top - Center_Margin_Column.top)*10)/10)
      .assertEqual(vp2px(15)) 
      expect(Math.round((AlignContentFlexCenter_1.top - Center_Margin_Column.top)*10)/10)
      .assertEqual(vp2px(45)) 
      
      expect(AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom)
      .assertEqual(AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex001.top);
      
      expect(Math.round(AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex001.top))
      .assertEqual(vp2px(30));
      
      expect(AlignContentFlexCenter_4.top).assertEqual(AlignContentFlexCenter_2.bottom);
      
      console.info('testAlignContentCenterFlexMarginSatisfy END');
      done();
    });
  })
}
