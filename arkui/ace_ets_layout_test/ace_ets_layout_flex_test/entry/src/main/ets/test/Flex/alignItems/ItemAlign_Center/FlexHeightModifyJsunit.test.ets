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
import CommonFunc from "../../../../MainAbility/common/Common";
import { MessageManager,Callback } from '../../../../MainAbility/common/MessageManager';
export default function flexHeightModify_CenterJsunit() {
  describe('flexItemAlignCenterTest6', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/FlexHeightModify',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexHeightModify state success " + JSON.stringify(pages));
        if (!("FlexHeightModify" == pages.name)) {
          console.info("get FlexHeightModify state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexHeightModify page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexHeightModify page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexHeightModify after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_CENTER_0800
     * @tc.name      testFlexItemAlignCenterDefaultSize
     * @tc.desc      Modify the first subcomponent's height.
     */
    it('testFlexItemAlignCenterDefaultSize', 0, async function (done) {
      console.info('new testFlexItemAlignCenterDefaultSize START');
      let strJson1 = getInspectorByKey('flexHeightModify');
      let obj1 = JSON.parse(strJson1);
      let textHeightModify01 = CommonFunc.getComponentRect('textHeightModify01');
      let textHeightModify02 = CommonFunc.getComponentRect('textHeightModify02');
      let textHeightModify03 = CommonFunc.getComponentRect('textHeightModify03');
      let flexHeightModify = CommonFunc.getComponentRect('flexHeightModify');
      expect(textHeightModify01.left).assertEqual(flexHeightModify.left)
      expect(textHeightModify02.left).assertEqual(textHeightModify01.right)
      expect(textHeightModify01.top - flexHeightModify.top).assertEqual(flexHeightModify.bottom - textHeightModify01.bottom)
      expect(textHeightModify02.top - flexHeightModify.top).assertEqual(flexHeightModify.bottom - textHeightModify02.bottom)
      expect(textHeightModify03.top - flexHeightModify.top).assertEqual(flexHeightModify.bottom - textHeightModify03.bottom)
      expect(Math.round((textHeightModify01.top - flexHeightModify.top)*10)/10).assertEqual(Math.round(vp2px(75)*10)/10)
      expect(Math.round(textHeightModify01.bottom - textHeightModify01.top)).assertEqual(vp2px(50))
      expect(Math.round(textHeightModify02.bottom - textHeightModify02.top)).assertEqual(vp2px(100))
      expect(Math.round(textHeightModify03.bottom - textHeightModify03.top)).assertEqual(vp2px(150))
      expect(Math.round(textHeightModify01.right - textHeightModify01.left)).assertEqual(vp2px(150))
      expect(Math.round(textHeightModify02.right - textHeightModify02.left)).assertEqual(vp2px(150))
      expect(Math.round(textHeightModify03.right - textHeightModify03.left)).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterDefaultSize END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_CENTER_0900
     * @tc.name      testFlexItemAlignCenterHeightModify
     * @tc.desc      Modify the first subcomponent's height.
     */
    it('testFlexItemAlignCenterHeightModify', 0, async function (done) {
      console.info('new testFlexItemAlignCenterHeightModify START');
      globalThis.value.message.notify({name:'height', value:80});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexHeightModify');
      let obj1 = JSON.parse(strJson1);
      let textHeightModify01 = CommonFunc.getComponentRect('textHeightModify01');
      let textHeightModify02 = CommonFunc.getComponentRect('textHeightModify02');
      let textHeightModify03 = CommonFunc.getComponentRect('textHeightModify03');
      let flexHeightModify = CommonFunc.getComponentRect('flexHeightModify');
      expect(textHeightModify01.left).assertEqual(flexHeightModify.left)
      expect(textHeightModify02.left).assertEqual(textHeightModify01.right)
      expect(textHeightModify01.top - flexHeightModify.top).assertEqual(flexHeightModify.bottom - textHeightModify01.bottom)
      expect(textHeightModify02.top - flexHeightModify.top).assertEqual(flexHeightModify.bottom - textHeightModify02.bottom)
      expect(textHeightModify03.top - flexHeightModify.top).assertEqual(flexHeightModify.bottom - textHeightModify03.bottom)
      expect(Math.round(textHeightModify01.top - flexHeightModify.top)).assertEqual(vp2px(60))
      expect(Math.round(textHeightModify01.bottom - textHeightModify01.top)).assertEqual(vp2px(80))
      expect(Math.round(textHeightModify02.bottom - textHeightModify02.top)).assertEqual(vp2px(100))
      expect(Math.round(textHeightModify03.bottom - textHeightModify03.top)).assertEqual(vp2px(150))
      expect(Math.round(textHeightModify01.right - textHeightModify01.left)).assertEqual(vp2px(150))
      expect(Math.round(textHeightModify02.right - textHeightModify02.left)).assertEqual(vp2px(150))
      expect(Math.round(textHeightModify03.right - textHeightModify03.left)).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterHeightModify END');
      done();
    });
  })
}
