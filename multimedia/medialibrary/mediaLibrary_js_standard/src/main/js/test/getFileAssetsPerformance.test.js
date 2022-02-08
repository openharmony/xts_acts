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


describe('getFileAssetsPerformance.test.js', function () {
    console.info("mediaLibrary Instance before");
    const media = mediaLibrary.getMediaLibrary();
    console.info("mediaLibrary Instance after");

    let times = 25;
    let queryResultSet_;
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
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_PERFORMANCE_01
     * @tc.name      : Create an image file asset in predefined path 
     * @tc.desc      : Create an image file asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_PERFORMANCE_01', 0, async function (done) {
        for (let i = 0; i < times; i++) {
            const queryResultSet = await media.getFileAssets(fetchOp);
            if (queryResultSet != undefined) {
                console.info('MediaLibraryTest : getFileAssets : PASS '+ queryResultSet.getCount());
                expect(true).assertTrue();
            } else {
                console.info('MediaLibraryTest : getFileAssets : FAIL');
                expect(false).assertTrue();
            }
        }
        console.info('MediaLibraryTest : for : end');
        done();
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_PERFORMANCE_01 end');
});
