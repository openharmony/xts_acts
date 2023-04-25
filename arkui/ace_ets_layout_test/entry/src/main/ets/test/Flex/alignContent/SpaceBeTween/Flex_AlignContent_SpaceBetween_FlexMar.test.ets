
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
export default function flex_AlignContent_SpaceBetween_FlexMarTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexMarTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_FlexMar beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexMar page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0100
     * @tc.name      testFlexAlignContentSpaceAroundFlexMargin
     * @tc.desc      the margin of parent component set to 10
     */
    it('testFlexAlignContentSpaceAroundFlexMargin', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundFlexMargin] START');
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMar_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(200));
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10)); //margin =10

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(fourthText.left).assertEqual(flexContainer.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(fourthText.bottom).assertEqual(flexContainer.bottom);

      expect(Math.round(secondText.top - firstText.bottom)).assertEqual(Math.round(thirdText.top - secondText.bottom));
      expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom));
      console.info('[testFlexAlignContentSpaceAroundFlexMargin] END');
      done();
    });
  })
}
