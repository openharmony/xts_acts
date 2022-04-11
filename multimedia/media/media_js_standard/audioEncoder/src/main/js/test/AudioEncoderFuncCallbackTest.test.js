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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import featureAbility from '@ohos.ability.featureAbility'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import {getFileDescriptor, closeFileDescriptor} from './AudioEncoderTestBase.test.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('AudioEncoderFuncCallback', function () {
    const RESOURCEPATH = '/data/accounts/account_0/appdata/ohos.acts.multimedia.audio.audioencoder/'
    const AUDIOPATH = 'S16LE.pcm';
    const BASIC_PATH = RESOURCEPATH + 'results/encode_func_callback_';
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
    const mediaTest = mediaLibrary.getMediaLibrary(context);
    let fileKeyObj = mediaLibrary.FileKey;

    beforeAll(async function() {
        console.info('beforeAll case 1');
        await applyPermission();
        console.info('beforeAll case after get permission');
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
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (audioEncodeProcessor != null) {
            await audioEncodeProcessor.release().then(() => {
                console.info('audioEncodeProcessor release success');
                audioEncodeProcessor = null;
            }, failCallback).catch(failCatch);
        }
        await closeFileDescriptor(AUDIOPATH);
        await closeFdWrite();
    })

    afterAll(async function() {
        console.info('afterAll case');
        await closeFileDescriptor(AUDIOPATH);
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
    }

    async function getFdRead(pathName, done) {
        await getFileDescriptor(pathName).then((res) => {
            if (res == undefined) {
                expect().assertFail();
                console.info('case error fileDescriptor undefined, open file fail');
                done();
            } else {
                fdRead = res.fd;
                console.info("case fdRead is: " + fdRead);
            }
        })
    }

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.audio.audioencoder', 0, 100);
        let atManager = abilityAccessCtrl.createAtManager();
        if (atManager != null) {
            let tokenID = appInfo.accessTokenId;
            console.info('[permission] case accessTokenID is ' + tokenID);
            let permissionName1 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName2 = 'ohos.permission.READ_MEDIA';
            let permissionName3 = 'ohos.permission.WRITE_MEDIA';
            await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName3, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
        } else {
            console.info('[permission] case apply permission failed, createAtManager failed');
        }
    }

    async function getFdWrite(pathName) {
        console.info('[mediaLibrary] case start getFdWrite');
        console.info('[mediaLibrary] case getFdWrite pathName is ' + pathName);
        let mediaType = mediaLibrary.MediaType.AUDIO;
        console.info('[mediaLibrary] case mediaType is ' + mediaType);
        let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
        console.info('[mediaLibrary] case getFdWrite publicPath is ' + publicPath);
        let dataUri = await mediaTest.createAsset(mediaType, pathName, publicPath);
        if (dataUri != undefined) {
            let args = dataUri.id.toString();
            let fetchOp = {
                selections : fileKeyObj.ID + "=?",
                selectionArgs : [args],
            }
            let fetchWriteFileResult = await mediaTest.getFileAssets(fetchOp);
            console.info('[mediaLibrary] case getFdWrite getFileAssets() success');
            fileAsset = await fetchWriteFileResult.getAllObject();
            console.info('[mediaLibrary] case getFdWrite getAllObject() success');
            fdWrite = await fileAsset[0].open('Rw');
            console.info('[mediaLibrary] case getFdWrite fdWrite is ' + fdWrite);
        }
    }

    async function closeFdWrite() {
        if (fileAsset != null) {
            await fileAsset[0].close(fdWrite).then(() => {
                console.info('[mediaLibrary] case close fdWrite success, fd is ' + fdWrite);
            }).catch((err) => {
                console.info('[mediaLibrary] case close fdWrite failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAsset is null');
        }
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
        lengthreal = readStreamSync.readSync(buf,{length:len});
        console.info('case lengthreal is :' + lengthreal);
    }

    function writeHead(path, len) {
        console.info('case writeFile buffer.length is: ' + len);
        try{
            let head = new ArrayBuffer(7);
            addADTStoPacket(head, len);
            let res = fileio.writeSync(fdWrite, head, {length: 7});
            console.info('case fileio.write head success');
        } catch(e) {
            console.info('case fileio.write head error is ' + e);
        }
    }

    function writeFile(path, buf, len) {
        try{
            let res = fileio.writeSync(fdWrite, buf, {length: len});
            console.info('case fileio.write buffer success');
        } catch(e) {
            console.info('case fileio.write buffer error is ' + e);
        }
    }

    function addADTStoPacket(head, len) {
        let view = new Uint8Array(head);
        console.info("start add ADTS to Packet");
        let packetLen = len + 7; // 7: head length
        let profile = 2; // 2: AAC LC  
        let freqIdx = 4; // 4: 44100HZ 
        let chanCfg = 2; // 2: 2 channel
        view[0] = 0xFF;
        view[1] = 0xF9;
        view[2] = ((profile - 1) << 6) + (freqIdx << 2) + (chanCfg >> 2);
        view[3] = ((chanCfg & 3) << 6) + (packetLen >> 11);
        view[4] = (packetLen & 0x7FF) >> 3;
        view[5] = ((packetLen & 7) << 5) + 0x1F;
        view[6] = 0xFC;
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
        inputQueue = [];
        outputQueue = [];
        await closeFileDescriptor(readpath);
        await getFdRead(readpath, done);
        audioEncodeProcessor.flush((err) => {
            expect(err).assertUndefined();
            console.info("case flush at inputeos success");
            resetParam();
            readFile(AUDIOPATH);
            workdoneAtEOS =true;
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
                    await closeFileDescriptor(AUDIOPATH);
                    await closeFdWrite();
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
            audioEncodeProcessor.pushInputData(inputobject, () => {
                console.info('queueInput success');
            })
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
                    await doneWork(done);
                } else {
                    console.info("sawOutputEOS = true");
                }
            }
            else{
                writeHead(savepath, outputobject.length);
                writeFile(savepath, outputobject.data, outputobject.length);
                console.info("write to file success");
            }
            audioEncodeProcessor.freeOutputBuffer(outputobject, () => {
                console.info('release output success');
            })
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_00_0100
        * @tc.name      : 000.test set EOS after last frame and reset
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_00_0100', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0100
        * @tc.name      : 001.test set EOS manually before last frame and reset
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0100', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0200
        * @tc.name      : 002.test flush at running state
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0200', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
                setTimeout(() => {eventEmitter.emit('flush')},5000)
            })
        });
        eventEmitter.on('flush', () => {
            inputQueue = [];
            outputQueue = [];
            audioEncodeProcessor.flush((err) => {
                expect(err).assertUndefined();
                console.info(`case flush after 5s`);
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0300
        * @tc.name      : 003. test flush at EOS state
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0300', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0400
        * @tc.name      : 004.test stop at running state and reset
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0400', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
                await closeFileDescriptor(AUDIOPATH);
                await closeFdWrite();
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0500
        * @tc.name      : 005.test stop and restart
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0500', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
                    readFile(AUDIOPATH);
                    eventEmitter.emit('restart');
                })
            })
        });
        eventEmitter.on('restart', () => {
            sleep(2000).then(async() => {
                resetParam();
                await closeFileDescriptor(readpath);
                await getFdRead(readpath, done);
                readFile(readpath);
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
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0600
        * @tc.name      : 006.test reconfigure for new file with the same format
        * @tc.desc      : basic Encode function
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FUNCTION_CALLBACK_01_0600', 0, async function (done) {
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
        await getFdWrite(savepath);
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
                readFile(AUDIOPATH);
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
                await closeFileDescriptor(readpath);
                await closeFdWrite();
                audioEncodeProcessor.configure(mediaDescription2, async(err) => {
                    expect(err).assertUndefined();
                    console.info(`case configure 2`);
                    resetParam();
                    readFile(AUDIOPATH)
                    readpath = AUDIOPATH;
                    savepath = 'audioEncode_function_callback_06_2.aac';
                    await getFdWrite(savepath);
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