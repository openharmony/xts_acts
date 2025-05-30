/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function swiperArrowStyleTest() {

  describe('swiperArrowStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0100
     * @tc.name       : testSwiperArrowStyle001
     * @tc.desc       : testing arrowStyle for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperArrowStyle001', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0200
     * @tc.name       : testSwiperArrowStyle002
     * @tc.desc       : testing arrowStyle for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperArrowStyle002', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0300
     * @tc.name       : testSwiperArrowStyle003
     * @tc.desc       : testing arrowStyle for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperArrowStyle003', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0400
     * @tc.name       : testSwiperArrowStyle004
     * @tc.desc       : testing arrowStyle for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperArrowStyle004', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0500
     * @tc.name       : testSwiperArrowStyle005
     * @tc.desc       : testing arrowStyle for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperArrowStyle005', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_ARROWSTYLE_0600
     * @tc.name       : testSwiperArrowStyle006
     * @tc.desc       : testing arrowStyle for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperArrowStyle006', Level.LEVEL0, async (done: Function) => {
      expect(nativeFunc.testSwiperArrowStyle006()).assertEqual(0)
      done()
    })

  })
}
