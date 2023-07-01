/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import featureAbility from '@ohos.ability.featureAbility';
import { UiDriver, BY } from '@ohos.UiTest'
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
// @ts-ignore
import myaudioNdk from "libaudioNdkTest.so"
const Tag = 'audio_ndk_test:'
export default function nativeApiImageJsunit() {
    describe('napiTest', function () {
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        async function getPermission() {
            let permissions = ['ohos.permission.MICROPHONE'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info(Tag + "request success" + JSON.stringify(data));
            })
        }
        async function driveFn() {
            console.info(Tag + `come in driveFn`);
            let driver = await UiDriver.create();
            console.info(Tag + `driver is ${JSON.stringify(driver)}`);
            await sleep(100);
            console.info(Tag + `UiDriver start`);
            let button = await driver.findComponent(BY.text('允许'));
            console.info(Tag + `button is ${JSON.stringify(button)}`);
            await sleep(100);
            await button.click();
        }
        beforeAll(async function () {
            await getPermission();
            await sleep(100);
            await driveFn();
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
            * @tc.number    : TC_001
            * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('TC_001', 0, async function (done) {
            let a = myaudioNdk.createAudioCapture();
            console.info(Tag + "TC_001-------------createAudioCapture:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : TC_002
            * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('TC_002', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGenerate();
            console.info(Tag, "TC_002-------------audioCaptureGenerate:" + a);
            expect(a).assertEqual(0)
            done()
        })

        /* *
            * @tc.number    : TC_003
            * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('TC_003', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGenerateErr();
            console.info("TC_003-------------audioCaptureGenerateErr:" + a);
            expect(a).assertEqual(1)
            done()
        })

        /* *
            * @tc.number    : TC_004
            * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('TC_004', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStart();
            console.info("TC_004-------------audioCaptureStart:" + a);
            expect(a).assertEqual(0)
            done()
        })

        /* *
            * @tc.number    : TC_005
            * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */
        it('TC_005', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStartErr();
            console.info("TC_005-------------audioCaptureStartErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_006
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_006', 0, async function (done) {
            let a = myaudioNdk.audioCapturePause();
            console.info("TC_006-------------audioCapturePause:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_007
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_007', 0, async function (done) {
            let a = myaudioNdk.audioCapturePauseErr();
            console.info("TC_007-------------audioCapturePauseErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_008
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_008', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStop();
            console.info("TC_008-------------audioCaptureStop:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_009
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_009', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStopErr();
            console.info("TC_009-------------audioCaptureStopErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_010
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_010', 0, async function (done) {
            let a = myaudioNdk.audioCaptureFlush();
            console.info("TC_010-------------audioCaptureFlush:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_011
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_011', 0, async function (done) {
            let a = myaudioNdk.audioCaptureFlushErr();
            console.info("TC_011-------------audioCaptureFlushErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_012
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_012', 0, async function (done) {
            let a = myaudioNdk.audioCaptureRelease();
            console.info("TC_012-------------audioCaptureRelease:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_013
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_013', 0, async function (done) {
            let a = myaudioNdk.audioCaptureReleaseErr();
            console.info("TC_013-------------audioCaptureReleaseErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_014
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_014', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetParameter();
            console.info("TC_014-------------audioCaptureGetParameter:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_015
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_015', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetCurrentState();
            console.info("TC_015-------------audioCaptureGetCurrentState:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_016
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_016', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetStreamId();
            console.info("TC_016-------------audioCaptureGetStreamId:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_017
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_017', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetSamplingRate();
            console.info("TC_017-------------audioCaptureGetSamplingRate:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_018
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_018', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetSampleFormat();
            console.info("TC_018-------------audioCaptureGetSampleFormat:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_019
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_019', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetEncodingType();
            console.info("TC_019-------------audioCaptureGetEncodingType:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_020
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_020', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetCapturerInfo();
            console.info("TC_020-------------audioCaptureGetCapturerInfo:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_021
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_021', 0, async function (done) {
            let a = myaudioNdk.audioRenderGenerate();
            console.info("TC_021-------------audioRenderGenerate:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_022
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_022', 0, async function (done) {
            let a = myaudioNdk.audioRenderGenerateErr();
            console.info("TC_022-------------audioRenderGenerateErr:" + a);
            expect(a).assertEqual(1)
            done()
        })
        /* *
           * @tc.number    : TC_023
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_023', 0, async function (done) {
            let a = myaudioNdk.audioRenderStart();
            console.info("TC_023-------------audioRenderStart:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_024
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_024', 0, async function (done) {
            let a = myaudioNdk.audioRenderStartErr();
            console.info("TC_024-------------audioRenderStartErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_025
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_025', 0, async function (done) {
            let a = myaudioNdk.audioRenderPause();
            console.info("TC_025-------------audioRenderPause:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_026
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_026', 0, async function (done) {
            let a = myaudioNdk.audioRenderPauseErr();
            console.info("TC_026-------------audioRenderPauseErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_027
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_027', 0, async function (done) {
            let a = myaudioNdk.audioRenderStop();
            console.info("TC_027-------------audioRenderStop:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_028
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_028', 0, async function (done) {
            let a = myaudioNdk.audioRenderStopErr();
            console.info("TC_028-------------audioRenderStopErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_029
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_029', 0, async function (done) {
            let a = myaudioNdk.audioRenderFlush();
            console.info("TC_029-------------audioRenderFlush:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_030
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_030', 0, async function (done) {
            let a = myaudioNdk.audioRenderFlushErr();
            console.info("TC_030-------------audioRenderFlushErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_031
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_031', 0, async function (done) {
            let a = myaudioNdk.audioRenderRelease();
            console.info("TC_031-------------audioRenderRelease:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_032
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_032', 0, async function (done) {
            let a = myaudioNdk.audioRenderReleaseErr();
            console.info("TC_032-------------audioRenderReleaseErr:" + a);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : TC_033
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_033', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetCurrentState();
            console.info("TC_033-------------audioRenderGetCurrentState:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_034
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_034', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetParameter();
            console.info("TC_034-------------audioRenderGetParameter:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_035
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_035', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetStreamId();
            console.info("TC_035-------------audioRenderGetStreamId:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_036
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_036', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetSamplingRate();
            console.info("TC_036-------------audioRenderGetSamplingRate:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_037
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_037', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetSampleFormat();
            console.info("TC_037-------------audioRenderGetSampleFormat:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_038
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_038', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetEncodingType();
            console.info("TC_038-------------audioRenderGetEncodingType:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_039
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_039', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetRendererInfo();
            console.info("TC_039-------------audioRenderGetRendererInfo:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_040
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_040', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetSamplingRate();
            console.info("TC_040-------------audioStreamBuilderSetSamplingRate:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_041
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_041', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetChannelCount();
            console.info("TC_041-------------audioStreamBuilderSetChannelCount:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_042
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_042', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetSampleFormat();
            console.info("TC_042-------------audioStreamBuilderSetSampleFormat:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_043
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_043', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetEncodingType();
            console.info("TC_043-------------audioStreamBuilderSetEncodingType:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_044
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_044', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetLatencyMode();
            console.info("TC_044-------------audioStreamBuilderSetLatencyMode:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_045
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_045', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetRendererInfo();
            console.info("TC_045-------------audioStreamBuilderSetRendererInfo:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_046
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_046', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetCapturerInfo();
            console.info("TC_046-------------audioStreamBuilderSetCapturerInfo:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_047
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_047', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetRendererCallback();
            console.info("TC_047-------------audioStreamBuilderSetRendererCallback:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_048
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_048', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetCapturerCallback();
            console.info("TC_048-------------audioStreamBuilderSetCapturerCallback:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_049
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_049', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetChannelCount();
            console.info("TC_049-------------audioCaptureGetChannelCount:" + a);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : TC_050
           * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
           * @tc.desc      :
           * @tc.size      :
           * @tc.type      : Functional
           * @tc.level     : FWK Layer
       */
        it('TC_050', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetChannelCount();
            console.info("TC_050-------------audioRenderGetChannelCount:" + a);
            expect(a).assertEqual(0)
            done()
        })
    })
}
