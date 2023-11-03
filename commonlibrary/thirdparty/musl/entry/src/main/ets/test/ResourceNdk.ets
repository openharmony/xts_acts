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
import resource from 'libresourcendk.so'


export default function muslResourceNdkTest() {
  describe('MuslResourceTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0100
     * @tc.name       : testMuslResourceGetPriority001
     * @tc.desc       : test getpriority
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority001', 0, async (done: Function) => {
      let data = resource.getPriority(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0200
     * @tc.name       : testMuslResourceGetPriority002
     * @tc.desc       : test getpriority
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority002', 0, async (done: Function) => {
      let data = resource.getPriority(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETPRIORITY_0300
     * @tc.name       : testMuslResourceGetPriority003
     * @tc.desc       : test getpriority
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetPriority003', 0, async (done: Function) => {
      let data = resource.getPriority(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT_0100
     * @tc.name       : testMuslResourceGetRLimit001
     * @tc.desc       : test getrlimit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRLimit001', 0, async (done: Function) => {
      let data = resource.getRLimit(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT_0200
     * @tc.name       : testMuslResourceGetRLimit002
     * @tc.desc       : test getrlimit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRLimit002', 0, async (done: Function) => {
      let data = resource.getRLimit(3);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRLIMIT_0300
     * @tc.name       : testMuslResourceGetRLimit003
     * @tc.desc       : test getrlimit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRLimit003', 0, async (done: Function) => {
      let data = resource.getRLimit(7);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRUSAGE_0100
     * @tc.name       : testMuslResourceGetRUsage001
     * @tc.desc       : test getrlimit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRUsage001', 0, async (done: Function) => {
      let data = resource.getRUsage(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRUSAGE_0200
     * @tc.name       : testMuslResourceGetRUsage002
     * @tc.desc       : test getrlimit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRUsage002', 0, async (done: Function) => {
      let data = resource.getRUsage(-1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOURCE_GETRUSAGE_0300
     * @tc.name       : testMuslResourceGetRUsage003
     * @tc.desc       : test getrlimit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslResourceGetRUsage003', 0, async (done: Function) => {
      let data = resource.getRUsage(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

  })
}
