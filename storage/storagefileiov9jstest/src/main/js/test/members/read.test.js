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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(len == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_read_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0100
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
        length: 1,
      });
      expect(len == 1).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_read_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0200
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
        offset: 1,
      });
      expect(len == FILE_CONTENT.length - 1).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_read_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0300
   * @tc.name fileIO_test_read_sync_003
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_read_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;
    const invalidLength = 9999;

    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.readSync(file.fd, new ArrayBuffer(4096), {length: invalidLength});
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0400
   * @tc.name fileIO_test_read_sync_004
   * @tc.desc Test readSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_read_sync_004', 0, async function () {

    try {
      fileIO.readSync(-1, new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_SYNC_0500
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let invalidPos = FILE_CONTENT.length + 1;
      let len = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
        offset: invalidPos,
      });
      expect(len == 0).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_read_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let res = await fileIO.read(file.fd, new ArrayBuffer(4096));
      expect(res == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0100
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.read(file.fd, new ArrayBuffer(4096), async function (err, readlen) {
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileio.closeSync(file.fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_read_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0200
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = await fileIO.read(file.fd, new ArrayBuffer(4096));
      expect(readlen == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0300
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = await fileIO.read(file.fd, new ArrayBuffer(4096), {
        offset: 1,
      });
      expect(readlen == FILE_CONTENT.length - 1).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0400
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let readlen = await fileIO.read(file.fd, new ArrayBuffer(4096), {
        length: 3,
      });
      expect(readlen == 3).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0500
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
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let len = await fileIO.read(file.fd, new ArrayBuffer(4096), {
        offset: FILE_CONTENT.length + 1,
      });
      expect(isIntNum(len)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_read_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_ASYNC_0600
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
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });
});
}
