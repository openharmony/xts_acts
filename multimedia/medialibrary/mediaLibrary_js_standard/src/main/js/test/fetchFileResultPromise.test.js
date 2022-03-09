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
let fileType = mediaLibrary.MediaType.FILE;
let imageType = mediaLibrary.MediaType.IMAGE;
let videoType = mediaLibrary.MediaType.VIDEO;
let audioType = mediaLibrary.MediaType.AUDIO;

let getFileCountOneOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC LIMIT 0,1",
    extendArgs: "",
};

let getFileCountTwoOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC LIMIT 0,2",
    extendArgs: "",
};

let getFileCountTenOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC LIMIT 0,10",
    extendArgs: "",
};

let getFileCountOneHundredOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
    order: fileKeyObj.DATE_ADDED + " DESC LIMIT 0,100",
    extendArgs: "",
};

let getFirstObjectOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ?',
    selectionArgs: ['camera/'],
    order: fileKeyObj.ID + " DESC LIMIT 0,5",
    extendArgs: "",
}

let getAllObjectLimitOneOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ?',
    selectionArgs: ['camera/'],
    order: fileKeyObj.ID + " DESC LIMIT 0,1",
    extendArgs: "",
}

let getAllObjectLimitTwoOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ?',
    selectionArgs: ['camera/'],
    order: fileKeyObj.ID + " DESC LIMIT 0,1",
    extendArgs: "",
}

let getAllObjectLimitOneHundredOp = {
    selections: fileKeyObj.RELATIVE_PATH + '= ?',
    selectionArgs: ['camera/'],
    order: fileKeyObj.ID + " DESC LIMIT 0,100",
    extendArgs: "",
}

let getFileCountZeroOp = {
    selections: fileKeyObj.DISPLAY_NAME + '=?',
    selectionArgs: ['The world has kissed my soul with its pain, asking for its return in songs.'],
};

function checkAssetAttr(done, asset, attr, test_num) {
    expect(asset.id != undefined).assertTrue();
    expect(asset.mimeType != undefined).assertTrue();
    expect(asset.displayName != undefined).assertTrue();
    expect(asset.title != undefined).assertTrue();
    expect(asset.relativePath != undefined).assertTrue();
    expect(asset.parent != undefined).assertTrue();
    expect(asset.size != undefined).assertTrue();
    expect(asset.dateAdded != undefined).assertTrue();
    expect(asset.dateModified != undefined).assertTrue();
    expect(asset.dateTaken != undefined).assertTrue();
    expect(asset.width != undefined).assertTrue();
    expect(asset.height != undefined).assertTrue();
    expect(asset.orientation != undefined).assertTrue();
    expect(asset.duration != undefined).assertTrue();
    done();
}

