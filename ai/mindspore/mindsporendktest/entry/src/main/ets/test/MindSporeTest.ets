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
import mindSpore from 'libmindsporendk.so'

enum OH_AI_DeviceType {
  OH_AI_DEVICETYPE_CPU = 0,
  OH_AI_DEVICETYPE_GPU,
  OH_AI_DEVICETYPE_KIRIN_NPU,
  // add new type here
  // ohos-only device range: [60, 80)
  OH_AI_DEVICETYPE_NNRT = 60,
  OH_AI_DEVICETYPE_INVALID = 100,
}

export default function mindSporeTest() {
  describe('MindSporeTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTCREATE_0100
     * @tc.name       : testMindSporeContextCreate001
     * @tc.desc       : test the normal condition of OH_AI_ContextCreate 
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextCreate001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextCreate001();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTDESTROY_0100
     * @tc.name       : testMindSporeContextDestroy001
     * @tc.desc       : test the normal condition of OH_AI_ContextDestroy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextDestroy001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextDestroy001();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0100
     * @tc.name       : testMindSporeContextSetThreadNum001
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadNum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadNum001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNum001(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0200
     * @tc.name       : testMindSporeContextSetThreadNum002
     * @tc.desc       : test the abnormal condition of OH_AI_ContextSetThreadNum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadNum002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNum002(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADNUM_0100
     * @tc.name       : testMindSporeContextGetThreadNum001
     * @tc.desc       : test the normal condition of OH_AI_ContextGetThreadNum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextGetThreadNum001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadNum001(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADNUM_0200
     * @tc.name       : testMindSporeContextGetThreadNum002
     * @tc.desc       : test the abnormal condition of OH_AI_ContextGetThreadNum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextGetThreadNum002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadNum002();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0100
     * @tc.name       : testMindSporeContextSetThreadAffinityMode001
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadAffinityMode001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityMode001(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0200
     * @tc.name       : testMindSporeContextSetThreadAffinityMode002
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadAffinityMode002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityMode002(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0300
     * @tc.name       : testMindSporeContextSetThreadAffinityMode003
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadAffinityMode003', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityMode003(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0400
     * @tc.name       : testMindSporeContextSetThreadAffinityMode004
     * @tc.desc       : test the abnormal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadAffinityMode004', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityMode004(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0500
     * @tc.name       : testMindSporeContextSetThreadAffinityMode005
     * @tc.desc       : test the abnormal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextSetThreadAffinityMode005', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityMode005(6);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYMODE_0100
     * @tc.name       : testMindSporeContextGetThreadAffinityMode001
     * @tc.desc       : test the normal condition of OH_AI_ContextGetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextGetThreadAffinityMode001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityMode001(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYMODE_0200
     * @tc.name       : testMindSporeContextGetThreadAffinityMode002
     * @tc.desc       : test the abnormal condition of OH_AI_ContextGetThreadAffinityMode
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextGetThreadAffinityMode002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityMode002();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOCREATE_0100
     * @tc.name       : testMindSporeDeviceInfoCreate001
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoCreate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeDeviceInfoCreate001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoCreate001(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0100
     * @tc.name       : testMindSporeDeviceInfoGetDeviceType001
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeDeviceInfoGetDeviceType001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceType001(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

  })
}
