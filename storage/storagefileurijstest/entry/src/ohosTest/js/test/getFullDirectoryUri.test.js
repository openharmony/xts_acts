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

import fileuri from "@ohos.file.fileuri";
import fs from "@ohos.file.fs";
import {
  describe,
  it,
  expect,
  Level
}
from '@ohos/hypium'
  
  export default function filegetFullDirectoryUri_test() {
  describe('file_getFullDirectoryUri_test', function () {
  
  const CONTENT = "Hello World!";
  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0100
   * @tc.name test_Fileuri_GetFullDirectoryUri_Async_001
   * @tc.desc Test getFullDirectoryUri() interface.
   * Retrieve the URI of the current path through the file URI.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_Fileuri_GetFullDirectoryUri_Async_001', Level.LEVEL0, async function () {
    let fpath = '/data/storage/el2/base/haps/test_Fileuri_GetFullDirectoryUri_Async_001';
    fs.openSync(fpath,fs.OpenMode.CREATE|fs.OpenMode.READ_WRITE);
  
    try {
      let fileUriObject = new fileuri.FileUri(fpath);
      let directoryUri = fileUriObject.getFullDirectoryUri();
      expect(directoryUri + '/test_Fileuri_GetFullDirectoryUri_Async_001' == fileUriObject).assertTrue();
    } catch (e) {
      console.log('test_Fileuri_GetFullDirectoryUri_Async_001 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0200
   * @tc.name test_Fileuri_GetFullDirectoryUri_Async_002
   * @tc.desc Test getFullDirectoryUri() interface.
   * Retrieve the URI of the current path through the folder URI.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('test_Fileuri_GetFullDirectoryUri_Async_002', Level.LEVEL0, async function () {
    let dpath = '/data/storage/el2/base/haps/test_Fileuri_GetFullDirectoryUri_Async_002';
    fs.mkdirSync(dpath);
  
    try {
      let fileUriObject = new fileuri.FileUri(dpath);
      let directoryUri = fileUriObject.getFullDirectoryUri();
      expect(directoryUri == fileUriObject).assertTrue()
    } catch (e) {
      console.log('test_Fileuri_GetFullDirectoryUri_Async_002 has failed for ' + e);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0300
   * @tc.name test_Fileuri_GetFullDirectoryUri_Async_003
   * @tc.desc Test getFullDirectoryUri() interface.
   * File does not exist.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_Fileuri_GetFullDirectoryUri_Async_003', Level.LEVEL3, async function () {
    let fpath = '/data/storage/el2/base/haps/entry/files/test_Fileuri_GetFullDirectoryUri_Async_003.txt';

    try {
      let fileUriObject = new fileuri.FileUri(fpath);
      let directoryUri = fileUriObject.getFullDirectoryUri();
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_Fileuri_GetFullDirectoryUri_Async_003 has failed for ' + e);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0400
   * @tc.name test_Fileuri_GetFullDirectoryUri_Async_004
   * @tc.desc Test getFullDirectoryUri() interface. -1
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_Fileuri_GetFullDirectoryUri_Async_004', Level.LEVEL3, async function () {
    let fpath = '/data/storage/el2/base/haps/test_Fileuri_GetFullDirectoryUri_Async_004';
    fs.openSync(fpath,fs.OpenMode.CREATE|fs.OpenMode.READ_WRITE);
  
    try {
      let fileUriObject = new fileuri.FileUri(-1);
      let directoryUri = fileUriObject.getFullDirectoryUri();
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_Fileuri_GetFullDirectoryUri_Async_004 has failed for ' + e);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileUri_getFullDirectory_0500
   * @tc.name test_Fileuri_GetFullDirectoryUri_Async_005
   * @tc.desc Test getFullDirectoryUri() interface. Witout Uri
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_Fileuri_GetFullDirectoryUri_Async_005', Level.LEVEL3, async function () {
    let fpath = '/data/storage/el2/base/haps/fileuri_test_getFullDirectoryUri_async_005';
    fs.openSync(fpath,fs.OpenMode.CREATE|fs.OpenMode.READ_WRITE);
  
    try {
      let fileUriObject = new fileuri.FileUri();
      let directoryUri = fileUriObject.getFullDirectoryUri();
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_Fileuri_GetFullDirectoryUri_Async_005 has failed for ' + e);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
});
}