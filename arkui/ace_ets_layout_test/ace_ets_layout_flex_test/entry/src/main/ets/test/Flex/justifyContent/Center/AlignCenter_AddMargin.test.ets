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
import CommonFunc from "./../../../../MainAbility/common/Common"
export default function AlignCenter_AddMargin() {
  describe('AlignCenter_AddMargin', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddMargin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddMargin state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddMargin" == pages.name)) {
          console.info("get AlignCenter_AddMargin state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddMargin page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddMargin after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0500
     * @tc.name      testFlexAlignCenterFlexMargin
     * @tc.desc      the margin of parent component set to 20
     */
    it('testFlexAlignCenterFlexMargin', 0, async function (done) {
      console.info('[testFlexAlignCenterFlexMargin] START');
      globalThis.value.message.notify({name:'DadMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddMargin_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddMargin_011 = CommonFunc.getComponentRect('Center_AddMargin_011');
      let Center_AddMargin_012 = CommonFunc.getComponentRect('Center_AddMargin_012');
      let Center_AddMargin_013 = CommonFunc.getComponentRect('Center_AddMargin_013');
      let Center_AddMargin_01 = CommonFunc.getComponentRect('Center_AddMargin_01');
      let Center_AddMargin_01_Box = CommonFunc.getComponentRect('Center_AddMargin_01_Box');
      expect(Center_AddMargin_011.top).assertEqual(Center_AddMargin_012.top);
      expect(Center_AddMargin_011.top).assertEqual(Center_AddMargin_01.top);
      expect(Center_AddMargin_013.top).assertEqual(Center_AddMargin_012.top);
      expect(Center_AddMargin_012.left).assertEqual(Center_AddMargin_011.right);
      expect(Center_AddMargin_013.left).assertEqual(Center_AddMargin_012.right);
      expect(Math.round(Center_AddMargin_01.left - Center_AddMargin_01_Box.left)).assertEqual(vp2px(20));
      expect(Math.round(Center_AddMargin_01.top - Center_AddMargin_01_Box.top)).assertEqual(vp2px(20));
      expect(Math.round((Center_AddMargin_011.left - Center_AddMargin_01.left)*10)/10)
        .assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round((Center_AddMargin_01.right - Center_AddMargin_013.right)*10)/10)
        .assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(Center_AddMargin_011.bottom - Center_AddMargin_011.top)).assertEqual(vp2px(50));
      expect(Math.round(Center_AddMargin_012.bottom - Center_AddMargin_012.top)).assertEqual(vp2px(100));
      expect(Math.round(Center_AddMargin_013.bottom - Center_AddMargin_013.top)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddMargin_011.right - Center_AddMargin_011.left)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddMargin_012.right - Center_AddMargin_012.left)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddMargin_013.right - Center_AddMargin_013.left)).assertEqual(vp2px(150));
      console.info('[testFlexAlignCenterFlexMargin] END');
      done();
    });
  })
}
