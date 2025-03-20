/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';

export default function fileIOAccess() {
describe('fileIO_fs_access', function () {

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0000
   * @tc.name test_FileIO_Access_Sync_000
   * @tc.desc Test accessSync() interface.
   * This interface shall work properly in normal case.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Sync_000', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      expect(fileIO.accessSync(fpath)).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('test_FileIO_Access_Sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0100
   * @tc.name test_FileIO_Access_Sync_001
   * @tc.desc Test accessSync() interface.
   * The test file is not exist.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Sync_001', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_001');

    try {
      let ret = fileIO.accessSync(fpath);
      expect(ret === false).assertTrue();
    } catch (e) {
      console.log('test_FileIO_Access_Sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0200
   * @tc.name test_FileIO_Access_Sync_002
   * @tc.desc Test accessSync() interface.
   * The test file path is illegal.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Sync_002', 0, async function () {

    try {
      expect(fileIO.accessSync(-1)).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileIO_Access_Sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0300
   * @tc.name test_FileIO_Access_Sync_003
   * @tc.desc Test accessSync() interface.
   * Test that the file is exist, AccessModeType = EXIST
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('test_FileIO_Access_Sync_003', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST);
      expect(ret == true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('test_FileIO_Access_Sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0400
   * @tc.name test_FileIO_Access_Sync_004
   * @tc.desc Test accessSync() interface.
   * Test that the file is exist, AccessModeType = WRITE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Sync_004', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.WRITE);
      expect(ret == true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('test_FileIO_Access_Sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0500
   * @tc.name test_FileIO_Access_Sync_005
   * @tc.desc Test accessSync() interface.
   * Test that the file is exist, AccessModeType = READ
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Sync_005', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ);
      expect(ret == true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('test_FileIO_Access_Sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0600
   * @tc.name test_FileIO_Access_Sync_006
   * @tc.desc Test accessSync() interface.
   * Test that the file is exist, AccessModeType = READ_WRITE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Sync_006', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ_WRITE);
      expect(ret == true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('test_FileIO_Access_Sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0700
   * @tc.name test_FileIO_Access_Sync_007
   * @tc.desc Test accessSync() interface.
   * Test that the file is exist, AccessFlagType.LOCAL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Sync_007', 0, async function () {
    let fpath = await nextFileName('test_FileIO_Access_Sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST, 0);
      expect(ret == true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('test_FileIO_Access_Sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0000
   * @tc.name test_FileIO_Access_Async_000
   * @tc.desc Test access() interface. Promise.
   * Use promise to test that the file is exist. Sync method reads data from file.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Async_000', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = await fileIO.access(fpath);
      expect(ret === true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0100
   * @tc.name test_FileIO_Access_Async_001
   * @tc.desc Test access() interface. Callback.
   * Use callback to test that the file is exist. Sync method reads data from file.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Async_001', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.access(fpath, (err, ret) => {
        if (err) {
          console.log('test_FileIO_Access_Async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      });
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0200
   * @tc.name test_FileIO_Access_Async_002
   * @tc.desc Test access() interface. Promise.
   * Async test file does not exist.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Async_002', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_002');

    try {
      let ret = await fileIO.access(fpath);
      expect(ret === false).assertTrue();
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0300
   * @tc.name test_FileIO_Access_Async_003
   * @tc.desc Test access() interface. Callback.
   * Async test file does not exist.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Async_003', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_003');

    try {
      fileIO.access(fpath, (err, ret) => {
        if (err) {
          console.log('test_FileIO_Access_Async_003 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(ret === false).assertTrue();
        done();
      });
    } catch (e) {
      console.log('test_FileIO_Access_Async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0400
   * @tc.name test_FileIO_Access_Async_004
   * @tc.desc Test access() interface. Promise.
   * Invalid path parameter.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Async_004', 0, async function (done) {

    try {
      await fileIO.access(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileIO_Access_Async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0500
   * @tc.name test_FileIO_Access_Async_005
   * @tc.desc Test access() interface. Callback.
   * Invalid path parameter.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_FileIO_Access_Async_005', 0, async function (done) {

    try {
      fileIO.access(-1, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('test_FileIO_Access_Async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
  
  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0600
   * @tc.name test_FileIO_Access_Async_006
   * @tc.desc Test access() interface. Promise.
   * Use promise to test that the file is exist. AccessModeType = EXIST.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('test_FileIO_Access_Async_006', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = await fileIO.access(fpath, fileIO.AccessModeType.EXIST);
      expect(ret === true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0700
   * @tc.name test_FileIO_Access_Async_007
   * @tc.desc Test access() interface. Promise.
   * Use promise to test that the file is exist. AccessModeType = WRITE.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Async_007', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = await fileIO.access(fpath, fileIO.AccessModeType.WRITE);
      expect(ret === true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0800
   * @tc.name test_FileIO_Access_Async_008
   * @tc.desc Test access() interface. Promise.
   * Use promise to test that the file is exist. AccessModeType = READ.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Async_008', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = await fileIO.access(fpath, fileIO.AccessModeType.READ);
      expect(ret === true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0900
   * @tc.name test_FileIO_Access_Async_009
   * @tc.desc Test access() interface. Promise.
   * Use promise to test that the file is exist. AccessModeType = READ_WRITE.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_FileIO_Access_Async_009', 0, async function (done) {
    let fpath = await nextFileName('test_FileIO_Access_Async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ret = await fileIO.access(fpath, fileIO.AccessModeType.READ_WRITE);
      expect(ret === true).assertTrue();
      let file = fileIO.openSync(fpath);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('test_FileIO_Access_Async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}