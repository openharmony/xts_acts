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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';
import nativeFunc from 'libnativefunc.so'

async function panGesture(id: string, x1: number, y1: number, x2: number, y2: number) {
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

export default function requirementPanGestureTest() {

  describe('RequirementPanGestureTest', () => {

    let PAGE_TAG = 'RequirementPanGestureTest';

    it('testRequirementPanGesture001', 0, async (done: Function) => {
      await Utils.pushPage(`requirement/${PAGE_TAG}`);
      await panGesture("swiper1", 20, 20, 10, 10)
      await panGesture("swiper2", 20, 20, 20, 10)
      await panGesture("swiper3", 20, 20, 30, 10)
      await panGesture("swiper4", 20, 20, 30, 20)
      await Utils.flingComponent("swiper5", true, true)
      await panGesture("swiper6", 20, 20, 30, 30)
      await panGesture("swiper7", 20, 20, 20, 30)
      await panGesture("swiper8", 20, 20, 10, 30)
      await panGesture("swiper9", 20, 20, 10, 20)
      await Utils.flingComponent("swiper10", true, false)
      expect(Utils.getComponentInfoByKey('swiper1').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper2').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper3').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper4').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper5').$attrs.backgroundColor).assertEqual('#00000000')
      expect(Utils.getComponentInfoByKey('swiper6').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper7').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper8').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper9').$attrs.backgroundColor).assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('swiper10').$attrs.backgroundColor).assertEqual('#00000000')
      done()
    })

  })
}
