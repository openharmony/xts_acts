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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollScrollToTest() {

  describe('ScrollScrollToTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0100
     * @tc.name       : testScrollScrollTo001
     * @tc.desc       : testing scroll to for scroll with linear value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0200
     * @tc.name       : testScrollScrollTo002
     * @tc.desc       : testing scroll to for scroll with ease value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0300
     * @tc.name       : testScrollScrollTo003
     * @tc.desc       : testing scroll to for scroll with ease in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0400
     * @tc.name       : testScrollScrollTo004
     * @tc.desc       : testing scroll to for scroll with ease out value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0500
     * @tc.name       : testScrollScrollTo005
     * @tc.desc       : testing scroll to for scroll with ease in out value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo005', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0600
     * @tc.name       : testScrollScrollTo006
     * @tc.desc       : testing scroll to for scroll with fast out slow in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo006', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo006()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0700
     * @tc.name       : testScrollScrollTo007
     * @tc.desc       : testing scroll to for scroll with linear out slow in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo007', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo007()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0800
     * @tc.name       : testScrollScrollTo008
     * @tc.desc       : testing scroll to for scroll with fast out linear in value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo008', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo008()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_0900
     * @tc.name       : testScrollScrollTo009
     * @tc.desc       : testing scroll to for scroll with extreme deceleration value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo009', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo009()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1000
     * @tc.name       : testScrollScrollTo010
     * @tc.desc       : testing scroll to for scroll with sharp value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo010', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo010()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1100
     * @tc.name       : testScrollScrollTo011
     * @tc.desc       : testing scroll to for scroll with rhythm value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo011', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo011()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1200
     * @tc.name       : testScrollScrollTo012
     * @tc.desc       : testing scroll to for scroll with smooth value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo012', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo012()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SCROLLTO_1300
     * @tc.name       : testScrollScrollTo013
     * @tc.desc       : testing scroll to for scroll with friction value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollScrollTo013', 0, async (done: Function) => {
      expect(nativeFunc.testScrollScrollTo013()).assertEqual(0)
      done();
    });
  })
}
