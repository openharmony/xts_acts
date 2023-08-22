
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
export default function flex_NoWrap_FlexMarPad_TextMarPadTest() {
  describe('Flex_NoWrap_FlexMarPad_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexMarPad_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_FlexMarPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_FlexMarPad_TextMarPad" == pages.name)) {
          console.info("get Flex_NoWrap_FlexMarPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_FlexMarPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_FlexMarPad_TextMarPad page error:" + err);
      }
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({name:'firstTextMargin', value:0});
      globalThis.value.message.notify({name:'secondTextMargin', value:0});
      globalThis.value.message.notify({name:'thirdTextMargin', value:0});
      globalThis.value.message.notify({name:'firstTextPadding', value:0});
      globalThis.value.message.notify({name:'secondTextPadding', value:0});
      globalThis.value.message.notify({name:'thirdTextPadding', value:0});
      globalThis.value.message.notify({name:'flexMargin', value:0});
      globalThis.value.message.notify({name:'flexPadding', value:0});
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadText after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0500
     * @tc.name      testWrapNoWrapFlexMarPadTextPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set padding
     */
    it('testWrapNoWrapFlexMarPadTextPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarPadTextPad] START');
      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      globalThis.value.message.notify({name:'secondTextPadding', value:20});
      globalThis.value.message.notify({name:'thirdTextPadding', value:30});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      globalThis.value.message.notify({name:'flexPadding', value:30});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10));
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10)); //margin = 10
      
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(30));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(30)); //padding=30

      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(440) / 3));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(30));
      expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(30));
      console.info('[testWrapNoWrapFlexMarPadTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0600
     * @tc.name      testWrapNoWrapFlexMarPadTextMar
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set margin
     */
    it('testWrapNoWrapFlexMarPadTextMar', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarPadTextMar] START');
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'secondTextMargin', value:10});
      globalThis.value.message.notify({name:'thirdTextMargin', value:10});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      globalThis.value.message.notify({name:'flexPadding', value:20});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10)); //margin = 10
      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10)); //margin = 10

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(30));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(30)); //padding+margin=30

      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);
      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(400) / 3));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));
      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(30));
      expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(30));
      console.info('[testWrapNoWrapFlexMarPadTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0700
     * @tc.name      testWrapNoWrapFlexMarPadTextMarPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when all of components set padding and margin
     */
    it('testWrapNoWrapFlexMarPadTextMarPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] START');
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'secondTextMargin', value:10});
      globalThis.value.message.notify({name:'thirdTextMargin', value:10});
      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      globalThis.value.message.notify({name:'secondTextPadding', value:20});
      globalThis.value.message.notify({name:'thirdTextPadding', value:30});
      globalThis.value.message.notify({name:'flexMargin', value:20});
      globalThis.value.message.notify({name:'flexPadding', value:30});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(20));
      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(20)); //margin = 20

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(40));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(40)); //flex_padding + margin=40
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(380) / 3));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));
      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(Math.round(thirdText.left - secondText.right)).assertEqual(vp2px(20));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(40));
      expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(40));
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] END');
      done();
    });
  })
}