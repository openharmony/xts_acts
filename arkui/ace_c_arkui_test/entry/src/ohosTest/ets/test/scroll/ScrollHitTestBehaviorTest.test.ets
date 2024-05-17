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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function scrollHitTestBehaviorTest() {

  describe('ScrollHitTestBehaviorTest', () => {

    let PAGE_TAG = 'ScrollHitTestBehaviorTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_HITTESTBEHAVIOR_0100
    * @tc.name       : testScrollHitTestBehavior001
    * @tc.desc       : test image hitTestBehavior with event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollHitTestBehavior001', 0, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackDefault')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollDefault').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackBlock')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBlock').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBrotherBlock').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackTransparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollTransparent').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBrotherTransparent').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackNone')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollNone').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')

      await Utils.clickComponent('OnTouchTestStackExceptBelow')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBrotherExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackExceptAbove')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestScrollBrotherExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      done()
    })

  })
}