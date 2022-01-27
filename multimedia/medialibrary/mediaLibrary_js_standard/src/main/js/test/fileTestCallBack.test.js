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

describe('file.callback.test.js', function () {
    var asset;
    var assetMove;
    var media = mediaLibrary.getMediaLibrary();
    beforeAll(function () {
        onsole.info('File Callback MediaLibraryTest: beforeAll.');

    })

    beforeEach(function () {
        console.info('File Callback MediaLibraryTest: beforeEach.');

    })
    afterEach(function () {
        console.info('File Callback MediaLibraryTest: afterEach.');

    })
    afterAll(function () {
        console.info('File Callback MediaLibraryTest: afterAll.');

    })

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001
     * @tc.name      : Create an asset in predefined path
     * @tc.desc      : Create an asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001', 0, async function (done) {
        let mediaType = mediaLibrary.MediaType.IMAGE;
        let path = "Pictures/"
        let pathMove = "Pictures/Move/"
        asset = await media.createAsset(mediaType, "image00001.jpg", path);
        assetMove = await media.createAsset(mediaType, "imageMove00001.jpg", pathMove);
        media.createAsset(mediaType, "imageCallBack000001.jpg", path, createAssetCallBack);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002
     * @tc.name      : Modify asset
     * @tc.desc      : Modify asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002', 0, async function (done) {
        asset.title = "image00003";
        asset.relativePath = "Pictures/Move/";
        asset.displayName = "image00002.jpg"
        asset.commitModify(commitModifyCallBack);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ASSET_CALLBACK_003
     * @tc.name      : Get assetList By NoArgsfetchOp
     * @tc.desc      : Get assetList By NoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_CALLBACK_003', 0, async function (done) {
        media.getFileAssets(fileNoArgsfetchOp, getFileAssetsCallBack);
        done();
    });
    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ASSET_CALLBACK_004
     * @tc.name      : Get assetList By HasArgsfetchOp
     * @tc.desc      : Get assetList By HasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_ASSET_CALLBACK_004', 0, async function (done) {
        media.getFileAssets(fileHasArgsfetchOp, getFileAssetsCallBack);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK_005
     * @tc.name      : Open and Close asset
     * @tc.desc      : Open and Close asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK_005', 0, async function (done) {
        asset.open('Rw', openCallBack);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_AND_TRA_ASSET_CALLBACK_006
     * @tc.name      : Favourite and Trash 
     * @tc.desc      : Favourite and Trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_FAV_AND_TRA_ASSET_CALLBACK_006', 0, async function (done) {
        asset.isFavorite(isFavoriteCallBack);
        asset.isTrash(isTrashCallBack);
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_CALLBACK_007
     * @tc.name      : Favourite and Trash 
     * @tc.desc      : Favourite and Trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_CALLBACK_007', 0, async function (done) {
        asset.isDirectory(isDirectoryCallBack);
        done();
    });


    function getAllObjectInfo(data) {
        if (data != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK id is ' + data.id);
            console.info('MediaLibraryTest : ASSET_CALLBACK uri is ' + data.uri);
            console.info('MediaLibraryTest : ASSET_CALLBACK displayName is ' + data.displayName);
            console.info('MediaLibraryTest : ASSET_CALLBACK mediaType is ' + data.title);
            console.info('MediaLibraryTest : ASSET_CALLBACK relativePath is ' + data.relativePath);
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK getAllObjectInfo no assets');
        }
    }

    function createAssetCallBack(err, asset) {
        if (asset != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK createAsset Successfull ' + asset.uri);
            console.info('MediaLibraryTest : ASSET_CALLBACK createAsset : PASS');
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE, getPublicDirectory);
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK createAsset Unsuccessfull ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK createAsset : FAIL');
            done();
        }

    }

    function getPublicDirectory(err, publicDirectory) {
        if (publicDirectory != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK publicDirectory = ' + publicDirectory);
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK publicDirectory Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK publicDirectory : FAIL');
            done();
        }

    }

    function commitModifyCallBack(err, commitModify) {
        if (commitModify != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify success');
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify : FAIL');
            done();
        }

    }

    function getFileAssetsCallBack(err, fetchFileResult) {
        if (fetchFileResult != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK fetchFileResult success');
            fetchFileResult.getAllObject((err1, data1) => {
                if (data1 != undefined) {
                    data1.forEach(getAllObjectInfo);
                    console.info('MediaLibraryTest : getAllObject :PASS');
                    done();
                }
                console.info('MediaLibraryTest : getFileAssets :No data');
                done();
            });
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK fetchFileResult Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK fetchFileResult : FAIL');
            done();
        }
    }

    function openCallBack(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
        }
        console.info("==========================asset.open success=======================>");
        console.debug("open success fd = " + JSON.stringify(fd));
        console.info("==========================asset.close begin=======================>");
        asset.close(fd, closeCallBack);
        console.info("==========================asset.close end=======================>");

    }

    function closeCallBack(closeErr) {
        if (closeErr != undefined) {
            console.info('MediaLibraryTest : close : FAIL ' + closeErr.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
        }
        console.info("==========================asset.close success=======================>");
    }

    function isDirectoryCallBack(err, isDirectory) {
        if (isDirectory != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK isDirectory = ' + isDirectory);
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK isDirectory Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK isDirectory : FAIL');
            done();
        }

    }
    function favoriteCallBack(err, favorite) {
        console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK favorite');
        done();

    }
    function isFavoriteCallBack(err, isFavorite) {
        if (isFavorite != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK isFavorite = ' + isFavorite);
            asset.favorite(true, favoriteCallBack);
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK isFavorite Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK isFavorite : FAIL');
            done();
        }

    }
    function trashCallBack(err, trash) {
        console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK trash');
        done();
    }
    function isTrashCallBack(err, isTrash) {
        if (isTrash != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK isTrash = ' + isTrash);
            asset.trash(true, trashCallBack);
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK isTrash Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK isTrash : FAIL');
            done();
        }
    }
    function deleteAssetCallBack(err, deleteAsset) {
        if (deleteAsset != undefined) {
            console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK deleteAssetCode = ' + deleteAsset);
            console.info('MediaLibraryTest : ASSET_CALLBACK ASSET_CALLBACK deleteAssetCode success');
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK deleteAsset Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK deleteAsset : FAIL');
            done();
        }
    }

})
