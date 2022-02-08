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

describe('album.promise.test.js', function () {

    let mediaType = mediaLibrary.MediaType.IMAGE;
    let path = "Pictures/"
    var asset;
    var media = mediaLibrary.getMediaLibrary();
    var album;
    beforeAll(function () {
        onsole.info('Album Promise MediaLibraryTest: beforeAll.');

    })

    beforeEach(function () {
        console.info('Album Promise MediaLibraryTest: beforeEach.');

    })
    afterEach(function () {
        console.info('Album Promise MediaLibraryTest: afterEach.');

    })
    afterAll(function () {
        console.info('Album Promise MediaLibraryTest: afterAll.');

    })

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001
     * @tc.name      : Get Album by AlbumNoArgsfetchOp
     * @tc.desc      : Get Album by AlbumNoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_001', 0, async function (done) {
        asset = await media.createAsset(mediaType, "image0003.jpg", path);
        let albumList = await media.getAlbums(AlbumNoArgsfetchOp);
        album = albumList[0];
        console.info('MediaLibraryTest : ALBUM_PROMISE album.albumName = ' + album.albumName);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002
     * @tc.name      : Get Album by AlbumHasArgsfetchOp
     * @tc.desc      : Get Album by AlbumHasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_002', 0, async function (done) {
        let albumHasList = await media.getAlbums(AlbumHasArgsfetchOp);
        let albumHas = albumHasList[0];
        console.info('MediaLibraryTest : ALBUM_PROMISE albumHas.albumName = ' + albumHas.albumName);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003
     * @tc.name      : Modify Album
     * @tc.desc      : Modify Album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_PROMISE_003', 0, async function (done) {
        album.albumName = "hello";
        await album.commitModify();
        console.info('MediaLibraryTest : ALBUM_PROMISE Modify album.albumName = ' + album.albumName);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_004
     * @tc.name      : Get Album Assets by fileNoArgsfetchOp
     * @tc.desc      : Get Album Assets by fileNoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_PROMISE_004', 0, async function (done) {
        let albumFetchFileResult = await album.getFileAssets(fileNoArgsfetchOp);
        let albumAssetList = await albumFetchFileResult.getAllObject();
        albumAssetList.forEach(getAllObjectInfo);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_005
     * @tc.name      : Get Album Assets by fileHasArgsfetchOp
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_PROMISE_005', 0, async function (done) {
        let albumFetchFileResult = await album.getFileAssets(fileHasArgsfetchOp);
        let albumAssetList = await albumFetchFileResult.getAllObject();
        albumAssetList.forEach(getAllObjectInfo);
        await media.deleteAsset(asset.uri);
        done();
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
})
