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

import {
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum, isBoolean,
  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,
} from '../../Common';

describe('fileio_stat', function () {

  /**
   * @tc.number SUB_DF_FileIO_statSync_0000
   * @tc.name fileio_stat_sync_000
   * @tc.desc Test Stat.statSync() interfaces.
   * This interface shall work properly in normal case.
   */
  it('fileio_stat_sync_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat !== null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_statSync_0010
   * @tc.name fileio_stat_sync_001
   * @tc.desc Test Stat.statSync() interfaces.
   * This interface shall throw an exception when the file isnt's exist.
   */
  it('fileio_stat_sync_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_001');

    try {
      fileio.statSync(fpath);
      expect(null).assertFail();
    } catch (e) {
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_Stat_Sync_Dev_0000
   * @tc.name fileio_stat_sync_dev_000
   * @tc.desc Test Stat.statSync_Dev() interfaces.
   * @tc.desc Test the dev member of class Stat.
   */
  it('fileio_stat_sync_dev_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_dev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.dev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_dev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_Stat_Ino_0000
   * @tc.name fileio_stat_sync_ino_000
   * @tc.desc Test  Stat.statSync_Ino() interfaces.
   * @tc.desc Test the ino member of class Stat
   */
  it('fileio_stat_sync_ino_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.ino)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_ino_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_Stat_Mode_0000
   * @tc.name fileio_stat_sync_mode_000
   * @tc.desc Test  Stat.statSync_Mode() interfaces.
   * @tc.desc Test the mode member of class Stat
   */
  it('fileio_stat_sync_mode_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.mode)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_mode_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_Stat_Nlink_0000
   * @tc.name fileio_stat_sync_nlink_000
   * @tc.desc Test  Stat.statSync_Nlink() interfaces.
   * @tc.desc Test the nlink member of class Stat
   */
  it('fileio_stat_sync_nlink_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_nlink_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.nlink)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_nlink_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_Stat_Uid_0000
   * @tc.name fileio_stat_sync_uid_000
   * @tc.desc Test  Stat.statSync_Uid() interfaces.
   * @tc.desc Test the uid member of class Stat
   */
  it('fileio_stat_sync_uid_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_uid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Gid_0000
   * @tc.name fileio_stat_sync_gid_000
   * @tc.desc Test Stat.statSync_Gid() interfaces.
   * @tc.desc Test the gid member of class Stat
   */
  it('fileio_stat_sync_gid_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.gid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_gid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Rdev_0000
   * @tc.name fileio_stat_sync_rdev_000
   * @tc.desc Test Stat.statSync_Rdev() interfaces.
   * @tc.desc Test the rdev member of class Stat
   */
  it('fileio_stat_sync_rdev_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_rdev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.rdev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_rdev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Size_0000
   * @tc.name fileio_stat_sync_size_000
   * @tc.desc Test Stat.statSync_Size() interfaces.
   * @tc.desc Test the size member of class Stat
   */
  it('fileio_stat_sync_size_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_size_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Blocks_0000
   * @tc.name fileio_stat_sync_blocks_000
   * @tc.desc Test Stat.statSync_Block() interfaces.
   * @tc.desc Test the blocks member of class Stat
   */
  it('fileio_stat_sync_blocks_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_blocks_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.blocks)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_blocks_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Atime_0000
   * @tc.name fileio_stat_sync_atime_000
   * @tc.desc Test Stat.statSync_Atime() interfaces.
   * @tc.desc Test the atime member of class Stat
   */
  it('fileio_stat_sync_atime_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.atime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_atime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Mtime_0000
   * @tc.name fileio_stat_sync_mtime_000
   * @tc.desc Test Stat.statSync_Mtime() interfaces.
   * @tc.desc Test the mtime member of class Stat
   */
  it('fileio_stat_sync_mtime_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_mtime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_Ctime_0000
   * @tc.name fileio_stat_sync_ctime_000
   * @tc.desc Test Stat.statSync_Ctime() interfaces.
   * @tc.desc Test the ctime member of class Stat
   */
  it('fileio_stat_sync_ctime_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_ctime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsBlockDevice_0000
   * @tc.name fileio_stat_sync_is_block_device_000
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_block_device_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isBlockDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_block_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsBlockDevice_0010
   * @tc.name fileio_stat_sync_is_block_device_001
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   * This interface shall not treat a normal file as a block special device.
   */
  it('fileio_stat_sync_is_block_device_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_block_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsBlockDevice_0020
   * @tc.name fileio_stat_sync_is_block_device_002
   * @tc.desc Test Stat.statSync_IsBlockDevice() interfaces.
   * @tc.desc Test the isBlockDevice() method of class Stat.
   */
  it('fileio_stat_sync_is_block_device_002', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_block_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isBlockDevice(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsCharacterDevice_0000
   * @tc.name fileio_stat_sync_is_character_device_000
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_character_device_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isCharacterDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_character_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsCharacterDevice_0010
   * @tc.name fileio_stat_sync_is_character_device_001
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   * This interface shall not treat a normal file as a character special device.
   */
  it('fileio_stat_sync_is_character_device_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_character_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsCharacterDevice_0020
   * @tc.name fileio_stat_sync_is_character_device_002
   * @tc.desc Test Stat.statsync_IsCharacterDevice() interfaces.
   */
  it('fileio_stat_sync_is_character_device_002', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_character_device_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isCharacterDevice(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsDirectory_0000
   * @tc.name fileio_stat_sync_is_directory_000
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_directory_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isDirectory())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_directory_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsDirectory_0010
   * @tc.name fileio_stat_sync_is_directory_001
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * This interface shall not treat a normal file as a directory.
   */
  it('fileio_stat_sync_is_directory_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_directory_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isDirectory() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_directory_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsDirectory_0020
   * @tc.name fileio_stat_sync_is_directory_002
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   * This interface shall treat a directory as a directory.
   */
  it('fileio_stat_sync_is_directory_002', 0, function () {
    let dpath = nextFileName('fileio_stat_sync_is_directory_002') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.statSync(dpath);
      expect(stat.isDirectory()).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_directory_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsDirectory_0030
   * @tc.name fileio_stat_sync_is_directory_003
   * @tc.desc Test Stat.statsync_isDirectory() interfaces.
   */
  it('fileio_stat_sync_is_directory_003', 0, function () {
    let dpath = nextFileName('fileio_stat_sync_is_directory_003') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.statSync(dpath);
      expect(stat.isDirectory(-1)).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFIFO_0000
   * @tc.name fileio_stat_sync_is_fifo_000
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_fifo_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isFIFO())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_fifo_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFIFO_0010
   * @tc.name fileio_stat_sync_is_fifo_001
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   * This interface shall not treat a normal file as a FIFO.
   */
  it('fileio_stat_sync_is_fifo_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isFIFO() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_fifo_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFIFO_0020
   * @tc.name fileio_stat_sync_is_fifo_002
   * @tc.desc Test Stat.statsync_isFIFO() interfaces.
   */
  it('fileio_stat_sync_is_fifo_002', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_fifo_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isFIFO(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFILE_0000
   * @tc.name fileio_stat_sync_is_file_000
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_file_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_file_000');
    expect(isBoolean(prepareFile(fpath, FILE_CONTENT))).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isFile())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_file_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFILE_0010
   * @tc.name fileio_stat_sync_is_file_001
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * This interface shall treat a normal file as a normal file.
   */
  it('fileio_stat_sync_is_file_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_file_001');
    expect(isBoolean(prepareFile(fpath, FILE_CONTENT))).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isFile()).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_file_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFILE_0020
   * @tc.name fileio_stat_sync_is_file_002
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   * This interface shall not treat a directory as a normal file.
   */
  it('fileio_stat_sync_is_file_002', 0, function () {
    let dpath = nextFileName('fileio_stat_sync_is_file_002');

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.statSync(dpath);
      expect(stat.isFile() === false).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_file_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsFILE_0030
   * @tc.name fileio_stat_sync_is_file_003
   * @tc.desc Test Stat.statsync_isFile() interfaces.
   */
  it('fileio_stat_sync_is_file_003', 0, function () {
    let dpath = nextFileName('fileio_stat_sync_is_file_003');

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = fileio.statSync(dpath);
      expect(stat.isFile(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsSocket_0000
   * @tc.name fileio_stat_sync_is_socket_000
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_socket_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isSocket())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_socket_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsSocket_0010
   * @tc.name fileio_stat_sync_is_socket_001
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   * This interface shall not treat a file as a socket.
   */
  it('fileio_stat_sync_is_socket_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isSocket() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_socket_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsSocket_0020
   * @tc.name fileio_stat_sync_is_socket_002
   * @tc.desc Test Stat.statsync_isSocket() interfaces.
   */
  it('fileio_stat_sync_is_socket_002', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_socket_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isSocket(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsSymbolicLink_0000
   * @tc.name fileio_stat_sync_is_symbolic_link_000
   * @tc.desc Test Stat.statasync_isSymbolicLink() interfaces.
   * This interface shall return a boolean variable.
   */
  it('fileio_stat_sync_is_symbolic_link_000', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isBoolean(stat.isSymbolicLink())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_sync_is_symbolic_link_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsSymbolicLink_0010
   * @tc.name fileio_stat_sync_is_symbolic_link_001
   * @tc.desc Test Stat.statasync_isSymbolicLink() interfaces.
   * This interface shall not treat a normal file as a symbolic link.
   */
  it('fileio_stat_sync_is_symbolic_link_001', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_stat_is_symbolic_link_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatSync_IsSymbolicLink_0020
   * @tc.name fileio_stat_sync_is_symbolic_link_002
   * @tc.desc Test Stat.isSymbolicLink() interfaces.
   */
  it('fileio_stat_sync_is_symbolic_link_002', 0, function () {
    let fpath = nextFileName('fileio_stat_sync_is_symbolic_link_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(stat.isSymbolicLink(-1) === false).assertTrue();
      expect(null).assertFail();
    } catch (e) {
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_statAsync_0000
   * @tc.name fileio_stat_async_000
   * @tc.desc Test Stat.statAsync() interface.
   * This interface shall work properly in normal case when providing the promise async model.
   */
  it('fileio_stat_async_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.stat(fpath).then((stat) => {
        expect(stat !== null).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      });
      done();
    } catch (e) {
      console.log('fileio_stat_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_statAsync_0000
   * @tc.name fileio_stat_async_001
   * @tc.desc Test Stat.statAsync() interface.
   * This interface shall work properly in normal case when providing the callback async model.
   */
  it('fileio_stat_async_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.stat(fpath, function (error) {
        expect(!error).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_stat_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Dev_0000
   * @tc.name fileio_stat_async_dev_000
   * @tc.desc Test the dev member of class Stat.
   */
  it('fileio_stat_async_dev_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_dev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.dev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_dev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Ino_0000
   * @tc.name fileio_stat_async_ino_000
   * @tc.desc Test the ino member of class Stat.
   */
  it('fileio_stat_async_ino_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_ino_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.ino)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_ino_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Mode_0000
   * @tc.name fileio_stat_async_mode_000
   * @tc.desc Test the mode member of class Stat.
   */
  it('fileio_stat_async_mode_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_mode_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.mode)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_mode_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Nlink_0000
   * @tc.name fileio_stat_async_nlink_000
   * @tc.desc Test the nlink member of class Stat.
   */
  it('fileio_stat_async_nlink_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_nlink_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.nlink)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_nlink_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Uid_0000
   * @tc.name fileio_stat_async_uid_000
   * @tc.desc Test the uid member of class Stat.
   */
  it('fileio_stat_async_uid_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_uid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_uid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Gid_0000
   * @tc.name fileio_stat_async_gid_000
   * @tc.desc Test the gid member of class Stat.
   */
  it('fileio_stat_async_gid_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_gid_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.gid)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_gid_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Rdev_0000
   * @tc.name fileio_stat_async_rdev_000
   * @tc.desc Test the rdev member of class Stat.
   */
  it('fileio_stat_async_rdev_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_rdev_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.rdev)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_rdev_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Size_0000
   * @tc.name fileio_stat_async_size_000
   * @tc.desc Test the size member of class Stat.
   */
  it('fileio_stat_async_size_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_size_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.size)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_size_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Blocks_0000
   * @tc.name fileio_stat_async_blocks_000
   * @tc.desc Test Stat.blocks() interface.
   * @tc.desc Test the blocks member of class Stat.
   */
  it('fileio_stat_async_blocks_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_blocks_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.blocks)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_blocks_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Atime_0000
   * @tc.name fileio_stat_async_atime_000
   * @tc.desc Test Stat.atime() interface.
   * @tc.desc Test the atime member of class Stat.
   */
  it('fileio_stat_async_atime_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_atime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.atime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_atime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Mtime_0000
   * @tc.name fileio_stat_async_mtime_000
   * @tc.desc Test Stat.mtime() interface.
   * @tc.desc Test the mtime member of class Stat.
   */
  it('fileio_stat_async_mtime_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_mtime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.mtime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_mtime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_Ctime_0000
   * @tc.name fileio_stat_async_ctime_000
   * @tc.desc Test the ctime member of class Stat.
   */
  it('fileio_stat_async_ctime_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_ctime_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isIntNum(stat.ctime)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_ctime_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsBlockDevice_0000
   * @tc.name fileio_stat_async_is_block_device_000
   * @tc.desc Test the isBlockDevice method of class Stat.
   */
  it('fileio_stat_async_is_block_device_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_block_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isBlockDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_block_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsBlockDevice_0010
   * @tc.name fileio_stat_async_is_block_device_001
   * @tc.desc Test the isBlockDevice method of class Stat.
   */
  it('fileio_stat_async_is_block_device_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_block_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isBlockDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_block_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsCharacterDevice_0000
   * @tc.name fileio_stat_async_is_character_device_000
   * @tc.desc Test the isCharacterDevice method of class Stat.
   */
  it('fileio_stat_async_is_character_device_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_character_device_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isCharacterDevice())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_character_device_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsCharacterDevice_0010
   * @tc.name fileio_stat_async_is_character_device_001
   * @tc.desc Test the isCharacterDevice method of class Stat.
   */
  it('fileio_stat_async_is_character_device_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_character_device_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isCharacterDevice() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_character_device_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsDirectory_0000
   * @tc.name fileio_stat_async_is_directory_000
   * @tc.desc Test Stat.isDirectory() interface.
   */
  it('fileio_stat_async_is_directory_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_directory_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isDirectory())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_directory_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsDirectory_0010
   * @tc.name fileio_stat_async_is_directory_001
   * @tc.desc Test Stat.isDirectory() interface.
   */
  it('fileio_stat_async_is_directory_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_directory_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isDirectory() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_directory_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsDirectory_0020
   * @tc.name fileio_stat_async_is_directory_002
   * @tc.desc Test Stat.isDirectory() interface.
   */
  it('fileio_stat_async_is_directory_002', 0, async function (done) {
    let dpath = nextFileName('fileio_stat_async_is_directory_002') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = await fileio.stat(dpath);
      expect(stat.isDirectory()).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_directory_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsFIFO_0000
   * @tc.name fileio_stat_async_is_fifo_000
   * @tc.desc Test Stat.isFIFO() interface.
   */
  it('fileio_stat_async_is_fifo_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_fifo_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isFIFO())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_fifo_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsFIFO_0010
   * @tc.name fileio_stat_async_is_fifo_001
   * @tc.desc Test Stat.isFIFO() interface.
   */
  it('fileio_stat_async_is_fifo_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_fifo_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isFIFO() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_fifo_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsFILE_0000
   * @tc.name fileio_stat_async_is_file_000
   * @tc.desc Test Stat.isFile() interface.
   */
  it('fileio_stat_async_is_file_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_file_000');
    expect(isBoolean(prepareFile(fpath, FILE_CONTENT))).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isFile())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_file_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsFILE_0010
   * @tc.name fileio_stat_async_is_file_001
   * @tc.desc Test Stat.isFile() interface.
   */
  it('fileio_stat_async_is_file_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_file_001');
    expect(isBoolean(prepareFile(fpath, FILE_CONTENT))).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isFile()).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_file_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsFILE_0020
   * @tc.name fileio_stat_async_is_file_002
   * @tc.desc Test Stat.isFile() interface.
   */
  it('fileio_stat_async_is_file_002', 0, async function (done) {
    let dpath = nextFileName('fileio_stat_async_is_file_002');

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      let stat = await fileio.stat(dpath);
      expect(stat.isFile() === false).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_file_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsSocket_0000
   * @tc.name fileio_stat_async_is_socket_000
   * @tc.desc Test Stat.isSocket() interface.
   */
  it('fileio_stat_async_is_socket_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_socket_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isSocket())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_socket_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsSocket_0010
   * @tc.name fileio_stat_async_is_socket_001
   * @tc.desc Test Stat.isSocket() interface.
   */
  it('fileio_stat_async_is_socket_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_socket_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isSocket() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_socket_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsSymbolicLink_0000
   * @tc.name fileio_stat_async_is_symbolic_link_000
   * @tc.desc Test Stat.isSymbolicLink() interface.
   */
  it('fileio_stat_async_is_symbolic_link_000', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_symbolic_link_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(isBoolean(stat.isSymbolicLink())).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_symbolic_link_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FileIO_StatAsync_IsSymbolicLink_0010
   * @tc.name fileio_stat_async_is_symbolic_link_001
   * @tc.desc Test Stat.isSymbolicLink() interface.
   */
  it('fileio_stat_async_is_symbolic_link_001', 0, async function (done) {
    let fpath = nextFileName('fileio_stat_async_is_symbolic_link_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = await fileio.stat(fpath);
      expect(stat.isSymbolicLink() === false).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_stat_async_is_symbolic_link_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  it('fileio_test_append_file_sync_000', 0, function (done) {
    let fpath = nextFileName('fileio_test_append_file_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.size)).assertTrue();

      let fd = fileio.openSync(fpath, 0o2002);
      expect(isIntNum(fd)).assertTrue();

      expect(fileio.writeSync(fd, FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();

      stat = fileio.statSync(fpath);
      expect(stat.size == FILE_CONTENT.length * 2).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_append_file_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
    done();
  });
});