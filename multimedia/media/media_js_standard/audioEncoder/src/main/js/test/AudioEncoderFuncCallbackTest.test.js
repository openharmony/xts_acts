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
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('AudioEncoderFuncCallback', function () {
    const AUDIOPATH = 'S16LE.pcm';
    let audioEncodeProcessor;
    let readStreamSync;
    let eosframenum = 0;
    let stopAtEOS = false;
    let resetAtEOS = false;
    let flushAtEOS = false;
    let workdoneAtEOS = false;
    let needGetMediaDes = false;
    let needrelease = false;
    let frameCnt = 1;
    let timestamp = 0;
    let sawInputEOS = false;
    let sawOutputEOS = false;
    let inputQueue = [];
    let outputQueue = [];
    const ES = [0, 4096];
    let ES_LENGTH = 1500;
    let readpath;
    let savepath;
    let fdRead;
    let fdWrite;
    let fileAsset;
    const context = featureAbility.getContext();
    let outputCnt = 0;
    let inputCnt = 0;
    let frameThreshold = 10;
    let lockFlag = false;

    beforeAll(async function() {
        console.info('beforeAll case 1');
    })

    beforeEach(function() {
        console.info('beforeEach case');
        audioEncodeProcessor = null;
        readStreamSync = undefined;
        eosframenum = 0;
        stopAtEOS = false;
        resetAtEOS = false;
        flushAtEOS = false;
        workdoneAtEOS = false;
        needGetMediaDes = false;
        needrelease = false;
        frameCnt = 1;
        timestamp = 0;
        sawInputEOS = false;
        sawOutputEOS = false;
        inputQueue = [];
        outputQueue = [];
        ES_LENGTH = 1500;
        outputCnt = 0;
        inputCnt = 0;
        lockFlag = false;
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (audioEncodeProcessor != null) {
            await audioEncodeProcessor.release().then(() => {
                console.info('audioEncodeProcessor release success');
                audioEncodeProcessor = null;
            }, failCallback).catch(failCatch);
        }
    })

    afterAll(async function() {
        console.info('afterAll case');
    })

    function resetParam() {
        readStreamSync = undefined;
        eosframenum = 0;
        stopAtEOS = false;
        resetAtEOS = false;
        flushAtEOS = false;
        workdoneAtEOS = false;
        needGetMediaDes = false;
        needrelease = false;
        frameCnt = 1;
        timestamp = 0;
        sawInputEOS = false;
        sawOutputEOS = false;
        inputQueue = [];
        outputQueue = [];
        outputCnt = 0;
        inputCnt = 0;
        lockFlag = false;
    }

    async function getFdRead(readPath, done) {
        await mediaTestBase.getFdRead(readPath, done).then((fdNumber) => {
            fdRead = fdNumber;
        })
    }

    function readFile(path) {
        console.info('case read file start execution');
        try{
            console.info('case filepath: ' + path);
            readStreamSync = fileio.fdopenStreamSync(fdRead, 'rb');
        }catch(e) {
            console.info(e);
        }
    }

    function getContent(buf, len) {
        console.info("case start get content");
        let lengthreal = -1;
        lengthreal = fileio.readSync(fdRead, buf, {length:len});
        console.info('case lengthreal is :' + lengthreal);
    }

    function writeFile(path, buf, len) {
        try{
            let res = fileio.writeSync(fdWrite, buf, {length: len});
            console.info('case fileio.write buffer success');
        } catch(e) {
            console.info('case fileio.write buffer error is ' + e);
        }
    }

    async function stopWork() {
        audioEncodeProcessor.stop((err) => {
            expect(err).assertUndefined();
            console.info("case stop success")
        })
    }

    async function resetWork() {
        resetParam();
        audioEncodeProcessor.reset((err) => {
            expect(err).assertUndefined();
            console.info("case reset success");
            if (needrelease) {
                audioEncodeProcessor.release((err) => {
                    expect(err).assertUndefined();
                    console.info("case release success");
                    audioEncodeProcessor = null;
                })
            }
        })
    }

    async function flushWork(done) {
        lockFlag = true;
        inputQueue = [];
        outputQueue = [];
        await getFdRead(readpath, done);
        audioEncodeProcessor.flush((err) => {
            expect(err).assertUndefined();
            console.info("case flush at inputeos success");
            resetParam();
            workdoneAtEOS =true;
            lockFlag = false;
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info("case start after flush success");
            })
        })
    }

    async function doneWork(done) {
        audioEncodeProcessor.stop((err) => {
            expect(err).assertUndefined();
            console.info("case stop success");
            resetParam();
            audioEncodeProcessor.reset((err) => {
                expect(err).assertUndefined();
                audioEncodeProcessor.release(async(err) => {
                    expect(err).assertUndefined();
                    console.log("case release success");
                    audioEncodeProcessor = null;
                    await fileio.close(fdRead);
                    done();
                })
            })
        })
    }

    function sleep(time) {
        return new Promise((resolve) => setTimeout(resolve, time));
    }

    function wait(time) {
        for(let t = Date.now(); Date.now() - t <= time;);
    }

    async function enqueueAllInputs(queue) {
        while (queue.length > 0 && !sawInputEOS) {
            let inputobject = queue.shift();
            if (frameCnt == eosframenum || frameCnt == ES_LENGTH + 1) {
                console.info("EOS frame seperately")
                inputobject.flags = 1;
                inputobject.timeMs = 0;
                inputobject.length = 0;
                sawInputEOS = true;
            } else {
                console.info("read frame from file");
                inputobject.timeMs = timestamp;
                inputobject.offset = 0;
                inputobject.length = ES[1];
                getContent(inputobject.data, ES[1]);
                inputobject.flags = 0;
            }
            timestamp += 23;
            frameCnt += 1;
            if (!lockFlag) {
                audioEncodeProcessor.pushInputData(inputobject, () => {
                    console.info('queueInput success');
                    inputCnt += 1;
                })
            }
        }
    }

    async function dequeueAllOutputs(queue, savepath, done) {
        while (queue.length > 0 && !sawOutputEOS) {
            let outputobject = queue.shift();
            if (outputobject.flags == 1) {
                sawOutputEOS = true;
                if (stopAtEOS) {
                    await stopWork();
                } else if (resetAtEOS) {
                    await resetWork();
                } else if (flushAtEOS) {
                    await flushWork(done);
                } else if (workdoneAtEOS) {
                    expect(outputCnt).assertClose(inputCnt, frameThreshold);
                    await doneWork(done);
                } else {
                    console.info("sawOutputEOS = true");
                }
            }
            else{
                console.info("write to file success");
            }
            if (!lockFlag) {
                audioEncodeProcessor.freeOutputBuffer(outputobject, () => {
                    console.info('release output success');
                })
            }
        }
    }

    function setCallback(savepath, done) {
        console.info('case callback');
        audioEncodeProcessor.on('needInputData', async(inBuffer) => {
            console.info('case inputBufferAvailable');
            inputQueue.push(inBuffer);
            await enqueueAllInputs(inputQueue);
        });
        audioEncodeProcessor.on('newOutputData', async(outBuffer) => {
            console.info('case outputBufferAvailable');
            outputCnt += 1;
            if (outputCnt == 1 && outBuffer.flags == 1) {
                console.info("case error occurs! first output is EOS");
                expect().assertFail();
            }
            if (needGetMediaDes) {
                audioEncodeProcessor.getOutputMediaDescription((err, MediaDescription) => {
                    expect(err).assertUndefined();
                    console.info("case get OutputMediaDescription success");
                    console.info('get outputMediaDescription : ' + MediaDescription);
                    needGetMediaDes=false;
                });
            }
            outputQueue.push(outBuffer);
            await dequeueAllOutputs(outputQueue, savepath, done);
        });
        audioEncodeProcessor.on('error',(err) => {
            console.info('case error called,errName is' + err);
        });
        audioEncodeProcessor.on('streamChanged',(format) => {
            console.info('case Output format changed: ' + format);
        });
    }

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0100
        * @tc.name      : 000.test set EOS after last frame and reset
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0100', 0, async function (done) {
        console.info("test set EOS after last frame and reset");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        let mediaDescription2 = {
            "codec_mime": 'audio/mp4a-latm',
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_00.aac';
        await getFdRead(readpath, done);
        needGetMediaDes = true;
        workdoneAtEOS = true;
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, AudioCaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info(`AudioCaps: ` + AudioCaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
            })
        });
        media.getMediaCapability((err, mediaCaps) => {
            expect(err).assertUndefined();
            console.info(`case getMediaCapability 1`);
            mediaCaps.getAudioEncoderCaps((err, audioCaps) => {
                expect(err).assertUndefined();
                console.info('getAudioEncoderCaps success');
                if (typeof (audioCaps) != 'undefined') {
                    console.info("case audioCaps " + audioCaps);
                } else {
                    console.info("case audioCaps is not defined");
                }
            })
            mediaCaps.findAudioEncoder(mediaDescription2, (err, codecname) => {
                expect(err).assertUndefined();
                console.info('findAudioEncoder success');
                if (typeof (codecname) != 'undefined') {
                    console.info("case codecname " + codecname);
                } else {
                    console.info("case codecname is not defined");
                }
            })
        })
        media.createAudioEncoderByName('avenc_aac', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder by mime 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0200
        * @tc.name      : 001.test set EOS manually before last frame and reset
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0200', 0, async function (done) {
        console.info("case test set EOS manually before last frame and reset");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_01.aac';
        await getFdRead(readpath, done);
        eosframenum = 500;
        workdoneAtEOS = true;
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, Audiocaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info("AudioCaps: " + Audiocaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
            })
        });
        media.createAudioEncoderByMime('audio/mp4a-latm', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0300
        * @tc.name      : 002.test flush at running state
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0300', 0, async function (done) {
        console.info("case test flush at running state");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_02.aac';
        await getFdRead(readpath, done);
        workdoneAtEOS = true;
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, Audiocaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info("AudioCaps: " + Audiocaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start(async(err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
                await sleep(500);
                eventEmitter.emit('flush');
            })
        });
        eventEmitter.on('flush', () => {
            lockFlag = true;
            inputQueue = [];
            outputQueue = [];
            audioEncodeProcessor.flush((err) => {
                expect(err).assertUndefined();
                console.info(`case flush after 2s success`);
                lockFlag = false;
                audioEncodeProcessor.start((err) => {
                    expect(err).assertUndefined();
                    console.info(`case start after flush success`);
                })
            })
        });
        media.createAudioEncoderByMime('audio/mp4a-latm', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0400
        * @tc.name      : 003. test flush at EOS state
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0400', 0, async function (done) {
        console.info("case test flush at EOS state");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_03.aac';
        await getFdRead(readpath, done);
        eosframenum = 500;
        flushAtEOS = true;
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, Audiocaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info("AudioCaps: " + Audiocaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
            })
        });
        media.createAudioEncoderByMime('audio/mp4a-latm', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0500
        * @tc.name      : 004.test stop at running state and reset
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0500', 0, async function (done) {
        console.info("case test stop at running state and reset");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_04.aac';
        await getFdRead(readpath, done);
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, Audiocaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info("AudioCaps: " + Audiocaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
                eventEmitter.emit('stop');
            })
        });
        eventEmitter.on('stop', () => {
            sleep(5000).then(() => {
                audioEncodeProcessor.stop((err) => {
                    expect(err).assertUndefined();
                    console.info(`case stop 1`);
                    eventEmitter.emit('reset');
                })
            })
        });
        eventEmitter.on('reset', () => {
            resetParam();
            audioEncodeProcessor.reset((err) => {
                expect(err).assertUndefined();
                console.info(`case reset 1`);
                eventEmitter.emit('release');
            })
        });
        eventEmitter.on('release', () => {
            audioEncodeProcessor.release(async(err) => {
                expect(err).assertUndefined();
                console.info(`case release 1`);
                audioEncodeProcessor = null;
                await fileio.close(fdRead);
                done();
            })
        });
        media.createAudioEncoderByMime('audio/mp4a-latm', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0600
        * @tc.name      : 005.test stop and restart
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0600', 0, async function (done) {
        console.info("case test stop and restart");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_05.aac';
        await getFdRead(readpath, done);
        eosframenum = 100;
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, Audiocaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info("AudioCaps: " + Audiocaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
                eventEmitter.emit('stop');
            })
        });
        eventEmitter.on('stop', () => {
            sleep(5000).then(() => {
                audioEncodeProcessor.stop((err) => {
                    expect(err).assertUndefined();
                    console.info(`stop after 5s`);
                    resetParam();
                    eventEmitter.emit('restart');
                })
            })
        });
        eventEmitter.on('restart', () => {
            sleep(2000).then(async() => {
                resetParam();
                await getFdRead(readpath, done);
                audioEncodeProcessor.start((err) => {
                    expect(err).assertUndefined();
                    console.info(`restart after 2s`);
                    workdoneAtEOS = true;
                    enqueueAllInputs(inputQueue);
                })
            })
        });
        media.createAudioEncoderByMime('audio/mp4a-latm', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0700
        * @tc.name      : 006.test reconfigure for new file with the same format
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_0700', 0, async function (done) {
        console.info("case test reconfigure for new file with the same format");
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let mediaDescription = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        readpath = AUDIOPATH;
        savepath = 'audioEncode_function_callback_06.aac';
        await getFdRead(readpath, done);
        eosframenum = 100;
        resetAtEOS = true;
        let mediaDescription2 = {
            "channel_count": 2,
            "sample_rate": 44100,
            "audio_sample_format": 1,
        }
        let hasreconfigured = false;
        eventEmitter.on('getAudioEncoderCaps', () => {
            audioEncodeProcessor.getAudioEncoderCaps((err, Audiocaps) => {
                expect(err).assertUndefined();
                console.info(`case getAudioEncoderCaps 1`);
                console.info("AudioCaps: " + Audiocaps);
                eventEmitter.emit('configure', mediaDescription);
            })
        });
        eventEmitter.on('configure', (mediaDescription) => {
            audioEncodeProcessor.configure(mediaDescription, (err) => {
                expect(err).assertUndefined();
                console.info(`case configure 1`);
                eventEmitter.emit('prepare');
            })
        });
        eventEmitter.on('prepare', () => {
            audioEncodeProcessor.prepare((err) => {
                expect(err).assertUndefined();
                console.info(`case prepare 1`);
                setCallback(savepath, done);
                eventEmitter.emit('start');
            })
        });
        eventEmitter.on('start', () => {
            audioEncodeProcessor.start((err) => {
                expect(err).assertUndefined();
                console.info(`case start 1`);
                if (!hasreconfigured) {
                    eventEmitter.emit('reconfigure', mediaDescription2);
                }
            })
        });
        eventEmitter.on('reconfigure', (mediaDescription2) => {
            sleep(10000).then(async() => {
                resetParam();
                await fileio.close(fdRead);
                audioEncodeProcessor.configure(mediaDescription2, async(err) => {
                    expect(err).assertUndefined();
                    console.info(`case configure 2`);
                    resetParam();
                    readpath = AUDIOPATH;
                    savepath = 'audioEncode_function_callback_06_2.aac';
                    await getFdRead(readpath, done);
                    workdoneAtEOS = true;
                    hasreconfigured = true;
                    eventEmitter.emit('prepare');
                })
            })
        });
        media.createAudioEncoderByMime('audio/mp4a-latm', (err, processor) => {
            expect(err).assertUndefined();
            console.info(`case createAudioEncoder 1`);
            audioEncodeProcessor = processor;
            eventEmitter.emit('getAudioEncoderCaps');
        })
    })
})