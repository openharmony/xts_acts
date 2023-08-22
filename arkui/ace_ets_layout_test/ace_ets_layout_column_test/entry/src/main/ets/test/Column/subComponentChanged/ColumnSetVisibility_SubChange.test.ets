/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function ColumnSetVisibility_SubChange() {
  describe('ColumnSetVisibilityTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetVisibility_SubChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ColumnSetVisibility state success " + JSON.stringify(pages));
        if (!("ColumnSetVisibility_SubChange" == pages.name)) {
          console.info("get ColumnSetVisibility state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ColumnSetVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetVisibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(3000);
      console.info("ColumnSetVisibility after each called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2000
     * @tc.name      testColumnSetVisibilityNoneVisible
     * @tc.desc      The subcomponents set visibility.none and visibility.visible.
     */
    it('testColumnSetVisibilityNoneVisible', 0, async function (done) {
      console.info('new testColumnSetVisibilityNoneVisible START');
      try{
            globalThis.value.message.notify({name:'testVisibility1', value:Visibility.None});
            globalThis.value.message.notify({name:'testVisibility2', value:Visibility.Visible});
            await CommonFunc.sleep(3000);
            let strJson = getInspectorByKey('columnSetVisibility_1');
            let obj = JSON.parse(strJson);
            expect(obj.$attrs.visibility).assertEqual("Visibility.None");
            let columnSetVisibility_1 = CommonFunc.getComponentRect('columnSetVisibility_1');
            let columnSetVisibility_2 = CommonFunc.getComponentRect('columnSetVisibility_2');
            let columnSetVisibility_3 = CommonFunc.getComponentRect('columnSetVisibility_3');
            let columnSetVisibility = CommonFunc.getComponentRect('columnSetVisibility');
            expect(columnSetVisibility_1.bottom - columnSetVisibility_1.top).assertEqual(vp2px(0))
            expect(columnSetVisibility_1.right - columnSetVisibility_1.left).assertEqual(vp2px(0))
            expect(columnSetVisibility_2.top).assertEqual (columnSetVisibility.top)
            expect(Math.round(columnSetVisibility_3.top - columnSetVisibility_2.bottom)).assertEqual(vp2px(30))
            expect(Math.round(columnSetVisibility.bottom - columnSetVisibility_3.bottom)).assertEqual(vp2px(120))

      } catch (err) {
        console.error('[testColumnSetVisibilityNoneVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityNoneVisible END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2100
     * @tc.name      testColumnSetVisibilityHiddenVisible
     * @tc.desc      The subcomponents set visibility.hidden and visibility.visible.
     */
    it('testColumnSetVisibilityHiddenVisible', 0, async function (done) {
      console.info('new testColumnSetVisibilityHiddenVisible START');
      try{
            globalThis.value.message.notify({name:'testVisibility1', value:Visibility.Hidden});
            globalThis.value.message.notify({name:'testVisibility2', value:Visibility.Visible});
            await CommonFunc.sleep(3000);
            let strJson = getInspectorByKey('columnSetVisibility_1');
            let obj = JSON.parse(strJson);
            expect(obj.$attrs.visibility).assertEqual("Visibility.Hidden");
            let columnSetVisibility_1 = CommonFunc.getComponentRect('columnSetVisibility_1');
            let columnSetVisibility_2 = CommonFunc.getComponentRect('columnSetVisibility_2');
            let columnSetVisibility_3 = CommonFunc.getComponentRect('columnSetVisibility_3');
            let columnSetVisibility = CommonFunc.getComponentRect('columnSetVisibility');
            expect(columnSetVisibility.top).assertEqual(columnSetVisibility_1.top)
            expect(Math.round(columnSetVisibility_2.top - columnSetVisibility_1.bottom)).assertEqual(vp2px(30))
            expect(Math.round(columnSetVisibility_3.top - columnSetVisibility_2.bottom)).assertEqual(vp2px(30))
            expect(Math.round(columnSetVisibility.bottom - columnSetVisibility_3.bottom)).assertEqual(vp2px(40))
      } catch (err) {
        console.error('[testColumnSetVisibilityHiddenVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityHiddenVisible END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2200
     * @tc.name      testColumnSetVisibilityVisible
     * @tc.desc      The subcomponents both set visibility.visible.
     */
    it('testColumnSetVisibilityVisible', 0, async function (done) {
      console.info('new testColumnSetVisibilityVisible START');
      try{
          globalThis.value.message.notify({name:'testVisibility1', value:Visibility.Visible});
          globalThis.value.message.notify({name:'testVisibility2', value:Visibility.Visible});
          await CommonFunc.sleep(3000);
          let strJson = getInspectorByKey('columnSetVisibility_1');
          let obj = JSON.parse(strJson);
          expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
          let columnSetVisibility_1 = CommonFunc.getComponentRect('columnSetVisibility_1');
          let columnSetVisibility_2 = CommonFunc.getComponentRect('columnSetVisibility_2');
          let columnSetVisibility_3 = CommonFunc.getComponentRect('columnSetVisibility_3');
          let columnSetVisibility = CommonFunc.getComponentRect('columnSetVisibility');
         expect(columnSetVisibility.top).assertEqual(columnSetVisibility_1.top)
         expect(Math.round(columnSetVisibility_2.top - columnSetVisibility_1.bottom)).assertEqual(vp2px(30))
         expect(Math.round(columnSetVisibility_3.top - columnSetVisibility_2.bottom)).assertEqual(vp2px(30))
         expect(Math.round(columnSetVisibility.bottom - columnSetVisibility_3.bottom)).assertEqual(vp2px(40))
      } catch (err) {
        console.error('[testColumnSetVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisible END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2300
     * @tc.name      testColumnSetVisibilityVisibleNone
     * @tc.desc      The subcomponents set visibility.visible and visibility.none.
     */
    it('testColumnSetVisibilityVisibleNone', 0, async function (done) {
      console.info('new testColumnSetVisibilityVisibleNone START');
      try{
            globalThis.value.message.notify({name:'testVisibility1', value:Visibility.Visible});
            globalThis.value.message.notify({name:'testVisibility2', value:Visibility.None});
            await CommonFunc.sleep(3000);
            let strJson = getInspectorByKey('columnSetVisibility_2');
            let obj = JSON.parse(strJson);
            expect(obj.$attrs.visibility).assertEqual("Visibility.None");
            let columnSetVisibility_1 = CommonFunc.getComponentRect('columnSetVisibility_1');
            let columnSetVisibility_2 = CommonFunc.getComponentRect('columnSetVisibility_2');
            let columnSetVisibility_3 = CommonFunc.getComponentRect('columnSetVisibility_3');
            let columnSetVisibility = CommonFunc.getComponentRect('columnSetVisibility');
            expect(columnSetVisibility_2.bottom).assertEqual (columnSetVisibility_2.top)
            expect(columnSetVisibility_2.right).assertEqual (columnSetVisibility_2.left)
            expect(columnSetVisibility_1.top).assertEqual (columnSetVisibility.top)
            expect(Math.round(columnSetVisibility_3.top - columnSetVisibility_1.bottom)).assertEqual(vp2px(30))
            expect(Math.round(columnSetVisibility.bottom - columnSetVisibility_3.bottom)).assertEqual(vp2px(170))
      } catch (err) {
        console.error('[testColumnSetVisibilityVisibleNone] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisibleNone END');
      done();
    });
  })
}
