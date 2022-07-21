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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const audioRecorderCaps = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4A,
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    sampleRates: [8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000],
    bitrateRange: { min: 1, max: 384000 },
    channelRange: { min: 1, max: 2 },
}
const audioRecorderCapsArray = [audioRecorderCaps];

const videoRecorderCaps = {
    audioRecorderCaps,
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoEncoderMime: media.CodecMimeType.VIDEO_MPEG4,
    videoWidthRange: { min: 2, max: 1920 },
    videoBitrateRange: { min: 1, max: 3000000 },
    videoFramerateRange: { min: 1, max: 30 },
    videoHeightRange: { min: 2, max: 1080 },
}
const videoRecorderCaps2 = {
    audioRecorderCaps,
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoEncoderMime: media.CodecMimeType.VIDEO_AVC,
    videoWidthRange: { min: 2, max: 1920 },
    videoBitrateRange: { min: 1, max: 3000000 },
    videoFramerateRange: { min: 1, max: 30 },
    videoHeightRange: { min: 2, max: 1080 },
}
const videoRecorderCapsArray = [videoRecorderCaps, videoRecorderCaps2];

export const recorderQualityLowPara = {
    audioBitrate: 96000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW,
    videoBitrate: 192000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 176,
    videoFrameHeight: 144,
    videoFrameRate: 30
};

export const recorderQualityHighPara = {
    audioBitrate: 192000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_HIGH,
    videoBitrate: 17000000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 1920,
    videoFrameHeight: 1080,
    videoFrameRate: 30
};

export const recorderQualityQcifPara = {
    audioBitrate: 96000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_QCIF,
    videoBitrate: 192000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 176,
    videoFrameHeight: 144,
    videoFrameRate: 30
};

export const recorderQualityCifPara = {
    audioBitrate: 96000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_CIF,
    videoBitrate: 1536000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 352,
    videoFrameHeight: 288,
    videoFrameRate: 30
};

export const recorderQuality480PPara = {
    audioBitrate: 96000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_480P,
    videoBitrate: 5000000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
};

export const recorderQuality720PPara = {
    audioBitrate: 192000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_720P,
    videoBitrate: 12000000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 1280,
    videoFrameHeight: 720,
    videoFrameRate: 30
};

export const recorderQuality1080PPara = {
    audioBitrate: 192000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_1080P,
    videoBitrate: 17000000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 1920,
    videoFrameHeight: 1080,
    videoFrameRate: 30
};

export const recorderQualityQvgaPara = {
    audioBitrate: 96000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    durationTime: 30,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_QVGA,
    videoBitrate: 1200000,
    videoCodec: media.CodecMimeType.VIDEO_MPEG4,
    videoFrameWidth: 320,
    videoFrameHeight: 240,
    videoFrameRate: 30
};

export const recorderQualityLowParaSourceId1 = {
    audioBitrate: 0,
    audioChannels: 0,
    audioCodec: '',
    audioSampleRate: 0,
    durationTime: 0,
    fileFormat: '',
    qualityLevel: media.VideoRecorderQualityLevel.RECORDER_QUALITY_LOW,
    videoBitrate: 0,
    videoCodec: '',
    videoFrameWidth: 0,
    videoFrameHeight: 0,
    videoFrameRate: 0
};

export const audioRecorderPara1 = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    bitrate: 96000,
    sampleRate: 48000,
    channel: 2
};

export const audioRecorderPara2 = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    bitrate: 192000,
    sampleRate: 48000,
    channel: 2
};

export const audioRecorderAbnormalAll = {
    outputFormat: 'aaa',
    audioEncoderMime: 'aaa',
    bitrate: 655360,
    sampleRate: 655360,
    channel: 0
};

export const audioRecorderAbnormalFormatType = {
    outputFormat: 'aaa',
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    bitrate: 96000,
    sampleRate: 48000,
    channel: 2
};

export const audioRecorderAbnormalCodecMimeType = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    audioEncoderMime: 'aaa',
    bitrate: 96000,
    sampleRate: 48000,
    channel: 2
};

export const audioRecorderAbnormalBitrate = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    bitrate: 655360,
    sampleRate: 48000,
    channel: 2
};

export const audioRecorderAbnormalSampleRate = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    bitrate: 96000,
    sampleRate: 655360,
    channel: 2
};

export const audioRecorderAbnormalSampleChannel = {
    outputFormat: media.ContainerFormatType.CFT_MPEG_4,
    audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
    bitrate: 96000,
    sampleRate: 4800,
    channel: 0
};

