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

export default function column_WidthHeight_ChangeParent() {
  
  describe('Column_WidthHeight_ChangeParentTest', function () {
    beforeEach(async function (done) {
      console.info("Column_WidthHeight_ChangeParent beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Column/ParentComponentChanged/Column_WidthHeight_ChangeParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Column_WidthHeight_ChangeParent state pages:" + JSON.stringify(pages));
        if (!("Column_WidthHeight_ChangeParent" == pages.name)) {
          console.info("get Column_WidthHeight_ChangeParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Column_WidthHeight_ChangeParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_WidthHeight_ChangeParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Column_WidthHeight_ChangeParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_WIDTHHEIGHT_CHANGEPARENT_TEST_0100
     * @tc.name      testColumnWidthHeightChangeParentHeightInRange
     * @tc.desc      The parent component changes the width 350 and height 400 attributes, Other parameters default
     */
    it('testColumnWidthHeightChangeParentHeightInRange', 0, async function (done) {
      console.info('new testColumnWidthHeightChangeParentHeightInRange START');
      globalThis.value.message.notify({name:'height', value:400})
      globalThis.value.message.notify({name:'width', value:350})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnWidthHeightChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2 = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3 = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.round((locationText1.left - locationColumn.left)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(locationText1.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText1.right));
      expect(Math.round(locationText2.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText2.right));
      expect(Math.round(locationText3.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText3.right));
      expect(Math.round((locationColumn.right - locationText1.right)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
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
      console.info('new testColumnWidthHeightChangeParentHeightInRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_WIDTHHEIGHT_CHANGEPARENT_TEST_0200
     * @tc.name      testColumnWidthHeightChangeParentHeightOutRange
     * @tc.desc      The parent component changes the width 350 and height 300 attributes,Other parameters default
     */
    it('testColumnWidthHeightChangeParentHeightOutRange', 0, async function (done) {
      console.info('new testColumnWidthHeightChangeParentHeightOutRange START');
      globalThis.value.message.notify({name:'height', value:300})
      globalThis.value.message.notify({name:'width', value:350})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnWidthHeightChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2 = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3 = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.round((locationText1.left - locationColumn.left)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(Math.round(locationText1.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText1.right));
      expect(Math.round(locationText2.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText2.right));
      expect(Math.round(locationText3.left - locationColumn.left))
        .assertEqual(Math.round(locationColumn.right - locationText3.right));
      expect(Math.round((locationColumn.right - locationText1.right)*10)/10).assertEqual(Math.round(vp2px(25)*10)/10);
      expect(locationText1.top).assertEqual(locationColumn.top);
      expect(Math.round(locationText3.bottom - locationColumn.bottom)).assertEqual(vp2px(60));
      expect(Math.round(locationText2.top - locationText1.bottom))
        .assertEqual(Math.round(locationText3.top - locationText2.bottom));
      expect(Math.round(locationText2.top - locationText1.bottom)).assertEqual(vp2px(30));
      expect(Math.round(locationText1.right - locationText1.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText2.right - locationText2.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText3.right - locationText3.left)).assertEqual(vp2px(300));
      expect(Math.round(locationText1.bottom - locationText1.top)).assertEqual(vp2px(50));
      expect(Math.round(locationText2.bottom - locationText2.top)).assertEqual(vp2px(100));
      expect(Math.round(locationText3.bottom - locationText3.top)).assertEqual(vp2px(150));
      console.info('new testColumnWidthHeightChangeParentHeightOutRange END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_COLUMN_WIDTHHEIGHT_CHANGEPARENT_TEST_0300
     * @tc.name      testColumnWidthHeightChangeParentWidthOutRange
     * @tc.desc      The parent component changes the width 200 and height 400 attributes,Other parameters default
     */
    it('testColumnWidthHeightChangeParentWidthOutRange', 0, async function (done) {
      console.info('new testColumnWidthHeightChangeParentWidthOutRange START');
      globalThis.value.message.notify({name:'height', value:400})
      globalThis.value.message.notify({name:'width', value:200})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('ColumnWidthHeightChange1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Column');
      let locationText1 = CommonFunc.getComponentRect('WidthHeight_Test1');
      let locationText2 = CommonFunc.getComponentRect('WidthHeight_Test2');
      let locationText3 = CommonFunc.getComponentRect('WidthHeight_Test3');
      let locationColumn = CommonFunc.getComponentRect('ColumnWidthHeightChange1');
      expect(Math.round(locationColumn.left - locationText1.left)).assertEqual(vp2px(50));
      expect(Math.round(locationColumn.left - locationText1.left))
        .assertEqual(Math.round(locationText1.right - locationColumn.right));
      expect(Math.round(locationColumn.left - locationText2.left))
        .assertEqual(Math.round(locationText2.right - locationColumn.right));
      expect(Math.round(locationColumn.left - locationText3.left))
        .assertEqual(Math.round(locationText3.right - locationColumn.right));
      expect(Math.round(locationText1.right - locationColumn.right)).assertEqual(vp2px(50));
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
      console.info('new testColumnWidthHeightChangeParentWidthOutRange END');
      done();
    });
  })
}