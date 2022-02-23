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
let fileKeyObj = mediaLibrary.FileKey
let type1 = mediaLibrary.MediaType.IMAGE
let fileHasArgsfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + "= ?",
    selectionArgs: [type1.toString()],
}

let fileNoArgsfetchOp = {
    selections: "",
    selectionArgs: [],
}
let fileDeviceArgsfetchOp = {
    selections: "",
    selectionArgs: [],
    networdId: "0",
}

describe('file.promise.test.js', function () {
    var asset;
    var assetMove;
    var assetMovePromise;
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    beforeAll(function () {
        console.info('File Promise MediaLibraryTest: beforeAll ： Prerequisites at the test suite level, which are executed before the test suite is executed.');
    })

    beforeEach(function () {
        console.info('File Promise MediaLibraryTest: beforeEach：Prerequisites at the test case level, which are executed before each test case is executed.');
    })
    afterEach(function () {
        console.info('File Promise MediaLibraryTest: afterEach： Test case-level clearance conditions, which are executed after each test case is executed.');
    })
    afterAll(function () {
        console.info('File Promise MediaLibraryTest: afterAll：  Test suite-level cleanup condition, which is executed after the test suite is executed');
    })

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001
     * @tc.name      : Create an asset in predefined path
     * @tc.desc      : Create an asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_01', 0, async function (done) {
        console.info('MediaLibraryTest : getMediaLibrary IN');
        var media = mediaLibrary.getMediaLibrary(context);
        console.info('MediaLibraryTest : getMediaLibrary OUT');
        console.info('MediaLibraryTest : Delete begin');
        let fetchFileResult = await media.getFileAssets(fileNoArgsfetchOp);
        let assetList = await fetchFileResult.getAllObject();
        assetList.forEach(getAllObjectInfoDelete);
        console.info('MediaLibraryTest : Delete end');
        let mediaType = mediaLibrary.MediaType.IMAGE;
        let path = "Pictures/";
        let pathMove = "Pictures/Move/";
        let pathMovePromise = "Pictures/Move/Promise/";
        asset = await media.createAsset(mediaType, "image01.jpg", path);
        assetMove = await media.createAsset(mediaType, "image01Move.jpg", pathMove);
        assetMovePromise = await media.createAsset(mediaType, "image01MovePromise.jpg", pathMovePromise);
        console.info('MediaLibraryTest : ASSET_PROMISE asset.displayName = ' + asset.displayName);
        console.info('MediaLibraryTest : ASSET_PROMISE asset.title = ' + asset.title);
        console.info('MediaLibraryTest : ASSET_PROMISE assetMove.displayName = ' + assetMove.displayName);
        let relativePath = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
        console.info('MediaLibraryTest : ASSET_PROMISE relativePath = ' + relativePath);
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_02', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.VIDEO;
            let path = "Movies/";
            var asset02 = await media.createAsset(mediaType, "video01.avi", path);
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_02 asset.displayName = ' +
                         asset02.displayName);
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_02 fail, message = ' + error);
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_03', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.VIDEO;
            let path = "";
            var asset03 = await media.createAsset(mediaType, "video03.avi", path);
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_03 asset.displayName = ' +
                         asset03.displayName);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_03 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_04', 0, async function (done) {
        try {
            let mediaType;
            let path = "Movies/";
            var asset04 = await media.createAsset(mediaType, "video04.avi", path);
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_04 asset.displayName = ' +
                         asset04.displayName);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_04 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_05', 0, async function (done) {
        try {
            let mediaType;
            let path;
            var asset05 = await media.createAsset(mediaType, "video05.avi", path);
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_05 asset.displayName = ' +
                         asset05.displayName);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE create asset 001_05 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002
     * @tc.name      : Modify asset
     * @tc.desc      : Modify asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_01', 0, async function (done) {
        try {
            asset.title = "image03";
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_01 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });
    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_02', 0, async function (done) {
        try {
            asset.relativePath = "Pictures/Move/";
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_02 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_02 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });
    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_03', 0, async function (done) {
        try {
            asset.displayName = "image02.jpg"
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_03 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_03 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });
    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_04', 0, async function (done) {
        try {
            asset.orientation = 100;
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_04 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_04 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });
    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_05', 0, async function (done) {
        try {
            asset.title = "image04";
            asset.relativePath = "Pictures/Move/Promise/";
            asset.displayName = "image03.jpg"
            asset.orientation = 200;
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_05 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_05 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_06', 0, async function (done) {
        try {
            asset.title = "image04?*&@";
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_06 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_06 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_07', 0, async function (done) {
        try {
            asset.displayName = "image04?*&.jpg";
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_07 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_07 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002_08', 0, async function (done) {
        try {
            var title = "i";
            for (var i = 0; i < 120; i++) {
                title += "i";
            }
            asset.title = title;
            await asset.commitModify();
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_08 success');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE modify asset 002_08 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_003
     * @tc.name      : Get assetList By NoArgsfetchOp
     * @tc.desc      : Get assetList By NoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_003_01', 0, async function (done) {
        try {
            let fetchFileResult = await media.getFileAssets(fileDeviceArgsfetchOp);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 003_01 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 003_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_003_02', 0, async function (done) {
        try {
            let fetchFileResult = await media.getFileAssets();
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 003_02 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 003_02 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });
    
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004
     * @tc.name      : Get assetList By HasArgsfetchOp
     * @tc.desc      : Get assetList By HasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
     
    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004_01', 0, async function (done) {
        try {
            let fetchFileResult = await media.getFileAssets(fileHasArgsfetchOp);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_01 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004_02', 0, async function (done) {
        let type2 = mediaLibrary.MediaType.VIDEO
        let fileHasArgsfetchOp2 = {
            selections: fileKeyObj.MEDIA_TYPE + "= ?",
            selectionArgs: [type2.toString()],
        }
        try {
            let fetchFileResult = await media.getFileAssets(fileHasArgsfetchOp2);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_02 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_02 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004_03', 0, async function (done) {
        let fileHasArgsfetchOp3 = {
            selections: fileKeyObj.MEDIA_TYPE + "= ?",
            selectionArgs: ["666"],
        }
        try {
            let fetchFileResult = await media.getFileAssets(fileHasArgsfetchOp3);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_03 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_03 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004_04', 0, async function (done) {
        let type4 = mediaLibrary.MediaType.VIDEO
        let fileHasArgsfetchOp4 = {
            selections: "666" + "= ?",
            selectionArgs: [type4.toString()],
        }
        try {
            let fetchFileResult = await media.getFileAssets(fileHasArgsfetchOp4);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_04 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_04 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004_05', 0, async function (done) {
        let fileHasArgsfetchOp5 = {
            selections: "666" + "= ?",
            selectionArgs: ["666"],
        }
        try {
            let fetchFileResult = await media.getFileAssets(fileHasArgsfetchOp5);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfo);
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_05 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE get asset 004_05 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005
     * @tc.name      : Open and Close asset
     * @tc.desc      : Open and Close asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_01', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('Rw');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_01 success, fd = ' + fd);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        try {
            asset.close(fd);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_01 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_01 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_02', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('w');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_02 success, fd = ' + fd);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_02 fail, message = ' + error);
            expect(false).assertTrue();
        }
        try {
            asset.close(fd);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_02 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_02 fail, message = ' + error);
            expect(false).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_03', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open(0.666);
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_03 success, fd = ' + fd);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_03 fail, message = ' + error);
            expect(true).assertTrue();
        }
        try {
            asset.close(fd);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_03 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_03 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_04', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open();
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_04 success, fd = ' + fd);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_04 fail, message = ' + error);
            expect(true).assertTrue();
        }
        try {
            asset.close(fd);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_04 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_04 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_05', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_05 success, fd = ' + fd);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_05 fail, message = ' + error);
            expect(true).assertTrue();
        }
        try {
            asset.close(fd);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_05 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_05 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_06', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('Rw');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_06 success, fd = ' + fd);
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_06 fail, message = ' + error);
        }
        try {
            asset.close(-1);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_06 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_06 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_07', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('Rw');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_07 success, fd = ' + fd);
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_005_0705 fail, message = ' + error);
        }
        try {
            asset.close(0);
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_07 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_07 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_08', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('Rw');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_08 success, fd = ' + fd);
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_08 fail, message = ' + error);
        }
        try {
            asset.close("666");
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_08 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_08 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005_09', 0, async function (done) {
        var fd;
        try {
            fd = await asset.open('Rw');
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_09 success, fd = ' + fd);
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE open 005_09 fail, message = ' + error);
        }
        try {
            asset.close();
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_09 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 005_09 fail, message = ' + error);
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_AND_TRA_ASSET_PROMISE_006
     * @tc.name      : Favourite and Trash 
     * @tc.desc      : Favourite and Trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_FAV_AND_TRA_ASSET_PROMISE_006', 0, async function (done) {
        let isDirectory = await asset.isDirectory();
        let isFavorite = await asset.isFavorite();
        let isTrash = await asset.isTrash();
        console.info('MediaLibraryTest : ASSET_PROMISE isDirectory = ' + isDirectory);
        console.info('MediaLibraryTest : ASSET_PROMISE isFavorite = ' + isFavorite);
        console.info('MediaLibraryTest : ASSET_PROMISE Trash = ' + isTrash);
        await asset.trash(true);
        console.info('MediaLibraryTest : ASSET_PROMISE favorite trash');
        await asset.favorite(true);
        console.info('MediaLibraryTest : ASSET_PROMISE favorite success');
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange = ' + isFavoriteChange);
        let isTrashChange = await asset.isTrash();
        console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange = ' + isTrashChange);
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007
     * @tc.name      : Favourite
     * @tc.desc      : Favourite
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007_01', 0, async function (done) {
        try {
            await asset.favorite(true);
            console.info('MediaLibraryTest : ASSET_PROMISE favorite 007_03 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 007_03 fail, message = ' + error);
            expect(false).assertTrue();
        }
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange 007_03 = ' + isFavoriteChange);
        done();
    });
    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007_02', 0, async function (done) {
        try {
            await asset.favorite(false);
            console.info('MediaLibraryTest : ASSET_PROMISE favorite 007_02 success');
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 007_02 fail, message = ' + error);
            expect(false).assertTrue();
        }
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange 007_02 = ' + isFavoriteChange);
        done();
    });
    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007_03', 0, async function (done) {
        try {
            await asset.favorite(666);
            console.info('MediaLibraryTest : ASSET_PROMISE favorite 007_03 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 007_03 fail, message = ' + error);
            expect(true).assertTrue();
        }
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange 007_03 = ' + isFavoriteChange);
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007_04', 0, async function (done) {
        try {
            await asset.favorite("666");
            console.info('MediaLibraryTest : ASSET_PROMISE favorite 007_04 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 007_04 fail, message = ' + error);
            expect(true).assertTrue();
        }
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange 007_04 = ' + isFavoriteChange);
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007_05', 0, async function (done) {
        try {
            await asset.favorite(0.666);
            console.info('MediaLibraryTest : ASSET_PROMISE favorite 007_05 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 007_05 fail, message = ' + error);
            expect(true).assertTrue();
        }
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange 007_05 = ' + isFavoriteChange);
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_007_06', 0, async function (done) {
        try {
            await asset.favorite();
            console.info('MediaLibraryTest : ASSET_PROMISE favorite 007_06 success');
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE close 007_06 fail, message = ' + error);
            expect(true).assertTrue();
        }
        let isFavoriteChange = await asset.isFavorite();
        console.info('MediaLibraryTest : ASSET_PROMISE isFavoriteChange 007_06 = ' + isFavoriteChange);
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ISFAV_ASSET_PROMISE_008
     * @tc.name      : Is Favourite
     * @tc.desc      : Is Favourite
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_ISFAV_ASSET_PROMISE_008_01', 0, async function (done) {
        try {
            let isFavorite = await asset.isFavorite();
            console.info('MediaLibraryTest : ASSET_PROMISE isFavorite = ' + isFavorite);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE isFavorite fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });
    
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009
     * @tc.name      : Trash 
     * @tc.desc      : Trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009_01', 0, async function (done) {
        try {
            await asset.trash(true);
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_01');
            expect(true).assertTrue();
        } catch (trashError) {
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_01 fail ,message = ', trashError);
            expect(false).assertTrue();
            done();
        }
        try {
            let isTrashChange = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_01 = ' + isTrashChange);
            expect(true).assertTrue();
        } catch (isTrashChangeError) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_01 fail, message = ' + isTrashChangeError);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009_02', 0, async function (done) {
        try {
            await asset.trash(false);
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_02');
            expect(true).assertTrue();
        } catch (trashError) {
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_02 fail ,message = ', trashError);
            expect(false).assertTrue();
            done();
        }
        try {
            let isTrashChange = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_02 = ' + isTrashChange);
            expect(true).assertTrue();
        } catch (isTrashChangeError) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_02 fail ,message = ' + isTrashChangeError);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009_03', 0, async function (done) {
        try {
            await asset.trash(666);
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_03');
            expect(false).assertTrue();
        } catch (trashError) {
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_03 fail ,message = ' + trashError);
            expect(true).assertTrue();
            done();
        }
        try {
            let isTrashChange = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_03 = ' + isTrashChange);
            expect(true).assertTrue();
        } catch (isTrashChangeError) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_03 fail ,message = ' + isTrashChangeError);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009_04', 0, async function (done) {
        try {
            await asset.trash("666");
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_04');
            expect(false).assertTrue();
        } catch (trashError) {
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_04 fail ,message = ' + trashError);
            expect(true).assertTrue();
            done();
        }
        try {
            let isTrashChange = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_04 = ' + isTrashChange);
            expect(true).assertTrue();
        } catch (isTrashChangeError) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_04 fail ,message = ' + isTrashChangeError);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009_05', 0, async function (done) {
        try {
            await asset.trash(0.666);
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_05');
            expect(false).assertTrue();
        } catch (trashError) {
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_05 fail ,message = ' + trashError);
            expect(true).assertTrue();
            done();
        }
        try {
            let isTrashChange = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_05 = ' + isTrashChange);
            expect(true).assertTrue();
        } catch (isTrashChangeError) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_05 fail ,message = ' + isTrashChangeError);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_TRA_ASSET_PROMISE_009_06', 0, async function (done) {
        try {
            await asset.trash();
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_06');
            expect(false).assertTrue();
        } catch (trashError) {
            console.info('MediaLibraryTest : ASSET_PROMISE trash 009_06 fail ,message = ' + trashError);
            expect(true).assertTrue();
            done();
        }
        try {
            let isTrashChange = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_06 = ' + isTrashChange);
            expect(true).assertTrue();
        } catch (isTrashChangeError) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrashChange 009_06 fail ,message = ' + isTrashChangeError);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ISTRASH_ASSET_PROMISE_0010
     * @tc.name      : Is trash
     * @tc.desc      : Is trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_ISTRASH_ASSET_PROMISE_0010_01', 0, async function (done) {
        try {
            let isTrash = await asset.isTrash();
            console.info('MediaLibraryTest : ASSET_PROMISE Trash 0010_01 = ' + isTrash);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE isTrash 0010_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETPUBLICDIRECTORY_PROMISE 0011
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETPUBLICDIRECTORY_PROMISE 0011_01', 0, async function (done) {
        try {
            let relativePath = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_01 relativePath = ' + relativePath);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPUBLICDIRECTORY_PROMISE 0011_02', 0, async function (done) {
        try {
            let relativePath = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_02 relativePath = ' + relativePath);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_02 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPUBLICDIRECTORY_PROMISE 0011_03', 0, async function (done) {
        try {
            let relativePath = await media.getPublicDirectory("666");
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_03 relativePath = ' + relativePath);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_03 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPUBLICDIRECTORY_PROMISE 0011_04', 0, async function (done) {
        try {
            let relativePath = await media.getPublicDirectory(666);
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_04 relativePath = ' + relativePath);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_04 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
        done();
    });

    it('SUB_MEDIA_MEDIALIBRARY_GETPUBLICDIRECTORY_PROMISE 0011_05', 0, async function (done) {
        try {
            let relativePath = await media.getPublicDirectory();
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_05 relativePath = ' + relativePath);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getPublicDirectory 0011_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ISDIR_ASSET_PROMISE_0012
     * @tc.name      : Is Directory 
     * @tc.desc      : Is Directory
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_PROMISE_0012_01', 0, async function (done) {
        try {
            let isDirectory = await asset.isDirectory();
            console.info('MediaLibraryTest : ASSET_PROMISE ISDIRECTORY 0012_01 = ' + isDirectory);
            expect(true).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE ISDIRECTORY 0012_01 fail ' + error);
            expect(false).assertTrue();
            done();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_0013
     * @tc.name      : Delete asset 
     * @tc.desc      : Delete asset 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_0013_01', 0, async function (done) {
        try {
            await media.deleteAsset(asset.uri);
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_01 SUCCESS ');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_01 file, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_0013_02', 0, async function (done) {
        try {
            await media.deleteAsset(666);
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_02 SUCCESS ');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_02 file, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_0013_03', 0, async function (done) {
        try {
            await media.deleteAsset("666");
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_03 SUCCESS ');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_03 file, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_0013_04', 0, async function (done) {
        try {
            await media.deleteAsset(0.666);
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_04 SUCCESS ');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_04 file, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_0013_05', 0, async function (done) {
        try {
            await media.deleteAsset();
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_05 SUCCESS ');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE deleteAsset 0013_05 file, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });


    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_RELEASE_PROMISE_0014
     * @tc.name      : Release 
     * @tc.desc      : Release 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    // it('SUB_MEDIA_MEDIALIBRARY_RELEASE_PROMISE_0014_01', 0, async function (done) {
    //     try {
    //         await media.release();
    //         console.info('MediaLibraryTest : ASSET_PROMISE release 0014_01 SUCCESS ');
    //         done();
    //     } catch (error) {
    //         console.info('MediaLibraryTest : ASSET_PROMISE release 0014_01 file, message = ' + error);
    //         done();
    //     }
    // });

    function getAllObjectInfo(data) {
        if (data != undefined) {
            console.info('MediaLibraryTest : ASSET_PROMISE id is ' + data.id);
            console.info('MediaLibraryTest : ASSET_PROMISE uri is ' + data.uri);
            console.info('MediaLibraryTest : ASSET_PROMISE displayName is ' + data.displayName);
            console.info('MediaLibraryTest : ASSET_PROMISE mediaType is ' + data.title);
            console.info('MediaLibraryTest : ASSET_PROMISE relativePath is ' + data.relativePath);
        } else {
            console.info('MediaLibraryTest : ASSET_PROMISE getAllObjectInfo no assets');
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
})
