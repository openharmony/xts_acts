
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
export default function row_TextOffsetTest() {
  describe('Row_TextOffsetTest', function () {
    beforeEach(async function (done) {
      console.info("Row_TextPositionTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextOffset state pages:" + JSON.stringify(pages));
        if (!("Row_TextOffset" == pages.name)) {
          console.info("get Row_TextOffset pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextOffset page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextOffset page error:" + err);
      }
      console.info("Row_TextPositionTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Row_TextOffsetTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_1300
     * @tc.name      testRowTextOffset
     * @tc.desc      The offset of first subcomponent changed
     */
    it('testRowTextOffset', 0, async function (done) {
      console.info('[testRowTextOffset] START');
      let firstText = CommonFunc.getComponentRect('Row_TextOffset1');
      let secondText = CommonFunc.getComponentRect('Row_TextOffset2');
      let firstTextLeft = firstText.left;
      let firstTextTop= firstText.top;
      let secondTextTop = secondText.top;
      let secondTextLeft = secondText.left;
      globalThis.value.message.notify({name:'offset', value:{x:10, y:10}});
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('Row_TextOffset1');
      secondText = CommonFunc.getComponentRect('Row_TextOffset2');
      let thirdText = CommonFunc.getComponentRect('Row_TextOffset3');
      let rowContainer = CommonFunc.getComponentRect('Row_TextOffset_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextOffset_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(firstText.left -firstTextLeft)).assertEqual(vp2px(10));
      expect(Math.round(firstText.top -firstTextTop)).assertEqual(vp2px(10));

      expect(secondText.top).assertEqual(secondTextTop);
      expect(secondText.left).assertEqual(secondTextLeft);

      expect(Math.round(secondText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - secondText.bottom));
      expect(Math.round(thirdText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - thirdText.bottom));

      expect(Math.round(thirdText.left - secondText.right)).assertEqual(vp2px(10));

      expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(30));
      console.info('[testRowTextOffset] END');
      done();
    });
  })
}
