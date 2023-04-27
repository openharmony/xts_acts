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

export default function flexAlign_SpaceBetween_fixedParent() {
  describe('FlexAlign_SpaceBetween_fixedParent', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceBetween_fixedParent beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParent state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedParent" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceBetween_fixedParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_0900
     * @tc.name      testAlignSpaceBetweenRowNoWrapOffset
     * @tc.desc      Parent component fixed, child component binding offset properties 
     */
    it('testAlignSpaceBetweenRowNoWrapOffset', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapOffset START');
      globalThis.value.message.notify({name:'x', value:15})
      globalThis.value.message.notify({name:'y', value:30})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween9');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let strJson2 = getInspectorByKey('AlignSpaceBetween25');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Visible');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween25');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween26');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween27');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween9');
      expect(Math.round(locationText1.top - locationFlex.top)).assertEqual(vp2px(30))
      expect(Math.round((locationText1.left - locationFlex.left)*10)/10).assertEqual(Math.round(vp2px(15)*10)/10)
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
      expect(Math.round((locationText2.left - locationText1.right + vp2px(15))*10)/10)
        .assertEqual(Math.round((locationText3.left - locationText2.right)*10)/10);
      expect(Math.round((locationText3.left - locationText2.right)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      console.info('new testAlignSpaceBetweenRowNoWrapOffset END');
      done();
    });
  })
}