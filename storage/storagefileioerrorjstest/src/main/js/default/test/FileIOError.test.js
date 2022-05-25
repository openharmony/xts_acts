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

import fileio from '@ohos.fileio'
import {
  describe,
  it,
  expect
}
from 'deccjsunit/index'
import {
  FILE_CONTENT,
  prepareFile,
  fileName,
  nextFileName,
  randomString,
  isIntNum,
  isInclude
}
from './Common'

describe('FileIOError', function () {

  /**
   * @tc.number SUB_STORAGE_FileIo_test_error_0000
   * @tc.name fileio_test_error_000
   * @tc.desc Function of API, Delete directories with files
   */
  it('fileio_test_error_000', 0, function () {
    let dpath = fileName('fileio_test_error_000d');
    let fpath = dpath + '/fileio_test_error_000f';
    fileio.mkdirSync(dpath);
    expect(prepareFile(fpath, 'hello')).assertTrue();
    try {
      let fd = fileio.openSync(dpath);
      expect(isIntNum(fd)).assertTrue();
      fileio.rmdirSync(dpath);
    } 
    catch (err) {
      console.log('fileio_test_error_000 has failed for ' + err);
      expect(isInclude(err.message, 'Directory not empty')).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIo_test_error_0100
   * @tc.name fileio_test_error_001
   * @tc.desc Function of API, delete file
   */
  it('fileio_test_error_001', 0, function () {
    let fpath = fileName('fileio_test_error_001f');
    expect(prepareFile(fpath, 'hello')).assertTrue();
    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      fileio.rmdirSync(fpath);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_001 has failed for ' + err);
      expect(isInclude(err.message, 'Not a directory')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIo_test_error_0200
   * @tc.name fileio_test_error_002
   * @tc.desc Function of API, flags=0o102. missing mode parameter.
   */
  it('fileio_test_error_002', 0, function () {
    let fpath = nextFileName('fileio_test_error_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o102);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_002 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0300
   * @tc.name fileio_test_error_003
   * @tc.desc Function of API, flags=0o102, missing mode parameter.
   */
  it('fileio_test_error_003', 0, function () {
    let fpath = nextFileName('fileio_test_error_003');
    try {
      fileio.openSync(fpath, 0o102);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_003 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0400
   * @tc.name fileio_test_error_004
   * @tc.desc Function of API,  flags=0o302. The test file is exist.
   */
  it('fileio_test_error_004', 0, function () {
    let fpath = nextFileName('fileio_test_error_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o302, 0o666);
    } 
    catch (err) {
      console.log('fileio_test_error_004 has failed for ' + err);
      expect(isInclude(err.message, 'File exists')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0500
   * @tc.name fileio_test_error_005
   * @tc.desc Function of API,  flags=0o100002. The test file is exist.
   */
  it('fileio_test_error_005', 0, function () {
    let fpath = nextFileName('fileio_test_error_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o100002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_005 has failed for ' + err);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0600
   * @tc.name fileio_test_error_006
   * @tc.desc Function of API, flags=0o40002 The test file is exist.
   */
  it('fileio_test_error_006', 0, function () {
    let dpath = nextFileName('fileio_test_error_006');
    fileio.mkdirSync(dpath);
    try {
      fileio.openSync(dpath, 0o40002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_006 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
      fileio.rmdirSync(dpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0700
   * @tc.name fileio_test_error_007
   * @tc.desc Function of API, flags=0o400002. The test file is exist.
   */
  it('fileio_test_error_007', 0, function () {
    let fpath = nextFileName('fileio_test_error_007');
    let txt = 'h'
    expect(prepareFile(fpath, txt)).assertTrue();
    try {
      fileio.openSync(fpath, 0o400002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_007 has failed for ' + err);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0800
   * @tc.name fileio_test_error_008
   * @tc.desc Function of API, flags=0o400002. The test file is exist.
   */
  it('fileio_test_error_008', 0, function () {
    let fpath = nextFileName('fileio_test_error_008');
    let txt = randomString(5000);
    expect(prepareFile(fpath, txt)).assertTrue();
    try {
      fileio.openSync(fpath, 0o400002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_008 has failed for ' + err);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_0900
   * @tc.name fileio_test_error_009
   * @tc.desc Function of API, flags=0o10000102. The test file is exist.
   */
  it('fileio_test_error_009', 0, function () {
    let fpath = nextFileName('fileio_test_error_009');
    try {
      fileio.openSync(fpath, 0o10000102);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_009 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_1000
   * @tc.name fileio_test_error_010
   * @tc.desc Function of API, flags=0o200000. Invalid argument.
   */
  it('fileio_test_error_010', 0, function () {
    let dpath = fileName('fileio_test_error_010d');
    fileio.mkdirSync(dpath);
    try {
      fileio.openSync(dpath, 0o200000);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_010 has failed for ' + err);
      expect(isInclude(err.message, 'Invalid argument')).assertTrue();
      fileio.rmdirSync(dpath);
    }
  });

});
