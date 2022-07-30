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

import { fileio, nextFileName, describe, it, expect, isIntNum } from '../../Common';

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
   it('fileio_mkdir_sync_rmdir_sync_000', 0, async function () {
    let dpath = await nextFileName('fileio_mkdir_sync_rmdir_sync_000') + 'd';
    try {
      fileio.mkdirSync(dpath);
      expect((fileio.opendirSync(dpath)) != null).assertTrue();
      console.info('fileio_mkdir_sync_rmdir_sync_000 has mkdir SUCCESS');
      fileio.rmdirSync(dpath);
    }catch (e) {
      console.info('fileio_mkdir_sync_rmdir_sync_000 has failed for '+e);
      expect(false).assertTrue();
    }
    try {
      fileio.opendirSync(dpath);
      expect(false).assertTrue();
    }catch (e) {
      expect(e.toString().indexOf('No such file or directory') != -1).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0100
   * @tc.name fileio_mkdir_sync_rmdir_sync_001
   * @tc.desc Test mkdirSync() interfaces,Path parameter passing '/'
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_001', 0, function () {
    try {
      fileio.mkdirSync('/');
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('File exists') != -1).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0200
   * @tc.name fileio_mkdir_sync_rmdir_sync_002
   * @tc.desc Test mkdirSync() interfaces,Path parameter passes invalid path 12
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_002', 0, function () {
    try {
      fileio.mkdirSync(12);
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('Invalid path') != -1).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0300
   * @tc.name fileio_mkdir_sync_rmdir_sync_003
   * @tc.desc Test mkdirSync() interfaces,Path passes null parameter
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_003', 0, function () {
    try {
      fileio.mkdirSync();
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('Number of arguments unmatched') != -1).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0400
   * @tc.name fileio_mkdir_sync_rmdir_sync_004
   * @tc.desc Test rmdirSync() interfaces,Path parameter passes invalid path 12
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_004', 0, function () {
    try {
      fileio.rmdirSync(12);
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('Invalid path') != -1).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0500
   * @tc.name fileio_mkdir_sync_rmdir_sync_005
   * @tc.desc Test rmdirSync() interfaces,Path passes null parameter
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_sync_rmdir_sync_005', 0, function () {
    try {
      fileio.rmdirSync();
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('Number of arguments unmatched') != -1).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0000
   * @tc.name fileio_mkdir_async_rmdir_sync_000
   * @tc.desc Test mkdir() interfaces(promise).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_000', 0, async function (done) {
    let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_000') + 'd';
    try {
      await fileio.mkdir(dpath);
      expect((fileio.opendirSync(dpath)) != null).assertTrue();
      console.info('fileio_mkdir_async_rmdir_sync_000 has mkdir SUCCESS');
      fileio.rmdirSync(dpath);
      done();
    }catch (e) {
      console.info('fileio_mkdir_async_rmdir_sync_000 has mkdir failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0100
   * @tc.name fileio_mkdir_async_rmdir_sync_001
   * @tc.desc Test  mkdir() interfaces (callback)
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_001', 0, async function (done) {
    let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_001') + 'd';
    try {
      fileio.mkdir(dpath, function (error) {
        expect(error.toString().indexOf('No error information') != -1).assertTrue();
        expect((fileio.opendirSync(dpath)) != null).assertTrue();
        console.info('fileio_mkdir_async_rmdir_sync_001 has mkdir SUCCESS');
        fileio.rmdirSync(dpath);
      });
    } catch (e) {
      console.info('fileio_mkdir_async_rmdir_sync_001 has mkdir failed for ' + e);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0200
   * @tc.name fileio_mkdir_async_rmdir_sync_002
   * @tc.desc Test mkdir() interfaces,mode parameter passing 777
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_mkdir_async_rmdir_sync_002');
    try {
      await fileio.mkdir(fpath, 777);
      expect((fileio.opendirSync(fpath)) != null).assertTrue();
      console.info('fileio_mkdir_async_rmdir_sync_002 has mkdir SUCCESS');
      fileio.rmdirSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_mkdir_async_rmdir_sync_002 has mkdir failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0300
   * @tc.name fileio_mkdir_async_rmdir_sync_003
   * @tc.desc Test mkdir() interfaces,mode parameter passing 400
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_mkdir_async_rmdir_sync_003');
    try {
      await fileio.mkdir(fpath, 400);
      expect((fileio.opendirSync(fpath)) != null).assertTrue();
      console.info('fileio_mkdir_async_rmdir_sync_003 has mkdir SUCCESS');
      fileio.rmdirSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_mkdir_async_rmdir_sync_003 has mkdir failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0400
   * @tc.name fileio_mkdir_async_rmdir_sync_004
   * @tc.desc Test mkdir() interfaces,Path parameter passes invalid path 12
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_004', 0, async function (done) {
    try {
      await fileio.mkdir(12);
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('Invalid path') != -1).assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0500
   * @tc.name fileio_mkdir_async_rmdir_sync_005
   * @tc.desc Test mkdir() interfaces,Path parameter passing '/'
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_005', 0, async function (done) {
    try {
      await fileio.mkdir('/');
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('File exists') != -1).assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0600
   * @tc.name fileio_mkdir_async_rmdir_sync_006
   * @tc.desc Test mkdir() interfaces,Path passes null parameter
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_mkdir_async_rmdir_sync_006', 0, async function (done) {
    try {
      await fileio.mkdir();
      expect(false).assertTrue();
    } catch (e) {
      expect(e.toString().indexOf('Number of arguments unmatched') != -1).assertTrue();
      console.info('fileio_mkdir_async_rmdir_sync_006 has failed for ' + e);
      done();
    }
  });

  /**
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_ASYNC_0000
    * @tc.name fileio_mkdir_sync_rmdir_async_000
    * @tc.desc Test rmdir() and interfaces,Path parameter passes invalid path 12
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 0
    * @tc.require
    */
  it('fileio_mkdir_sync_rmdir_async_000', 0, async function (done) {
    try {
      await fileio.rmdir(12);
      expect(false).assertTrue();
    }catch (e) {
      expect(e.toString().indexOf('Invalid path') != -1).assertTrue();
      done();
    }
  });

  /**
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_ASYNC_0100
    * @tc.name fileio_mkdir_sync_rmdir_async_001
    * @tc.desc Test rmdir() and interfaces,Path passes null parameter
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 0
    * @tc.require
    */
  it('fileio_mkdir_sync_rmdir_async_001', 0, async function (done) {
    try {
      await fileio.rmdir();
      expect(false).assertTrue();
    }catch (e) {
      expect(e.toString().indexOf('Number of arguments unmatched') != -1).assertTrue();
      done();
    }
  });
});