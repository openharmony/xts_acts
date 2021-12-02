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

describe('fileio_stream', function () {

  /**
   * @tc.number SUB_DF_FileIO_Stream_FdopenStreamSync_0000
   * @tc.name fileio_test_stream_fdopen_stream_sync_000
   * @tc.desc Test fdopenStreamSync() interface.
   */
  it('fileio_test_stream_fdopen_stream_sync_000', 0, function () {
    let fpath = nextFileName('fileio_test_stream_fdopen_stream_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      let ss = fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.closeSync() == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_stream_fdopen_stream_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  })

  /**
   * @tc.number SUB_DF_FileIO_Stream_FdopenStreamSync_0010
   * @tc.name fileio_test_stream_fdopen_stream_sync_001
   * @tc.desc Test fdopenStreamSync() interface.
   */
  it('fileio_test_stream_fdopen_stream_sync_001', 0, function () {

    try {
      let ss = fileio.fdopenStreamSync(-1, 'r+');
      expect(null).assertFail();
    } catch (e) {
    }
  })

  /**
   * @tc.number SUB_DF_FileIO_Stream_FdopenStreamAsync_0000
   * @tc.name fileio_test_stream_fdopen_stream_async_000
   * @tc.desc Test fdopenStreamSync() interface.
   */
  it('fileio_test_stream_fdopen_stream_async_000', 0, async function (done) {
    let fpath = nextFileName('fileio_test_stream_fdopen_stream_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = await fileio.openSync(fpath, 0o2);
      let ss = await fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(ss.closeSync() == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_stream_fdopen_stream_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_Stream_FdopenStreamAsync_0010
   * @tc.name fileio_test_stream_fdopen_stream_async_001
   * @tc.desc Test fdopenStreamSync() interface.
   */
  it('fileio_test_stream_fdopen_stream_async_001', 0, async function (done) {
    let fpath = nextFileName('fileio_test_stream_fdopen_stream_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = await fileio.openSync(fpath, 0o2);
      let ss = await fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      ss.close(function (err, stream) {
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      })
      done();
    } catch (e) {
      console.log('fileio_test_stream_fdopen_stream_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });
});