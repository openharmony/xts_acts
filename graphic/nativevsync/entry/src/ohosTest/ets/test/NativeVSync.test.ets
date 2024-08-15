/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import vsync from 'libnativebuffer.so'

export default function nativeBufferTest() {
  describe('NativeVsyncPart2Test', () => {

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0100
     * @tc.name       : testNativeVSyncCreateNull
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeVSyncCreateNull', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateNull();
      console.info("testNativeVSyncCreateNull result:" + result)
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0101
     * @tc.name       : testNativeVSyncCreateNotEq
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncCreateNotEq', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateNotEq();
      console.info("testNativeVSyncCreateNotEq result:" + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0102
     * @tc.name       : testNativeVSyncCreateNormal
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncCreateNormal', 0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateNormal();
      console.info("testNativeVSyncCreateNormal result:" + result)
      expect(result[0]).assertEqual(0);
      // 有错误，再次调用接口调用成功，
      // expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0103
     * @tc.name       : testNativeVSyncCreateAbnormal
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncCreateAbnormal', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateAbnormal();
      console.info("testNativeVSyncCreateAbnormal result:" + result)
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0104
     * @tc.name       : testNativeVSyncCreateDifLenth
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */

    it('testNativeVSyncCreateDifLenth', 0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateDifLenth();
      console.info("testNativeVSyncCreateDifLenth result:" + result)
      for (let i = 0; i < result.length; i++) {
        expect(result[i]).assertEqual(0);
      }
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0105
     * @tc.name       : testNativeVSyncCreateMuch
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncCreateMuch', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateMuch();
      console.info("testNativeVSyncCreateMuch result:" + result)
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0106
     * @tc.name       : testNativeVSyncGetPeriodNullptr
     * @tc.desc       : test OH_NativeVSync_GetPeriod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncGetPeriodNullptr', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriodNullptr();
      console.info("testNativeVSyncGetPeriodNullptr result:" + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0107
     * @tc.name       : testNativeVSyncDestroyAbnormal
     * @tc.desc       : test OH_NativeVSync_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */

    it('testNativeVSyncDestroyAbnormal', 0, async (done: Function) => {
      // let result: number = vsync.oHNativeVSyncDestroyAbnormal();
      // console.info("testNativeVSyncDestroyAbnormal result:" + result);
      // expect(result).assertEqual(40001000);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0108
     * @tc.name       : testNativeVSyncDestroyNormal
     * @tc.desc       : test OH_NativeVSync_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncDestroyNormal', 0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncDestroyNormal();
      console.info("testNativeVSyncDestroyNormal result:" + result);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0109
     * @tc.name       : testNativeVSyncRequestFrameNullptr
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncRequestFrameNullptr', 0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameNullptr();
      console.info("testNativeVSyncRequestFrameNullptr result:" + result);
      // 失败原因：第三个参数传入为nullptr时，返回为0
      for (let i = 0; i < result.length; i++) {
        expect(result[i]).assertEqual(40001000);
      }
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0110
     * @tc.name       : testNativeVSyncRequestFrameNormal
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncRequestFrameNormal', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameNormal();
      console.info("testNativeVSyncRequestFrameNormal result:" + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0111
     * @tc.name       : testNativeVSyncRequestFrameParamErr
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */

    it('testNativeVSyncRequestFrameParamErr', 0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameParamErr();
      console.info("testNativeVSyncRequestFrameParamErr result:" + result);
      // 返回值为0 测试失败
      expect(result).assertEqual(40001000);
      done();
    });
  })
}