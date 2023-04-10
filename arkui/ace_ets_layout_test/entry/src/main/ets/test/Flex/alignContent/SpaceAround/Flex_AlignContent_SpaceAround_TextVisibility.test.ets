
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
import {MessageManager,Callback} from '../../../../MainAbility/common/MessageManager';
export default function flex_AlignContent_SpaceAround_TextVisibilityTest() {
  describe('Flex_AlignContent_SpaceAround_TextVisibilityTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceAround_TextVisibility beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_TextVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_TextVisibility state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_TextVisibility" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_TextVisibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_TextVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_TextVisibility page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'visibility', value:Visibility.Visible});
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1300
     * @tc.name      alignContent_SpaceAround_TextVisibility
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the visibility of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1300', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1300] START');
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
      let distanceBefore = secondText.top - firstText.bottom;
      globalThis.value.message.notify({name:'visibility', value:Visibility.Hidden});
      await CommonFunc.sleep(3000);
      secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextVisibility_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextVisibility_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100)); //三个子组件的高度分别为100、50、100

      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(fourthText.left).assertEqual(flexContainer.left);
      expect(Math.round((secondText.top - flexContainer.top)*100)/100)
        .assertEqual(Math.round((distanceBefore * 1.5 + vp2px(50))*100)/100); //text1占位

      expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom)); //剩余子组件行间距相等
      expect(Math.round((thirdText.top - secondText.bottom)*10)/10).assertEqual(Math.round(distanceBefore*10)/10); //子组件距离不变
      expect(Math.round((flexContainer.bottom -fourthText.bottom)*100)/100)
        .assertEqual(Math.round((distanceBefore / 2)*100)/100); //行首距离为子组件距离一半
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1300] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1400
     * @tc.name      alignContent_SpaceAround_TextVisibility
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the visibility of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1400', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1400] START');
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
      let distanceBefore = Math.round(secondText.top - firstText.bottom);
      globalThis.value.message.notify({name:'visibility', value:Visibility.None})
      await CommonFunc.sleep(3000);
      secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextVisibility_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextVisibility_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100)); //三个子组件的高度分别为100、50、100

      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(fourthText.left).assertEqual(flexContainer.left);

      expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom)); //剩余子组件行间距相等
      expect(Math.round(thirdText.top - secondText.bottom)).assertLarger(distanceBefore); //行距大于设置前

      expect(Math.round(secondText.top - flexContainer.top))
        .assertEqual(Math.round(flexContainer.bottom - fourthText.bottom)); //text1不参与占位
      expect(Math.round(secondText.top - flexContainer.top))
        .assertEqual(Math.round((thirdText.top - secondText.bottom) / 2)); //行首行尾间距为子组件间距一半
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1400] END');
      done();
    });
  })
}
