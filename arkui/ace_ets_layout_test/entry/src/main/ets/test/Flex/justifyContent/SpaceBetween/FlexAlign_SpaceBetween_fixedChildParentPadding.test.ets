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

export default function flexAlign_SpaceBetween_fixedChildParentPadding() {
  describe('FlexAlign_SpaceBetween_fixedChildParentPadding', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceBetween_fixedChildParentPadding beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedChildParentPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedChildParentPadding state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedChildParentPadding" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedChildParentPadding pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceBetween_fixedChildParentPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedChildParentPadding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedChildParentPadding afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_0300
     * @tc.name      testAlignSpaceBetweenRowNoWrapPaddingOutRange
     * @tc.desc      The child component is fixed, and parent component is bound with padding attributes, the layout
     *               space of parent component is insufficient to meet the spindle layout requirements of child component
     */
    it('testAlignSpaceBetweenRowNoWrapPaddingOutRange', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapPaddingOutRange START');
      globalThis.value.message.notify({name:'padding', value:50})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween3');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween7');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween8');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween9');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween3');
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(locationFlex.bottom).assertEqual(locationText3.bottom);
      expect(Math.round(locationText1.left - locationFlex.left)).assertEqual(vp2px(50));
      expect(locationText1.right).assertEqual(locationText2.left);
      expect(locationText2.right).assertEqual(locationText3.left);
      expect(Math.round(locationFlex.right - locationText3.right)).assertEqual(vp2px(50));
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(400/3)));
      console.info('new testAlignSpaceBetweenRowNoWrapPaddingOutRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_0400
     * @tc.name      testAlignSpaceBetweenRowNoWrapPaddingInRange
     * @tc.desc      The child component is fixed, and parent component is bound with padding attributes, the layout
     *               space of parent component meets the spindle layout requirements of the child component
     */
    it('testAlignSpaceBetweenRowNoWrapPaddingInRange', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapPaddingInRange START');
      globalThis.value.message.notify({name:'padding', value:5})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween3');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween7');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween8');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween9');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween3');
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(Math.round((locationText1.top - locationFlex.top)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10);
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round((locationFlex.bottom - locationText3.bottom)*10)/10).assertEqual(Math.round(vp2px(45)*10)/10);
      expect(Math.round((locationText1.left - locationFlex.left)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10);
      expect(Math.round((locationText3.right)*10)/10).assertEqual(Math.round((locationFlex.right - vp2px(5))*10)/10);
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(150));
      expect(Math.round(locationText2.left - locationText1.right))
        .assertEqual(Math.round(locationText3.left - locationText2.right));
      expect(Math.round(locationText2.left - locationText1.right)).assertEqual(vp2px(20));
      console.info('new testAlignSpaceBetweenRowNoWrapPaddingInRange END');
      done();
    });
  })
}