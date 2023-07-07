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

import media from '@ohos.multimedia.media'
import camera from '@ohos.multimedia.camera'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import * as avVideoRecorderTestBase from '../../../../../AvVideoRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import deviceInfo from '@ohos.deviceInfo'

export default function avVideoRecorderTestTwo() {
    describe('avVideoRecorderTestTwo', function () {
        let avRecorder = null;
        const RECORDER_TIME = 3000;
        const RECORDER_LONG_TIME = 3600000;
        const LOOP_TIMES = 1000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let fdObject;
        let fdPath;
        let TAG = "[avVideoRecorderTest] ";
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
            location : { latitude : 30, longitude : 130 }
        }

        beforeAll(async function () {
            console.info('beforeAll in1');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionName5 = 'ohos.permission.CAMERA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4, permissionName5];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(2000);
            await mediaTestBase.driveFn(4);
            if (deviceInfo.deviceType === 'default') {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            console.info('beforeAll out');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await avRecorderTestBase.sleep(3000);
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avRecorder != null) {
                avRecorder.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            await avRecorderTestBase.sleep(1000);
            await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })

        // promise prepare
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100
            * @tc.name      : 01. create->prepare
            * @tc.desc      : 1.create 2.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;            
            avVideoRecorderTestBase.create2PreparePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200
            * @tc.name      : 02. start->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.start2PreparePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200 end')
        })

         /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300
            * @tc.name      : 03. pause->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.pause2PreparePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300 end')
        })

         /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400
            * @tc.name      : 04. resume->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.resume 6.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.resume2PreparePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500
            * @tc.name      : 05. stop->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.stop 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.stop2PreparePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600
            * @tc.name      : 06. reset->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.reset 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.reset2PreparePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700
            * @tc.name      : 07. getInputSurface->prepare
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.getInputSurface2PreparePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800
            * @tc.name      : 08. prepare 3 times
            * @tc.desc      : 1.create 2.prepare 3.prepare 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            avVideoRecorderTestBase.prepare3TimesPromise(avConfig, avRecorder, loopTimes, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900
            * @tc.name      : 09.audioBitrate -1
            * @tc.desc      : 1.create 2.prepare (audioBitrate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 start')
            let avNewProfile = {
                audioBitrate : -1,
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
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                 avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000
            * @tc.name      : 10.audioSampleRate -1
            * @tc.desc      : 1.create 2.prepare (audioSampleRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : -1,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                 avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100
            * @tc.name      : 11.videoBitrateRange -1
            * @tc.desc      : 1.create 2.prepare (videoBitrateRange -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : -1, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                 avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200
            * @tc.name      : 12.videoFrameRate -1
            * @tc.desc      : 1.create 2.prepare (videoFrameRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : -1 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                 avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 end')
        })

        // Promise getInputSurface
       /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100
            * @tc.name      : 01. create->getInputSurface
            * @tc.desc      : 1.create 2.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200
            * @tc.name      : 02. prepare->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise2(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300
            * @tc.name      : 03. start->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise3(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400
            * @tc.name      : 04. pause->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise4(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500
            * @tc.name      : 05. resume->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise5(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600
            * @tc.name      : 06. stop->getInputSurface
            * @tc.desc      :1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise6(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700
            * @tc.name      : 07. reset->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2GetInputSurfacePromise7(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800
            * @tc.name      : 08. getInputSurface 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            avVideoRecorderTestBase.getInputSurface3TimesPromise(avConfig, avRecorder, loopTimes, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800 end')
        })

        // Promise start 
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100
            * @tc.name      : 01. create->start
            * @tc.desc      : 1.create 2.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200
            * @tc.name      : 02. prepare->start
            * @tc.desc      : 1.create 2.prepare 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.prepare2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300
            * @tc.name      : 03. pause->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.pause2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400
            * @tc.name      : 04. resume->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.resume2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500
            * @tc.name      : 05. stop->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.stop2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600
            * @tc.name      : 06. reset->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.reset2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700
            * @tc.name      : 07. getInputSurface->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.getInputSurface2StartPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800
            * @tc.name      : 08. start 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.start 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            avVideoRecorderTestBase.start3TimesPromise(avConfig, avRecorder, RECORDER_TIME, loopTimes, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800 end')
        })

        // Promise pause
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100
            * @tc.name      : 01. create->pause
            * @tc.desc      : 1.create 2.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.create2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200
            * @tc.name      : 02. prepare->pause
            * @tc.desc      : 1.create 2.prepare 3.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.prepare2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300
            * @tc.name      : 03. start->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.start2PausePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400
            * @tc.name      : 04. resume->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.resume2PausePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500
            * @tc.name      : 05. stop->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.stop2PausePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600
            * @tc.name      : 06. reset->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.reset2PausePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700
            * @tc.name      : 07. getInputSurface->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.getInputSurface2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800
            * @tc.name      : 08. pause 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.pause 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            avVideoRecorderTestBase.pause3TimesPromise(avConfig, avRecorder, RECORDER_TIME, loopTimes, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800 end')
        })

        // 状态切换
        // 01.promise回调方式
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100
            * @tc.name      : 01.AVRecorder test recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.recordStart2ReleaseWithPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200
            * @tc.name      : 02.AVRecorder test recording 3 seconds to pause
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.recordStart2PauseWithPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300
            * @tc.name      : 03.AVRecorder test recording 3 seconds to pause to resume
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.recordStart2ResumeWithPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400
            * @tc.name      : 04.AVRecorder test recording 3 seconds to stop
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.recordStart2StopWithPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500
            * @tc.name      : 05.AVRecorder test recording 3 seconds to reset
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avVideoRecorderTestBase.recordStart2ResetWithPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500 end')
        })
    })
}

