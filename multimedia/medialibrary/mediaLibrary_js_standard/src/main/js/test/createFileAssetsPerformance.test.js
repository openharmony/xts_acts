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


describe('createFileAssetsPerformance.test.js', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    const media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    let times = 100;

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
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_03
     * @tc.name      : Create an image file asset in predefined path 
     * @tc.desc      : Create an image file asset in predefined path
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01 begin');
    it('SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01', 0, async function (done) {
        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01 begin1');
        if (media == null || media == undefined) {
            console.info('MediaLibraryTest : media == null');
        } else {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            let displayNamePrefix = "image";
            let extendStr = ".jpg"
            let rp = "Pictures/";
            let displayName;
            let conteEnd = 0;
            for (let i = 0; i < times; i++) {
                displayName = displayNamePrefix + i + extendStr;
                console.info('MediaLibraryTest : createAsset begin');
                media.createAsset(mediaType, displayName, rp).then((fileObj) => {
                    if (fileObj != undefined) {
                        console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileObj.uri);
                        conteEnd++;
                        if (conteEnd == times){
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01 : PASS');
                            expect(true).assertTrue();
                            done();
                        } else if (i == times) {
                            console.info('MediaLibraryTest : createAsset has error');
                            console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01:Partial');
                            expect(false).assertTrue();
                            done();
                        }
                    } else {
                        console.info('MediaLibraryTest : createAsset Unsuccessfull ');
                        console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01 : FAIL');
                        expect(false).assertTrue();
                        done();
                    }
                });
                console.info('MediaLibraryTest : createAsset end');
            }
        }
    });
    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_PERFORMANCE_01 end');
});
