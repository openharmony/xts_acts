/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as videoRecorderBase from '../../../../../VideoRecorderTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoRecorderFuncPromiseTest', function () {
    const RECORDER_TIME = 3000;
    const PAUSE_TIME = 1000;
    const DELTA_TIME = 1000;
    const ONLYVIDEO_TYPE = 'only_video';
    const AUDIO_VIDEO_TYPE = 'audio_video';
    let cameraManager;
    let cameras;
    let captureSession;
    let fdPath;
    let fdObject;
    let cameraID = 0;
    let playerSurfaceId = '';
    let pageId = 0;
    const pagePath1 = 'pages/surfaceTest/surfaceTest';
    const pagePath2 = 'pages/surfaceTest2/surfaceTest2';
    let configFile = {
        audioBitrate : 48000,
        audioChannels : 2,
        audioCodec : media.CodecMimeType.AUDIO_AAC,
        audioSampleRate : 48000,
        durationTime : 1000,
        fileFormat : media.ContainerFormatType.CFT_MPEG_4,
        videoBitrate : 48000,
        videoCodec : media.CodecMimeType.VIDEO_MPEG4,
        videoFrameWidth : 640,
        videoFrameHeight : 480,
        videoFrameRate : 10
    }

    let videoConfig = {
        audioSourceType : 1,
        videoSourceType : 0,
        profile : configFile,
        url : 'fd://',
        rotation : 0,
        location : { latitude : 30, longitude : 130 },
        maxSize : 100,
        maxDuration : 500
    }

    let onlyVideoProfile = {
        durationTime : 1000,
        fileFormat : media.ContainerFormatType.CFT_MPEG_4,
        videoBitrate : 48000,
        videoCodec : media.CodecMimeType.VIDEO_MPEG4,
        videoFrameWidth : 640,
        videoFrameHeight : 480,
        videoFrameRate : 10
    }

    let onlyVideoConfig = {
        videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
        profile : onlyVideoProfile,
        url : 'fd://',
        rotation : 0,
        location : { latitude : 30, longitude : 130 },
        maxSize : 100,
        maxDuration : 500
    }

    beforeAll(async function () {
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
        console.info('beforeAll case');
    })

    beforeEach(async function () {
        await mediaTestBase.toNewPage(pagePath1, pagePath2, pageId);
        pageId = (pageId + 1) % 2;
        await mediaTestBase.msleepAsync(1000).then(
            () => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        playerSurfaceId = globalThis.value;
        cameraID = 0;
        console.info('beforeEach case');
    })

    afterEach(async function () {
        await mediaTestBase.clearRouter();
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    async function startVideoOutput(videoOutPut) {
        if (videoOutPut == null) {
            console.info('[camera] case videoOutPut is null');
            return;
        }
        await videoOutPut.start().then(() => {
            console.info('[camera] case videoOutput start success');
        });
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_ALL_CAMERAS
        * @tc.name      : 01.all cameras recordering (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */  
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_ALL_CAMERAS', 0, async function (done) {
        for (let i = 0; i < 2; i++) {
            cameraID = i;
            console.info('[camera] case cameraID is :' + cameraID);
            let videoRecorder = undefined;
            let surfaceID = '';
            let videoOutput;
            let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
            fdObject = await mediaTestBase.getFd('recorder_promise_cameraID_' + cameraID + '.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            videoConfig.url = fdPath;
            await media.createVideoRecorder().then((recorder) => {
                console.info('case createVideoRecorder called');
                if (typeof (recorder) != 'undefined') {
                    videoRecorder = recorder;
                    expect(videoRecorder.state).assertEqual('idle');
                } else {
                    console.info('case recordr is undefined!!');
                    expect().assertFail();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            await videoRecorder.prepare(videoConfig).then(() => {
                console.info('case prepare called');
                expect(videoRecorder.state).assertEqual('prepared');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    
            await videoRecorder.getInputSurface().then((outPutSurface) => {
                console.info('case getInputSurface called');
                surfaceID = outPutSurface;
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            videoOutput = await camera.createVideoOutput(surfaceID);
            captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
            await startVideoOutput(videoOutput);
    
            await videoRecorder.start().then(() => {
                expect(videoRecorder.state).assertEqual('playing');
                console.info('case start called');
                mediaTestBase.msleep(RECORDER_TIME);
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            await videoRecorder.stop().then(() => {
                expect(videoRecorder.state).assertEqual('stopped');
                console.info('case stop called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            await videoRecorder.release().then(() => {
                expect(videoRecorder.state).assertEqual('idle');
                console.info('case release ');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            await videoOutput.stop();
            await videoOutput.release().then(() => {
                console.info('[camera] case videoOutput release success');
            });
            videoOutPut = undefined;
            await videoRecorderBase.stopCaptureSession(captureSession);
            await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
            await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        }
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0100
        * @tc.name      : 02.start->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0100', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_01.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            console.info('case release ');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0200
        * @tc.name      : 02.start->pause->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0200', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_02.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.pause().then(() => {
            console.info('case pause called');
            mediaTestBase.msleep(PAUSE_TIME);
            expect(videoRecorder.state).assertEqual('paused');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoRecorder.release().then(() => {
            console.info('case release ');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0300
        * @tc.name      : 03.start->pause->resume->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0300', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_03.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            mediaTestBase.msleep(PAUSE_TIME);
            console.info('case pause called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.start();
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
            console.info('case resume called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME * 2, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0400
        * @tc.name      : 04.start->stop->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0400', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_04.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0500
        * @tc.name      : 05.start->reset->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0500', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_05.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        
        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0600
        * @tc.name      : 06.start->pause->stop->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0600', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_06.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            mediaTestBase.msleep(PAUSE_TIME);
            console.info('case pause called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0700
        * @tc.name      : 07.start->pause->reset->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0700', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_07.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            mediaTestBase.msleep(PAUSE_TIME);
            console.info('case pause called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0800
        * @tc.name      : 08.start->pause->resume->stop->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0800', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_08.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            mediaTestBase.msleep(PAUSE_TIME);
            console.info('case pause called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.start();
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
            console.info('case resume called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME * 2, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0900
        * @tc.name      : 09.start->pause->resume->reset->release (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0900', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        fdObject = await mediaTestBase.getFd('recorder_promise_09.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            mediaTestBase.msleep(PAUSE_TIME);
            console.info('case pause called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.start();
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
            console.info('case resume called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME * 2, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1000
        * @tc.name      : 10.start->stop->release
        *                 (audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 8000)(promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1000', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_10.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        configFile.audioBitrate = 8000;
        configFile.audioSampleRate = 8000;
        configFile.videoBitrate = 8000;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1100
        * @tc.name      : 11.start->stop->release
        *                 (audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 16000)(promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1100', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_11.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        configFile.audioBitrate = 16000;
        configFile.audioSampleRate = 32000;
        configFile.videoBitrate = 16000;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1200
        * @tc.name      : 12.start->stop->release
        *                 (audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 32000)(promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1200', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_12.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        configFile.audioBitrate = 32000;
        configFile.audioSampleRate = 44100;
        configFile.videoBitrate = 32000;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1300
        * @tc.name      : 13.start->stop->release
        *                 (audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 112000)(promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1300', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_13.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        configFile.audioBitrate = 112000;
        configFile.audioSampleRate = 96000;
        configFile.videoBitrate = 112000;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1400
        * @tc.name      : 14.start->release (only video) (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1400', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_14.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        onlyVideoConfig.url = fdPath;
        let trackArray = videoRecorderBase.getTrackArray(ONLYVIDEO_TYPE, onlyVideoProfile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case prepare called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1500
        * @tc.name      : 15.start->pause->release (only video) (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1500', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_15.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        onlyVideoConfig.url = fdPath;
        let trackArray = videoRecorderBase.getTrackArray(ONLYVIDEO_TYPE, onlyVideoProfile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            console.info(`case getInputSurface,state is ${videoRecorder.state}`);
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            console.info('case pause called');
            mediaTestBase.msleep(PAUSE_TIME);
            expect(videoRecorder.state).assertEqual('paused');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            console.info('case release ');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1600
        * @tc.name      : 16.start->pause->resume->releas (only video) (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1600', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_16.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        onlyVideoConfig.url = fdPath;
        let trackArray = videoRecorderBase.getTrackArray(ONLYVIDEO_TYPE, onlyVideoProfile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.stop();
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            mediaTestBase.msleep(PAUSE_TIME);
            console.info('case pause called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoOutput.start();
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
            console.info('case resume called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME * 2, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1700
        * @tc.name      : 17.start->stop->release (only video) (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1700', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_17.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        onlyVideoConfig.url = fdPath;
        let trackArray = videoRecorderBase.getTrackArray(ONLYVIDEO_TYPE, onlyVideoProfile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1800
        * @tc.name      : 18.start->reset->release (only video) (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1800', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_18.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        onlyVideoConfig.url = fdPath;
        let trackArray = videoRecorderBase.getTrackArray(ONLYVIDEO_TYPE, onlyVideoProfile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1900
        * @tc.name      : 19.rotation 90 (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1900', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_19.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        configFile.audioSampleRate = 48000;
        videoConfig.rotation = 90;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2000
        * @tc.name      : 20.rotation 180 (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2000', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_20.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        videoConfig.rotation = 180;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2100
        * @tc.name      : 21.rotation 270 (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2100', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_21.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        videoConfig.rotation = 270;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2200
        * @tc.name      : 22.videoFrameRate 20 (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2200', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_22.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        videoConfig.videoFrameRate = 20;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2300
        * @tc.name      : 23.videoFrameRate 30 (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2300', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_23.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        videoConfig.videoFrameRate = 30;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2400
        * @tc.name      : 24.videoFrameRate 60 (promise)
        * @tc.desc      : Video recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2400', 0, async function (done) {
        let videoRecorder = undefined;
        let surfaceID = '';
        let videoOutput;
        fdObject = await mediaTestBase.getFd('recorder_promise_24.mp4');
        fdPath = "fd://" + fdObject.fdNumber.toString();
        videoConfig.url = fdPath;
        videoConfig.videoFrameRate = 60;
        let trackArray = videoRecorderBase.getTrackArray(AUDIO_VIDEO_TYPE, configFile);
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoOutput = await camera.createVideoOutput(surfaceID);
        captureSession = await videoRecorderBase.initCaptureSession(videoOutput, cameraManager, cameras, cameraID);
        await startVideoOutput(videoOutput);
        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            mediaTestBase.msleep(RECORDER_TIME);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.stop();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoOutput.release().then(() => {
            console.info('[camera] case videoOutput release success');
        });
        videoOutPut = undefined;
        await videoRecorderBase.stopCaptureSession(captureSession);
        await videoRecorderBase.checkVideos(fdPath, RECORDER_TIME, trackArray, playerSurfaceId);
        await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
        done();
    })
})
