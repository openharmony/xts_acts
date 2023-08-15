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
export default function AlignCenter_AddPadding() {
  describe('AlignCenter_AddPadding', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddPadding state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddPadding" == pages.name)) {
          console.info("get AlignCenter_AddPadding state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddPadding page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0300
     * @tc.name      testFlexAlignCenterFlexPadOverflow
     * @tc.desc      After subtracting the padding from the parent component layout space, the interface
     * display that does not meet the spindle layout of the child component
     */
    it('testFlexAlignCenterFlexPadOverflow', 0, async function (done) {
      console.info('[testFlexAlignCenterFlexPadOverflow] START');
      globalThis.value.message.notify({name:'DadPadding', value:30});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddPadding_011 = CommonFunc.getComponentRect('Center_AddPadding_011');
      let Center_AddPadding_012 = CommonFunc.getComponentRect('Center_AddPadding_012');
      let Center_AddPadding_013 = CommonFunc.getComponentRect('Center_AddPadding_013');
      let Center_AddPadding_01 = CommonFunc.getComponentRect('Center_AddPadding_01');
      expect(Center_AddPadding_011.top).assertEqual(Center_AddPadding_012.top);
      expect(Center_AddPadding_012.top).assertEqual(Center_AddPadding_013.top);
      expect(Center_AddPadding_012.left).assertEqual(Center_AddPadding_011.right);
      expect(Center_AddPadding_013.left).assertEqual(Center_AddPadding_012.right);
      expect(Math.round(Center_AddPadding_011.left - Center_AddPadding_01.left)).assertEqual(vp2px(30));
      expect(Math.round(Center_AddPadding_01.right - Center_AddPadding_013.right)).assertEqual(vp2px(30));
      expect(Math.round(Center_AddPadding_011.top - Center_AddPadding_01.top)).assertEqual(vp2px(30));
      expect(Math.round(Center_AddPadding_011.bottom - Center_AddPadding_011.top)).assertEqual(vp2px(50));
      expect(Math.round(Center_AddPadding_012.bottom - Center_AddPadding_012.top)).assertEqual(vp2px(100));
      expect(Math.round(Center_AddPadding_013.bottom - Center_AddPadding_013.top)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddPadding_011.right - Center_AddPadding_011.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(Center_AddPadding_012.right - Center_AddPadding_012.left)).assertEqual(Math.round(vp2px(440/3)));
      expect(Math.round(Center_AddPadding_013.right - Center_AddPadding_013.left)).assertEqual(Math.round(vp2px(440/3)));
      console.info('[testFlexAlignCenterFlexPadOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0400
     * @tc.name      testFlexAlignCenterFlexPadMeet
     * @tc.desc      After subtracting the padding from the parent component layout space, the interface that
     * satisfies the spindle layout of the child component is displayed
     */
    it('testFlexAlignCenterFlexPadMeet', 0, async function (done) {
      console.info('[testFlexAlignCenterFlexPadMeet] START');
      globalThis.value.message.notify({name:'DadPadding', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Center_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
      let Center_AddPadding_011 = CommonFunc.getComponentRect('Center_AddPadding_011');
      let Center_AddPadding_012 = CommonFunc.getComponentRect('Center_AddPadding_012');
      let Center_AddPadding_013 = CommonFunc.getComponentRect('Center_AddPadding_013');
      let Center_AddPadding_01 = CommonFunc.getComponentRect('Center_AddPadding_01');
      expect(Center_AddPadding_011.top).assertEqual(Center_AddPadding_012.top);
      expect(Center_AddPadding_012.top).assertEqual(Center_AddPadding_013.top);
      expect(Center_AddPadding_012.left) .assertEqual(Center_AddPadding_011.right);
      expect(Center_AddPadding_013.left) .assertEqual(Center_AddPadding_012.right);
      expect(Math.round(Center_AddPadding_011.top - Center_AddPadding_01.top)).assertEqual(vp2px(20));
      expect(Math.round((Center_AddPadding_011.left - Center_AddPadding_01.left)*10)/10)
        .assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round((Center_AddPadding_01.right - Center_AddPadding_013.right)*10)/10)
        .assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(Center_AddPadding_011.right - Center_AddPadding_011.left)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddPadding_012.right - Center_AddPadding_012.left)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddPadding_013.right - Center_AddPadding_013.left)).assertEqual(vp2px(150));
      expect(Math.round(Center_AddPadding_011.bottom - Center_AddPadding_011.top)).assertEqual(vp2px(50));
      expect(Math.round(Center_AddPadding_012.bottom - Center_AddPadding_012.top)).assertEqual(vp2px(100));
      expect(Math.round(Center_AddPadding_013.bottom - Center_AddPadding_013.top)).assertEqual(vp2px(150));
      console.info('[testFlexAlignCenterFlexPadMeet] END');
      done();
    });
  })
}
