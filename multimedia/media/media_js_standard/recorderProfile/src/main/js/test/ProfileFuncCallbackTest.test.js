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

import media from '@ohos.multimedia.media'
import {checkAudioArray, checkVideoArray} from './ProfileTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ProfileFuncCallbackTest', function () {
    beforeAll(function() {
        console.info('beforeAll case');
    })

    beforeEach(async function() {
        console.info('beforeEach case');
    })

    afterEach(function() {
        console.info('afterEach case');
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    async function getAudioRecorderCapsTest(done) {
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getAudioRecorderCaps((err, audioCapsArray) => {
                    expect(err).assertUndefined();
                    console.info('getAudioRecorderCaps success');
                    if (typeof (audioCapsArray) != 'undefined') {
                        checkAudioArray(audioCapsArray, done);
                    } else {
                        console.info('audioCaps is not defined');
                        expect().assertFail();
                        done();
                    }
                    
                })
            } else {
                console.info('mediaCaps is not defined');
                expect().assertFail();
                done();
            }
        })
    }

    async function getVideoRecorderCapsTest(done) {
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getVideoRecorderCaps((err, videoCapsArray) => {
                    expect(err).assertUndefined();
                    console.info('getVideoRecorderCapsTest success');
                    if (typeof (videoCapsArray) != 'undefined') {
                        checkVideoArray(videoCapsArray, done);
                    } else {
                        console.info('videoCaps is not defined');
                        expect().assertFail();
                        done();
                    }
                })
            } else {
                console.info('mediaCaps is not defined');
                expect().assertFail();
                done();
            }
        })
    }
    
    /* *
      * @tc.number    : SUB_PROFILE_FUNCTION_CALLBACK_0100
      * @tc.name      : 01.test getAudioRecorderCaps
      * @tc.desc      : outputFormat/audioEncoderMime/sampleRates/bitrateRange/channelRange
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_FUNCTION_CALLBACK_0100', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        getAudioRecorderCapsTest(done);
        console.info("test getAudioRecorderCaps 111 ");
    })

    /* *
      * @tc.number    : SUB_PROFILE_FUNCTION_CALLBACK_0200
      * @tc.name      : 02.test getVideoRecorderCapsTest
      * @tc.desc      : audioEncoderMime/sampleRates/bitrateRange/channelRange
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_FUNCTION_CALLBACK_0200', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        getVideoRecorderCapsTest(done);
    })
})

