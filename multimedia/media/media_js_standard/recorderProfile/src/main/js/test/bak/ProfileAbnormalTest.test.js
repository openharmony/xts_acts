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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoRecorderProfileAbnormalCallback', function () {
    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0100
      * @tc.name      : 01.test getVideoRecorderProfile
      * @tc.desc      : sourceId -1 qualityLevel 0
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0100', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getVideoRecorderProfile(-1, 0, (err, videoCapsArray) => {
                    expect(err).assertUndefined();
                    console.info('getVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0200
      * @tc.name      : 02.test getVideoRecorderProfile
      * @tc.desc      : sourceId 0 qualityLevel -1
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0200', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getVideoRecorderProfile(0, -1, (err, videoCapsArray) => {
                    expect(err).assertUndefined();
                    console.info('getVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0300
      * @tc.name      : 03.test getVideoRecorderProfile
      * @tc.desc      : sourceId 100000 qualityLevel 0
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0300', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getVideoRecorderProfile(100000, 0, (err, videoCapsArray) => {
                    expect(err).assertUndefined();
                    console.info('getVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0400
      * @tc.name      : 04.test getVideoRecorderProfile
      * @tc.desc      : sourceId 0 qualityLevel 100000
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0400', 0, async function (done) {
        console.info("test getVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getVideoRecorderProfile(0, 100000, (err, videoCapsArray) => {
                    expect(err).assertUndefined();
                    console.info('getVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0500
      * @tc.name      : 05.test isAudioRecoderConfigSupported
      * @tc.desc      : isAudioRecoderConfigSupported false
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0500', 0, async function (done) {
        console.info("test isAudioRecoderConfigSupported");
        let audioProfile = {
            "outputFormat": 'aaa',
            "audioEncoderMime": media.CodecMimeType.AUDIO_AAC,
            "bitrate": 8000,
            "sampleRate": 500,
            "channel": 1,
        }
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.isAudioRecoderConfigSupported(audioProfile, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('isAudioRecoderConfigSupported: success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0600
      * @tc.name      : 06.test hasVideoRecorderProfile
      * @tc.desc      : sourceId -1 qualityLevel 0
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0600', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.hasVideoRecorderProfile(-1, 0, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('hasVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0700
      * @tc.name      : 07.test hasVideoRecorderProfile
      * @tc.desc      : sourceId 0 qualityLevel -1
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0700', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.hasVideoRecorderProfile(0, -1, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('hasVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0800
      * @tc.name      : 08.test hasVideoRecorderProfile
      * @tc.desc      : sourceId 100000 qualityLevel 0
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0800', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.hasVideoRecorderProfile(100000, 0, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('hasVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
      * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_0900
      * @tc.name      : 09.test hasVideoRecorderProfile
      * @tc.desc      : sourceId 0 qualityLevel 100000
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_0900', 0, async function (done) {
        console.info("test hasVideoRecorderProfile");
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.hasVideoRecorderProfile(0, 100000, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('hasVideoRecorderProfile success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
    * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_1000
    * @tc.name      : 10.test isAudioRecoderConfigSupported
    * @tc.desc      : isAudioRecoderConfigSupported false
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_1000', 0, async function (done) {
        console.info("test isAudioRecoderConfigSupported");
        let audioProfile = {
            "outputFormat": media.ContainerFormatType.CFT_MPEG_4A,
            "audioEncoderMime": 'aaa',
            "bitrate": 8000,
            "sampleRate": 500,
            "channel": 1,
        }
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.isAudioRecoderConfigSupported(audioProfile, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('isAudioRecoderConfigSupported: success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
    * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_1100
    * @tc.name      : 11.test isAudioRecoderConfigSupported
    * @tc.desc      : isAudioRecoderConfigSupported false
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_1100', 0, async function (done) {
        console.info("test isAudioRecoderConfigSupported");
        let audioProfile = {
            "outputFormat": media.ContainerFormatType.CFT_MPEG_4A,
            "audioEncoderMime": media.CodecMimeType.AUDIO_AAC,
            "bitrate": 1000000,
            "sampleRate": 500,
            "channel": 1,
        }
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.isAudioRecoderConfigSupported(audioProfile, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('isAudioRecoderConfigSupported: success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
    * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_1200
    * @tc.name      : 12.test isAudioRecoderConfigSupported
    * @tc.desc      : isAudioRecoderConfigSupported false
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_1200', 0, async function (done) {
        console.info("test isAudioRecoderConfigSupported");
        let audioProfile = {
            "outputFormat": media.ContainerFormatType.CFT_MPEG_4A,
            "audioEncoderMime": media.CodecMimeType.AUDIO_AAC,
            "bitrate": 8000,
            "sampleRate": 1000000,
            "channel": 1,
        }
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.isAudioRecoderConfigSupported(audioProfile, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('isAudioRecoderConfigSupported: success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })

    /* *
    * @tc.number    : SUB_PROFILE_ABNORMAL_CALLBACK_1300
    * @tc.name      : 13.test isAudioRecoderConfigSupported
    * @tc.desc      : isAudioRecoderConfigSupported false
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_PROFILE_ABNORMAL_CALLBACK_1300', 0, async function (done) {
        console.info("test isAudioRecoderConfigSupported");
        let audioProfile = {
            "outputFormat": media.ContainerFormatType.CFT_MPEG_4A,
            "audioEncoderMime": media.CodecMimeType.AUDIO_AAC,
            "bitrate": 8000,
            "sampleRate": 500,
            "channel": 0,
        }
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.isAudioRecoderConfigSupported(audioProfile, (err, ean) => {
                    expect(err).assertUndefined();
                    expect(ean).assertEqual(false);
                    console.info('isAudioRecoderConfigSupported: success');
                    done();
                })
            } else {
                console.info('mediaCaps is not defined');
                done();
            }
        })
    })
})