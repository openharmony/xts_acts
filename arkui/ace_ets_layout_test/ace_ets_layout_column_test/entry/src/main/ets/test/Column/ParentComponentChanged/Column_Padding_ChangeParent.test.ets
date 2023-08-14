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

export default function column_Padding_ChangeParent() {
  
  describe('Column_Padding_ChangeParentTest', function () {
    beforeEach(async function (done) {
      console.info("Column_Padding_ChangeParent beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Column/ParentComponentChanged/Column_Padding_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_Padding_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_Padding_ChangeParent" == pages.name)) {
          console.info("get Column_Padding_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_Padding_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Padding_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Column_Padding_ChangeParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_PADDING_CHANGEPARENT_TEST_0100
     * @tc.name      testColumnPaddingChangeParentInRange
     * @tc.desc      The parent component is bound with the padding attributes. Other parameters are default,
     *               the remaining space of the parent component meets the layout of the child components
     */
    it('testColumnPaddingChangeParentInRange', 0, async function (done) {
      console.info('new testColumnPaddingChangeParentInRange START');
      globalThis.value.message.notify({name:'padding', value:20})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnPaddingChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('Padding_Test1');
      let locationText2 = CommonFunc.getComponentRect('Padding_Test2');
      let locationText3 = CommonFunc.getComponentRect('Padding_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnPaddingChange1');
      expect(Math.round((locationText1.left - locationColumn.left)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(locationText1.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText1.right));
      expect(Math.round(locationText2.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText2.right));
      expect(Math.round(locationText3.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText3.right));
      expect(Math.round((locationColumn.right - locationText1.right)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(locationText1.top - locationColumn.top)).assertEqual(vp2px(20));
      expect(Math.round(locationColumn.bottom - locationText3.bottom)).assertEqual(vp2px(20));
      expect(Math.round(locationText2.top - locationText1.bottom))
        .assertEqual(Math.round(locationText3.top - locationText2.bottom));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(vp2px(30));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testColumnPaddingChangeParentInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_PADDING_CHANGEPARENT_TEST_0200
     * @tc.name      testColumnPaddingChangeParentOutRange
     * @tc.desc      The parent component is bound with the padding attributes. Other parameters are default,
     *               the remaining space of the parent component does not meet the layout of the child components
     */
    it('testColumnPaddingChangeParentOutRange', 0, async function (done) {
      console.info('new testColumnPaddingChangeParentOutRange START');
      globalThis.value.message.notify({name:'padding', value:50})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnPaddingChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('Padding_Test1');
      let locationText2 = CommonFunc.getComponentRect('Padding_Test2');
      let locationText3 = CommonFunc.getComponentRect('Padding_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnPaddingChange1');
      expect(Math.round((locationText1.left - locationColumn.left)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(locationText1.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText1.right));
      expect(Math.round(locationText2.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText2.right));
      expect(Math.round(locationText3.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText3.right));
      expect(Math.round((locationColumn.right - locationText1.right)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(locationText1.top - locationColumn.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText3.bottom - locationColumn.bottom)).assertEqual(vp2px(10));
      expect(Math.round(locationText2.top - locationText1.bottom))
        .assertEqual(Math.round(locationText3.top - locationText2.bottom));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(vp2px(30));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testColumnPaddingChangeParentOutRange END');
      done();
    });
  })
}