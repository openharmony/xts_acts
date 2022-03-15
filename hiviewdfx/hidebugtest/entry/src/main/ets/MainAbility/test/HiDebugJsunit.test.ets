// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, it, expect} from "deccjsunit/index.ets";
import hiDebug from '@ohos.hidebug'

export default function hiDebugJsunit() {
  describe('hiDebugTest', function () {
    console.log("************* hiDebug Test start*************");
    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0001
     * @tc.name      : getNativeHeapSize
     * @tc.desc      : Get total native heap memory size
     */
    it('DFX_DFR_Hiprofiler_Interface_0001', 0, async function (done) {
      console.log("************* DFX_DFR_Hiprofiler_Interface_0001 Test start*************");
      try {
        let heapSize = hiDebug.getNativeHeapSize();
        expect(heapSize).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_DFR_Hiprofiler_Interface_0001 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0002
     * @tc.name      : getNativeHeapAllocatedSize
     * @tc.desc      : Get Native heap memory allocation size.
     */
    it('DFX_DFR_Hiprofiler_Interface_0002', 0, async function (done) {
      console.log("************* DFX_DFR_Hiprofiler_Interface_0002 Test start*************");
      try {
        let heapAllocatedSize = hiDebug.getNativeHeapAllocatedSize();
        expect(heapAllocatedSize).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_DFR_Hiprofiler_Interface_0002 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0003
     * @tc.name      : getNativeHeapFreeSize
     * @tc.desc      : Get Native heap memory free size
     */
    it('DFX_DFR_Hiprofiler_Interface_0003', 0, async function (done) {
      console.log("************* DFX_DFR_Hiprofiler_Interface_0003 Test start*************");
      try {
        let heapFreeSize = hiDebug.getNativeHeapFreeSize();
        expect(heapFreeSize).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_DFR_Hiprofiler_Interface_0003 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0004
     * @tc.name      : getPss
     * @tc.desc      : Get application process proportional set size memory information
     */
    it('DFX_DFR_Hiprofiler_Interface_0004', 0, async function (done) {
      console.log("************* DFX_DFR_Hiprofiler_Interface_0004 Test start*************");
      try {
        let pss = hiDebug.getPss();
        expect(pss).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_DFR_Hiprofiler_Interface_0004 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0005
     * @tc.name      : getSharedDirty
     * @tc.desc      : Obtains the size of the shared dirty memory of a process.
     */
    it('DFX_DFR_Hiprofiler_Interface_0005', 0, async function (done) {
      console.log("************* DFX_DFR_Hiprofiler_Interface_0005 Test start*************");
      try {
        let dirty = hiDebug.getSharedDirty();
        expect(dirty).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_DFR_Hiprofiler_Interface_0005 Test end*************");
      done();
    });

    console.log("************* hiDebug Test end*************");
  })
}
