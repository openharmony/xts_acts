
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_Wrap_DisplayPriorityTest() {
  describe('Flex_Wrap_DisplayPriorityTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_DisplayPriority beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_DisplayPriority',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_DisplayPriority state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_DisplayPriority" == pages.name)) {
          console.info("get Flex_Wrap_DisplayPriority state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_DisplayPriority page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_DisplayPriority page error:" + err);
      }
      console.info("Flex_Wrap_DisplayPriority beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_DisplayPriority after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_0100
     * @tc.name      testWrapWrapTextDisplayPriority
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *               of the child components,and displaypriority of the child components set different values
     */
    it('testWrapWrapTextDisplayPriority', 0, async function (done) {
      console.info('[testWrapWrapTextDisplayPriority] START');
      globalThis.value.message.notify({name:'firstTextPriority', value:3});
      globalThis.value.message.notify({name:'secondTextPriority', value:2});
      globalThis.value.message.notify({name:'thirdTextPriority', value:1});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_DisplayPriority01');
      let secondText = CommonFunc.getComponentRect('Wrap_DisplayPriority02');
      let thirdText = CommonFunc.getComponentRect('Wrap_DisplayPriority03');
      let flexContainer = CommonFunc.getComponentRect('FlexWrap_DisplayPriority_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexWrap_DisplayPriority_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.right).assertEqual(secondText.left);
      expect(firstText.top).assertEqual(secondText.top);
      expect(firstText.top).assertEqual(flexContainer.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(100));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(secondText.right - secondText.left)).assertEqual(vp2px(150));
      expect(Math.round(thirdText.right - thirdText.left)).assertEqual(vp2px(300));

      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(vp2px(200));
      expect(thirdText.left).assertEqual(flexContainer.left);
      expect(thirdText.top).assertEqual(secondText.bottom);
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(50));
      console.info('[testWrapWrapTextDisplayPriority] END');
      done();
    });
  })
}
