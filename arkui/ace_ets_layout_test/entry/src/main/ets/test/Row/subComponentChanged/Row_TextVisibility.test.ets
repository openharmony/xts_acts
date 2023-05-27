
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
export default function row_TextVisibilityTest() {
  describe('Row_TextVisibilityTest', function () {
    beforeAll(async function (done) {
      console.info("Row_TextVisibilityTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextVisibility state pages:" + JSON.stringify(pages));
        if (!("Row_TextVisibility" == pages.name)) {
          console.info("get Row_TextPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextVisibility page error:" + err);
      }
      console.info("Row_TextVisibilityTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(3000);
      console.info("Row_TextVisibilityTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_1800
     * @tc.name      testRowTextVisibilityNone
     * @tc.desc      The visibility of second subcomponent set to 'None'
     */
    it('testRowTextVisibilityNone', 0, async function (done) {
      console.info('[testRowTextVisibilityNone] START');
      try{
        globalThis.value.message.notify({name:'secondTextVisibility', value:Visibility.None});
        await CommonFunc.sleep(3000);
        let firstText = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = getInspectorByKey('Row_TextVisibility_Container01');
        let rowContainerObj = JSON.parse(rowContainerStrJson);
        expect(rowContainerObj.$type).assertEqual('Row');

        let secondTextStrJson = getInspectorByKey('Row_TextVisibility2');
        let secondTextObj = JSON.parse(secondTextStrJson);
        expect(secondTextObj.$attrs.visibility).assertEqual("Visibility.None");

        expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));
        
        expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
        expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));
        
        expect(Math.round(firstText.top - rowContainer.top))
          .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));
        expect(Math.round(thirdText.top - rowContainer.top))
          .assertEqual(Math.round(rowContainer.bottom - thirdText.bottom));
        
        expect(firstText.left).assertEqual(rowContainer.left);
        expect(Math.round(thirdText.left - firstText.right)).assertEqual(vp2px(10));
        
        expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(140));
      } catch (err) {
        console.error('[testRowTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityNone] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_1900
     * @tc.name      testRowTextVisibilityHidden
     * @tc.desc      The visibility of second subcomponent set to 'Hidden'
     */
    it('testRowTextVisibilityHidden', 0, async function (done) {
      console.info('[testRowTextVisibilityHidden] START');
      try {
        globalThis.value.message.notify({name:'secondTextVisibility', value:Visibility.Hidden});
        await CommonFunc.sleep(3000);
        let firstText = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = getInspectorByKey('Row_TextVisibility_Container01');
        let rowContainerObj = JSON.parse(rowContainerStrJson);
        expect(rowContainerObj.$type).assertEqual('Row');
        let secondTextStrJson = getInspectorByKey('Row_TextVisibility2');
        let secondTextObj = JSON.parse(secondTextStrJson);
        expect(secondTextObj.$attrs.visibility).assertEqual("Visibility.Hidden");
        expect(Math.round(firstText.bottom - firstText.top)).assertEqual(vp2px(50));
        expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(vp2px(150));
        
        expect(Math.round(firstText.right- firstText.left)).assertEqual(vp2px(100));
        expect(Math.round(firstText.right- firstText.left)).assertEqual(Math.round(thirdText.right- thirdText.left));
        
        expect(Math.round(firstText.top - rowContainer.top))
          .assertEqual(Math.round(rowContainer.bottom - firstText.bottom));
        expect(Math.round(thirdText.top - rowContainer.top))
          .assertEqual(Math.round(rowContainer.bottom - thirdText.bottom));
        
        expect(firstText.left).assertEqual(rowContainer.left);
        expect(Math.round(thirdText.left - firstText.right)).assertEqual(vp2px(120));
        
        expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(30));
      } catch (err) {
        console.error('[testRowTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityHidden] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_2000
     * @tc.name      testRowTextVisibilityVisible
     * @tc.desc      The visibility of second subcomponent set to 'visible'
     */
    it('testRowTextVisibilityVisible', 0, async function (done) {
      console.info('[testRowTextVisibilityVisible] START');
      try {
        globalThis.value.message.notify({name:'secondTextVisibility', value:Visibility.Visible});
        await CommonFunc.sleep(3000);
        let firstText = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = getInspectorByKey('Row_TextVisibility_Container01');
        let rowContainerObj = JSON.parse(rowContainerStrJson);
        expect(rowContainerObj.$type).assertEqual('Row');
        
        let secondTextStrJson = getInspectorByKey('Row_TextVisibility2');
        let secondTextObj = JSON.parse(secondTextStrJson);
        expect(secondTextObj.$attrs.visibility).assertEqual("Visibility.Visible");
        
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
        
        expect(firstText.left).assertEqual(rowContainer.left);
        expect(Math.round(secondText.left - firstText.right)).assertEqual(vp2px(10));
        expect(Math.round(secondText.left - firstText.right)).assertEqual(Math.round(thirdText.left - secondText.right));
        
        expect(Math.round(rowContainer.right - thirdText.right)).assertEqual(vp2px(30));
      } catch (err) {
        console.error('[testRowTextVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityVisible] END');
      done();
    });
  })
}
