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
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import featureAbility from '@ohos.ability.featureAbility';
import fileio from '@ohos.fileio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
let fileKeyObj = mediaLibrary.FileKey;
let fetchOp = {
    selections: fileKeyObj.PATH + ' LIKE ? ',
    selectionArgs: ['/data/media/%'],
    order: fileKeyObj.PATH,
};
// let directoryTypeObj = mediaLibrary.DirectoryType;

let DIR_CAMERA = mediaLibrary.DirectoryType.DIR_CAMERA;
let DIR_VIDEO = mediaLibrary.DirectoryType.DIR_VIDEO;
let DIR_IMAGE = mediaLibrary.DirectoryType.DIR_IMAGE;
let DIR_AUDIO = mediaLibrary.DirectoryType.DIR_AUDIO;
let DIR_DOCUMENTS = mediaLibrary.DirectoryType.DIR_DOCUMENTS;

let imageType = mediaLibrary.MediaType.IMAGE;
let videoType = mediaLibrary.MediaType.VIDEO;
let audioType = mediaLibrary.MediaType.AUDIO;
let fileType = mediaLibrary.MediaType.FILE;

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

let imageRelativefetchOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ? AND ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: ['Pictures/MediaLibraryTest/', imageType.toString()],
};
let videoRelativefetchOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ? AND ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: ['Pictures/MediaLibraryTest/', videoType.toString()],
};
let audioRelativefetchOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ? AND ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: ['Pictures/MediaLibraryTest/', audioType.toString()],
};
let fileRelativefetchOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ? AND ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: ['Pictures/MediaLibraryTest/', fileType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC",
};

let imageAndVideofetchOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ? AND (' +
                fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?)',
    selectionArgs: ['Pictures/MediaLibraryTest/', imageType.toString(), videoType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC",
};
let imageAndVideoAndfilefetchOp = {
    selections:
        fileKeyObj.RELATIVE_PATH + '= ? AND (' +
        fileKeyObj.MEDIA_TYPE +
        '= ? or ' +
        fileKeyObj.MEDIA_TYPE +
        '= ? or ' +
        fileKeyObj.MEDIA_TYPE +
        '= ?)',
    selectionArgs: ['Pictures/MediaLibraryTest/', imageType.toString(), videoType.toString(), fileType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC",
};
let imageAndVideoAndfileAndAudiofetchOp = {
    selections:
        fileKeyObj.RELATIVE_PATH + '= ? AND (' +
        fileKeyObj.MEDIA_TYPE +
        '= ? or ' +
        fileKeyObj.MEDIA_TYPE +
        '= ? or ' +
        fileKeyObj.MEDIA_TYPE +
        '= ? or ' +
        fileKeyObj.MEDIA_TYPE +
        '= ?)',
    selectionArgs: [
        'Pictures/MediaLibraryTest/',
        imageType.toString(),
        videoType.toString(),
        fileType.toString(),
        audioType.toString(),
    ],
    order: fileKeyObj.DATE_ADDED + " DESC",
};

let allTypefetchOp = {
    selections: '',
    selectionArgs: [],
};

async function copyFile(fd1, fd2) {
    let stat = await fileio.fstat(fd1);
    let buf = new ArrayBuffer(stat.size);
    await fileio.read(fd1, buf);
    await fileio.write(fd2, buf);
}

const props = {
    image: {
        mimeType: 'image/*',
        displayName: '01.jpg',
        relativePath: 'Pictures/MediaLibraryTest/',
        size: '348113',
        mediaType: '3',
        title: '01',
        dateTaken: '0',
        width: '1279',
        height: '1706',
        orientation: '0',
        duration: '0',
        albumId: '1118',
        albumName: 'MediaLibraryTest'
    },
    video: {
        mimeType: 'video/mp4',
        displayName: '01.mp4',
        relativePath: 'Pictures/MediaLibraryTest/',
        size: '4853005',
        mediaType: '4',
        title: '01',
        dateTaken: '0',
        width: '1280',
        height: '720',
        orientation: '0',
        duration: '10100',
        albumName: 'MediaLibraryTest'
    },
    audio: {
        mimeType: 'audio/mpeg',
        displayName: '01.mp3',
        relativePath: 'Pictures/MediaLibraryTest/',
        size: '4113874',
        mediaType: '5',
        title: '01',
        dateTaken: '0',
        artist: 'Richard Stoltzman/Slovak Radio Symphony Orchestra',
        width: '0',
        height: '0',
        orientation: '0',
        duration: '169697',
        albumName: 'MediaLibraryTest'
    },
    file: {
        mimeType: 'file/*',
        displayName: 'test.dat',
        relativePath: 'Pictures/MediaLibraryTest/',
        size: '10',
        displayName: 'test.dat',
        mediaType: '1',
        title: 'test',
        dateTaken: '0',
        width: '0',
        height: '0',
        orientation: '0',
        duration: '0',
        albumName: 'MediaLibraryTest'
    }

}
async function checkFileAssetAttr(done, fetchFileResult, type, count, typesArr) {
    expect(fetchFileResult != undefined).assertTrue();
    expect(fetchFileResult.getCount() == count).assertTrue();
    let asset = await fetchFileResult.getFirstObject();

    if (count > 1) {
        type = asset.mimeType.match(/[a-z]+/g)[0]
    }
    if (type == 'audio' && asset.artist != props[type].artist) {
        expect(false).assertTrue();
        done();
    }
    if (typesArr) {
        let assetList = await fetchFileResult.getAllObject();
        for (const assetItem of assetList) {
            expect(typesArr.includes(assetItem.mimeType)).assertTrue();
        }
    }

    if (
        asset.mimeType != props[type].mimeType ||
        asset.displayName != props[type].displayName ||
        asset.relativePath != props[type].relativePath ||
        asset.size != props[type].size ||
        asset.mediaType != props[type].mediaType ||
        asset.title != props[type].title ||
        asset.dateTaken != props[type].dateTaken ||
        asset.width != props[type].width ||
        asset.height != props[type].height ||
        asset.orientation != props[type].orientation ||
        asset.duration != props[type].duration ||
        asset.albumName != props[type].albumName
    ) {
        expect(false).assertTrue();
        done();
    }
}

describe('mediaLibraryTestPromise.test.js', function () {
    const context = featureAbility.getContext();
    const media = mediaLibrary.getMediaLibrary(context);

    beforeAll(function () { });
    beforeEach(function () { });
    afterEach(function () { });
    afterAll(function () { });

    var timestamp = new Date().getTime();
    var jpgName = timestamp + '.jpg';
    var videoName = timestamp + '.mp4';
    var audioName = timestamp + '.mp3';
    var fileName = timestamp + '.mp3';

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_GETMEDIALIBRAY_001
     * @tc.name      : getMediaLibrary
     * @tc.desc      : Obtains a MediaLibrary instance
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_GETMEDIALIBRAY_001', 0, async function (done) {
        try {
            expect(media != undefined).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getMediaLibrary 001 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_001
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_001', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(imageRelativefetchOp);
            let count = 1;
            let type = 'image';
            await checkFileAssetAttr(done, fetchFileResult, type, count)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 001 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_002
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_002', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(videoRelativefetchOp);
            let count = 1;
            let type = 'video';
            await checkFileAssetAttr(done, fetchFileResult, type, count)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 002 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_003
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_003', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(audioRelativefetchOp);
            let count = 1;
            let type = 'audio';
            await checkFileAssetAttr(done, fetchFileResult, type, count)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 003 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_004
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_004', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(fileRelativefetchOp);
            let count = 1;
            let type = 'file';
            await checkFileAssetAttr(done, fetchFileResult, type, count)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 004 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_005
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_005', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(imageAndVideofetchOp);
            let count = 2;
            let type = 'video';
            let typesArr = ['image/*', 'video/mp4']
            await checkFileAssetAttr(done, fetchFileResult, type, count, typesArr)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 005 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_006
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_006', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(imageAndVideoAndfilefetchOp);
            let count = 3;
            let type = 'file';
            let typesArr = ['image/*', 'video/mp4', 'file/*']
            await checkFileAssetAttr(done, fetchFileResult, type, count, typesArr)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 006 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_007
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_007', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(imageAndVideoAndfileAndAudiofetchOp);
            let count = 4;
            let type = 'audio';
            let typesArr = ['image/*', 'video/mp4', 'file/*', 'audio/mpeg']
            await checkFileAssetAttr(done, fetchFileResult, type, count, typesArr)
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 007 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_008
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_008', 0, async function (done) {
        let fetchOp = {
            selections: fileKeyObj.MEDIA_TYPE + 'abc= ?',
            selectionArgs: ['abc'],
        };
        try {
            await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets 008 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getFileAssets 008 passed`);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_009
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_009', 0, async function (done) {
        let fetchOp = {
            selections: fileKeyObj.MEDIA_TYPE + 'abc= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?',
            selectionArgs: ['abc', audioType.toString()],
        };
        try {
            await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets 009 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets 009 passed');
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_009
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_010', 0, async function (done) {
        let fetchOp = {
            selections:
                fileKeyObj.MEDIA_TYPE +
                'abc= ? or ' +
                fileKeyObj.MEDIA_TYPE +
                '= ? or ' +
                fileKeyObj.MEDIA_TYPE +
                '= ?',
            selectionArgs: ['abc', videoType.toString(), fileType.toString()],
        };
        try {
            await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets 010 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets 010 passed');
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_011
     * @tc.name      : getFileAssets
     * @tc.desc      : query all assets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETFILEASSETS_011', 0, async function (done) {
        let fetchOp = {
            selections:
                fileKeyObj.MEDIA_TYPE +
                'abc= ? or ' +
                fileKeyObj.MEDIA_TYPE +
                '= ? or ' +
                fileKeyObj.MEDIA_TYPE +
                '= ? or ' +
                fileKeyObj.MEDIA_TYPE +
                '= ?',
            selectionArgs: ['abc', videoType.toString(), fileType.toString(), audioType.toString()],
        };
        try {
            await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets 011 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets 011 passed');
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_001
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory DIR_CAMERA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_001', 0, async function (done) {
        try {
            let DIR_CAMERA = mediaLibrary.DirectoryType.DIR_CAMERA;

            const dicResult = await media.getPublicDirectory(DIR_CAMERA);

            expect(dicResult == 'Camera/').assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getPublicDirectory 001 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_002
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory DIR_VIDEO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_002', 0, async function (done) {
        try {
            let DIR_VIDEO = mediaLibrary.DirectoryType.DIR_VIDEO;

            const dicResult = await media.getPublicDirectory(DIR_VIDEO);
            console.log(dicResult);
            expect(dicResult == 'Videos/').assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getPublicDirectory 002 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_003
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory DIR_IMAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_003', 0, async function (done) {
        try {
            let DIR_IMAGE = mediaLibrary.DirectoryType.DIR_IMAGE;

            const dicResult = await media.getPublicDirectory(DIR_IMAGE);

            expect(dicResult == 'Pictures/').assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getPublicDirectory 003 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_004
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory DIR_IMAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_004', 0, async function (done) {
        try {
            let DIR_AUDIO = mediaLibrary.DirectoryType.DIR_AUDIO;

            const dicResult = await media.getPublicDirectory(DIR_AUDIO);

            expect(dicResult == 'Audios/').assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getPublicDirectory 004 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_005
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory DIR_IMAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_005', 0, async function (done) {
        try {
            let DIR_DOCUMENTS = mediaLibrary.DirectoryType.DIR_DOCUMENTS;

            const dicResult = await media.getPublicDirectory(DIR_DOCUMENTS);

            expect(dicResult == 'Documents/').assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : getPublicDirectory 005 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_006
     * @tc.name      : getPublicDirectory
     * @tc.desc      : getPublicDirectory 110
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_GETPUBLICDIRECTORY_006', 0, async function (done) {
        try {
            await media.getPublicDirectory(110);
            console.info('MediaLibraryTest : getPublicDirectory 006 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : getPublicDirectory 006 passed');
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_001
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset image (does not exist)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_001', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];

            const creatAsset1 = await media.createAsset(imageType, jpgName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 001 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 001 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_002
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset image (existed)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_002', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(imageType, jpgName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 002 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 002 passed`);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_003
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset video (does not exist)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_003', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(videoType, videoName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 003 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 003 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_004
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset video (existed)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_004', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(videoType, videoName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 004 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 004 passed`);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_005
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset audio (does not exist)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_005', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(audioType, audioName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 005 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 005 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_006
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset audio (existed)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_006', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
            const fileAssets = await media.getFileAssets(audiosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(videoType, audioName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 006 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 006 passed`);
            expect(true).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_007
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset file (does not exist)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_007', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOWNLOAD);
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(fileType, fileName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 007 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 007 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_008
     * @tc.name      : createAsset
     * @tc.desc      : Create File Asset file (existed)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_008', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOWNLOAD);
            const fileAssets = await media.getFileAssets(filesfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(fileType, fileName, path);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);

            console.info('MediaLibraryTest : createAsset 008 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 008 passed`);
            expect(true).assertTrue();
            done();
        }
    });

    /**
   * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_001
   * @tc.name      : createAsset
   * @tc.desc      : Create File Asset image (does not exist)
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_CREATEASSET_009', 0, async function (done) {
        try {
            const path = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
            const filePath = path + "image/";
            const fileAssets = await media.getFileAssets(videosfetchOp);
            const dataList = await fileAssets.getAllObject();
            const asset1 = dataList[0];
            const creatAsset1 = await media.createAsset(imageType, jpgName, filePath);
            const fd1 = await asset1.open('rw');
            const creatAssetFd1 = await creatAsset1.open('rw');
            await copyFile(fd1, creatAssetFd1);
            await creatAsset1.close(creatAssetFd1);
            await asset1.close(fd1);
            console.info('MediaLibraryTest : createAsset 009 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : createAsset 009 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });
});
