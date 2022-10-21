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
    fileio, fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
    describe, it, expect,
  } from '../../Common';
  
  export default function fileIOOpenFile() {
  describe('fileIO_fs_open_file', function () {

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0000
     * @tc.name fileIO_open_sync_000
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_000');

        try {
            let file = fileIO.openSync(fpath, 0o102);
            console.info('fileIO_open_sync_000, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_000 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0010
     * @tc.name fileIO_open_sync_001
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_001', 0, function () {
        try {
            fileIO.openSync();
            expect(null).assertFail();
        } catch (e) {
            console.log('fileIO_open_sync_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue;
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0020
     * @tc.name fileIO_open_sync_002
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, 0o202);
            console.info('fileIO_open_sync_002, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_002 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0030
     * @tc.name fileIO_open_sync_003
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_003', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, 0o1002);
            console.info('fileIO_open_sync_003, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_003 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0040
     * @tc.name fileIO_open_sync_004
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_004', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, 0o2002);
            console.info('fileIO_open_sync_004, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            let length = 100;
            let num = fileIO.writeSync(file.fd, new ArrayBuffer(length));
            expect(num == length).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_004 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0050
     * @tc.name fileIO_open_sync_005
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_005', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, 0o4002);
            console.info('fileIO_open_sync_005, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_005 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0060
     * @tc.name fileIO_open_sync_006
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_006', 0, async function (done) {
        let dpath = await nextFileName('fileIO_open_sync_006');
        fileio.mkdirSync(dpath);

        try {
            let file = fileIO.openSync(dpath, 0o200000);
            console.info('fileIO_open_sync_006, fd: ' + file.fd);
            fileio.rmdirSync(dpath);
            expect(isIntNum(file.fd)).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0070
     * @tc.name fileIO_open_sync_007
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_007', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, 0o400002);
            console.info('fileIO_open_sync_007, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_007 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_SYNC_0080
     * @tc.name fileIO_open_sync_008
     * @tc.desc Test openSync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_sync_008', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_sync_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, 0o4010002);
            console.info('fileIO_open_sync_008, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_sync_008 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0000
     * @tc.name fileIO_open_async_000
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o102);
            console.info('fileIO_open_async_000, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_000 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_ASYNC_0010
     * @tc.name fileIO_open_async_001
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_001', 0, function () {
        try {
            fileIO.openAsync();
            expect(null).assertFail();
        } catch (e) {
            console.log('fileIO_open_async_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue;
        }
    });
    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0020
     * @tc.name fileIO_open_async_002
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o202);
            console.info('fileIO_open_async_002, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_002 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0030
     * @tc.name fileIO_open_async_003
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_003', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o1002);
            console.info('fileIO_open_async_003, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_003 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0040
     * @tc.name fileIO_open_async_004
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_004', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o2002);
            console.info('fileIO_open_async_004, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            let length = 100;
            let num = fileIO.writeSync(file.fd,new ArrayBuffer(length));
            expect(num == length).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_004 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_ASYNC_0050
     * @tc.name fileIO_open_async_005
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_005', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o4002);
            console.info('fileIO_open_async_005, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_005 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0060
     * @tc.name fileIO_open_async_006
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_006', 0, async function (done) {
        let dpath = await nextFileName('fileIO_open_async_006');
        fileio.mkdirSync(dpath);

        try {
            let file = await fileIO.open(dpath, 0o200000);
            console.info('fileIO_open_async_006, fd: ' + file.fd);
            fileio.rmdirSync(dpath);
            expect(isIntNum(file.fd)).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_006 has failed for ' + e.message + ', code: ' + e.code);
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0070
     * @tc.name fileIO_open_async_007
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_007', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o400002);
            console.info('fileIO_open_async_007, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_007 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPEN_FILE_ASYNC_0080
     * @tc.name fileIO_open_async_007
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_008', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_008');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = await fileIO.open(fpath, 0o4010002);
            console.info('fileIO_open_async_008, fd: ' + file.fd);
            expect(isIntNum(file.fd)).assertTrue();
            expect(fileio.unlinkSync(fpath) == null).assertTrue();
            done();
        } catch (e) {
            console.log('fileIO_open_async_008 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_OPENIO_ASYNC_0090
     * @tc.name fileIO_open_async_009
     * @tc.desc Test openAsync() interfaces.
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_open_async_009', 0, async function (done) {
        let fpath = await nextFileName('fileIO_open_async_009');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            fileIO.open(fpath, 0o102, function (err,file) {
                console.info('fileIO_open_async_009, fd: ' + file.fd);
                expect(isIntNum(file.fd)).assertTrue();
                expect(fileio.unlinkSync(fpath) == null).assertTrue();
                done();
            });
        } catch (e) {
            console.log('fileIO_open_async_009 has failed for ' + e.message + ', code: ' + e.code);
            expect(null).assertFail();
        }
    });
});
}