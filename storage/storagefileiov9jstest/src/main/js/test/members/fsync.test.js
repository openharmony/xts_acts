/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
  fileio, fileIO, FILE_CONTENT, prepareFile, nextFileName,
  describe, it, expect,
} from '../Common';

export default function fileIOFsync() {
describe('fileIO_fs_fsync', function () {

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0000
   * @tc.name fileIO_test_fsync_sync_000
   * @tc.desc Test fsyncSync() interface.
   * Open the file in read-write mode, and synchronize the file content data.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_fsync_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fsyncSync(file.fd);
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fsync_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0010
   * @tc.name fileIO_test_fsync_sync_001
   * @tc.desc Test fsyncSync() interface. Invalid fd parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_sync_001', 0, function () {

    try {
      fileIO.fsyncSync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0020
   * @tc.name fileIO_test_fsync_sync_002
   * @tc.desc Test fsyncSync() interface. Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_sync_002', 0, function () {

    try {
      fileIO.fsyncSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0000
   * @tc.name fileIO_test_fsync_async_000
   * @tc.desc Test fsync() interface. await Promise.
   * Open the file in read-write mode, and synchronize the file content data.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fsync_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.fsync(file.fd);
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fsync_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0010
   * @tc.name fileIO_test_fsync_async_001
   * @tc.desc Test fsync() interface. Promise.then().catch()
   * Open the file in read-write mode, and synchronize the file content data.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fsync_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fsync(file.fd).then(() => {
        fileio.closeSync(file.fd);
        fileio.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_test_fsync_async_001 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_002
   * @tc.name fileIO_test_fsync_async_002
   * @tc.desc Test fsync() interface. Callback.
   * Open the file in read-write mode, and synchronize the file content data.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fsync_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fsync(file.fd, (err) => {
        if (err) {
          console.log('fileIO_test_fsync_async_002 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        fileio.closeSync(file.fd);
        fileio.unlinkSync(fpath);
      });
      done();
    } catch (e) {
      console.log('fileIO_test_fsync_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_003
   * @tc.name fileIO_test_fsync_async_003
   * @tc.desc Test fsync() interface. await Promise.
   * Invalid fd parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_003', 0, async function (done) {

    try {
      await fileIO.fsync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_004
   * @tc.name fileIO_test_fsync_async_004
   * @tc.desc Test fsync() interface. Callback.
   * Invalid fd parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_004', 0, async function (done) {

    try {
      fileIO.fsync(-1, (err) => {
        if (err) {
          console.log('fileIO_test_fsync_async_004 error package: {' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_005
   * @tc.name fileIO_test_fsync_async_005
   * @tc.desc Test fsync() interface. Promise.then().catch()
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_005', 0, async function (done) {

    try {
      fileIO.fsync(-1).then(() => {
        expect(false).assertTrue();
      }).catch((err) => {
        console.log('fileIO_test_fsync_async_005 error package: {' + err.message + ', code: ' + err.code + '}');
        expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_006
   * @tc.name fileIO_test_fsync_async_006
   * @tc.desc Test fsync() interface. await Promise.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_006', 0, async function (done) {

    try {
      await fileIO.fsync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_006
   * @tc.name fileIO_test_fsync_async_006
   * @tc.desc Test fsync() interface. Callback.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fsync_async_007', 0, async function (done) {

    try {
      fileIO.fsync(() => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
})
}
