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
import videoencoderndk from 'libvideoencoderndk.so'

export default function videoEnCoderNdkTest() {
  describe('AvcodecVideoEncoderTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYMIME_0100
     * @tc.name       : testOHVideoEncoderCreateByMime001
     * @tc.desc       : test OH_VideoEncoder_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderCreateByMime001', 0, async (done: Function) => {
        try { 
            let result: number = videoencoderndk.oHVideoEncoderCreateByMime();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderCreateByMime001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYMIME_0200
     * @tc.name       : testOHVideoEncoderCreateByMime002
     * @tc.desc       : test OH_VideoEncoder_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderCreateByMime002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderCreateByMimeHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderCreateByMime002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYMIME_0300
     * @tc.name       : testOHVideoEncoderCreateByMime003
     * @tc.desc       : test OH_VideoEncoder_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderCreateByMime003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderCreateByMimeAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYNAME_0100
     * @tc.name       : testOHVideoEncoderCreateByName001
     * @tc.desc       : test OH_VideoEncoder_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderCreateByName001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderCreateByName();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderCreateByName001 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYNAME_0200
     * @tc.name       : testOHVideoEncoderCreateByName002
     * @tc.desc       : test OH_VideoEncoder_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderCreateByName002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderCreateByNameHEVC();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderCreateByName002 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYNAME_0300
     * @tc.name       : testOHVideoEncoderCreateByName003
     * @tc.desc       : test OH_VideoEncoder_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderCreateByName003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderCreateByNameAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_DESTROY_0100
     * @tc.name       : testOHVideoEncoderDestroy001
     * @tc.desc       : test OH_VideoEncoder_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderDestroy001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderDestroy();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderDestroy001 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_DESTROY_0200
     * @tc.name       : testOHVideoEncoderDestroy002
     * @tc.desc       : test OH_VideoEncoder_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderDestroy002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderDestroyHEVC();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderDestroy002 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_DESTROY_0300
     * @tc.name       : testOHVideoEncoderDestroy003
     * @tc.desc       : test OH_VideoEncoder_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderDestroy003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderDestroyAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETCALLBACK_0100
     * @tc.name       : testOHVideoEncoderSetCallback001
     * @tc.desc       : test OH_VideoEncoder_SetCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderSetCallback001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderSetCallback();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderSetCallback001 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETCALLBACK_0200
     * @tc.name       : testOHVideoEncoderSetCallback002
     * @tc.desc       : test OH_VideoEncoder_SetCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderSetCallback002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderSetCallbackHEVC();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderSetCallback002 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETCALLBACK_0300
     * @tc.name       : testOHVideoEncoderSetCallback003
     * @tc.desc       : test OH_VideoEncoder_SetCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderSetCallback003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderSetCallbackAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_REGISTERCALLBACK_0100
     * @tc.name       : testOHVideoEncoderRegisterCallback001
     * @tc.desc       : test OH_VideoEncoder_RegisterCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderRegisterCallback001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderRegisterCallback();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderRegisterCallback001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_REGISTERCALLBACK_0200
     * @tc.name       : testOHVideoEncoderRegisterCallback002
     * @tc.desc       : test OH_VideoEncoder_RegisterCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderRegisterCallback002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderRegisterCallbackHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderRegisterCallback002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_REGISTERCALLBACK_0300
     * @tc.name       : testOHVideoEncoderRegisterCallback003
     * @tc.desc       : test OH_VideoEncoder_RegisterCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderRegisterCallback003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderRegisterCallbackAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0100
     * @tc.name       : testOHVideoEncoderConfigure001
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderConfigure();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderConfigure001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0200
     * @tc.name       : testOHVideoEncoderConfigure002
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderConfigureHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderConfigure002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0300
     * @tc.name       : testOHVideoEncoderConfigure003
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0400
     * @tc.name       : testOHVideoEncoderConfigure004
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure004', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0500
     * @tc.name       : testOHVideoEncoderConfigure005
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure005', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal3();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0600
     * @tc.name       : testOHVideoEncoderConfigure006
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure006', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0700
     * @tc.name       : testOHVideoEncoderConfigure007
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure007', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0800
     * @tc.name       : testOHVideoEncoderConfigure008
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure008', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal6();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0900
     * @tc.name       : testOHVideoEncoderConfigure009
     * @tc.desc       : test OH_VideoEncoder_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderConfigure009', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal7();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0100
     * @tc.name       : testOHVideoEncoderPrepare001
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepare();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0200
     * @tc.name       : testOHVideoEncoderPrepare002
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare004', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal2();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare005', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal3();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare006', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal4();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare007', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare008', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal6();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare009', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal7();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare010', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare011', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal9();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare012', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal10();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare013', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal11();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare014', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal12();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare015', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal13();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare016', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal14();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.name       : testOHVideoEncoderPrepare003
     * @tc.desc       : test OH_VideoEncoder_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderPrepare017', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal15();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0100
     * @tc.name       : testOHVideoEncoderStart001
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStart001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0200
     * @tc.name       : testOHVideoEncoderStart002
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStart(2,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStart002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0300
     * @tc.name       : testOHVideoEncoderStart003
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0400
     * @tc.name       : testOHVideoEncoderStart004
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart004', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStart004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0500
     * @tc.name       : testOHVideoEncoderStart005
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart005', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0600
     * @tc.name       : testOHVideoEncoderStart006
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart006', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0700
     * @tc.name       : testOHVideoEncoderStart007
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart007', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0800
     * @tc.name       : testOHVideoEncoderStart008
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart008', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0900
     * @tc.name       : testOHVideoEncoderStart009
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart009', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1000
     * @tc.name       : testOHVideoEncoderStart010
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart010', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1100
     * @tc.name       : testOHVideoEncoderStart011
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart011', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1200
     * @tc.name       : testOHVideoEncoderStart012
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart012', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1300
     * @tc.name       : testOHVideoEncoderStart013
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart013', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1400
     * @tc.name       : testOHVideoEncoderStart014
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart014', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1500
     * @tc.name       : testOHVideoEncoderStart015
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart015', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1600
     * @tc.name       : testOHVideoEncoderStart016
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart016', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1700
     * @tc.name       : testOHVideoEncoderStart017
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart017', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1800
     * @tc.name       : testOHVideoEncoderStart018
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart018', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1900
     * @tc.name       : testOHVideoEncoderStart019
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart019', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2000
     * @tc.name       : testOHVideoEncoderStart020
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart020', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2100
     * @tc.name       : testOHVideoEncoderStart021
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart021', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2200
     * @tc.name       : testOHVideoEncoderStart022
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart022', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2300
     * @tc.name       : testOHVideoEncoderStart023
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart023', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2400
     * @tc.name       : testOHVideoEncoderStart024
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart024', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2500
     * @tc.name       : testOHVideoEncoderStart025
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart025', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2600
     * @tc.name       : testOHVideoEncoderStart026
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart026', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2700
     * @tc.name       : testOHVideoEncoderStart027
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart027', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2800
     * @tc.name       : testOHVideoEncoderStart028
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart028', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2900
     * @tc.name       : testOHVideoEncoderStart029
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart029', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3000
     * @tc.name       : testOHVideoEncoderStart030
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart030', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3100
     * @tc.name       : testOHVideoEncoderStart031
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart031', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3200
     * @tc.name       : testOHVideoEncoderStart032
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart032', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3300
     * @tc.name       : testOHVideoEncoderStart033
     * @tc.desc       : test OH_VideoEncoder_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStart033', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0100
     * @tc.name       : testOHVideoEncoderStop001
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop001', 0, async (done: Function) => {
        try{
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0200
     * @tc.name       : testOHVideoEncoderStop002
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop002', 0, async (done: Function) => {
        try{
            let result: number = videoencoderndk.oHVideoEncoderStop(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0300
     * @tc.name       : testOHVideoEncoderStop003
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0400
     * @tc.name       : testOHVideoEncoderStop004
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop004', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,0,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0500
     * @tc.name       : testOHVideoEncoderStop005
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop005', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0600
     * @tc.name       : testOHVideoEncoderStop006
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop006', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0700
     * @tc.name       : testOHVideoEncoderStop007
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop007', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0800
     * @tc.name       : testOHVideoEncoderStop008
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop008', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,0,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0900
     * @tc.name       : testOHVideoEncoderStop009
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop009', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1000
     * @tc.name       : testOHVideoEncoderStop010
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop010', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1100
     * @tc.name       : testOHVideoEncoderStop011
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop011', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1200
     * @tc.name       : testOHVideoEncoderStop012
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop012', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1300
     * @tc.name       : testOHVideoEncoderStop013
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop013', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1400
     * @tc.name       : testOHVideoEncoderStop014
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop014', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1500
     * @tc.name       : testOHVideoEncoderStop015
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop015', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1600
     * @tc.name       : testOHVideoEncoderStop016
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop016', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1700
     * @tc.name       : testOHVideoEncoderStop017
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop017', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1800
     * @tc.name       : testOHVideoEncoderStop018
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop018', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1900
     * @tc.name       : testOHVideoEncoderStop019
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop019', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2000
     * @tc.name       : testOHVideoEncoderStop020
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop020', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2100
     * @tc.name       : testOHVideoEncoderStop021
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop021', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2200
     * @tc.name       : testOHVideoEncoderStop022
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop022', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2300
     * @tc.name       : testOHVideoEncoderStop023
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop023', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2400
     * @tc.name       : testOHVideoEncoderStop024
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop024', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2500
     * @tc.name       : testOHVideoEncoderStop025
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop025', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2600
     * @tc.name       : testOHVideoEncoderStop026
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop026', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2700
     * @tc.name       : testOHVideoEncoderStop027
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop027', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2800
     * @tc.name       : testOHVideoEncoderStop028
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop028', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2900
     * @tc.name       : testOHVideoEncoderStop029
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop029', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3000
     * @tc.name       : testOHVideoEncoderStop030
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop030', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3100
     * @tc.name       : testOHVideoEncoderStop031
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop031', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3200
     * @tc.name       : testOHVideoEncoderStop032
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop032', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3300
     * @tc.name       : testOHVideoEncoderStop033
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop033', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3400
     * @tc.name       : testOHVideoEncoderStop034
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop034', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3500
     * @tc.name       : testOHVideoEncoderStop035
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop035', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3600
     * @tc.name       : testOHVideoEncoderStop036
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop036', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3700
     * @tc.name       : testOHVideoEncoderStop037
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop037', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3800
     * @tc.name       : testOHVideoEncoderStop038
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop038', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3900
     * @tc.name       : testOHVideoEncoderStop039
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop039', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4000
     * @tc.name       : testOHVideoEncoderStop040
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop040', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4100
     * @tc.name       : testOHVideoEncoderStop041
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop041', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4200
     * @tc.name       : testOHVideoEncoderStop042
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop042', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4300
     * @tc.name       : testOHVideoEncoderStop043
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop043', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4400
     * @tc.name       : testOHVideoEncoderStop044
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop044', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4500
     * @tc.name       : testOHVideoEncoderStop045
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop045', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4600
     * @tc.name       : testOHVideoEncoderStop046
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop046', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4700
     * @tc.name       : testOHVideoEncoderStop047
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop047', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4800
     * @tc.name       : testOHVideoEncoderStop048
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop048', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4900
     * @tc.name       : testOHVideoEncoderStop049
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop049', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5000
     * @tc.name       : testOHVideoEncoderStop050
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop050', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5100
     * @tc.name       : testOHVideoEncoderStop051
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop051', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5200
     * @tc.name       : testOHVideoEncoderStop052
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop052', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5300
     * @tc.name       : testOHVideoEncoderStop053
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop053', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5400
     * @tc.name       : testOHVideoEncoderStop054
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop054', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5500
     * @tc.name       : testOHVideoEncoderStop055
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop055', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5600
     * @tc.name       : testOHVideoEncoderStop056
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop056', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5700
     * @tc.name       : testOHVideoEncoderStop057
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop057', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5800
     * @tc.name       : testOHVideoEncoderStop058
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop058', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });