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
  fileio, FILE_CONTENT, prepareFile, nextFileName,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioFdatasync() {
describe('fileio_fdatasync', async function () {

  /**
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0000
   * @tc.name fileio_test_fdatasync_async_000
   * @tc.desc Test fdatasync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fdatasync_async_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdatasync_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio.fdatasync(fd, function (err) {
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      });
    } catch (e) {
      console.log('fileio_test_fdatasync_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0010
   * @tc.name fileio_test_fdatasync_async_001
   * @tc.desc Test fdatasync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fdatasync_async_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdatasync_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio
        .fdatasync(fd)
        .then(function (err) {
          expect(fileio.closeSync(fd) == null).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
        })
        .catch(function (err) {
          expect(null).assertFail();
        });
    } catch (e) {
      console.log('fileio_test_fdatasync_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0020
   * @tc.name fileio_test_fdatasync_async_002
   * @tc.desc Test fdatasync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_fdatasync_async_002', Level.LEVEL0, async function (done) {
    try {
      let fd = -1;
      await fileio.fdatasync(fd);
      expect(null).assertFail();
      done()
    } catch (e) {
      console.info('fileio_test_fdatasync_async_002 has failed for ' + e);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0000
   * @tc.name fileio_test_fdatasync_sync_000
   * @tc.desc Test fdatasyncSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fdatasync_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdatasync_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      expect(fileio.fdatasyncSync(fd) == null).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_fdatasync_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });
  
  /**
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0010
   * @tc.name fileio_test_fdatasync_sync_001
   * @tc.desc Test fdatasyncSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fdatasync_sync_001', Level.LEVEL0, async function () {
    try {
      fileio.fdatasyncSync(-1);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_fdatasync_sync_001 has failed for ' + e);
    }
  });
});
}
