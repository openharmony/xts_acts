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
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect
} from 'deccjsunit/index';
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

let imageAndAudiofetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [imageType.toString(), audioType.toString()],
};
let imageAndVideoAndfilefetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [imageType.toString(), videoType.toString(), fileType.toString()],
};
let imageAndVideoAndfileAndAudiofetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [imageType.toString(), videoType.toString(), fileType.toString(), audioType.toString()],
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

describe('GET_ALBUM.test.js', function () {
    const context = featureAbility.getContext();
    const media = mediaLibrary.getMediaLibrary(context);

    beforeAll(function () {});
    beforeEach(function () {});
    afterEach(function () {});
    afterAll(function () {});

    var timestamp = new Date().getTime();
    var jpgName = timestamp + ".jpg";
    var videoName = timestamp + ".mp4";
    var audioName = timestamp + ".mp3";
    var fileName = timestamp + ".mp3";

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
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_001
     * @tc.name      : ON
     * @tc.desc      : ON Image ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_001', 0, async function (done) {
        try {
            let conut = 0;
            media.on(['image'], () => {
                conut++;
            });
            const fetchFileResult = await media.getFileAssets(imagesfetchOp);

            const dataList = await fetchFileResult.getAllObject();

            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));

            expect(conut == 1).assertTrue();
            media.off(['image']);
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : on 001 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['image']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_002
     * @tc.name      : ON
     * @tc.desc      : ON Video ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_002', 0, async function (done) {
        try {
            let conut = 0;
            media.on(['video'], () => {
                conut++;
            });
            const fetchFileResult = await media.getFileAssets(videosfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));
            expect(conut == 1).assertTrue();
            media.off(['video']);
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : on 002 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['video']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_003
     * @tc.name      : ON
     * @tc.desc      : ON Audio ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_003', 0, async function (done) {
        try {
            let conut = 0;
            media.on(['audio'], () => {
                conut++;
            });
            const fetchFileResult = await media.getFileAssets(audiosfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));
            expect(conut == 1).assertTrue();
            media.off(['audio']);
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : on 003 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['audio']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_004
     * @tc.name      : ON
     * @tc.desc      : ON File ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_004', 0, async function (done) {
        try {
            let conut = 0;
            media.on(['file'], () => {
                conut++;
            });
            const fetchFileResult = await media.getFileAssets(filesfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));
            expect(conut == 1).assertTrue();
            media.off(['file']);
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : on 004 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['file']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_005
     * @tc.name      : ON
     * @tc.desc      : ON Album ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_005', 0, async function (done) {
    //     try {
    //         let conut = 0;
    //         media.on(['album'], () => {
    //             conut++;
    //             console.info('MediaLibraryTest : on 005 passed');
    //             expect(true).assertTrue();
    //             media.off(['album']);
    //             done();
    //         });
    //         const dataList = await media.getAlbums(imagesfetchOp);
    //         const asset = dataList[0];
    //         asset.title = 'changename';
    //         await asset.commitModify();
    //         await new Promise((res) => setTimeout(() => res(), 3000));
    //         if (conut == 0) {
    //             console.info('MediaLibraryTest : on 005 failed');
    //             expect(false).assertTrue();
    //             media.off(['album']);
    //             done();
    //         }
    //     } catch (error) {
    //         console.info(`MediaLibraryTest : on 005 failed, error: ${error}`);
    //         expect(false).assertTrue();
    //         media.off(['album']);
    //         done();
    //     }
    // });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_006
     * @tc.name      : ON
     * @tc.desc      : ON File image file ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_006', 0, async function (done) {
        try {
            let conut = 0;
            media.on(['image', 'file'], () => {
                conut++;
            });
            const fileResult = await media.getFileAssets(filesfetchOp);
            const fileList = await fileResult.getAllObject();
            const file = fileList[0];
            file.title = 'changename1';
            await file.commitModify();
            const imageResult = await media.getFileAssets(imagesfetchOp);
            const imageList = await imageResult.getAllObject();
            const image = imageList[0];
            image.title = 'changename2';
            await image.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));
            expect(conut == 2).assertTrue();
            media.off(['image', 'file']);
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : on 006 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['image', 'file']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_007
     * @tc.name      : ON
     * @tc.desc      : ON 'image', 'file', 'audio' ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_007', 0, async function (done) {
        try {
            const arr = ['image', 'file', 'audio'];
            let conut = 0;
            media.on(arr, () => {
                conut++;
            });
            const fileResult = await media.getFileAssets(filesfetchOp);
            const fileList = await fileResult.getAllObject();
            const file = fileList[0];
            file.title = 'changename1';
            await file.commitModify();

            const imageResult = await media.getFileAssets(imagesfetchOp);
            const imageList = await imageResult.getAllObject();
            const image = imageList[0];
            image.title = 'changename2';
            await image.commitModify();

            const audioResult = await media.getFileAssets(audiosfetchOp);
            const audioList = await audioResult.getAllObject();
            const audio = audioList[0];
            audio.title = 'changename';
            await audio.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));
            expect(conut == arr.length).assertTrue();
            media.off(arr);
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : on 007 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(arr);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_008
     * @tc.name      : ON
     * @tc.desc      : ON image, file, audio video ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // it('SUB_MEDIA_MIDIALIBRARY_PROMISE_ON_008', 0, async function (done) {
    //     try {
    //         const arr = ['image', 'file', 'audio', 'video'];
    //         let conut = 0;
    //         media.on(arr, () => {
    //             conut++;
    //         });
    //         const fileResult = await media.getFileAssets(filesfetchOp);
    //         const fileList = await fileResult.getAllObject();
    //         const file = fileList[0];
    //         file.title = 'changename1';
    //         await file.commitModify();
    //         const imageResult = await media.getFileAssets(imagesfetchOp);
    //         const imageList = await imageResult.getAllObject();
    //         const image = imageList[0];
    //         image.title = 'changename2';
    //         await image.commitModify();

    //         const audioResult = await media.getFileAssets(audiosfetchOp);
    //         const audioList = await audioResult.getAllObject();
    //         const audio = audioList[0];
    //         audio.title = 'changename';
    //         await audio.commitModify();

    //         const videoResult = await media.getFileAssets(videosfetchOp);
    //         const videoList = await videoResult.getAllObject();
    //         const video = videoList[0];
    //         video.title = 'changename';
    //         await video.commitModify();
    //         await new Promise((res) => setTimeout(() => res(), 3000));
    //         expect(conut == arr.length).assertTrue();
    //         media.off(arr);
    //         done();
    //     } catch (error) {
    //         console.info(`MediaLibraryTest : on 008 failed, error: ${error}`);
    //         expect(false).assertTrue();
    //         media.off(arr);
    //         done();
    //     }
    // });

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
            const fetchFileResult = await media.getFileAssets(imagesfetchOp);
            expect(fetchFileResult != undefined).assertTrue();
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
            const fetchFileResult = await media.getFileAssets(videosfetchOp);
            expect(fetchFileResult != undefined).assertTrue();
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
            const fetchFileResult = await media.getFileAssets(audiosfetchOp);
            expect(fetchFileResult != undefined).assertTrue();
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
            const fetchFileResult = await media.getFileAssets(filesfetchOp);
            expect(fetchFileResult != undefined).assertTrue();
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
            const fetchFileResult = await media.getFileAssets(imageAndAudiofetchOp);
            expect(fetchFileResult != undefined).assertTrue();
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
            expect(fetchFileResult != undefined).assertTrue();
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
            expect(fetchFileResult != undefined).assertTrue();
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
            selections: fileKeyObj.MEDIA_TYPE + 'abc= ? or ' + fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?',
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
            selections: fileKeyObj.MEDIA_TYPE + 'abc= ? or ' + fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ? or ' + fileKeyObj.MEDIA_TYPE + '= ?',
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

            expect(dicResult == 'Music/').assertTrue();
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
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_DELETEASSET_001
     * @tc.name      : deleteAsset
     * @tc.desc      : Delete File by Asset uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_DELETEASSET_001', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(imagesfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset1 = dataList[0];
            const delUri = asset1.uri;

            await media.deleteAsset(asset1.uri);

            const fetchFileResult1 = await media.getFileAssets(imagesfetchOp);
            const dataList1 = await fetchFileResult1.getAllObject();

            let passed = true;
            for (let i = 0; i < dataList1.length; i++) {
                const asset = dataList1[i];
                if (asset.uri == delUri) {
                    passed = false;
                }
            }
            expect(passed).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : deleteAsset 001 failed, error: ${error}`);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_DELETEASSET_002
     * @tc.name      : deleteAsset
     * @tc.desc      : Delete File Asset by aaaa + uri + aaaaa
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB__MEDIA_MIDIALIBRARY_PROMISE_DELETEASSET_002', 0, async function (done) {
        try {
            const fetchFileResult = await media.getFileAssets(imagesfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset1 = dataList[0];
            await media.deleteAsset('aaaa' + asset1.uri + 'aaaa');
            console.info('MediaLibraryTest : deleteAsset 002 failed');
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : deleteAsset 002 passed');
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
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_001
     * @tc.name      : off
     * @tc.desc      : off Image ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_001', 0, async function (done) {
        try {
            media.on(['image'], () => {
                console.info('MediaLibraryTest : off 001 failed');
                expect(false).assertTrue();
                media.off(['image']);
                done();
            });

            media.off(['image']);
            const fetchFileResult = await media.getFileAssets(imagesfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();

            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 001 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 001 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['image']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_002
     * @tc.name      : off
     * @tc.desc      : off video ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_002', 0, async function (done) {
        try {
            media.on(['video'], () => {
                console.info('MediaLibraryTest : off 002 failed');
                expect(false).assertTrue();
                media.off(['video']);
                done();
            });

            media.off(['video']);
            const fetchFileResult = await media.getFileAssets(videosfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();

            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 002 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 002 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['video']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_003
     * @tc.name      : off
     * @tc.desc      : off audio ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_003', 0, async function (done) {
        try {
            media.on(['audio'], () => {
                console.info('MediaLibraryTest : off 003 failed');
                expect(false).assertTrue();
                media.off(['audio']);
                done();
            });

            media.off(['audio']);
            const fetchFileResult = await media.getFileAssets(audiosfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();

            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 003 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 003 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['audio']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_004
     * @tc.name      : off
     * @tc.desc      : off file ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_004', 0, async function (done) {
        try {
            media.on(['file'], () => {
                console.info('MediaLibraryTest : off 004 failed');
                expect(false).assertTrue();
                media.off(['file']);
                done();
            });

            media.off(['file']);
            const fetchFileResult = await media.getFileAssets(videosfetchOp);
            const dataList = await fetchFileResult.getAllObject();
            const asset = dataList[0];
            asset.title = 'changename';
            await asset.commitModify();

            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 004 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 004 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(['file']);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_005
     * @tc.name      : off
     * @tc.desc      : off file audio ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_005', 0, async function (done) {
        try {
            const arr = ['file', 'audio'];
            media.on(arr, () => {
                console.info('MediaLibraryTest : off 005 failed');
                expect(false).assertTrue();
                media.off(arr);
                done();
            });

            media.off(arr);
            const fileResult = await media.getFileAssets(filesfetchOp);
            const fileList = await fileResult.getAllObject();
            const file = fileList[0];
            file.title = 'changename1';
            await file.commitModify();

            const audioResult = await media.getFileAssets(audiosfetchOp);
            const audioList = await audioResult.getAllObject();
            const audio = audioList[0];
            audio.title = 'changename';
            await audio.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 005 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 005 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(arr);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_006
     * @tc.name      : off
     * @tc.desc      : off file audio image ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_006', 0, async function (done) {
        try {
            const arr = ['file', 'audio', 'image'];
            media.on(arr, () => {
                console.info('MediaLibraryTest : off 006 failed');
                expect(false).assertTrue();
                media.off(arr);
                done();
            });

            media.off(arr);
            const fileResult = await media.getFileAssets(filesfetchOp);
            const fileList = await fileResult.getAllObject();
            const file = fileList[0];
            file.title = 'changename1';
            await file.commitModify();

            const audioResult = await media.getFileAssets(audiosfetchOp);
            const audioList = await audioResult.getAllObject();
            const audio = audioList[0];
            audio.title = 'changename';
            await audio.commitModify();

            const imageResult = await media.getFileAssets(imagesfetchOp);
            const imageList = await imageResult.getAllObject();
            const image = imageList[0];
            image.title = 'changename2';
            await image.commitModify();
            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 006 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 006 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(arr);
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_007
     * @tc.name      : off
     * @tc.desc      : off file audio image video ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MIDIALIBRARY_PROMISE_Off_007', 0, async function (done) {
        try {
            const arr = ['file', 'audio', 'image', 'video'];
            media.on(arr, () => {
                console.info('MediaLibraryTest : off 007 failed');
                expect(false).assertTrue();
                media.off(arr);
                done();
            });

            media.off(arr);
            const fileResult = await media.getFileAssets(filesfetchOp);
            const fileList = await fileResult.getAllObject();
            const file = fileList[0];
            file.title = 'changename1';
            await file.commitModify();
            const imageResult = await media.getFileAssets(imagesfetchOp);
            const imageList = await imageResult.getAllObject();
            const image = imageList[0];
            image.title = 'changename2';
            await image.commitModify();

            const audioResult = await media.getFileAssets(audiosfetchOp);
            const audioList = await audioResult.getAllObject();
            const audio = audioList[0];
            audio.title = 'changename';
            await audio.commitModify();

            const videoResult = await media.getFileAssets(videosfetchOp);
            const videoList = await videoResult.getAllObject();
            const video = videoList[0];
            video.title = 'changename';
            await video.commitModify();

            await new Promise((res) => setTimeout(() => res(), 3000));

            console.info('MediaLibraryTest : off 007 passed');
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(`MediaLibraryTest : off 007 failed, error: ${error}`);
            expect(false).assertTrue();
            media.off(arr);
            done();
        }
    });

    /**
     * @tc.number    : SUB__MEDIA_MIDIALIBRARY_PROMISE_RELEASE_001
     * @tc.name      : release
     * @tc.desc      : Release MediaLibrary instance
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //  it('SUB__MEDIA_MIDIALIBRARY_PROMISE_RELEASE_001', 0, async function (done) {
    //     try {
    //         await media.release();
    //         console.info('MediaLibraryTest : release 001 passed');
    //         expect(true).assertTrue();
    //         done();
    //     } catch (error) {
    //         console.info(`MediaLibraryTest : release 001 failed, error: ${error}`);
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });
});