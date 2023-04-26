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

export default function flexAlign_SpaceAround_fixedParentChangeFirst() {
  describe('FlexAlign_SpaceAround_fixedParentChangeFirst', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceAround_fixedParentChangeFirst beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedParentChangeFirst',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceAround_fixedParentChangeFirst state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedParentChangeFirst" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedParentChangeFirst pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceAround_fixedParentChangeFirst page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedParentChangeFirst page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedParentChangeFirst afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_1200
     * @tc.name      testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight122
     * @tc.desc      Parent component fixed, child component binding layoutWeight first1 second2 third2 properties
     */
    it('testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight122', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight122 START');
      globalThis.value.message.notify({name:'testFirstlayoutWeight', value:1})
      globalThis.value.message.notify({name:'testSecondlayoutWeight', value:2})
      globalThis.value.message.notify({name:'testThirdlayoutWeight', value:2})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround12');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround34');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround35');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround36');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround12');
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(locationText1.top).assertEqual(locationFlex.top);
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(locationText1.left).assertEqual(locationFlex.left);
      expect(locationText1.right).assertEqual(locationText2.left);
      expect(locationText2.right).assertEqual(locationText3.left);
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(200));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(200));
      console.info('new testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight122 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_1600
     * @tc.name      testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight120
     * @tc.desc      Parent component fixed, child component binding layoutWeight first1 second2 third0 properties
     */
    it('testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight120', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight120 START');
      globalThis.value.message.notify({name:'testFirstlayoutWeight', value:1})
      globalThis.value.message.notify({name:'testSecondlayoutWeight', value:2})
      globalThis.value.message.notify({name:'testThirdlayoutWeight', value:0})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround12');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround34');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround35');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround36');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround12');
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(locationText1.top).assertEqual(locationFlex.top);
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(locationText1.left).assertEqual(locationFlex.left);
      expect(locationText1.right).assertEqual(locationText2.left);
      expect(locationText2.right).assertEqual(locationText3.left);
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(Math.round(vp2px(350/3)));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(Math.round(vp2px(700/3)));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(150));
      console.info('new testAlignSpaceAroundRowNoWrapChangeFirstLayoutWeight120 END');
      done();
    });
  })
}