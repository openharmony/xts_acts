
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_AlignContent_SpaceAround_TextMarTest() {
  describe('Flex_AlignContent_SpaceAround_TextMarTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceAround_TextMarTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_TextMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_TextMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_TextMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_TextMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_TextMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_TextMar page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_TextMarTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_TextMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0800
     * @tc.name      testFlexAlignContentSpaceAroundTextMarginOverflow
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the margin of parent component set to 65
     */
    it('testFlexAlignContentSpaceAroundTextMarginOverflow', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverflow] START');
      globalThis.value.message.notify({name:'margin', value:65})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');
      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100));

      expect(Math.round((firstText.left - flexContainer.left)*10)/10).assertEqual(Math.round(vp2px(65)*10)/10); //margin =65
      expect(flexContainer.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);

      expect(Math.round((secondText.top - firstText.bottom)*10)/10).assertEqual(Math.round(vp2px(65)*10)/10);
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(thirdText.bottom).assertEqual(fourthText.top);
      expect(Math.round(fourthText.bottom - flexContainer.bottom)).assertEqual(vp2px(30));
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0900
     * @tc.name      testFlexAlignContentSpaceAroundTextMarginMeet
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the margin of parent component set 10
     */
    it('testFlexAlignContentSpaceAroundTextMarginMeet', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextMarginMeet] START');
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100));

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(10));
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(Math.round(firstText.top - flexContainer.top - vp2px(10)))
        .assertEqual(Math.round(flexContainer.bottom - fourthText.bottom));

      expect(Math.round(secondText.top - firstText.bottom - vp2px(10)))
        .assertEqual(Math.round(thirdText.top - secondText.bottom));
      expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom));
      expect(Math.round(flexContainer.bottom - fourthText.bottom))
        .assertEqual(Math.round((fourthText.top - thirdText.bottom) / 2));
      console.info('[testFlexAlignContentSpaceAroundTextMarginMeet] END');
      done();
    });
  })
}
