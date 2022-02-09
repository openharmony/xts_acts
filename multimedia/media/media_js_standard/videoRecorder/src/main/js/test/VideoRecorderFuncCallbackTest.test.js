/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import camera from '@ohos.multimedia.camera'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('RecorderLocalTestVideoFUNC', function () {
    const RECORDER_TIME = 3000;
    const PAUSE_TIME = 1000;
    const END_EVENT = 'end';
    const CREATE_EVENT = 'create';
    const PREPARE_EVENT = 'prepare';
    const PREPARE_OLNYVIDEO_EVENT = 'prepare_only';
    const GETSURFACE_EVENT = 'getInputSurface';
    const START_EVENT = 'start';
    const PAUSE_EVENT = 'pause';
    const RESUME_EVENT = 'resume';
    const STOP_EVENT = 'stop';
    const RESET_EVENT = 'reset';
    const RELEASE_EVENT = 'release';
    let cameraManager;
    let cameras;
    let captureSession;
    let videoOutput;
    let surfaceID;
    let configFile = {
        audioBitrate : 48000,
        audioChannels : 2,
        audioCodec : 'audio/mp4a-latm',
        audioSampleRate : 48000,
        durationTime : 1000,
        fileFormat : 'mp4',
        videoBitrate : 48000,
        videoCodec : 'video/mp4v-es',
        videoFrameWidth : 640,
        videoFrameHeight : 480,
        videoFrameRate : 10
    }
    // orientationHint 0, 90, 180, 270
    let videoConfig = {
        audioSourceType : 1,
        videoSourceType : 0,
        profile : configFile,
        url : 'file:///data/media/01.mp4',
        orientationHint : 0,
        location : { latitude : 30, longitude : 130 },
        maxSize : 100,
        maxDuration : 500
    }

    let onlyVideoProfile = {
        durationTime : 1000,
        fileFormat : 'mp4',
        videoBitrate : 48000,
        videoCodec : 'video/mp4v-es',
        videoFrameWidth : 640,
        videoFrameHeight : 480,
        videoFrameRate : 10
    }

    let onlyVideoConfig = {
        videoSourceType : 0,
        profile : onlyVideoProfile,
        url : 'file:///data/media/01.mp4',
        orientationHint : 0,
        location : { latitude : 30, longitude : 130 },
        maxSize : 100,
        maxDuration : 500
    }

    function sleep(time) {
        for(let t = Date.now();Date.now() - t <= time;);
    }

    beforeAll(function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    async function initCamera() {
        cameraManager = await camera.getCameraManager(null);
        if (cameraManager != null) {
            console.info('[camera] case getCameraManager success');
        } else {
            console.info('[camera] case getCameraManager failed');
            return;
        }
        cameras = await cameraManager.getCameras();
        if (cameras != null) {
            console.info('[camera] case getCameras success');
        } else {
            console.info('[camera] case getCameras failed');
        }
    }

    async function initCaptureSession(videoOutPut) {
        let cameraInput = await cameraManager.createCameraInput(cameras[0].cameraId);
        if (cameraInput != null) {
            console.info('[camera] case createCameraInput success');
        } else {
            console.info('[camera] case createCameraInput failed');
            return;
        }
        captureSession = await camera.createCaptureSession(null);
        await captureSession.beginConfig();
        await captureSession.addInput(cameraInput);
        await captureSession.addOutput(videoOutPut);
        await captureSession.commitConfig();
        await captureSession.start();
    }

    async function stopCaptureSession() {
        await captureSession.stop();
        await captureSession.release();
    }

    function printfError(error, done) {
        expect().assertFail();
        console.info(`case error called,errMessage is ${error.message}`);
        done();
    }

    let events = require('events');
    let eventEmitter = new events.EventEmitter();

    function toNextStep(videoRecorder, steps, done) {
        if (steps[0] == END_EVENT) {
            console.info('case success!!');
            done();
        } else {
            eventEmitter.emit(steps[0], videoRecorder, steps, done);
        }
    }

    function setOnCallback(videoRecorder) {
        videoRecorder.on('info', (infoType, extra) => {
            console.info('case info called, infoType is ' + infoType);
            console.info('case info called, extra is ' + extra);
        });

        videoRecorder.on('error', (err) => {
            console.info('case error called, errMessage is ' + err.message);
            expect().assertFail();
        });
    }

    eventEmitter.on(CREATE_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        media.createVideoRecorder((err, recorder) => {
            if (typeof (err) == 'undefined') {
                console.info('case createVideoRecorder success ');
                videoRecorder = recorder;
                setOnCallback(videoRecorder);
                expect(videoRecorder.state).assertEqual('idle');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(PREPARE_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.prepare(videoConfig, (err) => {
            if (typeof (err) == 'undefined') {
                console.info('case prepare success');
                expect(videoRecorder.state).assertEqual('prepared');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(PREPARE_OLNYVIDEO_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.prepare(onlyVideoConfig, (err) => {
            if (typeof (err) == 'undefined') {
                console.info('case prepare success');
                expect(videoRecorder.state).assertEqual('prepared');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(GETSURFACE_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.getInputSurface((err, outPutsurface) => {
            if (typeof (err) == 'undefined') {
                expect(videoRecorder.state).assertEqual('prepared');
                surfaceID = outPutsurface;
                console.info('case getInputSurface success :' + surfaceID);
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(START_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoOutput = await camera.createVideoOutput(surfaceID);
        if (videoOutput == null) {
            console.info('case createVideoOutput failed');
        } else {
            console.info('case createVideoOutput success');
        }
        await initCaptureSession(videoOutput);
        await videoOutput.start().then(() => {
            console.info('case videoOutput start success');
        });
        videoRecorder.start((err) => {
            if (typeof (err) == 'undefined') {
                console.info('case start success');
                expect(videoRecorder.state).assertEqual('playing');
                sleep(RECORDER_TIME);
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(PAUSE_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.pause((err) => {
            if (typeof (err) == 'undefined') {
                console.info('case pause success');
                expect(videoRecorder.state).assertEqual('paused');
                sleep(PAUSE_TIME);
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(RESUME_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.resume((err) => {
            if (typeof (err) == 'undefined') {
                console.info('case resume success');
                sleep(RECORDER_TIME);
                expect(videoRecorder.state).assertEqual('playing');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(STOP_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.stop((err) => {
            if (typeof (err) == 'undefined') {
                console.info('case stop success');
                expect(videoRecorder.state).assertEqual('stopped');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(RESET_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        videoRecorder.reset((err) => {
            if (typeof (err) == 'undefined') {
                console.info('case reset success');
                expect(videoRecorder.state).assertEqual('idle');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    eventEmitter.on(RELEASE_EVENT, async (videoRecorder, steps, done) => {
        steps.shift();
        await videoOutput.stop().then(() => {
            console.info('case videoOutput stop success');
        });
        await videoOutput.release().then(() => {
            console.info('case videoOutput release success');
        });
        videoOutput = undefined;
        await stopCaptureSession();
        videoRecorder.release((err) => {
            if (typeof (err) == 'undefined') {
                expect(videoRecorder.state).assertEqual('idle');
                console.info('case release success');
                toNextStep(videoRecorder, steps, done);
            } else {
                printfError(err, done);
            }
        });
    });

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0100
        * @tc.name      : 01.start->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0100', 0, async function (done) {
        await initCamera();
        videoConfig.url = 'file:///data/media/19.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0200
        * @tc.name      : 02.start->pause->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0200', 0, async function (done) {
        videoConfig.url = 'file:///data/media/20.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            PAUSE_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0300
        * @tc.name      : 03.start->pause->resume->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0300', 0, async function (done) {
        videoConfig.url = 'file:///data/media/21.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            PAUSE_EVENT, RESUME_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0400
        * @tc.name      : 04.start->stop->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0400', 0, async function (done) {
        videoConfig.url = 'file:///data/media/22.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);    
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0500
        * @tc.name      : 05.start->reset->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0500', 0, async function (done) {
        videoConfig.url = 'file:///data/media/23.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            RESET_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0600
        * @tc.name      : 06.start->pause->stop->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0600', 0, async function (done) {
        videoConfig.url = 'file:///data/media/24.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, PAUSE_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0700
        * @tc.name      : 07.start->pause->reset->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0700', 0, async function (done) {
        videoConfig.url = 'file:///data/media/25.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, PAUSE_EVENT,
            RESET_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0800
        * @tc.name      : 08.start->pause->resume->stop->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0800', 0, async function (done) {
        videoConfig.url = 'file:///data/media/26.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, PAUSE_EVENT,
            RESUME_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0900
        * @tc.name      : 09.start->pause->resume->reset->release (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_0900', 0, async function (done) {
        videoConfig.url = 'file:///data/media/27.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, PAUSE_EVENT,
            RESUME_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1000
        * @tc.name      : 10.start->stop->release
        *                 (audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 8000)(promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1000', 0, async function (done) {
        configFile.audioBitrate = 8000;
        configFile.audioSampleRate = 8000;
        configFile.videoBitrate = 8000;
        videoConfig.url = 'file:///data/media/28.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1100
        * @tc.name      : 11.start->stop->release
        *                 (audioBitrate 16000, audioSampleRate 32000, videoBitrateRange 16000)(callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1100', 0, async function (done) {
        configFile.audioBitrate = 16000;
        configFile.audioSampleRate = 32000;
        configFile.videoBitrate = 16000;
        videoConfig.url = 'file:///data/media/29.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1200
        * @tc.name      : 12.start->stop->release
        *                 (audioBitrate 32000, audioSampleRate 44100, videoBitrateRange 32000)(callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1200', 0, async function (done) {
        configFile.audioBitrate = 32000;
        configFile.audioSampleRate = 44100;
        configFile.videoBitrate = 32000;
        videoConfig.url = 'file:///data/media/30.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1300
        * @tc.name      : 13.start->stop->release
        *                 (audioBitrate 112000, audioSampleRate 96000, videoBitrateRange 112000)(callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1300', 0, async function (done) {
        configFile.audioBitrate = 112000;
        configFile.audioSampleRate = 96000;
        configFile.videoBitrate = 112000;
        videoConfig.url = 'file:///data/media/31.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1400
        * @tc.name      : 14.start->release (only video) (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1400', 0, async function (done) {
        onlyVideoConfig.url = 'file:///data/media/32.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_OLNYVIDEO_EVENT, GETSURFACE_EVENT,
            START_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1500
        * @tc.name      : 15.start->pause->release (only video) (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1500', 0, async function (done) {
        onlyVideoConfig.url = 'file:///data/media/33.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_OLNYVIDEO_EVENT, GETSURFACE_EVENT, START_EVENT,
            PAUSE_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1600
        * @tc.name      : 16.start->pause->resume->releas (only video) (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1600', 0, async function (done) {
        onlyVideoConfig.url = 'file:///data/media/34.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_OLNYVIDEO_EVENT, GETSURFACE_EVENT, START_EVENT,
            PAUSE_EVENT, RESUME_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1700
        * @tc.name      : 17.start->stop->release (only video) (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1700', 0, async function (done) {
        onlyVideoConfig.url = 'file:///data/media/35.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_OLNYVIDEO_EVENT, GETSURFACE_EVENT, START_EVENT,
            STOP_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1800
        * @tc.name      : 18.start->reset->release (only video) (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1800', 0, async function (done) {
        onlyVideoConfig.url = 'file:///data/media/36.mp4';
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_OLNYVIDEO_EVENT, GETSURFACE_EVENT, START_EVENT,
            RESET_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1900
        * @tc.name      : 19.orientationHint 90 (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_1900', 0, async function (done) {
        videoConfig.url = 'file:///data/media/37.mp4';
        videoConfig.orientationHint = 90;
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT,
            START_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_2000
        * @tc.name      : 20.orientationHint 180 (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_2000', 0, async function (done) {
        videoConfig.url = 'file:///data/media/38.mp4';
        videoConfig.orientationHint = 180;
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_2100
        * @tc.name      : 21.orientationHint 270 (callback)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_CALLBACK_2100', 0, async function (done) {
        videoConfig.url = 'file:///data/media/39.mp4';
        videoConfig.orientationHint = 270;
        let videoRecorder = null;
        let mySteps = new Array(CREATE_EVENT, PREPARE_EVENT, GETSURFACE_EVENT, START_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoRecorder, mySteps, done);
    })
})
