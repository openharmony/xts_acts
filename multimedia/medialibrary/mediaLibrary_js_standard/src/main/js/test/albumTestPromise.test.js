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
import featureAbility from '@ohos.ability.featureAbility';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
let fileKeyObj = mediaLibrary.FileKey;
let mediaType = mediaLibrary.MediaType.IMAGE;
let mediaType2 = mediaLibrary.MediaType.VIDEO;
let AlbumNoArgsfetchOp = {
    selections: '',
    selectionArgs: [],
};
let AlbumHasArgsfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [mediaType.toString()],
};

let fileHasArgsfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [mediaType.toString()],
};
let fileNoArgsfetchOp = {
    selections: '',
    selectionArgs: [],
};

describe('album.promise.test.js', async function () {
    let path = 'Pictures/';
    console.info('MediaLibraryTest : Delete begin');
    let fetchFileResult = await media.getFileAssets(fileNoArgsfetchOp);
    let assetList = await fetchFileResult.getAllObject();
    assetList.forEach(getAllObjectInfoDelete);
    console.info('MediaLibraryTest : Delete end');
    await media.createAsset(mediaType, 'imageAlbum0003.jpg', path);
    await media.createAsset(mediaType2, 'imageAlbum0004.avi', path);
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');

    beforeAll(function () {
        console.info('Album Promise MediaLibraryTest: beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');
    });
    beforeEach(function () {
        console.info('Album Promise MediaLibraryTest: beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');
    });
    afterEach(function () {
        console.info('Album Promise MediaLibraryTest: afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');
    });
    afterAll(function () {
        console.info('Album Promise MediaLibraryTest: afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by AlbumNoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_01', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            console.info('MediaLibraryTest : ALBUM_PROMISE getAlbum 001_01 album.albumName = ' + album.albumName);
            console.info('MediaLibraryTest : ALBUM_PROMISE getAlbum 001_01 album.count = ' + album.count);
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getAlbum 001_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_02
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001_02', 0, async function (done) {
        try {
            const albumList = await media.getAlbums();
            const album = albumList[0];
            console.info('MediaLibraryTest : ALBUM_PROMISE getAlbum 001_02 album.albumName = ' + album.albumName);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getAlbum 001_02 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_01
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by AlbumHasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_01', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumHasArgsfetchOp);
            const album = albumList[0];
            console.info('MediaLibraryTest : ALBUM_PROMISE getalbum 002_01 albumHas.albumName = ' + album.albumName);
            console.info('MediaLibraryTest : ALBUM_PROMISE getAlbum 002_01 album.count = ' + album.count);
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getalbum 002_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_02
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by 666
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_02', 0, async function (done) {
        try {
            await media.getAlbums(666);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getalbum 002_02 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_03
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by '666'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_03', 0, async function (done) {
        try {
            await media.getAlbums('666');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getalbum 002_03 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_04
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by 0.666
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_04', 0, async function (done) {
        try {
            await media.getAlbums(0.666);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getalbum 002_04 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_05
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002_05', 0, async function (done) {
        try {
            await media.getAlbums(true);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getalbum 002_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name  'hello'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_01', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_01 album.albumName(old) = ' + album.albumName);
            album.albumName = 'hello';
            await album.commitModify();
            expect(true).assertTrue();
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_01 album.albumName(new) = ' + album.albumName);
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_02
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name  ''
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_02', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            album.albumName = '';
            await album.commitModify();
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_02 album.albumName = ' + album.albumName);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_02 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name  '?*hello'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_03', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            album.albumName = '?*hello';
            await album.commitModify();
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_03 album.albumName = ' + album.albumName);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_03 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name  'i123456...119'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003_04', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            var name = 'i';
            for (var i = 0; i < 120; i++) {
                title += 'i';
            }
            album.albumName = name;
            await album.commitModify();
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_04 album.albumName = ' + album.albumName);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE Modify 003_04 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_004_01
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileNoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_004_01', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            let albumFetchFileResult = await album.getFileAssets(fileNoArgsfetchOp);
            let albumAssetList = await albumFetchFileResult.getAllObject();
            albumAssetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 004_01 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 004_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_004_02
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_004_02', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            let albumFetchFileResult = await album.getFileAssets();
            let albumAssetList = await albumFetchFileResult.getAllObject();
            albumAssetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 004_02 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 004_02 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_01
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_01', 0, async function (done) {
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            let albumFetchFileResult = await album.getFileAssets(fileHasArgsfetchOp);
            let albumAssetList = await albumFetchFileResult.getAllObject();
            albumAssetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_01 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_02
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_02', 0, async function (done) {
        let type2 = mediaLibrary.MediaType.VIDEO;
        let fileHasArgsfetchOp2 = {
            selections: fileKeyObj.MEDIA_TYPE + ' = ?',
            selectionArgs: [type2.toString()],
        };
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            await album.getFileAssets(fileHasArgsfetchOp2);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_02 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_02 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_03
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_03', 0, async function (done) {
        let fileHasArgsfetchOp3 = {
            selections: fileKeyObj.MEDIA_TYPE + ' = ?',
            selectionArgs: ['666'],
        };
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            await album.getFileAssets(fileHasArgsfetchOp3);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_03 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_03 fail, message = ' + error);
            expect(true).assertTrue();

            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_04
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_04', 0, async function (done) {
        let type4 = mediaLibrary.MediaType.VIDEO;
        let fileHasArgsfetchOp4 = {
            selections: '666' + '= ?',
            selectionArgs: [type4.toString()],
        };
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            await album.getFileAssets(fileHasArgsfetchOp4);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_04 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_04 fail, message = ' + error);
            expect(true).assertTrue();

            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_05
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_005_05', 0, async function (done) {
        let fileHasArgsfetchOp5 = {
            selections: '666' + '= ?',
            selectionArgs: ['666'],
        };
        try {
            const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
            const album = albumList[0];
            await album.getFileAssets(fileHasArgsfetchOp5);
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_05 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ALBUM_PROMISE getFileAssets 005_05 fail, message = ' + error);
            expect(true).assertTrue();

            done();
        }
    });

    function getAllObjectInfo(data) {
        if (data != undefined) {
            console.info('MediaLibraryTest : ALBUM_PROMISE id is ' + data.id);
            console.info('MediaLibraryTest : ALBUM_PROMISE uri is ' + data.uri);
            console.info('MediaLibraryTest : ALBUM_PROMISE displayName is ' + data.displayName);
            console.info('MediaLibraryTest : ALBUM_PROMISE mediaType is ' + data.title);
            console.info('MediaLibraryTest : ALBUM_PROMISE relativePath is ' + data.relativePath);
        } else {
            console.info('MediaLibraryTest : ALBUM_PROMISE getAllObjectInfo no album');
        }
    }

    function getAllObjectInfoDelete(data3) {
        console.info('MediaLibraryTest : id is ' + data3.id);
        console.info('MediaLibraryTest : uri is ' + data3.uri);
        console.info('MediaLibraryTest : displayName is ' + data3.displayName);
        console.info('MediaLibraryTest : mediaType is ' + data3.mediaType);

        media.deleteAsset(data3.uri, (err4, data4) => {
            if (data4 == 0) {
                console.info('MediaLibraryTest : Delete Album Successfull ' + data4);
                console.info('MediaLibraryTest : Delete Asset : PASS');
            } else {
                console.info('MediaLibraryTest : Album is not modified ' + err4.message);
                console.info('MediaLibraryTest : Modify Asset : FAIL');
            }
        });
    }
});
