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
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

export default function AVRecorderFuncTest(recorderContxt) {
    describe('AVRecorderFuncTest', function () {
        const RECORDER_TIME = 3000;
        const PAUSE_TIME = 1000;
        const END = 0;
        const CREATE_PROMISE = 1;
        const CREATE_CALLBACK = 2;
        const PREPARE_PROMISE = 3;
        const PREPARE_CALLBACK = 4;
        const GETSURFACE_PROMISE = 5;
        const GETSURFACE_CALLBACK = 6;
        const STARTCAMERA = 7;
        const START_PROMISE = 8;
        const START_CALLBACK = 9;
        const PAUSE_PROMISE = 10;
        const PAUSE_CALLBACK = 11;
        const RESUME_PROMISE = 12;
        const RESUME_CALLBACK = 13;
        const STOP_PROMISE = 14;
        const STOP_CALLBACK = 15;
        const RESET_PROMISE = 16;
        const RESET_CALLBACK = 17;
        const RELEASE_PROMISE = 18;
        const RELEASE_CALLBACK = 19;
        const SETCALLBACKOFF = 20;
        const STOPVIDEOOUTPUT = 21;
        let mySteps = new Array();
        let caseCount = 0;
        let fdPath;
        let fdObject;
        let playerSurfaceId = '';
        let avRecorder = null;
        let surfaceID = '';
        let needDone = false;
        
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 48000,
            videoCodec : media.CodecMimeType.VIDEO_MPEG4,
            videoFrameWidth : 640,
            videoFrameHeight : 480,
            videoFrameRate : 30
        }
        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
            profile : avProfile,
            url : 'fd://',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }
    
        let audioProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
        }
    
        let audioConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            profile : audioProfile,
            url : 'fd://',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }
    
        beforeAll(async function () {
            console.info('beforeAll case In');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionName5 = 'ohos.permission.CAMERA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4, permissionName5];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(2000);
            await mediaTestBase.driveFn(3);
            console.info('beforeAll case Out');
        })
    
        beforeEach(async function () {
            console.info('beforeEach case In');
            playerSurfaceId = globalThis.value;
            avRecorder = undefined;
            surfaceID = '';
            caseCount += 1;
            needDone = false;
            console.info('beforeEach case Out');
        })
    
        afterEach(async function () {
            console.info('afterEach case In');
            mySteps = new Array();
            await releaseByPromise();
            await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            console.info('afterEach case Out');
        })
    
        afterAll(function () {
            console.info('afterAll case');
        })
    
        async function getRecorderFileFd(fileName, fileType) {
            console.info("case current fileName is: " + fileName);
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, fileType);
            fdPath = "fd://" + fdObject.fdNumber.toString();
            console.info("case fdPath is: " + fdPath);
            avConfig.url = fdPath;
            console.info("case to out getRecorderFileFd");
        }
    
        async function createAVRecorderByPromise(done) {
            console.info(`case to create avRecorder by promise`);
            await media.createAVRecorder().then((recorder) => {
                console.info('case createAVRecorder promise called');
                if (typeof (recorder) != 'undefined') {
                    avRecorder = recorder;
                    expect(avRecorder.state).assertEqual('idle');
                    setCallbackOn(done);
                    nextStep(done);
                } else {
                    console.info('case create avRecorder failed!!!');
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function createAVRecorderByCallback(done) {
            console.info(`case to create avRecorder by callback`);
            media.createAVRecorder((err, recorder) => {
                if (typeof (err) == 'undefined') {
                    console.info('case createAVRecorder callback success ');
                    avRecorder = recorder;
                    expect(avRecorder.state).assertEqual('idle');
                    setCallbackOn(done);
                    nextStep(done);
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function prepareByPromise() {
            console.info(`case to prepare by promise`);
            await avRecorder.prepare(avConfig).then(() => {
                console.info('case recorder prepare by promise called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function prepareByCallback() {
            console.info(`case to prepare by callback`);
            avRecorder.prepare(avConfig, (err) => {
                if (typeof (err) == 'undefined') {
                    console.info('case recorder prepare by callback called');
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function getInputSurfaceByPromise(done) {
            console.info(`case to getsurface by promise`);
            await avRecorder.getInputSurface().then((outputSurface) => {
                console.info('case getInputSurface by promise called');
                surfaceID = outputSurface;
                console.info('case outputSurface surfaceID is: ' + surfaceID);
                nextStep(done);
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function getInputSurfaceByCallback(done) {
            console.info(`case to getsurface by callback`);
            avRecorder.getInputSurface((err, outputSurface) => {
                if (typeof (err) == 'undefined') {
                    console.info('case getInputSurface by callback called');
                    surfaceID = outputSurface;
                    console.info('case outputSurface surfaceID is: ' + surfaceID);
                    nextStep(done);
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function startByPromise() {
            console.info(`case to start by promise`);
            await avRecorder.start().then(() => {
                console.info('case recorder start by promise called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function startByCallback() {
            console.info(`case to start by callback`);
            avRecorder.start((err) => {
                if (typeof (err) == 'undefined') {
                    console.info('case recorder start by callback called');
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function pauseByPromise() {
            console.info(`case to pause by promise`);
            await avRecorder.pause().then(() => {
                console.info('case recorder pause by promise called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function pauseByCallback() {
            console.info(`case to pause by callback`);
            avRecorder.pause((err) => {
                if (typeof (err) == 'undefined') {
                    console.info('case recorder pause by callback called');
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function resumeByPromise() {
            console.info(`case to resume by promise`);
            await avRecorder.resume().then(() => {
                console.info('case recorder resume by promise called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function resumeByCallback() {
            console.info(`case to resume by callback`);
            avRecorder.resume((err) => {
                if (typeof (err) == 'undefined') {
                    console.info('case recorder resume by callback called');
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function stopByPromise() {
            console.info(`case to stop by promise`);
            await avRecorder.stop().then(() => {
                console.info('case recorder stop by promise called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function stopByCallback() {
            console.info(`case to stop by callback`);
            avRecorder.stop((err) => {
                if (typeof (err) == 'undefined') {
                    console.info('case recorder stop by callback called');
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function resetByPromise() {
            console.info(`case to reset by promise`);
            await avRecorder.reset().then(() => {
                console.info('case recorder reset by promise called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
    
        function resetByCallback() {
            console.info(`case to reset by callback`);
            avRecorder.reset((err) => {
                if (typeof (err) == 'undefined') {
                    console.info('case recorder reset by callback called');
                } else {
                    mediaTestBase.failureCallback(err);
                }
            });
        }
    
        async function releaseByPromise(done) {
            console.info(`case to release by promise`);
            if (avRecorder) {
                await avRecorder.release().then(() => {
                    console.info('case recorder release by promise called');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            if(needDone) {
                avRecorder = undefined;
                done();
            }
        }
    
        async function releaseByCallback(done) {
            console.info(`case to release by callback`);
            if (avRecorder) {
                avRecorder.release(async(err) => {
                    if (typeof (err) == 'undefined') {
                        console.info('case recorder release by callback called');
                        avRecorder = undefined;
                    } else {
                        mediaTestBase.failureCallback(err);
                    }
                });
            }
            if (needDone) {
                avRecorder = undefined;
                done();
            }
        }
    
        async function nextStep(done) {
            console.info("case myStep[0]: " + mySteps[0]);
            if (mySteps[0] == END) {
                console.info("case to END");
                done();
            }
            switch (mySteps[0]) {
                case CREATE_PROMISE:
                    mySteps.shift();
                    await createAVRecorderByPromise(done);
                    break;
                case CREATE_CALLBACK:
                    mySteps.shift();
                    createAVRecorderByCallback(done);
                    break;
                case PREPARE_PROMISE:
                    mySteps.shift();
                    await prepareByPromise();
                    break;
                case PREPARE_CALLBACK:
                    mySteps.shift();
                    prepareByCallback();
                    break;
                case GETSURFACE_PROMISE:
                    mySteps.shift();
                    await getInputSurfaceByPromise(done);
                    break;
                case GETSURFACE_CALLBACK:
                    mySteps.shift();
                    getInputSurfaceByCallback(done);
                    break;
                case STARTCAMERA:
                    mySteps.shift();
                    await startVideoOutput();
                    nextStep(done);
                    break;
                case START_PROMISE:
                    mySteps.shift();
                    await startByPromise();
                    break;
                case START_CALLBACK:
                    mySteps.shift();
                    startByCallback();
                    break;
                case PAUSE_PROMISE:
                    mySteps.shift();
                    await pauseByPromise();
                    break;
                case PAUSE_CALLBACK:
                    mySteps.shift();
                    pauseByCallback();
                    break;
                case RESUME_PROMISE:
                    mySteps.shift();
                    await resumeByPromise();
                    break;
                case RESUME_CALLBACK:
                    mySteps.shift();
                    resumeByCallback();
                    break;
                case STOP_PROMISE:
                    mySteps.shift();
                    await stopByPromise();
                    break;
                case STOP_CALLBACK:
                    mySteps.shift();
                    stopByCallback();
                    break;
                case RESET_PROMISE:
                    mySteps.shift();
                    await resetByPromise();
                    break;
                case RESET_CALLBACK:
                    mySteps.shift();
                    resetByCallback();
                    break;
                case RELEASE_PROMISE:
                    mySteps.shift();
                    await releaseByPromise(done);
                    break;
                case RELEASE_CALLBACK:
                    mySteps.shift();
                    await releaseByCallback(done);
                    break;
                case SETCALLBACKOFF:
                    mySteps.shift();
                    setCallbackOff(done);
                    break;
                case STOPVIDEOOUTPUT:
                    mySteps.shift();
                    await stopVideoOutput();
                    nextStep(done);
                    break;
                default:
                    console.info('do nothing');
            }
        }
    
        function setCallbackOn(done) {
            console.info('case callback on');
            avRecorder.on('stateChange', async (state, reason) => {
                console.info('case state has changed, new state is :' + state);
                switch (state) {
                    case 'idle':
                        nextStep(done);
                        break;
                    case 'prepared':
                        nextStep(done);
                        break;
                    case 'started':
                        await mediaTestBase.msleepAsync(RECORDER_TIME);
                        nextStep(done);
                        break;
                    case 'paused':
                        await mediaTestBase.msleepAsync(PAUSE_TIME);
                        nextStep(done);
                        break;
                    case 'stopped':
                        nextStep(done);
                        break;
                    case 'released':
                        avRecorder = undefined;
                        nextStep(done);
                        break;
                    case 'error':
                        console.info("case error state!!!");
                        break;
                    default:
                        console.info('case start is unknown');
                        nextStep(done);
                }
            });
            avRecorder.on('error', (err) => {
                console.info('case avRecorder.on(error) called, errMessage is ' + err.message);
                nextStep(done);
            });
        }
    
        function setCallbackOff(done) {
            console.info('case callback off called');
            if (avRecorder != undefined) {
                console.info('case to call avRecorder.off("stateChange")');
                avRecorder.off('stateChange');
                console.info('case to call avRecorder.off("error")');
                avRecorder.off('error');
                console.info('case call avRecorder.off done');
            }
            needDone = true;
            nextStep(done);
            console.info('case callback off done');
        }

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FUNC_0100
        * @tc.name      : 01. test only avRecorder basic function by promise interfaces
        * @tc.desc      : test only avRecorder operation: start-pause-resume-stop 
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FUNC_0100', 0, async function (done) {
            avConfig = audioConfig;
            caseCount = 1;
            let fileName = 'avRecorder_func_0'+ caseCount +'.m4a';
            await getRecorderFileFd(fileName, 'audio');
            mySteps = new Array(CREATE_PROMISE, PREPARE_PROMISE, START_PROMISE, PAUSE_PROMISE, 
                RESUME_PROMISE, STOP_PROMISE, RESET_PROMISE, SETCALLBACKOFF, RELEASE_PROMISE);
            nextStep(done);
        })
    
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FUNC_0200
        * @tc.name      : 01. test only avRecorder basic function by callback interfaces
        * @tc.desc      : test only avRecorder operation: start-pause-resume-stop 
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FUNC_0200', 0, async function (done) {
            let fileName = 'avRecorder_func_0'+ caseCount +'.m4a';
            await getRecorderFileFd(fileName, 'audio');
            mySteps = new Array(CREATE_CALLBACK, PREPARE_CALLBACK, START_CALLBACK, PAUSE_CALLBACK,
                RESUME_CALLBACK, STOP_CALLBACK, RESET_CALLBACK, SETCALLBACKOFF, RELEASE_CALLBACK);
            nextStep(done);
        })
    })    
}