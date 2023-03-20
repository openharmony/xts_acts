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
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avRecorderTest() {
    describe('avRecorderTest', function () {
        let avRecorder = null;

        const AV_SOURCES = [
            'audio_1.m4a',
            'audio_2.m4a',
            'audio_3.m4a',
            'audio_4.m4a',
            'audio_5.m4a',
            'audio_6.m4a',
            'audio_7.m4a',
            'audio_8.m4a',
            'audio_9.m4a',
            'audio_10.m4a',
            'audio_11.m4a',
            'audio_12.m4a'
        ]

        const RECORDER_TIME = 3000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let fdObject;
        let fdPath;

        let TAG = "[AudioRecorderLocalTest] ";
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioSampleRate : 48000,
            audioCodec : ENCORDER_AAC,
            fileFormat : FORMAT_M4A,
        }
        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            profile : avProfile,
            url : 'fd://',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }

        beforeAll(async function () {
            console.info('beforeAll in1');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(5000);
            console.info('beforeAll out');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            console.info('afterAll case');
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100
            * @tc.name      : 001.test pause
            * @tc.desc      : Local Video 001.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 start')
            fdObject = await mediaTestBase.getAvRecorderFd(AV_SOURCES[0], "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderWithCallBack(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100
            * @tc.name      : 001.test pause->prepare
            * @tc.desc      : Local Video 01.pause->prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 start')
            fdObject = await mediaTestBase.getAvRecorderFd(AV_SOURCES[1], "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest01(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200
            * @tc.name      : 001.test prepare without callback
            * @tc.desc      : Local Video prepare without callback
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 start')
            fdObject = await mediaTestBase.getAvRecorderFd(AV_SOURCES[2], "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest02(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300
            * @tc.name      : 001.test prepare with callback
            * @tc.desc      : Local Video prepare with callback
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 start')
            fdObject = await mediaTestBase.getAvRecorderFd(AV_SOURCES[3], "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest03(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400
            * @tc.name      : 001.test resume->prepare
            * @tc.desc      : Local audio resume->prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 start')
            fdObject = await mediaTestBase.getAvRecorderFd(AV_SOURCES[4], "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest03(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 end')
        })
    })

}

