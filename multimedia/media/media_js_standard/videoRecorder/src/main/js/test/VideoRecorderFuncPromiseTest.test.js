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
import mediademo from '@ohos.multimedia.mediademo'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('RecorderLocalTestVideoFUNC', function () {
    const RECORDER_TIME = 3000;
    const PAUSE_TIME = 1000;
    let configFile = {
        audioBitrate : 48000,
        audioChannels : 2,
        audioCodec : 'audio/mp4a-latm',
        audioSampleRate : 48000,
        durationTime : 1000,
        fileFormat : 'mp4',
        videoBitrate : 48000,
        videoCodec : 'video/mp4v-es',
        videoFrameWidth : 120,
        videoFrameHeight : 120,
        videoFrameRate : 10
    }

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
        videoFrameWidth : 120,
        videoFrameHeight : 120,
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
    };

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

    function failureCallback(error) {
        expect().assertFail();
        console.info(`case error called,errMessage is ${error.message}`);
    }

    function catchCallback(error) {
        expect().assertFail();
        console.info(`case error called,errMessage is ${error.message}`);
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0100
        * @tc.name      : 01.start->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0100', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/01.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
    
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0200
        * @tc.name      : 02.start->pause->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0200', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/02.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            console.info(`case getInputSurface,state is ${videoRecorder.state}`);
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            console.info('case pause called');
            sleep(PAUSE_TIME);
            expect(videoRecorder.state).assertEqual('paused');
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 0;
        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            console.info('case release ');
            expect(videoRecorder.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0300
        * @tc.name      : 03.start->pause->resume->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0300', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/03.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            sleep(PAUSE_TIME);
            console.info('case pause called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 0;
        mediaTest.isStart = 1;
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
            console.info('case resume called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0400
        * @tc.name      : 04.start->stop->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0400', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/04.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0500
        * @tc.name      : 05.start->reset->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0500', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/05.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0600
        * @tc.name      : 06.start->pause->stop->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0600', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/06.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);
    
        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            sleep(PAUSE_TIME);
            console.info('case pause called');
        }, failureCallback).catch(catchCallback);
        mediaTest.isPause = 0;
        
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0700
        * @tc.name      : 07.start->pause->reset->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0700', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/07.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);
    
        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            sleep(PAUSE_TIME);
            console.info('case pause called');
        }, failureCallback).catch(catchCallback);
        mediaTest.isPause = 0;

        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0800
        * @tc.name      : 08.start->pause->resume->stop->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0800', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/08.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);
    
        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            sleep(PAUSE_TIME);
            console.info('case pause called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 0;
        mediaTest.isStart = 1;
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
            console.info('case resume called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0900
        * @tc.name      : 09.start->pause->resume->reset->release (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_0900', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/09.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);
    
        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            sleep(PAUSE_TIME);
            console.info('case pause called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 0;
        mediaTest.isStart = 1;
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
            console.info('case resume called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1000
        * @tc.name      : 10.start->stop->release
        *                 (audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 8000)(promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1000', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/10.mp4';
        configFile.audioBitrate = 8000;
        configFile.audioSampleRate = 8000;
        configFile.videoBitrate = 8000;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1100
        * @tc.name      : 11.start->stop->release
        *                 (audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 16000)(promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1100', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/11.mp4';
        configFile.audioBitrate = 16000;
        configFile.audioSampleRate = 32000;
        configFile.videoBitrate = 16000;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1200
        * @tc.name      : 12.start->stop->release
        *                 (audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 32000)(promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1200', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/12.mp4';
        configFile.audioBitrate = 32000;
        configFile.audioSampleRate = 44100;
        configFile.videoBitrate = 32000;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1300
        * @tc.name      : 13.start->stop->release
        *                 (audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 112000)(promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1300', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/13.mp4';
        configFile.audioBitrate = 112000;
        configFile.audioSampleRate = 96000;
        configFile.videoBitrate = 112000;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1400
        * @tc.name      : 14.start->release (only video) (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1400', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        onlyVideoConfig.url = 'file:///data/media/14.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
            console.info('case prepare called');
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
    
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1500
        * @tc.name      : 15.start->pause->release (only video) (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1500', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        onlyVideoConfig.url = 'file:///data/media/15.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            console.info(`case getInputSurface,state is ${videoRecorder.state}`);
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            console.info('case pause called');
            sleep(PAUSE_TIME);
            expect(videoRecorder.state).assertEqual('paused');
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 0;
        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            console.info('case release ');
            expect(videoRecorder.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1600
        * @tc.name      : 16.start->pause->resume->releas (only video) (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1600', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        onlyVideoConfig.url = 'file:///data/media/16.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 1;
        sleep(100);
        await videoRecorder.pause().then(() => {
            expect(videoRecorder.state).assertEqual('paused');
            sleep(PAUSE_TIME);
            console.info('case pause called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isPause = 0;
        mediaTest.isStart = 0;
        await videoRecorder.resume().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
            console.info('case resume called');
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1700
        * @tc.name      : 17.start->stop->release (only video) (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1700', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        onlyVideoConfig.url = 'file:///data/media/17.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            console.info('case getInputSurface called');
            expect(videoRecorder.state).assertEqual('prepared');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.stop().then(() => {
            expect(videoRecorder.state).assertEqual('stopped');
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1800
        * @tc.name      : 18.start->reset->release (only video) (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1800', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        onlyVideoConfig.url = 'file:///data/media/18.mp4';
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(onlyVideoConfig).then(() => {
            console.info('case recordr prepare called');
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            expect(videoRecorder.state).assertEqual('prepared');
            console.info('case getInputSurface called');
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            console.info('case start called');
            expect(videoRecorder.state).assertEqual('playing');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        await videoRecorder.reset().then(() => {
            console.info('case reset called');
            expect(videoRecorder.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        mediaTest.closeStream();
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1900
        * @tc.name      : 19.orientationHint 90 (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_1900', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/40.mp4';
        videoConfig.orientationHint = 90;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
    
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2000
        * @tc.name      : 20.orientationHint 180 (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2000', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/41.mp4';
        videoConfig.orientationHint = 180;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
    
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2100
        * @tc.name      : 21.orientationHint 270 (promise)
        * @tc.desc      : Audio recordr control test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_RECORDER_FUNCTION_PROMISE_2100', 0, async function (done) {
        let mediaTest;
        let videoRecorder = undefined;
        let surfaceID = '';
        videoConfig.url = 'file:///data/media/42.mp4';
        videoConfig.orientationHint = 270;
        await media.createVideoRecorder().then((recorder) => {
            console.info('case createVideoRecorder called');
            if (typeof (recorder) != 'undefined') {
                videoRecorder = recorder;
                expect(videoRecorder.state).assertEqual('idle');
            } else {
                console.info('case recordr is undefined!!');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoRecorder.prepare(videoConfig).then(() => {
            expect(videoRecorder.state).assertEqual('prepared');
            mediaTest = mediademo.createMediaTest();
        }, failureCallback).catch(catchCallback);

        await videoRecorder.getInputSurface().then((outPutSurface) => {
            surfaceID = outPutSurface;
            mediaTest.isExit = 0;
            mediaTest.isStart = 1;
            mediaTest.startStream(surfaceID);
        }, failureCallback).catch(catchCallback);

        await videoRecorder.start().then(() => {
            expect(videoRecorder.state).assertEqual('playing');
            console.info('case start called');
            sleep(RECORDER_TIME);
        }, failureCallback).catch(catchCallback);

        mediaTest.isExit = 1;
        mediaTest.closeStream();
    
        await videoRecorder.release().then(() => {
            expect(videoRecorder.state).assertEqual('idle');
            console.info('case release ');
        }, failureCallback).catch(catchCallback);

        done();
    })
})
