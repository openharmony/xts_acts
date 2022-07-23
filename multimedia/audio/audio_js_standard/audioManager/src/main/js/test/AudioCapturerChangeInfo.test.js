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

describe('audioCapturerChange', function () {
    var audioCapCallBack;
    var audioStreamManager;
	var audioStreamManagerCB;
    var dirPath;
    var fpath;
	var Tag = "AFCapLog : ";

    const audioManager = audio.getAudioManager();
    console.info(Tag+'Create AudioManger Object JS Framework');

    beforeAll(async function () {
        console.info(Tag+' beforeAll: Prerequisites at the test suite level');
        dirPath = '/data/storage/el2/base/haps/entry/cache'
        console.info(Tag+'Recording files Path: '+dirPath);
        fpath = dirPath+'/capture_js.pcm';
        await sleep(100);
        await audioManager.getStreamManager().then(async function (data) {
            audioStreamManager = data;
            console.info(Tag+' Get AudioStream Manager : Success ');
        }).catch((err) => {
            console.info(Tag+' Get AudioStream Manager : ERROR : '+err.message);
        });
		
		audioManager.getStreamManager((err, data) => {
            if (err) {
                console.error(Tag+' Get AudioStream Manager : ERROR : '+err.message);
            }
            else {
                audioStreamManagerCB = data;
                console.info(Tag+' Get AudioStream Manager : Success ');
            }
        });
        await sleep(1000);
        console.info(Tag+' beforeAll: END');
    })

    beforeEach(async function () {
        console.info(Tag+' beforeEach: Prerequisites at the test case level');
        await sleep(1000);
    })

    afterEach(function () {
        console.info(Tag+' afterEach: Test case-level clearance conditions');
    })

    afterAll(async function () {
        await sleep(1000);
        console.info(Tag+' afterAll: Test suite-level cleanup condition');
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].capturerState == 1 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-001] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-001] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);

        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].capturerState == 2 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-002] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });

        await sleep (100);
        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep(100);
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-002] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });
		
        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep(100);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].capturerState == 3 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-003] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });

        await sleep (100);

        await audioCap.stop().then(async function () {
            console.info(Tag+'Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer stop:ERROR : '+err.message);
        });

		await sleep(100);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-003] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

        await audioCap.stop().then(async function () {
            console.info(Tag+'Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer stop:ERROR : '+err.message);
        });
		
		await sleep (100);

        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].capturerState == 4 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-004] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (100);

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
        });

		await sleep (100);
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-004] ######### CapturerChange Off is called #########');

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
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 0 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-005] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (100);
		
        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-005] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 7 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-006] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (100);
		
		await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep (100);
		
		audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-006] ######### CapturerChange Off is called #########');
		
		 
        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (AudioCapturerChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-007] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-007] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				var clientUid = AudioCapturerChangeInfoArray[i].clientUid;
				var capFlags = AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags;
				var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                if (clientUid != undefined && capFlags == 1 && devDescriptor != null) {
                    resultFlag = true;
                    console.info(Tag+'[CAPTURER-CHANGE-ON-008] ResultFlag for element '+i +' is: '+ resultFlag);
                }
            }
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-008] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

	/*         *
               * @tc.number    : SUB_AUDIO_ON_CAPTURER_CHANGE_009
               * @tc.name      : AudioCapturerChange - DeviceDescriptor
               * @tc.desc      : AudioCapturerChange - DeviceDescriptor
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_ON_CAPTURER_CHANGE_009', 0, async function (done) {
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					var Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
					var dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
					var dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
					var sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
					var cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
					var cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
					console.info(Tag+'Id:'+i+':'+Id);
					console.info(Tag+'Type:'+i+':'+dType);
					console.info(Tag+'Role:'+i+':'+dRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+sRate);
					console.info(Tag+'CC:'+i+':'+cCount);
					console.info(Tag+'CM:'+i+':'+cMask);
					if (Id > 0 && dType == 15 && dRole == 1 && sRate!= null && cCount != null && cMask != null) {
						resultFlag = true;
					}
				}
            }
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-ON-009] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                resultFlag = false;
            }
        });

        await sleep (100);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-OFF-001] ######### CapturerChange Off is called #########');
        console.info(Tag+'[CAPTURER-CHANGE-OFF-001] ResultFlag is: '+ resultFlag);
        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep (100);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                resultFlag = false;
            }
        });
        await sleep (100);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-OFF-002] ######### CapturerChange Off is called #########');
        console.info(Tag+'[CAPTURER-CHANGE-OFF-002] ResultFlag is: '+ resultFlag);

        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep (100);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                resultFlag = false;
            }
        });
        await sleep (100);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-OFF-003] ######### CapturerChange Off is called #########');
        console.info(Tag+'[CAPTURER-CHANGE-OFF-003] ResultFlag is: '+ resultFlag);

        await audioCap.stop().then(async function () {
            console.info(Tag+'Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer stop:ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

        await audioCap.stop().then(async function () {
            console.info(Tag+'Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer stop:ERROR : '+err.message);
        });

		await sleep (100);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                resultFlag = false;
            }
        });
        await sleep (100);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info('AFCapturerChangeLog: [CAP-CH-OFF-004] ## CapCh Off is called ##');
        console.info(Tag+'[CAPTURER-CHANGE-OFF-004] ResultFlag is: '+ resultFlag);

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })
	
	/*                   *
               * @tc.number    : SUB_AUDIO_OFF_CAPTURER_CHANGE_005
               * @tc.name      : AudioCapturerChange - DeviceDescriptor
               * @tc.desc      : AudioCapturerChange - DeviceDescriptor
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
               * */


    it('SUB_AUDIO_OFF_CAPTURER_CHANGE_005', 0, async function (done) {

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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					var Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
					var dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
					var dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
					var sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
					var cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
					var cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
					console.info(Tag+'Id:'+i+':'+Id);
					console.info(Tag+'Type:'+i+':'+dType);
					console.info(Tag+'Role:'+i+':'+dRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+sRate);
					console.info(Tag+'CC:'+i+':'+cCount);
					console.info(Tag+'CM:'+i+':'+cMask);
					if (Id > 0 && dType == 15 && dRole == 1 && sRate!= null && cCount != null && cMask != null) {
						resultFlag = false;
					}
				}
            }
        });

        await sleep (100);

        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[CAPTURER-CHANGE-OFF-005] ######### CapturerChange Off is called #########');
        console.info(Tag+'[CAPTURER-CHANGE-OFF-005] ResultFlag is: '+ resultFlag);
        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
            }
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
		await audioStreamManagerCB.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info('AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
					var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
					for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
					}
                    if (AudioCapturerChangeInfoArray[i].capturerState == 1 && devDescriptor != null) {
                        resultFlag = true;
                        console.info(Tag+'State : '+AudioCapturerChangeInfoArray[i].capturerState);
                    }
                }
            }
        }).catch((err) => {
            console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_STATE_1_PR] ## CapCh Off is called ##');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
            }
        });

        await sleep (100);
        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep(100);
		
		await audioStreamManager.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info(Tag+'[GET_CAPTURER_STATE_2_PROMISE] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
					var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
					for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                    if (AudioCapturerChangeInfoArray[i].capturerState == 2 && devDescriptor != null) {
                        resultFlag = true;
                        console.info(Tag+'State : '+AudioCapturerChangeInfoArray[i].capturerState);
                    }
                }
            }
        }).catch((err) => {
            console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_STATE_2_PROMISE] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });
		
        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep(100);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
            }
        });

        await sleep (100);

        await audioCap.stop().then(async function () {
            console.info(Tag+'Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer stop:ERROR : '+err.message);
        });

		await sleep(100);
		
		await audioStreamManager.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info(Tag+'[GET_CAPTURER_STATE_3_PROMISE] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
					var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
					for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
					}
                    if (AudioCapturerChangeInfoArray[i].capturerState == 3 && devDescriptor != null) {
                        resultFlag = true;
                        console.info(Tag+'State : '+AudioCapturerChangeInfoArray[i].capturerState);
                    }
                }
            }
        }).catch((err) => {
            console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_STATE_3_PROMISE] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })
	
	 /*         *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_004
               * @tc.name      : AudioCapturerChange - DEVICE DESCRIPTOR
               * @tc.desc      : AudioCapturerChange - DEVICE DESCRIPTOR
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_GET_CAPTURER_CHANGE_PROMISE_004', 0, async function (done) {
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
            }
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
		await audioStreamManagerCB.getCurrentAudioCapturerInfoArray().then( function (AudioCapturerChangeInfoArray) {
            console.info('AFCapturerChangeLog: [GET_CAP_DD_PR] **** Get Promise Called ****');
            if (AudioCapturerChangeInfoArray!=null) {
                for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
					console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
					console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
					console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
					console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
					console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                    for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					var Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
					var dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
					var dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
					var sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
					var cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
					var cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
					console.info(Tag+'Id:'+i+':'+Id);
					console.info(Tag+'Type:'+i+':'+dType);
					console.info(Tag+'Role:'+i+':'+dRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+sRate);
					console.info(Tag+'CC:'+i+':'+cCount);
					console.info(Tag+'CM:'+i+':'+cMask);
					if (Id > 0 && dType == 15 && dRole == 1 && sRate!= null && cCount != null && cMask != null) {
						resultFlag = true;
					}
				}
                }
            }
        }).catch((err) => {
            console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
            resultFlag = false;
        });
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_DD_PR] ## CapCh Off is called ##');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
		}
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
		audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info(Tag+'[GET_CAPTURER_STATE_1_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
						var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
						for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                        if (AudioCapturerChangeInfoArray[i].capturerState ==1 && devDescriptor != null) {
                            resultFlag = true;
                            console.info(Tag+'State : '+ AudioCapturerChangeInfoArray[i].capturerState);
                        }
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_STATE_1_CALLBACK] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
        audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
            }
        });

        await sleep (100);
        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep(100);
		
		audioStreamManagerCB.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info(Tag+'[GET_CAPTURER_STATE_2_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
						var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
						for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                        if (AudioCapturerChangeInfoArray[i].capturerState ==2 && devDescriptor != null) {
                            resultFlag = true;
                            console.info(Tag+'State : '+ AudioCapturerChangeInfoArray[i].capturerState);
                        }
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManagerCB.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_STATE_2_CALLBACK] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
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
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });
		
        await audioCap.start().then(async function () {
            console.info(Tag+'Capturer started :SUCCESS ');
        }).catch((err) => {
            console.info(Tag+'Capturer start :ERROR : '+err.message);
        });

		await sleep(100);
		
        audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) =>  {
            for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
				console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
            }
        });

        await sleep (100);

        await audioCap.stop().then(async function () {
            console.info(Tag+'Capturer stopped : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer stop:ERROR : '+err.message);
        });

		await sleep(100);
		
		audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info(Tag+'[GET_CAPTURER_STATE_3_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
						var devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
						for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
                        if (AudioCapturerChangeInfoArray[i].capturerState ==3 && devDescriptor != null) {
                            resultFlag = true;
                            console.info(Tag+'State : '+ AudioCapturerChangeInfoArray[i].capturerState);
                        }
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_STATE_3_CALLBACK] ######### CapturerChange Off is called #########');

        await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
        });

        expect(resultFlag).assertTrue();
        done();

    })
	
	/*         *
               * @tc.number    : SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_004
               * @tc.name      : AudioCapturerChange - DEVICE DESCRIPTOR
               * @tc.desc      : AudioCapturerChange - DEVICE DESCRIPTOR
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0*/

    it('SUB_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_004', 0, async function (done) {
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
                console.info(Tag+' ## CapChange on is called for element '+i+' ##');
				console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
				console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
				console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
				console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
				console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
				for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
					console.info(Tag+'Id:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id);
					console.info(Tag+'Type:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType);
					console.info(Tag+'Role:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole);
					console.info(Tag+'Name:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
					console.info(Tag+'Addr:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
					console.info(Tag+'SR:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]);
					console.info(Tag+'C'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]);
					console.info(Tag+'CM:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks);
				}
		}
        });
        await sleep (100);

        await audio.createAudioCapturer(AudioCapturerOptions).then(async function (data) {
            audioCap = data;
            console.info(Tag+'AudioCapturer Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info(Tag+'AudioCapturer Created : ERROR : '+err.message);
        });

		await sleep(100);
	
		audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
            console.info(Tag+'[GET_CAPTURER_DD_CALLBACK] **** Get Callback Called ****');
            await sleep(100);
            if (err) {
                console.log(Tag+'getCurrentAudioCapturerInfoArray :ERROR: '+err.message);
                resultFlag = false;
            }
            else {
                if (AudioCapturerChangeInfoArray !=null) {
                    for (let i=0;i<AudioCapturerChangeInfoArray.length;i++) {
						console.info(Tag+'StrId for '+i+'is:'+AudioCapturerChangeInfoArray[i].streamId);
						console.info(Tag+'CUid for '+i+'is:'+AudioCapturerChangeInfoArray[i].clientUid);
						console.info(Tag+'Src for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.source);
						console.info(Tag+'Flag '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags);
						console.info(Tag+'State for '+i+'is:'+AudioCapturerChangeInfoArray[i].capturerState);
                        for (let j=0;j<AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
						var Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
						var dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
						var dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
						var sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
						var cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
						var cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
						console.info(Tag+'Id:'+i+':'+Id);
						console.info(Tag+'Type:'+i+':'+dType);
						console.info(Tag+'Role:'+i+':'+dRole);
						console.info(Tag+'Nam:'+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name);
						console.info(Tag+''+i+':'+AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address);
						console.info(Tag+'SR:'+i+':'+sRate);
						console.info(Tag+'CC:'+i+':'+cCount);
						console.info(Tag+'CM:'+i+':'+cMask);
						if (Id > 0 && dType == 15 && dRole == 1 && sRate!= null && cCount != null && cMask!=null){
							resultFlag = true;
						}
					}
                    }
                }
            }
        });

        await sleep(1000);
		
        audioStreamManager.off('audioCapturerChange');
        await sleep(100);
        console.info(Tag+'[GET_CAPTURER_DD_CALLBACK] ######### CapturerChange Off is called #########');
        
		await audioCap.release().then(async function () {
            console.info(Tag+'Capturer release : SUCCESS');
        }).catch((err) => {
            console.info(Tag+'Capturer release :ERROR : '+err.message);
        });
	
		expect(resultFlag).assertTrue();
        done();
    })

})
