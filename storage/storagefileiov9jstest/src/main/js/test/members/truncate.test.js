/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
  fileio, fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../Common';

  export default function fileIOTruncate() {
  describe('fileIO_fs_truncate', function () {

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0000
   * @tc.name fileIO_truncate_async_000
   * @tc.desc Test the truncate() interface that receives the fpath parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_truncate_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let truncateLen = 5;

    try {
      await fileIO.truncate(fpath, truncateLen);
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileIO_truncate_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0100
   * @tc.name fileIO_truncate_async_001
   * @tc.desc Test the truncate() interface that receives the fd parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_truncate_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;
    let truncateLen = 5;

    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, truncateLen, function (err) {
        let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(len == truncateLen).assertTrue();
        fileio.closeSync(file.fd);
        fileio.unlinkSync(fpath);
        done();
      })
    } catch (e) {
      console.log('fileIO_truncate_async_001 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0200
   * @tc.name fileIO_truncate_async_002
   * @tc.desc Test the truncate() interface that receives the fpath parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_truncate_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_002');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let truncateLen = 2;

    try {
      fileIO
        .truncate(fpath, truncateLen)
        .then(function (err) {
          expect(err == null).assertTrue();
          let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
          expect(isIntNum(file.fd)).assertTrue();
          let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
          expect(len == truncateLen).assertTrue();
          fileio.closeSync(file.fd);
          fileio.unlinkSync(fpath);
          done();
        })
        .catch(function (e) {
          console.log('catch '  + e.message + ', code: ' + e.code);
        });
    } catch(e) {
      console.log('fileIO_truncate_async_002 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0300
   * @tc.name fileIO_truncate_async_003
   * @tc.desc Test the truncate() interface that receives the fd parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_truncate_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_003');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file;
    let truncateLen = 2;

    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, truncateLen)
        .then(function (err) {
          expect(err == null).assertTrue();
          let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
          expect(len == truncateLen).assertTrue();
          fileio.closeSync(file.fd);
          fileio.unlinkSync(fpath);
          done();
        })
        .catch(function (e) {
          console.log('catch '  + e.message + ', code: ' + e.code);
        })
    } catch(e) {
      console.log('fileIO_truncate_async_003 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0400
   * @tc.name fileIO_truncate_async_004
   * @tc.desc Test the truncate() interface that receives the fpath parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_truncate_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_004');
    let truncateLen = 2;

    try {
      fileIO.truncate(fpath, truncateLen, function (err) {
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_004 has failed for '  + e.message + ', code: ' + e.code);
      expect(!!e).assertTrue();
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0000
   * @tc.name fileIO_test_truncate_sync_000
   * @tc.desc Test the truncateSync() interface that receives the fpath parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_truncate_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.truncateSync(fpath);
      expect(fileIO.statSync(fpath).size == 0).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_000 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0100
   * @tc.name fileIO_test_truncate_sync_001
   * @tc.desc Test the truncateSync() interface that receives the fd parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_truncate_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;
    let truncateLen = 5;

    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncateSync(file.fd, truncateLen);
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_001 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0200
   * @tc.name fileIO_test_truncate_sync_002
   * @tc.desc Test the truncateSync() interface that receives the fpath parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_truncate_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_002');

    try {
      let stat = fileIO.truncateSync(fpath);
      console.info('fileIO_test_truncate_sync_002 = ' + stat);
      expect(false).assertTrue();
    } catch (e) {
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0300
   * @tc.name fileIO_test_truncate_sync_003
   * @tc.desc Test the truncateSync() interface that receives the fd parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_truncate_sync_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_003');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file;
    let truncateLen = 2;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncateSync(file.fd, truncateLen);
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_003 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0400
   * @tc.name fileIO_test_truncate_sync_004
   * @tc.desc Test truncateSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_truncate_sync_004', 0, function () {
    try {
      let stat = fileIO.truncateSync();
      console.info('fileIO_test_truncate_sync_004 = ' + stat);
      expect(false).assertTrue();
    } catch (e) {
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0500
   * @tc.name fileIO_test_truncate_sync_005
   * @tc.desc Test truncateSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_truncate_sync_005', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_005');
    let truncateLen = 2;
    try {
      fileIO.truncateSync(fpath, truncateLen);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_005 has failed for '  + e.message + ', code: ' + e.code);
      expect(!!e).assertTrue();
    }
  });
});
}

