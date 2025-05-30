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
import { Level } from '@ohos/hypium';

export default function fileioMkdirRmdir() {
describe('fileio_mkdir_rmdir', function () {

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0000
   * @tc.name fileio_mkdir_sync_rmdir_sync_000
   * @tc.desc Test mkdirSync() and rmdirSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_mkdir_sync_rmdir_sync_000') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_mkdir_sync_rmdir_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0100
   * @tc.name fileio_mkdir_sync_rmdir_sync_001
   * @tc.desc Test mkdirSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_001', Level.LEVEL0, function () {
    try {
      expect(fileio.mkdirSync('/') == null).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_mkdir_sync_rmdir_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0200
   * @tc.name fileio_mkdir_sync_rmdir_sync_002
   * @tc.desc Test mkdirSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_002', Level.LEVEL0, function () {
    try {
      expect(fileio.mkdirSync(12) == null).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_mkdir_sync_rmdir_sync_002 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0300
   * @tc.name fileio_mkdir_sync_rmdir_sync_003
   * @tc.desc Test mkdirSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_003', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_mkdir_sync_rmdir_sync_003');

    try {
      fileio.mkdirSync(dpath, undefined);
      fileio.rmdirSync(dpath);
    } catch (e) {
      console.log('fileio_mkdir_sync_rmdir_sync_003 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0000
   * @tc.name fileio_mkdir_async_rmdir_sync_000
   * @tc.desc Test mkdir() and rmdirSync() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_000') + 'd';

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
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0100
   * @tc.name fileio_mkdir_async_rmdir_sync_001
   * @tc.desc Test mkdir() and rmdirSync() interfaces. Callback.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_001') + 'd';

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
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0200
   * @tc.name fileio_mkdir_async_rmdir_sync_002
   * @tc.desc Test mkdir() and rmdirSync() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_mkdir_async_rmdir_sync_002');

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
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0300
   * @tc.name fileio_mkdir_async_rmdir_sync_003
   * @tc.desc Test mkdir() and rmdirSync() interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_mkdir_async_rmdir_sync_003');

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
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0400
   * @tc.name fileio_mkdir_async_rmdir_sync_004
   * @tc.desc Test mkdir() and interfaces. Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_004', Level.LEVEL0, async function (done) {
    try {
      expect(await fileio.mkdir(12) == null).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_004 has failed for ' + e);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0500
   * @tc.name fileio_mkdir_async_rmdir_sync_005
   * @tc.desc Test mkdir() interfaces. Promise.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_005', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_005');

    try {
      await fileio.mkdir(dpath, undefined);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_005 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0600
   * @tc.name fileio_mkdir_async_rmdir_sync_006
   * @tc.desc Test mkdir() interfaces. Callback.
   * Undefined option arguments, use default options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_006', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_006');

    try {
      fileio.mkdir(dpath, undefined, (err) => {
        if (err) {
          console.log('fileio_mkdir_async_rmdir_sync_006 error: ' + e);
          expect(false).assertTrue();
        }
        fileio.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileio_mkdir_async_rmdir_sync_006 has failed for ' + e);
      expect(false).assertTrue();
    }
  });
});
}
