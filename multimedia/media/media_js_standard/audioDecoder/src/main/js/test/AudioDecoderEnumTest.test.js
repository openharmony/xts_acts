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

describe('AudioDecoderEnum', function () {

    beforeAll(function() {
        console.info('beforeAll case');
    })

    beforeEach(function() {
        console.info('beforeEach case');
    })

    afterEach(function() {
        console.info('afterEach case');
        wait(2000);
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    let failCallback = function(err) {
        console.info('case callback err : ' + err);
        expect(err).assertUndefined();
    }

    let failCatch = function(err) {
        console.info('case catch err : ' + err);
        expect(err).assertUndefined();
    }

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_DECODER_ENUM_AACProfile_0100
        * @tc.name      : 001.AACProfile
        * @tc.desc      : Test Enumerate AACProfile
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_DECODER_ENUM_AACProfile_0100', 0, async function (done) {
        expect(media.AACProfile.AAC_PROFILE_LC).assertEqual(0);
        expect(media.AACProfile.AAC_PROFILE_ELD).assertEqual(1);
        expect(media.AACProfile.AAC_PROFILE_ERLC).assertEqual(2);
        expect(media.AACProfile.AAC_PROFILE_HE).assertEqual(3);
        expect(media.AACProfile.AAC_PROFILE_HE_V2).assertEqual(4);
        expect(media.AACProfile.AAC_PROFILE_LD).assertEqual(5);
        expect(media.AACProfile.AAC_PROFILE_MAIN).assertEqual(6);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_DECODER_ENUM_AudioCaps_0100
        * @tc.name      : 002.AudioCaps
        * @tc.desc      : Test Interface AudioCaps
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_DECODER_ENUM_AudioCaps_0100', 0, async function (done) {
        console.info("case test Test Interface AudioCaps");
        await media.getMediaCapability().then((mediaCaps)  => {
            console.info('getMediaCapability success');
            if (typeof (mediaCaps) != 'undefined') {
                mediaCaps.getAudioDecoderCaps().then((audioCapsArray)  => {
                    console.info('getAudioDecoderCaps success');
                    if (typeof (audioCapsArray) !== 'undefined') {
                        console.info('audioCapsArray is not null');
                        // check AudioCaps
                        let audioCaps = audioCapsArray[0];
                        expect(audioCaps.codecInfo !== undefined).assertTrue();

                        // check AudioCaps.AVCodecInfo
                        let avCodecInfo = audioCaps.codecInfo;
                        expect(avCodecInfo.name !== undefined).assertTrue();
                        console.info('avCodecInfo.name: '+ avCodecInfo.name);
                        expect(avCodecInfo.type !== undefined).assertTrue();
                        console.info('avCodecInfo.type: '+ avCodecInfo.type);
                        expect(avCodecInfo.mimeType !== undefined).assertTrue();
                        console.info('avCodecInfo.mimeType: '+ avCodecInfo.mimeType);
                        expect(avCodecInfo.isHardwareAccelerated !== undefined).assertTrue();
                        console.info('avCodecInfo.isHardwareAccelerated: '+ avCodecInfo.isHardwareAccelerated);
                        expect(avCodecInfo.isSoftwareOnly !== undefined).assertTrue();
                        console.info('avCodecInfo.isSoftwareOnly: '+ avCodecInfo.isSoftwareOnly);
                        expect(avCodecInfo.isVendor !== undefined).assertTrue();
                        console.info('avCodecInfo.isVendor: '+ avCodecInfo.isVendor);
                        
                        // check AudioCaps.supportedBitrate
                        expect(audioCaps.supportedBitrate !== undefined).assertTrue();
                        console.info('supportedBitrate.min: '+ audioCaps.supportedBitrate.min);
                        console.info('supportedBitrate.max: '+ audioCaps.supportedBitrate.max);

                        // check AudioCaps.supportedChannel
                        expect(audioCaps.supportedChannel !== undefined).assertTrue();
                        console.info('supportedChannel.min: '+ audioCaps.supportedChannel.min);
                        console.info('supportedChannel.max: '+ audioCaps.supportedChannel.max); 
                        
                        // check AudioCaps.supportedFormats
                        expect(audioCaps.supportedFormats !== undefined).assertTrue();
                        console.info('audioCaps.supportedFormats: '+ audioCaps.supportedFormats);

                        // check AudioCaps.supportedSampleRates
                        expect(audioCaps.supportedSampleRates !== undefined).assertTrue();
                        console.info('audioCaps.supportedSampleRates: '+ audioCaps.supportedSampleRates);

                        // check AudioCaps.supportedProfiles
                        expect(audioCaps.supportedProfiles !== undefined).assertTrue();
                        console.info('audioCaps.supportedProfiles: '+ audioCaps.supportedProfiles);

                        // check AudioCaps.supportedLevels
                        expect(audioCaps.supportedLevels !== undefined).assertTrue();
                        console.info('audioCaps.supportedLevels: '+ audioCaps.supportedLevels);

                        // check AudioCaps.supportedComplexity
                        expect(audioCaps.supportedComplexity !== undefined).assertTrue();
                        console.info('supportedComplexity.min: '+ audioCaps.supportedComplexity.min);
                        console.info('supportedComplexity.max: '+ audioCaps.supportedComplexity.max);
                    } else {
                        console.info('audioCapsArray is not defined');
                        expect().assertFail();
                        done();
                    }
                }, failCallback).catch(failCatch);
            } else {
                console.info('mediaCaps is not defined');
                expect().assertFail();
                done();
            }
        }, failCallback).catch(failCatch);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_DECODER_ENUM_AudioRawFormat_0100
        * @tc.name      : 003.AudioRawFormat
        * @tc.desc      : Test Enumerate AudioRawFormat
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_DECODER_ENUM_AudioRawFormat_0100', 0, async function (done) {
        expect(media.AudioRawFormat.AUDIO_PCM_S8).assertEqual(1);
        expect(media.AudioRawFormat.AUDIO_PCM_8).assertEqual(2);
        expect(media.AudioRawFormat.AUDIO_PCM_S16_BE).assertEqual(3);
        expect(media.AudioRawFormat.AUDIO_PCM_S16_LE).assertEqual(4);
        expect(media.AudioRawFormat.AUDIO_PCM_16_BE).assertEqual(5);
        expect(media.AudioRawFormat.AUDIO_PCM_16_LE).assertEqual(6);
        expect(media.AudioRawFormat.AUDIO_PCM_S24_BE).assertEqual(7);
        expect(media.AudioRawFormat.AUDIO_PCM_S24_LE).assertEqual(8);
        expect(media.AudioRawFormat.AUDIO_PCM_24_BE).assertEqual(9);
        expect(media.AudioRawFormat.AUDIO_PCM_24_LE).assertEqual(10);
        expect(media.AudioRawFormat.AUDIO_PCM_S32_BE).assertEqual(11);
        expect(media.AudioRawFormat.AUDIO_PCM_S32_LE).assertEqual(12);
        expect(media.AudioRawFormat.AUDIO_PCM_32_BE).assertEqual(13);
        expect(media.AudioRawFormat.AUDIO_PCM_32_LE).assertEqual(14);
        expect(media.AudioRawFormat.AUDIO_PCM_F32_BE).assertEqual(15);
        expect(media.AudioRawFormat.AUDIO_PCM_F32_LE).assertEqual(16);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_DECODER_ENUM_AVCodecType_0100
        * @tc.name      : 004.AVCodecType
        * @tc.desc      : Test Enumerate AVCodecType
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_DECODER_ENUM_AVCodecType_0100', 0, async function (done) {
        expect(media.AVCodecType.AVCODEC_TYPE_VIDEO_ENCODER).assertEqual(0);
        expect(media.AVCodecType.AVCODEC_TYPE_VIDEO_DECODER).assertEqual(1);
        expect(media.AVCodecType.AVCODEC_TYPE_AUDIO_ENCODER).assertEqual(2);
        expect(media.AVCodecType.AVCODEC_TYPE_AUDIO_DECODER).assertEqual(3);
        done();
    })  
    
    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_DECODER_ENUM_CodecMimeType_0100
        * @tc.name      : 005.CodecMimeType
        * @tc.desc      : Test Enumerate CodecMimeType
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_DECODER_ENUM_CodecMimeType_0100', 0, async function (done) {
        expect(media.CodecMimeType.AUDIO_AMR_NB).assertEqual('audio/3gpp');
        expect(media.CodecMimeType.AUDIO_AMR_WB).assertEqual('audio/amr-wb');
        expect(media.CodecMimeType.AUDIO_MPEG).assertEqual('audio/mpeg');
        expect(media.CodecMimeType.AUDIO_AAC).assertEqual('audio/mp4a-latm');
        expect(media.CodecMimeType.AUDIO_VORBIS).assertEqual('audio/vorbis');
        expect(media.CodecMimeType.AUDIO_OPUS).assertEqual('audio/opus');
        expect(media.CodecMimeType.AUDIO_FLAC).assertEqual('audio/flac');
        expect(media.CodecMimeType.AUDIO_RAW).assertEqual('audio/raw');
        done();
    })
})