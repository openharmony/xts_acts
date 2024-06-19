/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@system.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function LongPressGestureTemplateTest() {
  describe('LongPressGestureTemplateTest', function () {
    beforeEach(async function (done) {
      console.info("LongPressGestureTemplateTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/LongPressGesture/LongPressGestureTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("LongPressGestureTemplate" == pages.name)) {
          console.info("get LongPressGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LongPressGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LongPressGestureTemplateTest page error:" + err);
      }
      console.info("LongPressGestureTemplateTest beforeEach end");
      done();
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("LongPressGestureTemplateTest after each called");
    });

    /**
     * @tc.number
     * @tc.name      LongPressGestureTemplateTest_0010
     * @tc.desc      api test TapGesture
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('LongPressGestureTemplateTest_0010', 0, async function (done) {
      console.info('LongPressGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let FatherObj = CommonFunc.getComponentRectOnScreen('LongPressGestureTemplate_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('LongPressGestureTemplateTest_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('LongPressGestureTemplate_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('LongPressGestureTemplateTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('LongPressGestureTemplateTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      let timeSpace:number = 3000
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(timeSpace);
      let text1 = getInspectorByKey('LongPressGestureTemplate_Text');
      let obj1 = JSON.parse(text1);
      let time1:number = Number(obj1.$attrs.content)
      console.log('LongPressGestureTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,time1)

      await driver.longClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text2 = getInspectorByKey('LongPressGestureTemplate_Text');
      let obj2 = JSON.parse(text2);
      let time2:number = Number(obj2.$attrs.content)
      console.log('LongPressGestureTemplateTest_0010 obj2 $attrs content',obj2.$attrs.content,time2)
      let flag:number = time2 - time1 - timeSpace
      console.log('LongPressGestureTemplateTest_0010 flag',flag)
      expect( flag <= 16).assertTrue();

      console.info('LongPressGestureTemplateTest_0010 END');
      done();
    });
  })
}
