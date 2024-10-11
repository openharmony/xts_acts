/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import testndk from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

let TAG = '[testLog-ets]';
export default function rdbConfigV2NdkTest() {
  describe('rdbConfigV2NdkTest', async (done: Function) => {

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0100
     * @tc.name OH_Rdb_CreateConfig_0100
     * @tc.desc OH_Rdb_CreateConfig_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_CreateConfig_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_CreateConfig_0100();
      console.info(TAG + "OH_Rdb_CreateConfig_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0200
     * @tc.name OH_Rdb_CreateConfig_0200
     * @tc.desc OH_Rdb_CreateConfig_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_CreateConfig_0200', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_CreateConfig_0200();
      console.info(TAG + "OH_Rdb_CreateConfig_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0300
     * @tc.name OH_Rdb_SetDbType_0100
     * @tc.desc OH_Rdb_SetDbType_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_0100();
      console.info(TAG + "OH_Rdb_SetDbType_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0400
     * @tc.name OH_Rdb_SetDbType_0300
     * @tc.desc OH_Rdb_SetDbType_0300
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_0300', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_0300();
      console.info(TAG + "OH_Rdb_SetDbType_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0500
     * @tc.name OH_Rdb_GetSupportedDbType_0100
     * @tc.desc OH_Rdb_GetSupportedDbType_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_GetSupportedDbType_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_GetSupportedDbType_0100();
      console.info(TAG + "OH_Rdb_GetSupportedDbType_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0600
     * @tc.name OH_Rdb_SetDbType_SQLITE_0100
     * @tc.desc OH_Rdb_SetDbType_SQLITE_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_SQLITE_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_0100();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0700
     * @tc.name OH_Rdb_SetDbType_SQLITE_0200
     * @tc.desc OH_Rdb_SetDbType_SQLITE_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_SQLITE_0200', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_0200();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0800
     * @tc.name OH_Rdb_SetDbType_SQLITE_0300
     * @tc.desc OH_Rdb_SetDbType_SQLITE_0300
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_SQLITE_0300', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_0300();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_0900
     * @tc.name OH_Rdb_SetDbType_SQLITE_Trxid_0100
     * @tc.desc OH_Rdb_SetDbType_SQLITE_Trxid_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_SQLITE_Trxid_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_Trxid_0100();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_Trxid_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1000
     * @tc.name OH_Rdb_SetDbType_SQLITE_Trxid_0200
     * @tc.desc OH_Rdb_SetDbType_SQLITE_Trxid_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDbType_SQLITE_Trxid_0200', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_Trxid_0200();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_Trxid_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}