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
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function column_AlignItems_ChangeParent() {
  
  describe('Column_AlignItems_ChangeParentTest', function () {
    beforeEach(async function (done) {
      console.info("Column_AlignItems_ChangeParent beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Column/ParentComponentChanged/Column_AlignItems_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_AlignItems_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_AlignItems_ChangeParent" == pages.name)) {
          console.info("get Column_AlignItems_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_AlignItems_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_AlignItems_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Column_AlignItems_ChangeParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_ALIGNITEMS_CHANGEPARENT_TEST_0100
     * @tc.name      testColumnAlignItemsChangeParentHorizontalAlignStart
     * @tc.desc      The parent component is bound to alignItems property HorizontalAlign.Start. Other parameters are default
     */
    it('testColumnAlignItemsChangeParentHorizontalAlignStart', 0, async function (done) {
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignStart START');
      globalThis.value.message.notify({name:'alignItems', value:HorizontalAlign.Start})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnAlignItemsChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('AlignItems_Test1');
      let locationText2 = CommonFunc.getComponentRect('AlignItems_Test2');
      let locationText3 = CommonFunc.getComponentRect('AlignItems_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnAlignItemsChange1');
      expect(locationText1.left).assertEqual(locationColumn.left);
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(Math.round(locationColumn.right - locationText1.right)).assertEqual(vp2px(50));
      expect(locationText1.top).assertEqual(locationColumn.top);
      expect(Math.round(locationColumn.bottom - locationText3.bottom)).assertEqual(vp2px(40));
      expect(Math.round(locationText2.top - locationText1.bottom))
        .assertEqual(Math.round(locationText3.top - locationText2.bottom));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(vp2px(30));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignStart END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_ALIGNITEMS_CHANGEPARENT_TEST_0200
     * @tc.name      testColumnAlignItemsChangeParentHorizontalAlignEnd
     * @tc.desc      The parent component is bound to alignItems property HorizontalAlign.End. Other parameters are default
     */
    it('testColumnAlignItemsChangeParentHorizontalAlignEnd', 0, async function (done) {
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignEnd START');
      globalThis.value.message.notify({name:'alignItems', value:HorizontalAlign.End})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnAlignItemsChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('AlignItems_Test1');
      let locationText2 = CommonFunc.getComponentRect('AlignItems_Test2');
      let locationText3 = CommonFunc.getComponentRect('AlignItems_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnAlignItemsChange1');
      expect(locationText1.right).assertEqual(locationColumn.right);
      expect(locationText1.right).assertEqual(locationText2.right);
      expect(locationText2.right).assertEqual(locationText3.right);
      expect(Math.round(locationText1.left - locationColumn.left)).assertEqual(vp2px(50));
      expect(locationText1.top).assertEqual(locationColumn.top);
      expect(Math.round(locationColumn.bottom - locationText3.bottom)).assertEqual(vp2px(40));
      expect(Math.round(locationText2.top - locationText1.bottom))
        .assertEqual(Math.round(locationText3.top - locationText2.bottom));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(vp2px(30));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignEnd END');
      done();
    });
  })
}