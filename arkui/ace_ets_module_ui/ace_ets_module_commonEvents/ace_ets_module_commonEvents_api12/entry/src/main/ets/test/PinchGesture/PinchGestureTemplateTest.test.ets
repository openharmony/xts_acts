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
import {PointerMatrix, UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function PinchGestureTemplateTest() {
  describe('PinchGestureTemplateTest', function () {
    beforeEach(async function (done) {
      console.info("PinchGestureTemplateTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/PinchGesture/PinchGestureTemplate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PinchGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("PinchGestureTemplate" == pages.name)) {
          console.info("get PinchGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PinchGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PinchGestureTemplateTest page error:" + err);
      }
      console.info("PinchGestureTemplateTest beforeEach end");
      done();
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("PinchGestureTemplateTest after each called");
    });

    /**
     * @tc.number
     * @tc.name      PinchGestureTemplateTest_0010
     * @tc.desc      api test PinchGesture
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('PinchGestureTemplateTest_0010', 0, async function (done) {
      console.info('PinchGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PinchGestureTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PinchGestureTemplateTest_0010 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PinchGestureTemplateTest_0010 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('PinchGestureTemplateTest_0010 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('PinchGestureTemplateTest_0010 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('PinchGestureTemplateTest_0010 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left + areaWidth1 * 0.1),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.left + areaWidth1 * 0.3),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      pointers.setPoint(1,0,{x: Math.round(areaObj1.right - areaWidth1 * 0.1),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      pointers.setPoint(1,1,{x: Math.round(areaObj1.right - areaWidth1 * 0.3),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);

      let button = await driver.findComponent(ON.id('PinchGestureTemplate_template'));
      await button.click();
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('PinchGestureTemplate_Text');
      let obj1 = JSON.parse(text1);
      console.log('PanGestureExampleTemplateTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('templateFlag:true');

      console.info('PinchGestureTemplateTest_0010 END');
      done();
    });
  })
}
