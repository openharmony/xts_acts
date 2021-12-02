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

import { fileio, nextFileName, describe, it, expect } from '../../Common';

describe('fileio_mkdir_rmdir', function () {

  /**
   * @tc.number SUB_DF_FileIO_MkdirSync_0000
   * @tc.name fileio_mkdir_sync_rmdir_sync_000
   * @tc.desc Test mkdirSync() and rmdirSync() interfaces.
   */
  it('fileio_mkdir_sync_rmdir_sync_000', 0, function () {
    let dpath = nextFileName('fileio_mkdir_sync_rmdir_sync_000') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_mkdir_sync_rmdir_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirSync_0010
   * @tc.name fileio_mkdir_sync_rmdir_sync_001
   * @tc.desc Test mkdirSync() interfaces.
   */
  it('fileio_mkdir_sync_rmdir_sync_001', 0, function () {
    try {
      expect(fileio.mkdirSync('/') == null).assertTrue();
      expect(null).assertFail();
    } catch (e) {
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirSync_0020
   * @tc.name fileio_mkdir_sync_rmdir_sync_002
   * @tc.desc Test mkdirSync() interfaces.
   */
  it('fileio_mkdir_sync_rmdir_sync_002', 0, function () {
    try {
      expect(fileio.mkdirSync(12) == null).assertTrue();
      expect(null).assertFail();
    } catch (e) {
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirAsync_0000
   * @tc.name fileio_mkdir_async_rmdir_sync_000
   * @tc.desc Test mkdirAsync() and rmdirSync() interfaces.
   */
  it('fileio_mkdir_async_rmdir_sync_000', 0, async function (done) {
    let dpath = nextFileName('fileio_mkdir_async_rmdir_sync_000') + 'd';

    try {
      expect(await fileio.mkdir(dpath) == null).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirAsync_0010
   * @tc.name fileio_mkdir_async_rmdir_sync_001
   * @tc.desc Test mkdirAsync() and rmdirSync() interfaces.
   */
  it('fileio_mkdir_async_rmdir_sync_001', 0, async function (done) {
    let dpath = nextFileName('fileio_mkdir_async_rmdir_sync_001') + 'd';

    try {
      fileio.mkdir(dpath, function (error) {
        expect(fileio.rmdirSync(dpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirAsync_0020
   * @tc.name fileio_mkdir_async_rmdir_sync_002
   * @tc.desc Test mkdirAsync() and rmdirSync() interfaces.
   */
  it('fileio_mkdir_async_rmdir_sync_002', 0, async function (done) {
    let fpath = nextFileName('fileio_mkdir_async_rmdir_sync_002');

    try {
      expect(await fileio.mkdir(fpath, 777) == null).assertTrue();
      expect(fileio.rmdirSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirAsync_0030
   * @tc.name fileio_mkdir_async_rmdir_sync_003
   * @tc.desc Test mkdirAsync() and rmdirSync() interfaces.
   */
  it('fileio_mkdir_async_rmdir_sync_003', 0, async function (done) {
    let fpath = nextFileName('fileio_mkdir_async_rmdir_sync_003');

    try {
      expect(await fileio.mkdir(fpath, 400) == null).assertTrue();
      expect(fileio.rmdirSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirAsync_0040
   * @tc.name fileio_mkdir_async_rmdir_sync_004
   * @tc.desc Test mkdirAsync() and interfaces.
   */
  it('fileio_mkdir_async_rmdir_sync_004', 0, async function (done) {
    try {
      expect(await fileio.mkdir(12) == null).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_MkdirAsync_0050
   * @tc.name fileio_mkdir_async_rmdir_sync_005
   * @tc.desc Test mkdirAsync()interfaces.
   */
  it('fileio_mkdir_async_rmdir_sync_005', 0, async function (done) {
    try {
      expect(await fileio.mkdir('/').indexOf('<pending>') > -1).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      done();
    }
  });
});