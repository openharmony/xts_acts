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

export default function flexWrapReverse_fixedParentMargin() {
  describe('FlexWrapReverse_fixedParentMargin', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_fixedParentMargin beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentMargin state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentMargin" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentMargin state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_fixedParentMargin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentMargin page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentMargin afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0600
     * @tc.name      testWrapReverseParentfixedMarginChildPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting margin,
     *               and sub component setting padding
     */
    it('testWrapReverseParentfixedMarginChildPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarginChildPadding START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:0})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(locationFlex.right).assertEqual(locationText1.right);
      expect(locationText1.left).assertEqual(locationText2.right);
      expect(locationText2.left).assertEqual(locationText3.right);
      expect(Math.round(locationText3.left - locationFlex.left)).assertEqual(vp2px(50));
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(locationText3.top).assertEqual(locationFlex.top);
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(150));
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedMarginChildPadding END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0700
     * @tc.name      testWrapReverseParentfixedMarginChildMargin
     * @tc.desc      The parent component layout space is fixed, and the parent component setting margin,
     *               and sub component setting margin
     */
    it('testWrapReverseParentfixedMarginChildMargin', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarginChildMargin START');
      globalThis.value.message.notify({name:'padding', value:0})
      globalThis.value.message.notify({name:'margin', value:50})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(50));
      expect(Math.round(locationText1.left - locationText2.right)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.left - locationText1.left)).assertEqual(vp2px(50));
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(50));
      expect(locationText2.top).assertEqual(locationFlex.top);
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(vp2px(50));
      expect(locationFlex.bottom).assertEqual(locationText3.bottom);
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedMarginChildMargin END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_0800
     * @tc.name      testWrapReverseParentfixedMarginChildMarginAndPadding
     * @tc.desc      The parent component layout space is fixed, and the parent component setting margin,
     *               and set padding and margin for sub component
     */
    it('testWrapReverseParentfixedMarginChildMarginAndPadding', 0, async function (done) {
      console.info('new testWrapReverseParentfixedMarginChildMarginAndPadding START');
      globalThis.value.message.notify({name:'padding', value:10})
      globalThis.value.message.notify({name:'margin', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest37');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest38');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest39');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest13');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(30));
      expect(Math.round(locationText1.left - locationText2.right)).assertEqual(vp2px(30));
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(140));
      expect(Math.round(locationText3.left - locationText1.left)).assertEqual(vp2px(30));
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(30));
      expect(locationText2.top).assertEqual(locationFlex.top);
      expect(Math.round(locationText3.top - locationText2.bottom)).assertEqual(vp2px(10));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(40));
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedMarginChildMarginAndPadding END');
      done();
    });
  })
}