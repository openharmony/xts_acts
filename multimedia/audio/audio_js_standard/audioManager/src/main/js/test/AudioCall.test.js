// @ts-nocheck
/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import audio from '@ohos.multimedia.audio';
import fileio from '@ohos.fileio';
import ability_featureAbility from '@ohos.ability.featureAbility';
import app from '@system.app';
import bundle from '@ohos.bundle';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import featureAbility from '@ohos.ability.featureAbility'
import resourceManager from '@ohos.resourceManager';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('audioCall', function () {
    var mediaDir;
    let fdRead;
    let readpath;
    var resultFlagRec;
    var resultFlagRen;
    let fdPath;
    let filePath;
    const audioManager = audio.getAudioManager();
    console.info('AudioFrameworkRenderLog: Create AudioManger Object JS Framework');

    const audioManagerRec = audio.getAudioManager();
    console.info('AudioFrameworkRecLog: Create AudioManger Object JS Framework');
    async function getAbilityInfo(fileName) {
        let context = await featureAbility.getContext();
        console.info("case0 context is  " + context);
        await context.getFilesDir().then((data) => {
            console.info("case1 getFilesDir is path " + data);
            mediaDir = data + '/' + fileName;
            console.info('case2 mediaDir is ' + mediaDir);
        })
    }
    beforeAll(async function () {
        console.info('AudioFrameworkTest: beforeAll: Prerequisites at the test suite level');
    })

    beforeEach(async function () {
        console.info('AudioFrameworkTest: beforeEach: Prerequisites at the test case level');
        await sleep(500);
    })

    afterEach(async function () {
        console.info('AudioFrameworkTest: afterEach: Test case-level clearance conditions');
        await sleep(1000);
    })

    afterAll(async function () {
        console.info('AudioFrameworkTest: afterAll: Test suite-level cleanup condition');
    })

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }


    async function closeFileDescriptor(fileName) {
        await resourceManager.getResourceManager().then(async (mgr) => {
            await mgr.closeRawFileDescriptor(fileName).then(value => {
                console.log('AudioFrameworkRenderLog:case closeRawFileDescriptor success for file:' + fileName);
            }).catch(error => {
                console.log('AudioFrameworkRenderLog:case closeRawFileDescriptor err: ' + error);
            });
        });
    }
  
    async function getFdRead(pathName) {
        let context = await featureAbility.getContext();
        console.info("case0 context is  " + context);
        await context.getFilesDir().then((data) => {
            console.info("case1 getFilesDir is path " + data);
            filePath = data + '/' + pathName;
            console.info('case4 filePath is ' + filePath);

        })
        fdPath = 'fd://';
        await fileio.open(filePath).then((fdNumber) => {
            fdPath = fdPath + '' + fdNumber;
            fdRead = fdNumber;
            console.info('[fileIO]case open fd success,fdPath is ' + fdPath);
            console.info('[fileIO]case open fd success,fdRead is ' + fdRead);

        }, (err) => {
            console.info('[fileIO]case open fd failed');
        }).catch((err) => {
            console.info('[fileIO]case catch open fd failed');
        });
    }
  
    async function playbackPromise(AudioRendererOptions, pathName, AudioScene) {
        resultFlagRen = 'new';
        console.info('AudioFrameworkRenderLog: Promise : Audio Playback Function');

        var audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
            audioRen = data;
            console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            resultFlagRen = false;
            return resultFlagRen;
        });
        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);

        await audioRen.getStreamInfo().then(async function (audioParamsGet) {
            console.info('AudioFrameworkRenderLog: Renderer getStreamInfo:');
            console.info('AudioFrameworkRenderLog: Renderer sampleFormat:' + audioParamsGet.sampleFormat);
            console.info('AudioFrameworkRenderLog: Renderer samplingRate:' + audioParamsGet.samplingRate);
            console.info('AudioFrameworkRenderLog: Renderer channels:' + audioParamsGet.channels);
            console.info('AudioFrameworkRenderLog: Renderer encodingType:' + audioParamsGet.encodingType);
        }).catch((err) => {
            console.log('AudioFrameworkRenderLog: getStreamInfo :ERROR: ' + err.message);
            resultFlagRen = false;
        });
        if (resultFlagRen == false) {
            console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);
            return resultFlagRen;
        }

        await audioRen.getRendererInfo().then(async function (audioParamsGet) {
            console.info('AudioFrameworkRenderLog: Renderer RendererInfo:');
            console.info('AudioFrameworkRenderLog: Renderer content type:' + audioParamsGet.content);
            console.info('AudioFrameworkRenderLog: Renderer usage:' + audioParamsGet.usage);
            console.info('AudioFrameworkRenderLog: Renderer rendererFlags:' + audioParamsGet.rendererFlags);
        }).catch((err) => {
            console.log('AudioFrameworkRenderLog: RendererInfo :ERROR: ' + err.message);
            resultFlagRen = false;
        });
        if (resultFlagRen == false) {
            console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);
            return resultFlagRen;
        }

        await audioRen.start().then(async function () {
            console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            resultFlagRen = false;
        });
        if (resultFlagRen == false) {
            console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);
            return resultFlagRen;
        }

        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);

        var bufferSize;
        await audioRen.getBufferSize().then(async function (data) {
            console.info('AudioFrameworkRenderLog: getBufferSize :SUCCESS ' + data);
            bufferSize = data;
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: getBufferSize :ERROR : ' + err.message);
            resultFlagRen = false;
        });
        if (resultFlagRen == false) {
            console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);
            return resultFlagRen;
        }

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info('AudioFrameworkRenderLog:case2: File Path: ' + ss);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info('AudioFrameworkRenderLog:case3: File totalSize size: ' + totalSize);
        totalSize = totalSize - 44;
        console.info('AudioFrameworkRenderLog: File size : Removing header: ' + totalSize);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info('AudioFrameworkRenderLog:BufferAudioFramework: bytes read from file: ' + rlen);
            await audioRen.write(buf);
            if (rlen > (totalSize / 2)) {
                await audioManager.getAudioScene().then(async function (data) {
                    console.info('AudioFrameworkRenderLog:AudioFrameworkAudioScene: getAudioScene : Value : ' + data);
                }).catch((err) => {
                    console.info('AudioFrameworkRenderLog:AudioFrameworkAudioScene: getAudioScene : ERROR : ' + err.message);
                    resultFlagRen = false;
                });
            }
        }
        console.info('AudioFrameworkRenderLog: Renderer after read');

        await audioRen.drain().then(async function () {
            console.info('AudioFrameworkRenderLog: Renderer drained : SUCCESS');
        }).catch((err) => {
            console.error('AudioFrameworkRenderLog: Renderer drain: ERROR : ' + err.message);
            resultFlagRen = false;
        });
        if (resultFlagRen == false) {
            console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);
            return resultFlagRen;
        }

        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);

        await audioRen.stop().then(async function () {
            console.info('AudioFrameworkRenderLog: Renderer stopped : SUCCESS');
            resultFlagRen = true;
            console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: Renderer stop:ERROR : ' + err.message);
            resultFlagRen = false;
        });

        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);

        await audioRen.release().then(async function () {
            console.info('AudioFrameworkRenderLog: Renderer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: Renderer release :ERROR : ' + err.message);
            resultFlagRen = false;
        });

        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);

        console.info('AudioFrameworkRenderLog: resultFlagRen : ' + resultFlagRen);

        return resultFlagRen;
    }

    async function recPromise(AudioCapturerOptions, fpath, AudioScene) {

        resultFlagRec = 'new';
        console.info('AudioFrameworkRecLog: Promise : Audio Recording Function');

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : ' + err.message);
            return resultFlagRec;
        });

        console.info('AudioFrameworkRecLog: AudioCapturer : Path : ' + fpath);

        console.info('AudioFrameworkRecLog: AudioCapturer : STATE : ' + audioCap.state);


        await audioCap.getStreamInfo().then(async function (audioParamsGet) {
            console.info('AudioFrameworkRecLog: Capturer getStreamInfo:');
            console.info('AudioFrameworkRecLog: Capturer sampleFormat:' + audioParamsGet.sampleFormat);
            console.info('AudioFrameworkRecLog: Capturer samplingRate:' + audioParamsGet.samplingRate);
            console.info('AudioFrameworkRecLog: Capturer channels:' + audioParamsGet.channels);
            console.info('AudioFrameworkRecLog: Capturer encodingType:' + audioParamsGet.encodingType);
        }).catch((err) => {
            console.log('AudioFrameworkRecLog: getStreamInfo :ERROR: ' + err.message);
            resultFlagRec = false;
        });
        if (resultFlagRec == false) {
            console.info('AudioFrameworkRecLog: resultFlagRec : ' + resultFlagRec);
            return resultFlagRec;
        }

        await audioCap.getCapturerInfo().then(async function (audioParamsGet) {
            console.info('AudioFrameworkRecLog: Capturer CapturerInfo:');
            console.info('AudioFrameworkRecLog: Capturer SourceType:' + audioParamsGet.source);
            console.info('AudioFrameworkRecLog: Capturer capturerFlags:' + audioParamsGet.capturerFlags);
        }).catch((err) => {
            console.log('AudioFrameworkRecLog: CapturerInfo :ERROR: ' + err.message);
            resultFlagRec = false;
        });
        if (resultFlagRec == false) {
            console.info('AudioFrameworkRecLog: resultFlag : ' + resultFlagRec);
            return resultFlagRec;
        }

        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : ' + err.message);
            resultFlagRec = false;
        });
        if (resultFlagRec == false) {
            console.info('AudioFrameworkRecLog: resultFlagRec : ' + resultFlagRec);
            return resultFlagRec;
        }

        console.info('AudioFrameworkRecLog: AudioCapturer : STATE : ' + audioCap.state);

        var bufferSize = await audioCap.getBufferSize();
        console.info('AudioFrameworkRecLog: buffer size: ' + bufferSize);

        var fd = fileio.openSync(fpath, 0o102, 0o777);
        if (fd !== null) {
            console.info('AudioFrameworkRecLog: file fd created');
        }
        else {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : ' + err.message);
            resultFlagRec = false;
            return resultFlagRec;
        }

        fd = fileio.openSync(fpath, 0o2002, 0o666);
        if (fd !== null) {
            console.info('AudioFrameworkRecLog: file fd opened : Append Mode :PASS');
        }
        else {
            console.info('AudioFrameworkRecLog: file fd Open: Append Mode : FAILED');
            resultFlagRec = false;
            return resultFlagRec;
        }

        var numBuffersToCapture = 45;
        while (numBuffersToCapture) {
            var buffer = await audioCap.read(bufferSize, true);
            var number = fileio.writeSync(fd, buffer);
            console.info('BufferRecLog: data written: ' + number);
            numBuffersToCapture--;
        }

        console.info('AudioFrameworkRecLog: AudioCapturer : STATE : ' + audioCap.state);

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
            resultFlagRec = true;
            console.info('AudioFrameworkRecLog: resultFlagRec : ' + resultFlagRec);
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : ' + err.message);
            resultFlagRec = false;
        });

        console.info('AudioFrameworkRecLog: AudioCapturer : STATE : ' + audioCap.state);

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : ' + err.message);
            resultFlagRec = false;
        });

        console.info('AudioFrameworkRecLog: AudioCapturer : STATE : ' + audioCap.state);

        return resultFlagRec;

    }


    /* *
               * @tc.number    : SUB_AUDIO_VOIP_Play_001
               * @tc.name      : 
               * @tc.desc      : 
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
           */
    it('SUB_AUDIO_CALL_Play_001', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        var AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        await getFdRead("StarWars10s-1C-44100-2SW.wav");
        var resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info('AudioFrameworkRenderLog: resultFlag : ' + resultFlag);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readpath);
        done();
    })

    /* *
               * @tc.number    : SUB_AUDIO_VOIP_Rec_001
               * @tc.name      : 
               * @tc.desc      : 
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
           */
    it('SUB_AUDIO_CALL_Rec_001', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }
        await getAbilityInfo("capture_js-44100-2C-16B.pcm");
        var resultFlag = await recPromise(AudioCapturerOptions, mediaDir, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info('AudioFrameworkRenderLog: resultFlag : ' + resultFlag);

        expect(resultFlag).assertTrue();
        done();
    })


    /* *
               * @tc.number    : SUB_AUDIO_VOIP_RecPlay_001
               * @tc.name      : 
               * @tc.desc      : 
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
           */
    it('SUB_AUDIO_CALL_RecPlay_001', 0, async function (done) {

        var AudioStreamInfoCap = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfoCap,
            capturerInfo: AudioCapturerInfo
        }

        var AudioStreamInfoRen = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
             rendererFlags: 0
        }

        var AudioRendererOptions = {
            streamInfo: AudioStreamInfoRen,
            rendererInfo: AudioRendererInfo
        }
        await getAbilityInfo("capture_js-44100-2C-16B-2.pcm");
        recPromise(AudioCapturerOptions, mediaDir, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(500);
        readpath = 'StarWars10s-1C-44100-2SW.wav';
        await getFdRead(readpath);
        await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(1000);
        console.info('AudioFrameworkRecLog: resultFlag : Capturer : ' + resultFlagRec);
        console.info('AudioFrameworkRenderLog: resultFlag : Renderer : ' + resultFlagRen);

        if (resultFlagRec == true) {
            expect(resultFlagRen).assertTrue();
        }
        else {
            expect(false).assertTrue();
        }
        await closeFileDescriptor(readpath);
        done();
    })

})