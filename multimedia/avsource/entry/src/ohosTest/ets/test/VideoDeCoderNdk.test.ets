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

import { describe, it, expect } from "@ohos/hypium"
import videodecoderndk from 'libvideodecoderndk.so'

export default function videoDeCoderNdkTest() {
    describe('AvcodecVideoDecoderTest', () => {

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_CREATEBYMIME_0100
         * @tc.name       : testOHVideoDecoderCreateByMime001
         * @tc.desc       : test OH_VideoDecoder_CreateByMime
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderCreateByMime001', 0, async (done: Function) => {
            try { 
                let result: number = videodecoderndk.oHVideoDecoderCreateByMime();
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderCreateByMime001 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_CREATEBYNAME_0100
         * @tc.name       : testOHVideoDecoderCreateByName001
         * @tc.desc       : test OH_VideoDecoder_CreateByName
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderCreateByName001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderCreateByName();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_DESTROY_0100
         * @tc.name       : testOHVideoDecoderDestroy001
         * @tc.desc       : test OH_VideoDecoder_Destroy
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderDestroy001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderDestroy();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_SETCALLBACK_0100
         * @tc.name       : testOHVideoDecoderSetCallback001
         * @tc.desc       : test OH_VideoDecoder_SetCallback
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderSetCallback001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderSetCallback();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_REGISTERCALLBACK_0100
         * @tc.name       : testOHVideoDecoderRegisterCallback001
         * @tc.desc       : test OH_VideoDecoder_RegisterCallback
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderRegisterCallback001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderRegisterCallback();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_CONFIGURE_0100
         * @tc.name       : testOHVideoDecoderConfigure001
         * @tc.desc       : test OH_VideoDecoder_Configure
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderConfigure001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderConfigure();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_PREPARE_0100
         * @tc.name       : testOHVideoDecoderPrepare001
         * @tc.desc       : test OH_VideoDecoder_Prepare
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderPrepare001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderPrepare();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0100
         * @tc.name       : testOHVideoDecoderStart001
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 1, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0200
         * @tc.name       : testOHVideoDecoderStart002
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart002', 0, async (done: Function) => {
            try {
                let result: number = videodecoderndk.oHVideoDecoderStart(2, 1, 1, 1, 1, 1);
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderStart002 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0300
         * @tc.name       : testOHVideoDecoderStart003
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart003', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0400
         * @tc.name       : testOHVideoDecoderStart004
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart004', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(-1);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0500
         * @tc.name       : testOHVideoDecoderStart005
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart005', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0600
         * @tc.name       : testOHVideoDecoderStart006
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart006', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0700
         * @tc.name       : testOHVideoDecoderStart007
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart007', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0800
         * @tc.name       : testOHVideoDecoderStart008
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart008', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0900
         * @tc.name       : testOHVideoDecoderStart009
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart009', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1000
         * @tc.name       : testOHVideoDecoderStart010
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart010', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1100
         * @tc.name       : testOHVideoDecoderStart011
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart011', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1200
         * @tc.name       : testOHVideoDecoderStart012
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart012', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1300
         * @tc.name       : testOHVideoDecoderStart013
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart013', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1400
         * @tc.name       : testOHVideoDecoderStart014
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart014', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1500
         * @tc.name       : testOHVideoDecoderStart015
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart015', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1600
         * @tc.name       : testOHVideoDecoderStart016
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart016', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1700
         * @tc.name       : testOHVideoDecoderStart017
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart017', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1800
         * @tc.name       : testOHVideoDecoderStart018
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart018', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1900
         * @tc.name       : testOHVideoDecoderStart019
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart019', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2000
         * @tc.name       : testOHVideoDecoderStart020
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart020', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2100
         * @tc.name       : testOHVideoDecoderStart021
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart021', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2200
         * @tc.name       : testOHVideoDecoderStart022
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart022', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2300
         * @tc.name       : testOHVideoDecoderStart023
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart023', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2400
         * @tc.name       : testOHVideoDecoderStart024
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart024', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2500
         * @tc.name       : testOHVideoDecoderStart025
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart025', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2600
         * @tc.name       : testOHVideoDecoderStart026
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart026', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2700
         * @tc.name       : testOHVideoDecoderStart027
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart027', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2800
         * @tc.name       : testOHVideoDecoderStart028
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart028', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2900
         * @tc.name       : testOHVideoDecoderStart029
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart029', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3000
         * @tc.name       : testOHVideoDecoderStart030
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart030', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3100
         * @tc.name       : testOHVideoDecoderStart031
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart031', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3200
         * @tc.name       : testOHVideoDecoderStart032
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart032', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3300
         * @tc.name       : testOHVideoDecoderStart033
         * @tc.desc       : test OH_VideoDecoder_Start
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStart033', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0100
         * @tc.name       : testOHVideoDecoderStop001
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 1, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0200
         * @tc.name       : testOHVideoDecoderStop002
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop002', 0, async (done: Function) => {
            try { 
                let result: number = videodecoderndk.oHVideoDecoderStop(2, 1, 1, 1, 1, 1, 1);
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderStop002 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0300
         * @tc.name       : testOHVideoDecoderStop003
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop003', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0400
         * @tc.name       : testOHVideoDecoderStop004
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop004', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 0, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0500
         * @tc.name       : testOHVideoDecoderStop005
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop005', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0600
         * @tc.name       : testOHVideoDecoderStop006
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop006', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(-1);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0700
         * @tc.name       : testOHVideoDecoderStop007
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop007', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0800
         * @tc.name       : testOHVideoDecoderStop008
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop008', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 0, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0900
         * @tc.name       : testOHVideoDecoderStop009
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop009', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1000
         * @tc.name       : testOHVideoDecoderStop010
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop010', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1100
         * @tc.name       : testOHVideoDecoderStop011
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop011', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1200
         * @tc.name       : testOHVideoDecoderStop012
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop012', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1300
         * @tc.name       : testOHVideoDecoderStop013
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop013', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1400
         * @tc.name       : testOHVideoDecoderStop014
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop014', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1500
         * @tc.name       : testOHVideoDecoderStop015
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop015', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1600
         * @tc.name       : testOHVideoDecoderStop016
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop016', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1700
         * @tc.name       : testOHVideoDecoderStop017
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop017', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1800
         * @tc.name       : testOHVideoDecoderStop018
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop018', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1900
         * @tc.name       : testOHVideoDecoderStop019
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop019', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2000
         * @tc.name       : testOHVideoDecoderStop020
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop020', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2100
         * @tc.name       : testOHVideoDecoderStop021
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop021', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2200
         * @tc.name       : testOHVideoDecoderStop022
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop022', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2300
         * @tc.name       : testOHVideoDecoderStop023
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop023', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2400
         * @tc.name       : testOHVideoDecoderStop024
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop024', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2500
         * @tc.name       : testOHVideoDecoderStop025
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop025', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2600
         * @tc.name       : testOHVideoDecoderStop026
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop026', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2700
         * @tc.name       : testOHVideoDecoderStop027
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop027', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2800
         * @tc.name       : testOHVideoDecoderStop028
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop028', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2900
         * @tc.name       : testOHVideoDecoderStop029
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop029', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3000
         * @tc.name       : testOHVideoDecoderStop030
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop030', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3100
         * @tc.name       : testOHVideoDecoderStop031
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop031', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3200
         * @tc.name       : testOHVideoDecoderStop032
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop032', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3300
         * @tc.name       : testOHVideoDecoderStop033
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop033', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3400
         * @tc.name       : testOHVideoDecoderStop034
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop034', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3500
         * @tc.name       : testOHVideoDecoderStop035
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop035', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3600
         * @tc.name       : testOHVideoDecoderStop036
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop036', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3700
         * @tc.name       : testOHVideoDecoderStop037
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop037', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3800
         * @tc.name       : testOHVideoDecoderStop038
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop038', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3900
         * @tc.name       : testOHVideoDecoderStop039
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop039', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4000
         * @tc.name       : testOHVideoDecoderStop040
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop040', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4100
         * @tc.name       : testOHVideoDecoderStop041
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop041', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4200
         * @tc.name       : testOHVideoDecoderStop042
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop042', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4300
         * @tc.name       : testOHVideoDecoderStop043
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop043', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4400
         * @tc.name       : testOHVideoDecoderStop044
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop044', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4500
         * @tc.name       : testOHVideoDecoderStop045
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop045', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4600
         * @tc.name       : testOHVideoDecoderStop046
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop046', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4700
         * @tc.name       : testOHVideoDecoderStop047
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop047', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4800
         * @tc.name       : testOHVideoDecoderStop048
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop048', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4900
         * @tc.name       : testOHVideoDecoderStop049
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop049', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5000
         * @tc.name       : testOHVideoDecoderStop050
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop050', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5100
         * @tc.name       : testOHVideoDecoderStop051
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop051', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5200
         * @tc.name       : testOHVideoDecoderStop052
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop052', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5300
         * @tc.name       : testOHVideoDecoderStop053
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop053', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5400
         * @tc.name       : testOHVideoDecoderStop054
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop054', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5500
         * @tc.name       : testOHVideoDecoderStop055
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop055', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5600
         * @tc.name       : testOHVideoDecoderStop056
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop056', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5700
         * @tc.name       : testOHVideoDecoderStop057
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop057', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5800
         * @tc.name       : testOHVideoDecoderStop058
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop058', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5900
         * @tc.name       : testOHVideoDecoderStop059
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop059', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6000
         * @tc.name       : testOHVideoDecoderStop060
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop060', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6100
         * @tc.name       : testOHVideoDecoderStop061
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop061', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6200
         * @tc.name       : testOHVideoDecoderStop062
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop062', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6300
         * @tc.name       : testOHVideoDecoderStop063
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop063', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6400
         * @tc.name       : testOHVideoDecoderStop064
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop064', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6500
         * @tc.name       : testOHVideoDecoderStop065
         * @tc.desc       : test OH_VideoDecoder_Stop
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderStop065', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0100
         * @tc.name       : testOHVideoDecoderFlush001
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 1, 1, 1);
            expect(result).assertEqual(0);
            done();
        });