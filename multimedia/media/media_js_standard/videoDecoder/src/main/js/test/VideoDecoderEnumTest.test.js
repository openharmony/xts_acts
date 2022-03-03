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

import media from '@ohos.multimedia.media'
import Fileio from '@ohos.fileio'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('VideoDecoderEnum', function () {
    let videoDecodeProcessor = null;
    let videoPlayer = null;
    let readStreamSync = undefined;
    let frameCountIn = 0;
    let frameCountOut = 0;
    let timestamp = 0;
    let inputQueue = [];
    let outputQueue = [];
    let isCodecData = false;
    let inputEosFlag = false;
    let surfaceID = '';
    const events = require('events');
    const eventEmitter = new events.EventEmitter();
    const BASIC_PATH = '/data/media/';
    let ES_FRAME_SIZE = [];
    const H264_FRAME_SIZE_30FPS_1080 =
    [ 3491, 115184];
    beforeAll(function() {
        console.info('beforeAll case');
        // getSurfaceID();
    })

    beforeEach(function() {
        console.info('beforeEach case');
        frameCountIn = 0;
        frameCountOut = 0;
        timestamp = 0;
        inputQueue = [];
        outputQueue = [];
        isCodecData = false;
        inputEosFlag = false;
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (videoDecodeProcessor != null) {
            await videoDecodeProcessor.release().then(() => {
                console.info('in case : videoDecodeProcessor release success');
            }, failCallback).catch(failCatch);
            videoDecodeProcessor = null;
        }
        if (videoPlayer != null) {
            await videoPlayer.release().then(() => {
                console.info('in case : videoPlayer release success');
            }, failCallback).catch(failCatch);
            videoPlayer = null;
        }
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    let failCallback = function(err) {
        console.info(`in case error failCallback called, errMessage is ${error.message}`);
        expect(err).assertUndefined();
    }
    let failCatch = function(err) {
        console.info(`in case error failCatch called,errMessage is ${error.message}`);
        expect(err).assertUndefined();
    }
    function readFile(path){
        console.info('in case : read file start execution');
        try {
            console.info('in case: filepath ' + path);
            readStreamSync = Fileio.createStreamSync(path, 'rb');
        } catch(e) {
            console.error('in case readFile' + e);
        }
    }

    function getContent(buf, len) {
        console.info('start get content, len ' + len + ' buf.byteLength ' + buf.byteLength);
        let lengthReal = -1;
        try {
            lengthReal = readStreamSync.readSync(
                buf, 
                {length: len}
            );
            console.info('in case: lengthReal: ' + lengthReal);
        } catch(e) {
            console.error('in case error getContent ' + e);
        }
    }
    function getSurfaceID() {
        let surfaceIDTest = new ArrayBuffer(20);
        let readSurfaceID = Fileio.createStreamSync('/data/media/surfaceID.txt', 'rb');
        readSurfaceID.readSync(surfaceIDTest, {length: 13});
        let view2 = new Uint8Array(surfaceIDTest);
        for (let i = 0; i < 13; i++) {
            let value = view2[i] - 48;
            surfaceID = surfaceID + '' + value;
        }
        console.info('in case surfaceID ' + surfaceID);
        readSurfaceID.closeSync();
    }
    
    /* push inputbuffers into codec  */
    async function enqueueInputs(){
        console.info('in case: enqueueInputs in');
        while (inputQueue.length > 0 && !inputEosFlag) {
            let inputObject = inputQueue.shift(); 
            console.log('in case: inputObject.index: ' + inputObject.index);
            if (frameCountIn < ES_FRAME_SIZE.length) {
                getContent(inputObject.data, ES_FRAME_SIZE[frameCountIn]);
                inputObject.timeMs = timestamp;
                inputObject.offset = 0;
                inputObject.length = ES_FRAME_SIZE[frameCountIn];
                console.info('in case: frameCountIn ' + frameCountIn);
                frameCountIn++;
                timestamp += 16.67;
            }
            if (isCodecData) {
                inputObject.flags = 8;
                isCodecData = false;
                timestamp = 0;
            } else if (frameCountIn >= ES_FRAME_SIZE.length - 1) {
                inputObject.flags = 1;
                inputEosFlag = true;
            } else {
                inputObject.flags = 4;
            }
            if (frameCountIn == ES_FRAME_SIZE.length / 2) {
                videoDecodeProcessor.setParameter({
                    'bitrate': 6400,
                }).then(() => {
                    console.info('in case: setParameter success ');
                }, failCallback).catch(failCatch);
            }
            videoDecodeProcessor.queueInput(inputObject).then(() => {
                console.info('in case: queueInput success ');
            }, failCallback).catch(failCatch);
        }
    }

    /* get outputbuffers from codec  */
    async function dequeueOutputs(nextStep){
        console.log('outputQueue.length:' + outputQueue.length);
        while (outputQueue.length > 0){
            let outputObject = outputQueue.shift();
            if (outputObject.flags == 1) {
                nextStep();
                return;
            }
            frameCountOut++;
            await videoDecodeProcessor.releaseOutput(outputObject, true).then(() => {
                console.log('in case: release output count:' + frameCountOut);
            }, failCallback).catch(failCatch);
        }
    }

    function setCallback(nextStep){
        console.info('in case:  setCallback in');
        videoDecodeProcessor.on('inputBufferAvailable', async (inBuffer) => {
            expect(inBuffer.index !== undefined).assertTrue();
            console.info('in case: inputBufferAvailable inBuffer.index: '+ inBuffer.index);
            expect(inBuffer.data !== undefined).assertTrue();
            console.info('in case: inputBufferAvailable inBuffer.data: '+ inBuffer.data);
            expect(inBuffer.offset !== undefined).assertTrue();
            console.info('in case: inputBufferAvailable inBuffer.offset: '+ inBuffer.offset);
            expect(inBuffer.length !== undefined).assertTrue();
            console.info('in case: inputBufferAvailable inBuffer.length: '+ inBuffer.length);
            expect(inBuffer.flags !== undefined).assertTrue();
            console.info('in case: inputBufferAvailable inBuffer.flags: '+ inBuffer.flags);
            expect(inBuffer.timeMs !== undefined).assertTrue();
            console.info('in case: inputBufferAvailable inBuffer.timeMs: '+ inBuffer.timeMs);
            inputQueue.push(inBuffer);
            await enqueueInputs();
        });

        videoDecodeProcessor.on('outputBufferAvailable', async (outBuffer) => {
            console.info('in case: outputBufferAvailable outBuffer.index: '+ outBuffer.index);
            videoDecodeProcessor.getOutputMediaDescription().then((MediaDescription) => {
                console.info('get outputMediaDescription : ' + MediaDescription);
            }, failCallback).catch(failCatch);
            outputQueue.push(outBuffer);
            await dequeueOutputs(nextStep);
        });

        videoDecodeProcessor.on('error',(err) => {
            console.info('in case: error called,errName is' + err);
            expect(err.code !== undefined).assertTrue();
            console.info('in case: err.code is ' + err.code);
        });

        videoDecodeProcessor.on('outputFormatChanged',(format) => {
            console.info('in case: Output format changed: ' + format.toString());
        });
        console.info('in case:  setCallback out');
    }

    async function toCreateVideoDecoderByMime(mime, done) {
        await media.createVideoDecoderByMime(mime).then((processor) => {
            if (typeof (processor) != 'undefined') {
                videoDecodeProcessor = processor;
                console.info('in case : createVideoDecoderByMime success');
            } else {
                console.info('in case : createVideoDecoderByMime fail');
                expect().assertFail();
                done();
            }
        }, failCallback).catch(failCatch);
    }
    async function toGetVideoDecoderCaps() {
        await videoDecodeProcessor.getVideoDecoderCaps().then((videoCaps) => {
            console.info("case get getVideoDecoderCaps success");
            console.info("print videoCaps: " + videoCaps)
        }, failCallback).catch(failCatch);
    }
    async function toCreateVideoDecoderByName(name, done) {
        await media.createVideoDecoderByName(name).then((processor) => {
            if (typeof (processor) != 'undefined') {
                videoDecodeProcessor = processor;
                console.info('in case : createVideoDecoderByName success');
            } else {
                console.info('in case : createVideoDecoderByName fail');
                expect().assertFail();
                done();
            }
        }, failCallback).catch(failCatch);
    }
    async function toConfigure(mediaDescription, srcPath) {
        await videoDecodeProcessor.configure(mediaDescription).then(() =>{
            console.info('in case : configure success');
            readFile(srcPath);
        }, failCallback).catch(failCatch);
    }
    async function setSurfaceID(done) {
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                console.info('in case : createVideoPlayer success');
            } else {
                expect().assertFail();
                console.info('in case error: createVideoPlayer fail');
                done();
            }
        }, failCallback).catch(failCatch);
        await videoPlayer.getDisplaySurface().then((surface) => {
            console.info('in case :  getDisplaySurface success and surfaceID is ' + surface);
            surfaceID = surface;
        }, failCallback).catch(failCatch);
    }
    async function toSetOutputSurface(isDisplay) {
        await videoDecodeProcessor.setOutputSurface(surfaceID, isDisplay).then(() => {
            console.info('in case : setOutputSurface success. surfaceID ' + surfaceID);
        }, failCallback).catch(failCatch);
    }
    eventEmitter.on('nextStep', async (done) => {
        console.info('in case : nextStep success');
        await videoDecodeProcessor.stop().then(() => {
            console.info('in case : stop success');
        }, failCallback).catch(failCatch);
        await videoDecodeProcessor.reset().then(() => {
            console.info('in case : reset success');
        }, failCallback).catch(failCatch);
        await videoDecodeProcessor.release().then(() => {
            console.info('in case : release success');
        }, failCallback).catch(failCatch);
        videoDecodeProcessor = null;
        console.info('in case : done');
        done();
    });
    async function toPrepare() {
        await videoDecodeProcessor.prepare().then(() => {
            console.info('in case : prepare success');
        }, failCallback).catch(failCatch);
    }
    async function toStart() {
        await videoDecodeProcessor.start().then(() => {
            console.info('in case : start success');
        }, failCallback).catch(failCatch);
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_AVCProfile_0100
        * @tc.name      : 001.AVCProfile
        * @tc.desc      : Test Enumerate AVCProfile
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_AVCProfile_0100', 0, async function (done) {
        expect(media.AVCProfile.AVC_PROFILE_BASELINE).assertEqual(0);
        expect(media.AVCProfile.AVC_PROFILE_CONSTRAINED_BASELINE).assertEqual(1);
        expect(media.AVCProfile.AVC_PROFILE_CONSTRAINED_HIGH).assertEqual(2);
        expect(media.AVCProfile.AVC_PROFILE_EXTENDED).assertEqual(3);
        expect(media.AVCProfile.AVC_PROFILE_HIGH).assertEqual(4);
        expect(media.AVCProfile.AVC_PROFILE_HIGH_10).assertEqual(5);
        expect(media.AVCProfile.AVC_PROFILE_HIGH_422).assertEqual(6);
        expect(media.AVCProfile.AVC_PROFILE_HIGH_444).assertEqual(7);
        expect(media.AVCProfile.AVC_PROFILE_MAIN).assertEqual(8);
        done();
    })    

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_CodecBuffer_0100
        * @tc.name      : 002.CodecBuffer
        * @tc.desc      : Test Interface CodecBuffer
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_CodecBuffer_0100', 0, async function (done) {
        ES_FRAME_SIZE = H264_FRAME_SIZE_30FPS_1080;
        isCodecData = true;
        let srcPath = BASIC_PATH + 'out_1920_1080_30fps_3s.h264';
        let mediaDescription = {
            'track_type': 1,
            'codec_mime': 'video/avc',
            'width': 1920,
            'height': 1080,
            'pixel_format': 4,
            'frame_rate': 30.00,
            'max_input_size': 150000,
        }
        await toCreateVideoDecoderByMime('video/avc', done);
        await toGetVideoDecoderCaps();
        await toConfigure(mediaDescription, srcPath);
        await setSurfaceID(done);
        await toSetOutputSurface(true);
        setCallback(
            function(){eventEmitter.emit('nextStep', done);}
        );
        await toPrepare();
        await toStart();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_CodecMimeType_0100
        * @tc.name      : 003.CodecMimeType
        * @tc.desc      : Test Enumerate CodecMimeType
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_CodecMimeType_0100', 0, async function (done) {
        expect(media.CodecMimeType.VIDEO_H263).assertEqual('video/h263');
        expect(media.CodecMimeType.VIDEO_AVC).assertEqual('video/avc');
        expect(media.CodecMimeType.VIDEO_MPEG2).assertEqual('video/mpeg2');
        expect(media.CodecMimeType.VIDEO_HEVC).assertEqual('video/hevc');
        expect(media.CodecMimeType.VIDEO_MPEG4).assertEqual('video/mp4v-es');
        expect(media.CodecMimeType.VIDEO_VP8).assertEqual('video/x-vnd.on2.vp8');
        expect(media.CodecMimeType.VIDEO_VP9).assertEqual('video/x-vnd.on2.vp9');
        done();
    })   

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_H263Profile_0100
        * @tc.name      : 004.H263Profile
        * @tc.desc      : Test Enumerate H263Profile
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_H263Profile_0100', 0, async function (done) {
        expect(media.H263Profile.H263_PROFILE_BACKWARD_COMPATIBLE).assertEqual(0);
        expect(media.H263Profile.H263_PROFILE_BASELINE).assertEqual(1);
        expect(media.H263Profile.H263_PROFILE_H320_CODING).assertEqual(2);
        expect(media.H263Profile.H263_PROFILE_HIGH_COMPRESSION).assertEqual(3);
        expect(media.H263Profile.H263_PROFILE_HIGH_LATENCY).assertEqual(4);
        expect(media.H263Profile.H263_PROFILE_ISW_V2).assertEqual(5);
        expect(media.H263Profile.H263_PROFILE_ISW_V3).assertEqual(6);
        expect(media.H263Profile.H263_PROFILE_INTERLACE).assertEqual(7);
        expect(media.H263Profile.H263_PROFILE_INTERNET).assertEqual(8);
        done();
    })   

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_MPEG2Profile_0100
        * @tc.name      : 006.MPEG2Profile
        * @tc.desc      : Test Enumerate MPEG2Profile
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_MPEG2Profile_0100', 0, async function (done) {
        expect(media.MPEG2Profile.MPEG2_PROFILE_422).assertEqual(0);
        expect(media.MPEG2Profile.MPEG2_PROFILE_HIGH).assertEqual(1);
        expect(media.MPEG2Profile.MPEG2_PROFILE_MAIN).assertEqual(2);
        expect(media.MPEG2Profile.MPEG2_PROFILE_SNR).assertEqual(3);
        expect(media.MPEG2Profile.MPEG2_PROFILE_SIMPLE).assertEqual(4);
        expect(media.MPEG2Profile.MPEG2_PROFILE_SPATIAL).assertEqual(5);
        done();
    })
    
    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_MPEG4Profile_0100
        * @tc.name      : 007.MPEG4Profile
        * @tc.desc      : Test Enumerate MPEG4Profile
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_MPEG4Profile_0100', 0, async function (done) {
        expect(media.MPEG4Profile.MPEG4_PROFILE_ADVANCED_CODING).assertEqual(0);
        expect(media.MPEG4Profile.MPEG4_PROFILE_ADVANCED_CORE).assertEqual(1);
        expect(media.MPEG4Profile.MPEG4_PROFILE_ADVANCED_REAL_TIME).assertEqual(2);
        expect(media.MPEG4Profile.MPEG4_PROFILE_ADVANCED_SCALABLE).assertEqual(3);
        expect(media.MPEG4Profile.MPEG4_PROFILE_ADVANCED_SIMPLE).assertEqual(4);
        expect(media.MPEG4Profile.MPEG4_PROFILE_BASIC_ANIMATED).assertEqual(5);
        expect(media.MPEG4Profile.MPEG4_PROFILE_CORE).assertEqual(6);
        expect(media.MPEG4Profile.MPEG4_PROFILE_CORE_SCALABLE).assertEqual(7);
        expect(media.MPEG4Profile.MPEG4_PROFILE_HYBRID).assertEqual(8);
        expect(media.MPEG4Profile.MPEG4_PROFILE_MAIN).assertEqual(9);
        expect(media.MPEG4Profile.MPEG4_PROFILE_NBIT).assertEqual(10);
        expect(media.MPEG4Profile.MPEG4_PROFILE_SCALABLE_TEXXTURE).assertEqual(11);
        expect(media.MPEG4Profile.MPEG4_PROFILE_SIMPLE).assertEqual(12);
        expect(media.MPEG4Profile.MPEG4_PROFILE_SIMPLE_FBA).assertEqual(13);
        expect(media.MPEG4Profile.MPEG4_PROFILE_SIMPLE_FACE).assertEqual(14);
        expect(media.MPEG4Profile.MPEG4_PROFILE_SIMPLE_SCALABLE).assertEqual(15);
        done();
    })  

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_VideoPixelFormat_0100
        * @tc.name      : 009.VideoPixelFormat
        * @tc.desc      : Test Enumerate VideoPixelFormat
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_VideoPixelFormat_0100', 0, async function (done) {
        expect(media.VideoPixelFormat.YUVI420).assertEqual(1);
        expect(media.VideoPixelFormat.NV12).assertEqual(2);
        expect(media.VideoPixelFormat.NV21).assertEqual(3);
        expect(media.VideoPixelFormat.SURFACE_FORMAT).assertEqual(4);
        done();
    })  

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_ENUM_VP8Profile_0100
        * @tc.name      : 010.VP8Profile
        * @tc.desc      : Test Enumerate VP8Profile
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_DECODER_ENUM_VP8Profile_0100', 0, async function (done) {
        expect(media.VP8Profile.VP8_PROFILE_MAIN).assertEqual(0);
        done();
    }) 
})
    
