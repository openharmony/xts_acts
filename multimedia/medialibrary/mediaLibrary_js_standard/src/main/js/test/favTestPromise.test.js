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

import mediaLibrary from '@ohos.multimedia.medialibrary';
import featureAbility from '@ohos.ability.featureAbility'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('favSmartAlbum.promise.test.js', function () {

    let mediaType = mediaLibrary.MediaType.IMAGE;
    let path = "Pictures/"
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    var asset;
    var favSmartAlbum;
    var trashSmartAlbum;
    beforeAll(function () {
        onsole.info('Smart Album Promise MediaLibraryTest: beforeAll： Prerequisites at the test suite level, which are executed before the test suite is executed.');

    })

    beforeEach(function () {
        console.info('Smart Album Promise MediaLibraryTest: beforeEach：Prerequisites at the test case level, which are executed before each test case is executed.');

    })
    afterEach(function () {
        console.info('Smart Album Promise MediaLibraryTest: afterEach： Test case-level clearance conditions, which are executed after each test case is executed.');

    })
    afterAll(function () {
        console.info('Smart Album Promise MediaLibraryTest: afterAll：  Test suite-level cleanup condition, which is executed after the test suite is executed');

    })
    
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001
     * @tc.name      : Get PrivateSmartAlbum by fav
     * @tc.desc      : Get PrivateSmartAlbum by fav
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001_01', 0, async function (done) {
        try {
            asset = await media.createAsset(mediaType, "imageGetPrivatealbum002.jpg", path);
            const favSmartAlbums = await media.getPrivateAlbum(mediaLibrary.PrivateAlbumType.TYPE_FAVORITE);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum favSmartAlbums 001_01');
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE favSmartAlbums 001_01 ' + favSmartAlbums[0].albumName);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE favSmartAlbums 001_01 ' + favSmartAlbums[0].albumCapacity);
            favSmartAlbum = favSmartAlbums[0];
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001_02', 0, async function (done) {
        try {
            const trashSmartAlbums = await media.getPrivateAlbum(mediaLibrary.PrivateAlbumType.TYPE_TRASH);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum trashSmartAlbums 001_02');
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE trashSmartAlbums 001_02 ' + trashSmartAlbums[0].albumName);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE trashSmartAlbums 001_02 ' + trashSmartAlbums[0].albumCapacity);
            trashSmartAlbum = trashSmartAlbums[0];
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_02 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001_03', 0, async function (done) {
        try {
            const favSmartAlbums = await media.getPrivateAlbum(666);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_03 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_03 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001_04', 0, async function (done) {
        try {
            const favSmartAlbums = await media.getPrivateAlbum("666");
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum success 001_04');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_04 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001_05', 0, async function (done) {
        try {
            const favSmartAlbums = await media.getPrivateAlbum(6.66666);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum success 001_05');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001_06', 0, async function (done) {
        try {
            const favSmartAlbums = await media.getPrivateAlbum();
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum success 001_06');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum 001_06 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });
    
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002
     * @tc.name      : Add asset
     * @tc.desc      : Add asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002_01', 0, async function (done) {
        try {
            await favSmartAlbum.addAsset(asset.uri);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset 002_01 uri = ', asset.uri);
            let fSmartFetchFileResult = await favSmartAlbum.getFileAssets();
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getFileAssets 002_01 Successfull fSmartFetchFileResult = '
                + fSmartFetchFileResult.getCount());
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset 002_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002_02', 0, async function (done) {
        try {
            await favSmartAlbum.addAsset(666);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset 002_02 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002_03', 0, async function (done) {
        try {
            await favSmartAlbum.addAsset("666");
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset 002_03 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002_04', 0, async function (done) {
        try {
            await favSmartAlbum.addAsset(0.666);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset 002_04 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002_05', 0, async function (done) {
        try {
            await favSmartAlbum.addAsset();
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset 002_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003
     * @tc.name      : Remove asset
     * @tc.desc      : Remove asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003_01', 0, async function (done) {
        try {
            await favSmartAlbum.removeAsset(asset.uri);
            let fSmartFetchFileResultNew = await favSmartAlbum.getFileAssets();
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getFileAssets Successfull removeAsset 003_01 fSmartFetchFileResultNew = '
                + fSmartFetchFileResultNew.getCount());
            await media.deleteAsset(asset.uri);
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_01 fail, message = ' + error);
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003_02', 0, async function (done) {
        try {
            await favSmartAlbum.removeAsset(666);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_02 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_02 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003_03', 0, async function (done) {
        try {
            await favSmartAlbum.removeAsset("666");
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_03 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_03 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003_04', 0, async function (done) {
        try {
            await favSmartAlbum.removeAsset(0.666);
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_04 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_04 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003_05', 0, async function (done) {
        try {
            await favSmartAlbum.removeAsset();
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_05 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav removeAsset 003_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETASSET_PROMISE_004
     * @tc.name      : get FileAssets
     * @tc.desc      : get FileAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETASSET_PROMISE_004_01', 0, async function (done) {
        try {
            let fSmartFetchFileResultGet = await favSmartAlbum.getFileAssets();
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE getFileAssets Successfull 004_01 fSmartFetchFileResultGet = '
                + fSmartFetchFileResultGet.getCount());
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav getFileAssets 004_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });
})