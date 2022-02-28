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
import router from '@system.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('VideoDecoderFuncPromiseTest', function () {
    let videoDecodeProcessor = null;
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
    const BASIC_PATH = '/data/accounts/account_0/appdata/ohos.acts.multimedia.videodecoder/shared/';
    let ES_FRAME_SIZE = [];
    const H264_FRAME_SIZE_30FPS_1080 =
    [ 3491, 115184, 9423, 1046, 19038, 2059, 2306, 28773, 4815, 1670, 31464, 6322, 2969, 3518, 38279, 8419, 4463,
        4554, 35457, 7848, 3870, 4235, 32523, 7606, 3992, 4132, 58148, 10144, 7625, 6051, 38774, 8929, 5309, 5784,
        45250, 8696, 5511, 5224, 36732, 8221, 4885, 5103, 40075, 9799, 5259, 5373, 39394, 10406, 5016, 5572, 60935,
        13292, 6469, 7040, 45344, 12370, 5825, 6712, 47052, 12502, 6800, 7453, 52653, 14088, 7257, 8931, 46638, 13277,
        7612, 8663, 44022, 13672, 7763, 7784, 51638, 14118, 8112, 6458, 41013, 12910, 6759, 6974, 38409, 12813, 6785,
        6934, 33390, 12910, 6825, 6954, 21092, 13599, 6968, 7937];
    const H263_FRAME_SIZE =
    [ 96618, 3515, 4132, 4336, 4646, 3497, 4430, 5437, 7560, 4613, 4876, 4734, 53617, 4079, 4507, 5222, 6244,
      5843, 6601, 6622, 6751, 6539, 7666, 7706, 53977, 7311, 12906, 10308, 26791, 15983, 34794, 22110, 37165,
      24267, 36171, 18330, 53228, 7893, 13088, 9502, 8485, 9207, 8681, 9202, 8537, 7603, 9726, 8191, 51872,
      5535, 6146, 6341, 6933, 9365, 7828, 6547, 7638, 7009, 7025, 8873, 51045, 5056, 4858, 4887, 9614, 5953,
      5972, 6116, 6060, 6296, 6239, 6400, 50928, 4937, 5054, 5371, 6728, 6286, 6524, 6646, 6549, 6036, 6214,
      5866, 51109, 4778, 5273, 6327];
    const MPEG2_FRAME_SIZE =
    [ 38462, 55096, 8660, 3417, 1197, 2209, 984, 718, 783, 623, 659, 694, 14174, 580, 421, 495, 480, 476, 534,
      660, 699, 601, 603, 720, 12585, 555, 532, 776, 789, 762, 766, 732, 671, 735, 777, 948, 12650, 827, 766,
      835, 747, 847, 940, 1121, 1092, 1001, 980, 989, 12746, 945, 912, 1046, 1118, 1134, 1050, 1073, 1051, 1195,
      1085, 1182, 12874, 992, 1007, 985, 1040, 1143, 1157, 1150, 1247, 1149, 1246, 1145, 12870, 1041, 1066, 1314,
      1239, 1283, 1223, 1224, 1270, 1427, 1406, 1516, 12949, 1228, 1299, 1439, 1358, 1455, 1311, 1396, 1416, 1470,
      1393, 1502, 12999, 1232, 1400, 1348, 1335, 1461, 1404, 1412, 1426, 1548, 1481, 1488, 12840, 1229, 1342, 1323,
      1353, 1524, 1363, 1475, 1540, 1495, 1489, 1438, 12762, 1291, 1303, 1470, 1494, 1488, 1474, 1453, 1607, 1485,
      1589, 1762, 12548, 1363, 1317, 1435, 1411, 1338, 1373, 1605, 1639, 1429, 1392, 1543, 12332, 1255, 1200, 1291,
      1337, 1341, 1356, 1214, 1456, 1353, 1314, 1502, 12151, 1192, 1290, 1203, 1284, 1154, 1264, 1358, 1390, 1433,
      1194, 1325, 11904, 993, 1007, 1149, 1099, 1182, 1076, 1074, 1092, 1030, 1272, 1178, 11710, 966, 879, 860, 955,
      898, 967, 927, 1066, 997, 1083, 940, 11717, 648, 705, 901, 925, 930, 868, 798, 846, 781, 825, 1027, 11587, 785,
      733, 731, 848, 753, 806, 699, 837, 750, 762, 748, 11541, 678, 742, 667, 735, 702, 837, 695, 773, 849, 869, 769,
      11381, 664, 705, 714, 698, 814, 846, 757, 802, 857, 905, 772, 11265, 718, 643, 597, 687, 774, 843, 747, 785,
      683, 1135, 676, 11259, 616, 595, 773, 746, 798, 722, 798, 790, 959, 771, 907, 11234, 705, 675, 773, 764, 846,
      789, 840, 853, 828, 774, 842, 11263, 758, 758, 757, 820, 847, 834, 884, 842, 988, 750, 952, 11236, 776, 640, 727,
      832, 855, 733, 822, 827, 862, 697, 924, 11176, 675, 615, 688, 818, 783, 746, 901, 834, 892, 759, 923, 11181, 661,
      578, 720, 697];
    const MPEG4_FRAME_SIZE =
    [ 11895, 8109, 1578, 1616, 1313, 572, 805, 837, 755, 706, 952, 879, 13193, 422, 389, 509, 725, 465, 479, 959, 
        677, 364, 541, 696, 9306, 322, 318, 767, 590, 422, 530, 403, 505, 566, 445, 508, 7783, 460, 405, 343, 451,
        608, 431, 411, 543, 487, 527, 400, 6287, 385, 418, 391, 592, 434, 412, 398, 504, 492, 479, 561, 5413, 317,
        355, 422, 467, 452, 476, 460, 490, 492, 485, 451, 5036, 312, 408, 460, 432, 502, 388, 475, 407, 544, 401,
        487, 4404, 362, 378, 427, 416, 426, 456, 414, 438, 424, 442, 444, 4310, 362, 388, 393, 390, 441, 398, 423,
        369, 443, 406, 392, 4231, 343, 363, 355, 390, 459, 371, 378, 381, 405, 392, 426, 3975, 387, 337, 393, 439,
        378, 355, 374, 484, 381, 373, 423, 3869, 312, 350, 400, 345, 356, 320, 473, 431, 386, 338, 431, 3426, 268,
        315, 416, 383, 373, 381, 354, 383, 328, 348, 418, 3715, 324, 361, 331, 350, 302, 409, 377, 359, 384, 334,
        326, 3439, 266, 324, 329, 353, 405, 303, 357, 332, 292, 361, 333, 3542, 294, 284, 247, 331, 306, 322, 287,
        367, 341, 276, 258, 3980, 246, 245, 259, 309, 333, 250, 275, 334, 281, 253, 371, 3640, 213, 231, 301, 302,
        228, 289, 290, 281, 201, 284, 277, 4242, 205, 328, 237, 283, 295, 266, 230, 321, 348, 212, 308, 4103, 259,
        238, 245, 298, 330, 265, 271, 287, 267, 286, 290, 3856, 269, 242, 209, 314, 267, 278, 280, 314, 250, 433,
        238, 3654, 195, 246, 301, 298, 250, 270, 320, 269, 305, 258, 368, 3810, 231, 212, 279, 289, 252, 303, 287,
        295, 206, 264, 349, 4071, 242, 296, 271, 231, 307, 265, 254, 267, 317, 232, 348, 4077, 259, 222, 268, 235,
        324, 266, 256, 312, 246, 248, 325, 4000, 266, 201, 230, 293, 264, 265, 273, 301, 304, 253, 266, 3978, 228,
        232, 250, 248, 281, 219, 243, 293, 287, 253, 328, 3719];
    beforeAll(function() {
        console.info('beforeAll case');
        // getSurfaceID();
    })

    beforeEach(async function() {
        console.info('beforeEach case');
        await toDisplayPage().then(() => {
        }, failCallback).catch(failCatch);
        await msleep(1000).then(() => {
        }, failCallback).catch(failCatch);
        frameCountIn = 0;
        frameCountOut = 0;
        timestamp = 0;
        inputQueue = [];
        outputQueue = [];
        isCodecData = false;
        inputEosFlag = false;
        surfaceID = globalThis.value;
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (videoDecodeProcessor != null) {
            await videoDecodeProcessor.release().then(() => {
                console.info('in case : videoDecodeProcessor release success');
            }, failCallback).catch(failCatch);
            videoDecodeProcessor = null;
        }
        await router.clear().then(() => {
        }, failCallback).catch(failCatch);
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
    function msleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }
    async function toDisplayPage() {
        let path = 'pages/display/display';
        let options = {
            uri: path,
        }
        try {
            await router.push(options);
        } catch (e) {
            console.error('in case toDisplayPage' + e);
        }
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
            console.info('in case: inputBufferAvailable inBuffer.index: '+ inBuffer.index);
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
            console.info(`print videoCaps: 
            codecInfo.name ${videoCaps.codecInfo.name}
            codecInfo.type ${videoCaps.codecInfo.type}
            codecInfo.mimeType ${videoCaps.codecInfo.mimeType}
            codecInfo.isHardwareAccelerated ${videoCaps.codecInfo.isHardwareAccelerated}
            codecInfo.isSoftwareOnly ${videoCaps.codecInfo.isSoftwareOnly}
            codecInfo.isVendor ${videoCaps.codecInfo.isVendor}
            supportedBitrate [${videoCaps.supportedBitrate.min},  ${videoCaps.supportedBitrate.max}]
            supportedFormats ${videoCaps.supportedFormats}
            supportedHeightAlignment ${videoCaps.supportedHeightAlignment}
            supportedWidthAlignment ${videoCaps.supportedWidthAlignment}
            supportedWidth [${videoCaps.supportedWidth.min},  ${videoCaps.supportedWidth.max}]
            supportedHeight [${videoCaps.supportedHeight.min},  ${videoCaps.supportedHeight.max}]
            supportedProfiles ${videoCaps.supportedProfiles}
            supportedLevels ${videoCaps.supportedLevels}
            supportedBitrateMode ${videoCaps.supportedBitrateMode}
            supportedQuality [${videoCaps.supportedQuality.min},  ${videoCaps.supportedQuality.max}]
            supportedComplexity [${videoCaps.supportedComplexity.min},  ${videoCaps.supportedComplexity.max}]
            `);
        }, failCallback).catch(failCatch);
    }
    async function toConfigure(mediaDescription, srcPath) {
        await videoDecodeProcessor.configure(mediaDescription).then(() =>{
            console.info('in case : configure success');
            readFile(srcPath);
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
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_H264_PROMISE_0100
        * @tc.name      : 001.basic Video decode function
        * @tc.desc      : start-> EOS -> stop -> reset
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_H264_PROMISE_0100', 0, async function (done) {
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
        await toSetOutputSurface(true);
        setCallback(
            function(){eventEmitter.emit('nextStep', done);}
        );
        await toPrepare();
        await toStart();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_H263_PROMISE_0100
        * @tc.name      : 001.basic Video decode function
        * @tc.desc      : start-> EOS -> stop -> reset
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_H263_PROMISE_0100', 0, async function (done) {
        ES_FRAME_SIZE = H263_FRAME_SIZE;
        let srcPath = BASIC_PATH + 'h263_1408_1152.es';
        let mediaDescription = {
            'track_type': 1,
            'codec_mime': 'video/h263',
            'width': 1408,
            'height': 1152,
            'pixel_format': 4,
            'frame_rate': 60.00,
            'max_input_size': 150000,
        }
        await toCreateVideoDecoderByMime('video/h263', done);
        await toGetVideoDecoderCaps();
        await toConfigure(mediaDescription, srcPath);
        await toSetOutputSurface(true);
        setCallback(
            function(){eventEmitter.emit('nextStep', done);}
        );
        await toPrepare();
        await toStart();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_MPEG2_PROMISE_0100
        * @tc.name      : 001.basic Video decode function
        * @tc.desc      : start-> EOS -> stop -> reset
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_MPEG2_PROMISE_0100', 0, async function (done) {
        ES_FRAME_SIZE = MPEG2_FRAME_SIZE;
        let srcPath = BASIC_PATH + 'MPEG2_720_480.es';
        let mediaDescription = {
            'track_type': 1,
            'codec_mime': 'video/mpeg2',
            'width': 720,
            'height': 480,
            'pixel_format': 4,
            'frame_rate': 60.00,
            'max_input_size': 150000,
        }
        await toCreateVideoDecoderByMime('video/mpeg2', done);
        await toGetVideoDecoderCaps();
        await toConfigure(mediaDescription, srcPath);
        await toSetOutputSurface(true);
        setCallback(
            function(){eventEmitter.emit('nextStep', done);}
        );
        await toPrepare();
        await toStart();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_MPEG4_PROMISE_0100
        * @tc.name      : 001.basic Video decode function
        * @tc.desc      : start-> EOS -> stop -> reset
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_MPEG4_PROMISE_0100', 0, async function (done) {
        ES_FRAME_SIZE = MPEG4_FRAME_SIZE;
        let srcPath = BASIC_PATH + 'mpeg4_320_240.es';
        let mediaDescription = {
            'track_type': 1,
            'codec_mime': 'video/mp4v-es',
            'width': 320,
            'height': 240,
            'pixel_format': 4,
            'frame_rate': 60.00,
            'max_input_size': 150000,
        }
        await toCreateVideoDecoderByMime('video/mp4v-es', done);
        await toGetVideoDecoderCaps();
        await toConfigure(mediaDescription, srcPath);
        await toSetOutputSurface(true);
        setCallback(
            function(){eventEmitter.emit('nextStep', done);}
        );
        await toPrepare();
        await toStart();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_MULTIINSTANCE_PROMISE_0100
        * @tc.name      : 001.creat 16 video decoder
        * @tc.desc      : creat 16 video decoder
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_MULTIINSTANCE_PROMISE_0100', 0, async function (done) {
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
        let array = new Array();
        eventEmitter.on('releaseAllDecoder', async () => {
            for (let j = 0; j < 15; j++) {
                await array[j].release().then(() => {
                    array[j] = null;
                }, failCallback).catch(failCatch);
            }
            await videoDecodeProcessor.release().then(() => {
                console.info('in case : release success');
            }, failCallback).catch(failCatch);
            videoDecodeProcessor = null;
            done();
        })
        for (let i = 0; i < 16; i++) {
            await media.createVideoDecoderByMime('video/avc').then((processor) => {
                if (typeof (processor) != 'undefined') {
                    console.info('in case : createVideoDecoderByMime success');
                    if (i == 15) {
                        videoDecodeProcessor = processor;
                    } else {
                        array[i] = processor;
                    }
                } else {
                    console.info('in case : createVideoDecoderByMime fail');
                    expect().assertFail();
                    done();
                }
            }, failCallback).catch(failCatch);
        }
        await toConfigure(mediaDescription, srcPath);
        await toSetOutputSurface(true);
        setCallback(
            function(){eventEmitter.emit('releaseAllDecoder', done);}
        );
        await toPrepare();
        await toStart();
    })
})
    
