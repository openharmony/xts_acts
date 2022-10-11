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
import dataSharePredicates from '@ohos.data.dataSharePredicates';

import {
    sleep,
    audioFetchOps,
    imageVideoFetchOps,
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
} from '../../../../../../common';

export default function fileAssetFileKeyTest(abilityContext) {
    describe('fileAssetFileKeyTest', function () {
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

        const AUDIOKEY = userFileManager.AudioKey;
        const ImageVideoKey = userFileManager.ImageVideoKey;
        const AlbumKey = userFileManager.AlbumKey;

        const getAlbumsByKey = async function (done, testNum, type, fileKey) {
            try {
                let expectAlbumNum = 1;
                let fetchOps = albumFetchOps(testNum, 'Pictures/', 'Static');
                let fetchAlbumResult = await userfilemgr.getPhotoAlbums(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAlbumResult, expectAlbumNum);
                if (!checkAssetCountPass) return;
                const album = await fetchAlbumResult.getFirstObject();
                console.info(`${testNum} fileKey : ${fileKey}`)
                console.info(`${testNum} type : ${album[type]}`)
                fetchAlbumResult.close();
                let predicates = new dataSharePredicates.DataSharePredicates();
                predicates.equalTo(fileKey, album[type]);
                let ops = {
                    predicates: predicates
                };
                
                userfilemgr.getPhotoAlbums(ops, async (err, newAlbumResult) => {
                    if (err) {
                        console.info(`${testNum}, err: ${err}`)
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    const fetchCount = newAlbumResult.getCount();
                    const currentAlbum = await newAlbumResult.getFirstObject();
                    expect(currentAlbum[type]).assertEqual(album[type]);
                    expect(fetchCount > 0).assertTrue();
                    console.info(`${testNum} newAlbum : ${currentAlbum[type]} count: ${fetchCount}`)
                    newAlbumResult.close();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        const getPhotoAssetsByKey = async function (done, testNum, fileKey) {
            try {
                let expectAssetNum = 1;
                let fetchOps = imageVideoFetchOps(testNum, 'Pictures/Static/');
                let fetchAssetResult = await userfilemgr.getPhotoAssets(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectAssetNum);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                console.info(`${testNum} fileKey : ${fileKey}`)
                console.info(`${testNum} type : ${asset.get(fileKey)}`)
                let predicates = new dataSharePredicates.DataSharePredicates();
                predicates.equalTo(fileKey, asset.get(fileKey));
                let ops = {
                    fetchColumns: [],
                    predicates: predicates
                };
                
                userfilemgr.getPhotoAssets(ops, async (err, newAssetResult) => {
                    if (err) {
                        console.info(`${testNum}, err: ${err}`)
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    const fetchCount = newAssetResult.getCount();
                    const currentAsset = await newAssetResult.getFirstObject();
                    expect(currentAsset.get(fileKey)).assertEqual(asset.get(fileKey));
                    expect(fetchCount > 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        const getAudioAssetsByKey = async function (done, testNum, fileKey) {
            try {
                let expectAssetNum = 1;
                let fetchOps = audioFetchOps(testNum, 'Audios/Static/');
                let fetchAssetResult = await userfilemgr.getAudioAssets(fetchOps);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchAssetResult, expectAssetNum);
                if (!checkAssetCountPass) return;
                const asset = await fetchAssetResult.getFirstObject();
                console.info(`${testNum} fileKey : ${fileKey}`)
                console.info(`${testNum} type : ${asset.get(fileKey)}`)
                let predicates = new dataSharePredicates.DataSharePredicates();
                predicates.equalTo(fileKey, asset.get(fileKey));
                let ops = {
                    fetchColumns: [],
                    predicates: predicates
                };
                userfilemgr.getAudioAssets(ops, async (err, newAssetResult) => {
                    if (err) {
                        console.info(`${testNum}, err: ${err}`)
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    const fetchCount = newAssetResult.getCount();
                    const currentAsset = await newAssetResult.getFirstObject();
                    expect(currentAsset.get(fileKey)).assertEqual(asset.get(fileKey));
                    expect(fetchCount > 0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_02
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.ALBUM_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_02';
            let type = 'albumName';
            let fileKey = AlbumKey.ALBUM_NAME;
            await getAlbumsByKey(done, testNum, type, fileKey);
        })
        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_03
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_03';
            let type = 'dateAdded';
            let fileKey = AlbumKey.DATE_ADDED;
            await getAlbumsByKey(done, testNum, type, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_04
         * @tc.name      : AlbumKey
         * @tc.desc      : AlbumKey.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOALBUMSBYKEY_04';
            let type = 'dateModified';
            let fileKey = AlbumKey.DATE_MODIFIED;
            await getAlbumsByKey(done, testNum, type, fileKey);
        });

        //------------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_02
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.FILE_TYPE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_02';
            let fileKey = ImageVideoKey.FILE_TYPE;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_03
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DISPLAY_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_03';
            let fileKey = ImageVideoKey.DISPLAY_NAME;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_04
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_04';
            let fileKey = ImageVideoKey.DATE_ADDED;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_05
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_05', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_05';
            let fileKey = ImageVideoKey.DATE_MODIFIED;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_06
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.TITLE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_06', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_06';
            let fileKey = ImageVideoKey.TITLE;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_07
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DURATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_07', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_07';
            let fileKey = ImageVideoKey.DURATION;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_08
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.WIDTH
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_08', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_08';
            let fileKey = ImageVideoKey.WIDTH;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_09
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.HEIGHT
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_09', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_09';
            let fileKey = ImageVideoKey.HEIGHT;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_010
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.DATE_TAKEN
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_010', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_010';
            let fileKey = ImageVideoKey.DATE_TAKEN;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_011
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.ORIENTATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_011', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_011';
            let fileKey = ImageVideoKey.ORIENTATION;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_012
         * @tc.name      : ImageVideoKey
         * @tc.desc      : ImageVideoKey.FAVORITE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_012', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETPHOTOASSETSBYKEY_012';
            let fileKey = ImageVideoKey.FAVORITE;
            await getPhotoAssetsByKey(done, testNum, fileKey);
        });

        //----------------------------------------------------------------------------

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_02
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.DISPLAY_NAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_02', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_02';
            let fileKey = AUDIOKEY.DISPLAY_NAME;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_03
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.DATE_ADDED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_03', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_03';
            let fileKey = AUDIOKEY.DATE_ADDED;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_04
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.DATE_MODIFIED
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_04', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_04';
            let fileKey = AUDIOKEY.DATE_MODIFIED;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_05
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.TITLE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_05', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_05';
            let fileKey = AUDIOKEY.TITLE;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_06
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.ARTIST
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_06', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_06';
            let fileKey = AUDIOKEY.ARTIST;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_07
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.AUDIOALBUM
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_07', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_07';
            let fileKey = AUDIOKEY.AUDIOALBUM;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_08
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.DURATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_08', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_08';
            let fileKey = AUDIOKEY.DURATION;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });

        /**
         * @tc.number    : SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_09
         * @tc.name      : AUDIOKEY
         * @tc.desc      : AUDIOKEY.FAVORITE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_09', 0, async function (done) {
            let testNum = 'SUB_USERFILE_MGR_GETAUDIOASSETSBYKEY_09';
            let fileKey = AUDIOKEY.FAVORITE;
            await getAudioAssetsByKey(done, testNum, fileKey);
        });
    });
}

