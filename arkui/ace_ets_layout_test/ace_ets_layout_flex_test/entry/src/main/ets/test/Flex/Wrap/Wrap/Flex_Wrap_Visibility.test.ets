
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
export default function flex_Wrap_VisibilityTest() {
  describe('Flex_Wrap_VisibilityTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_VisibilityTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_Visibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_Visibility state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_Visibility" == pages.name)) {
          console.info("get Flex_Wrap_Visibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_Wrap_Visibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_Visibility page error:" + err);
      }
      console.info("Flex_Wrap_VisibilityTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_Visibility after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_2200
     * @tc.name      testWrapWrapTextVisibilityNoneOverflow
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when one of the child components set "Visibility.NOne"
     */
    it('testWrapWrapTextVisibilityNoneOverflow', 0, async function (done) {
      console.info('[testWrapWrapTextVisibilityNoneOverflow] START');
      try{
        globalThis.value.message.notify({name:'firstTextWidth', value:250});
        globalThis.value.message.notify({name:'secondTextWidth', value:350});
        globalThis.value.message.notify({name:'thirdTextWidth', value:350});
        globalThis.value.message.notify({name:'visibility', value:Visibility.None})
        await CommonFunc.sleep(3000);
        let secondText = CommonFunc.getComponentRect('Wrap_Text_Visibility2');
        let thirdText = CommonFunc.getComponentRect('Wrap_Text_Visibility3');
        let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Visibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

        let firstTextStrJson = getInspectorByKey('Wrap_Text_Visibility1');
        let firstTextObj = JSON.parse(firstTextStrJson);
        expect(firstTextObj.$attrs.visibility).assertEqual("Visibility.None");

        expect(secondText.top).assertEqual(flexContainer.top);
        expect(secondText.left).assertEqual(flexContainer.left);

        expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

        expect(Math.round(thirdText.right - thirdText.left)).assertEqual(vp2px(350));
        expect(Math.round(thirdText.right - thirdText.left)).assertEqual(Math.round(secondText.right - secondText.left));

        expect(thirdText.top).assertEqual(secondText.bottom);
        expect(thirdText.left).assertEqual(secondText.left);

        expect(Math.round(thirdText.bottom - flexContainer.bottom)).assertEqual(vp2px(150));
      } catch (err) {
        console.error('[testWrapWrapTextVisibilityNoneOverflow] failed');
        expect().assertFail();
      }
      console.info('[testWrapWrapTextVisibilityNoneOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_2300
     * @tc.name      testWrapWrapTextVisibilityNoneMeet
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *               of the child components when one of the child components set "Visibility.NOne"
     */
    it('testWrapWrapTextVisibilityNoneMeet', 0, async function (done) {
      console.info('[testWrapWrapTextVisibilityNoneMeet] START');
      try{
        globalThis.value.message.notify({name:'firstTextWidth', value:250});
        globalThis.value.message.notify({name:'secondTextWidth', value:150});
        globalThis.value.message.notify({name:'thirdTextWidth', value:150});
        globalThis.value.message.notify({name:'visibility', value:Visibility.None})
        await CommonFunc.sleep(3000);
        let secondText = CommonFunc.getComponentRect('Wrap_Text_Visibility2');
        let thirdText = CommonFunc.getComponentRect('Wrap_Text_Visibility3');
        let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Visibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

        let firstTextStrJson = getInspectorByKey('Wrap_Text_Visibility1');
        let firstTextObj = JSON.parse(firstTextStrJson);
        expect(firstTextObj.$attrs.visibility).assertEqual("Visibility.None");

        expect(secondText.right).assertEqual(thirdText.left);
        expect(secondText.top).assertEqual(thirdText.top);
        expect(flexContainer.top).assertEqual(thirdText.top);

        expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

        expect(Math.round(thirdText.right - thirdText.left)).assertEqual(vp2px(150));
        expect(Math.round(thirdText.right - thirdText.left)).assertEqual(Math.round(secondText.right - secondText.left));

        expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(200));
        expect(flexContainer.left).assertEqual(secondText.left);
      } catch (err) {
        console.error('[testWrapWrapTextVisibilityNoneMeet] failed');
        expect().assertFail();
      }
      console.info('[testWrapWrapTextVisibilityNoneMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_2400
     * @tc.name      testWrapWrapTextVisibilityHidden
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *               of the child components when one of the child components set "Visibility.Hidden"
     */
    it('testWrapWrapTextVisibilityHidden', 0, async function (done) {
      console.info('[testWrapWrapTextVisibilityHidden] START');
      try{
        globalThis.value.message.notify({name:'firstTextWidth', value:150});
        globalThis.value.message.notify({name:'secondTextWidth', value:150});
        globalThis.value.message.notify({name:'thirdTextWidth', value:150});
        globalThis.value.message.notify({name:'visibility', value:Visibility.Hidden})
        await CommonFunc.sleep(3000);
        let secondText = CommonFunc.getComponentRect('Wrap_Text_Visibility2');
        let thirdText = CommonFunc.getComponentRect('Wrap_Text_Visibility3');
        let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_Wrap_Visibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

        let firstTextStrJson = getInspectorByKey('Wrap_Text_Visibility1');
        let firstTextObj = JSON.parse(firstTextStrJson);
        expect(firstTextObj.$attrs.visibility).assertEqual("Visibility.Hidden");

        expect(secondText.right).assertEqual(thirdText.left)
        expect(secondText.top).assertEqual(thirdText.top);
        expect(flexContainer.top).assertEqual(thirdText.top);

        expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(150));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(200));

        expect(Math.round(thirdText.right - thirdText.left)).assertEqual(vp2px(150));
        expect(Math.round(thirdText.right - thirdText.left)).assertEqual(Math.round(secondText.right - secondText.left));

        expect(Math.round(flexContainer.right - thirdText.right)).assertEqual(vp2px(50));
        expect(Math.round(secondText.left - flexContainer.left)).assertEqual(vp2px(150));
      } catch (err) {
        console.error('[testWrapWrapTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testWrapWrapTextVisibilityHidden] END');
      done();
    });
  })
}
