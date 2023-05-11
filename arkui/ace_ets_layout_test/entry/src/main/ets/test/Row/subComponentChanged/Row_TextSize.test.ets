
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
import CommonFunc from '../../../MainAbility/common/Common';
export default function row_TextSizeTest() {
  describe('Row_TextSizeTest', function () {
    beforeEach(async function (done) {
      console.info("Row_TextSizeTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextSize state pages:" + JSON.stringify(pages));
        if (!("Row_TextSize" == pages.name)) {
          console.info("get Row_TextSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextSize page error:" + err);
      }
      console.info("Row_TextSizeTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({name:'width', value:100});
      globalThis.value.message.notify({name:'height', value:50});
      await CommonFunc.sleep(1000);
      console.info("Row_TextSizeTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_0100
     * @tc.name      testRowTextSizeHeight
     * @tc.desc      The height of the first subcomponent changed
     */
    it('testRowTextSizeHeight', 0, async function (done) {
      console.info('[testRowTextSizeHeight] START');
      let secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let secondTextTop = secondText.top;
      let secondTextLeft = secondText.left;
      globalThis.value.message.notify({name:'height', value:130});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Row_TextSize1');
      secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let thirdText = CommonFunc.getComponentRect('Row_TextSize3');
      let rowContainer = CommonFunc.getComponentRect('Row_TextSize_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextSize_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(130));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(firstText.left).assertEqual(rowContainer.left);
      expect(Math.round(firstText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));

      expect(secondText.top).assertEqual(secondTextTop);
      expect(secondText.left).assertEqual(secondTextLeft);

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(10));
      expect(Math.round(secondText.left - firstText.right)).assertEqual(Math.round(thirdText.left - secondText.right));

      expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(30));
      console.info('[testRowTextSizeHeight] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_0200
     * @tc.name      testRowTextSizeWidth
     * @tc.desc      The width of the first subcomponent changed
     */
    it('testRowTextSizeWidth', 0, async function (done) {
      console.info('[testRowTextSizeWidth] START');
      let secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let secondTextTop = secondText.top;
      let secondTextLeft = secondText.left;
      globalThis.value.message.notify({name:'width', value:130});
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Row_TextSize1');
      secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let thirdText = CommonFunc.getComponentRect('Row_TextSize3');
      let rowContainer = CommonFunc.getComponentRect('Row_TextSize_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextSize_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(130));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(vp2px(100));
      expect(Math.round(secondText.right- secondText.left))
        .assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(firstText.left).assertEqual(rowContainer.left);
      expect(Math.round(firstText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));

      expect(secondText.top).assertEqual(secondTextTop);
      expect(secondText.left).assertEqual(secondTextLeft + vp2px(30));

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(10));
      expect(Math.round(secondText.left - firstText.right))
        .assertEqual(Math.round(thirdText.left - secondText.right));

      expect(rowContainer.right).assertEqual(thirdText.right);
      console.info('[testRowTextSizeWidth] END');
      done();
    });
  })
}
