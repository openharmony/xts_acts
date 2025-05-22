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
    fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, prepare200MFile
  } from '../Common';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';
import { TestType, Size, Level } from '@ohos/hypium';
const CONTENT = 'hello!!!';

export function prepare2GFile(fpath) {
  try {
    let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE)
    fileIO.truncateSync(file.fd)
    let bf = new ArrayBuffer(1024 * 1024 * 20);
    for (let i = 0; i < 100; i++) {
      let offset = bf.byteLength * i;
      let writeLen = fileIO.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
    }
    fileIO.fsyncSync(file.fd)
    fileIO.closeSync(file)
    return true
  }
  catch (e) {
    console.log('Failed to prepare200MFile for ' + e)
    return false
  }
}

export default function fileIOCopy() {
describe('fileIO_fs_copy', function () {

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0100
   * @tc.name fileIO_copy_async_001
   * @tc.desc Test copy() interfaces.Promise.
   * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */  
  it('fileIO_copy_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_001');
    let fpathTarget = await nextFileName('dst');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }
    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal, options);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue(); 
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0200
   * @tc.name fileIO_copy_async_002
   * @tc.desc Test copy() interfaces.Promise.
   * Test file copied successfully by path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */  
  it('fileIO_copy_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_002');
    let fpathTarget = fpath + 'dst';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpathTarget, CONTENT)).assertTrue();
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue(); 
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0300
   * @tc.name fileIO_copy_async_003
   * @tc.desc Test copy() interfaces.Promise.
   * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('fileIO_copy_async_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_003');
    let fpathTarget = fpath + 'dst';
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }

    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal, options);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0400
   * @tc.name fileIO_copy_async_004
   * @tc.desc Test copy() interfaces.Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('fileIO_copy_async_004', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_004');
    let fpathTarget = fpath + 'dst';
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0500
   * @tc.name fileIO_copy_async_005
   * @tc.desc Test copy() interfaces.Promise.
   * Missing Parameter.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
   it('fileIO_copy_async_005', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_005');
    let fpathTarget = fpath + 'dst';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }
    try {
      await fileIO.copy(srcDirUriLocal, options);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0600
   * @tc.name fileIO_copy_async_006
   * @tc.desc Test copy() interfaces.Promise.
   * Missing Parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('fileIO_copy_async_006', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_006');
    let fpathTarget = fpath + 'dst';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);

    try {
      await fileIO.copy(srcDirUriLocal);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0700
   * @tc.name fileIO_copy_async_007
   * @tc.desc Test copy() interfaces.callback.
   * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_copy_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_007');
    let destpath = fpath + 'dest';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
 
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_007 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(destpath);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(destpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0800
   * @tc.name fileIO_copy_async_008
   * @tc.desc Test copy() interfaces.
   * Test file copied successfully by path.callback without options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_copy_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_008');
    let destpath = fpath + 'dest';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
  
    try {
      fileIO.copy(srcDirUri, dstDirUri, (err) => {
        if (err) {
          console.log('fileIO_copy_async_008 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(destpath);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(destpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0900
   * @tc.name fileIO_copy_async_009
   * @tc.desc Test copy() interfaces.callback.
   * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_009', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_009');
    let destpath = fpath + 'dest';
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_009 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1000
   * @tc.name fileIO_copy_async_010
   * @tc.desc Test copy() interfaces.callback.
   * Missing Parameter.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_010', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_010');
    let destpath = fpath + 'dest';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, options, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_copy_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1100
   * @tc.name fileIO_copy_async_011
   * @tc.desc Test copy() interfaces.callback
   * Test directory copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_011', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_011';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_011 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let result1 = fileIO.listFileSync(ddpath);
        let result2 = fileIO.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1200
   * @tc.name fileIO_copy_async_012
   * @tc.desc Test copy() interfaces.
   * Test directory copied successfully by path.callback without options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_012', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_012';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
  
    try {
      fileIO.copy(srcDirUri, dstDirUri, (err) => {
        if (err) {
          console.log('fileIO_copy_async_012 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let result1 = fileIO.listFileSync(ddpath);
        let result2 = fileIO.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1300
   * @tc.name fileIO_copy_async_013
   * @tc.desc Test copy() interfaces.Promise.
   * Test directory copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_copy_async_013', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_013';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      await fileIO.copy(srcDirUri, dstDirUri, options);
      let result1 = fileIO.listFileSync(ddpath);
      let result2 = fileIO.listFileSync(dmpath);
      expect(result1.length == result2.length).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_copy_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1400
   * @tc.name fileIO_copy_async_014
   * @tc.desc Test copy() interfaces.
   * Test directory copied successfully by path.Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_014', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_014';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
    try {
      await fileIO.copy(srcDirUri, dstDirUri);
      let result1 = fileIO.listFileSync(ddpath);
      let result2 = fileIO.listFileSync(dmpath);
      expect(result1.length == result2.length).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_copy_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1500
   * @tc.name fileIO_copy_async_015
   * @tc.desc Test copy() interfaces.
   * Test file copied successfully by path.Promise without CopyOptions, TaskSignal.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_015', Level.LEVEL3, async function (done) {
   let fpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_015';
   let destpath = fpath + 'dest';
   expect(prepare2GFile(fpath)).assertTrue();
   let srcDirUri = fileUri.getUriFromPath(fpath);
   let dstDirUri = fileUri.getUriFromPath(destpath);
   let copySignal = new fs.TaskSignal;
   copySignal.onCancel();
   let stat1 = fileIO.statSync(fpath);
   console.log('fileIO_copy_async_015 stat1: ' + stat1.size);
   let progressListener = (progress) => {
     console.info(`progressSize15: ${progress.processedSize}, totalSize15: ${progress.totalSize}`);
     if (progress.processedSize / progress.totalSize > 0.1) {
       copySignal.cancel();
     }
   }; 

   let options = {
     "progressListener" : progressListener,
     "copySignal" : copySignal,
   };
   try {
     await fs.copy(srcDirUri, dstDirUri, options);
     expect(false).assertTrue();
     
   } catch (e) {
     console.log('fileIO_copy_async_015 has failed for ' + e.message + ', code: ' + e.code);
     let stat2 = fileIO.statSync(destpath);
     console.log('fileIO_copy_async_015 stat2: ' + stat2.size);
     expect(stat2.size < stat1.size).assertTrue();
     expect(e.code == 13900049 && e.message == 'Operation canceled').assertTrue();
     done();
   }
  }); 

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1600
   * @tc.name fileIO_copy_async_016
   * @tc.desc Test copy() interfaces.
   * Test file copied successfully by path.callback without CopyOptions, TaskSignal.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_016', Level.LEVEL3, async function (done) {
    let fpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_016';
    let destpath = fpath + 'dest';
    expect(prepare2GFile(fpath)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
    let copySignal = new fs.TaskSignal;
    copySignal.onCancel();
    let stat1 = fileIO.statSync(fpath);
    console.log('fileIO_copy_async_016 stat1: ' + stat1.size);
    let progressListener = (progress) => {
      console.info(`progressSize16: ${progress.processedSize}, totalSize16: ${progress.totalSize}`);
      if (progress.processedSize / progress.totalSize > 0.1) {
        copySignal.cancel();
      }
    }; 
 
    let options = {
      "progressListener" : progressListener,
      "copySignal" : copySignal,
    };
    try {
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_016 error package: ' + JSON.stringify(err));
          let stat2 = fileIO.statSync(destpath);
          console.log('fileIO_copy_async_016 stat2: ' + stat2.size);
          expect(err.code == 13900049 && err.message == 'Operation canceled').assertTrue();
          expect(stat2.size < stat1.size).assertTrue();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1700
   * @tc.name fileIO_copy_async_017
   * @tc.desc Test copy() interfaces.
   * The input parameter is invalid.callback without options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_copy_async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = 1;
  
    try {
      fileIO.copy(srcDirUri, dstDirUri, (err) => {
        if (err) {
          console.log('fileIO_copy_async_017 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_copy_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1800
   * @tc.name fileIO_copy_async_018
   * @tc.desc Test copy() interfaces.
   * Invalid argument.callback without options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_copy_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_018');
    let destpath = fpath + 'dest';
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
  
    try {
      fileIO.copy(srcDirUri, dstDirUri, (err) => {
        if (err) {
          console.log('fileIO_copy_async_018 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}