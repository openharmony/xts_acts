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
import byTrace from '@ohos.bytrace'
import hiAppEvent from '@ohos.hiAppEvent'
import hiDebug from '@ohos.hidebug'
import hiLog from '@ohos.hilog'

export default function byTraceHiDebugJsunit() {
  describe('byTraceHiDebugTest', function () {
    console.log("************* byTraceHiDebug Test start*************");

    /*
     * @tc.number    : DFX_ByTrace_ByTrace_startTrace_0100
     * @tc.name      : startTrace
     * @tc.desc      : Records a trace marking it as the start of a task, can with the expected completion time between
                       startTrace and finishTrace.
     */
    it('DFX_ByTrace_ByTrace_startTrace_0100', 0, async function (done) {
      console.log("************* DFX_ByTrace_ByTrace_startTrace_0100 Test start*************");
      try {
        byTrace.startTrace("test1", 1, 1000);
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_ByTrace_ByTrace_startTrace_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_ByTrace_ByTrace_startTrace_0200
     * @tc.name      : startTrace
     * @tc.desc      : Records a trace marking it as the start of a task, can with the expected completion time between
                       startTrace and finishTrace.
     */
    it('DFX_ByTrace_ByTrace_startTrace_0200', 0, async function (done) {
      console.log("************* DFX_ByTrace_ByTrace_startTrace_0200 Test start*************");
      try {
        byTrace.startTrace("test2", 2, 5000);
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_ByTrace_ByTrace_startTrace_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_ByTrace_ByTrace_startTrace_0300
     * @tc.name      : startTrace
     * @tc.desc      : Records a trace marking it as the start of a task, can with the expected completion time between
                       startTrace and finishTrace.
     */
    it('DFX_ByTrace_ByTrace_startTrace_0300', 0, async function (done) {
      console.log("************* DFX_ByTrace_ByTrace_startTrace_0300 Test start*************");
      try {
        byTrace.startTrace("test3", 3);
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_ByTrace_ByTrace_startTrace_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_ByTrace_ByTrace_traceByValue_0100
     * @tc.name      : traceByValue
     * @tc.desc      : Records a trace for generating a count, such as clock pulse and the number of layers.
     */
    it('DFX_ByTrace_ByTrace_traceByValue_0100', 0, async function (done) {
      console.log("************* DFX_ByTrace_ByTrace_traceByValue_0100 Test start*************");
      try {
        byTrace.traceByValue("test1", 1);
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_ByTrace_ByTrace_traceByValue_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_ByTrace_ByTrace_traceByValue_0200
     * @tc.name      : traceByValue
     * @tc.desc      : Records a trace for generating a count, such as clock pulse and the number of layers.
     */
    it('DFX_ByTrace_ByTrace_traceByValue_0200', 0, async function (done) {
      console.log("************* DFX_ByTrace_ByTrace_traceByValue_0200 Test start*************");
      try {
        byTrace.traceByValue("test1", 1);
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_ByTrace_ByTrace_traceByValue_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiAppEvent_Event_DISTRIBUTED_SERVICE_START_0100
     * @tc.name      : DISTRIBUTED_SERVICE_START
     * @tc.desc      : distributed service event.
     */
    it('DFX_HiAppEvent_Event_DISTRIBUTED_SERVICE_START_0100', 0, async function (done) {
      console.log("************* DFX_HiAppEvent_Event_DISTRIBUTED_SERVICE_START_0100 Test start*************");
      try {
        expect('hiappevent.distributed_service_start').assertEqual(hiAppEvent.Event.DISTRIBUTED_SERVICE_START);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiAppEvent_Event_DISTRIBUTED_SERVICE_START_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_getNativeHeapSize_0100
     * @tc.name      : getNativeHeapSize
     * @tc.desc      : Get total native heap memory size
     */
    it('DFX_HiDebug_HiDebug_getNativeHeapSize_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_getNativeHeapSize_0100 Test start*************");
      try {
        let heapSize = hiDebug.getNativeHeapSize();
        expect(heapSize).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_getNativeHeapSize_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_getNativeHeapAllocatedSize_0100
     * @tc.name      : getNativeHeapAllocatedSize
     * @tc.desc      : Get Native heap memory allocation size.
     */
    it('DFX_HiDebug_HiDebug_getNativeHeapAllocatedSize_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_getNativeHeapAllocatedSize_0100 Test start*************");
      try {
        let heapAllocatedSize = hiDebug.getNativeHeapAllocatedSize();
        expect(heapAllocatedSize).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_getNativeHeapAllocatedSize_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_getNativeHeapFreeSize_0100
     * @tc.name      : getNativeHeapFreeSize
     * @tc.desc      : Get Native heap memory free size
     */
    it('DFX_HiDebug_HiDebug_getNativeHeapFreeSize_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_getNativeHeapFreeSize_0100 Test start*************");
      try {
        let heapFreeSize = hiDebug.getNativeHeapFreeSize();
        expect(heapFreeSize).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_getNativeHeapFreeSize_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_getPss_0100
     * @tc.name      : getPss
     * @tc.desc      : Get application process proportional set size memory information
     */
    it('DFX_HiDebug_HiDebug_getPss_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_getPss_0100 Test start*************");
      try {
        let pss = hiDebug.getPss();
        expect(pss).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_getPss_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_getSharedDirty_0100
     * @tc.name      : getSharedDirty
     * @tc.desc      : Obtains the size of the shared dirty memory of a process.
     */
    it('DFX_HiDebug_HiDebug_getSharedDirty_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_getSharedDirty_0100 Test start*************");
      try {
        let dirty = hiDebug.getSharedDirty();
        expect(dirty).assertEqual(undefined);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_getSharedDirty_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_startProfiling_0100
     * @tc.name      : startProfiling
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_HiDebug_HiDebug_startProfiling_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_startProfiling_0100 Test start*************");
      try {
        hiDebug.startProfiling('/data/accounts/account_0/appdata/[package name]/files/cpuprofile_test.json');
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_startProfiling_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_stopProfiling_0100
     * @tc.name      : stopProfiling
     * @tc.desc      : Stop CPU Profiling.
     */
    it('DFX_HiDebug_HiDebug_stopProfiling_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_stopProfiling_0100 Test start*************");
      try {
        hiDebug.stopProfiling();
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_stopProfiling_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiDebug_HiDebug_dumpHeapData_0100
     * @tc.name      : dumpHeapData
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_HiDebug_HiDebug_dumpHeapData_0100', 0, async function (done) {
      console.log("************* DFX_HiDebug_HiDebug_dumpHeapData_0100 Test start*************");
      try {
        hiDebug.dumpHeapData();
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiDebug_HiDebug_dumpHeapData_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_HiLog_info_0100
     * @tc.name      : info
     * @tc.desc      : Outputs info-level logs.
     */
    it('DFX_HiLog_HiLog_info_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_HiLog_info_0100 Test start*************");
      try {
        hiLog.info(0xFFFF1, "HILOGTEST", "%{public}s", 'DFX_HiLog_HiLog_info_0100')
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_HiLog_info_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_HiLog_error_0100
     * @tc.name      : error
     * @tc.desc      : Outputs error-level logs.
     */
    it('DFX_HiLog_HiLog_error_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_HiLog_error_0100 Test start*************");
      try {
        hiLog.error(0xFFFF2, "HILOGTEST", "%{public}s", 'DFX_HiLog_HiLog_error_0100')
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_HiLog_error_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_HiLog_fatal_0100
     * @tc.name      : fatal
     * @tc.desc      : Outputs fatal-level logs.
     */
    it('DFX_HiLog_HiLog_fatal_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_HiLog_fatal_0100 Test start*************");
      try {
        hiLog.fatal(0xFFFF3, "HILOGTEST", "%{public}s", 'DFX_HiLog_HiLog_fatal_0100')
        expect(true).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_HiLog_fatal_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_HiLog_isLoggable_0100
     * @tc.name      : isLoggable
     * @tc.desc      : Checks whether logs of the specified tag, and level can be printed.
     */
    it('DFX_HiLog_HiLog_isLoggable_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_HiLog_isLoggable_0100 Test start*************");
      try {
        const res = hiLog.isLoggable(0xD000700, "HILOGTEST", 3)
        expect(res).assertEqual(true);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_HiLog_isLoggable_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_LogLevel_WARN_0100
     * @tc.name      : WARN
     * @tc.desc      : enum test
     */
    it('DFX_HiLog_LogLevel_WARN_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_LogLevel_WARN_0100 Test start*************");
      try {
        expect(5).assertEqual(hiLog.WARN);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_LogLevel_WARN_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_LogLevel_ERROR_0100
     * @tc.name      : ERROR
     * @tc.desc      : enum test
     */
    it('DFX_HiLog_LogLevel_ERROR_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_LogLevel_ERROR_0100 Test start*************");
      try {
        expect(6).assertEqual(hiLog.ERROR);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_LogLevel_ERROR_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : DFX_HiLog_LogLevel_FATAL_0100
     * @tc.name      : FATAL
     * @tc.desc      : enum test
     */
    it('DFX_HiLog_LogLevel_FATAL_0100', 0, async function (done) {
      console.log("************* DFX_HiLog_LogLevel_FATAL_0100 Test start*************");
      try {
        expect(7).assertEqual(hiLog.FATAL);
      } catch (error) {
        expect().assertFail();
      }
      console.log("************* DFX_HiLog_LogLevel_FATAL_0100 Test end*************");
      done();
    });

    console.log("************* byTraceHiDebug Test end*************");
  })
}
