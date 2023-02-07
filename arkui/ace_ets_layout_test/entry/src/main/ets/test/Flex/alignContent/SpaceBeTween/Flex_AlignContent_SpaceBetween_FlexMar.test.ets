
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
export default function flex_AlignContent_SpaceBetween_FlexMarTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexMarTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_FlexMar beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexMar page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0100
     * @tc.name      alignContent_SpaceAround_FlexMargin
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the height and width of parent component changed
     */
    it('SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0100', 0, async function (done) {
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0100] START');
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMar_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(firstText.bottom - firstText.top).assertEqual(vp2px(50));
      expect(secondText.bottom - secondText.top).assertEqual(vp2px(100));
      expect(thirdText.bottom - thirdText.top).assertEqual(vp2px(150));
      expect(fourthText.bottom - fourthText.top).assertEqual(vp2px(200)); //四个子组件的高度分别为50、100、150、200
      expect(flexContainer.top - columnContainer.top).assertEqual(vp2px(10)); //margin =10

      expect(firstText.left).assertEqual(flexContainer.left);
      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);
      expect(fourthText.left).assertEqual(flexContainer.left);
      expect(firstText.top).assertEqual(flexContainer.top);
      expect(fourthText.bottom).assertEqual(flexContainer.bottom); //行首行尾贴边

      expect(secondText.top - firstText.bottom).assertEqual(thirdText.top - secondText.bottom);
      expect(thirdText.top - secondText.bottom).assertEqual(fourthText.top - thirdText.bottom); //行间距相等
      console.info('[SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0100] END');
      done();
    });
  })
}
