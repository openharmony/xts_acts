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

export default function flexAlign_SpaceBetween_fixedParentMarginFirst() {
  describe('FlexAlign_SpaceBetween_fixedParentMarginFirst', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceBetween_fixedParentMarginFirst beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParentMarginFirst',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParentMarginFirst state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedParentMarginFirst" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParentMarginFirst state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceBetween_fixedParentMarginFirst page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParentMarginFirst page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParentMarginFirst afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1400
     * @tc.name      testAlignSpaceBetweenRowNoWrapMarginFirstInRange
     * @tc.desc      Parent component fixed, child component binding margin properties, the layout space of the parent
     *               component meets the spindle layout requirements of the child component
     */
    it('testAlignSpaceBetweenRowNoWrapMarginFirstInRange', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstInRange START');
      globalThis.value.message.notify({name:'margin', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween14');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween40');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween41');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween42');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween14');
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(20))
      expect(Math.round(locationText1.left - locationFlex.left)).assertEqual(vp2px(20))
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(Math.round(locationText3.top - locationFlex.top)).assertEqual(vp2px(0));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.right - locationText1.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(150));
      expect(Math.round((locationText2.left - locationText1.right)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round((locationText3.left - locationText2.right)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10);
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1500
     * @tc.name      testAlignSpaceBetweenRowNoWrapMarginFirstOutRange
     * @tc.desc      Parent component fixed, child component binding margin properties, the layout space of the parent
     *               component is insufficient to meet the spindle layout requirements of the child component
     */
    it('testAlignSpaceBetweenRowNoWrapMarginFirstOutRange', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstOutRange START');
      globalThis.value.message.notify({name:'margin', value:50})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween14');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween40');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween41');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween42');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween14');
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(locationText1.left - locationFlex.left)).assertEqual(Math.round(vp2px(50)));
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(Math.round(locationText3.top - locationFlex.top)).assertEqual(vp2px(0));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(locationText2.right).assertEqual(locationText3.left);
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(400/3)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(400/3)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(Math.round(vp2px(400/3)));
      expect(Math.round(locationText2.left - locationText1.right)).assertEqual(Math.round(vp2px(50)));
      console.info('new testAlignSpaceBetweenRowNoWrapMarginFirstOutRange END');
      done();
    });
  })
}