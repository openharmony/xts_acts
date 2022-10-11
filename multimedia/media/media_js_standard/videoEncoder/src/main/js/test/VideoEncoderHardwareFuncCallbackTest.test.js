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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import * as mediaTestBase from '../../../../../MediaTestBase.js';

describe('videoHardwareEncoderFuncCallback', function () {
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
    let isFormatSame = true;
    let pixelFormat = 0;
    let mediaDescription = {
        'width': 320,
        'height': 240,
        'pixel_format': 2,
        'frame_rate': 60,
    }
    let mediaDescription2 = {
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
    let needGetMediaDes = true;

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
        lockFlag = false;
        needRelease = false;
        needStop = false;
        needFlush = false;
        needReset = false;
        needGetMediaDes = true;
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

    async function dequeueOutputs(done) {
        while (outputQueue.length > 0 && !outputEncEos) {
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
                    videoEncodeProcessor.freeOutputBuffer(outputObject, (err) => {
                        if (typeof(err) == 'undefined') {
                            console.info('in case ENC release output success');
                            ENCoutputCnt += 1;
                            console.info('in case ENC: ENCoutputCnt is ' + ENCoutputCnt);
                        } else {
                            console.info(`in case release output called,errMessage is ${err.message}`);
                        }                
                    });
                }
            }
        } 
    }

    function setCallbackEnc(done) {
        console.info('case callback');
        videoEncodeProcessor.on('newOutputData', async(outBuffer) => {
            console.info('in case ENC outputBufferAvailable');
            if (needGetMediaDes) {
                videoEncodeProcessor.getOutputMediaDescription().then((MediaDescription) => {
                    console.info("get OutputMediaDescription success");
                    console.info('get outputMediaDescription : ' + MediaDescription);
                    needGetMediaDes = false;
                }, failCallback).catch(failCatch);
            }
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

    eventEmitter.on('toCreateVideoEnc', (encFormat, decFormat, mediaDescriptionEnc, mediaDescriptionDec, done) => {
        media.createVideoEncoderByMime(encFormat, (err, processor) => {
            expect(err).assertUndefined();
            if (typeof(processor) != 'undefined') {
                console.info('in case ENC : create createVideoEncoderByMime success');
                videoEncodeProcessor = processor;
                eventEmitter.emit('toCreateVideoDec', decFormat, mediaDescriptionEnc, mediaDescriptionDec, done);
            } else {
                console.info('case create createVideoEncoderByMime fail');
                expect().assertFail();
                done();
            }
        });
    });
    eventEmitter.on('toConfigureEnc', (mediaDescriptionEnc, mediaDescriptionDec, done) => {
        console.info('in case ENC: configure in');
        videoEncodeProcessor.configure(mediaDescriptionEnc, async(err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: configure success');
            setCallbackEnc(done);
            eventEmitter.emit('toConfigureDec', mediaDescriptionDec, done);
        });
    });
    eventEmitter.on('toGetInputSurface', (done) => {
        videoEncodeProcessor.getInputSurface((err, inputSurface) => {
            expect(err).assertUndefined();
            if (inputSurface != undefined) {
                surfaceID = inputSurface;
                console.info('in case ENC: getInputSurface success, surfaceID ' + surfaceID);
                eventEmitter.emit('toSetOutputSurface');
            } else {
                console.info('in case ENC: inputSurface is undefined');
                expect(inputSurface != undefined).assertTrue();
                done();
            }
        })
    });
    eventEmitter.on('toPrepareEnc', () => {
        videoEncodeProcessor.prepare((err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: prepare success');
            eventEmitter.emit('toStartEnc');
        });
    });
    eventEmitter.on('toStartEnc', () => {
        videoEncodeProcessor.start((err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: start success');
            eventEmitter.emit('toPrepareDec');
        });
    });
    eventEmitter.on('toFlushEnc', () => {
        lockFlag = true;
        videoEncodeProcessor.flush((err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: flush success');
            lockFlag = false;
        });
    });
    eventEmitter.on('toStopEnc', () => {
        videoEncodeProcessor.stop((err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: stop success');
        });
    });
    eventEmitter.on('toResetEnc', () => {
        videoEncodeProcessor.reset((err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: reset success');
        });
    });
    eventEmitter.on('toReleaseEnc', () => {
        videoEncodeProcessor.release((err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: release success');
            videoEncodeProcessor = null;
        });
    });

    eventEmitter.on('toCreateVideoDec', (decFormat, mediaDescriptionEnc, mediaDescriptionDec, done) => {
        media.createVideoDecoderByMime(decFormat, (err, processor) => {
            expect(err).assertUndefined();
            if (typeof(processor) != 'undefined') {
                console.info('in case DEC: create createVideoDecoderByMime success');
                videoDecodeProcessor = processor;
                eventEmitter.emit('toConfigureEnc', mediaDescriptionEnc, mediaDescriptionDec, done);
            } else {
                console.info('case create createVideoDecoderByMime fail');
                expect().assertFail();
                done();
            }
        });
    })
    eventEmitter.on('toConfigureDec', (mediaDescriptionDec, done) => {
        console.info('in case DEC: configure in');
        videoDecodeProcessor.configure(mediaDescriptionDec, async(err) => {
            expect(err).assertUndefined();
            console.info('in case DEC: configure success');
            setCallbackDec(done);
            eventEmitter.emit('toGetInputSurface', done);
        });
    });
    eventEmitter.on('toSetOutputSurface', () => {
        videoDecodeProcessor.setOutputSurface(surfaceID, false, (err) => {
            expect(err).assertUndefined();
            console.info('in case DEC: setOutputSurface success. surfaceID ' + surfaceID);
            eventEmitter.emit('toPrepareEnc');
        })
    });
    eventEmitter.on('toPrepareDec', () => {
        videoDecodeProcessor.prepare((err) => {
            expect(err).assertUndefined();
            console.info('in case DEC: prepare success');
            eventEmitter.emit('toStartDec');
        });
    });
    eventEmitter.on('toStartDec', () => {
        videoDecodeProcessor.start((err) => {
            expect(err).assertUndefined();
            console.info('in case DEC: start success');
        });
    });
    async function toStartDec() {
        await videoDecodeProcessor.start().then(() => {
            console.info("in case DEC: start success");
        }, failCallback).catch(failCatch);
    }
    async function toStartEnc() {
        await videoEncodeProcessor.start().then(() => {
            console.info("in case ENC: start success");
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
        lockFlag = true;
        await videoDecodeProcessor.stop().then(() => {
            console.info("in case DEC: stop success");
            lockFlag = false;
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
            videoEncodeProcessor.release(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: release success');
                videoEncodeProcessor = null;
                await toReleaseDec();
                done();
            });
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
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0100
        * @tc.name      : 000.test video software encoder capbility
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0100', 0, async function (done) {
        console.info("test video encoder capbility");
        let supportedEncForm = [];
        let supportedDecForm = [];
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
        await videoEncodeProcessor.getVideoEncoderCaps().then((videoCaps) => {
            console.info("case get getVideoEncoderCaps success");
            supportedEncForm = videoCaps.supportedFormats;
            console.info('case supportedEncForm is ' + supportedEncForm);
            console.info('case supportedEncForm.length is ' + supportedEncForm.length);
            if (supportedEncForm.length == 0) {
                isFormatSame = false;
            }
        }, failCallback).catch(failCatch);
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
        await videoDecodeProcessor.getVideoDecoderCaps().then((videoCaps) => {
            console.info("case get getVideoEncoderCaps success");
            supportedDecForm = videoCaps.supportedFormats;
            console.info('case supportedDecForm is ' + supportedDecForm);
            console.info('case supportedDecForm.length is ' + supportedDecForm.length);
            if (supportedDecForm.length == 0) {
                isFormatSame = false;
            }
        }, failCallback).catch(failCatch);
        let formatPoi = -1;
        if (isFormatSame) {
            for(var item of supportedEncForm) {
                formatPoi = supportedDecForm.indexOf(item);
                if (formatPoi != -1) {
                    pixelFormat = item;
                    console.info("case pixelFormat is " + pixelFormat);
                    break;
                }
            }
            if (formatPoi == -1) {
                isFormatSame = false;
            } else {
                mediaDescription.pixel_format = pixelFormat;
                mediaDescription2.pixel_format = pixelFormat;
                console.info("case mediaDescription is " + JSON.stringify(mediaDescription));
                console.info("case mediaDescription2 is " + JSON.stringify(mediaDescription2));
            }
        }
        await videoEncodeProcessor.release().then(() => {
            console.info("case release videoEncodeProcessor success"); 
            videoEncodeProcessor = null;
        }, failCallback).catch(failCatch);
        await toReleaseDec();
        done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0200
    * @tc.name      : 001.test release after last frame
    * @tc.desc      : basic encode function
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0200', 0, async function (done) {
        checkFormat(done);
        console.info("case test release after last frame");
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needRelease = true;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
    })


    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0300
    * @tc.name      : 002.test stop at running state and restart
    * @tc.desc      : basic encode function
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0300', 0, async function (done) {
        checkFormat(done);
        console.info("test stop at runnning state and restart");
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = false;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
        await sleep(5000);
        await toStopDec();
        await sleep(2000);
        expect(outputEncEos).assertFalse();
        videoEncodeProcessor.stop(async(err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: stop success');
            expect(DECoutputCnt).assertClose(ENCoutputCnt, frameThreshold);
            await sleep(2000);
            eventEmitter.emit('startEncAfterStopAtRunning');
        });
        eventEmitter.on('startEncAfterStopAtRunning', () => {
            videoEncodeProcessor.start(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: start again after stop at running state success');
                resetReadParam();
                resetStateParam();
                needRelease = true;
                eventEmitter.emit('toStartDec');
            });
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0400
        * @tc.name      : 003.test stop at EOS and restart
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0400', 0, async function (done) {
        checkFormat(done);
        console.info('case test stop at EOS and restart');
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needStop = true;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
        eventEmitter.on('stopAtEos', () => {
            videoEncodeProcessor.stop(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: stop success');
                await sleep(2000);
                eventEmitter.emit('startEncAfterStopAtEos');
            });
        });
        eventEmitter.on('startEncAfterStopAtEos', () => {
            videoEncodeProcessor.start(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: start again after stop at running state success');
                resetReadParam();
                resetStateParam();
                needRelease = true;
                await toFlushDec();
                await toStartDec();
            });
        });
    })

    
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0500
        * @tc.name      : 004.test flush at running state
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0500', 0, async function (done) {
        checkFormat(done);
        console.info('case test flush at running state');
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = false;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
        await sleep(5000);
        expect(outputEncEos).assertFalse();
        lockFlag = true;
        videoEncodeProcessor.flush(async(err) => {
            expect(err).assertUndefined();
            console.info('in case ENC: flush at running success');
            resetReadParam();
            resetStateParam();
            needRelease = true;
            await toStartEnc();
            await toFlushDec();
            await toStartDec();
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0600
        * @tc.name      : 005.test flush at eos state
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0600', 0, async function (done) {
        checkFormat(done);
        console.info("case test flush at eos state");
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needFlush = true;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
        eventEmitter.once('flushAtEos', async() => {
            lockFlag = true;
            videoEncodeProcessor.flush(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: flush at EOS success');
                resetReadParam();
                resetStateParam();
                needRelease = true;
                await toStartEnc();
                await toFlushDec();
                await toStartDec();
            });
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0700
        * @tc.name      : 006.test reconfigure
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0700', 0, async function (done) {
        checkFormat(done);
        console.info("case test reconfigure");
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        needReset = true;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
        eventEmitter.once('resetAtEos', async() => {
            videoEncodeProcessor.reset(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: reset success');
                await toResetDec();
                resetReadParam();
                resetStateParam();
                needRelease = true;
                eventEmitter.emit('toConfigureEnc', mediaDescription, mediaDescription2, done);
            });
        });
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0800
        * @tc.name      : 007.test recreate videoencoder
        * @tc.desc      : basic encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_HARDWARE_ENCODER_FUNCTION_CALLBACK_0800', 0, async function (done) {
        checkFormat(done);
        console.info('case test recreate videoencoder');
        ES_FRAME_SIZE = H264_FRAME_SIZE_60FPS_320;
        isCodecData = true;
        needSetEos = true;
        await getFdRead(srcPath);
        eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
        eventEmitter.once('releaseAtEos', async() => {
            videoEncodeProcessor.release(async(err) => {
                expect(err).assertUndefined();
                console.info('in case ENC: release success');
                videoEncodeProcessor = null;
                await toReleaseDec();
                resetReadParam();
                resetStateParam();
                needRelease = true;
                await fileio.close(fdRead);
                await getFdRead(srcPath);
                eventEmitter.emit('toCreateVideoEnc', mime, mime, mediaDescription, mediaDescription2, done);
            });
        });
    })
})
