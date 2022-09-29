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

import userfile_manager from '@ohos.filemanagement.userfile_manager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
import {
    sleep,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILE_TYPE,
    checkPresetsAssets,
    checkAssetsCount,
    allFetchOp,
    fileFetchOps,
    audioFetchOps,
    imageVideoFetchOps,
} from '../../../../../../common';


export default function getFileAssetsPromiseTest(abilityContext) {
    describe('getFileAssetsPromiseTest', function () {
        const userfile_mgr = userfile_manager.getUserFileMgr(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
            await checkPresetsAssets(userfile_mgr, 'ActsUserFileMgrBaseJsTest');
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
                mediaType: IMAGE_TYPE.toString(),
            },
            video: {
                displayName: '01.mp4',
                relativePath: 'Videos/Static/',
                mediaType: VIDEO_TYPE.toString(),
            },
            audio: {
                displayName: '01.mp3',
                mediaType: AUDIO_TYPE.toString(),
            },
        }

        async function getFirstObjectTest(done, testNum, media_type, fetchOps) {
            try {
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                expect(asset != undefined).assertTrue();
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getLastObjectTest(done, testNum, media_type, fetchOps) {
            try {
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getLastObject();
                expect(asset != undefined).assertTrue();
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getPositionObjectTest(done, testNum, media_type, fetchOps, pos) {
            try {
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getPositionObject(pos);
                expect(asset != undefined).assertTrue();
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function isAfterLastTest(done, testNum, media_type, fetchOps) {
            try {
                let fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                let asset = await fetchFileResult.getFirstObject();
                for (var i = 1; i < expectCount; i++) {
                    asset = await fetchFileResult.getNextObject();
                    if (i == expectCount - 1) {
                        let result = fetchFileResult.isAfterLast();
                        expect(result).assertTrue();
                        fetchFileResult.close();
                        done();
                    }
                }
            } catch (error) {
                console.info(`${testNum} error ${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function checkFileAssetAttr(done, testNum, media_type, fetchOps, type) {
            try {
                const fetchFileResult = await userfile_mgr.getFileAssets(media_type, fetchOps);
                let expectCount = 4;
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, expectCount);
                if (!checkAssetCountPass) return;
                fetchFileResult.getFirstObject(async (err, asset) => {
                    if (err) {
                        console.info(`${testNum} err : ${err}`)
                        expect.assertFail();
                        fetchFileResult.close();
                        done();
                        return;
                    }
                    expect(asset.displayName).assertEqual(props[type].displayName);
                    expect(asset.mediaType.toString()).assertEqual(props[type].mediaType);
                    fetchFileResult.close();
                    done();
                });
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_001
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_001';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            await getFirstObjectTest(done, testNum, media_type, currentFetchOps)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_002
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_002';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            await getFirstObjectTest(done, testNum, media_type, currentFetchOps)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_003
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_003';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            await getFirstObjectTest(done, testNum, media_type, currentFetchOps)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_004
         * @tc.name      : getFirstObject
         * @tc.desc      : getFirstObject query file assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_004', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_01_004';
            let media_type = [FILE_TYPE];
            let currentFetchOps = fileFetchOps(testNum, 'Documents/Static/');
            await getFirstObjectTest(done, testNum, media_type, currentFetchOps)
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_001
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_001';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            await getLastObjectTest(done, testNum, media_type, currentFetchOps)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_002
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_002';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            await getLastObjectTest(done, testNum, media_type, currentFetchOps)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_003
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_003';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            await getLastObjectTest(done, testNum, media_type, currentFetchOps)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_004
         * @tc.name      : getLastObject
         * @tc.desc      : getLastObject query file assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_004', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_02_004';
            let media_type = [FILE_TYPE];
            let currentFetchOps = fileFetchOps(testNum, 'Documents/Static/');
            await getLastObjectTest(done, testNum, media_type, currentFetchOps)
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_001
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_001';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let pos = 0;
            await getPositionObjectTest(done, testNum, media_type, currentFetchOps, pos);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_002
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_002';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let pos = 0;
            await getPositionObjectTest(done, testNum, media_type, currentFetchOps, pos);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_003
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_003';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let pos = 0;
            await getPositionObjectTest(done, testNum, media_type, currentFetchOps, pos);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_004
         * @tc.name      : getPositionObject
         * @tc.desc      : getPositionObject query file assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_004', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_03_004';
            let media_type = [FILE_TYPE];
            let currentFetchOps = fileFetchOps(testNum, 'Documents/Static/');
            let pos = 0;
            await getPositionObjectTest(done, testNum, media_type, currentFetchOps, pos);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_001
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_001';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            await isAfterLastTest(done, testNum, media_type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_002
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_002';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            await isAfterLastTest(done, testNum, media_type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_003
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_003';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            await isAfterLastTest(done, testNum, media_type, currentFetchOps);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_004
         * @tc.name      : isAfterLast
         * @tc.desc      : isAfterLast query file assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_004', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_04_004';
            let media_type = [FILE_TYPE];
            let currentFetchOps = fileFetchOps(testNum, 'Documents/Static/');
            await isAfterLastTest(done, testNum, media_type, currentFetchOps);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_001
         * @tc.name      : getFileAssets
         * @tc.desc      : query image assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_001', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_001';
            let media_type = [IMAGE_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
            let type = 'image';
            await checkFileAssetAttr(done, testNum, media_type, currentFetchOps, type)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_002
         * @tc.name      : getFileAssets
         * @tc.desc      : query audio assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_002', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_002';
            let media_type = [AUDIO_TYPE];
            let currentFetchOps = audioFetchOps(testNum, 'Audios/Static/');
            let type = 'audio';
            await checkFileAssetAttr(done, testNum, media_type, currentFetchOps, type)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_003
         * @tc.name      : getFileAssets
         * @tc.desc      : query video assets
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_003', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_003';
            let media_type = [VIDEO_TYPE];
            let currentFetchOps = imageVideoFetchOps(testNum, 'Videos/Static/');
            let type = 'video';
            await checkFileAssetAttr(done, testNum, media_type, currentFetchOps, type)
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_004
         * @tc.name      : getFileAssets
         * @tc.desc      : query assets by abnormal
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_004', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETFILEASSETS_PROMISE_05_004';
            try {
                let media_type = [-1];
                let currentFetchOps: userfile_manager.MediaFetchOptions = allFetchOp();
                userfile_mgr.getFileAssets(media_type, currentFetchOps, async (err, fetchFileResult) => {
                    console.info(`${testNum}, err: ${err}`);
                    if (err != undefined) {
                        expect(true).assertTrue();
                        done();
                        return;
                    }
                    expect(false).assertTrue();
                    done();
                });
                
            } catch (error) {
                console.info(`${testNum}:: error :${error}`);
                expect(true).assertTrue();
                done();
            }
        });
    });
}

