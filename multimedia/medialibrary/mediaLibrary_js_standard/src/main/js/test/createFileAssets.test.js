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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('Create_File_Assets.test.js', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    const media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');

    beforeAll(function () {
        onsole.info('MediaLibraryTest: beforeAll');

    })

    beforeEach(function () {
        console.info('MediaLibraryTest: beforeEach');

    })
    afterEach(function () {
        console.info('MediaLibraryTest: afterEach');

    })
    afterAll(function () {
        console.info('MediaLibraryTest: afterAll');
        console.info('MediaLibraryTest : createAsset : release begin');
        if (media != undefined) {
            media.release();
        }
        console.info('MediaLibraryTest : createAsset : release end');
    })

    /*
     * @tc.number    : 01
     * @tc.name      : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01
     * @tc.desc      : Create an image file asset in predefined relative path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01', 0, async function (done) {
        if (media == null || media == undefined) {
            console.info('MediaLibraryTest : media == null');
        } else {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let displayName = "02image.jpg";
            let rp = "Pictures/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileObj) => {
                if (fileObj != undefined) {
                    console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileObj.uri);

                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : PASS');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
            console.info('MediaLibraryTest : createAsset end');
        }
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 end');

    /*
     * @tc.number    : 02
     * @tc.name      : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_02 
     * @tc.desc      : Create an image file asset in not predefined relative path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_02 begin');
    it('SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_02', 0, async function (done) {
        if (media == null || media == undefined) {
            console.info('MediaLibraryTest : media == null');
        } else {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let displayName = "02image.jpg";
            let rp = "Pictures/test/001/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileObj) => {
                if (fileObj != undefined) {
                    console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileObj.uri);

                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_02 : PASS');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_02 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
            console.info('MediaLibraryTest : createAsset end');
        }
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_02 end');

    /*
     * @tc.number    : 03
     * @tc.name      : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03 
     * @tc.desc      : Repeat to create same image file asset expect return error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03 begin');
    it('SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03', 0, async function (done) {
        if (media == null || media == undefined) {
            console.info('MediaLibraryTest : media == null');
        } else {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let displayName = "02image.jpg";
            let rp = "Pictures/test/001/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileObj) => {
                if (fileObj == undefined) {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03 : PASS');
                    expect(true).assertTrue();
                    done();
                }
                console.info('MediaLibraryTest : createAsset : FAIL');
                console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03 : FAIL');
                expect(false).assertTrue();
                done();
            });
            console.info('MediaLibraryTest : createAsset end');
        }
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03 end');


    /*
     * @tc.number    : 04
     * @tc.name      : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_04 
     * @tc.desc      : Create image file asset in invalid relative path expect return error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_04 begin');
    it('SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_04', 0, async function (done) {
        if (media == null || media == undefined) {
            console.info('MediaLibraryTest : media == null');
        } else {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let displayName = "04image.jpg";
            let rp = "test/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileObj) => {
                if (createAssetErr != undefined) {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_04 : PASS');
                    expect(true).assertTrue();
                    done();
                }
                console.info('MediaLibraryTest : createAsset : FAIL');
                console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_04 : FAIL');
                expect(false).assertTrue();
                done();
            });
            console.info('MediaLibraryTest : createAsset end');
        }
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_04 end');

    /*
     * @tc.number    : 07
     * @tc.name      : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07
     * @tc.desc      : After create an image file asset, open and close it
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 begin');
    it('SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07', 0, async function (done) {
        if (media == null || media == undefined) {
            console.info('MediaLibraryTest : media == null');
        } else {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let displayName = "03image.jpg";

            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE, (err, rp) => {
                if (rp != undefined) {
                    console.info('MediaLibraryTest : getPublicDirectory Successfull ' + rp);
                    console.info('MediaLibraryTest : createAsset begin');
                    media.createAsset(mediaType, displayName, rp, (createAssetErr, data) => {
                        if (data != undefined) {
                            console.info('MediaLibraryTest : createAsset Successfull ');
                            getObjectInfo(data);
                        } else {
                            console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 : FAIL');
                            expect(false).assertTrue();
                            done();
                        }
                    });
                    console.info('MediaLibraryTest : createAsset end');
                } else {
                    console.info('MediaLibraryTest : getPublicDirectory : FAIL');
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 end');
    });

    function getObjectInfo(fileAsset){
        console.info('MediaLibraryTest : getObjectInfo uri is '+ fileAsset.uri);

        console.info("==========================fileAsset.open begin=======================>");
        fileAsset.open('Rw').then((openError, fd) => {
            if (openError == undefined) {
                console.info('MediaLibraryTest : open : FAIL ' + openError.message);
                console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 : FAIL');
                expect(false).assertTrue();
                done();
            }
            console.info("==========================fileAsset.open success=======================>");
            console.debug("open success fd = " + JSON.stringify(fd));
            console.info("==========================fileAsset.close begin=======================>");
            fileAsset.close(fd).then((closeErr) => {
                if (closeErr == undefined) {
                    console.info('MediaLibraryTest : close : FAIL ' + closeErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
                console.info("==========================fileAsset.close success=======================>");
                console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_07 : PASS');
                expect(true).assertTrue();
                done();
            });
            console.info("==========================fileAsset.close end=======================>");
        });
        console.info("==========================fileAsset.open end=======================>");
    }
});