export function checkVideoCapsArray(videoCapsArray) {
    let expectProfile = {
        audioBitrate: 0,
        audioChannels: 0,
        audioCodec:'',
        audioSampleRate: 0,
        durationTime: 0,
        fileFormat: '',
        qualityLevel: 0,
        videoBitrate: 0,
        videoCodec: '',
        videoFrameWidth: 0,
        videoFrameHeight: 0,
        videoFrameRate: 0,
    };
    expect(Object.keys(expectProfile).length).assertEqual(Object.keys(videoCapsArray).length);
    let keys = Object.keys(videoCapsArray);
    if (keys.length != 0) {
        for (let i = 0; i < keys.length; i++) {
            let key = keys[i];
            expect(videoCapsArray[key]).assertEqual(expectProfile[key]);
            console.info('check videoCapsArray success');
            }
    } else {
        console.info('check videoCapsArray failed');
        }
}

export function checkAudioArray(audioCapsArray, done) {
    expect(audioCapsArray.length).assertEqual(audioRecorderCapsArray.length);
    for (let i = 0; i < audioCapsArray.length; i++) {
        expect(audioCapsArray[i].outputFormat).assertEqual(audioRecorderCapsArray[i].outputFormat);
        expect(audioCapsArray[i].audioEncoderMime).assertEqual(audioRecorderCapsArray[i].audioEncoderMime);
        for (let j = 0; j < audioCapsArray[i].sampleRates.length; j++) {
            expect(audioCapsArray[i].sampleRates[j]).assertEqual(audioRecorderCapsArray[i].sampleRates[j]);
        }
        expect(audioCapsArray[i].bitrateRange.min).assertEqual(audioRecorderCapsArray[i].bitrateRange.min);
        expect(audioCapsArray[i].bitrateRange.max).assertEqual(audioRecorderCapsArray[i].bitrateRange.max);
        expect(audioCapsArray[i].channelRange.min).assertEqual(audioRecorderCapsArray[i].channelRange.min);
        expect(audioCapsArray[i].channelRange.max).assertEqual(audioRecorderCapsArray[i].channelRange.max);
    }
    done();
}

export function checkVideoArray(videoCapsArray, done) {
    expect(videoCapsArray.length).assertEqual(videoRecorderCapsArray.length);
    for (let i = 0; i < videoCapsArray.length; i++) {
        expect(videoCapsArray[i].audioEncoderMime).assertEqual
        (videoRecorderCapsArray[i].audioRecorderCaps.audioEncoderMime);
        for (let j = 0; j < videoCapsArray[i].audioSampleRates.length; j++) {
            expect(videoCapsArray[i].audioSampleRates[j]).assertEqual
            (videoRecorderCapsArray[i].audioRecorderCaps.sampleRates[j]);
        }
        expect(videoCapsArray[i].audioBitrateRange.min).assertEqual
        (videoRecorderCapsArray[i].audioRecorderCaps.bitrateRange.min);
        expect(videoCapsArray[i].audioBitrateRange.max).assertEqual
        (videoRecorderCapsArray[i].audioRecorderCaps.bitrateRange.max);
        expect(videoCapsArray[i].audioChannelRange.min).assertEqual
        (videoRecorderCapsArray[i].audioRecorderCaps.channelRange.min);
        expect(videoCapsArray[i].audioChannelRange.max).assertEqual
        (videoRecorderCapsArray[i].audioRecorderCaps.channelRange.max);
        expect(videoCapsArray[i].outputFormat).assertEqual
        (videoRecorderCapsArray[i].outputFormat);
        expect(videoCapsArray[i].videoWidthRange.min).assertEqual
        (videoRecorderCapsArray[i].videoWidthRange.min);
        expect(videoCapsArray[i].videoWidthRange.max).assertEqual
        (videoRecorderCapsArray[i].videoWidthRange.max);
        expect(videoCapsArray[i].videoBitrateRange.min).assertEqual
        (videoRecorderCapsArray[i].videoBitrateRange.min);
        expect(videoCapsArray[i].videoBitrateRange.max).assertEqual
        (videoRecorderCapsArray[i].videoBitrateRange.max);
        expect(videoCapsArray[i].videoFramerateRange.min).assertEqual
        (videoRecorderCapsArray[i].videoFramerateRange.min);
        expect(videoCapsArray[i].videoFramerateRange.max).assertEqual
        (videoRecorderCapsArray[i].videoFramerateRange.max);
        expect(videoCapsArray[i].videoHeightRange.min).assertEqual
        (videoRecorderCapsArray[i].videoHeightRange.min);
        expect(videoCapsArray[i].videoHeightRange.max).assertEqual
        (videoRecorderCapsArray[i].videoHeightRange.max);
        expect(videoCapsArray[i].videoEncoderMime).assertEqual
        (videoRecorderCapsArray[i].videoEncoderMime);
    }
    done();
}
