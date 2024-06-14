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

export default function testArkUI() {

  describe('testArkUI', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0100
     * @tc.name       : testArkUI001
     * @tc.desc       : testing OH_NativeXComponent_SetNeedSoftKeyboard
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI001', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_testArkUI_0200
     * @tc.name       : testArkUI002
     * @tc.desc       : testing OH_NativeXComponent_RegisterSurfaceShowCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI002', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0300
     * @tc.name       : testArkUI003
     * @tc.desc       : testing OH_NativeXComponent_RegisterSurfaceHideCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI003', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0400
     * @tc.name       : testArkUI004
     * @tc.desc       : testing OH_NativeXComponent_RegisterOnTouchInterceptCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI004', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0500
     * @tc.name       : testArkUI005
     * @tc.desc       : testing OH_NativeXComponent_GetTouchEventSourceType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI005', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.name       : testArkUI006
     * @tc.desc       : testing OH_ArkUI_LayoutConstraint_Copy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI006', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.name       : testArkUI007
     * @tc.desc       : testing OH_ArkUI_LayoutConstraint_Create OH_ArkUI_LayoutConstraint_Dispose OH_ArkUI_LayoutConstraint_Copy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI007', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI007()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.name       : testArkUI008
     * @tc.desc       : testing OH_ArkUI_LayoutConstraint_Create OH_ArkUI_LayoutConstraint_Copy OH_ArkUI_LayoutConstraint_Dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI008', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI008()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.name       : testArkUI009
     * @tc.desc       : testing OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI009', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI009()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.name       : testArkUI010
     * @tc.desc       : testing OH_ArkUI_NodeCustomEvent_GetPositionInLayout
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI010', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI010()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.name       : testArkUI011
     * @tc.desc       : testing OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testArkUI011', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI011()).assertEqual(0)
      done()
    })
    /*
      * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
      * @tc.name       : testArkUI011
      * @tc.desc       : testing OH_ArkUI_GuidelineOption_Create OH_ArkUI_GuidelineOption_SetId OH_ArkUI_GuidelineOption_GetId
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testArkUI012', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI012()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
    * @tc.name       : testArkUI011
    * @tc.desc       : testing OH_ArkUI_GuidelineOption_SetDirection OH_ArkUI_GuidelineOption_GetDirection
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testArkUI013', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI013()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
      * @tc.name       : testArkUI011
      * @tc.desc       : testing OH_ArkUI_GuidelineOption_SetPositionStart OH_ArkUI_GuidelineOption_GetPositionStart
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testArkUI014', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI014()).assertEqual(0)
      done()
    })
    /*
      * @tc.number     : SUB_ARKUI_CAPI_TESTARKUI_0600
      * @tc.name       : testArkUI011
      * @tc.desc       : testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testArkUI015', 0, async (done: Function) => {
      expect(nativeFunc.testArkUI015()).assertEqual(0)
      done()
    })
  })
}
