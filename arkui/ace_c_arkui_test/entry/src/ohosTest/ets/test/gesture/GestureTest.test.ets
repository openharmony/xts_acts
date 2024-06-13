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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function gestureTest() {

  describe('GestureTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LONG_PRESS_GESTURE001
     * @tc.name       : testLongPressGesture001
     * @tc.desc       : testing long Press 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLongPressGesture001', 0, async (done: Function) => {
      let PAGE_TAG = 'LongPressGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let column = await driver.findComponent(ON.id('longPressID'));
      await column.longClick();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('longPressID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPE_GESTURE001
     * @tc.name       : testSwipeGesture001
     * @tc.desc       : testing swipe guesture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwipeGesture001', 0, async (done: Function) => {
      let PAGE_TAG = 'SwipeGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, done);
      let driver = Driver.create();
      let column = await driver.findComponent(ON.id('swipeID'));
      await driver.swipe(100,100,200,100,600);
      expect(Utils.getComponentInfoByKey('swipeID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PAN_GESTURE001
     * @tc.name       : testPanGesture001
     * @tc.desc       : testing pan guesture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPanGesture001', 0, async (done: Function) => {
      let PAGE_TAG = 'PanGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, done);
      let driver = Driver.create();
      await driver.swipe(100,100,100,200,600);
      expect(Utils.getComponentInfoByKey('panID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  /*
  * @tc.number     : SUB_ARKUI_CAPI_PINCH_001
  * @tc.name       : test pinch 001
  * @tc.desc       : test pinch
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
  it('testPinchGesture001', 0, async (done: Function) => {
    let PAGE_TAG = 'PinchGestureTest';
    await Utils.pushPage(`gesture/${PAGE_TAG}`, done);    
    let driver = await Driver.create()
    await Utils.sleep(1000)
    let column = await driver.findComponent(ON.id('pinchID'));
    await column.pinchOut(4.0);
    await Utils.sleep(1000)
    expect(Utils.getComponentInfoByKey('pinchID').$attrs.backgroundColor).assertEqual('#FF00FF00')
    done();
  })

  /*
  * @tc.number     : SUB_ARKUI_CAPI_ROTATE_001
  * @tc.name       : test rotate 001
  * @tc.desc       : test rotate
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
  it('testRotateGesture001', 0, async (done: Function) => {
    let PAGE_TAG = 'RotateGestureTest';
    await Utils.pushPage(`gesture/${PAGE_TAG}`, done);    
    let driver = await Driver.create()
    await Utils.sleep(1000)
    await driver.drag(100,100,200,200,600);
    expect(Utils.getComponentInfoByKey('rotateID').$attrs.backgroundColor).assertEqual('#FF00FF00')
    done();
  })

  /*
  * @tc.number     : SUB_ARKUI_CAPI_INTERRUPT_001
  * @tc.name       : test interrupt 001
  * @tc.desc       : test interrupt
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
  it('testInterruptGesture001', 0, async (done: Function) => {
      let PAGE_TAG = 'InterruptGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`, done);
      let driver = Driver.create();
      await driver.swipe(100,100,100,200,600);
      expect(Utils.getComponentInfoByKey('interruptID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
  })
  })
}
