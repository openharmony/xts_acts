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
   * @tc.number SUB_STORAGE_FileIo_test_error_0900
   * @tc.name FileIo_test_error_009
   * @tc.desc Function of API, Delete directories with files
   */
  it('FileIo_test_error_009', 0, function () {
    let dpath = fileName('fileio_test_error_009d');
    let fpath = dpath + '/fileio_test_error_009f';
    fileio.mkdirSync(dpath);
    expect(prepareFile(fpath, 'hello')).assertTrue();
    try {
      let fd = fileio.openSync(dpath);
      expect(isIntNum(fd)).assertTrue();
      fileio.rmdirSync(dpath);
    } 
    catch (err) {
      console.log('fileio_test_error_009 has failed for ' + err);
      expect(isInclude(err.message, 'Directory not empty')).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIo_test_error_1000
   * @tc.name FileIo_test_error_010
   * @tc.desc Function of API, delete file
   */
  it('FileIo_test_error_010', 0, function () {
    let fpath = fileName('fileio_test_error_010f');
    expect(prepareFile(fpath, 'hello')).assertTrue();
    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      fileio.rmdirSync(fpath);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('fileio_test_error_010 has failed for ' + err);
      expect(isInclude(err.message, 'Not a directory')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIo_test_error_1100
   * @tc.name FileIo_test_error_011
   * @tc.desc Function of API, Pass in a
   * path that exceeds 4096 bytes to copy the file
   */
  it('FileIo_test_error_011', 0, function () {
    let fpath = nextFileName('FileIo_test_error_011');
    let fd = fileio.openSync(fpath, 0o102, 0o777);
    expect(isIntNum(fd)).assertTrue();
    let dpath = nextFileName('fileio_error_011d');
    fileio.mkdirSync(dpath);
    try {
      for (let i = 0; i < 17; i++) {
        if (i == 16) {
          let fpathTarget = dpath + '/f' + randomString(248);
          fileio.copyFileSync(fpath, fpathTarget);
          expect(null).assertFail();
        } else {
          dpath = dpath + '/d' + randomString(248);
          fileio.mkdirSync(dpath);
        }
      }
    } 
    catch (err) {
      console.log('FileIo_test_error_011 has failed for ' + err);
      expect(isInclude(err.message, 'Filename too long')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIo_test_error_1200
   * @tc.name FileIo_test_error_012
   * @tc.desc Function of API, flags=0o102. missing mode parameter.
   */
  it('FileIo_test_error_012', 0, function () {
    let fpath = nextFileName('FileIo_test_error_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o102);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_012 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_1300
   * @tc.name FileIo_test_error_013
   * @tc.desc Function of API, flags=0o102, missing mode parameter.
   */
  it('FileIo_test_error_013', 0, function () {
    let fpath = nextFileName('FileIo_test_error_013');
    try {
      fileio.openSync(fpath, 0o102);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_013 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_1500
   * @tc.name FileIo_test_error_015
   * @tc.desc Function of API,  flags=0o302. The test file is exist.
   */
  it('FileIo_test_error_015', 0, function () {
    let fpath = nextFileName('FileIo_test_error_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o302, 0o666);
    } 
    catch (err) {
      console.log('FileIo_test_error_015 has failed for ' + err);
      expect(isInclude(err.message, 'File exists')).assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_1600
   * @tc.name FileIo_test_error_016
   * @tc.desc Function of API,  flags=0o100002. The test file is exist.
   */
  it('FileIo_test_error_016', 0, function () {
    let fpath = nextFileName('FileIo_test_error_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.openSync(fpath, 0o100002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_016 has failed for ' + err);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_1700
   * @tc.name FileIo_test_error_017
   * @tc.desc Function of API, flags=0o40002 The test file is exist.
   */
  it('FileIo_test_error_017', 0, function () {
    let dpath = nextFileName('FileIo_test_error_017');
    fileio.mkdirSync(dpath);
    try {
      fileio.openSync(dpath, 0o40002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_017 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
      fileio.rmdirSync(dpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_1900
   * @tc.name FileIo_test_error_019
   * @tc.desc Function of API, flags=0o400002. The test file is exist.
   */
  it('FileIo_test_error_019', 0, function () {
    let fpath = nextFileName('FileIo_test_error_019');
    let txt = 'h'
    expect(prepareFile(fpath, txt)).assertTrue();
    try {
      fileio.openSync(fpath, 0o400002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_019 has failed for ' + err);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_2000
   * @tc.name FileIo_test_error_020
   * @tc.desc Function of API, flags=0o400002. The test file is exist.
   */
  it('FileIo_test_error_020', 0, function () {
    let fpath = nextFileName('FileIo_test_error_020');
    let txt = randomString(5000);
    expect(prepareFile(fpath, txt)).assertTrue();
    try {
      fileio.openSync(fpath, 0o400002);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_020 has failed for ' + err);
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_2100
   * @tc.name FileIo_test_error_021
   * @tc.desc Function of API, flags=0o10000102. The test file is exist.
   */
  it('FileIo_test_error_021', 0, function () {
    let fpath = nextFileName('FileIo_test_error_021');
    try {
      fileio.openSync(fpath, 0o10000102);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_021 has failed for ' + err);
      expect(isInclude(err.message, 'called with O_CREAT/O_TMPFILE but no mode')).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_OpenSync_2300
   * @tc.name FileIo_test_error_023
   * @tc.desc Function of API, flags=0o200000. Invalid argument.
   */
  it('FileIo_test_error_023', 0, function () {
    let dpath = fileName('FileIo_test_error_023d');
    fileio.mkdirSync(dpath);
    try {
      fileio.openSync(dpath, 0o200000);
      expect(null).assertFail();
    } 
    catch (err) {
      console.log('FileIo_test_error_023 has failed for ' + err);
      expect(isInclude(err.message, 'Invalid argument')).assertTrue();
      fileio.rmdirSync(dpath);
    }
  });

});
