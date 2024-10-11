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
export default function rdbSqliteNdkTest() {
  describe('rdbSqliteNdkTest', async (done: Function) => {

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

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1100
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0100
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0100();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1200
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0200
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0200', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0200();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1300
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0300
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0300
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0300', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0300();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1400
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0400
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0400
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0400', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0400();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1500
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0500
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0500
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0500', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0500();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1600
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0600
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0600
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0600', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0600();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1700
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0700
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0700
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0700', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0700();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1800
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0800
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0800
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0800', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0800();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_1900
     * @tc.name OH_Rdb_SetDatabaseDir_Param_0900
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_0900
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_0900', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0900();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2000
     * @tc.name OH_Rdb_SetDatabaseDir_Param_1000
     * @tc.desc OH_Rdb_SetDatabaseDir_Param_1000
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetDatabaseDir_Param_1000', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_1000();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2100
     * @tc.name OH_Rdb_SetStoreName_Param_0100
     * @tc.desc OH_Rdb_SetStoreName_Param_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0100();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2200
     * @tc.name OH_Rdb_SetStoreName_Param_0200
     * @tc.desc OH_Rdb_SetStoreName_Param_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0200', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0200();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2300
     * @tc.name OH_Rdb_SetStoreName_Param_0300
     * @tc.desc OH_Rdb_SetStoreName_Param_0300
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0300', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0300();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2400
     * @tc.name OH_Rdb_SetStoreName_Param_0400
     * @tc.desc OH_Rdb_SetStoreName_Param_0400
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0400', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0400();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2500
     * @tc.name OH_Rdb_SetStoreName_Param_0500
     * @tc.desc OH_Rdb_SetStoreName_Param_0500
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0500', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0500();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2600
     * @tc.name OH_Rdb_SetStoreName_Param_0600
     * @tc.desc OH_Rdb_SetStoreName_Param_0600
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0600', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0600();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2700
     * @tc.name OH_Rdb_SetStoreName_Param_0700
     * @tc.desc OH_Rdb_SetStoreName_Param_0700
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0700', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0700();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2800
     * @tc.name OH_Rdb_SetStoreName_Param_0800
     * @tc.desc OH_Rdb_SetStoreName_Param_0800
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0800', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0800();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_2900
     * @tc.name OH_Rdb_SetStoreName_Param_0900
     * @tc.desc OH_Rdb_SetStoreName_Param_0900
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_0900', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0900();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3000
     * @tc.name OH_Rdb_SetStoreName_Param_1000
     * @tc.desc OH_Rdb_SetStoreName_Param_1000
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetStoreName_Param_1000', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_1000();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3100
     * @tc.name OH_Rdb_SetBundleName_0100
     * @tc.desc OH_Rdb_SetBundleName_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0100', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0100();
      console.info(TAG + "OH_Rdb_SetBundleName_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3200
     * @tc.name OH_Rdb_SetBundleName_0200
     * @tc.desc OH_Rdb_SetBundleName_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0200', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0200();
      console.info(TAG + "OH_Rdb_SetBundleName_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3300
     * @tc.name OH_Rdb_SetBundleName_0300
     * @tc.desc OH_Rdb_SetBundleName_0300
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0300', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0300();
      console.info(TAG + "OH_Rdb_SetBundleName_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3400
     * @tc.name OH_Rdb_SetBundleName_0400
     * @tc.desc OH_Rdb_SetBundleName_0400
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0400', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0400();
      console.info(TAG + "OH_Rdb_SetBundleName_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3500
     * @tc.name OH_Rdb_SetBundleName_0500
     * @tc.desc OH_Rdb_SetBundleName_0500
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0500', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0500();
      console.info(TAG + "OH_Rdb_SetBundleName_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3600
     * @tc.name OH_Rdb_SetBundleName_0600
     * @tc.desc OH_Rdb_SetBundleName_0600
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0600', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0600();
      console.info(TAG + "OH_Rdb_SetBundleName_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3700
     * @tc.name OH_Rdb_SetBundleName_0700
     * @tc.desc OH_Rdb_SetBundleName_0700
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0700', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0700();
      console.info(TAG + "OH_Rdb_SetBundleName_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3800
     * @tc.name OH_Rdb_SetBundleName_0800
     * @tc.desc OH_Rdb_SetBundleName_0800
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0800', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0800();
      console.info(TAG + "OH_Rdb_SetBundleName_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_3900
     * @tc.name OH_Rdb_SetBundleName_0900
     * @tc.desc OH_Rdb_SetBundleName_0900
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_0900', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0900();
      console.info(TAG + "OH_Rdb_SetBundleName_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_Sqlite_4000
     * @tc.name OH_Rdb_SetBundleName_1000
     * @tc.desc OH_Rdb_SetBundleName_1000
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetBundleName_1000', 0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_1000();
      console.info(TAG + "OH_Rdb_SetBundleName_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}