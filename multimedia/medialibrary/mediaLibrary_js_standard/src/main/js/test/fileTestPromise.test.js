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

import mediaLibrary from '@ohos.multimedia.medialibrary';
import featureAbility from '@ohos.ability.featureAbility';
import fileio from '@ohos.fileio';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
let fileKeyObj = mediaLibrary.FileKey;
let fileType = mediaLibrary.MediaType.FILE;
let imageType = mediaLibrary.MediaType.IMAGE;
let videoType = mediaLibrary.MediaType.VIDEO;
let audioType = mediaLibrary.MediaType.AUDIO;

let imagesfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [imageType.toString()],
};
let videosfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [videoType.toString()],
};
let audiosfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [audioType.toString()],
};
let filesfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
};

function checkAssetAttr(done, attr, testNum, asset, checkType) {
    if (checkType && asset[attr] != checkType) {
        console.info(`MediaLibraryTest : ASSET_PROMISE getFileAssets ${testNum} failed`);
        expect(false).assertTrue();
        done();
    } else if (asset[attr] == undefined) {
        console.info(`MediaLibraryTest : ASSET_PROMISE getFileAssets ${testNum} failed`);
        expect(false).assertTrue();
        done();
    }
}

describe('file.promise.test.js', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    beforeAll(function () {});
    beforeEach(function () {});
    afterEach(function () {});
    afterAll(function () {});

    async function copyFile(fd1, fd2) {
        let stat = await fileio.fstat(fd1);
        let buf = new ArrayBuffer(stat.size);
        await fileio.read(fd1, buf);
        await fileio.write(fd2, buf);
    }

    // ------------------------------- image type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_01', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(imageType, 'image03.jpg', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            const asset2 = dataList[1];
            const creatAsset2 = await media.createAsset(imageType, 'image04.jpg', path);
            const fd2 = await asset2.open('rw');
            const creatAssetFd2 = await creatAsset2.open('rw');
            await copyFile(fd2, creatAssetFd2);
            await creatAsset2.close(creatAssetFd2);
            await asset2.close(fd2);

            if (creatAsset1.id != creatAsset2.id) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_01 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_01 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_01 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_02
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file displayName and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_02', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'displayName', '001_02', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'displayName', '001_02', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'displayName', '001_02', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_02 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_02 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_03
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_03', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'relativePath', '001_03', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'relativePath', '001_03', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'relativePath', '001_03', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_03 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_03 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_04
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_04', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'size', '001_04', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'size', '001_04', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'size', '001_04', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_04 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_04 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_05
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_05', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'dateAdded', '001_05', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'dateAdded', '001_05', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'dateAdded', '001_05', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_05 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_05 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_07
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_07', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset = dataList[0];
            asset.title = `title_${new Date().getTime()}`;
            await asset.commitModify();
            const id = asset.id;
            const idOP = { selections: fileKeyObj.ID + '= ?', selectionArgs: ['' + id] };
            const newAssets = await media.getFileAssets(idOP);
            const newdataList = await newAssets.getAllObject();
            const newAsset = newdataList[0];

            if (asset.dateModified != undefined) {
                if (newAsset.dateModified != asset.dateModified) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                if (newAsset.dateModified != undefined) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_07 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_08', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'mediaType', '001_08', firstAsset, imageType);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'mediaType', '001_08', midAsset, imageType);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'mediaType', '001_08', lastAsset, imageType);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_08 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_08 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_09
     * @tc.name      : getFileAssets
     * @tc.desc      : Get the width attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_09', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'width', '001_09', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'width', '001_09', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'width', '001_09', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_09 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 001_09 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_10
     * @tc.name      : createAsset
     * @tc.desc      : Get the height attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_10', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'height', '001_10', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'height', '001_10', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'height', '001_10', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_10 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_10 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_11
     * @tc.name      : createAsset
     * @tc.desc      : Get the orientaion attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_11', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'orientation', '001_11', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'orientation', '001_11', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'orientation', '001_11', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_11 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_11 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_12
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record and get the property as picture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_001_12', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            const fileAssets = await media.getFileAssets(imagesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(imageType, 'image3.jpg', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);
            if (creatAsset1.mediaType == imageType) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_12 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_12 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 001_12 failed ' + error);
            expect(false).assertTrue();
            done();
        }
    });
    // -------------------------------  image type end -----------------------------

    // ------------------------------- video type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_01', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(videoType, 'video03.mp4', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            const asset2 = dataList[0];
            const creatAsset2 = await media.createAsset(videoType, 'video04.mp4', path);
            const fd2 = await asset2.open('rw');
            const creatAssetFd2 = await creatAsset2.open('rw');
            await copyFile(fd2, creatAssetFd2);
            await creatAsset2.close(creatAssetFd2);
            await asset2.close(fd2);
            if (creatAsset1.id != creatAsset2.id) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_01 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_01 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_01 failed' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_02
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file displayName and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_02', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'displayName', '002_02', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'displayName', '002_02', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'displayName', '002_02', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_02 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_02 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_03
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_03', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'relativePath', '002_04', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'relativePath', '002_04', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'relativePath', '002_04', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_03 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_03 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_04
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_04', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'size', '002_04', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'size', '002_04', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'size', '002_04', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_04 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_04 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_05
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_05', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'dateAdded', '002_05', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'dateAdded', '002_05', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'dateAdded', '002_05', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_05 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_05 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_07
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_07', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset = dataList[0];
            asset.title = `title_${new Date().getTime()}`;
            await asset.commitModify();
            const id = asset.id;
            const idOP = { selections: fileKeyObj.ID + '= ?', selectionArgs: ['' + id] };
            const newAssets = await media.getFileAssets(idOP);
            const newdataList = await newAssets.getAllObject();
            const newAsset = newdataList[0];

            if (asset.dateModified != undefined) {
                if (newAsset.dateModified != asset.dateModified) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                if (newAsset.dateModified != undefined) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_07 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_08', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'mediaType', '002_08', firstAsset, videoType);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'mediaType', '002_08', midAsset, videoType);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'mediaType', '002_08', lastAsset, videoType);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_08 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_08 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_09
     * @tc.name      : getFileAssets
     * @tc.desc      : Get the width attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_09', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'width', '002_09', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'width', '002_09', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'width', '002_09', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_09 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 002_09 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_10
     * @tc.name      : createAsset
     * @tc.desc      : Get the height attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_10', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'height', '002_10', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'height', '002_10', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'height', '002_10', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_10 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_10 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_11
     * @tc.name      : createAsset
     * @tc.desc      : Get the orientaion attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_11', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'orientation', '002_11', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'orientation', '002_11', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'orientation', '002_11', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_11 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_11 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_12
     * @tc.name      : createAsset
     * @tc.desc      : Get the duration attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_12', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'duration', '002_12', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'duration', '002_12', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'duration', '002_12', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_12 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_12 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_13
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record and get the property as picture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_002_13', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(videoType, 'video3.mp4', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);
            if (creatAsset1.mediaType == videoType) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_13 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_13 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 002_13 failed');
            expect(false).assertTrue();
            done();
        }
    });
    // -------------------------------  video type end -----------------------------

    // ------------------------------- audio type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_01', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(audioType, 'audio03.mp3', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            const asset2 = dataList[0];
            const creatAsset2 = await media.createAsset(audioType, 'audio04.mp3', path);
            const fd2 = await asset2.open('rw');
            const creatAssetFd2 = await creatAsset2.open('rw');
            await copyFile(fd2, creatAssetFd2);
            await creatAsset2.close(creatAssetFd2);
            await asset2.close(fd2);

            if (creatAsset1.id != creatAsset2.id) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_01 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_01 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_01 failed');
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_02
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file name and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_02', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'displayName', '003_02', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'displayName', '003_02', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'displayName', '003_02', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_02 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_02 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_03
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_03', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'relativePath', '003_03', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'relativePath', '003_03', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'relativePath', '003_03', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_03 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_03 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_04
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_04', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'size', '003_04', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'size', '003_04', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'size', '003_04', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_04 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_04 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_05
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_05', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'dateAdded', '003_05', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'dateAdded', '003_05', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'dateAdded', '003_05', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_05 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_05 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_07
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_07', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset = dataList[0];
            asset.title = `title_${new Date().getTime()}`;
            await asset.commitModify();

            const id = asset.id;
            const idOP = { selections: fileKeyObj.ID + '= ?', selectionArgs: ['' + id] };
            const newAssets = await media.getFileAssets(idOP);
            const newdataList = await newAssets.getAllObject();
            const newAsset = newdataList[0];

            if (asset.dateModified != undefined) {
                if (newAsset.dateModified != asset.dateModified) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                if (newAsset.dateModified != undefined) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_07 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_08', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'mediaType', '003_08', firstAsset, audioType);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'mediaType', '003_08', midAsset, audioType);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'mediaType', '003_08', lastAsset, audioType);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_08 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_08 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_09
     * @tc.name      : getFileAssets
     * @tc.desc      : Get the artist attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_09', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'width', '003_09', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'width', '003_09', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'width', '003_09', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_09 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 003_09 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_10
     * @tc.name      : createAsset
     * @tc.desc      : Get the album attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_10', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'albumName', '003_10', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'albumName', '003_10', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'albumName', '003_10', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_10 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_10 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_11
     * @tc.name      : createAsset
     * @tc.desc      : Get the duration attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_11', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'duration', '003_11', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'duration', '003_11', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'duration', '003_11', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_11 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_11 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_12
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record and get the property as picture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_003_12', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(audioType, 'audio3.mp3', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);
            if (creatAsset1.mediaType == audioType) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_12 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_12 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 003_12 failed');
            expect(false).assertTrue();
            done();
        }
    });
    // -------------------------------  audio type end -----------------------------

    // ------------------------------- file type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_01', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOWNLOAD);
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(fileType, 'file03.txt', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            const asset2 = dataList[0];
            const creatAsset2 = await media.createAsset(fileType, 'file04.txt', path);
            const fd2 = await asset2.open('rw');
            const creatAssetFd2 = await creatAsset2.open('rw');
            await copyFile(fd2, creatAssetFd2);
            await creatAsset2.close(creatAssetFd2);
            await asset2.close(fd2);

            if (creatAsset1.id != creatAsset2.id) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_01 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_01 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_01 failed' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_02
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file name and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_02', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'displayName', '004_02', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'displayName', '004_02', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'displayName', '004_02', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_02 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_02 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_03
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_03', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'relativePath', '004_03', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'relativePath', '004_03', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'relativePath', '004_03', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_03 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_03 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_04
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_04', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'size', '004_04', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'size', '004_04', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'size', '004_04', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_04 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_04 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_05
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_05', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'dateAdded', '004_05', firstAsset);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'dateAdded', '004_05', midAsset);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'dateAdded', '004_05', lastAsset);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_05 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_05 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_07
     * @tc.name      : getFileAssets
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_07', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset = dataList[0];
            asset.title = `title_${new Date().getTime()}`;
            await asset.commitModify();
            const id = asset.id;
            const idOP = { selections: fileKeyObj.ID + '= ?', selectionArgs: ['' + id] };
            const newAssets = await media.getFileAssets(idOP);
            const newdataList = await newAssets.getAllObject();
            const newAsset = newdataList[0];

            if (asset.dateModified != undefined) {
                if (newAsset.dateModified != asset.dateModified) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                if (newAsset.dateModified != undefined) {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_07 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_07 failed');
                    expect(false).assertTrue();
                    done();
                }
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_07 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_08', 0, async function (done) {
        try {
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();

            const firstAsset = dataList[0];
            checkAssetAttr(done, 'mediaType', '004_08', firstAsset, fileType);

            const midAsset = dataList[Math.floor(dataList.length / 2)];
            checkAssetAttr(done, 'mediaType', '004_08', midAsset, fileType);

            const lastAsset = dataList[dataList.length - 1];
            checkAssetAttr(done, 'mediaType', '004_08', lastAsset, fileType);

            console.info('MediaLibraryTest : ASSET_PROMISE getFileAssets 004_08 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_08 failed, message = ' + error);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_09
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_PROMISE_004_09', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOWNLOAD);
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(fileType, 'file3.txt', path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            if (creatAsset1.mediaType == fileType) {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_09 passed');
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_09 failed');
                expect(false).assertTrue();
                done();
            }
        } catch (error) {
            console.info('MediaLibraryTest : ASSET_PROMISE createAsset 004_09 failed');
            expect(false).assertTrue();
            done();
        }
    });
    // -------------------------------  file type end -----------------------------
});
