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
import testNapi from 'libcursor.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';

const TAG = "[RdbNdkStoreTest]";

export default function RdbNdkStoreCursorTest() {
  describe('RdbNdkStoreCursorTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {

    })
    beforeEach(function () {
      hilog.info(0x0000, TAG, 'testTag CursorSetUpTestCase' , ' begin');      
      let re = testNapi.CursorSetUpTestCase();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    afterEach(function () {
      hilog.info(0x0000, TAG, 'testTag CursorTearDownTestCase' , ' begin');      
      let re = testNapi.CursorTearDownTestCase();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    afterAll(function () {

    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0100
     * @tc.desc: Normal testCase of NDK cursor for GetColumnType.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0100' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0100();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0200
     * @tc.desc: Normal testCase of NDK cursor for GetColumnIndex.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0200',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0200' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0200();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0300
     * @tc.desc: Normal testCase of NDK cursor for GetColumnName.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0300',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0300' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0300();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0400
     * @tc.desc: Normal testCase of NDK cursor for Getxxx.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0400',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0400' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0400();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0500
     * @tc.desc: Normal testCase of NDK cursor for GetColumnIndex.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0500',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0500' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0500();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0600
     * @tc.desc: Normal testCase of NDK cursor for GetColumnIndex.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0600',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0600' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0600();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0700
     * @tc.desc: Normal testCase of NDK cursor for GetColumnType.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0700',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0700' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0700();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0800
     * @tc.desc: Normal testCase of NDK cursor for GetColumnName.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0800',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0800' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0800();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_0900
     * @tc.desc: Normal testCase of NDK cursor for getSize.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_0900',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_0900' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_0900();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1000
     * @tc.desc: Normal testCase of NDK cursor for getText.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1000',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1000' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1000();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1100
     * @tc.desc: Normal testCase of NDK cursor for getInt64.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1100',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1100' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1100();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1200
     * @tc.desc: Normal testCase of NDK cursor for getReal.
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1200',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1200' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1200();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1300
     * @tc.desc: getBlob
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1300',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1300' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1300();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1400
     * @tc.desc: isNull
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1400',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1400' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1400();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1500
     * @tc.desc: getRowCount
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1500',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1500' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1500();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1600
     * @tc.desc: getRowCount
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1600',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1600' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1600();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1700
     * @tc.desc: getRowCount
     * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1700',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1700' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1700();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })
    /**
     * @tc.name: SUB_DDM_RDB_CURSOR_1800
     * @tc.desc:
    * @tc.type: FUNC
     */
    it('SUB_DDM_RDB_CURSOR_1800',0, async function () {
      hilog.info(0x0000, TAG, 'testTag SUB_DDM_RDB_CURSOR_1800' , ' begin');
      let re = testNapi.SUB_DDM_RDB_CURSOR_1800();
      hilog.info(0x0000, TAG, 'testTag errorCode is : '+ re , 'aa');
      expect(re == 0).assertTrue();
    })

  })
}