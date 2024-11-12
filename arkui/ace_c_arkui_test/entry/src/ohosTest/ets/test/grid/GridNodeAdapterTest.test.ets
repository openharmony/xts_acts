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

export default function gridNodeAdapterTest() {

  describe('GridNodeAdapterTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_NODE_ADAPTER_0100
     * @tc.name       : testGridNodeAdapter001
     * @tc.desc       : testing NodeAdapter for grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridNodeAdapter001', 0, async (done: Function) => {
      expect(nativeFunc.testGridNodeAdapter001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_NODE_ADAPTER_0200
     * @tc.name       : testGridNodeAdapter002
     * @tc.desc       : testing NodeAdapter for grid with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridNodeAdapter002', 0, async (done: Function) => {
      expect(nativeFunc.testGridNodeAdapter002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_NODE_ADAPTER_0300
     * @tc.name       : testGridNodeAdapter003
     * @tc.desc       : testing NodeAdapter for grid with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGridNodeAdapter003', 0, async (done: Function) => {
      expect(nativeFunc.testGridNodeAdapter003()).assertEqual(0)
      done()
    })
  })
}
