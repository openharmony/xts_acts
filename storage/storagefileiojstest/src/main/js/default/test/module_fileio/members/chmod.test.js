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

describe('fileio_chmod', function () {

  /**
   * @tc.number SUB_DF_FileIO_ChmodSync_0000
   * @tc.name fileio_test_chmod_sync_000
   * @tc.desc Test chmodSync() interfaces.
   */
  it('fileio_test_chmod_sync_000', 0, function () {
    let fpath = nextFileName('fileio_test_chmod_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileio.chmodSync(fpath, 0o660) == null).assertTrue();
      expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_chmod_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_ChmodSync_0010
   * @tc.name fileio_test_chmod_sync_001
   * @tc.desc Test chmodSync() interfaces.
   */
  it('fileio_test_chmod_sync_001', 0, function () {
    let fpath = nextFileName('fileio_test_chmod_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileio.chmodSync(fpath, 0o0700) == null).assertTrue();
      expect((fileio.statSync(fpath).mode & 0o777) == 0o0700).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_chmod_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_ChmodAsync_0000
   * @tc.name fileio_test_chmod_async_000
   * @tc.desc Test chmodAsync() interfaces.
   */
  it('fileio_test_chmod_async_000', 0, async function (done) {
    let fpath = nextFileName('fileio_test_chmod_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio
        .chmod(fpath, 0o660)
        .then(function (err) {
          expect(!err).assertTrue();
          expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        })
        .catch(function (e) {
          console.log(e);
        });
      done();
    } catch (e) {
      console.log('fileio_test_chmod_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_ChmodAsync_0010
   * @tc.name fileio_test_chmod_async_001
   * @tc.desc Test chmodAsync() interfaces.
   */
  it('fileio_test_chmod_async_001', 0, async function (done) {
    let fpath = nextFileName('fileio_test_chmod_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio
        .chmod(fpath, 0o0700)
        .then(function (err) {
          expect(!err).assertTrue();
          expect((fileio.statSync(fpath).mode & 0o777) == 0o0700).assertTrue();
          expect(fileio.unlinkSync(fpath) == null).assertTrue();
          done();
        })
        .catch(function (e) {
          console.log(e);
        });
      done();
    } catch (e) {
      console.log('fileio_test_chmod_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_ChmodAsync_0020
   * @tc.name fileio_test_chmod_async_002
   * @tc.desc Test chmodAsync() interfaces.
   */
  it('fileio_test_chmod_async_002', 0, async function (done) {
    let fpath = nextFileName('fileio_test_chmod_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.chmod(fpath, 0o660, async function () {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_chmod_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_ChmodAsync_0030
   * @tc.name fileio_test_chmod_async_003
   * @tc.desc Test chmodAsync() interfaces.
   */
  it('fileio_test_chmod_async_003', 0, async function (done) {
    let fpath = nextFileName('fileio_test_chmod_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.chmod(fpath, 0o0700, async function () {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o0700).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_chmod_async_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });
});
