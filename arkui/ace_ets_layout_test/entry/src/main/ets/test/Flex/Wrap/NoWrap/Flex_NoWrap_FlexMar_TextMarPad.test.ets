
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
export default function flex_NoWrap_FlexMar_TextMarPadTest()   {
  describe('Flex_NoWrap_FlexMar_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_NoWrap_FlexMar_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexMar_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_FlexMar_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_FlexMar_TextMarPad" == pages.name)) {
          console.info("get Flex_NoWrap_FlexMar_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_FlexMar_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_FlexMar_TextMarPad page error:" + err);
      }
      console.info("Flex_NoWrap_FlexMar_TextMarPadTest beforeEach end");
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
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_FlexMar_TextMarPadText after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0200
     * @tc.name      testWrapNoWrapFlexMarTextPad
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *   of the child components when the parent components set margin,and the child components set padding
     */
    it('testWrapNoWrapFlexMarTextPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarTextPad] START');

      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      globalThis.value.message.notify({name:'secondTextPadding', value:20});
      globalThis.value.message.notify({name:'thirdTextPadding', value:30});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_FlexMar_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10));
      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10)); //margin =10
      expect(Math.round(flexContainer.top - columnContainer.top))
        .assertEqual(Math.round(firstText.top - columnContainer.top));

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);
      
      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(150))
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(flexContainer.bottom).assertEqual(thirdText.bottom);
      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(50));
      console.info('[testWrapNoWrapFlexMarTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0300
     * @tc.name      testWrapNoWrapFlexMarTextMar
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *   of the child components when the parent components set margin,and the child components set margin
     */
    it('testWrapNoWrapFlexMarTextMar', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarTextMar] START');
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad3');
      let columnContainer = CommonFunc.getComponentRect('Column_FlexMar_TextMarPad_Container01');
      let flexContainer = CommonFunc.getComponentRect('FlexMar_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10));
      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10)); //flex_margin =10
      
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(10));
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(10));
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(secondText.left - firstText.right));
      
      expect(secondText.top).assertEqual(thirdText.top);
      expect(secondText.right).assertEqual(thirdText.left);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(flexContainer.bottom).assertEqual(thirdText.bottom);
      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(30));
      console.info('[testWrapNoWrapFlexMarTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_0400
     * @tc.name      testWrapNoWrapFlexMarTextMarPad
     * @tc.desc      The size of the parent component in the main axis direction is not enough the layout
     *   of the child components when the parent components set margin,and the child components set margin and padding
     */
    it('testWrapNoWrapFlexMarTextMarPad', 0, async function (done) {
      console.info('[testWrapNoWrapFlexMarTextMarPad] START');
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'secondTextMargin', value:10});
      globalThis.value.message.notify({name:'thirdTextMargin', value:10});
      globalThis.value.message.notify({name:'firstTextPadding', value:20});
      globalThis.value.message.notify({name:'secondTextPadding', value:20});
      globalThis.value.message.notify({name:'thirdTextPadding', value:20});
      globalThis.value.message.notify({name:'flexMargin', value:10});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad1');
      let secondText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad2');
      let thirdText = CommonFunc.getComponentRect('NoWrap_FlexMar_TextPad3');
      let flexContainer = CommonFunc.getComponentRect('FlexMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_FlexMar_TextMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexMar_TextMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      
      expect(Math.round(flexContainer.left - columnContainer.left)).assertEqual(vp2px(10));
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(vp2px(10));
      
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(10));
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(vp2px(10));
      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(Math.round(thirdText.left - secondText.right)).assertEqual(vp2px(20));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(vp2px(440) / 3));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(10));
      expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(10));
      console.info('[testWrapNoWrapFlexMarTextMarPad] END');
      done();
    });
  })
}