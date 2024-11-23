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

export default function gestureGestureInterrupterTest() {

  describe('GestureGestureInterrupterTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GESTURE_GESTURE_INTERRUPTER_0100
     * @tc.name       : testGestureGestureInterrupter001
     * @tc.desc       : Test the functionality of gesture interrupter
     * @tc.size       : MediumTest
     * @tc.type       : Render
     * @tc.level      : Level1
     */
    it('testGestureGestureInterrupter001', 0, async (done: Function) => {
      let PAGE_TAG = 'GestureGestureInterrupterTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.clickComponent('button1')
      await Utils.clickComponent('button2')
      await Utils.clickComponent('button3')
      await Utils.clickComponent('button4')
      await Utils.clickComponent('button5')
      await Utils.sleep(600)
      expect(Utils.getComponentInfoByKey('button1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button3').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button4').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

  })
}