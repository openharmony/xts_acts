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
  
  export default function fileIORead() {
  describe('fileIO_fs_read', function () {

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0000
   * @tc.name fileIO_test_read_sync_000
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_read_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileIO.readSync(fd, new ArrayBuffer(4096));
      expect(len == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0010
   * @tc.name fileIO_test_read_sync_001
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_read_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileIO.readSync(fd, new ArrayBuffer(4096), {
        length: 1,
      });
      expect(len == 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0020
   * @tc.name fileIO_test_read_sync_002
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_read_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = fileIO.readSync(fd, new ArrayBuffer(4096), {
        offset: 1,
      });
      expect(len == FILE_CONTENT.length - 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0030
   * @tc.name fileIO_test_read_sync_003
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_003', 0, async function () {
    let fd;
    const invalidLength = 9999;
    let fpath = await nextFileName('fileIO_test_read_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fd = fileio.openSync(fpath, 0o2, 0o664);
      expect(isIntNum(fd)).assertTrue();
      fileIO.readSync(fd, new ArrayBuffer(4096), {length: invalidLength});
      expect(null).assertFail();
    } catch (e) {
      console.log('fileIO_test_read_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0040
   * @tc.name fileIO_test_read_sync_004
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_004', 0, async function () {
    let fpath = await nextFileName('fileIO_test_read_sync_004');

    try {
      fileIO.readSync(-1, new ArrayBuffer(4096));
      expect(null).assertFail();
    } catch (e) {
      console.log('fileIO_test_read_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0050
   * @tc.name fileIO_test_read_sync_005
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_005', 0, async function () {
    let fpath = await nextFileName('fileIO_test_read_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let invalidPos = FILE_CONTENT.length + 1;
      let len = fileIO.readSync(fd, new ArrayBuffer(4096), {
        offset: invalidPos,
      });
      expect(len == 0).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0000
   * @tc.name fileIO_test_read_async_000
   * @tc.desc Test read() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_read_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let res = await fileIO.read(fd, new ArrayBuffer(4096));
      expect(res == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0010
   * @tc.name fileIO_test_read_async_001
   * @tc.desc Test read() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_read_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      fileIO.read(fd, new ArrayBuffer(4096), async function (err, readlen) {
        expect(readlen == FILE_CONTENT.length).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_read_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0020
   * @tc.name fileIO_test_read_async_002
   * @tc.desc Test read() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_read_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readlen = await fileIO.read(fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0030
   * @tc.name fileIO_test_read_async_003
   * @tc.desc Test read() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_read_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readlen = await fileIO.read(fd, new ArrayBuffer(4096), {
        offset: 1,
      });
      expect(readlen == FILE_CONTENT.length - 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0040
   * @tc.name fileIO_test_read_async_004
   * @tc.desc Test read() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_read_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      let readlen = await fileIO.read(fd, new ArrayBuffer(4096), {
        length: 3,
      });
      expect(readlen == 3).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0050
   * @tc.name fileIO_test_read_async_005
   * @tc.desc Test read() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_read_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let len = await fileIO.read(fd, new ArrayBuffer(4096), {
        offset: FILE_CONTENT.length + 10,
      });
      expect(isIntNum(len)).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0060
   * @tc.name fileIO_test_read_async_006
   * @tc.desc Test read() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_async_006', 0, async function (done) {
    try {
      await fileIO.read(-1, new ArrayBuffer(4096));
      expect(null).assertFail();
    } catch (e) {
      console.log('fileIO_test_read_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });
});
}
