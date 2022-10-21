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
} from '../../Common';

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
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.info('fileIO_truncate_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0010
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
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 5;

    try {
      fileIO.truncate(fd, truncateLen, function (err) {
        let len = fileio.readSync(fd, new ArrayBuffer(4096));
        expect(len == truncateLen).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      })
    } catch (e) {
      console.log('fileIO_truncate_async_001 has failed for '  + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0020
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
          let fd = fileio.openSync(fpath, 0o2);
          expect(isIntNum(fd)).assertTrue();
          let len = fileio.readSync(fd, new ArrayBuffer(4096));
          expect(len == truncateLen).assertTrue();
          expect(fileio.closeSync(fd) == null).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        })
        .catch(function (e) {
          console.log('catch '  + e.message + ', code: ' + e.code);
        });
    } catch(e) {
      console.log('fileIO_truncate_async_002 has failed for '  + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0030
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
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 2;

    try {
      fileIO.truncate(fd, truncateLen)
        .then(function (err) {
          expect(err == null).assertTrue();
          let len = fileio.readSync(fd, new ArrayBuffer(4096));
          expect(len == truncateLen).assertTrue();
          expect(fileio.closeSync(fd) == null).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        })
        .catch(function (e) {
          console.log('catch '  + e.message + ', code: ' + e.code);
        })
    } catch(e) {
      console.log('fileIO_truncate_async_003 has failed for '  + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0040
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
      expect(fileIO.truncateSync(fpath) == null).assertTrue();
      expect(fileio.statSync(fpath).size == 0).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_000 has failed for '  + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0010
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
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 5;

    try {
      fileIO.truncateSync(fd, truncateLen);
      let len = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_001 has failed for '  + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0020
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
      expect(null).assertFail();
    } catch (e) {
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0030
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
    let fd = fileio.openSync(fpath, 0o2);
    expect(isIntNum(fd)).assertTrue();
    let truncateLen = 2;
    try {
      fileIO.truncateSync(fd, truncateLen);
      let len = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(len == truncateLen).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_003 has failed for '  + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0040
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
    } catch (e) {
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0050
   * @tc.name fileio_test_truncate_sync_005
   * @tc.desc Test truncateSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_truncate_sync_005', 0, async function () {
    let fpath = await nextFileName('fileio_test_truncate_sync_005');
    let truncateLen = 2;
    try {
      fileIO.truncateSync(fpath, truncateLen);
    } catch (e) {
      console.log('fileio_test_ftruncate_sync_005 has failed for '  + e.message + ', code: ' + e.code);
      expect(!!e).assertTrue();
    }
  });
});
}

