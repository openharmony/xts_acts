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


describe('getFileAssetsPerformance_object.test.js', function () {
    console.info("mediaLibrary Instance before");
    const media = mediaLibrary.getMediaLibrary();
    console.info("mediaLibrary Instance after");

    let times = 100;
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
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_ALL_OBJECT_PERFORMANCE_01
     * @tc.name      :  
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_ALL_OBJECT_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_ALL_OBJECT_PERFORMANCE_01', 0, async function (done) {
        console.info('MediaLibraryTest : getFileAssets begin');
        const queryResultSet = await media.getFileAssets(fetchOp);
        queryResultSet_ = queryResultSet;
        console.info('MediaLibraryTest : getFileAssets after');
        if (queryResultSet_ == undefined) {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_ALL_OBJECT_PERFORMANCE_01 : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            for(let i = 0; i < 3; i++) {
                console.info('MediaLibraryTest : getAllObject begin :times: ' + i);
                const data1 = await queryResultSet_.getAllObject();
                if (data1 != undefined) {
                    console.info('MediaLibraryTest : getAllObject :PASS times: ' + i);
                    expect(true).assertTrue();
                } else {
                    console.info('MediaLibraryTest : getAllObject :FAIL times: ' + i);
                    expect(false).assertTrue();
                }
                console.info('MediaLibraryTest : getAllObject after :times: ' + i);
            }
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_ALL_OBJECT_PERFORMANCE_01 end');
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FIRST_OBJECT_PERFORMANCE_01
     * @tc.name      :  
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FIRST_OBJECT_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_FIRST_OBJECT_PERFORMANCE_01', 0, async function (done) {
        if (queryResultSet_ == undefined) {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FIRST_OBJECT_PERFORMANCE_01 : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            for(let i = 0; i < times; i++) {
                console.info('MediaLibraryTest : getFirstObject begin :times: ' + i);
                const fileAsset = await queryResultSet_.getFirstObject();
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : getFirstObject :PASS times: ' + i);
                    expect(true).assertTrue();
                } else {
                    console.info('MediaLibraryTest : getFirstObject :FAIL times: ' + i);
                    expect(false).assertTrue();
                }
                console.info('MediaLibraryTest : getFirstObject after :times: ' + i);
            }
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_FIRST_OBJECT_PERFORMANCE_01 end');
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_IS_AFTER_LAST_PERFORMANCE_01
     * @tc.name      :  
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_IS_AFTER_LAST_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_IS_AFTER_LAST_PERFORMANCE_01', 0, async function (done) {
        if (queryResultSet_ == undefined) {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_IS_AFTER_LAST_PERFORMANCE_01 : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            for(let i = 0; i < times; i++) {
                console.info('MediaLibraryTest : isAfterLast begin :times: ' + i);
                const isAfterLastBool = queryResultSet_.isAfterLast();
                expect(!isAfterLastBool).assertTrue();
                console.info('MediaLibraryTest : isAfterLast after :times: ' + i);
            }
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_IS_AFTER_LAST_PERFORMANCE_01 end');
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_LAST_OBJECT_PERFORMANCE_01
     * @tc.name      :  
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_LAST_OBJECT_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_LAST_OBJECT_PERFORMANCE_01', 0, async function (done) {
        if (queryResultSet_ == undefined) {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_LAST_OBJECT_PERFORMANCE_01 : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            for(let i = 0; i < times; i++) {
                console.info('MediaLibraryTest : getLastObject begin :times: ' + i);
                const fileAsset = await queryResultSet_.getLastObject();
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : getLastObject :PASS times: ' + i);
                    expect(true).assertTrue();
                } else {
                    console.info('MediaLibraryTest : getLastObject :FAIL times: ' + i);
                    expect(false).assertTrue();
                }
                console.info('MediaLibraryTest : getLastObject after :times: ' + i);
            }
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_LAST_OBJECT_PERFORMANCE_01 end');
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_POSITION_OBJECT_PERFORMANCE_01
     * @tc.name      :  
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_POSITION_OBJECT_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_POSITION_OBJECT_PERFORMANCE_01', 0, async function (done) {
        if (queryResultSet_ == undefined) {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_POSITION_OBJECT_PERFORMANCE_01 : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            for(let i = 0; i < times; i++) {
                console.info('MediaLibraryTest : getPositionObject begin :times: ' + i);
                const fileAsset = await queryResultSet_.getPositionObject(i);
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : getPositionObject :PASS times: ' + i);
                    expect(true).assertTrue();
                } else {
                    console.info('MediaLibraryTest : getPositionObject :FAIL times: ' + i);
                    expect(false).assertTrue();
                }
                console.info('MediaLibraryTest : getPositionObject after :times: ' + i);
            }
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_POSITION_OBJECT_PERFORMANCE_01 end');
        done();
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_NEXT_OBJECT_PERFORMANCE_01
     * @tc.name      :  
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_NEXT_OBJECT_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_GET_NEXT_OBJECT_PERFORMANCE_01', 0, async function (done) {
        console.info('MediaLibraryTest : getFileAssets begin');
        const queryResultSet = await media.getFileAssets(fetchOp);
        console.info('MediaLibraryTest : getFileAssets after');
        if (queryResultSet == undefined) {
            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_NEXT_OBJECT_PERFORMANCE_01 : FAIL');
            expect(false).assertTrue();
            done();
        } else {
            for(let i = 0; i < times; i++) {
                console.info('MediaLibraryTest : getNextObject begin :times: ' + i);
                const fileAsset = await queryResultSet.getNextObject();
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : getNextObject :PASS times: ' + i);
                    expect(true).assertTrue();
                } else {
                    console.info('MediaLibraryTest : getNextObject :FAIL isAfterLast: ' + queryResultSet_.isAfterLast());
                    console.info('MediaLibraryTest : getNextObject :FAIL times: ' + i);
                    expect(false).assertTrue();
                }
                console.info('MediaLibraryTest : getNextObject after :times: ' + i);
            }
        }
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_GET_NEXT_OBJECT_PERFORMANCE_01 end');
        done();
    });
});
