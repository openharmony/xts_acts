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

describe('favSmartAlbum.promise.test.js', function () {

    let mediaType = mediaLibrary.MediaType.IMAGE;
    let path = "Pictures/"
    var media = mediaLibrary.getMediaLibrary();
    var asset;
    var favSmartAlbum;
    beforeAll(function () {
        onsole.info('Smart Album Promise MediaLibraryTest: beforeAll.');

    })

    beforeEach(function () {
        console.info('Smart Album Promise MediaLibraryTest: beforeEach.');

    })
    afterEach(function () {
        console.info('Smart Album Promise MediaLibraryTest: afterEach.');

    })
    afterAll(function () {
        console.info('Smart Album Promise MediaLibraryTest: afterAll.');

    })
    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001
     * @tc.name      : Get PrivateSmartAlbum by fav
     * @tc.desc      : Get PrivateSmartAlbum by fav
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_PROMISE_001', 0, async function (done) {
        asset = await media.createAsset(mediaType, "image002.jpg", path);
        const favSmartAlbums = await media.getPrivateAlbum(mediaLibrary.PrivateAlbumType.TYPE_FAVORITE);
        console.info('MediaLibraryTest : SMARTALBUM_PROMISE getPrivateAlbum favSmartAlbums');
        console.info('MediaLibraryTest : SMARTALBUM_PROMISE favSmartAlbums ' + favSmartAlbums[0].albumName);
        console.info('MediaLibraryTest : SMARTALBUM_PROMISE favSmartAlbums ' + favSmartAlbums[0].albumCapacity);
        favSmartAlbum = favSmartAlbums[0];
        done();
    });
    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002
     * @tc.name      : Add asset
     * @tc.desc      : Add asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_ADDASSET_PROMISE_002', 0, async function (done) {
        await favSmartAlbum.addAsset(asset.uri);
        console.info('MediaLibraryTest : SMARTALBUM_PROMISE fav addAsset = ', asset.uri);
        let fSmartFetchFileResult = await favSmartAlbum.getFileAssets();
        console.info('MediaLibraryTest : SMARTALBUM_PROMISE getFileAssets Successfull fSmartFetchFileResult = '
            + fSmartFetchFileResult.getCount());
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003
     * @tc.name      : Remove asset
     * @tc.desc      : Remove asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_REMOVEASSET_PROMISE_003', 0, async function (done) {
        await favSmartAlbum.removeAsset(asset.uri);
        let fSmartFetchFileResultNew = await favSmartAlbum.getFileAssets();
        console.info('MediaLibraryTest : SMARTALBUM_PROMISE getFileAssets Successfull remove fSmartFetchFileResultNew = '
            + fSmartFetchFileResultNew.getCount());
        await media.deleteAsset(asset.uri);
        done();
    });
})
