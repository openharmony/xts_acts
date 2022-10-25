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
    fileio, fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, isBoolean,
    describe, it, expect,
  } from '../Common';

export default function fileIOStat() {
describe('fileIO_fs_stat', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_0000
   * @tc.name fileIO_stat_sync_000
   * @tc.desc Test Stat.statSync() interfaces.
   * This interface shall work properly in normal case.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat !== null).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2 !== null).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_0100
   * @tc.name fileIO_stat_sync_001
   * @tc.desc Test Stat.statSync() interfaces.
   * This interface shall throw an exception when the file isnt's exist.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_001');

    try {
      fileIO.statSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      console.log('fileIO_stat_sync_001 has failed for ' + e.message + ', code: ' + e.code);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_0200
   * @tc.name fileIO_stat_sync_002
   * @tc.desc Test Stat.statSync() interfaces.
   * This interface shall throw an exception when the file isnt's exist.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
   it('fileIO_stat_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_002');

    try {
      fileIO.statSync();
      expect(false).assertTrue();
    } catch (e) {
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      console.log('fileIO_stat_sync_002 has failed for ' + e.message + ', code: ' + e.code);
    }
  });


  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_INO_0000
   * @tc.name fileIO_stat_sync_ino_000
   * @tc.desc Test Stat.statSync_Ino() interfaces.
   * @tc.desc Test the ino member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_ino_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.ino)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.ino)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileIO_stat_sync_ino_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_MODE_0000
   * @tc.name fileIO_stat_sync_mode_000
   * @tc.desc Test Stat.statSync_Mode() interfaces.
   * @tc.desc Test the mode member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_mode_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.mode)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.mode)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileIO_stat_sync_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_UID_0000
   * @tc.name fileIO_stat_sync_uid_000
   * @tc.desc Test  Stat.statSync_Uid() interfaces.
   * @tc.desc Test the uid member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_uid_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.uid)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_GID_0000
   * @tc.name fileIO_stat_sync_gid_000
   * @tc.desc Test Stat.statSync_Gid() interfaces.
   * @tc.desc Test the gid member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_gid_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.gid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.gid)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_gid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_SIZE_0000
   * @tc.name fileIO_stat_sync_size_000
   * @tc.desc Test Stat.statSync_Size() interfaces.
   * @tc.desc Test the size member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_size_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.size)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_BLKSIZE_0000
   * @tc.name fileIO_stat_sync_blksize_000
   * @tc.desc Test Stat.statSync_Blksize() interfaces.
   * @tc.desc Test the blksize member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_blksize_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_blksize_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.blksize)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.blksize)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_blksize_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ATIME_0000
   * @tc.name fileIO_stat_sync_atime_000
   * @tc.desc Test Stat.statSync_Atime() interfaces.
   * @tc.desc Test the atime member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_atime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.atime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.atime)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_atime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_MTIME_0000
   * @tc.name fileIO_stat_sync_mtime_000
   * @tc.desc Test Stat.statSync_Mtime() interfaces.
   * @tc.desc Test the mtime member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_mtime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.mtime)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_CTIME_0000
   * @tc.name fileIO_stat_sync_ctime_000
   * @tc.desc Test Stat.statSync_Ctime() interfaces.
   * @tc.desc Test the ctime member of class Stat
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_ctime_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isIntNum(stat2.ctime)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0000
   * @tc.name fileIO_stat_sync_is_block_device_000
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isBlockDevice())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isBlockDevice())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0100
   * @tc.name fileIO_stat_sync_is_block_device_001
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface shall not treat a normal file as a block special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isBlockDevice() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0200
   * @tc.name fileIO_stat_sync_is_block_device_002
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isBlockDevice(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      console.info('fileIO_stat_sync_is_block_device_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISBLOCKDEVICE_0300
   * @tc.name fileIO_stat_sync_is_block_device_003
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_block_device_003', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_block_device_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;

    try {
      file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isBlockDevice(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      console.info('fileIO_stat_sync_is_block_device_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0000
   * @tc.name fileIO_stat_sync_is_character_device_000
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isCharacterDevice())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isCharacterDevice())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0100
   * @tc.name fileIO_stat_sync_is_character_device_001
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   * This interface shall not treat a normal file as a character special device.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isCharacterDevice() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0200
   * @tc.name fileIO_stat_sync_is_character_device_002
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isCharacterDevice(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISCHARACTER_DEVICE_0300
   * @tc.name fileIO_stat_sync_is_character_device_003
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_character_device_003', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_character_device_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;

    try {
      file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isCharacterDevice(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0000
   * @tc.name fileIO_stat_sync_is_directory_000
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isDirectory())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isDirectory())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0100
   * @tc.name fileIO_stat_sync_is_directory_001
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * This interface shall not treat a normal file as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_directory_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isDirectory() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isDirectory() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0200
   * @tc.name fileIO_stat_sync_is_directory_002
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * This interface shall treat a directory as a directory.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_002', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_directory_002');

    try {
      fileio.mkdirSync(dpath);
      let stat = fileIO.statSync(dpath);
      expect(stat.isDirectory()).assertTrue();

      let file = fileIO.openSync(dpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isDirectory()).assertTrue();
      fileio.closeSync(file.fd);
      fileio.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0300
   * @tc.name fileIO_stat_sync_is_directory_003
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_003', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_directory_003') + 'd';

    try {
      fileio.mkdirSync(dpath);
      let stat = fileIO.statSync(dpath);
      expect(stat.isDirectory(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.rmdirSync(dpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISDIRECTORY_0400
   * @tc.name fileIO_stat_sync_is_directory_004
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_directory_004', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_directory_004') + 'd';
    let file;

    try {
      fileio.mkdirSync(dpath);
      file = fileIO.openSync(dpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isDirectory(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.rmdirSync(dpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0000
   * @tc.name fileIO_stat_sync_is_fifo_000
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isFIFO())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isFIFO())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0100
   * @tc.name fileIO_stat_sync_is_fifo_001
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   * This interface shall not treat a normal file as a FIFO.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isFIFO() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFIFO() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0200
   * @tc.name fileIO_stat_sync_is_fifo_002
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isFile(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFIFO_0300
   * @tc.name fileIO_stat_sync_is_fifo_003
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_fifo_003', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_fifo_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFile(-1) === false).assertTrue();
      fileio.closeSync(file.fd);
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0000
   * @tc.name fileIO_stat_sync_is_file_000
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isFile())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isFile())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0100
   * @tc.name fileIO_stat_sync_is_file_001
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * This interface shall treat a normal file as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_file_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isFile()).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFile()).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0200
   * @tc.name fileIO_stat_sync_is_file_002
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * This interface shall not treat a directory as a normal file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_002', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_file_002');

    try {
      fileio.mkdirSync(dpath);
      let stat = fileIO.statSync(dpath);
      expect(stat.isFile() === false).assertTrue();

      let file = fileIO.openSync(dpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFile() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0300
   * @tc.name fileIO_stat_sync_is_file_003
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_003', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_file_003');

    try {
      fileio.mkdirSync(dpath);
      let stat = fileIO.statSync(dpath);
      expect(stat.isFile(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.rmdirSync(dpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISFILE_0400
   * @tc.name fileIO_stat_sync_is_file_004
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_file_004', 0, async function () {
    let dpath = await nextFileName('fileIO_stat_sync_is_file_004');
    let file;

    try {
      fileio.mkdirSync(dpath);
      file = fileIO.openSync(dpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isFile(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.rmdirSync(dpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0000
   * @tc.name fileIO_stat_sync_is_socket_000
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isSocket())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isSocket())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0100
   * @tc.name fileIO_stat_sync_is_socket_001
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   * This interface shall not treat a file as a socket.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isSocket() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isSocket() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0200
   * @tc.name fileIO_stat_sync_is_socket_002
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isSocket(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSOCKET_0300
   * @tc.name fileIO_stat_sync_is_socket_003
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_socket_003', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_socket_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;

    try {
      file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isSocket(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0000
   * @tc.name fileIO_stat_sync_is_symbolic_link_000
   * @tc.desc Test Stat.statasync_isSymbolicLink() interfaces.
   * This interface shall return a boolean variable.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_000', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isBoolean(stat.isSymbolicLink())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(isBoolean(stat2.isSymbolicLink())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0100
   * @tc.name fileIO_stat_sync_is_symbolic_link_001
   * @tc.desc Test Stat.statasync_isSymbolicLink() interfaces.
   * This interface shall not treat a normal file as a symbolic link.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_001', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isSymbolicLink() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_stat_sync_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0200
   * @tc.name fileIO_stat_sync_is_symbolic_link_002
   * @tc.desc Test Stat.isSymbolicLink() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_002', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(stat.isSymbolicLink(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_ISSYMBOLICLINK_0300
   * @tc.name fileIO_stat_sync_is_symbolic_link_003
   * @tc.desc Test Stat.isSymbolicLink() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_sync_is_symbolic_link_003', 0, async function () {
    let fpath = await nextFileName('fileIO_stat_sync_is_symbolic_link_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file;

    try {
      file = fileIO.openSync(fpath);
      let stat2 = fileIO.statSync(file.fd);
      expect(stat2.isSymbolicLink(-1) === false).assertTrue();
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0000
   * @tc.name fileIO_stat_async_000
   * @tc.desc Test Stat.statAsync() interface.
   * This interface shall work properly in normal case when providing the promise async model.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath).then((stat) => {
        expect(stat !== null).assertTrue();
      });

      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd).then((stat2) => {
        expect(stat2 !== null).assertTrue();
        fileio.closeSync(file.fd);
      });
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0100
   * @tc.name fileIO_stat_async_001
   * @tc.desc Test Stat.statAsync() interface.
   * This interface shall work properly in normal case when providing the callback async model.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.stat(fpath, function (error) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_0200
   * @tc.name fileIO_stat_async_002
   * @tc.desc Test Stat.statAsync() interface.
   * This interface shall work properly in normal case when providing the callback async model.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath);
      fileIO.stat(file.fd, function (error) {
        fileio.closeSync(file.fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_stat_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_INO_0000
   * @tc.name fileIO_stat_async_ino_000
   * @tc.desc Test the ino member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_ino_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.ino)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.ino)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_ino_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_MODE_0000
   * @tc.name fileIO_stat_async_mode_000
   * @tc.desc Test the mode member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_mode_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.mode)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.mode)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_UID_0000
   * @tc.name fileIO_stat_async_uid_000
   * @tc.desc Test the uid member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_uid_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.uid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.uid)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_GID_0000
   * @tc.name fileIO_stat_async_gid_000
   * @tc.desc Test the gid member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_gid_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.gid)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.gid)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_gid_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_SIZE_0000
   * @tc.name fileIO_stat_async_size_000
   * @tc.desc Test the size member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_size_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.size)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ATIME_0000
   * @tc.name fileIO_stat_async_atime_000
   * @tc.desc Test Stat.atime() interface.
   * @tc.desc Test the atime member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_atime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.atime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.atime)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_atime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_MTIME_0000
   * @tc.name fileIO_stat_async_mtime_000
   * @tc.desc Test Stat.mtime() interface.
   * @tc.desc Test the mtime member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_mtime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.mtime)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_CTIME_0000
   * @tc.name fileIO_stat_async_ctime_000
   * @tc.desc Test the ctime member of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_ctime_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isIntNum(stat2.ctime)).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISBLOCKDEVICE_0000
   * @tc.name fileIO_stat_async_is_block_device_000
   * @tc.desc Test the isBlockDevice method of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_block_device_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isBlockDevice())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isBlockDevice())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISBLOCKDEVICE_0100
   * @tc.name fileIO_stat_async_is_block_device_001
   * @tc.desc Test the isBlockDevice method of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_block_device_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isBlockDevice() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISCHARACTERDEVICE_0000
   * @tc.name fileIO_stat_async_is_character_device_000
   * @tc.desc Test the isCharacterDevice method of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_character_device_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isCharacterDevice())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isCharacterDevice())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISCHARACTERDEVICE_0100
   * @tc.name fileIO_stat_async_is_character_device_001
   * @tc.desc Test the isCharacterDevice method of class Stat.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_character_device_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isCharacterDevice() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0000
   * @tc.name fileIO_stat_async_is_directory_000
   * @tc.desc Test Stat.isDirectory() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_directory_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isDirectory())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isDirectory())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0100
   * @tc.name fileIO_stat_async_is_directory_001
   * @tc.desc Test Stat.isDirectory() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_directory_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_directory_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isDirectory() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isDirectory() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISDIRECTORY_0200
   * @tc.name fileIO_stat_async_is_directory_002
   * @tc.desc Test Stat.isDirectory() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_directory_002', 0, async function (done) {
    let dpath = await nextFileName('fileIO_stat_async_is_directory_002') + 'd';

    try {
      fileio.mkdirSync(dpath);
      let stat = await fileIO.stat(dpath);
      expect(stat.isDirectory()).assertTrue();

      let file = fileIO.openSync(dpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isDirectory()).assertTrue();
      fileio.closeSync(file.fd);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFIFO_0000
   * @tc.name fileIO_stat_async_is_fifo_000
   * @tc.desc Test Stat.isFIFO() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_fifo_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isFIFO())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isFIFO())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFIFO_0100
   * @tc.name fileIO_stat_async_is_fifo_001
   * @tc.desc Test Stat.isFIFO() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_fifo_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isFIFO() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isFIFO() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0000
   * @tc.name fileIO_stat_async_is_file_000
   * @tc.desc Test Stat.isFile() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_file_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_file_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isFile())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isFile())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0100
   * @tc.name fileIO_stat_async_is_file_001
   * @tc.desc Test Stat.isFile() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_file_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_file_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isFile()).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isFile()).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISFILE_0200
   * @tc.name fileIO_stat_async_is_file_002
   * @tc.desc Test Stat.isFile() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_file_002', 0, async function (done) {
    let dpath = await nextFileName('fileIO_stat_async_is_file_002');

    try {
      fileio.mkdirSync(dpath);
      let stat = await fileIO.stat(dpath);
      expect(stat.isFile() === false).assertTrue();

      let file = fileIO.openSync(dpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isFile() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSOCKET_0000
   * @tc.name fileIO_stat_async_is_socket_000
   * @tc.desc Test Stat.isSocket() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_socket_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isSocket())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isSocket())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSOCKET_0100
   * @tc.name fileIO_stat_async_is_socket_001
   * @tc.desc Test Stat.isSocket() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_socket_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isSocket() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isSocket() === false).assertTrue();
      fileio.closeSync(file.fd);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSYMBOLICLINK_0000
   * @tc.name fileIO_stat_async_is_symbolic_link_000
   * @tc.desc Test Stat.isSymbolicLink() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_symbolic_link_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(isBoolean(stat.isSymbolicLink())).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(isBoolean(stat2.isSymbolicLink())).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_ASYNC_ISSYMBOLICLINK_0100
   * @tc.name fileIO_stat_async_is_symbolic_link_001
   * @tc.desc Test Stat.isSymbolicLink() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_stat_async_is_symbolic_link_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_stat_async_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileIO.stat(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();

      let file = fileIO.openSync(fpath);
      let stat2 = await fileIO.stat(file.fd);
      expect(stat2.isSymbolicLink() === false).assertTrue();
      fileio.closeSync(file.fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_stat_async_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_APPEND_FILE_SYNC_0000
   * @tc.name fileIO_stat_sync_append_file_sync_000
   * @tc.desc Test Stat.statSync() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_append_file_sync_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_append_file_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileIO.statSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let file = fileIO.openSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      expect(fileIO.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);

      stat = fileIO.statSync(fpath);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_append_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.number SUB_DF_FILEIO_STAT_SYNC_APPEND_FILE_SYNC_0100
   * @tc.name fileIO_stat_sync_append_file_sync_001
   * @tc.desc Test Stat.statSync() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_append_file_sync_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_append_file_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
      let stat = fileIO.statSync(file.fd);
      expect(isIntNum(stat.size)).assertTrue();
      expect(isIntNum(file.fd)).assertTrue();
      expect(fileIO.writeSync(file.fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fileio.closeSync(file.fd);

      let file2 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      stat = fileIO.statSync(file2.fd);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      fileio.closeSync(file2.fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_append_file_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
    done();
  });
});
}
