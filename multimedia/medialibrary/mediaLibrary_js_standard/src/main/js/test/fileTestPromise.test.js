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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
let fileKeyObj = mediaLibrary.FileKey
let AlbumNoArgsfetchOp = {
    selections: "",
    selectionArgs: [],
}
let AlbumHasArgsfetchOp = {
    selections: fileKeyObj.PATH + " LIKE ? ",
    selectionArgs: ["/data/media%"],
}
let type1 = mediaLibrary.MediaType.IMAGE
let fileHasArgsfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + "= ?",
    selectionArgs: [type1.toString()],
}
let fileNoArgsfetchOp = {
    selections: "",
    selectionArgs: [],
}

describe('file.promise.test.js', function () {
    var asset;
    var assetMove;
    var media = mediaLibrary.getMediaLibrary();
    beforeAll(function () {
        onsole.info('File Promise MediaLibraryTest: beforeAll.');

    })

    beforeEach(function () {
        console.info('File Promise MediaLibraryTest: beforeEach.');

    })
    afterEach(function () {
        console.info('File Promise MediaLibraryTest: afterEach.');

    })
    afterAll(function () {
        console.info('File Promise MediaLibraryTest: afterAll.');

    })

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001
     * @tc.name      : Create an asset in predefined path
     * @tc.desc      : Create an asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001', 0, async function (done) {
        let mediaType = mediaLibrary.MediaType.IMAGE;
        let path = "Pictures/"
        let pathMove = "Pictures/Move/"
        asset = await media.createAsset(mediaType, "image01.jpg", path);
        assetMove = await media.createAsset(mediaType, "image01Move.jpg", pathMove);
        console.info('MediaLibraryTest : ASSET_PROMISE asset.displayName = ' + asset.displayName);
        console.info('MediaLibraryTest : ASSET_PROMISE asset.displayName = ' + asset.title);
        console.info('MediaLibraryTest : ASSET_PROMISE assetMove.displayName = ' + assetMove.displayName);
        let relativePath = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
        console.info('MediaLibraryTest : ASSET_PROMISE relativePath = ' + relativePath);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002
     * @tc.name      : Modify asset
     * @tc.desc      : Modify asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_PROMISE_002', 0, async function (done) {
        asset.title = "image03";
        asset.relativePath = "Pictures/Move/";
        asset.displayName = "image02.jpg"
        await asset.commitModify();
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_003
     * @tc.name      : Get assetList By NoArgsfetchOp
     * @tc.desc      : Get assetList By NoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_003', 0, async function (done) {
        let fetchFileResult = await media.getFileAssets(fileNoArgsfetchOp);
        let assetList = await fetchFileResult.getAllObject();
        assetList.forEach(getAllObjectInfo);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004
     * @tc.name      : Get assetList By HasArgsfetchOp
     * @tc.desc      : Get assetList By HasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_PROMISE_004', 0, async function (done) {
        let fetchFileResult = await media.getFileAssets(fileHasArgsfetchOp);
        let assetList = await fetchFileResult.getAllObject();
        assetList.forEach(getAllObjectInfo);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005
     * @tc.name      : Open and Close asset
     * @tc.desc      : Open and Close asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_PROMISE_005', 0, async function (done) {
        asset.open('Rw').then((openError, fd) => {
            if (openError == undefined) {
                console.info('MediaLibraryTest : open : FAIL ' + openError.message);
                console.info('MediaLibraryTest : ASSET_PROMISE : FAIL');
                expect(false).assertTrue();
            }
            console.info("==========================fileAsset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================fileAsset.close begin=======================>");
            fileAsset.close(fd).then((closeErr) => {
                if (closeErr == undefined) {
                    console.info('MediaLibraryTest : close : FAIL ' + closeErr.message);
                    console.info('MediaLibraryTest : ASSET_PROMISE : FAIL');
                    expect(false).assertTrue();
                }
                console.info("==========================fileAsset.close success=======================>");
                console.info('MediaLibraryTest : ASSET_PROMISE : PASS');
                expect(true).assertTrue();
            });
            console.info("==========================fileAsset.close end=======================>");
        });
        console.info("==========================fileAsset.open end=======================>");
        done();
    });

    /*
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

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_PROMISE_007
     * @tc.name      : Favourite and Trash 
     * @tc.desc      : Favourite and Trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_PROMISE_007', 0, async function (done) {
        let isDirectory = await asset.isDirectory();
        console.info('MediaLibraryTest : ASSET_PROMISE isDirectory = ' + isDirectory);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_008
     * @tc.name      : Delete asset 
     * @tc.desc      : Delete asset 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_DELETE_ASSET_PROMISE_008', 0, async function (done) {
        await media.deleteAsset(asset.uri);
        await media.deleteAsset(assetMove.uri);
        console.info('MediaLibraryTest : ASSET_PROMISE DELETE SUCCESS');
        done();
    });

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
})
