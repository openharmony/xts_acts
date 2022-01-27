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


import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('deleteFileAssetsPerformance.test.js', function () {
    console.info("mediaLibrary Instance before");
    const media = mediaLibrary.getMediaLibrary();
    console.info("mediaLibrary Instance after");

    let fileList_;
    let fileKeyObj = mediaLibrary.FileKey
    let type = mediaLibrary.MediaType.IMAGE
    let fetchOp = {
        selections : fileKeyObj.MEDIA_TYPE + " = ? ",
        selectionArgs : [type.toString()],
        order : fileKeyObj.DATE_ADDED,
    }
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
    })

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_FOR_DELETE_01
     * @tc.name      : Create an image file asset in predefined path 
     * @tc.desc      : Create an image file asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_FOR_DELETE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_FOR_DELETE_01', 0, async function (done) {
        media.getFileAssets(fetchOp, (getFileAssetsErr, queryResultSet) => {
            if (queryResultSet != undefined) {
                console.info('MediaLibraryTest : getAllObject Successfull '+ queryResultSet.getCount());
                if (queryResultSet.getCount() > 0) {
                    queryResultSet.getAllObject((getAllObjectErr, fileList) => {
                        if (fileList != undefined) {
                            fileList_ = fileList;
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_FOR_DELETE_01 :PASS');
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_FOR_DELETE_01 :FAIL'
                                + getAllObjectErr.message);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } else {
                    console.info('MediaLibraryTest : getFileAssets :No data');
                    expect(true).assertTrue();
                    done();
                }
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull '+ getFileAssetsErr.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_FOR_DELETE_01 end');

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_ASSET_01
     * @tc.name      : Create an image file asset in predefined path 
     * @tc.desc      : Create an image file asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01', 0, async function (done) {
        if (fileList_ != undefined) {
            let counteEnd = 0;
            for(let i = 0; i　< fileList_.length; i++) {
                let fileAsset = fileList_[i];
                console.info('MediaLibraryTest : uri is '+ fileAsset.uri);
                media.deleteAsset(fileAsset.uri, (deleteAssetErr, deleteRows) => {
                    if (deleteRows >= 0) {
                        console.info('MediaLibraryTest : Delete Asset Successfull '+ deleteRows);
                        counteEnd++;
                        if (counteEnd == fileList_.length){
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01 : PASS');
                            expect(true).assertTrue();
                            done();
                        } else if (i == fileList_.length - 1) {
                            console.info('MediaLibraryTest : delete has error');
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01 :Partial');
                            expect(false).assertTrue();
                            done();
                        }
                    } else {
                        console.info('MediaLibraryTest : delete error '+ deleteAssetErr.message);
                        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01 :FAIL');
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        } else {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01 :FAIL'
                + getAllObjectErr.message);
            expect(false).assertTrue();
            done();
        }
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_DELETE_FILE_PERFORMANCE_01 end');
});
