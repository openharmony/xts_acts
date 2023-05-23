
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
export default function rowMar_TextMarPadTest() {
  describe('RowMar_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("rowMar_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Row/subComponentChanged/RowMar_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowMar_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("RowMar_TextMarPad" == pages.name)) {
          console.info("get RowMar_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RowMar_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowMar_TextMarPad page error:" + err);
      }
      console.info("rowMar_TextMarPadTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({name:'rowMargin', value:0});
      globalThis.value.message.notify({name:'firstTextMargin', value:0});
      globalThis.value.message.notify({name:'firstTextPadding', value:0});
      await CommonFunc.sleep(1000);
      console.info("RowMar_TextMarPadTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_0600
     * @tc.name      testRowMarTextPad
     * @tc.desc      The parent component set margin to 5,and the first subcomponent set padding to 10
     */
    it('testRowMarTextPad', 0, async function (done) {
      console.info('[testRowMarTextPad] START');
      let firstText = CommonFunc.getComponentRect('RowMar_TextMarPad1');
      let firstTextTop = firstText.top;
      globalThis.value.message.notify({name:'rowMargin', value:5});
      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMar_TextMarPad1');
      let secondText = CommonFunc.getComponentRect('RowMar_TextMarPad2');
      let thirdText = CommonFunc.getComponentRect('RowMar_TextMarPad3');
      let rowContainer = CommonFunc.getComponentRect('RowMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_RowMar_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowMar_TextMarPad_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(firstText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));
      expect(Math.round(secondText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - secondText.bottom));
      expect(Math.round(thirdText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - thirdText.bottom));

      expect(Math.round((rowContainer.top - columnContainer.top)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10); //row_margin=5
      expect(Math.round((firstText.top - firstTextTop)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10);
      expect(firstText.left).assertEqual(rowContainer.left);

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(10));
      expect(Math.round(secondText.left - firstText.right)).assertEqual(Math.round(thirdText.left - secondText.right));

      expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(30));
      console.info('[testRowMarTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_0700
     * @tc.name      testRowMarTextMar
     * @tc.desc      The parent component set margin to 5,and the first subcomponent set margin to 10
     */
    it('testRowMarTextMar', 0, async function (done) {
      console.info('[testRowMarTextMar] START');
      let firstText = CommonFunc.getComponentRect('RowMar_TextMarPad1');
      let firstTextTop = firstText.top;
      globalThis.value.message.notify({name:'rowMargin', value:5});
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMar_TextMarPad1');
      let secondText = CommonFunc.getComponentRect('RowMar_TextMarPad2');
      let thirdText = CommonFunc.getComponentRect('RowMar_TextMarPad3');
      let rowContainer = CommonFunc.getComponentRect('RowMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_RowMar_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowMar_TextMarPad_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(firstText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));
      expect(Math.round(secondText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - secondText.bottom));
      expect(Math.round(thirdText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - thirdText.bottom));

      expect(Math.round((rowContainer.top - columnContainer.top)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10); //row_margin=5
      expect(Math.round((firstText.top - firstTextTop)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10);
      expect(Math.round(firstText.left - rowContainer.left)).assertEqual(vp2px(10)); //text_margin=10

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(Math.round(thirdText.left - secondText.right)).assertEqual(vp2px(10));

      expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(10));
      console.info('[testRowMarTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_0800
     * @tc.name      testRowMarTextMarPad
     * @tc.desc      The parent component set margin to 5,and the first subcomponent set margin to 10,set padding to 10
     */
    it('testRowMarTextMarPad', 0, async function (done) {
      console.info('[testRowMarTextMarPad] START');
      let firstText = CommonFunc.getComponentRect('RowMar_TextMarPad1');
      let firstTextTop = firstText.top;
      globalThis.value.message.notify({name:'rowMargin', value:5});
      globalThis.value.message.notify({name:'firstTextMargin', value:10});
      globalThis.value.message.notify({name:'firstTextPadding', value:10});
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMar_TextMarPad1');
      let secondText = CommonFunc.getComponentRect('RowMar_TextMarPad2');
      let thirdText = CommonFunc.getComponentRect('RowMar_TextMarPad3');
      let rowContainer = CommonFunc.getComponentRect('RowMar_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_RowMar_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowMar_TextMarPad_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(vp2px(100));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));

      expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
      expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(secondText.right- secondText.left));
      expect(Math.round(secondText.right- secondText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));

      expect(Math.round(firstText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));
      expect(Math.round(secondText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - secondText.bottom));
      expect(Math.round(thirdText.top - rowContainer.top))
        .assertEqual(Math.round(rowContainer.bottom - thirdText.bottom));

      expect(Math.round((rowContainer.top - columnContainer.top)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10); //row_margin=5
      expect(Math.round((firstText.top - firstTextTop)*10)/10).assertEqual(Math.round(vp2px(5)*10)/10);
      expect(Math.round(firstText.left - rowContainer.left)).assertEqual(vp2px(10)); //text_margin=10

      expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(20));
      expect(Math.round(thirdText.left - secondText.right)).assertEqual(vp2px(10));

      expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(10));
      console.info('[testRowMarTextMarPad] END');
      done();
    });
  })
}
