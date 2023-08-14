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
import CommonFunc from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexWrapReverse_fixedParentMarPad() {
  describe('FlexWrapReverse_fixedParentMarPad', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_fixedParentMarPad beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentMarPad',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentMarPad state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentMarPad" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentMarPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_fixedParentMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentMarPad page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentMarPad afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0900
     * @tc.name      testWrapReverseParentfixedMarPadChildPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting padding and margin,
     *               and sub component setting padding
     */
    it('testWrapReverseParentfixedMarPadChildPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarPadChildPadding START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:0})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest16');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest46');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest47');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest48');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest16');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(50));
      expect(locationText1.left).assertEqual(locationText2.right);
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(150));
      expect(locationText3.left).assertEqual(locationText1.left);
      expect(locationText3.right).assertEqual(locationText1.right);
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(50));
      expect(locationText2.top).assertEqual(locationText1.top);
      expect(locationText3.top).assertEqual(locationText2.bottom);
      expect(locationFlex.bottom).assertEqual(locationText3.bottom);
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedMarPadChildPadding END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1000
     * @tc.name      testWrapReverseParentfixedMarPadChildMargin
     * @tc.desc      The parent component layout space is fixed, and the parent component setting padding and margin,
     *               and sub component setting margin
     */
    it('testWrapReverseParentfixedMarPadChildMargin', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarPadChildMargin START');
      globalThis.value.message.notify({name:'padding', value:0})
      globalThis.value.message.notify({name:'margin', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest16');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest46');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest47');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest48');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest16');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(70));
      expect(Math.round(locationText1.left - locationText2.right)).assertEqual(vp2px(20));
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(110));
      expect(Math.round(locationText3.left - locationText1.left)).assertEqual(vp2px(20));
      expect(Math.round(locationFlex.right - locationText3.right)).assertEqual(vp2px(50));
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(70));
      expect(Math.round(locationText2.top - locationFlex.top)).assertEqual(vp2px(50));
      expect(locationText3.top).assertEqual(locationText2.bottom);
      expect(locationFlex.bottom).assertEqual(locationText3.bottom);
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedMarPadChildMargin END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1100
     * @tc.name      testWrapReverseParentfixedMarPadChildMarginAndPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting padding and margin,
     *               and sub component setting padding and margin
     */
    it('testWrapReverseParentfixedMarPadChildMarginAndPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarPadChildMarginAndPadding START');
      globalThis.value.message.notify({name:'padding', value:30})
      globalThis.value.message.notify({name:'margin', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest16');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest46');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest47');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest48');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest16');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(70));
      expect(Math.round(locationText1.left - locationText2.right)).assertEqual(vp2px(20));
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(110));
      expect(Math.round(locationText3.left - locationText1.left)).assertEqual(vp2px(20));
      expect(Math.round(locationFlex.right - locationText3.right)).assertEqual(vp2px(50));
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(70));
      expect(Math.round(locationText2.top - locationFlex.top)).assertEqual(vp2px(50));
      expect(locationText3.top).assertEqual(locationText2.bottom);
      expect(locationFlex.bottom).assertEqual(locationText3.bottom);
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(60));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));  
      console.info('new testWrapReverseParentfixedMarPadChildMarginAndPadding END');
      done();
    });
  })
}