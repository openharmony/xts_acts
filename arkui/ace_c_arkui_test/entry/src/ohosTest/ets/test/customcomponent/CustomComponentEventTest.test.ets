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

export default function customComponentEventTest() {

  describe('CustomComponentEventTest', () => {

    let PAGE_TAG = 'CustomComponentEventTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_EVENT_001
    * @tc.name       : testCustomComponentEvent001
    * @tc.desc       : test custom event callback
    * @tc.size       : MediumTest
    
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentEvent001', 0, async (done: Function) => {
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('EnabledTestCustomComponent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_EVENT_002
    * @tc.name       : testCustomComponentEvent002
    * @tc.desc       : test custom event nullptr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentEvent002', 0, async (done: Function) => {
        expect(nativeFunc.customComponentEventNullTest001()).assertEqual(0)
        done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_EVENT_003
    * @tc.name       : testCustomComponentEvent003
    * @tc.desc       : test custom event nullptr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentEvent003', 0, async (done: Function) => {
        expect(nativeFunc.customComponentEventNullTest002()).assertEqual(0)
        done();
    })
  })
}
