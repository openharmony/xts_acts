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

export default function spanDecorationTest() {

  describe('SpanDecorationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_DECORATION_0100
     * @tc.name       : testSpanDecoration001
     * @tc.desc       : testing decoration for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanDecoration001', 0, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_DECORATION_0200
     * @tc.name       : testSpanDecoration002
     * @tc.desc       : testing decoration for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanDecoration002', 0, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_DECORATION_0300
     * @tc.name       : testSpanDecoration003
     * @tc.desc       : testing decoration for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanDecoration003', 0, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_DECORATION_0400
     * @tc.name       : testSpanDecoration004
     * @tc.desc       : testing decoration for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanDecoration004', 0, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_DECORATION_0500
     * @tc.name       : testSpanDecoration005
     * @tc.desc       : testing decoration for span with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSpanDecoration005', 0, async (done: Function) => {
      expect(nativeFunc.testSpanDecoration005()).assertEqual(0)
      done()
    })

  })
}
