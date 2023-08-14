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

export default function flexWrapReverse_fixedParentChildVisibility() {
  describe('FlexWrapReverse_fixedParentChildVisibility', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_fixedParentChildVisibility beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentChildVisibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentChildVisibility state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentChildVisibility" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentChildVisibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_fixedParentChildVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentChildVisibility page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentChildVisibility afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1200
     * @tc.name      testWrapReverseParentfixedVisibilityNoneAndOtherOutRange
     * @tc.desc      The layout space of the parent component is fixed, and the visibility none is set for the child
     *               component, and the layout range of remaining components exceeds the container space
     */
    it('testWrapReverseParentfixedVisibilityNoneAndOtherOutRange', 0, async function (done) {
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherOutRange START');
      globalThis.value.message.notify({name:'test1Width', value:150})
      globalThis.value.message.notify({name:'test2Width', value:300})
      globalThis.value.message.notify({name:'visibility', value:Visibility.None})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest19');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let strJson2 = getInspectorByKey('WrapReverseTest55');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest55');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest56');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest57');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest19');
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText2.right).assertEqual(locationText3.right);
      expect(locationText2.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(300));
      expect(locationText2.top).assertEqual(locationFlex.top);
      expect(locationText3.top).assertEqual(locationText2.bottom);
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherOutRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1300
     * @tc.name      testWrapReverseParentfixedVisibilityNoneAndOtherInRange
     * @tc.desc      The layout space of the parent component is fixed, and the visibility none is set for the child
     *               component, and the remaining component layout range does not exceed the container space
     */
    it('testWrapReverseParentfixedVisibilityNoneAndOtherInRange', 0, async function (done) {
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherInRange START');
      globalThis.value.message.notify({name:'test1Width', value:200})
      globalThis.value.message.notify({name:'test2Width', value:200})
      globalThis.value.message.notify({name:'visibility', value:Visibility.None})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest19');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let strJson2 = getInspectorByKey('WrapReverseTest55');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.None');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest55');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest56');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest57');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest19');
      expect(locationText2.right).assertEqual(locationFlex.right);
      expect(locationText2.left).assertEqual(locationText3.right);
      expect(Math.round(locationText3.left - locationFlex.left)).assertEqual(vp2px(100));
      expect(locationText3.top).assertEqual(locationText2.top);
      expect(locationText3.top).assertEqual(locationFlex.top);
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(150));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1400
     * @tc.name      testWrapReverseParentfixedVisibilityHiddenAndOtherInRange
     * @tc.desc      The layout space of the parent component is fixed, and visibility hidden is set for child component
     */
    it('testWrapReverseParentfixedVisibilityHiddenAndOtherInRange', 0, async function (done) {
      console.info('new testWrapReverseParentfixedVisibilityHiddenAndOtherInRange START');
      globalThis.value.message.notify({name:'test1Width', value:200})
      globalThis.value.message.notify({name:'test2Width', value:200})
      globalThis.value.message.notify({name:'visibility', value:Visibility.Hidden})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest19');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let strJson2 = getInspectorByKey('WrapReverseTest55');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Hidden');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest55');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest56');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest57');
      let locationFlex = CommonFunc.getComponentRect('FlexWrapReverseTest19');
      expect(locationText1.right).assertEqual(locationFlex.right);
      expect(locationText1.left).assertEqual(locationText2.right);
      expect(Math.round(locationText2.left - locationFlex.left)).assertEqual(vp2px(100));
      expect(locationText3.left).assertEqual(locationText1.left);
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationFlex.top);
      expect(locationText3.top).assertEqual(locationText2.bottom);
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedVisibilityHiddenAndOtherInRange END');
      done();
    });
  })
}