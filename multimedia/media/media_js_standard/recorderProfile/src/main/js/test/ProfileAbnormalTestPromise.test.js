/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * Distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * Limitations under the License.
 */

import media from '@ohos.multimedia.media'
import * as base from './ProfileTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ProfileAbnormalTestPromise() {
describe('ProfileAbnormalTestPromise', function () {
    beforeAll(function () {
        console.info('beforeAll case');
    })

    beforeEach(async function () {
        console.info('beforeEach case');
    })

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    async function promiseAbnormalGetVideoProfile(sourceId, qualityLevel, done) {
        media.getMediaCapability().then(async (mediaCaps) => {
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getVideoRecorderProfile(sourceId, qualityLevel).then(async (videoCapsArray) => {
                    base.checkVideoCapsArray(videoCapsArray);
                    console.info('getVideoRecorderProfile success');
                    done();
                }, err => {
                    expect(err).assertUndefined();
                    done();
                })
            } else {
                console.info('mediaCaps is undefined');
                expect().assertFail();
                done();
            }
        }, err => {
            expect(err).assertUndefined();
            done();
        })
    }
    
    async function promiseAbnormalAudioRecoderConfigSupported(audioProfile, done) {
        media.getMediaCapability().then(async (mediaCaps) => {
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.isAudioRecoderConfigSupported(audioProfile).then(async (ean) => {
                    console.info('isAudioRecoderConfigSupported: success' + ean);
                    expect(ean).assertEqual(false);
                    console.info('isAudioRecoderConfigSupported: success');
                    done();
                }, err => {
                    expect(err).assertUndefined();
                    done();
                })
            } else {
                console.info('mediaCaps is undefined');
                expect().assertFail();
                done();
            }
        }, err => {
            expect(err).assertUndefined();
            done();
        })
    }
    
    async function promiseAbnormalHasVideoProfile(sourceId, qualityLevel, done) {
        media.getMediaCapability().then(async (mediaCaps) => {
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.hasVideoRecorderProfile(sourceId, qualityLevel).then(async (ean) => {
                    expect(ean).assertEqual(false);
                    console.info('hasVideoRecorderProfile success');
                    done();
                }, err => {
                    expect(err).assertUndefined();
                    done();
                })
            } else {
                console.info('mediaCaps is undefined');
                expect().assertFail();
                done();
            }
        }, err => {
            expect(err).assertUndefined();
            done();
        })
    }


    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0100
        * @tc.name      : test isAudioRecoderConfigSupported false
        * @tc.desc      : 5 args all set wrong
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0100', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        promiseAbnormalAudioRecoderConfigSupported(base.audioRecorderAbnormalAll, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0200
        * @tc.name      : test isAudioRecoderConfigSupported false
        * @tc.desc      : FormatType  is wrong
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0200', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        promiseAbnormalAudioRecoderConfigSupported(base.audioRecorderAbnormalFormatType, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0300
        * @tc.name      : test isAudioRecoderConfigSupported
        * @tc.desc      : CodecMimeType is wrong
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0300', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        promiseAbnormalAudioRecoderConfigSupported(base.audioRecorderAbnormalCodecMimeType, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0400
        * @tc.name      : test isAudioRecoderConfigSupported
        * @tc.desc      : bitrate is wrong
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0400', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        promiseAbnormalAudioRecoderConfigSupported(base.audioRecorderAbnormalBitrate, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0500
        * @tc.name      : test isAudioRecoderConfigSupported
        * @tc.desc      : sampleRate is wrong
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0500', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        promiseAbnormalAudioRecoderConfigSupported(base.audioRecorderAbnormalSampleRate, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0600
        * @tc.name      : test isAudioRecoderConfigSupported
        * @tc.desc      : channel is wrong
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0600', 0, async function (done) {
        console.info("test getAudioRecorderCaps");
        promiseAbnormalAudioRecoderConfigSupported(base.audioRecorderAbnormalSampleChannel, done);
    })

    /* *
        * @tc.number  : SUB_PROFILE_RELIABILITY_PROMISE_0700
        * @tc.name    : test hasVideoRecorderProfile
        * @tc.desc    : sourceId 1 qualityLevel 0
        * @tc.size    : MediumTest
        * @tc.type    : Function test
        * @tc.level   : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0700', 0, async function (done) {
        console.info('test hasVideoRecorderProfile');
        promiseAbnormalHasVideoProfile(1, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0800
        * @tc.name      : test hasVideoRecorderProfile sourceId -1
        * @tc.desc      : sourceId -1 qualityLevel 0
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0800', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        promiseAbnormalHasVideoProfile(-1, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_0900
        * @tc.name      : test hasVideoRecorderProfile qualityLevel -1
        * @tc.desc      : sourceId 0 qualityLevel -1
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_0900', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        promiseAbnormalHasVideoProfile(0, -1, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1000
        * @tc.name      : test hasVideoRecorderProfile sourceId 65536
        * @tc.desc      : sourceId 65535 qualityLevel 0
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1000', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        promiseAbnormalHasVideoProfile(65535, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1100
        * @tc.name      : test hasVideoRecorderProfile sourceId 65536
        * @tc.desc      : sourceId 65536 qualityLevel 0
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1100', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        promiseAbnormalHasVideoProfile(65536, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1200
        * @tc.name      : test hasVideoRecorderProfile qualityLevel 65536
        * @tc.desc      : sourceId 0 qualityLevel 65535
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1200', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        promiseAbnormalHasVideoProfile(0, 65535, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1300
        * @tc.name      : test hasVideoRecorderProfile qualityLevel 65536
        * @tc.desc      : sourceId 0 qualityLevel 65536
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1300', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        promiseAbnormalHasVideoProfile(0, 65536, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1400
        * @tc.name      : test getVideoRecorderProfile sourceId -1
        * @tc.desc      : sourceId -1 qualityLevel 0
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1400', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        promiseAbnormalGetVideoProfile(-1, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1500
        * @tc.name      : test getVideoRecorderProfile qualityLevel -1
        * @tc.desc      : sourceId 0 qualityLevel -1
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1500', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        promiseAbnormalGetVideoProfile(0, -1, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1600
        * @tc.name      : test getVideoRecorderProfile sourceId 65535
        * @tc.desc      : sourceId 65535 qualityLevel 0
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1600', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        promiseAbnormalGetVideoProfile(65535, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1700
        * @tc.name      : test getVideoRecorderProfile sourceId 65536
        * @tc.desc      : sourceId 65536 qualityLevel 0
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1700', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        promiseAbnormalGetVideoProfile(65536, media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1800
        * @tc.name      : test getVideoRecorderProfile qualityLevel 65535
        * @tc.desc      : sourceId 0 qualityLevel 65535
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1800', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        promiseAbnormalGetVideoProfile(0, 65535, done);
    })

    /* *
        * @tc.number    : SUB_PROFILE_RELIABILITY_PROMISE_1900
        * @tc.name      : test getVideoRecorderProfile qualityLevel 65536
        * @tc.desc      : sourceId 0 qualityLevel 65536
        * @tc.size      : MediumTest
        * @tc.type      : Abnormal test
        * @tc.level     : Level2
    */
    it('SUB_PROFILE_RELIABILITY_PROMISE_1900', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        promiseAbnormalGetVideoProfile(0, 65536, done);
    })
})
}
