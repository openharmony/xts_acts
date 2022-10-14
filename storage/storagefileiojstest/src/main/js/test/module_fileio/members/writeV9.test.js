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
// import fileIO from '@ohos.file.fs';
import {
  fileio, fileIO, FILE_CONTENT, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';

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

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      expect(fileIO.writeSync(fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0010
   * @tc.name fileIO_test_write_sync_001
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_001');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      expect(
        fileIO.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
        })
        == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });


  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0020
   * @tc.name fileIO_test_write_sync_002
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_002');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      expect(
        fileIO.writeSync(fd, FILE_CONTENT, {
          length: FILE_CONTENT.length - 1,
        })
        == FILE_CONTENT.length - 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0030
   * @tc.name fileIO_test_write_sync_003
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_003');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      expect(
        fileIO.writeSync(fd, FILE_CONTENT, {
          length: 1,
        })
        == 1).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0040
   * @tc.name fileIO_test_write_sync_004
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_004', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_004');
    let fd = fileio.openSync(fpath, 0o102, 0o664);
    expect(isIntNum(fd)).assertTrue();
    const invalidLength = 9999;

    try {
      fileIO.writeSync(fd, FILE_CONTENT, {
        length: invalidLength,
      })
      expect(null).assertFail();
    } catch (e) {
      console.info('fileIO_test_write_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0050
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
      expect(null).assertFail();
    } catch (e) {
      console.log('fileIO_test_write_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0060
   * @tc.name fileIO_test_write_sync_006
   * @tc.desc Test writeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_sync_006', 0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_006');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      let writeNum = fileIO.writeSync(fd, new ArrayBuffer(4096));
      expect(writeNum == 4096).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0000
   * @tc.name fileIO_test_write_async_000
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_write_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_write_async_000');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      expect(await fileIO.write(fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_write_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0010
   * @tc.name fileIO_test_write_async_001
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_001');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      let writeNum = await fileIO.write(fd, FILE_CONTENT, {
        length: 3,
      });
      expect(writeNum == 3).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0020
   * @tc.name fileIO_test_write_async_002
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_002');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      let writeNum = await fileIO.write(fd, FILE_CONTENT, {
        length: 3,
        offset: 5,
      });
      expect(writeNum == 3).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0030
   * @tc.name fileIO_test_write_async_003
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_003');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      let writeNum = await fileIO.write(fd, FILE_CONTENT, {
        length: 4,
        offset: 5,
        encoding: 'utf-8',
      });
      expect(writeNum == 4).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0040
   * @tc.name fileIO_test_write_async_004
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_004');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      await fileIO.write(fd, new ArrayBuffer(4096), function (
          error,
          bytesWritten
      ) {
        expect(bytesWritten == 4096).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      });
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0050
   * @tc.name fileIO_test_write_async_005
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_005');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      await fileIO.write(
        fd,
        FILE_CONTENT,
        {
          length: 5,
        }, function (error, bytesWritten) {
        expect(bytesWritten == 5).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      }
      );
    } catch (e) {
      console.log('fileIO_test_write_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0060
   * @tc.name fileIO_test_write_async_006
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_006');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      await fileIO.write(
        fd,
        FILE_CONTENT,
        {
          length: 5,
          offset: 5,
        }, function (error, bytesWritten) {
        expect(bytesWritten == 5).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      }
      );
    } catch (e) {
      console.log('fileIO_test_write_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0070
   * @tc.name fileIO_test_write_async_007
   * @tc.desc Test writeAsync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_write_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_007');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o664);
      expect(isIntNum(fd)).assertTrue();
      await fileIO.write(
        fd,
        FILE_CONTENT,
        {
          length: 5,
          offset: 5,
          encoding: 'utf-8',
        }, function (error, bytesWritten) {
        expect(bytesWritten == 5).assertTrue();
        expect(fileio.closeSync(fd) == null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      }
      );
    } catch (e) {
      console.log('fileIO_test_write_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(null).assertFail();
    }
  });

});
}

