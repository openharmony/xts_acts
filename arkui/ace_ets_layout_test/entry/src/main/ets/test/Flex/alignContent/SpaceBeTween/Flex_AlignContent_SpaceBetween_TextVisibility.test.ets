
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
export default function flex_AlignContent_SpaceBetween_TextVisibilityTest() {
  describe('Flex_AlignContent_SpaceBetween_TextVisibilityTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_TextVisibility beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextVisibility state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextVisibility" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextVisibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_TextVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextVisibility page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'visibility', value:Visibility.Visible});
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1300
     * @tc.name      alignContent_SpaceAround_TextVisibility
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the visibility of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1300', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1300] START');
      try {
        let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility01');
        let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        globalThis.value.message.notify({name:'visibility', value:Visibility.Hidden});
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility03');
        let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility04');
        let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
        expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

        let firstTextStrJson = getInspectorByKey('AlignContent_SpaceBetween_TextVisibility01');
        let firstTextObj = JSON.parse(firstTextStrJson);
        expect(firstTextObj.$attrs.visibility).assertEqual("Visibility.Hidden");

        expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
        expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100)); //三个子组件的高度分别为100、50、100

        expect(secondText.left).assertEqual(thirdText.left);
        expect(thirdText.left).assertEqual(fourthText.left);
        expect(fourthText.left).assertEqual(flexContainer.left);
        expect(Math.round(secondText.top - flexContainer.top)).assertEqual(Math.round(distanceBefore + vp2px(50))); //text1占位
        expect(fourthText.bottom).assertEqual(flexContainer.bottom); //行首行尾贴边

        expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom)); //剩余子组件行间距相等
        expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(distanceBefore));
      } catch (err) {
        console.error('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400] failed');
        expect().assertFail();
      }
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1300] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400
     * @tc.name      alignContent_SpaceAround_TextVisibility
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the visibility of parent component was changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400] START');
      try{
        let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility01');
        let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        globalThis.value.message.notify({name:'visibility', value:Visibility.None})
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility03');
        let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility04');
        let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
        expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

        let firstTextStrJson = getInspectorByKey('AlignContent_SpaceBetween_TextVisibility01');
        let firstTextObj = JSON.parse(firstTextStrJson);
        expect(firstTextObj.$attrs.visibility).assertEqual("Visibility.None");

        expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(50));
        expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(vp2px(100)); //三个子组件的高度分别为100、50、100

        expect(secondText.left).assertEqual(thirdText.left);
        expect(thirdText.left).assertEqual(fourthText.left);
        expect(fourthText.left).assertEqual(flexContainer.left);

        expect(secondText.top).assertEqual(flexContainer.top); //text1不参与占位
        expect(fourthText.bottom).assertEqual(flexContainer.bottom); //行首行尾贴边
        expect(Math.round(thirdText.top - secondText.bottom)).assertEqual(Math.round(fourthText.top - thirdText.bottom)); //剩余子组件行间距相等
        expect(Math.round(thirdText.top - secondText.bottom)).assertLarger(Math.round(distanceBefore)); //行距大于设置前
      } catch (err) {
        console.error('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400] failed');
        expect().assertFail();
      }
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400] END');
      done();
    });
  })
}
