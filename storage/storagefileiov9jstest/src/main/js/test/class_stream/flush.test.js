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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';

export default function fileIOStreamFlush() {
describe('fileIO_fs_stream_flush', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHSYNC_0000
   * @tc.name fileIO_test_stream_flush_sync_000
   * @tc.desc Test the flushSync() interface of class Stream.
   * Refresh file stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_stream_flush_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_flush_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileIO.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.flushSync();
      ss.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_flush_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHSYNC_0100
   * @tc.name fileIO_test_stream_flush_sync_001
   * @tc.desc Test the flushSync() interface of class Stream.
   * Invalid parameter, don't requrie any parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_stream_flush_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_flush_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(ss !== null).assertTrue();
      ss.flushSync(1);
      expect(false).assertTrue();
    } catch (e) {
      ss.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_flush_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHASYNC_0000
   * @tc.name fileIO_test_stream_flush_async_000
   * @tc.desc Test the flush() interface of class Stream. Promise.then().catch()
   * Refresh the file stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_flush_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_flush_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = await fileIO.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.flush().then(() => {
        ss.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_test_stream_flush_async_000 error package' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_stream_flush_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHASYNC_0100
   * @tc.name fileIO_test_stream_flush_async_001
   * @tc.desc Test the flush() interface of class Stream. Callback.
   * Refresh the file stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_stream_flush_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_flush_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = await fileIO.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.flush((err) => {
        if (err) {
          console.log('fileIO_test_stream_flush_async_001 error package' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        ss.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      })
    } catch (e) {
      console.log('fileIO_test_stream_flush_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHASYNC_0100
   * @tc.name fileIO_test_stream_flush_async_001
   * @tc.desc Test the flush() interface of class Stream. Promise.
   * Refresh the file stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */

  it('fileIO_test_stream_flush_sync_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_flush_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let ss = fileIO.createStreamSync(fpath, 'r+');
    
    try {
      expect(ss !== null).assertTrue();
      await ss.flush(1);
      expect(false).assertTrue();
    } catch (e) {
      ss.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_flush_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}
