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
import hilog from '@ohos.hilog';
import testNapi from 'liblevel.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';

const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreLevelTest() {
  describe('RdbNdkStoreLevelTest', function () {
    beforeAll(function () {})
    beforeEach(function () {})
    afterEach(function () {})
    afterAll(function () {})

    /**
     * @tc.name: SUB_DDM_RDB_LEVEL_0100
     * @tc.desc: Normal testCase of NDK SecurityLevel is S1
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_LEVEL_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0100' , ' begin');
      let re = testNapi.SUB_DDM_RDB_LEVEL_0100();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.name: SUB_DDM_RDB_LEVEL_0200
     * @tc.desc: Normal testCase of NDK SecurityLevel is S2
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_LEVEL_0200',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0200' , ' begin');
      let re = testNapi.SUB_DDM_RDB_LEVEL_0200();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.name: SUB_DDM_RDB_LEVEL_0300
     * @tc.desc: Normal testCase of NDK SecurityLevel is S3
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_LEVEL_0300',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0300' , ' begin');
      let re = testNapi.SUB_DDM_RDB_LEVEL_0300();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.name: SUB_DDM_RDB_LEVEL_0400
     * @tc.desc: Normal testCase of NDK SecurityLevel is S4
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_LEVEL_0400',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_LEVEL_0400' , ' begin');
      let re = testNapi.SUB_DDM_RDB_LEVEL_0400();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })



  })
}