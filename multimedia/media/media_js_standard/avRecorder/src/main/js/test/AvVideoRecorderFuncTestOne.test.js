/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import deviceInfo from '@ohos.deviceInfo'
import media from '@ohos.multimedia.media'
import camera from '@ohos.multimedia.camera'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import * as avVideoRecorderTestBase from '../../../../../AvVideoRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avVideoRecorderTestOne() {
    describe('avVideoRecorderTestOne', function () {
        let avRecorder = null;
        const recorderTime = 3000;
        const RECORDER_LONG_TIME = 3600000;
        const LOOP_TIMES = 1000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let fdObject;
        let fdPath;
        let TAG = "[avVideoRecorderTestOne] ";
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 100000, // 视频比特率
            videoCodec : media.CodecMimeType.VIDEO_MPEG4,
            videoFrameWidth : 640,  // 视频分辨率的宽
            videoFrameHeight : 480, // 视频分辨率的高
            videoFrameRate : 30 // 视频帧率
        }

        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile : avProfile,
            url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
            rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
            location : { latitude : 30, longitude : 130 },
        }

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        beforeAll(async function () {
            console.info('beforeAll in1');
            if (deviceInfo.deviceType === 'default') {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
                console.info(TAG + 'rk3568 avConfig.videoSourceType is :' + avConfig.videoSourceType)
            } else {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
                console.info(TAG + 'rk3568 avConfig.videoSourceType is :' + avConfig.videoSourceType)
            }
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionName5 = 'ohos.permission.CAMERA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4, permissionName5];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(3000);
            await mediaTestBase.driveFn(3)
            console.info('beforeAll out');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await avRecorderTestBase.sleep(1000);
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avRecorder != null) {
                avRecorder.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            await avRecorderTestBase.sleep(1000);
        })

        afterAll(function () {
            // mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            console.info('afterAll case');
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100
            * @tc.name      : 001.test 1，record 3s； 2，pause 3，resume 4，stop 5，restart
            * @tc.desc      : Recorder video 1，record 3s； 2，pause 3，resume 4，stop 5，restart
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise1(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise2(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise3(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise4(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise5(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise6(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise7(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 end')
        })


        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResumePromise8(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100
            * @tc.name      : 001.test create-stop
            * @tc.desc      : Recorder video create-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderStopPromise1(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200
            * @tc.name      : 001.test prepare-stop
            * @tc.desc      : Recorder video prepare-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderStopPromise2(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700
            * @tc.name      : 001.test getInputSurface-stop
            * @tc.desc      : Recorder video getInputSurface-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderStopPromise7(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700
            * @tc.name      : 001.test create-prepare-getInputSurface-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.avRecorderResetPromise7(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 end')
        })
    })
}

