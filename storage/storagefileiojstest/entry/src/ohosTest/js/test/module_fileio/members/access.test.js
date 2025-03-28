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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioAccess() {
describe('fileio_access', function () {

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0000
   * @tc.name fileio_test_access_sync_000
   * @tc.desc Test accessSync() interface.
   * This interface shall work properly in normal case
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0100
   * @tc.name fileio_test_access_sync_001
   * @tc.desc Test accessSync() interface.
   * Test that the current process has write permission.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, 2);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0200
   * @tc.name fileio_test_access_sync_002
   * @tc.desc Test accessSync() interface.
   * Test that the current process has read permission.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, 4);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_002 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0300
   * @tc.name fileio_test_access_sync_003
   * @tc.desc Test accessSync() interface.
   * Test that the current process has read and write permissions.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, 2 | 4);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_003 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0400
   * @tc.name fileio_test_access_sync_004
   * @tc.desc Test accessSync() interface.
   * Test that the current process has executable permissions.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_004');
    fileio.openSync(fpath, 0o102, 0o777);

    try {
      fileio.accessSync(fpath, 1);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_004 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0500
   * @tc.name fileio_test_access_sync_005
   * @tc.desc Test accessSync() interface.
   * The test file is not exist.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_sync_005', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_005');

    try {
      fileio.accessSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_005 has failed for ' + err);
      expect(err.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSSYNC_0600
   * @tc.name fileio_test_access_sync_006
   * @tc.desc Test accessSync() interface.
   * Undefined option arguments, use default mode = 0(Is file exist).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_access_sync_006', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_access_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.accessSync(fpath, undefined);
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_access_sync_006 has failed for ' + err);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0000
   * @tc.name fileio_test_access_async_000
   * @tc.desc Test access() interface. Promise.
   * This interface shall work properly in normal case.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0100
   * @tc.name fileio_test_access_async_001
   * @tc.desc Test access() interface. Promise.
   * Use promise to test that the current process has read permission. Async method reads data from file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath, 4);
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      expect((await fileio.read(fd, new ArrayBuffer(4096))) != null).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0200
   * @tc.name fileio_test_access_async_002
   * @tc.desc Test access() interface. Callback.
   * Test file exists.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, function (error) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (err) {
      console.info('fileio_test_access_async_002 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0300
   * @tc.name fileio_test_access_async_003
   * @tc.desc Test access() interface. Callback.
   * Use callback to test that the current process has read permission. Async method reads data from file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, 4, async function (error) {
        let fd = fileio.openSync(fpath);
        expect(isIntNum(fd)).assertTrue();
        expect((await fileio.read(fd, new ArrayBuffer(4096))) != null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      });
      done();
    } catch (err) {
      console.info('fileio_test_access_async_003 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0400
   * @tc.name fileio_test_access_async_004
   * @tc.desc Test access() interface. Promise.
   * Use promises to test that the current process has executable permissions.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_004');
    fileio.openSync(fpath, 0o102, 0o777);

    try {
      await fileio.access(fpath, 1);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_004 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0500
   * @tc.name fileio_test_access_async_005
   * @tc.desc Test access() interface. Callback.
   * Use callback to test that the current process has write permission.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, 2, function (error) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (err) {
      console.info('fileio_test_access_async_005 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0600
   * @tc.name fileio_test_access_async_006
   * @tc.desc Test access() interface. Promise.
   * Async test file does not exist.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_access_async_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_006');

    try {
      await fileio.access(fpath);
    } catch (err) {
      console.info('fileio_test_access_async_006 has failed for ' + err);
      expect(err.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0700
   * @tc.name fileio_test_access_async_007
   * @tc.desc Test access() interface. Callback.
   * Undefined option arguments, use default mode = 0(Is file exist).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_access_async_007', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.access(fpath, undefined, (error) => {
        if (error) {
          console.info('fileio_test_access_async_007 error: ' + err);
          expect(flase).assertTrue();
        }
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (err) {
      console.info('fileio_test_access_async_007 has failed for ' + err);
      expect(flase).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESSASYNC_0800
   * @tc.name fileio_test_access_async_008
   * @tc.desc Test access() interface. Promise.
   * Undefined option arguments, use default mode = 0(Is file exist).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_test_access_async_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_access_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.access(fpath, undefined);
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_access_async_008 has failed for ' + err);
      expect(flase).assertTrue();
    }
  });
});
}
