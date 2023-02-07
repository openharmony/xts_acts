
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
export default function flex_Wrap_FlexMarPad_TextMarPadTest() {
  describe('Flex_Wrap_FlexMarPad_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_FlexMarPad_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexMarPad_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_FlexMarPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_FlexMarPad_TextMarPad" == pages.name)) {
          console.info("get Flex_Wrap_FlexMarPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_FlexMarPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_FlexMarPad_TextMarPad page error:" + err);
      }
      console.info("Flex_Wrap_FlexMarPad_TextMarPadTest beforeEach end");
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
      console.info("Flex_Wrap_FlexMarPad_TextMarPadText after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0500
     * @tc.name      testWrapWrapFlexMarPadTextPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set padding
     */
    it('testWrapWrapFlexMarPadTextPad', 0, async function (done) {
      console.info('[testWrapWrapFlexMarPadTextPad] START');
      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      globalThis.value.message.notify({name:'secondTextPadding', value:20});
      globalThis.value.message.notify({name:'thirdTextPadding', value:30});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      globalThis.value.message.notify({name:'flexPadding', value:30});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad1');
      let secondText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10));
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10)); // flex_margin= 10

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(30));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(30)); // flex_padding= 30

      expect(secondText.left).assertEqual(firstText.right);
      expect(firstText.top).assertEqual(secondText.top);

      expect(thirdText.top).assertEqual(secondText.bottom);
      expect(thirdText.left).assertEqual(firstText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(vp2px(170));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(20));
      console.info('[testWrapWrapFlexMarPadTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0600
     * @tc.name      testWrapWrapFlexMarPadTextMar
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set margin
     */
    it('testWrapWrapFlexMarPadTextMar', 0, async function (done) {
      console.info('[testWrapWrapFlexMarPadTextMar] START');
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'secondTextMargin', value:10});
      globalThis.value.message.notify({name:'thirdTextMargin', value:10});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      globalThis.value.message.notify({name:'flexPadding', value:20});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad1');
      let secondText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10));
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10));

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(30));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(30)); // flex_padding= 20,text_margin =10

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(firstText.top).assertEqual(secondText.top);

      expect(Math.round(thirdText.top -secondText.bottom)).assertEqual(vp2px(20));
      expect(thirdText.left).assertEqual(firstText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(vp2px(150));
      expect(flexContainer.bottom).assertEqual(thirdText.bottom);
      console.info('[testWrapWrapFlexMarPadTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0700
     * @tc.name      testWrapWrapFlexMarPadTextMarPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when all of components set padding and margin
     */
    it('testWrapWrapFlexMarPadTextMarPad', 0, async function (done) {
      console.info('[testWrapWrapFlexMarPadTextMarPad] START');
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'secondTextMargin', value:10});
      globalThis.value.message.notify({name:'thirdTextMargin', value:10});
      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      globalThis.value.message.notify({name:'secondTextPadding', value:20});
      globalThis.value.message.notify({name:'thirdTextPadding', value:30});
      globalThis.value.message.notify({name:'flexMargin', value:20});
      globalThis.value.message.notify({name:'flexPadding', value:30});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad1');
      let secondText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad2');
      let thirdText = CommonFunc.getComponentRect('Wrap_FlexMarPad_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Wrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_FlexMarPad_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(20));
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(20)); // flex_margin= 20

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(40));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(40)); // flex_padding= 30 text_margin= 10

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(firstText.top).assertEqual(secondText.top);

      expect(Math.round(thirdText.top -secondText.bottom)).assertEqual(vp2px(20));
      expect(thirdText.left).assertEqual(firstText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(vp2px(140));
      expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(10));
      console.info('[testWrapWrapFlexMarPadTextMarPad] END');
      done();
    });
  })
}