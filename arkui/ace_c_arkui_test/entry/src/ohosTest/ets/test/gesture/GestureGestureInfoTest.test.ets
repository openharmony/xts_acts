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

import { describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'
import { Driver, ON, PointerMatrix } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';

async function pan(id: string, x1: number, y1: number, x2: number, y2: number) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  const p1: Point = {
    x: rect.left + x1,
    y: rect.top + y1
  };
  const p2: Point = {
    x: rect.left + x2,
    y: rect.top + y2
  };
  await driver.fling(p1, p2, 5, 200)
}

async function pinch(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 2);
  point.setPoint(0, 0, { x: rect.left + 50, y: rect.top + 50 });
  point.setPoint(0, 1, { x: rect.left + 20, y: rect.top + 20 });
  point.setPoint(1, 0, { x: rect.left + 60, y: rect.top + 60 });
  point.setPoint(1, 1, { x: rect.left + 90, y: rect.top + 90 });
  await driver.injectMultiPointerAction(point, 200);
}

async function rotation(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let point: PointerMatrix = PointerMatrix.create(2, 2);
  point.setPoint(0, 0, { x: rect.left + 50, y: rect.top + 50 });
  point.setPoint(0, 1, { x: rect.left + 50, y: rect.top + 20 });
  point.setPoint(1, 0, { x: rect.left + 60, y: rect.top + 60 });
  point.setPoint(1, 1, { x: rect.left + 60, y: rect.top + 90 });
  await driver.injectMultiPointerAction(point, 200);
}

export default function gestureGestureInfoTest() {

  describe('GestureGestureInfoTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INFO_0100
     * @tc.name       : testGestureGestureInfo001
     * @tc.desc       : Test retrieving and verifying gesture information for various gestures
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInfo001', 0, async (done: Function) => {
      let PAGE_TAG = 'GestureGestureInfoTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.longClickComponent('button1')
      await pan('column2', 40, 40, 80, 40)
      await pan('column3', 40, 40, 80, 40)
      await rotation('column4')
      await pinch('column5')
      let dataArray: number[][] = nativeRender.getGestureData();
      let longPressGesture: number[] = dataArray[0];
      let panGesture: number[] = dataArray[1];
      let swipeGesture: number[] = dataArray[2];
      let rotationGesture: number[] = dataArray[3];
      let pinchGesture: number[] = dataArray[4];
      console.log('testGestureGestureInfo001', JSON.stringify(dataArray))
      expect(longPressGesture[0] == 0 && longPressGesture[1] == 1 && longPressGesture[2] == 1).assertEqual(true)
      expect(panGesture[0] >= 170 && panGesture[0] <= 230 && panGesture[1] >= 170 && panGesture[1] <= 230 &&
        panGesture[2] >= -1 && panGesture[2] <= 1 && panGesture[3] >= 8 && panGesture[3] <= 16 && panGesture[4] == 0).assertEqual(true)
      expect(swipeGesture[0] == 0 && swipeGesture[1] >= 177 && swipeGesture[1] <= 183).assertEqual(true)
      expect(rotationGesture[0] >= 30 && rotationGesture[0] <= 31).assertEqual(true)
      expect(pinchGesture[0] == 4 && pinchGesture[1] == 55 && pinchGesture[2] == 55).assertEqual(true)
      done();
    })

  })
}