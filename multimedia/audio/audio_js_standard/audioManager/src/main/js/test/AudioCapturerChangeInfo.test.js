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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

describe('audioCapturer', function () {
    var audioCapCallBack;
    var audioStreamManager;
	var audioStreamManagerCB;
    var dirPath;
    var fpath;

    const audioManager = audio.getAudioManager();
    console.info('AudioFrameworkRecLog: Create AudioManger Object JS Framework');

    beforeAll(async function () {
        console.info('AudioFrameworkTest: beforeAll: Prerequisites at the test suite level');
        dirPath = '/data/storage/el2/base/haps/entry/cache'
        console.info('AudioFrameworkRecLog: Recording files Path: '+dirPath);
        fpath = dirPath+'/capture_js.pcm';
        await sleep(100);
        await audioManager.getStreamManager().then(async function (data) {
            audioStreamManager = data;
            console.info('AudioFrameworkRendererChangeLog: Get AudioStream Manager : Success ');
        }).catch((err) => {
            console.info('AudioFrameworkRendererChangeLog: Get AudioStream Manager : ERROR : '+err.message);
        });
		
		audioManager.getStreamManager((err, data) => {
            if (err) {
                console.error('AudioFrameworkChange: Get AudioStream Manager : ERROR : '+err.message);
            }
            else {
                audioStreamManagerCB = data;
                console.info('AudioFrameworkChange: Get AudioStream Manager : Success ');
            }
        });
        await sleep(1000);
        console.info('AudioFrameworkTest: beforeAll: END');
    })

    beforeEach(async function () {
        console.info('AudioFrameworkTest: beforeEach: Prerequisites at the test case level');
        await sleep(1000);
    })

    afterEach(function () {
        console.info('AudioFrameworkTest: afterEach: Test case-level clearance conditions');
    })

    afterAll(async function () {
        await sleep(1000);
        console.info('AudioFrameworkTest: afterAll: Test suite-level cleanup condition');
    })

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /*         *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_001
               * @tc.name      : AudioCapturerChange - ON_STATE_PREPARED
               * @tc.desc      : AudioCapturerChange - ON_STATE_PREPARED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_001', 0, async function (done) {
        var audioCap ;
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].capturerState == 1) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-001] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (500);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-001] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

    /*                   *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_002
               * @tc.name      : AudioCapturerChange - ON_STATE_RUNNING
               * @tc.desc      : AudioCapturerChange - ON_STATE_RUNNING
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_ON_CAPTURER_CHANGE_002', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
					console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].capturerState == 2) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-002] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });

        await sleep (500);
        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

		await sleep(500);
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-002] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

    /*                   *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_003
               * @tc.name      : AudioCapturerChange - ON_STATE_STOPPED
               * @tc.desc      : AudioCapturerChange - ON_STATE_STOPPED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_ON_CAPTURER_CHANGE_003', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });
		
        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

		await sleep(500);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].capturerState == 3) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-003] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });

        await sleep (500);

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

		await sleep(500);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-003] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

    /*         *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_004
               * @tc.name      : AudioCapturerChange - ON_STATE_RELEASED
               * @tc.desc      : AudioCapturerChange - ON_STATE_RELEASED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_004', 0, async function (done) {
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].capturerState == 4) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-004] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (500);

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

		await sleep (500);
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-004] ######### CapturerChange Off is called #########');

        expect(resultFlag).assertTrue();
        done();

    })	
	
 /**
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_005
               * @tc.name      : AudioCapturerChange - ON_SOURCE_TYPE_MIC
               * @tc.desc      : AudioCapturerChange - ON_SOURCE_TYPE_MIC
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
**/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_005', 0, async function (done) {
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 0) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-005] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (500);
		
        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-005] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })
	
 /**
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_006
               * @tc.name      : AudioCapturerChange - ON_SOURCE_TYPE_VOICE_COMMUNICATION
               * @tc.desc      : AudioCapturerChange - ON_SOURCE_TYPE_VOICE_COMMUNICATION
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
**/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_006', 0, async function (done) {
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 7) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-006] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (500);
		
		await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep (500);
		
		audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-006] ######### CapturerChange Off is called #########');
		
		 
        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

	 /*         *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_007
               * @tc.name      : AudioCapturerChange - STREAMID
               * @tc.desc      : AudioCapturerChange - STREAMID
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_007', 0, async function (done) {
        var audioCap ;
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].streamId != undefined) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-007] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (500);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-007] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

	
	 /*         *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_008
               * @tc.name      : AudioCapturerChange - CLIENTUID AND CAPTURERFLAG
               * @tc.desc      : AudioCapturerChange - CLIENTUID AND CAPTURERFLAG
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_008', 0, async function (done) {
        var audioCap ;
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                if (AudioCapturerChangeInfoArray[i].clientUid != undefined && AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags == 1) {
                    resultFlag = true;
                    console.info('AFCapLog: [CAPTURER-CHANGE-ON-008] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (500);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-ON-008] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

	
	

    /*                   *
               * @tc.number    : SUB_AUDIO_OFF_CAPTURER_CHANGE_001
               * @tc.name      : AudioCapturerChange - OFF_STATE_PREPARED
               * @tc.desc      : AudioCapturerChange - OFF_STATE_PREPARED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_OFF_CAPTURER_CHANGE_001', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = true;

        var audioCap;

        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                resultFlag = false;
            }
        });

        await sleep (500);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-001] ######### CapturerChange Off is called #########');
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-001] ResultFlag is: '+ resultFlag);
        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

    /*                   *
               * @tc.number    : SUB_AUDIO_OFF_CAPTURER_CHANGE_002
               * @tc.name      : AudioCapturerChange - OFF_STATE_RUNNING
               * @tc.desc      : AudioCapturerChange - OFF_STATE_RUNNING
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_OFF_CAPTURER_CHANGE_002', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = true;
        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                resultFlag = false;
            }
        });
        await sleep (500);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-002] ######### CapturerChange Off is called #########');
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-002] ResultFlag is: '+ resultFlag);

        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

    /*                   *
               * @tc.number    : SUB_AUDIO_OFF_CAPTURER_CHANGE_003
               * @tc.name      : AudioCapturerChange - OFF_STATE_STOPPED
               * @tc.desc      : AudioCapturerChange - OFF_STATE_STOPPED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_OFF_CAPTURER_CHANGE_003', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = true;
        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                resultFlag = false;
            }
        });
        await sleep (500);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-003] ######### CapturerChange Off is called #########');
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-003] ResultFlag is: '+ resultFlag);

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();


    })

    /*                   *
               * @tc.number    : SUB_AUDIO_OFF_CAPTURER_CHANGE_004
               * @tc.name      : AudioCapturerChange - OFF_STATE_RELEASED
               * @tc.desc      : AudioCapturerChange - OFF_STATE_RELEASED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_OFF_CAPTURER_CHANGE_004', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = true;
        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                resultFlag = false;
            }
        });
        await sleep (500);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapturerChangeLog: [CAP-CH-OFF-004] ## CapCh Off is called ##');
        console.info('AFCapLog: [CAPTURER-CHANGE-OFF-004] ResultFlag is: '+ resultFlag);

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })
	
	 /*         *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_001
               * @tc.name      : AudioCapturerChange - GET_STATE_PREPARED
               * @tc.desc      : AudioCapturerChange - GET_STATE_PREPARED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_001', 0, async function (done) {
        var audioCap ;
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;
        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
            }
        });
        await sleep (500);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
		await audioStreamManagerCB.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info('AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                    if (AudioCapturerChangeInfoArray[i].capturerState == 1) {
                        resultFlag = true;
                        console.info('AFCapLog:State : '+AudioCapturerChangeInfoArray[i].capturerState);
                    }
                }
            }
        }).catch((err) => {
            console.log('AFCapLog: getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [GET_CAPTURER_STATE_1_PR] ## CapCh Off is called ##');
        
		await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

    /*                   *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_002
               * @tc.name      : AudioCapturerChange - GET_STATE_RUNNING
               * @tc.desc      : AudioCapturerChange - GET_STATE_RUNNING
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_002', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
            }
        });

        await sleep (500);
        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

		await sleep(500);
		
		await audioStreamManager.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info('AFCapLog: [GET_CAPTURER_STATE_2_PROMISE] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                    if (AudioCapturerChangeInfoArray[i].capturerState == 2) {
                        resultFlag = true;
                        console.info('AFCapLog:State : '+AudioCapturerChangeInfoArray[i].capturerState);
                    }
                }
            }
        }).catch((err) => {
            console.log('AFCapLog: getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [GET_CAPTURER_STATE_2_PROMISE] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

    /*                   *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_003
               * @tc.name      : AudioCapturerChange - GET_STATE_STOPPED
               * @tc.desc      : AudioCapturerChange - GET_STATE_STOPPED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_003', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });
		
        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

		await sleep(500);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
            }
        });

        await sleep (500);

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

		await sleep(500);
		
		await audioStreamManager.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info('AFCapLog: [GET_CAPTURER_STATE_3_PROMISE] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                    if (AudioCapturerChangeInfoArray[i].capturerState == 3) {
                        resultFlag = true;
                        console.info('AFCapLog:State : '+AudioCapturerChangeInfoArray[i].capturerState);
                    }
                }
            }
        }).catch((err) => {
            console.log('AFCapLog: getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [GET_CAPTURER_STATE_3_PROMISE] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })
	
	/*         *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_001
               * @tc.name      : AudioCapturerChange - GET_STATE_PREPARED
               * @tc.desc      : AudioCapturerChange - GET_STATE_PREPARED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_001', 0, async function (done) {
        var audioCap ;
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
		}
        });
        await sleep (500);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
		audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info('AFCapLog: [GET_CAPTURER_STATE_1_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log('AFCapLog: getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                        if (AudioCapturerChangeInfoArray[i].capturerState ==1) {
                            resultFlag = true;
                            console.info('AFCapLog:State : '+ AudioCapturerChangeInfoArray[i].capturerState);
                        }
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [GET_CAPTURER_STATE_1_CALLBACK] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

    /*                   *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_002
               * @tc.name      : AudioCapturerChange - GET_STATE_RUNNING
               * @tc.desc      : AudioCapturerChange - GET_STATE_RUNNING
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_002', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(500);
	
        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
            }
        });

        await sleep (500);
        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

		await sleep(500);
		
		audioStreamManagerCB.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info('AFCapLog: [GET_CAPTURER_STATE_2_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log('AFCapLog: getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                        if (AudioCapturerChangeInfoArray[i].capturerState ==2) {
                            resultFlag = true;
                            console.info('AFCapLog:State : '+ AudioCapturerChangeInfoArray[i].capturerState);
                        }
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [GET_CAPTURER_STATE_2_CALLBACK] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

    /*                   *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_003
               * @tc.name      : AudioCapturerChange - GET_STATE_STOPPED
               * @tc.desc      : AudioCapturerChange - GET_STATE_STOPPED
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_003', 0, async function (done) {

        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 1
        }

        var AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        var resultFlag = false;

        var audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info('AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: AudioCapturer Created : ERROR : '+err.message);
        });
		
        await audioCap.start().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer start :ERROR : '+err.message);
        });

		await sleep(500);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info('AFCapLog:  ## CapChange on is called for element '+i+' ##');
				console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
            }
        });

        await sleep (500);

        await audioCap.stop().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer stop:ERROR : '+err.message);
        });

		await sleep(500);
		
		audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info('AFCapLog: [GET_CAPTURER_STATE_3_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log('AFCapLog: getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info('AFCapLog:StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info('AFCapLog:CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info('AFCapLog:Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info('AFCapLog:Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info('AFCapLog:State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                        if (AudioCapturerChangeInfoArray[i].capturerState ==3) {
                            resultFlag = true;
                            console.info('AFCapLog:State : '+ AudioCapturerChangeInfoArray[i].capturerState);
                        }
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapLog: [GET_CAPTURER_STATE_3_CALLBACK] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRecLog: Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })

})
