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

export default function flexAlign_SpaceBetween_fixedParentChangeFirstWidth() {
  describe('FlexAlign_SpaceBetween_fixedParentChangeFirstWidth', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirstWidth beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParentChangeFirstWidth',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParentChangeFirstWidth state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedParentChangeFirstWidth" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParentChangeFirstWidth pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceBetween_fixedParentChangeFirstWidth page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParentChangeFirstWidth page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParentChangeFirstWidth afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1300
     * @tc.name      testAlignSpaceBetweenRowNoWrapChangeFirstWidth
     * @tc.desc      Parent component fixed, child component binding width properties
     */
    it('testAlignSpaceBetweenRowNoWrapChangeFirstWidth', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstWidth START');
      globalThis.value.message.notify({name:'width', value:175})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween13');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween37');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween38');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween39');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween13');
      expect(locationText1.top).assertEqual(locationText2.top);
      expect(locationText2.top).assertEqual(locationText3.top);
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(0));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      expect(Math.round(locationFlex.bottom - locationText3.bottom)).assertEqual(vp2px(50));
      expect(Math.round(locationText1.left - locationFlex.left)).assertEqual(vp2px(0));
      expect(Math.round(locationText2.left - locationText1.right))
        .assertEqual(Math.round(locationText3.left - locationText2.right));
      expect(Math.round((locationText2.left - locationText1.right)*100)/100)
        .assertEqual(Math.round((vp2px(12.5))*100)/100);
      expect(locationText3.right).assertEqual(locationFlex.right);
      expect(Math.round(locationText3.right - locationText3.left))
        .assertEqual(Math.round(locationText2.right - locationText2.left));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(150));
      expect(Math.round((locationText1.right - locationText1.left)*10)/10).assertEqual(Math.round(vp2px(175)*10)/10);
      console.info('new testAlignSpaceBetweenRowNoWrapChangeFirstWidth END');
      done();
    });
  })
}