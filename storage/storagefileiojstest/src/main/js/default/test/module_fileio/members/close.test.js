/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  fileio,
  describe, it, expect,
} from '../../Common';

describe('fileio_close', function () {

  /**
   * @tc.number SUB_DF_FILEIO_CLOSESYNC_0000
   * @tc.name fileio_test_close_sync_000
   * @tc.desc Test closeSync() interfaces
   * @tc.size MEDIUM(中型)
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_close_sync_000', 0, function () {
    try {
      fileio.closeSync();
      expect(null).assertFail();
    } catch (e) {
    }
  })

  /**
   * @tc.number SUB_DF_FILEIO_CLOSESYNC_0010
   * @tc.name fileio_test_close_sync_001
   * @tc.desc Test closeSync() interfaces
   * @tc.size MEDIUM(中型)
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_close_sync_001', 0, function () {
    try {
      fileio.closeSync(-1);
      expect(null).assertFail();
    } catch (e) {
    }
  })
})
