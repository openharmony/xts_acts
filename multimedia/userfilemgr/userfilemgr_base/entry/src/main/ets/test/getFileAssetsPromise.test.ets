/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    THROW_ERROR_CODE,
    checkPresetsAssets,
    checkAssetsCount,
    audioFetchOps,
    imageVideoFetchOps,
} from '../../../../../../common';


export default function getFileAssetsPromiseTest(abilityContext) {
    describe('getFileAssetsPromiseTest', function () {
        const userfilemgr = userFileManager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfilemgr, 'ActsUserFileMgrBaseJsTest');
        });
        beforeEach(function () {
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep(500)
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        const props = {
            image: {
                displayName: '01.jpg',
                fileType: IMAGE_TYPE.toString(),
            },
            video: {
                displayName: '01.mp4',
                fileType: VIDEO_TYPE.toString(),
            },
            audio: {
                displayName: '01.mp3',
                fileType: AUDIO_TYPE.toString(),
            },
        }

        async function getFirstObjectTest(done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getFirstObject();
                expect(asset != undefined).assertTrue();
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getLastObjectTest(done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getLastObject();
                expect(asset != undefined).assertTrue();
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getPositionObjectTest(done, testNum, fetchOp, pos, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getPositionObject(pos);
                expect(asset != undefined).assertTrue();
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function isAfterLastTest(done, testNum, fetchOp, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getFirstObject();
                for (var i = 1; i < expectCount; i++) {
                    asset = await fetchAssetResult.getNextObject();
                    if (i == expectCount - 1) {
                        let result = fetchAssetResult.isAfterLast();
                        expect(result).assertTrue();
                        fetchAssetResult.close();
                        done();
                    }
                }
            } catch (error) {
                console.info(`${testNum} error ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function checkFileAssetAttr(done, testNum, fetchOp, type, isAudio) {
            try {
                let fetchAssetResult;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(fetchOp);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOp);
                }
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchAssetResult.getFirstObject();
                expect(asset.displayName).assertEqual(props[type].displayName);
                expect(asset.fileType.toString()).assertEqual(props[type].fileType);
                expect(asset.uri != undefined).assertTrue();
                fetchAssetResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getFileAssetsErrCodeTest(done, testNum, isAudio) {
            try {
                let fetchAssetResult;
                let invalidOps : userFileManager.FetchOptions;
                if (isAudio) {
                    fetchAssetResult = await userfilemgr.getAudioAssets(invalidOps);
                } else {
                    fetchAssetResult = await userfilemgr.getPhotoAssets(invalidOps);
                }
                expect(false).assertTrue();
            } catch (error) {
                console.info(`${testNum}:: errCode :${JSON.stringify(error)}`);
                expect(error.code).assertEqual(THROW_ERROR_CODE.toString());
                done();
            }
        }
//
        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_01_001
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_01_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_01_001';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let isAudio = false;
            await getFirstObjectTest(done, testNum, currentFetchOps, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_01_002
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_01_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_01_002';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let isAudio = true;
            await getFirstObjectTest(done, testNum, currentFetchOps, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_01_003
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_01_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_01_003';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let isAudio = false;
            await getFirstObjectTest(done, testNum, currentFetchOps, isAudio);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_02_001
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_02_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_02_001';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let isAudio = false;
            await getLastObjectTest(done, testNum, currentFetchOps, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_02_002
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_02_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_02_002';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let isAudio = true;
            await getLastObjectTest(done, testNum, currentFetchOps, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_02_003
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_02_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_02_003';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let isAudio = false;
            await getLastObjectTest(done, testNum, currentFetchOps, isAudio);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_03_001
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_03_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_03_001';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let pos = 0;
            let isAudio = false;
            await getPositionObjectTest(done, testNum, currentFetchOps, pos, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_03_002
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_03_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_03_002';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let pos = 0;
            let isAudio = true;
            await getPositionObjectTest(done, testNum, currentFetchOps, pos, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_03_003
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_03_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_03_003';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let pos = 0;
            let isAudio = false;
            await getPositionObjectTest(done, testNum, currentFetchOps, pos, isAudio);
        });

        //---------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_04_001
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_04_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_04_001';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let isAudio = false;
            await isAfterLastTest(done, testNum, currentFetchOps, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_04_002
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_04_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_04_002';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let isAudio = true;
            await isAfterLastTest(done, testNum, currentFetchOps, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_04_003
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_04_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_04_003';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let isAudio = false;
            await isAfterLastTest(done, testNum, currentFetchOps, isAudio);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_05_001
         * @tc.name      : getPhotoAssets
         * @tc.desc      : query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_05_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_05_001';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let type = 'image';
            let isAudio = false;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_05_002
         * @tc.name      : getAudioAssets
         * @tc.desc      : query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_05_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETS_PROMISE_05_002';
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let type = 'audio';
            let isAudio = true;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_05_003
         * @tc.name      : getPhotoAssets
         * @tc.desc      : query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_05_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_PROMISE_05_003';
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let type = 'video';
            let isAudio = false;
            await checkFileAssetAttr(done, testNum, currentFetchOps, type, isAudio);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_ERRCODE_PROMISE_01
         * @tc.name      : getPhotoAssets
         * @tc.desc      : invalid FetchOptions
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_ERRCODE_PROMISE_01', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_ERRCODE_PROMISE_01';
            let isAudio = false;
            await getFileAssetsErrCodeTest(done, testNum, isAudio);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETS_ERRCODE_PROMISE_02
         * @tc.name      : getPhotoAssets
         * @tc.desc      : invalid FetchOptions
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETS_ERRCODE_PROMISE_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETS_ERRCODE_PROMISE_02';
            let isAudio = true;
            await getFileAssetsErrCodeTest(done, testNum, isAudio);
        });
    });
}

