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
import nativeFunc from 'libnativefunc.so'

export default function TestArkUIAddApi() {

  describe('TestArkUIAddApi', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NativeXComponent_0100
     * @tc.name       : TestArkUIAddApi001
     * @tc.desc       : testing OH_NativeXComponent_RegisterUIInputEventCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi001', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0200
     * @tc.name       : TestArkUIAddApi002
     * @tc.desc       : testing OH_ArkUI_UIInputEvent_GetType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi002', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0300
     * @tc.name       : TestArkUIAddApi003
     * @tc.desc       : testing OH_ArkUI_UIInputEvent_GetEventTime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi003', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0400
     * @tc.name       : TestArkUIAddApi004
     * @tc.desc       : testing OH_ArkUI_PointerEvent_GetX
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi004', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0500
     * @tc.name       : TestArkUIAddApi005
     * @tc.desc       : testing OH_ArkUI_PointerEvent_GetY
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi005', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0600
     * @tc.name       : TestArkUIAddApi006
     * @tc.desc       : testing OH_ArkUI_PointerEvent_GetWindowX
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi006', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0700
     * @tc.name       : TestArkUIAddApi007
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi007', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0800
     * @tc.name       : TestArkUIAddApi008
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi008', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0900
     * @tc.name       : TestArkUIAddApi009
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi009', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1000
     * @tc.name       : TestArkUIAddApi010
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi010', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1100
     * @tc.name       : TestArkUIAddApi011
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi011', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1200
     * @tc.name       : TestArkUIAddApi012
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi012', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_13000
     * @tc.name       : TestArkUIAddApi013
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi013', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1400
     * @tc.name       : TestArkUIAddApi014
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi014', 0, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi014()).assertEqual(0)
      done()
    })






  })
}
