
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
export default function flex_AlignContent_SpaceAround_TextMarTest() {
  describe('Flex_AlignContent_SpaceAround_TextMarTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceAround_TextMar beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_TextMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_TextMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_TextMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_TextMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_TextMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_TextMar page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_TextMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0800
     * @tc.name      alignContent_SpaceAround_TextMargin
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0800', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0800] START');
      globalThis.value.message.notify({name:'margin', value:65})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');
      expect(firstText.bottom - firstText.top).assertEqual(vp2px(50));
      expect(secondText.bottom - secondText.top).assertEqual(vp2px(100));
      expect(thirdText.bottom - thirdText.top).assertEqual(vp2px(50));
      expect(fourthText.bottom - fourthText.top).assertEqual(vp2px(100)); //四个子组件的高度分别为50、100、50、100

      expect(firstText.left - flexContainer.left).assertEqual(vp2px(65)); //margin =65
      expect(flexContainer.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);

      expect(secondText.top - firstText.bottom).assertEqual(vp2px(65));
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(thirdText.bottom).assertEqual(fourthText.top); //无行间距
      expect(fourthText.bottom - flexContainer.bottom).assertEqual(vp2px(30)); //行首贴边行尾溢出
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0800] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0900
     * @tc.name      alignContent_SpaceAround_TextMargin
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0900', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0900] START');
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(firstText.bottom - firstText.top).assertEqual(vp2px(50));
      expect(secondText.bottom - secondText.top).assertEqual(vp2px(100));
      expect(thirdText.bottom - thirdText.top).assertEqual(vp2px(50));
      expect(fourthText.bottom - fourthText.top).assertEqual(vp2px(100)); //四个子组件的高度分别为50、100、50、100

      expect(firstText.left - flexContainer.left).assertEqual(vp2px(10)); //margin =10
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(firstText.top - flexContainer.top - vp2px(10)).assertEqual(flexContainer.bottom - fourthText.bottom);

      expect(secondText.top - firstText.bottom - vp2px(10)).assertEqual(thirdText.top - secondText.bottom);
      expect(thirdText.top - secondText.bottom).assertEqual(fourthText.top - thirdText.bottom); //行间距相等
      expect(flexContainer.bottom - fourthText.bottom).assertEqual((fourthText.top - thirdText.bottom) / 2); //行首行尾距离是组件间距的一半
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0900] END');
      done();
    });
  })
}
