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

import {
    fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
    describe, it, expect,
} from '../Common';

export default function fileIOFileLock() {
  describe('fileIO_fs_file_lock', function () {
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0000
     * @tc.name fileIO_test_filelock_promise_0000
     * @tc.desc Test lock() interfaces. argument is : default.
     * Open the file, file lock() and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
            file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0000 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0001
     * @tc.name fileIO_test_filelock_promise_0001
     * @tc.desc Test lock() interfaces. argument is : true.
     * Open the file, file lock(true) and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0001', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock(true);
            file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0002
     * @tc.name fileIO_test_filelock_promise_0002
     * @tc.desc Test lock() interfaces. argument is : false.
     * Open the file, file lock(false) and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock(false);
            file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0002 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0003
     * @tc.name fileIO_test_filelock_promise_0003
     * @tc.desc Test tryLock() interfaces. argument is : default.
     * Open the file, file lock() ,tryLock() and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0003', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock();
            file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0003 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0004
     * @tc.name fileIO_test_filelock_promise_0004
     * @tc.desc Test tryLock() interfaces. argument is : true.
     * Open the file, file lock() ,tryLock(true) and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0004', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock(true);
            file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0004 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0005
     * @tc.name fileIO_test_filelock_promise_0005
     * @tc.desc Test tryLock() interfaces. argument is : false.
     * Open the file, file lock() ,tryLock(false) and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0005', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock(false);
            file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0005 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0006
     * @tc.name fileIO_test_filelock_promise_0006
     * @tc.desc Open the file, no file lock(), tryLock(), unlock(),
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0006', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0006');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
			file.tryLock();
			file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0006 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_0007
     * @tc.name fileIO_test_filelock_promise_0007
     * @tc.desc Open the file, no file lock(), no tryLock(), unlock(),
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_0007', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_0007');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
			file.unlock();
            expect(true).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_0007 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0000
     * @tc.name fileIO_test_filelock_promise_abnormal_0000
     * @tc.desc Test lock() interfaces. argument is : null.
     * Open the file, file lock(null).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock(null);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0000 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0001
     * @tc.name fileIO_test_filelock_promise_abnormal_0001
     * @tc.desc Test lock() interfaces. argument is : true, true.
     * Open the file, file lock(true, true).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0001', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock(true, true);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0001 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0002
     * @tc.name fileIO_test_filelock_promise_abnormal_0002
     * @tc.desc Test lock() interfaces. argument is : -1.
     * Open the file, file lock(-1).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock(-1);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0002 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0003
     * @tc.name fileIO_test_filelock_promise_abnormal_0003
     * @tc.desc Test tryLock() interfaces. argument is : null.
     * Open the file, file lock(), tryLock(null).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0003', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0003');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock(null);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0003 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0004
     * @tc.name fileIO_test_filelock_promise_abnormal_0004
     * @tc.desc Test tryLock() interfaces. argument is : true, true.
     * Open the file, file lock(), tryLock(true, true).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0004', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0004');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock(true, true);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0004 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0005
     * @tc.name fileIO_test_filelock_promise_abnormal_0005
     * @tc.desc Test tryLock() interfaces. argument is : -1.
     * Open the file, file lock(), tryLock(-1).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0005', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0005');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock(-1);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0005 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0006
     * @tc.name fileIO_test_filelock_promise_abnormal_0006
     * @tc.desc Test unlock() interfaces. argument is : true.
     * Open the file, file lock(), tryLock(), unlock(true),
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_promise_abnormal_0006', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_0006');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            await file.lock();
			file.tryLock();
			file.unlock(true);
            expect(false).assertTrue();
            file.closeSync(file.fd);
            file.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('fileIO_test_filelock_promise_abnormal_0006 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });

    /**
     * @tc.number FILE_TEST_FILELOCK_CALLBACK_0000
     * @tc.name fileIO_test_filelock_callback_0000
     * @tc.desc Test lock() interfaces. argument is : default.
     * Open the file, file lock() and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_callback_0000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_callback_0000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            file.lock((err) => {
                if (err) {
                    console.log('fileIO_test_filelock_callback_0000 err ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                }
                file.unlock();
                expect(true).assertTrue();
                file.closeSync(file.fd);
                file.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_filelock_callback_0000 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_CALLBACK_0001
     * @tc.name fileIO_test_filelock_callback_0001
     * @tc.desc Test lock() interfaces. argument is : true.
     * Open the file, file lock(true) and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_callback_0001', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_callback_0001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            file.lock(true, (err) => {
                if (err) {
                    console.log('fileIO_test_filelock_callback_0001 err ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                }
                file.unlock();
                expect(true).assertTrue();
                file.closeSync(file.fd);
                file.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_filelock_callback_0001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_CALLBACK_002
     * @tc.name fileIO_test_filelock_callback_0002
     * @tc.desc Test lock() interfaces. argument is : false.
     * Open the file, file lock(false) and unlock()
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_callback_0002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_callback_0002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            file.lock(false, (err) => {
                if (err) {
                    console.log('fileIO_test_filelock_callback_0002 err ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                }
                file.unlock();
                expect(true).assertTrue();
                file.closeSync(file.fd);
                file.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_filelock_callback_0002 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_CALLBACK_ABNORMAL_0000
     * @tc.name fileIO_test_filelock_callback_abnormal_0000
     * @tc.desc Test lock() interfaces. argument is : null.
     * Open the file, file lock(null).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_callback_abnormal_0000', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_callback_abnormal_0000');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            file.lock(null, (err) => {
                if (err) {
                    console.log('fileIO_test_filelock_callback_abnormal_0000 err ' + JSON.stringify(err));
                    expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
                    done();
                }
                file.unlock();
                expect(false).assertTrue();
                file.closeSync(file.fd);
                file.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_filelock_callback_abnormal_0000 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_CALLBACK_ABNORMAL_0001
     * @tc.name fileIO_test_filelock_callback_abnormal_0001
     * @tc.desc Test lock() interfaces. argument is : true, true.
     * Open the file, file lock(true, true).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_callback_abnormal_0001', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_callback_abnormal_0001');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            file.lock(true, true, (err) => {
                if (err) {
                    console.log('fileIO_test_filelock_callback_abnormal_0001 err ' + JSON.stringify(err));
                    expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
                    done();
                }
                file.unlock();
                expect(false).assertTrue();
                file.closeSync(file.fd);
                file.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_filelock_callback_abnormal_0001 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
    /**
     * @tc.number FILE_TEST_FILELOCK_CALLBACK_ABNORMAL_0002
     * @tc.name fileIO_test_filelock_callback_abnormal_0002
     * @tc.desc Test lock() interfaces. argument is : -1.
     * Open the file, file lock(-1).
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_filelock_callback_abnormal_0002', 0, async function (done) {
        let fpath = await nextFileName('fileIO_test_filelock_callback_abnormal_0002');
        expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
            let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
            expect(isIntNum(file.fd)).assertTrue();
            file.lock(-1, (err) => {
                if (err) {
                    console.log('fileIO_test_filelock_callback_abnormal_0002 err ' + JSON.stringify(err));
                    expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
                    done();
                }
                file.unlock();
                expect(false).assertTrue();
                file.closeSync(file.fd);
                file.unlinkSync(fpath);
                done();
            });
        } catch (e) {
            console.log('fileIO_test_filelock_callback_abnormal_0002 has failed for ' + e.message + ', code: ' + e.code);
            expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
            done();
        }
    });
});
}