describe('fetch.file.result.promise.test.js', async function () {
    var context = featureAbility.getContext();
    var media = mediaLibrary.getMediaLibrary(context);
    beforeAll(function () {});
    beforeEach(function () {});
    afterEach(function () {});
    afterAll(function () {});


    // ------------------------------ 001 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_01
     * @tc.name      : getCount
     * @tc.desc      : Get FetchResult by getFileCountOneOp, check the return value of the interface (by Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_01', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : Get Count begin');
            let fetchFileResult = await media.getFileAssets(getFileCountOneOp);
            const fetchCount = await fetchFileResult.getCount();
            console.info('MediaLibraryTest : count:' + fetchCount);
            expect(fetchCount == 1).assertTrue();
            console.info('MediaLibraryTest : Get Count end');
            // fetchFileResult.close();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getCount 001_01 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_02
     * @tc.name      : getCount
     * @tc.desc      : Get FetchResult by getFileCountTwoOp, check the return value of the interface (by Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_02', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : Get Count begin');
            let fetchFileResult = await media.getFileAssets(getFileCountTwoOp);
            const fetchCount = await fetchFileResult.getCount();
            console.info('MediaLibraryTest : count:' + fetchCount);
            expect(fetchCount == 2).assertTrue();
            console.info('MediaLibraryTest : Get Count end');
            // fetchFileResult.close();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getCount 001_02 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });




    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_03
     * @tc.name      : getCount
     * @tc.desc      : Get FetchResult by getFileCountOneHundredOp, check the return value of the interface (by Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_03', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : Get Count begin');
            let fetchFileResult = await media.getFileAssets(getFileCountOneHundredOp);
            const fetchCount = await fetchFileResult.getCount();
            console.info('MediaLibraryTest : count:' + fetchCount);
            expect(fetchCount <= 100).assertTrue();
            console.info('MediaLibraryTest : Get Count end');
            // fetchFileResult.close();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getCount 001_03 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });



    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_04
     * @tc.name      : getCount
     * @tc.desc      : Get FetchResult by getFileCountZeroOp, check the return value of the interface (by Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETCOUNT_PROMISE_001_04', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : Get Count begin');
            let fetchFileResult = await media.getFileAssets(getFileCountZeroOp);
            const fetchCount = await fetchFileResult.getCount();
            console.info('MediaLibraryTest : count:' + fetchCount);
            expect(fetchCount == 0).assertTrue();
            console.info('MediaLibraryTest : Get Count end');
            // fetchFileResult.close();
            done();
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getCount 001_04 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    // ------------------------------ 001 test end -------------------------


    // ------------------------------ 002 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_ISAFTERLAST_PROMISE_002
     * @tc.name      : getCount
     * @tc.desc      : Get FetchResult by getFileCountTenOp, check the return value of the interface (by Promise)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_ISAFTERLAST_PROMISE_002', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : isAfterLast begin');
            let fetchFileResult = await media.getFileAssets(getFileCountTenOp);
            const fetchCount = await fetchFileResult.getCount();
            console.info('MediaLibraryTest : count:' + fetchCount);
            let fileAsset = await fetchFileResult.getFirstObject();
            for (var i = 1; i < fetchCount; i++) {
                fileAsset = await fetchFileResult.getNextObject();
                if (i == fetchCount - 1) {
                    console.info('MediaLibraryTest : isLast');
                    var result = fetchFileResult.isAfterLast();
                    console.info('MediaLibraryTest : isAfterLast:' + result);
                    expect(true).assertTrue();
                    console.info('MediaLibraryTest : isAfterLast end');
                    // fetchFileResult.close();
                    done();
                }
            }
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT isAfterLast 002 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });
    // ------------------------------ 002 test end -------------------------

    // // ------------------------------ 003 test start -------------------------
    // /**
    //  * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_CLOSE_PROMISE_003
    //  * @tc.name      : getCount
    //  * @tc.desc      : Get FetchResult, close it, check if result closed
    //  * @tc.size      : MEDIUM
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_CLOSE_PROMISE_003', 0, async function (done) {
    //     try {
    //         console.info('MediaLibraryTest : CLOSE begin');
    //         let fetchFileResult = await media.getFileAssets(getFileCountTenOp);
    //         // fetchFileResult.close();
    //         try {
    //             await fetchFileResult.getCount();
    //             console.info('MediaLibraryTest : CLOSE failed');
    //             expect(false).assertTrue();
    //             done();
    //         } catch {
    //             console.info('MediaLibraryTest : CLOSE closed');
    //             expect(true).assertTrue();
    //             done();
    //         }
    //         console.info('MediaLibraryTest : CLOSE end');
    //     } catch (error) {
    //         console.info('MediaLibraryTest : FETCHRESULT close 003 failed, message = ' + error);
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });

    // ------------------------------ 003 test end -------------------------

    // ------------------------------ 004 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETFIRSTOBJECT_PROMISE_004
     * @tc.name      : getFirstObject
     * @tc.desc      : Get FetchResult, get first object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETFIRSTOBJECT_PROMISE_004', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETFIRSTOBJECT begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            let firstObject = await fetchFileResult.getFirstObject();
            let targetAttr = {
                id: 3,
                // uri: 'dataability:///media/audio',
                mimeType: 'audio/*',
                mediaType: videoType,
                displayName: '01.mp3',
                title: '01',
                relativePath: 'camera/',
                parent: 1,
                size: 3513962,
                dateAdded: 1501923717,
                dateModified: 1501923708,
                dateTaken: 0,
                // artist: '',
                // audioAlbum: '',
                width: 0,
                height: 0,
                orientation: 0,
                duration: 0,
                albumId: 0,
                albumUri: '',
                // albumName: '',
            }
            checkAssetAttr(done, firstObject, targetAttr, '004');
            expect(true).assertTrue();
            // fetchFileResult.close();
            done();
            console.info('MediaLibraryTest : GETFIRSTOBJECT end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getFirstObject 004 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });


    // ------------------------------ 004 test end -------------------------

    // ------------------------------ 005 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETNEXTOBJECT_PROMISE_005
     * @tc.name      : getNextObject
     * @tc.desc      : Get FetchResult, get first object, get next object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETNEXTOBJECT_PROMISE_005', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETNEXTOBJECT begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            let firstObject = await fetchFileResult.getFirstObject();
            let nextObject = await fetchFileResult.getNextObject();
            let targetAttr = {
                id: 4,
                // uri: 'dataability:///media/audio',
                mimeType: 'image/*',
                mediaType: imageType,
                displayName: '02.jpg',
                title: '02',
                relativePath: 'camera/',
                parent: 1,
                size: 348113,
                dateAdded: 1501923717,
                dateModified: 1501923707,
                dateTaken: 0,
                // artist: '',
                // audioAlbum: '',
                width: 1279,
                height: 1706,
                orientation: 0,
                duration: 0,
                // albumId: 0,
                // albumUri: '',
                // albumName: '',
            }
            checkAssetAttr(done, nextObject, targetAttr, '005');
            expect(true).assertTrue();
            // fetchFileResult.close();
            done();
            console.info('MediaLibraryTest : GETNEXTOBJECT end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getNextObject 005 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });
    // ------------------------------ 005 test end -------------------------

    // ------------------------------ 006 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETLASTOBJECT_PROMISE_006
     * @tc.name      : getNextObject
     * @tc.desc      : Get FetchResult, get first object, get next object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETLASTOBJECT_PROMISE_006', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETLASTOBJECT begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            let lastObject = await fetchFileResult.getLastObject();
            let targetAttr = {
                id: 9,
                // uri: 'dataability:///media/audio',
                mimeType: 'audio/*',
                mediaType: audioType,
                displayName: '02.mp3',
                title: '02',
                relativePath: 'camera/',
                parent: 1,
                size: 3513962,
                dateAdded: 1501923717,
                dateModified: 1501923710,
                dateTaken: 0,
                // artist: '',
                // audioAlbum: '',
                width: 0,
                height: 0,
                orientation: 0,
                duration: 0,
                // albumId: 0,
                // albumUri: '',
                // albumName: '',
            }
            checkAssetAttr(done, lastObject, targetAttr, '006');
            expect(true).assertTrue();
            done();
            // fetchFileResult.close();
            console.info('MediaLibraryTest : GETLASTOBJECT end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getLastObject 006 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });
    // ------------------------------ 006 test end -------------------------

    // ------------------------------ 007 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_01
     * @tc.name      : getPositionObject
     * @tc.desc      : Get FetchResult, get position 0 object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_01', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETPOSITIONOBJECT 0 begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            let targetObject = await fetchFileResult.getPositionObject(0);
            let targetAttr = {
                id: 3,
                // uri: 'dataability:///media/audio',
                mimeType: 'audio/*',
                mediaType: videoType,
                displayName: '01.mp3',
                title: '01',
                relativePath: 'camera/',
                parent: 1,
                size: 3513962,
                dateAdded: 1501923717,
                dateModified: 1501923708,
                dateTaken: 0,
                // artist: '',
                // audioAlbum: '',
                width: 0,
                height: 0,
                orientation: 0,
                duration: 0,
                albumId: 0,
                albumUri: '',
                // albumName: '',
            }
            checkAssetAttr(done, targetObject, targetAttr, '007_01');
            expect(true).assertTrue();
            // fetchFileResult.close();
            done();
            console.info('MediaLibraryTest : GETPOSITIONOBJECT 0 end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getPositionObject 007_01 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_02
     * @tc.name      : getPositionObject
     * @tc.desc      : Get FetchResult, get position 1 object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_02', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETPOSITIONOBJECT 1 begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            let targetObject = await fetchFileResult.getPositionObject(1);
            let targetAttr = {
                id: 4,
                // uri: 'dataability:///media/audio',
                mimeType: 'image/*',
                mediaType: imageType,
                displayName: '02.jpg',
                title: '02',
                relativePath: 'camera/',
                parent: 1,
                size: 348113,
                dateAdded: 1501923717,
                dateModified: 1501923707,
                dateTaken: 0,
                // artist: '',
                // audioAlbum: '',
                width: 1279,
                height: 1706,
                orientation: 0,
                duration: 0,
                // albumId: 0,
                // albumUri: '',
                // albumName: '',
            }
            checkAssetAttr(done, targetObject, targetAttr, '007_02');
            expect(true).assertTrue();
            // fetchFileResult.close();
            done();
            console.info('MediaLibraryTest : GETPOSITIONOBJECT 1 end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getPositionObject 007_02 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_02
     * @tc.name      : getPositionObject
     * @tc.desc      : Get FetchResult, get position 1 object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_03', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETPOSITIONOBJECT last begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            const count = await fetchFileResult.getCount();
            let targetObject = await fetchFileResult.getPositionObject(count - 1);
            let targetAttr = {
                id: 9,
                // uri: 'dataability:///media/audio',
                mimeType: 'audio/*',
                mediaType: audioType,
                displayName: '02.mp3',
                title: '02',
                relativePath: 'camera/',
                parent: 1,
                size: 3513962,
                dateAdded: 1501923717,
                dateModified: 1501923710,
                dateTaken: 0,
                // artist: '',
                // audioAlbum: '',
                width: 0,
                height: 0,
                orientation: 0,
                duration: 0,
                // albumId: 0,
                // albumUri: '',
                // albumName: '',
            }
            checkAssetAttr(done, targetObject, targetAttr, '007_03');
            expect(true).assertTrue();
            // fetchFileResult.close();
            done();
            console.info('MediaLibraryTest : GETPOSITIONOBJECT last end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getPositionObject 007_03 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_04
     * @tc.name      : getPositionObject
     * @tc.desc      : Get FetchResult, get position 1 object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETPOSITIONOBJECT_PROMISE_007_04', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETPOSITIONOBJECT out of index begin');
            let fetchFileResult = await media.getFileAssets(getFirstObjectOp);
            const count = await fetchFileResult.getCount();
            try {
                let targetObject = await fetchFileResult.getPositionObject(count + 100);
                if (targetObject == undefined) {
                    expect(true).assertTrue();
                    // fetchFileResult.close();
                    done();
                }
                expect(false).assertTrue();
                // fetchFileResult.close();
                done();
            } catch (err) {
                expect(true).assertTrue();
                // fetchFileResult.close();
                done();
            }
            console.info('MediaLibraryTest : GETPOSITIONOBJECT out of index end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getPositionObject 007_04 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });
    // ------------------------------ 007 test end -------------------------

    // ------------------------------ 008 test start -------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_01
     * @tc.name      : getAllObject
     * @tc.desc      : Get FetchResult, get all object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_01', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETALLOBJECT begin');
            let fetchFileResult = await media.getFileAssets(getAllObjectLimitOneOp);
            var targetObjects = await fetchFileResult.getAllObject();
            if (targetObjects.length > 0) {
                var targetObject = targetObjects[0];
                let targetAttr = {
                    id: 3,
                    // uri: 'dataability:///media/audio',
                    mimeType: 'audio/*',
                    mediaType: videoType,
                    displayName: '01.mp3',
                    title: '01',
                    relativePath: 'camera/',
                    parent: 1,
                    size: 3513962,
                    dateAdded: 1501923717,
                    dateModified: 1501923708,
                    dateTaken: 0,
                    // artist: '',
                    // audioAlbum: '',
                    width: 0,
                    height: 0,
                    orientation: 0,
                    duration: 0,
                    albumId: 0,
                    albumUri: '',
                    // albumName: '',
                }
                checkAssetAttr(done, targetObject, targetAttr, '008_01');
                expect(true).assertTrue();
                // fetchFileResult.close();
                done();
            }
            console.info('MediaLibraryTest : GETALLOBJECT end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getAllObject 008_01 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_02
     * @tc.name      : getAllObject
     * @tc.desc      : Get FetchResult, get all object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_02', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETALLOBJECT begin');
            let fetchFileResult = await media.getFileAssets(getAllObjectLimitTwoOp);
            var targetObjects = await fetchFileResult.getAllObject();
            var targetAttrs = [{
                    id: 3,
                    // uri: 'dataability:///media/audio',
                    mimeType: 'audio/*',
                    mediaType: videoType,
                    displayName: '01.mp3',
                    title: '01',
                    relativePath: 'camera/',
                    parent: 1,
                    size: 3513962,
                    dateAdded: 1501923717,
                    dateModified: 1501923708,
                    dateTaken: 0,
                    // artist: '',
                    // audioAlbum: '',
                    width: 0,
                    height: 0,
                    orientation: 0,
                    duration: 0,
                    albumId: 0,
                    albumUri: '',
                    // albumName: '',
                },
                {
                    id: 4,
                    // uri: 'dataability:///media/audio',
                    mimeType: 'image/*',
                    mediaType: imageType,
                    displayName: '02.jpg',
                    title: '02',
                    relativePath: 'camera/',
                    parent: 1,
                    size: 348113,
                    dateAdded: 1501923717,
                    dateModified: 1501923707,
                    dateTaken: 0,
                    // artist: '',
                    // audioAlbum: '',
                    width: 1279,
                    height: 1706,
                    orientation: 0,
                    duration: 0,
                    // albumId: 0,
                    // albumUri: '',
                    // albumName: '',
                },
            ];
            
            console.info('MediaLibraryTest : targetObjects.length:' + targetObjects.length);
            if (targetObjects.length >= 1) {
                for (var i = 0; i < targetObjects.length; i++) {
                    var targetObject = targetObjects[i];
                    let targetAttr = targetAttrs[i];
                    checkAssetAttr(done, targetObject, targetAttr, '008_02');
                }
                expect(true).assertTrue();
                // fetchFileResult.close();
                done();
            }
            console.info('MediaLibraryTest : GETALLOBJECT end');
        } catch (error) {
            console.info('MediaLibraryTest : ==5=');
            console.info('MediaLibraryTest : FETCHRESULT getAllObject 008_02 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_03
     * @tc.name      : getAllObject
     * @tc.desc      : Get FetchResult, get all object, check result
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_FETCHRESULT_GETALLOBJECT_PROMISE_008_03', 0, async function (done) {
        try {
            console.info('MediaLibraryTest : GETALLOBJECT begin');
            let fetchFileResult = await media.getFileAssets(getAllObjectLimitOneHundredOp);
            var targetObjects = await fetchFileResult.getAllObject();
            if (targetObjects.length > 0) {
                var targetObject = targetObjects[0];
                let targetAttr = {
                    id: 3,
                    // uri: 'dataability:///media/audio',
                    mimeType: 'audio/*',
                    mediaType: videoType,
                    displayName: '01.mp3',
                    title: '01',
                    relativePath: 'camera/',
                    parent: 1,
                    size: 3513962,
                    dateAdded: 1501923717,
                    dateModified: 1501923708,
                    dateTaken: 0,
                    // artist: '',
                    // audioAlbum: '',
                    width: 0,
                    height: 0,
                    orientation: 0,
                    duration: 0,
                    albumId: 0,
                    albumUri: '',
                    // albumName: '',
                }
                checkAssetAttr(done, targetObject, targetAttr, '008_03');
                expect(true).assertTrue();
                // fetchFileResult.close();
                done();
            }
            console.info('MediaLibraryTest : GETALLOBJECT end');
        } catch (error) {
            console.info('MediaLibraryTest : FETCHRESULT getAllObject 008_03 failed, message = ' + error);
            expect(false).assertTrue();
            done();
        }
    });
    // ------------------------------ 008 test end -------------------------

});