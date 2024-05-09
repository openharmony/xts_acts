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

export default function textDecorationTest() {

  describe('TextDecorationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0100
     * @tc.name       : testTextDecoration001
     * @tc.desc       : testing decoration for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration001', 0, async (done: Function) => {
      expect(nativeFunc.testTextDecoration001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0200
     * @tc.name       : testTextDecoration002
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration002', 0, async (done: Function) => {
      expect(nativeFunc.testTextDecoration002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0300
     * @tc.name       : testTextDecoration003
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration003', 0, async (done: Function) => {
      expect(nativeFunc.testTextDecoration003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0400
     * @tc.name       : testTextDecoration004
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration004', 0, async (done: Function) => {
      expect(nativeFunc.testTextDecoration004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0500
     * @tc.name       : testTextDecoration005
     * @tc.desc       : testing decoration for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextDecoration005', 0, async (done: Function) => {
      expect(nativeFunc.testTextDecoration005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0600
     * @tc.name       : testTextDecoration006
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration006', 0, async (done: Function) => {
      expect(nativeFunc.testTextDecoration006()).assertEqual(0)
      done()
    })
  })
}
