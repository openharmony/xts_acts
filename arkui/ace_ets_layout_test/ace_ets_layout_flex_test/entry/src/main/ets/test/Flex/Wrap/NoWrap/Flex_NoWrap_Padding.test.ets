
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
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_NoWrap_PaddingTest() {
  describe('Flex_NoWrap_PaddingTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_NoWrap_PaddingTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_Padding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_Padding state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_Padding" == pages.name)) {
          console.info("get Flex_NoWrap_Padding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_Padding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_Padding page error:" + err);
      }
      console.info("Flex_NoWrap_PaddingTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({name:'flexPadding', value:0});
      globalThis.value.message.notify({name:'flexMargin', value:0})
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_Padding after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_1500
     * @tc.name      testWrapNoWrapFlexPaddingOverflow
     * @tc.desc      The size of the parent component in the main axis direction is not enough for
     *               the layout of the child components when the parent component set padding
     */
    it('testWrapNoWrapFlexPaddingOverflow', 0, async function (done) {
      console.info('[testWrapNoWrapFlexPaddingOverflow] START');
      globalThis.value.message.notify({name:'flexPadding', value:60})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let flexContainer = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('NoWrap_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(60));
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(380) / 3));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(60)); //Flex_padding = 60
      expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(10));
      console.info('[testWrapNoWrapFlexPaddingOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_1600
     * @tc.name      testWrapNoWrapFlexPaddingMeet
     * @tc.desc      The size of the parent component in the main axis direction meets
     *               the layout of the child components when the parent component set padding
     */
    it('testWrapNoWrapFlexPaddingMeet', 0, async function (done) {
      console.info('[testWrapNoWrapFlexPaddingMeet] START');
      globalThis.value.message.notify({name:'flexPadding', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let columnContainer = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainer = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('NoWrap_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(10)); // Flex_padding = 10
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(450) / 3);
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(40));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(40));
      console.info('[testWrapNoWrapFlexPaddingMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_1700
     * @tc.name      testWrapNoWrapFlexMargin
     * @tc.desc      The size of the parent component in the main axis direction meets
     *               the layout of the child components when the parent component set margin
     */
    it('testWrapNoWrapFlexMargin', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMargin] START');
      globalThis.value.message.notify({name:'flexMargin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let flexContainer = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainerStrJson = getInspectorByKey('NoWrap_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      expect(firstText.left).assertEqual(flexContainer.left);

      expect(firstText.top).assertEqual(flexContainer.top);
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10)); //margin=10
      expect(Math.round(flexContainer.top - columnContainer.top))
        .assertEqual(Math.round(firstText.top - columnContainer.top));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(450) / 3);
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(50));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(50));
      console.info('[testWrapNoWrapFlexMargin] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_1800
     * @tc.name      testWrapNoWrapFlexMarPad
     * @tc.desc      The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set margin and padding
     */
    it('testWrapNoWrapFlexMarPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarPad] START');
      globalThis.value.message.notify({name:'flexMargin', value:10});
      globalThis.value.message.notify({name:'flexPadding', value:30});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let columnContainer = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainer = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('NoWrap_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10)); // margin=10
      expect(Math.round(firstText.top - columnContainer.top)).assertEqual(vp2px(40));  // Flex_padding+margin = 40

      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(vp2px(440) / 3));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(30));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(20));
      console.info('[testWrapNoWrapFlexMarPad] END');
      done();
    });
  })
}
