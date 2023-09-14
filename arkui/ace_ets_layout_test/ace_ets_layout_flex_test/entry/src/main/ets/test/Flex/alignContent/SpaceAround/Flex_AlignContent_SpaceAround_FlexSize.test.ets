
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
export default function flex_AlignContent_SpaceAround_FlexSizeTest() {
  describe('Flex_AlignContent_SpaceAround_FlexSizeTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceAround_FlexSizeTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_FlexSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_FlexSize state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_FlexSize" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_FlexSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_FlexSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_FlexSize page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_FlexSizeTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_FlexSizeTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0600
     * @tc.name      testFlexAlignContentSpaceAroundFlexSizeMeet
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the height and width of parent component changed
     */
    it('testFlexAlignContentSpaceAroundFlexSizeMeet', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundFlexSizeMeet] START');
      globalThis.value.message.notify({name:'width', value:200})
      globalThis.value.message.notify({name:'height', value:400})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_FlexSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100));

      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(fourthText.left).assertEqual(flexContainer.left);

      expect(Math.round(secondText.top - firstText.bottom)).assertEqual(Math.round(thirdText.top - secondText.bottom));
      expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom));
      expect(Math.round(firstText.top - flexContainer.top))
        .assertEqual(Math.round(flexContainer.bottom - fourthText.bottom));
      expect(Math.round(firstText.top - flexContainer.top))
        .assertEqual(Math.round((secondText.top - firstText.bottom) / 2));
      console.info('[testFlexAlignContentSpaceAroundFlexSizeMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0700
     * @tc.name      testFlexAlignContentSpaceAroundFlexSizeOverflow
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the height and width of parent component changed
     */
    it('testFlexAlignContentSpaceAroundFlexSizeOverflow', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundFlexSizeOverflow] START');
      globalThis.value.message.notify({name:'width', value:200})
      globalThis.value.message.notify({name:'height', value:250})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_FlexSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100));

      expect(firstText.bottom).assertEqual(secondText.top);
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(thirdText.bottom).assertEqual(fourthText.top);

      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(fourthText.left).assertEqual(flexContainer.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(Math.round(fourthText.bottom - flexContainer.bottom)).assertEqual(vp2px(50));
      console.info('[testFlexAlignContentSpaceAroundFlexSizeOverflow] END');
      done();
    });
  })
}
