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
export default function AlignContent_FlexAlign_Start_Margin_padding() {

  describe('AlignContent_FlexAlign_Start_Margin_padding', function () {
    beforeEach(async function (done) {
      console.info("AlignContent_FlexAlign_Start_Margin_padding beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_FlexAlign_Start_Margin_padding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_FlexAlign_Start_Margin_padding state success " + JSON.stringify(pages));
        if (!("AlignContent_FlexAlign_Start_Margin_padding" == pages.name)) {
          console.info("get AlignContent_FlexAlign_Start_Margin_padding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push AlignContent_FlexAlign_Start_Margin_padding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_FlexAlign_Start_Margin_padding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_FlexAlign_Start_Margin_padding beforeEach end");
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_FlexAlign_Start_Margin_padding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_START_0600
     * @tc.name      testAlignContentStartFlexMarginAndPaddingNOSatisfy
     * @tc.desc      Set the margin and padding for the flex component so that it does not meet the child component size
     *               requirements.
     */

    it('testAlignContentStartFlexMarginAndPaddingNOSatisfy', 0, async function (done) {
      console.info('testAlignContentStartFlexMarginAndPaddingNOSatisfy START');
      globalThis.value.message.notify({ name:'padding', value:40 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexStartMargin&padding_flex001');
      let obj = JSON.parse(strJson);
      let Start_Margin_Column_1 = CommonFunc.getComponentRect('AlignContentFlexStartMargin&padding_Column_1');
      let AlignContentFlexStart_flex001 = CommonFunc.getComponentRect('AlignContentFlexStartMargin&padding_flex001');
      let AlignContentFlexStart_1 = CommonFunc.getComponentRect('AlignContentFlexStartMargin&padding_flex001_1');
      let AlignContentFlexStart_2 = CommonFunc.getComponentRect('AlignContentFlexStartMargin&padding_flex001_2');
      let AlignContentFlexStart_3 = CommonFunc.getComponentRect('AlignContentFlexStartMargin&padding_flex001_3');
      let AlignContentFlexStart_4 = CommonFunc.getComponentRect('AlignContentFlexStartMargin&padding_flex001_4');
 
      console.log('AlignContentFlexStartMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStartMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStartMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStartMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStartMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));
 
      expect(Math.round(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top)).assertEqual(vp2px(50));
      expect(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top)).assertEqual(vp2px(100));
      expect(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top)).assertEqual(vp2px(200));
      expect(Math.round(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left)).assertEqual(vp2px(150));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      
      expect(Math.round(AlignContentFlexStart_flex001.top - Start_Margin_Column_1.top)).assertEqual(vp2px(10)) 
      expect(Math.round(AlignContentFlexStart_1.top - Start_Margin_Column_1.top)).assertEqual(vp2px(50))   
      expect(AlignContentFlexStart_4.top).assertEqual(AlignContentFlexStart_2.bottom);
      expect(AlignContentFlexStart_flex001.bottom - AlignContentFlexStart_4.bottom).assertLess(vp2px(40));
      
      console.info('testAlignContentStartFlexMarginAndPaddingNOSatisfy END');
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_START_0700
     * @tc.name      testAlignContentStartFlexMarginAndPaddingSatisfy
     * @tc.desc      Set the margin and padding for the flex component to meet the child component size requirements
     */

    it('testAlignContentStartFlexMarginAndPaddingSatisfy', 0, async function (done) {
      console.info('testAlignContentStartFlexMarginAndPaddingSatisfy START');
      globalThis.value.message.notify({ name:'padding', value:15 })
      await CommonFunc.sleep(3000)
      let strJson = getInspectorByKey('AlignContentFlexStartMargin&padding_flex001');
      let obj = JSON.parse(strJson);
      let Start_Margin_Column_2 = CommonFunc
      .getComponentRect('AlignContentFlexStartMargin&padding_Column_1');
      let AlignContentFlexStart_flex002 = CommonFunc
      .getComponentRect('AlignContentFlexStartMargin&padding_flex001');
      let AlignContentFlexStart_1 = CommonFunc
      .getComponentRect('AlignContentFlexStartMargin&padding_flex001_1');
      let AlignContentFlexStart_2 = CommonFunc
      .getComponentRect('AlignContentFlexStartMargin&padding_flex001_2');
      let AlignContentFlexStart_3 = CommonFunc
      .getComponentRect('AlignContentFlexStartMargin&padding_flex001_3');
      let AlignContentFlexStart_4 = CommonFunc
      .getComponentRect('AlignContentFlexStartMargin&padding_flex001_4');

      console.log('AlignContentFlexStartMargin&padding_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex002));
      console.log('AlignContentFlexStartMargin&padding_flex001_1 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_1));
      console.log('AlignContentFlexStartMargin&padding_flex001_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStartMargin&padding_flex001_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStartMargin&padding_flex001_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));

      expect(Math.round(AlignContentFlexStart_1.bottom - AlignContentFlexStart_1.top)).assertEqual(vp2px(50));
      expect(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top)).assertEqual(vp2px(100));
      expect(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top)).assertEqual(vp2px(200));
      expect(Math.round(AlignContentFlexStart_1.right - AlignContentFlexStart_1.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left)).assertEqual(vp2px(150));
      expect(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left)).assertEqual(vp2px(150));
      
      expect(obj.$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(obj.$attrs.constructor.alignContent).assertEqual("FlexAlign.Start");
      
      expect(Math.round(AlignContentFlexStart_flex002.top - Start_Margin_Column_2.top)).assertEqual(vp2px(10)) 
      expect(Math.round((AlignContentFlexStart_1.top - Start_Margin_Column_2.top)*10)/10).assertEqual(vp2px(25)) 
      expect(Math.round((AlignContentFlexStart_2.top - AlignContentFlexStart_flex002.top )*10)/10).assertEqual(vp2px(15))
      expect(AlignContentFlexStart_2.bottom).assertEqual(AlignContentFlexStart_4.top);
      expect(Math.round((AlignContentFlexStart_flex002.bottom - AlignContentFlexStart_4.bottom)*10)/10)
      .assertEqual(vp2px(45));

      console.info('testAlignContentStartFlexMarginAndPaddingSatisfy END')
      done();
    });

  })
}
