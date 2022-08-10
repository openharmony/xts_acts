/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import fileIOTest from './FileIO.test.js'
import fileIOTestDir from './FileIODir.test.js'
import fileIOTestDirent from './FileIODirent.test.js'
import fileIOTestStat from './FileIOStat.test.js'
import fileIOTestStream from './FileIOStream.test.js'
import fileio_dir_close from './module_fileio/class_dir/close.test.js'
import fileio_dir_listfile from './module_fileio/class_dir/listfile.test.js'
import fileio_dir_read from './module_fileio/class_dir/read.test.js'
import fileio_dirent from './module_fileio/class_dirent/all.test.js'
import fileio_stream_1 from './module_fileio/class_stream/all.test.js'
import fileio_stream_close from './module_fileio/class_stream/close.test.js'
import fileio_stream_flush from './module_fileio/class_stream/flush.test.js'
import fileio_stream_read from './module_fileio/class_stream/read.test.js'
import fileio_stream_write from './module_fileio/class_stream/write.test.js'
import fileio_createWatcher from './module_fileio/class_watcher/createWatcher.test.js'
import fileio_access from './module_fileio/members/access.test.js'
import fileio_chmod from './module_fileio/members/chmod.test.js'
import fileio_chown from './module_fileio/members/chown.test.js'
import fileio_close from './module_fileio/members/close.test.js'
import fileio_copyfile from './module_fileio/members/copyFile.test.js'
import fileio_createStream from './module_fileio/members/createStream.test.js'
import fileio_fchmod from './module_fileio/members/fchmod.test.js'
import fileio_fchown from './module_fileio/members/fchown.test.js'
import fileio_fdatasync from './module_fileio/members/fdatasync.test.js'
import fileio_FdOpenStream from './module_fileio/members/fdopenStream.test.js'
import fileio_stat_fstat from './module_fileio/members/fstat.test.js'
import fileio_stat_fsync from './module_fileio/members/fsync.test.js'
import fileio_ftruncate from './module_fileio/members/ftruncate.test.js'
import fileio_hash from './module_fileio/members/hash.test.js'
import fileio_lchown from './module_fileio/members/lchown.test.js'
import fileio_lseek from './module_fileio/members/lseek.test.js'
import fileio_lstat from './module_fileio/members/lstat.test.js'
import fileio_mkdir_rmdir from './module_fileio/members/mkdir_rmdir.test.js'
import fileio_mkdtemp from './module_fileio/members/mkdtemp.test.js'
import fileio_open from './module_fileio/members/open.test.js'
import fileio_dir_opendir_close from './module_fileio/members/opendir_close.test.js'
import fileio_open_close from './module_fileio/members/open_close.test.js'
import fileio_posix_fallocate from './module_fileio/members/posix_fallocate.test.js'
import fileio_read from './module_fileio/members/read.test.js'
import fileio_readtext from './module_fileio/members/readtext.test.js'
import fileio_rename from './module_fileio/members/rename.test.js'
import fileio_rmdir from './module_fileio/members/rmdir.test.js'
import fileio_stat from './module_fileio/members/stat.test.js'
import fileio_symlink from './module_fileio/members/symlink.test.js'
import fileio_truncate from './module_fileio/members/truncate.test.js'
import fileio_unlink from './module_fileio/members/unlink.test.js'
import fileio_write from './module_fileio/members/write.test.js'
export default function testsuite() {
    fileIOTest()
    fileIOTestDir()
    fileIOTestDirent()
    fileIOTestStat()
    fileIOTestStream()
    fileio_dir_close()
    fileio_dir_listfile()
    fileio_dir_read()
    fileio_dirent()
    fileio_stream_1()
    fileio_stream_close()
    fileio_stream_flush()
    fileio_stream_read()
    fileio_stream_write()
    fileio_createWatcher()
    fileio_access()
    fileio_chmod()
    fileio_chown()
    fileio_close()
    fileio_copyfile()
    fileio_createStream()
    fileio_fchmod()
    fileio_fchown()
    fileio_fdatasync()
    fileio_FdOpenStream()
    fileio_stat_fstat()
    fileio_stat_fsync()
    fileio_ftruncate()
    fileio_hash()
    fileio_lchown()
    fileio_lseek()
    fileio_lstat()
    fileio_mkdir_rmdir()
    fileio_mkdtemp()
    fileio_open()
    fileio_dir_opendir_close()
    fileio_open_close()
    fileio_posix_fallocate()
    fileio_read()
    fileio_readtext()
    fileio_rename()
    fileio_rmdir()
    fileio_stat()
    fileio_symlink()
    fileio_truncate()
    fileio_unlink()
    fileio_write()
}
