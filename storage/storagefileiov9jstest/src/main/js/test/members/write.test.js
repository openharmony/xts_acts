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

  export default function fileIOWrite() {
  describe('fileIO_fs_write', function () {

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0000
   * @tc.name fileIO_test_write_sync_000
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      expect(fileIO.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0100
   * @tc.name fileIO_test_write_sync_001
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      expect(
        fileIO.writeSync(file.fd, FILE_CONTENT, {
          encoding: 'utf-8',
        })
        == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0200
   * @tc.name fileIO_test_write_sync_002
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      expect(
        fileIO.writeSync(file.fd, FILE_CONTENT, {
          length: FILE_CONTENT.length - 1,
        })
        == FILE_CONTENT.length - 1).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0300
   * @tc.name fileIO_test_write_sync_003
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      expect(
        fileIO.writeSync(file.fd, FILE_CONTENT, {
          length: 1,
        })
        == 1).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0400
   * @tc.name fileIO_test_write_sync_004
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_004', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    const invalidLength = 9999;
    let file;

    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.writeSync(file.fd, FILE_CONTENT, {
        length: invalidLength,
      })
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      console.info('fileIO_test_write_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0500
   * @tc.name fileIO_test_write_sync_005
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_005', 0, function () {
    try {
      fileIO.writeSync(-1, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0600
   * @tc.name fileIO_test_write_sync_006
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_006', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let writeNum = fileIO.writeSync(file.fd, new ArrayBuffer(4096));
      expect(writeNum == 4096).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0000
   * @tc.name fileIO_test_write_async_000
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_write_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_write_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      expect(await fileIO.write(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_write_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0100
   * @tc.name fileIO_test_write_async_001
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let writeNum = await fileIO.write(file.fd, FILE_CONTENT, {
        length: 3,
      });
      expect(writeNum == 3).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0200
   * @tc.name fileIO_test_write_async_002
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let writeNum = await fileIO.write(file.fd, FILE_CONTENT, {
        length: 3,
        offset: 5,
      });
      expect(writeNum == 3).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0300
   * @tc.name fileIO_test_write_async_003
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let writeNum = await fileIO.write(file.fd, FILE_CONTENT, {
        length: 4,
        offset: 5,
        encoding: 'utf-8',
      });
      expect(writeNum == 4).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0400
   * @tc.name fileIO_test_write_async_004
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.write(file.fd, new ArrayBuffer(4096), function (
        error,
        bytesWritten
      ) {
          expect(bytesWritten == 4096).assertTrue();
          fileio.closeSync(file.fd);
          fileio.unlinkSync(fpath);
        }
      );
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0500
   * @tc.name fileIO_test_write_async_005
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.write(
        file.fd,
        FILE_CONTENT,
        {
          length: 5,
        }, function (error, bytesWritten) {
          expect(bytesWritten == 5).assertTrue();
          fileio.closeSync(file.fd);
          fileio.unlinkSync(fpath);
          done();
        }
      );
    } catch (e) {
      console.log('fileIO_test_write_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0600
   * @tc.name fileIO_test_write_async_006
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.write(
        file.fd,
        FILE_CONTENT,
        {
          length: 5,
          offset: 5,
        }, function (error, bytesWritten) {
          expect(bytesWritten == 5).assertTrue();
          fileio.closeSync(file.fd);
          fileio.unlinkSync(fpath);
          done();
        }
      );
    } catch (e) {
      console.log('fileIO_test_write_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0700
   * @tc.name fileIO_test_write_async_007
   * @tc.desc Test write() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.write(
        file.fd,
        FILE_CONTENT,
        {
          length: 5,
          offset: 5,
          encoding: 'utf-8',
        }, function (error, bytesWritten) {
          expect(bytesWritten == 5).assertTrue();
          fileio.closeSync(file.fd);
          fileio.unlinkSync(fpath);
          done();
        }
      );
    } catch (e) {
      console.log('fileIO_test_write_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
