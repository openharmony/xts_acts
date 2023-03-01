
/**
 * Copyright (c) 2023-2030 iSoftStone Information Technology (Group) Co.,Ltd.
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
import {MessageManager,Callback} from '../../../../MainAbility/common/MessageManager';
export default function flex_AlignContent_SpaceBetween_FlexPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_FlexPad beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexPad state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexPad" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexPad page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400
     * @tc.name      alignContent_SpaceAround_FlexPadding
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400] START');
      globalThis.value.message.notify({name:'padding', value:50})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(firstText.bottom - firstText.top).assertEqual(vp2px(50));
      expect(secondText.bottom - secondText.top).assertEqual(vp2px(100));
      expect(thirdText.bottom - thirdText.top).assertEqual(vp2px(150));
      expect(fourthText.bottom - fourthText.top).assertEqual(vp2px(200)); //四个子组件的高度分别为50、100、150、200

      expect(firstText.top - flexContainer.top).assertEqual(vp2px(50)); //padding =50
      expect(firstText.left - flexContainer.left).assertEqual(vp2px(50)); //padding =50
      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);

      expect(firstText.bottom).assertEqual(secondText.top);
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(thirdText.bottom).assertEqual(fourthText.top); //无行间距
      expect(fourthText.bottom - flexContainer.bottom).assertEqual(vp2px(10)); //行首贴边行尾溢出
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500
     * @tc.name      alignContent_SpaceAround_FlexPadding
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500] START');
      globalThis.value.message.notify({name:'padding', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(firstText.bottom - firstText.top).assertEqual(vp2px(50));
      expect(secondText.bottom - secondText.top).assertEqual(vp2px(100));
      expect(thirdText.bottom - thirdText.top).assertEqual(vp2px(150));
      expect(fourthText.bottom - fourthText.top).assertEqual(vp2px(200)); //四个子组件的高度分别为50、100、150、200

      expect(firstText.left - flexContainer.left).assertEqual(vp2px(10)); //padding =10
      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(firstText.top - flexContainer.top).assertEqual(vp2px(10));
      expect(flexContainer.bottom - fourthText.bottom).assertEqual(vp2px(10)); //行首偏移行尾未溢出

      expect(secondText.top - firstText.bottom).assertEqual(thirdText.top - secondText.bottom);
      expect(thirdText.top - secondText.bottom).assertEqual(fourthText.top - thirdText.bottom); //行间距相等
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500] END');
      done();
    });
  })
}
