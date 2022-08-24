/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio'
import featureAbility from '@ohos.ability.featureAbility'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import * as mediaTestBase from '../../../../../MediaTestBase.js';

describe('videoHardwareEncoderFuncPromise', function () {
    let videoEncodeProcessor;
    let surfaceID = '';
    let outputQueue = [];
    let videoDecodeProcessor = null;
    let frameCountIn = 0;
    let timestamp = 0;
    let isCodecData = true;
    let inputEosFlag = false;
    const events = require('events');
    const eventEmitter = new events.EventEmitter();
    let ES_FRAME_SIZE = [];
    let fdRead;
    let position = 0;
    let DECinputCnt = 0;
    let DECoutputCnt = 0;
    let ENCoutputCnt = 0;
    let outputCntDec = 0;
    let outputCntEnc = 0;
    let frameThreshold = 0.1;
    let needSetEos = true;
    let isInputEnd = false;
    let outputEncEos = false;
    let pixelFormat = 0;
    let isFormatSame = true;
    let mediaDescription = {
        'width': 320,
        'height': 240,
        'pixel_format': 2,
        'frame_rate': 60,
    }
    let mediaDescription2 = {
        'track_type': 1,
        'width': 320,
        'height': 240,
        'pixel_format': 2,
        'frame_rate': 60,
        'max_input_size': 150000,
    }
    let mime = 'video/avc';
    let srcPath = 'out_320_240_10s.h264'
    const H264_FRAME_SIZE_60FPS_320 =
    [ 2106, 11465, 321, 72, 472, 68, 76, 79, 509, 90, 677, 88, 956, 99, 347, 77, 452, 681, 81, 1263, 94, 106, 97,
        998, 97, 797, 93, 1343, 150, 116, 117, 926, 1198, 128, 110, 78, 1582, 158, 135, 112, 1588, 165, 132,
        128, 1697, 168, 149, 117, 1938, 170, 141, 142, 1830, 106, 161, 122, 1623, 160, 154, 156, 1998, 230,
        177, 139, 1650, 186, 128, 134, 1214, 122, 1411, 120, 1184, 128, 1591, 195, 145, 105, 1587, 169, 140,
        118, 1952, 177, 150, 161, 1437, 159, 123, 1758, 180, 165, 144, 1936, 214, 191, 175, 2122, 180, 179,
        160, 1927, 161, 184, 119, 1973, 218, 210, 129, 1962, 196, 127, 154, 2308, 173, 127, 1572, 142, 122];
    let lockFlag = false;
    let needRelease = false;
    let needStop = false;
    let needFlush = false;
    let needReset = false;

    beforeAll(async function() {
        console.info('beforeAll case 1');
    })

    beforeEach(async function() {
        console.info('beforeEach case');
        await msleep(1000).then(() => {
        }, failCallback).catch(failCatch);
        DECinputCnt = 0;
        DECoutputCnt = 0;
        ENCoutputCnt = 0;
        frameCountIn = 0;
        timestamp = 0;
        isCodecData = true;
        inputEosFlag = false;
        position = 0;
        outputCntDec = 0;
        outputCntEnc = 0;
        needSetEos = true;
        isInputEnd = false;
        outputEncEos = false;
        needRelease = false;
        needStop = false;
        needFlush = false;
        needReset = false;
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (videoEncodeProcessor != null){
            await videoEncodeProcessor.release().then(() => {
                console.info("case release videoDecodeProcessor success"); 
            }, failCallback).catch(failCatch);
            videoEncodeProcessor = null;
        }
        if (videoDecodeProcessor != null){
            await videoDecodeProcessor.release().then(() => {
                console.info("case release videoDecodeProcessor success"); 
            }, failCallback).catch(failCatch);
            videoDecodeProcessor = null;
        }
        await fileio.close(fdRead);
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    let failCallback = function(err) {
        console.info('case callback err : ' + err);
        expect(err).assertUndefined();
    }

    let failCatch = function(err) {
        console.info('case catch err : ' + err);
        expect(err).assertUndefined();
    }

    function msleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }

    function sleep(time) {
        return new Promise((resolve) => setTimeout(resolve, time));
    } 

    function getContent(buf, poi, len) {
        console.info("case start get content");
        console.info("case start get content length is: " + len);
        let lengthreal = -1;
        try {
            if (poi == -1) {
                lengthreal = fileio.readSync(fdRead, buf, {length:len});
            } else {
                lengthreal = fileio.readSync(fdRead, buf, {length:len, position: poi});
            }
            console.info('case lengthreal is :' + lengthreal);
        } catch(e) {
            console.info('case getContent error :' + e);
        }
    }

    async function getFdRead(pathName, done) {
        await mediaTestBase.getFdRead(pathName, done).then((fdNumber) => {
            fdRead = fdNumber;
        })
    }

    async function toCreateVideoEncoderByName(name, done) {
        await media.createVideoEncoderByName(name).then((processor) => {
            if (typeof (processor) != 'undefined') {
                videoEncodeProcessor = processor;
                console.info('in case ENC: createVideoEncoderByName success');
            } else {
                console.info('in case ENC: createVideoEncoderByName fail');
                expect().assertFail();
                done();
            }
        })
    }

    async function toCreateVideoEncoderByMime(mime, done) {
        await media.createVideoEncoderByMime(mime).then((processor) => {
            if (typeof (processor) != 'undefined') {
                videoEncodeProcessor = processor;
                console.info('in case ENC: createVideoEncoderByMime success');
            } else {
                console.info('in case ENC: createVideoEncoderByMime fail');
                expect().assertFail();
                done();
            }
        })
    }

    async function toGetInputSurface() {
        await videoEncodeProcessor.getInputSurface().then((inputSurface) => {
            expect(inputSurface != undefined).assertTrue();
            console.info('in case ENC: getInputSurface success');
            surfaceID = inputSurface;
            console.info('in case ENC: videoEncoder surfaceID is ' + surfaceID);
        }, failCallback).catch(failCatch);
    }

    async function toGetVideoEncoderCaps(width, height) {
        await videoEncodeProcessor.getVideoEncoderCaps().then((videoCaps) => {
            console.info("case get getVideoEncoderCaps success");
            printVideoCaps(videoCaps, width, height);
        }, failCallback).catch(failCatch);
    }

    async function toConfigureEnc(mediaDescription, savepath) {
        await videoEncodeProcessor.configure(mediaDescription).then(() => {
            console.info("in case ENC: configure success"); 
        }, failCallback).catch(failCatch);
    }

    async function toPrepareEnc() {
        await videoEncodeProcessor.prepare().then(() => {
            console.info("in case ENC: prepare success"); 
        }, failCallback).catch(failCatch);
    }

    async function toStartEnc() {
        await videoEncodeProcessor.start().then(() => {
            console.info("in case ENC: start success"); 
        }, failCallback).catch(failCatch);
    }

    async function toStopEnc() {
        await videoEncodeProcessor.stop().then(() => {
            console.info("in case ENC: stop success"); 
        }, failCallback).catch(failCatch);
    }

    async function toFlushEnc() {
        lockFlag = true;
        await videoEncodeProcessor.flush().then(() => {
            console.info("in case ENC: flush success"); 
            lockFlag = false;
        }, failCallback).catch(failCatch);
    }

    async function toResetEnc() {
        await videoEncodeProcessor.reset().then(() => {
            console.info("in case ENC: reset success"); 
        }, failCallback).catch(failCatch);
    }

    async function toReleaseEnc() {
        await videoEncodeProcessor.release().then(() => {
            console.info("case release videoEncodeProcessor success"); 
            videoEncodeProcessor = null;
        }, failCallback).catch(failCatch);
    }

    async function dequeueOutputs(done) {
        while (outputQueue.length > 0) {
            let outputObject = outputQueue.shift();
            outputCntEnc += 1;
            if (outputObject.flags == 1) {
                if (outputCntEnc == 1) {
                    console.info('in case ENC ERROR, first output is EOS');
                    expect().assertFail();
                }
                outputEncEos = true;
                console.info('in case ENC: output EOS');
                eventEmitter.emit('endOfEos', done);
            } else {
                console.info('in case ENC not last frame, continue');
                if (!lockFlag) {
                    videoEncodeProcessor.freeOutputBuffer(outputObject).then(() => {
                        console.info('in case ENC release output success');
                        ENCoutputCnt += 1;
                        console.info('in case ENC: ENCoutputCnt is ' + ENCoutputCnt);
                    });
                }
            }
        } 
    }

    function setCallbackEnc(done) {
        console.info('case callback');
        videoEncodeProcessor.on('newOutputData', async(outBuffer) => {
            console.info('in case ENC outputBufferAvailable');
            console.info('in case ENC outBuffer.flags: ' + outBuffer.flags);
            outputQueue.push(outBuffer);
            dequeueOutputs(done);
        });
        videoEncodeProcessor.on('error',(err) => {
            console.info('case error called,errName is' + err);
        });
        videoEncodeProcessor.on('streamChanged',(format) => {
            console.info('Output format changed: ' + format);
        });
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

    async function toConfigureDec(mediaDescription) {
        await videoDecodeProcessor.configure(mediaDescription).then(() =>{
            console.info('in case DEC: configure success');
        }, failCallback).catch(failCatch);
    }

    async function toSetOutputSurface(isDisplay) {
        await videoDecodeProcessor.setOutputSurface(surfaceID, isDisplay).then(() => {
            console.info('in case DEC: setOutputSurface success. surfaceID ' + surfaceID);
        }, failCallback).catch(failCatch);
    }

    async function toPrepareDec() {
        await videoDecodeProcessor.prepare().then(() => {
            console.info('in case DEC: prepare success');
        }, failCallback).catch(failCatch);
    }

    async function toStartDec() {
        await videoDecodeProcessor.start().then(() => {
            console.info('in case DEC: start success');
        }, failCallback).catch(failCatch);
    }

    async function toFlushDec() {
        lockFlag = true;
        await videoDecodeProcessor.flush().then(() => {
            console.info("in case DEC: flush success"); 
            lockFlag = false;
        }, failCallback).catch(failCatch);
    }

    async function toStopDec() {
        await videoDecodeProcessor.stop().then(() => {
            console.info("in case DEC: stop success"); 
        }, failCallback).catch(failCatch);
    }

    async function toResetDec() {
        await videoDecodeProcessor.reset().then(() => {
            console.info("in case DEC: reset success"); 
        }, failCallback).catch(failCatch);
    }

    async function toReleaseDec() {
        await videoDecodeProcessor.release().then(() => {
            console.info("case release videoDecodeProcessor success"); 
            videoDecodeProcessor = null;
        }, failCallback).catch(failCatch);
    }

    function setCallbackDec() {
        console.info('in case:  setCallback in');
        videoDecodeProcessor.on('needInputData', async (inBuffer) => {
            console.info('in case DEC: inputBufferAvailable inBuffer.index: '+ inBuffer.index);
            enqueueInputs(inBuffer);
        });
        videoDecodeProcessor.on('newOutputData', async (outBuffer) => {
            console.info('in case DEC: outputBufferAvailable outBuffer.flags: '+ outBuffer.flags);
            outputCntDec += 1;
            if (outBuffer.flags == 1) {
                if (outputCntDec == 1) {
                    console.info('in case DEC ERROR, first output is EOS');
                    expect().assertFail();
                } else {
                    await videoEncodeProcessor.notifyEndOfStream();
                }
            }
            if (outBuffer.flags == 0 && !lockFlag) {
                await videoDecodeProcessor.renderOutputData(outBuffer).then(() => {
                    DECoutputCnt += 1;
                    console.info('in case DEC: DECoutputCnt is ' + DECoutputCnt);
                }, failCallback).catch(failCatch);
            }
        });
        videoDecodeProcessor.on('error',(err) => {
            console.info('in case: error called,errName is' + err);
        });
        videoDecodeProcessor.on('streamChanged',(format) => {
            console.info('in case DEC: Output format changed: ' + format.toString()); v
        });
        console.info('in case DEC:  setCallback out');
    }

    /* push inputbuffers into codec  */
    async function enqueueInputs(inputObject) {
        if (inputEosFlag == false && isInputEnd == false) {
            console.log('in case DEC: not see input EOS');
            if (frameCountIn < ES_FRAME_SIZE.length) {
                getContent(inputObject.data, position, ES_FRAME_SIZE[frameCountIn]);
                inputObject.timeMs = timestamp;
                inputObject.offset = 0;
                inputObject.length = ES_FRAME_SIZE[frameCountIn];
                position = position + ES_FRAME_SIZE[frameCountIn];
                console.info('in case: frameCountIn ' + frameCountIn);
                frameCountIn++;
                timestamp += 16.67;
            }
            if (isCodecData) {
                inputObject.flags = 8;
                isCodecData = false;
                timestamp = 0;
            } else if (frameCountIn >= ES_FRAME_SIZE.length - 1) {
                if (needSetEos) {
                    inputObject.flags = 1;
                    inputEosFlag = true;
                } else {
                    isInputEnd = true;
                }
            } else {
                inputObject.flags = 4;
            }
            videoDecodeProcessor.pushInputData(inputObject).then(() => {
                console.info('in case DEC: queueInput success ');
                DECinputCnt += 1;
                console.info('in case DEC: DECinputCnt is ' + DECinputCnt);
            }, failCallback).catch(failCatch); 
        }
    }

    function resetReadParam() {
        console.info('case read from start');
        position = 0;
        inputEosFlag = false;
        frameCountIn = 0;
        isCodecData = true;
    }

    function resetStateParam() {
        console.info('case init state parameter');
        outputCntEnc = 0;
        DECinputCnt = 0;
        DECoutputCnt = 0;
        ENCoutputCnt = 0;
        outputEncEos = false;
        needSetEos = true;
        isInputEnd = false;
        needRelease = false;
        needStop = false;
        needFlush = false;
        needReset = false;
    }

    async function printVideoCaps(videoCaps, width, height) {
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
        await videoCaps.getPreferredFrameRate(width, height).then((valueRange) => {
            console.info("case getPreferredFrameRate valueRange success");
            if (typeof (valueRange) != 'undefined') {
                console.info('getPreferredFrameRate.min: ' + valueRange.min);
                console.info('getPreferredFrameRate.max: ' + valueRange.max);
            } else {
                console.info('case getPreferredFrameRate valueRange is not defined');
                expect().assertFail();
            }
        }, failCallback).catch(failCatch);
        await videoCaps.getSupportedFrameRate(width, height).then((valueRange) => {
            console.info("case getSupportedFrameRate valueRange success");
            if (typeof (valueRange) != 'undefined') {
                console.info('getSupportedFrameRate.min: ' + valueRange.min);
                console.info('getSupportedFrameRate.max: ' + valueRange.max);
            } else {
                console.info('case getSupportedFrameRate valueRange is not defined');
                expect().assertFail();
            }
        }, failCallback).catch(failCatch);
        await videoCaps.isSizeSupported(width, height).then((trueORfalse) => {
            console.info("case isSizeSupported valueRange for width:" + width + ", height: " + height);
            if (typeof (trueORfalse) != 'undefined') {
                console.info('videoCaps.isSizeSupported: ' + trueORfalse);
            } else {
                console.info('case isSizeSupported is not defined');
                expect().assertFail();
            }
        }, failCallback).catch(failCatch);
    }

    async function startEncProcess(codecFormat, savePath, mediaDescriptionEnc, done) {
        await toCreateVideoEncoderByMime(codecFormat, done);
        await toConfigureEnc(mediaDescriptionEnc, savePath);
        setCallbackEnc(done);
        await toGetInputSurface();
        await toPrepareEnc();
        await toStartEnc();
    }

    async function startDecProcess(codecFormat, readpath, mediaDescriptionDec, done) {
        await toCreateVideoDecoderByMime(codecFormat, done);
        await getFdRead(readpath, done);
        await toConfigureDec(mediaDescriptionDec);
        await toSetOutputSurface(false);
        setCallbackDec();
        await toPrepareDec();
        await toStartDec();
    }

    function checkFormat(done) {
        if (!isFormatSame) {
            console.info('case decoder and encoder pixelformat is not the same');
            expect().assertFail();
            done();
        }
    }

    eventEmitter.on('endOfEos', async(done) => {
        expect(outputEncEos).assertTrue();
        expect(DECoutputCnt).assertClose(ES_FRAME_SIZE.length, frameThreshold);
        expect(ENCoutputCnt).assertClose(ES_FRAME_SIZE.length, frameThreshold);
        if (needRelease) {
            await toReleaseEnc();
            await toReleaseDec();
            done();
        } else if (needStop) {
            eventEmitter.emit('stopAtEos');
        } else if (needFlush) {
            eventEmitter.emit('flushAtEos');
        } else if (needReset) {
            eventEmitter.emit('resetAtEos');
        } else {
            eventEmitter.emit('releaseAtEos');
        }
    });

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0100
        * @tc.name      : 000.test video software encoder capbility
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0100', 0, async function (done) {
        console.info("test video software encoder capbility");
        let supportedEncForm = [];
        let supportedDecForm = [];
        await toCreateVideoEncoderByMime(mime, done);
        await videoEncodeProcessor.getVideoEncoderCaps().then((videoCaps) => {
            console.info("case get getVideoEncoderCaps success");
            supportedEncForm = videoCaps.supportedFormats;
            if (supportedEncForm.length == 0) {
                isFormatSame = false;
            }
        }, failCallback).catch(failCatch);
        await toCreateVideoDecoderByMime(mime, done);
        await videoDecodeProcessor.getVideoDecoderCaps().then((videoCaps) => {
            console.info("case get getVideoDecoderCaps success");
            supportedDecForm = videoCaps.supportedFormats;
            if (supportedDecForm.length == 0) {
                isFormatSame = false;
            }
        }, failCallback).catch(failCatch);
        let formatPoi = -1;
        if(isFormatSame) {
            for (var item of supportedEncForm) {
                formatPoi = supportedDecForm.indexOf(item);
                if(formatPoi != -1) {
                    pixelFormat = item;
                    console.info('case pixelFormat is ' + pixelFormat);
                    break;
                }
            }
            if(formatPoi == -1) {
                isFormatSame = false;
            } else {
                mediaDescription.pixel_format = pixelFormat;
                mediaDescription2.pixel_format = pixelFormat;
            }
        }
        await toReleaseEnc();
        await toReleaseDec();
        done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0200
    * @tc.name      : 001.test release after last frame
    * @tc.desc      : basic encode function
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0200', 0, async function (done) {
        checkFormat(done);
        console.info("case test release after last frame");
        let savePath = 'video_hardware_encoder_function_0100.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needRelease = true;
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0300
    * @tc.name      : 002.test stop at running state and restart
    * @tc.desc      : basic encode function
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0300', 0, async function (done) {
        checkFormat(done);
        console.info("test stop at runnning state and restart");
        let savePath = 'video_hardware_encoder_function_0200.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = false;
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
        await sleep(3000);
        expect(outputEncEos).assertFalse();
        await toStopDec();
        await sleep(2000);
        await toStopEnc();
        expect(DECoutputCnt).assertClose(ENCoutputCnt, frameThreshold);
        await sleep(1000);
        await toStartEnc();
        resetReadParam();
        resetStateParam();
        needRelease = true;
        await toStartDec();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0400
        * @tc.name      : 003.test stop at EOS and restart
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0400', 0, async function (done) {
        checkFormat(done);
        console.info('case test stop at EOS and restart');
        let savePath = 'video_hardware_encoder_function_0300.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needStop = true;
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
        eventEmitter.on('stopAtEos', async() => {
            await toStopEnc();
            resetReadParam();
            resetStateParam();
            needRelease = true;
            await toStartEnc();
            await toFlushDec();
            await toStartDec();
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0500
        * @tc.name      : 004.test flush at running state
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0500', 0, async function (done) {
        checkFormat(done);
        console.info('case test flush at running state');
        let savePath = 'video_hardware_encoder_function_0400.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = false;
    
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
        await sleep(5000);
        expect(outputEncEos).assertFalse();
        await toFlushEnc();
        await toStartEnc();
        resetReadParam();
        resetStateParam();
        needRelease = true;
        await toFlushDec();
        await toStartDec();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0600
        * @tc.name      : 005.test flush at eos state
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0600', 0, async function (done) {
        checkFormat(done);
        console.info("case test flush at eos state");
        let savePath = 'video_hardware_encoder_function_0500.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needFlush = true;
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
        eventEmitter.on('flushAtEos', async() => {
            await toFlushEnc();
            await toStartEnc();
            resetReadParam();
            resetStateParam();
            needRelease = true;
            await toFlushDec();
            await toStartDec();
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0700
        * @tc.name      : 006.test reconfigure
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0700', 0, async function (done) {
        checkFormat(done);
        console.info("case test reconfigure");
        let savePath = 'video_hardware_encoder_function_0600.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needReset = true;
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
        eventEmitter.once('resetAtEos', async() => {
            await toResetEnc();
            await toResetDec();
            await toConfigureEnc(mediaDescription, savePath);
            setCallbackEnc(done);
            await toGetInputSurface();
            await toPrepareEnc();
            await toStartEnc();
            resetReadParam();
            resetStateParam();
            needRelease = true;
            await toConfigureDec(mediaDescription);
            await toSetOutputSurface(false);
            setCallbackDec();
            await toPrepareDec();
            await toStartDec();
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0800
        * @tc.name      : 007.test recreate videoencoder
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_PROMISE_0800', 0, async function (done) {
        checkFormat(done);
        console.info('case test recreate videoencoder');
        let savePath = 'video_hardware_encoder_function_0700.es';
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        await startEncProcess(mime, savePath, mediaDescription, done);
        await startDecProcess(mime, srcPath, mediaDescription2, done);
        eventEmitter.once('releaseAtEos', async() => {
            await toReleaseEnc();
            await toReleaseDec();
            await fileio.close(fdRead);
            resetReadParam();
            resetStateParam();
            needRelease = true;
            await startEncProcess(mime, savePath, mediaDescription, done);
            await startDecProcess(mime, srcPath, mediaDescription2, done);
        });
    })
})