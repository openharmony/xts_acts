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
        onsole.info('Smart Album Callback MediaLibraryTest: beforeAll.');

    })

    beforeEach(function () {
        console.info('Smart Album Callback MediaLibraryTest: beforeEach.');

    })
    afterEach(function () {
        console.info('Smart Album Callback MediaLibraryTest: afterEach.');

    })
    afterAll(function () {
        console.info('Smart Album Callback MediaLibraryTest: afterAll.');

    })
    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_CALLBACK_001
     * @tc.name      : Get PrivateSmartAlbum by fav
     * @tc.desc      : Get PrivateSmartAlbum by fav
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETPRIVATEALBUM_CALLBACK_001', 0, async function (done) {
        asset = await media.createAsset(mediaType, "image0002.jpg", path);
        media.getPrivateAlbum(mediaLibrary.PrivateAlbumType.TYPE_FAVORITE, getPrivateAlbumCallBack);
        done();
    });

    function getPrivateAlbumCallBack(err, favSmartAlbums) {
        if (favSmartAlbums != undefined) {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getPrivateAlbum favSmartAlbums');
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK favSmartAlbums ' + favSmartAlbums[0].albumName);
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK favSmartAlbums ' + favSmartAlbums[0].albumCapacity);
            favSmartAlbum = favSmartAlbums[0];
            favSmartAlbum.addAsset(asset.uri, addAssetCallBack);
            done();
        } else {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getPrivateAlbumCallBack Unsuccessfull ' + err);
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getPrivateAlbumCallBack : FAIL');
            done();
        }
    }

    function addAssetCallBack(err, data) {
        if (data != undefined) {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK fav addAsset success');
            favSmartAlbum.getFileAssets(getFileAssetsCallBack);
            favSmartAlbum.removeAsset(asset.uri, removeAssetCallBack);
            done();
        } else {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK addAssetCallBack Unsuccessfull ' + err);
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK addAssetCallBack : FAIL');
            done();
        }
    }
    function removeAssetCallBack(err, data) {
        if (data != undefined) {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK fav removeAsset success');
            favSmartAlbum.getFileAssets(getFileAssetsCallBack);
            done();
        } else {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK removeAssetCallBack Unsuccessfull ' + err);
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getPrivateremoveAssetCallBackAlbumCallBack : FAIL');
            done();
        }
    }
    function getFileAssetsCallBack(err, fSmartFetchFileResult) {
        if (fSmartFetchFileResult != undefined) {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getFileAssetsCallBack Success fSmartFetchFileResult = '
                + fSmartFetchFileResult.getCount());
            done();
        } else {
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getFileAssetsCallBack Unsuccessfull ' + err);
            console.info('MediaLibraryTest : SMARTALBUM_CALLBACK getFileAssetsCallBack : FAIL');
            done();
        }
    }
})
