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

export default function ListSwipeChildMinSizeTest() {

  describe('ListSwipeChildMinSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0100
     * @tc.name       : testListChildMainSize001
     * @tc.desc       : testing ListChildMainSize create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildMainSize001', 0, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize001()).assertEqual(1)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0200
     * @tc.name       : testListChildMainSize002
     * @tc.desc       : testing ListChildMainSize interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListChildMainSize002', 0, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0300
    * @tc.name       : testListChildMainSize003
    * @tc.desc       : testing ListChildMainSize interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
   */
    it('testListChildMainSize003', 0, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize003()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0400
    * @tc.name       : testListChildMainSize004
    * @tc.desc       : testing ListChildMainSize interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
   */
    it('testListChildMainSize004', 0, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0500
     * @tc.name       : testListChildMainSize005
     * @tc.desc       : testing ListChildMainSize interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListChildMainSize005', 0, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0600
     * @tc.name       : testListChildMainSize006
     * @tc.desc       : testing ListChildMainSize interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListChildMainSize006', 0, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize006()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0700
    * @tc.name       : testListSwipeOption007
    * @tc.desc       : testing ListSwipeAction interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
   */
    it('testListSwipeOption007', 0, async (done: Function) => {
      expect(nativeFunc.testListSwipeOption007()).assertEqual(0)
      done()
    })

    /*
   * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0800
   * @tc.name       : testListSwipeOption008
   * @tc.desc       : testing ListSwipeAction interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
  */
    it('testListSwipeOption008', 0, async (done: Function) => {
      expect(nativeFunc.testListSwipeOption008()).assertEqual(0)
      done()
    })




  })
}
