
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_Wrap_PositionTest() {
  describe('Flex_Wrap_PositionTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_PositionTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_Position',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_Position state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_Position" == pages.name)) {
          console.info("get Flex_Wrap_Position state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_Position page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_Position page error:" + err);
      }
      console.info("Flex_Wrap_PositionTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_Position after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1900
     * @tc.name      testWrapWrapTextPosition
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *               of the child components when the first child components change position
     */
    it('testWrapWrapTextPosition', 0, async function (done) {
      console.info('[testWrapWrapTextPosition] START');
      globalThis.value.message.notify({name:'position', value: {x:20, y:40}})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_Position01');
      let secondText = CommonFunc.getComponentRect('Wrap_Position02');
      let thirdText = CommonFunc.getComponentRect('Wrap_Position03');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Position_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Position_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(150));
      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(200));

      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(vp2px(40));
      expect(Math.round(firstText.left-flexContainer.left)).assertEqual(vp2px(20)); //position({x:20,y:40})

      expect(secondText.top).assertEqual(flexContainer.top)
      expect(secondText.left).assertEqual(flexContainer.left);
      expect(secondText.top).assertEqual(thirdText.top);
      expect(secondText.right).assertEqual(thirdText.left);
      console.info('[testWrapWrapTextPosition] END');
      done();
    });
  })
}
