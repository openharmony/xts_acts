/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';
import myScreenCaptureNdk from "libscreenCaptureNdkTest.so"
import display from '@ohos.display'
const Tag = 'screen_capture_ndk_test:'
export default function nativeApiScreenCaptureJsunit() {
    describe('napiTest', function () {
        function sleep(ms) {
           return new Promise(resolve => setTimeout(resolve, ms));
        }
        async function getPermission() {
            let permissions = ['ohos.permission.MICROPHONE', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.CAPTURE_SCREEN'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info(Tag + "request success" + JSON.stringify(data));
            })
        }
        beforeAll(async function () {
            await getPermission();
            await sleep(1000);
            let driver = UiDriver.create();
            let button = await driver.findComponent(BY.text("允许"));
            while (button) {
                await button.click();
                button = await driver.findComponent(BY.text("允许"));
            }
            await sleep(1000);
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

        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0001
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.initVideoWidthErr();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0001-------------initVideoWidthErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0002
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.initVideoHeightErr();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0002-------------initVideoHeightErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0003
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.initVideoSourceErr_YUV();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0003-------------initVideoSourceErr_YUV:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0004
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0004', 0, async function (done) {
            let a = myScreenCaptureNdk.initVideoSourceErr_ES();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0004-------------initVideoSourceErr_ES:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_WITHOUT_SOUND_DATA
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_WITHOUT_SOUND_DATA', 0, async function (done) {
            let a = myScreenCaptureNdk.screenCaptureWithoutAudioData();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_WITHOUT_SOUND_DATA-------------screenCaptureWithoutAudioData:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0001
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.initAudioSampleErr_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0001-------------initAudioSampleErr_01:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0002
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.initAudioSampleErr_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0002-------------initAudioSampleErr_02:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0003
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.initAudioSampleErr_03();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0003-------------initAudioSampleErr_03:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0004
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0004', 0, async function (done) {
            let a = myScreenCaptureNdk.initAudioChannelsErr_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0004-------------initAudioChannelsErr_01:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0005
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0005', 0, async function (done) {
            let a = myScreenCaptureNdk.initAudioChannelsErr_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0005-------------initAudioChannelsErr_02:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0006
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0006', 0, async function (done) {
            let a = myScreenCaptureNdk.initAudioSourceErr();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIO_CONFIGURE_0006-------------initAudioSourceErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AV_CONFIGURE
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AV_CONFIGURE', 0, async function (done) {
            let a = myScreenCaptureNdk.initAVErr();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AV_CONFIGURE-------------initAVErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_WITH_SOUND_DATA
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_WITH_SOUND_DATA', 0, async function (done) {
            let a = myScreenCaptureNdk.screenCaptureWithAudioData();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_WITH_SOUND_DATA-------------screenCaptureWithAudioData:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_CAPTUREMODE_0001
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CAPTUREMODE_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.initCaptureMode_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_CAPTUREMODE_0001-------------initCaptureMode_01:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_CAPTUREMODE_0002
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CAPTUREMODE_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.initCaptureMode_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_CAPTUREMODE_0002-------------initCaptureMode_02:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0001
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.initDataTypeErr_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0001-------------initDataTypeErr_01:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0002
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.initDataTypeErr_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0002-------------initDataTypeErr_02:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0003
            * @tc.name      : Test OH_AVScreenCapture_Init
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.initDataTypeErr_03();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_DATATYPE_0003-------------initDataTypeErr_03:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOSAMPLERATE_0001
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOSAMPLERATE_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.changeAudioSample_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOSAMPLERATE_0001-------------changeAudioSample_01:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOSAMPLERATE_0002
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOSAMPLERATE_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.changeAudioSample_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOSAMPLERATE_0002-------------changeAudioSample_02:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0001
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.changeAudioChannels_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0001-------------changeAudioChannels_01:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0002
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.changeAudioChannels_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0002-------------changeAudioChannels_02:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0003
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.changeAudioChannels_03();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0003-------------changeAudioChannels_03:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0004
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0004', 0, async function (done) {
            let a = myScreenCaptureNdk.changeAudioChannels_04();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_AUDIOCHANNELS_0004-------------changeAudioChannels_04:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0001
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.captureChangeVideoSize_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0001-------------captureChangeVideoSize_01:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0002
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.captureChangeVideoSize_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0002-------------captureChangeVideoSize_02:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0003
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.captureChangeVideoSize_03();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0003-------------captureChangeVideoSize_03:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_FROM_DISPLAY
            * @tc.name      : Test OH_AVScreenCapture_Init, OH_AVScreenCapture_StartScreenCapture, OH_AVScreenCapture_StopScreenCapture
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_FROM_DISPLAY', 0, async function (done) {
            const dftDisplay = display.getDefaultDisplaySync();
            let width = dftDisplay.width;
            let height = dftDisplay.height;
            let frameRate = dftDisplay.refreshRate;
            let a = myScreenCaptureNdk.screenCaptureFromDisplay(width, height, frameRate);
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_FROM_DISPLAY-------------screenCaptureFromDisplay:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0001
            * @tc.name      : Test OH_AVScreenCapture_SetCallback, OH_AVScreenCapture_AcquireVideoBuffer, OH_AVScreenCapture_AcquireVideoBuffer
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.setCallbackAcquireBuffer_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0001-------------setCallbackAcquireBuffer_01:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0002
            * @tc.name      : Test OH_AVScreenCapture_SetCallback, OH_AVScreenCapture_AcquireVideoBuffer, OH_AVScreenCapture_AcquireVideoBuffer, OH_AVScreenCapture_ReleaseAudioBuffer, OH_AVScreenCapture_ReleaseVideoBuffer
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.setCallbackAcquireBuffer_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0002-------------setCallbackAcquireBuffer_02:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0003
            * @tc.name      : Test OH_AVScreenCapture_SetCallback, OH_AVScreenCapture_AcquireVideoBuffer, OH_AVScreenCapture_AcquireVideoBuffer
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.setCallbackAcquireBuffer_03();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_BUFFERTEST_0003-------------setCallbackAcquireBuffer_03:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0001
            * @tc.name      : Test OH_AVScreenCapture_SetMicrophoneEnabled
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.setMicrophoneOpenCloseOpen();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0001-------------setMicrophoneOpenCloseOpen:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0002
            * @tc.name      : Test OH_AVScreenCapture_SetMicrophoneEnabled
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.setMicrophoneCloseOpenClose();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0002-------------setMicrophoneCloseOpenClose:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0001
            * @tc.name      : Test VideoSize and CaptureMode combination
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0001', 0, async function (done) {
            let a = myScreenCaptureNdk.configCombination_01();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0001-------------configCombination_01:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0002
            * @tc.name      : Test VideoSize and CaptureMode combination
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0002', 0, async function (done) {
            let a = myScreenCaptureNdk.configCombination_02();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0002-------------configCombination_02:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0003
            * @tc.name      : Test VideoSize and CaptureMode combination
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0003', 0, async function (done) {
            let a = myScreenCaptureNdk.configCombination_03();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0003-------------configCombination_03:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0004
            * @tc.name      : Test VideoSize and CaptureMode combination
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0004', 0, async function (done) {
            let a = myScreenCaptureNdk.configCombination_04();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0004-------------configCombination_04:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE
            * @tc.name      : Test Multi Instance
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE', 0, async function (done) {
            let a = myScreenCaptureNdk.multiInstance();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE-------------multiInstance:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_SCREEN_CAPTURE_INNER_AUDIO
            * @tc.name      : Test Multi Instance
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('SUB_MULTIMEDIA_SCREEN_CAPTURE_INNER_AUDIO', 0, async function (done) {
            let a = myScreenCaptureNdk.innerAudioAndMicAudio();
            console.info(Tag + "SUB_MULTIMEDIA_SCREEN_CAPTURE_INNER_AUDIO-------------innerAudioAndMicAudio:" + a);
            expect(a).assertEqual(0)
            done()
        })
    })
}