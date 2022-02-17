import mediaLibrary from '@ohos.multimedia.medialibrary';
import image from '@@ohos.multimedia.image';
import featureAbility from '@ohos.ability.featureAbility'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('GetFileAssets_GetCount_GetAllObjects', function () {
var context = featureAbility.getContext();
console.info('MediaLibraryTest : getMediaLibrary IN');
var media = mediaLibrary.getMediaLibrary(context);
console.info('MediaLibraryTest : getMediaLibrary OUT');

var URI;
var name;
var result1;
var name_URI;
var albumName;
var albumId;
var i;
var fileAsset;
var MAXNUM = 100;
var PATH = 'data';
var MEDIA_TYPE = 'media_type';
let fileKeyObj = mediaLibrary.FileKey
/*
let fetchOp = {
    selections : mediaLibrary.PATH + "= ? OR " + mediaLibrary.MEDIA_TYPE + "=?",
    selectionArgs : ["/data/media/images", "IMAGE"],
    order : "ASC",
}

let fetchOp = {
    selections : mediaLibrary.FileKey.PATH + "= ? OR " + mediaLibrary.FileKey.MEDIA_TYPE + "=?",
    selectionArgs : ["/data/media/images", "IMAGE"],
    order : "ASC",
}
*/
let type = mediaLibrary.MediaType.IMAGE
let videoType = mediaLibrary.MediaType.VIDEO
let audioType = mediaLibrary.MediaType.AUDIO
let fetchOp = {
    selections : fileKeyObj.PATH + " LIKE ? AND " + fileKeyObj.MEDIA_TYPE + "=?",
    selectionArgs : ["/data/media/%", type.toString()],
    order : fileKeyObj.PATH,
}
let videoFetchOp = {
    selections : fileKeyObj.PATH + " LIKE ? AND " + fileKeyObj.MEDIA_TYPE + "=?",
    selectionArgs : ["/data/media/%", videoType.toString()],
    order : fileKeyObj.PATH,
}
let audioFetchOp = {
    selections : fileKeyObj.PATH + " LIKE ? AND " + fileKeyObj.MEDIA_TYPE + "=?",
    selectionArgs : ["/data/media/%", audioType.toString()],
    order : fileKeyObj.PATH,
}
beforeAll(function () {
//onsole.info('beforeAll： Prerequisites at the test suite level, which are executed before the test suite is executed.');

})

beforeEach(function () {
//console.info('MediaLibraryTest: beforeEach：Prerequisites at the test case level, which are executed before each test case is executed.');

})
afterEach(function () {
//console.info('MediaLibraryTest: afterEach： Test case-level clearance conditions, which are executed after each test case is executed.');

})
afterAll(function () {
//console.info('MediaLibraryTest: afterAll：  Test suite-level cleanup condition, which is executed after the test suite is executed');

})

it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_01', 0, async function (done) {

media.getFileAssets(fetchOp, (error, data) => {
    if (data != undefined) {
        console.info('MediaLibraryTest : getFileAssets Successfull '+ data.getCount());
        data.getFirstObject((err1, data1) => {
            if (data1 != undefined) {
                let size = { width:80, height:80 }
                data1.getThumbnail(size, (err2, pixelmap) => {
                    console.info('MediaLibraryTest : getThumbnail Successfull '+ pixelmap);
                    pixelmap.getImageInfo((error, info) => {
                        console.info('MediaLibraryTest : pixel image info ' + info);
                        console.info('MediaLibraryTest : pixel width ' + info.size.width);
                        console.info('MediaLibraryTest : pixel height ' + info.size.height);
                        expect(info.size.width == 80).assertTrue();
                        expect(info.size.height == 80).assertTrue();
                        done();
                    });
                });
            }
        });
    } else {
        console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ error.message);
        console.info('MediaLibraryTest : getFileAssets :FAIL');
        expect(false).assertTrue();
        done();
    }
});
})

it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_02', 0, async function (done) {

media.getFileAssets(fetchOp, (error, data) => {
    if (data != undefined) {
        console.info('MediaLibraryTest : getFileAssets Successfull '+ data.getCount());
        data.getFirstObject((err1, data1) => {
            if (data1 != undefined) {
                let size = { width:400, height:400 }
                data1.getThumbnail(size, (err2, pixelmap) => {
                    console.info('MediaLibraryTest : getThumbnail Successfull '+ pixelmap);
                    pixelmap.getImageInfo((error, info) => {
                        console.info('MediaLibraryTest : pixel image info ' + info);
                        console.info('MediaLibraryTest : pixel width ' + info.size.width);
                        console.info('MediaLibraryTest : pixel height ' + info.size.height);
                        expect(info.size.width == 400).assertTrue();
                        expect(info.size.height == 400).assertTrue();
                        done();
                    });
                });
            }
        });
    } else {
        console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ error.message);
        console.info('MediaLibraryTest : getFileAssets :FAIL');
        expect(false).assertTrue();
        done();
    }
});
})

