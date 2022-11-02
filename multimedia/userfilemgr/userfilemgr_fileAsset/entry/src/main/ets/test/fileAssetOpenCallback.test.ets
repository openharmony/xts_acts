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
import userFileManager from '@ohos.filemanagement.userFileManager';
import fileio from '@ohos.fileio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
import {
    sleep,
    audioFetchOps,
    imageVideoFetchOps,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    isNum,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';
export default function fileAssetOpenCallbackTest(abilityContext) {
    describe('fileAssetOpenCallbackTest', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfilemgr, 'ActsUserFileMgrFileAssetJsTest')
        });
        beforeEach(function () {
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep()
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        const rOpenTest = async function (done, testNum, fetchOp, assetProps, expectCount, isAudio) {
            let asset;
            let fd;
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                asset = await fetchAssetResult.getFirstObject();
                fetchAssetResult.close();
                asset.open('r', async (err, fd) => {
                    if (err) {
                        console.info(`${testNum} :: err: ${err}`);
                        expect.assertFail();
                        done();
                        return;
                    }
                    expect(isNum(fd)).assertTrue();
                    let buf = new ArrayBuffer(4096);
                    let res = await fileio.read(fd, buf);
                    console.log(' bytesRead: ' + res.bytesRead)
                    expect(res.bytesRead).assertEqual(assetProps.bytesRead);
                    try {
                        await fileio.write(fd, buf);
                        expect.assertFail();
                    } catch (error) {
                        expect(true).assertTrue();
                        await asset.close(fd);
                    }
                    done();
                });
            } catch (error) {
                console.info(`${testNum} :: error: ${error}`);
                expect.assertFail();
                await asset.close(fd);
                done();
            }
        }

        const wOpenTest = async function (done, testNum, fetchOp, assetProps, expectCount, isAudio) {
            let asset, asset1;
            let fd, fd1;
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                asset = await fetchAssetResult.getFirstObject();
                asset1 = await fetchAssetResult.getNextObject();
                fetchAssetResult.close();
                asset.open('w', async (err, fd) => {
                    if (err) {
                        console.info(`${testNum} :: err: ${err}`);
                        expect.assertFail();
                        done();
                        return;
                    }
                    expect(isNum(fd)).assertTrue();
                    fd1 = await asset1.open('r');
                    let buf = new ArrayBuffer(4096);
                    await fileio.read(fd1, buf);
                    let write = await fileio.write(fd, buf);
                    console.info(`${testNum} :: write: ${write}`);
                    expect(write).assertEqual(assetProps.write);
                    let buf1 = new ArrayBuffer(4096);
                    try {
                        await fileio.read(fd, buf1);
                        expect.assertFail();
                    } catch (error) {
                        expect(true).assertTrue();
                    }
                    done();
                });
            } catch (error) {
                console.info(`${testNum} :: error: ${error}`);
                expect(false).assertTrue();
                await asset.close(fd);
                await asset1.close(fd1);
                done();
            }
        }

        const rwOpenTest = async function (done, testNum, fetchOp, assetProps, expectCount, isAudio) {
            let asset, asset1;
            let fd, fd1;
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                asset = await fetchAssetResult.getFirstObject();
                asset.open('rw', async (err, fd) => {
                    if (err) {
                        console.info(`${testNum} :: err: ${err}`);
                        expect.assertFail();
                        done();
                        return;
                    }
                    expect(isNum(fd)).assertTrue();
                    let buf = new ArrayBuffer(4096);
                    let res = await fileio.read(fd, buf);
                    expect(res.bytesRead).assertEqual(assetProps.bytesRead);
                    asset1 = await fetchAssetResult.getNextObject();
                    fd1 = await asset1.open('r');
                    expect(isNum(fd1)).assertTrue();
                    let buf1 = new ArrayBuffer(4096);
                    await fileio.read(fd1, buf1);
                    let write = await fileio.write(fd, buf1);
                    expect(write).assertEqual(assetProps.write);
                    console.info(`res.bytesRead:${res.bytesRead},write:${write}`)
                    console.info(`fd1:${fd1},fd:${fd}`)
                    await asset.close(fd);
                    await asset1.close(fd1);
                    fetchAssetResult.close();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} :: error: ${error}`);
                await asset.close(fd);
                await asset1.close(fd1);
                expect.assertFail();
                done();
            }
        }

        const closeTest = async function (done, testNum, fetchOp, isAudio) {
            let asset;
            let fd;
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                fd = await asset.open('r');
                expect(isNum(fd)).assertTrue();
                asset.close(fd, async (err) => {
                    if (err) {
                        console.info(`${testNum} :: err: ${err}`);
                        expect.assertFail();
                        done();
                        return;
                    }
                    let count = 0
                    let buf = new ArrayBuffer(4096);
                    try {
                        await fileio.read(fd, buf);
                    } catch (error) {
                        count++
                    }
                    try {
                        await fileio.write(fd, buf);
                    } catch (error) {
                        count++
                    }
                    await sleep(1000)
                    expect(count).assertEqual(2);
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error:${error}`)
                await asset.close(fd);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_001
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_001', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_001';
            let fetchOp = imageVideoFetchOps(testNum, 'Pictures/R_Cb/');
            let assetProps = {
                bytesRead: 4096,
            };
            let expectCount = 1;
            let isAudio = false;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_002
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_002', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_002';
            let fetchOp = imageVideoFetchOps(testNum, 'Pictures/W_Cb/');
            let assetProps = {
                write: 4096,
            };
            let expectCount = 2;
            let isAudio = false;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_003
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_003', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_01_003';
            let fetchOp = imageVideoFetchOps(testNum, 'Pictures/RW_Cb/');
            let assetProps = {
                bytesRead: 4096,
                write: 4096,
            };
            let expectCount = 2;
            let isAudio = false;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_001
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of video
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_001', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_001';
            let fetchOp = imageVideoFetchOps(testNum, 'Videos/R_Cb/');
            let assetProps = {
                bytesRead: 4096,
            };
            let expectCount = 1;
            let isAudio = false;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_002
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of video
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_002', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_002';
            let fetchOp = imageVideoFetchOps(testNum, 'Videos/W_Cb/');
            let assetProps = {
                write: 4096,
            };
            let expectCount = 2;
            let isAudio = false;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_003
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of video
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_003', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_02_003';
            let fetchOp = imageVideoFetchOps(testNum, 'Videos/RW_Cb/');
            let assetProps = {
                bytesRead: 4096,
                write: 4096,
            };
            let expectCount = 2;
            let isAudio = false;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_001
         * @tc.name      : open('r')
         * @tc.desc      : open -r the type of audio
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_001', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_001';
            let fetchOp = audioFetchOps(testNum, 'Audios/R_Cb/');
            let assetProps = {
                bytesRead: 4096,
            };
            let expectCount = 1;
            let isAudio = true;
            await rOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_002
         * @tc.name      : open('w')
         * @tc.desc      : open -w the type of audio
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_002', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_002';
            let fetchOp = audioFetchOps(testNum, 'Audios/W_Cb/');
            let assetProps = {
                write: 4096,
            };
            let expectCount = 2;
            let isAudio = true;
            await wOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_003
         * @tc.name      : open('rw')
         * @tc.desc      : open -rw the type of audio
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_003', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_OPEN_CALLBACK_03_003';
            let fetchOp = audioFetchOps(testNum, 'Audios/RW_Cb/');
            let assetProps = {
                bytesRead: 4096,
                write: 4096,
            };
            let expectCount = 2;
            let isAudio = true;
            await rwOpenTest(done, testNum, fetchOp, assetProps, expectCount, isAudio);
        });

        //------------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_01
         * @tc.name      : close
         * @tc.desc      : asset close the type of image
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_01', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_01';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Pictures/openClose/', '01.jpg');
            let isAudio = false;
            await closeTest(done, testNum, fetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_02
         * @tc.name      : close
         * @tc.desc      : asset close the type of video
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_02', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_02';
            let fetchOp = imageVideoNameFetchOps(testNum, 'Videos/openClose/', '01.mp4');
            let isAudio = false;
            await closeTest(done, testNum, fetchOp, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_03
         * @tc.name      : close
         * @tc.desc      : asset close the type of audio
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_03', 2, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_FILEASSET_CLOSE_CALLBACK_03';
            let fetchOp = audioNameFetchOps(testNum, 'Audios/openClose/', '01.mp3');
            let isAudio = true;
            await closeTest(done, testNum, fetchOp, isAudio);
        });
    });
}
