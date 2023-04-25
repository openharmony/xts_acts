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
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexWrapReverse_notFixedParentPadding() {
  describe('FlexWrapReverse_notFixedParentPadding', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_notFixedParentPadding beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_notFixedParentPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_notFixedParentPadding state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_notFixedParentPadding" == pages.name)) {
          console.info("get FlexWrapReverse_notFixedParentPadding state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_notFixedParentPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_notFixedParentPadding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_notFixedParentPadding afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0400
     * @tc.name      testWrapReverseChildfixedParentPaddingInRange
     * @tc.desc      The parent component changes location and space of layout, affecting layout of child components,
     *               parent component setting padding, the remaining layout space meets the requirements
     */
    it('testWrapReverseChildfixedParentPaddingInRange', 0, async function (done) {
      console.info('new testWrapReverseChildfixedParentPaddingInRange START');
      globalThis.value.message.notify({name:'height', value:300})
      globalThis.value.message.notify({name:'width', value:500})
      globalThis.value.message.notify({name:'padding', value:10})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest4');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      //expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest10');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest11');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest12');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest4');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(10));
      expect(locationText1.left).assertEqual(locationText2.right);
      expect(locationText2.left).assertEqual(locationText3.right);
      expect(Math.round(locationText3.left - locationFlex.left)).assertEqual(vp2px(40));
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(Math.round(locationText3.top - locationFlex.top)).assertEqual(vp2px(10));
      expect(Math.round(locationText2.right - locationText2.left))
        .assertEqual(Math.round(locationText1.right - locationText1.left));
      expect(Math.round(locationText2.right - locationText2.left))
        .assertEqual(Math.round(locationText3.right - locationText3.left));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseChildfixedParentPaddingInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_CHILDFIXED_TEST_0500
     * @tc.name      testWrapReverseChildfixedParentPaddingOutRange
     * @tc.desc      The parent component changes location and space of layout, affecting layout of child components,
     *               parent component setting padding, the remaining layout space does not meet the requirements
     */
    it('testWrapReverseChildfixedParentPaddingOutRange', 0, async function (done) {
      console.info('new testWrapReverseChildfixedParentPaddingOutRange START');
      globalThis.value.message.notify({name:'height', value:300})
      globalThis.value.message.notify({name:'width', value:500})
      globalThis.value.message.notify({name:'padding', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest4');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest10');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest11');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest12');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest4');
      expect(Math.round(locationFlex.right - locationText1.right)).assertEqual(vp2px(30));
      expect(locationText1.left).assertEqual(locationText2.right);
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(170));
      expect(locationText3.left).assertEqual(locationText1.left);
      expect(locationText3.right).assertEqual(locationText1.right);
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(Math.round(locationText2.top - locationFlex.top)).assertEqual(vp2px(30));
      expect(locationText3.top).assertEqual(locationText2.bottom);
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(20));
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseChildfixedParentPaddingOutRange END');
      done();
    });
  })
}