it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_03', 0, async function (done) {

media.getFileAssets(videoFetchOp, (error, data) => {
    if (data != undefined) {
        console.info('MediaLibraryTest : getFileAssets Successfull '+ data.getCount());
        data.getFirstObject((err1, data1) => {
            if (data1 != undefined) {
                let size = { width:80, height:80 }
                data1.getThumbnail(size, (err2, pixelmap) => {
                    console.info('MediaLibraryTest : getThumbnail Successfull '+ pixelmap);
                    pixelmap.getImageInfo((error, info) => {
                        console.info('MediaLibraryTest : pixel image info ' + info);
                        console.info('MediaLibraryTest : pixel width ' + info.size.width);
                        console.info('MediaLibraryTest : pixel height ' + info.size.height);
                        expect(info.size.width == 80).assertTrue();
                        expect(info.size.height == 80).assertTrue();
                        done();
                    });
                });
            }
        });
    } else {
        console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ error.message);
        console.info('MediaLibraryTest : getFileAssets :FAIL');
        expect(false).assertTrue();
        done();
    }
});
})

it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_04', 0, async function (done) {

media.getFileAssets(videoFetchOp, (error, data) => {
    if (data != undefined) {
        console.info('MediaLibraryTest : getFileAssets Successfull '+ data.getCount());
        data.getFirstObject((err1, data1) => {
            if (data1 != undefined) {
                let size = { width:400, height:400 }
                data1.getThumbnail(size, (err2, pixelmap) => {
                    console.info('MediaLibraryTest : getThumbnail Successfull '+ pixelmap);
                    pixelmap.getImageInfo((error, info) => {
                        console.info('MediaLibraryTest : pixel image info ' + info);
                        console.info('MediaLibraryTest : pixel width ' + info.size.width);
                        console.info('MediaLibraryTest : pixel height ' + info.size.height);
                        expect(info.size.width == 400).assertTrue();
                        expect(info.size.height == 400).assertTrue();
                        done();
                    });
                });
            }
        });
    } else {
        console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ error.message);
        console.info('MediaLibraryTest : getFileAssets :FAIL');
        expect(false).assertTrue();
        done();
    }
});
})

it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_05', 0, async function (done) {

media.getFileAssets(audioFetchOp, (error, data) => {
    if (data != undefined) {
        console.info('MediaLibraryTest : getFileAssets Successfull '+ data.getCount());
        data.getFirstObject((err1, data1) => {
            if (data1 != undefined) {
                let size = { width:80, height:80 }
                data1.getThumbnail(size, (err2, pixelmap) => {
                    console.info('MediaLibraryTest : getThumbnail Successfull '+ pixelmap);
                    pixelmap.getImageInfo((error, info) => {
                        console.info('MediaLibraryTest : pixel image info ' + info);
                        console.info('MediaLibraryTest : pixel width ' + info.size.width);
                        console.info('MediaLibraryTest : pixel height ' + info.size.height);
                        expect(info.size.width == 80).assertTrue();
                        expect(info.size.height == 80).assertTrue();
                        done();
                    });
                });
            }
        });
    } else {
        console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ error.message);
        console.info('MediaLibraryTest : getFileAssets :FAIL');
        expect(false).assertTrue();
        done();
    }
});
})

it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_06', 0, async function (done) {

media.getFileAssets(audioFetchOp, (error, data) => {
    if (data != undefined) {
        console.info('MediaLibraryTest : getFileAssets Successfull '+ data.getCount());
        data.getFirstObject((err1, data1) => {
            if (data1 != undefined) {
                let size = { width:400, height:400 }
                data1.getThumbnail(size, (err2, pixelmap) => {
                    console.info('MediaLibraryTest : getThumbnail Successfull '+ pixelmap);
                    pixelmap.getImageInfo((error, info) => {
                        console.info('MediaLibraryTest : pixel image info ' + info);
                        console.info('MediaLibraryTest : pixel width ' + info.size.width);
                        console.info('MediaLibraryTest : pixel height ' + info.size.height);
                        expect(info.size.width == 400).assertTrue();
                        expect(info.size.height == 400).assertTrue();
                        done();
                    });
                });
            }
        });
    } else {
        console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ error.message);
        console.info('MediaLibraryTest : getFileAssets :FAIL');
        expect(false).assertTrue();
        done();
    }
});
})

})