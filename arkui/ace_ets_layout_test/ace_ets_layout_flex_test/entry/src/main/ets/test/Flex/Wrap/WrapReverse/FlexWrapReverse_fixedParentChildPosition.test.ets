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

export default function flexWrapReverse_fixedParentChildPosition() {
  describe('FlexWrapReverse_fixedParentChildPosition', function () {
    beforeEach(async function (done) {
      console.info("FlexWrapReverse_fixedParentChildPosition beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentChildPosition',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexWrapReverse_fixedParentChildPosition state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentChildPosition" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentChildPosition state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexWrapReverse_fixedParentChildPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentChildPosition page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentChildPosition afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1500
     * @tc.name      testWrapReverseParentfixedPosition
     * @tc.desc      The layout space of the parent component is fixed, and the position is set for the child component
     */
    it('testWrapReverseParentfixedPosition', 0, async function (done) {
      console.info('new testWrapReverseParentfixedPosition START');
      globalThis.value.message.notify({name:'height', value:300})
      globalThis.value.message.notify({name:'width', value:500})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexWrapReverseTest22');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.WrapReverse');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let locationText1 = CommonFunc.getComponentRect('WrapReverseTest64');
      let locationText2 = CommonFunc.getComponentRect('WrapReverseTest65');
      let locationText3 = CommonFunc.getComponentRect('WrapReverseTest66');
      let locationFlexParent = CommonFunc.getComponentRect('FlexWrapReverseTest22');
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(locationText3.right).assertEqual(locationText2.left);
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round(locationText1.top - locationFlexParent.top)).assertEqual(vp2px(40));
      expect(Math.round(locationText1.left - locationFlexParent.left)).assertEqual(vp2px(20));
      expect(Math.round(locationFlexParent.right - locationText2.right)).assertEqual(vp2px(0));
      expect(Math.round(locationText3.left - locationFlexParent.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(150));
      console.info('new testWrapReverseParentfixedPosition END');
      done();
    });
  })
}