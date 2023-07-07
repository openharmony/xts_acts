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
import deviceInfo from '@ohos.deviceInfo'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import * as avVideoRecorderTestBase from '../../../../../AvVideoRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avVideoRecorderTestThree() {
    describe('avVideoRecorderTestThree', function () {
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
            fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
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

        let avProfileMpeg = {
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 100000,
            videoCodec : media.CodecMimeType.VIDEO_MPEG4,
            videoFrameWidth : 640,
            videoFrameHeight : 480,
            videoFrameRate : 30
        }
        let avConfigMpeg = {
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile : avProfileMpeg,
            url : 'fd://35',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }
        let avProfileMpegAac = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 100000,
            videoCodec : media.CodecMimeType.VIDEO_MPEG4,
            videoFrameWidth : 640,
            videoFrameHeight : 480,
            videoFrameRate : 30
        }
        let avConfigMpegAac = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile : avProfileMpegAac,
            url : 'fd://35',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }
        let avProfileH264 = {
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 100000,
            videoCodec : media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth : 640,
            videoFrameHeight : 480,
            videoFrameRate : 30
        }
        let avConfigH264 = {
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile : avProfileH264,
            url : 'fd://35',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }
        let avProfileH264Aac = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 100000,
            videoCodec : media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth : 640,
            videoFrameHeight : 480,
            videoFrameRate : 30
        }
        let avConfigH264Aac = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile : avProfileH264Aac,
            url : 'fd://35',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }

        beforeAll(async function () {
            if (deviceInfo.deviceType === 'default') {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
                avConfigMpeg.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
                avConfigMpegAac.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
                avConfigH264.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
                avConfigH264Aac.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
                avConfigMpeg.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
                avConfigMpegAac.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
                avConfigH264.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
                avConfigH264Aac.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }

            console.info('beforeAll in1');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionName5 = 'ohos.permission.CAMERA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4, permissionName5];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(2000);
            await mediaTestBase.driveFn(4)
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

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200
            * @tc.name      : 02.AVRecorder recording(audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 280000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200 start')

            avProfileMpegAac.audioBitrate = 8000
            avProfileMpegAac.audioSampleRate = 8000
            avProfileMpegAac.videoBitrate = 280000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200 end')
        })
        
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300
            * @tc.name      : 03.AVRecorder recording(audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 560000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300 start')

            avProfileMpegAac.audioBitrate = 16000
            avProfileMpegAac.audioSampleRate = 32000
            avProfileMpegAac.videoBitrate = 560000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400
            * @tc.name      : 04.AVRecorder recording(audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 1120000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400 start')

            avProfileMpegAac.audioBitrate = 32000
            avProfileMpegAac.audioSampleRate = 44100
            avProfileMpegAac.videoBitrate = 1120000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500
            * @tc.name      : 05.AVRecorder recording(audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 2240000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500 start')

            avProfileMpegAac.audioBitrate = 112000
            avProfileMpegAac.audioSampleRate = 96000
            avProfileMpegAac.videoBitrate = 2240000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600
            * @tc.name      : 06.AVRecorder recording orientationHint:90
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600 start')

            avConfigMpegAac.orientationHint = 90

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700
            * @tc.name      : 07.AVRecorder recording orientationHint:180
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700 start')

            avConfigMpegAac.orientationHint = 180

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800
            * @tc.name      : 08.AVRecorder recording orientationHint:270
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800 start')

            avConfigMpegAac.orientationHint = 270

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900
            * @tc.name      : 09.AVRecorder recording videoFrameRate:5
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900 start')

            avProfileMpegAac.videoFrameRate = 5

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000
            * @tc.name      : 10.AVRecorder recording videoFrameRate:30
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000 start')

            avProfileMpegAac.videoFrameRate = 30

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1100
            * @tc.name      : 11.AVRecorder recording videoFrameRate:60
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1100 start')

            avProfileMpegAac.videoFrameRate = 60

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpegAac, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200
            * @tc.name      : 12.AVRecorder Record MPEG4
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200 start')
            
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpeg.url = fdPath
            avVideoRecorderTestBase.avRecorderWithPromise2(avConfigMpeg, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200 end')
        })
    })
}


