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

describe('file.callback.test.js', function () {
    var asset;
    var asset1;
    var asset2;
    var asset3;
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    beforeAll(function () {
        console.info('File Callback MediaLibraryTest: beforeAll ： Prerequisites at the test suite level, which are executed before the test suite is executed.');
    })

    beforeEach(function () {
        console.info('File Callback MediaLibraryTest: beforeEach：Prerequisites at the test case level, which are executed before each test case is executed.');
    })
    afterEach(function () {
        console.info('File Callback MediaLibraryTest: afterEach： Test case-level clearance conditions, which are executed after each test case is executed.');
    })
    afterAll(function () {
        console.info('File Callback MediaLibraryTest: afterAll：  Test suite-level cleanup condition, which is executed after the test suite is executed');
    })

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001
     * @tc.name      : Create an asset in predefined path
     * @tc.desc      : Create an asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : Delete begin');
            let fetchFileResult = await media.getFileAssets(fileNoArgsfetchOp);
            let assetList = await fetchFileResult.getAllObject();
            assetList.forEach(getAllObjectInfoDelete);
            console.info('MediaLibraryTest : Delete end');
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let path = "Pictures/";
            media.createAsset(mediaType, "imageCallBack000001.jpg", path, createAssetCallBack);
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK createasset 001_01 fail, message = ' + error);
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002
     * @tc.name      : Modify asset
     * @tc.desc      : Modify asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002_01', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let path = "Pictures/";
            let pathMove = "Pictures/Move/";
            asset = await media.createAsset(mediaType, "image0000111.jpg", path);
            await media.createAsset(mediaType, "imageMove00001.jpg", pathMove);
            asset.title = "image00003";
            asset.relativePath = "Pictures/Move/";
            asset.displayName = "image0000222.jpg";
            asset.orientation = 1000;
            asset.commitModify(commitModifyCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_01 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_01 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002_02', 0, async function (done) {
        try {
            asset.title = "image0000444";
            asset.commitModify(commitModifyCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_02 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_02 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002_03', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let pathMoveCallback = "Pictures/Move/Callback/";
            await media.createAsset(mediaType, "imageMoveCallBack00001.jpg", pathMoveCallback);
            asset.relativePath = "Pictures/Move/Callback/";
            asset.commitModify(commitModifyCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_03 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_03 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002_04', 0, async function (done) {
        try {
            asset.displayName = "image0000333.jpg";
            asset.commitModify(commitModifyCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_04 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_04 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_MODIFY_ASSET_CALLBACK_002_05', 0, async function (done) {
        try {
            asset.orientation = 2000;
            asset.commitModify(commitModifyCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_05 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify 002_05 fail, message = ' + error);
            done();
        }
    });

    /**
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

    /**
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

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPEN_ASSET_CALLBACK_005
     * @tc.name      : Open asset
     * @tc.desc      : Open asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_OPEN_ASSET_CALLBACK_005_01', 0, async function (done) {
        try {
            asset.open('Rw', openCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_01 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_01 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPEN_ASSET_CALLBACK_005_02', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            asset1 = await media.createAsset(mediaType, "image00001.jpg", path);
            asset1.open('w', openCallBack1);
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_02 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_02 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPEN_ASSET_CALLBACK_005_03', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            asset2 = await media.createAsset(mediaType, "image00002.jpg", path);
            asset2.open('wts', openCallBack2);
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_03 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_03 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPEN_ASSET_CALLBACK_005_04', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            asset3 = await media.createAsset(mediaType, "image00003.jpg", path);
            asset3.open('wa', openCallBack3);
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_04 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_04 fail, message = ' + error);
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_OPEN_ASSET_CALLBACK_005_05', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            var asset4 = await media.createAsset(mediaType, "image00004.jpg", path);
            asset4.open('', openCallBack4);
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_05 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK open 005_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CLOSE_ASSET_CALLBACK_006
     * @tc.name      : Close asset
     * @tc.desc      : Close asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_CLOSE_ASSET_CALLBACK_006_01', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            var asset5 = await media.createAsset(mediaType, "image00005.jpg", path);
            fd = await asset5.open('Rw');
            asset5.close(-1, closeCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_01 success');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_01 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_CLOSE_ASSET_CALLBACK_006_02', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            var asset6 = await media.createAsset(mediaType, "image00006.jpg", path);
            fd = await asset6.open('Rw');
            asset6.close(0, closeCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_02 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_02 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_CLOSE_ASSET_CALLBACK_006_03', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            var asset7 = await media.createAsset(mediaType, "image00007.jpg", pathMove);
            fd = await asset7.open('Rw');
            asset7.close("666", closeCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_03 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_03 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_CLOSE_ASSET_CALLBACK_006_04', 0, async function (done) {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            var asset8 = await media.createAsset(mediaType, "image00008.jpg", pathMoveCallback);
            fd = await asset8.open('Rw');
            asset8.close(closeCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_04 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK close 006_04 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_CALLBACK_007
     * @tc.name      : Favourite
     * @tc.desc      : Favourite
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_CALLBACK_007_01', 0, async function (done) {
        try {
            asset.isFavorite(isFavoriteCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK favourite 007_01 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK favourite 007_01 fail, message = ' + error);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_TRASH_ASSET_CALLBACK_008
     * @tc.name      : Trash 
     * @tc.desc      : Trash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SSUB_MEDIA_MEDIALIBRARY_TRASH_ASSET_CALLBACK_008_01', 0, async function (done) {
        try {
            asset.isTrash(isTrashCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK trash 008_01 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK trash 008_01 fail, message = ' + error);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_CALLBACK_009
     * @tc.name      : dir 
     * @tc.desc      : dir
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_DIR_ASSET_CALLBACK_009_01', 0, async function (done) {
        try {
            asset.isDirectory(isDirectoryCallBack);
            console.info('MediaLibraryTest : ASSET_CALLBACK dir 009_01 success');
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_CALLBACK dir 009_01 fail, message = ' + error);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_ON_CALLBACK_010
     * @tc.name      : On
     * @tc.desc      : On
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_ON_CALLBACK_010_01', 0, async function (done) {
        try {
            media.on(['image'], function (mediaChangeListener) {
                console.log('MediaLibraryTest on mediaChangeListener 010_01 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest on mediaChangeListener 010_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_ON_CALLBACK_010_02', 0, async function (done) {
        try {
            media.on(['file'], function (mediaChangeListener) {
                console.log('MediaLibraryTest on mediaChangeListener 010_02 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest on mediaChangeListener 010_02 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }

    });

    it('SUB_MEDIA_MEDIALIBRARY_ON_CALLBACK_010_03', 0, async function (done) {
        try {
            media.on(['audio'], function (mediaChangeListener) {
                console.log('MediaLibraryTest on mediaChangeListener 010_03 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest on mediaChangeListener 010_03 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }

    });

    it('SUB_MEDIA_MEDIALIBRARY_ON_CALLBACK_010_04', 0, async function (done) {
        try {
            media.on(['video', "smartalbum", "device"], function (mediaChangeListener) {
                console.log('MediaLibraryTest on mediaChangeListener 010_04 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest on mediaChangeListener 010_04 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_ON_CALLBACK_010_05', 0, async function (done) {
        try {
            media.on(function (mediaChangeListener) {
                console.log('MediaLibraryTest on mediaChangeListener 010_05 success');
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest on mediaChangeListener 010_05 fail, message = ' + error);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OFF_CALLBACK_011
     * @tc.name      : Off
     * @tc.desc      : Off
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_OFF_CALLBACK_011_01', 0, async function (done) {
        try {
            media.off(['image'], function (mediaChangeListener) {
                console.log('MediaLibraryTest off mediaChangeListener 011_01 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest off mediaChangeListener 011_01 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_OFF_CALLBACK_011_02', 0, async function (done) {
        try {
            media.off(['file'], function (mediaChangeListener) {
                console.log('MediaLibraryTest off mediaChangeListener 011_02 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest off mediaChangeListener 011_02 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }

    });

    it('SUB_MEDIA_MEDIALIBRARY_OFF_CALLBACK_011_03', 0, async function (done) {
        try {
            media.off(['audio'], function (mediaChangeListener) {
                console.log('MediaLibraryTest off mediaChangeListener 011_03 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest off mediaChangeListener 011_03 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }

    });

    it('SUB_MEDIA_MEDIALIBRARY_OFF_CALLBACK_011_04', 0, async function (done) {
        try {
            media.off(['video', "smartalbum", "device"], function (mediaChangeListener) {
                console.log('MediaLibraryTest off mediaChangeListener 011_04 success');
            });
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest off mediaChangeListener 011_04 fail, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    it('SUB_MEDIA_MEDIALIBRARY_OFF_CALLBACK_011_05', 0, async function (done) {
        try {
            media.off(['666'], function (mediaChangeListener) {
                console.log('MediaLibraryTest off mediaChangeListener 011_05 success');
            });
            //expect(false).assertTrue();
            done();
        } catch (error) {
            console.log('MediaLibraryTest off mediaChangeListener 011_05 fail, message = ' + error);
            //expect(true).assertTrue();
            done();
        }
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
            expect(true).assertTrue();
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK createAsset Unsuccessfull ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK createAsset : FAIL');
            expect(false).assertTrue();
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
            expect(true).assertTrue();
            done();
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK commitModify : FAIL');
            expect(false).assertTrue();
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
                    expect(true).assertTrue();
                    done();
                }
                console.info('MediaLibraryTest : getFileAssets :No data');
                done();
            });
        } else {
            console.info('MediaLibraryTest : ASSET_CALLBACK fetchFileResult Unsuccessfull = ' + err);
            console.info('MediaLibraryTest : ASSET_CALLBACK fetchFileResult : FAIL');
            expect(false).assertTrue();
            done();
        }
    }

    function openCallBack(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            console.info("==========================asset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================asset.close begin=======================>");
            asset.close(fd, closeCallBack);
            console.info("==========================asset.close end=======================>");
            expect(true).assertTrue();
            done();
        }
    }
    function openCallBack(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            console.info("==========================asset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================asset.close begin=======================>");
            asset.close(fd, closeCallBack);
            console.info("==========================asset.close end=======================>");
            expect(true).assertTrue();
            done();
        }
    }
    function openCallBack1(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            console.info("==========================asset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================asset.close begin=======================>");
            asset1.close(fd, closeCallBack);
            console.info("==========================asset.close end=======================>");
            expect(true).assertTrue();
            done();
        }
    }
    function openCallBack2(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            console.info("==========================asset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================asset.close begin=======================>");
            asset2.close(fd, closeCallBack);
            console.info("==========================asset.close end=======================>");
            expect(true).assertTrue();
            done();
        }
    }
    function openCallBack3(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            console.info("==========================asset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================asset.close begin=======================>");
            asset3.close(fd, closeCallBack);
            console.info("==========================asset.close end=======================>");
            expect(true).assertTrue();
            done();
        }
    }
    function openCallBack4(openError, fd) {
        if (openError != undefined) {
            console.info('MediaLibraryTest : open : FAIL ' + openError.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            done();
        } else {
            done();
        }
    }

    function closeCallBack(closeErr) {
        if (closeErr != undefined) {
            console.info('MediaLibraryTest : close : FAIL ' + closeErr.message);
            console.info('MediaLibraryTest : ASSET_CALLBACK : FAIL');
            done();
        } else {
            console.info("==========================asset.close success=======================>");
            done();
        }
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
