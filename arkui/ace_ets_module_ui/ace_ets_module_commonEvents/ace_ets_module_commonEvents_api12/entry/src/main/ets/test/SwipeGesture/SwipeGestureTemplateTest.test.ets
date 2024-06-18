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

export default function SwipeGestureTemplateTest() {
  describe('SwipeGestureTemplateTest', function () {
    beforeEach(async function (done) {
      console.info("SwipeGestureTemplateTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/SwipeGesture/SwipeGestureTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwipeGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("SwipeGestureTemplate" == pages.name)) {
          console.info("get SwipeGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SwipeGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGestureTemplateTest page error:" + err);
      }
      console.info("SwipeGestureTemplateTest beforeEach end");
      done();
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("SwipeGestureTemplateTest after each called");
    });

    /**
     * @tc.number
    * @tc.name      SwipeGestureTemplateTest_0010
     * @tc.desc      api test TapGesture
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('SwipeGestureTemplateTest_0010', 0, async function (done) {
      console.info('SwipeGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGestureTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGestureTemplateTest_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('SwipeGestureTemplateTest_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2))
      console.log('SwipeGestureTemplateTest_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))

      let timeSpace:number = 3000
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2),38000)
      await CommonFunc.sleep(timeSpace);
      let text1 = getInspectorByKey('SwipeGestureTemplate_Text');
      let obj1 = JSON.parse(text1);
      let time1:number = Number(obj1.$attrs.content)
      console.log('SwipeGestureTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,time1)

      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2),38000)
      await CommonFunc.sleep(3000);
      let text2 = getInspectorByKey('SwipeGestureTemplate_Text');
      let obj2 = JSON.parse(text2);
      let time2:number = Number(obj2.$attrs.content)
      console.log('SwipeGestureTemplateTest_0010 obj2 $attrs content',obj2.$attrs.content,time2)
      let flag:number = time2 - time1 - timeSpace
      console.log('SwipeGestureTemplateTest_0010 flag',flag)
      expect( flag <= 16).assertTrue();

      console.info('SwipeGestureTemplateTest_0010 END');
      done();
    });
  })
}
