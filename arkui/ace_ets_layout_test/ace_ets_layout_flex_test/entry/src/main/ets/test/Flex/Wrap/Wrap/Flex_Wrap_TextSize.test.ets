
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
//import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_Wrap_TextSizeTest()   {
  describe('Flex_Wrap_TextSizeTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_TextSizeTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_TextSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_TextSize state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_TextSize" == pages.name)) {
          console.info("get Flex_Wrap_TextSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_TextSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_TextSize page error:" + err);
      }
      console.info("Flex_Wrap_TextSizeTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_TextSizeTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_2000
     * @tc.name      testWrapWrapTextSizeMeet
     * @tc.desc      The size of the parent component in the main axis direction
     *               meets the layout of the child components when the child component change size
     */
    it('testWrapWrapTextSizeMeet', 0, async function (done) {
      console.info('[testWrapWrapTextSizeMeet] START');
      globalThis.value.message.notify({name:'width', value:150})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flex_TextSize1');
      let secondText = CommonFunc.getComponentRect('Wrap_flex_TextSize2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flex_TextSize3');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_TextSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_TextSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(secondText.right).assertEqual(thirdText.left);
      expect(firstText.top).assertEqual(secondText.top);
      expect(secondText.top).assertEqual(thirdText.top);

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(150));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(50));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(150));
      console.info('[testWrapWrapTextSizeMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_2100
     * @tc.name      testWrapWrapTextSizeOverflow
     * @tc.desc      The size of the parent component in the main axis direction
     *               is not enough for the layout of the child components when the child component change size
     */
    it('testWrapWrapTextSizeOverflow', 0, async function (done) {
      console.info('[testWrapWrapTextSizeOverflow] START');
      globalThis.value.message.notify({name:'width', value:200})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flex_TextSize1');
      let secondText = CommonFunc.getComponentRect('Wrap_flex_TextSize2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flex_TextSize3');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_TextSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_TextSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right - firstText.left)).assertEqual(vp2px(200));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(secondText.right - secondText.left));
      expect(Math.round(firstText.right - firstText.left)).assertEqual(Math.round(thirdText.right - thirdText.left));

      expect(firstText.top).assertEqual(secondText.top);
      expect(firstText.right).assertEqual(secondText.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(firstText.left).assertEqual(flexContainer.left);
      expect(secondText.left).assertEqual(thirdText.right);
      expect(secondText.bottom).assertEqual(thirdText.top);

      expect(Math.round(flexContainer.right - secondText.right)).assertEqual(vp2px(100));
      expect(Math.round(flexContainer.bottom - thirdText.bottom)).assertEqual(vp2px(50));
      console.info('[testWrapWrapTextSizeOverflow] END');
      done();
    });
  })
}
