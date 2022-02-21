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
import image from '@@ohos.multimedia.image';
import featureAbility from '@ohos.ability.featureAbility'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'


describe('GetFileAssets_GetCount_GetAllObjects', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');

    var URI;
    var name;
    var result1;
    var albumName;
    var albumId;
    var i;
    var fileAsset;
    var MAXNUM = 100;
    var PATH = 'data';
    var MEDIA_TYPE = 'media_type';
    let fileKeyObj = mediaLibrary.FileKey

    let type = mediaLibrary.MediaType.IMAGE
    let videoType = mediaLibrary.MediaType.VIDEO
    let audioType = mediaLibrary.MediaType.AUDIO
    let fetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + "=?",
        selectionArgs: [type.toString()],
        order: fileKeyObj.dateAdded,
    }
    let videoFetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + "=?",
        selectionArgs: [videoType.toString()],
        order: fileKeyObj.dateAdded,
    }
    let audioFetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + "=?",
        selectionArgs: [audioType.toString()],
        order: fileKeyObj.dateAdded,
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
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 80, height: 80 }
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
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
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    })

    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_02', 0, async function (done) {

        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 400, height: 400 }
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
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
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    })

    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_03', 0, async function (done) {

        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 80, height: 80 }
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
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
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    })

    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_04', 0, async function (done) {

        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 400, height: 400 }
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
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
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    })

    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_05', 0, async function (done) {

        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 80, height: 80 }
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
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
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    })

    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_06', 0, async function (done) {

        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 400, height: 400 }
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
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
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    })

})