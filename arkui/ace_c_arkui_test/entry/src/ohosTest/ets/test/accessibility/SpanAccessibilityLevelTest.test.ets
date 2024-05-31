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

export default function spanAccessibilityLevelTest() {

  describe('SpanAccessibilityLevelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_ACCESSIBILITYLEVEL_0100
     * @tc.name       : testSpanAccessibilityLevel001
     * @tc.desc       : testing accessibilityLevel for Span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanAccessibilityLevel001', 0, async (done: Function) => {
      expect(nativeFunc.testSpanAccessibilityLevel001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_ACCESSIBILITYLEVEL_0200
     * @tc.name       : testSpanAccessibilityLevel002
     * @tc.desc       : testing accessibilityLevel for Span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanAccessibilityLevel002', 0, async (done: Function) => {
      expect(nativeFunc.testSpanAccessibilityLevel002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_ACCESSIBILITYLEVEL_0300
     * @tc.name       : testSpanAccessibilityLevel003
     * @tc.desc       : testing accessibilityLevel for Span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanAccessibilityLevel003', 0, async (done: Function) => {
      expect(nativeFunc.testSpanAccessibilityLevel003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_ACCESSIBILITYLEVEL_0400
     * @tc.name       : testSpanAccessibilityLevel004
     * @tc.desc       : testing accessibilityLevel for Span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanAccessibilityLevel004', 0, async (done: Function) => {
      expect(nativeFunc.testSpanAccessibilityLevel004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_ACCESSIBILITYLEVEL_0500
     * @tc.name       : testSpanAccessibilityLevel005
     * @tc.desc       : testing accessibilityLevel for Span with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSpanAccessibilityLevel005', 0, async (done: Function) => {
      expect(nativeFunc.testSpanAccessibilityLevel005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_ACCESSIBILITYLEVEL_0600
     * @tc.name       : testSpanAccessibilityLevel006
     * @tc.desc       : testing accessibilityLevel for Span with alnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSpanAccessibilityLevel006', 0, async (done: Function) => {
      expect(nativeFunc.testSpanAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
