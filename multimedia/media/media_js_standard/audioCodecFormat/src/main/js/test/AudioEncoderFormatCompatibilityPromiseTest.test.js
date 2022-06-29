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
import fileio from '@ohos.fileio'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import featureAbility from '@ohos.ability.featureAbility'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import {getFileDescriptor, closeFileDescriptor} from './AudioFormatTestBase.test.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('AudioEncoderFormatCompatibilityPromise', function () {
    let audioEncodeProcessor;
    let eosframenum = 0;
    let resetAtEOS = false;
    let workdoneAtEOS = false;
    let needgetMediaDes = false;
    let needrelease = false;
    let frameCnt = 1;
    let timestamp = 0;
    let rate = 0;
    let sawInputEOS = false;
    let sawOutputEOS = false;
    let inputQueue = [];
    let outputQueue = [];
    let ES = [0, 2048];
    let ES_LENGTH = 1000;
    let readPath;
    let fdRead;
    let fdWrite;
    let readStreamSync;
    let fileAssetWrite;
    let channelCount;
    let channelCountList = [];
    let sampleRateList = [];
    let formatSampleRate = [];
    const events = require('events');
    const eventEmitter = new events.EventEmitter();
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
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (audioEncodeProcessor != null) {
            console.info('case audioEncodeProcessor is not null');
            await audioEncodeProcessor.release().then(() => {
                console.info('audioEncodeProcessor release success');
                audioEncodeProcessor = null;
            }, failCallback).catch(failCatch);
        }
        await closeFileDescriptor(readPath);
        await closeFdWrite();
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

    async function resetParam() {
        eosframenum = 0;
        resetAtEOS = false;
        workdoneAtEOS = false;
        needgetMediaDes = false;
        needrelease = false
        frameCnt = 1;
        timestamp = 0;
        rate = 0;
        sawInputEOS = false;
        sawOutputEOS = false;
        readStreamSync = undefined;
        inputQueue = [];
        outputQueue = [];
        ES = [0, 4096]
        ES_LENGTH = 1000;
    }

    async function beforeTest() {
        console.info('beforeTest case');
        audioEncodeProcessor = null;
        eosframenum = 0;
        resetAtEOS = false;
        workdoneAtEOS = false;
        needgetMediaDes = false;
        needrelease = false
        frameCnt = 1;
        timestamp = 0;
        rate = 0;
        sawInputEOS = false;
        sawOutputEOS = false;
        readStreamSync = undefined;
        inputQueue = [];
        outputQueue = [];
        ES = [0, 4096]
        ES_LENGTH = 1000;
    }

    async function aferTest() {
        console.info('afterTest case');
        if (audioEncodeProcessor != null) {
            console.info('case audioEncodeProcessor is not null');
            await audioEncodeProcessor.release().then(() => {
                console.info('audioEncodeProcessor release success');
                audioEncodeProcessor = null;
            }, failCallback).catch(failCatch);
        }
        await closeFileDescriptor(readPath);
        await closeFdWrite();
    }

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.audio.codecformat', 0, 100);
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
            fileAssetWrite = await fetchWriteFileResult.getAllObject();
            console.info('[mediaLibrary] case getFdWrite getAllObject() success');
            fdWrite = await fileAssetWrite[0].open('Rw');
            console.info('[mediaLibrary] case getFdWrite fdWrite is ' + fdWrite);
        }
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

    async function closeFdWrite() {
        if (fileAssetWrite != null) {
            await fileAssetWrite[0].close(fdWrite).then(() => {
                console.info('[mediaLibrary] case close fdWrite success, fd is ' + fdWrite);
            }).catch((err) => {
                console.info('[mediaLibrary] case close fdWrite failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAssetWrite is null');
        }
    }

    function writeHead(len) {
        try{
            let head = new ArrayBuffer(7);
            addADTStoPacket(head, len);
            let res = fileio.writeSync(fdWrite, head, {length: 7});
            console.info('case fileio.write head success');
        } catch(e) {
            console.info('case fileio.write head error is ' + e);
        }
    }

    function writeFile(buf, len) {
        try{
            let res = fileio.writeSync(fdWrite, buf, {length: len});
            console.info('case fileio.write buffer success');
        } catch(e) {
            console.info('case fileio.write buffer error is ' + e);
        }
    }

    function readFile(path) {
        console.info('read file start execution');
        try{
            console.info('filepath: ' + path);
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

    function addADTStoPacket(head, len) {
        let view = new Uint8Array(head);
        console.info("start add ADTS to Packet");
        let packetLen = len + 7; // 7: head length
        let profile = 2; // 2: AAC LC  
        let freqIdx = rate; // 3: 48000HZ 
        let chanCfg = channelCount; // 1: 1 channel
        console.info('rate: ' + rate);
        view[0] = 0xFF;
        view[1] = 0xF9;
        view[2] = ((profile - 1) << 6) + (freqIdx << 2) + (chanCfg >> 2);
        view[3] = ((chanCfg & 3) << 6) + (packetLen >> 11);
        view[4] = (packetLen & 0x7FF) >> 3;
        view[5] = ((packetLen & 7) << 5) + 0x1F;
        view[6] = 0xFC;
    }

    async function resetWork() {
        resetParam();
        await audioEncodeProcessor.reset().then(async() => {
            console.info("case reset success");
            if (needrelease) {
                await audioEncodeProcessor.release().then(() => {
                    console.info("case release success");
                }, failCallback).catch(failCatch);
                audioEncodeProcessor = null;
            }
        }, failCallback).catch(failCatch);
    }

    async function doneWork() {
        await audioEncodeProcessor.stop().then(() => {
            console.info("case stop success");
        }, failCallback).catch(failCatch);
        resetParam();
        await audioEncodeProcessor.reset().then(() => {
            console.info("case reset success");
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.release().then(() => {
            console.info("case release success");
        }, failCallback).catch(failCatch);
        audioEncodeProcessor = null;
    }

    async function enqueueInputs(queue) {
        while (queue.length > 0 && !sawInputEOS) {
            let inputobject = queue.shift();
            console.info("case frameCnt:" + frameCnt);
            if (frameCnt == eosframenum || frameCnt == ES_LENGTH + 1) {
                console.info("case EOS frame seperately")
                inputobject.flags = 1;
                inputobject.timeMs = 0;
                inputobject.length = 0;
                sawInputEOS = true;
            } else {
                console.info("case read frame from file");
                inputobject.timeMs = timestamp;
                inputobject.offset = 0;
                inputobject.length = ES[1];
                getContent(inputobject.data, ES[1]);
                inputobject.flags = 0;
            }
            timestamp += 23;
            frameCnt += 1;
            audioEncodeProcessor.pushInputData(inputobject).then(() => {
                console.info('case queueInput success');
            });
        }
    }

    async function dequeueOutputs(queue, nextStep, done) {
        while (queue.length > 0 && !sawOutputEOS) {
            let outputObject = queue.shift();
            if (outputObject.flags == 1) {
                sawOutputEOS = true;
                await doneWork(); 
                if(sampleRateList == false && channelCountList[0] != undefined) {
                    await aferTest();
                    channelCount = channelCountList.shift();
                    sampleRateList = formatSampleRate.toString().split(',');
                    console.info('channelCountList[0]: ' + channelCountList[0]);
                    console.info('formatSampleRate ' + formatSampleRate);
                    nextStep();
                    return;
                }else if (channelCountList == false && sampleRateList == false) {
                    done();
                } else {
                    await aferTest();
                    nextStep();
                    return;
                }                
            } else {
                writeFile(outputObject.data, outputObject.length);
                console.info("write to file success");
            }
            audioEncodeProcessor.freeOutputBuffer(outputObject).then(() => {
                console.info('release output success');
            });
        }
    }

    function printfDescription(obj) {
        for (let item in obj) {
            let property = obj[item];
            console.info("AudioEncoder config is" + item + ":" + property);
        }
    }

    function setCallback(nextStep, done) {
        console.info('case callback');
        audioEncodeProcessor.on('needInputData', async(inBuffer) => {
            console.info('inputBufferAvailable');
            inputQueue.push(inBuffer);
            await enqueueInputs(inputQueue);
        });
        audioEncodeProcessor.on('newOutputData', async(outBuffer) => {
            console.info('outputBufferAvailable');
            if (needgetMediaDes) {
                audioEncodeProcessor.getOutputMediaDescription().then((MediaDescription) => {
                    console.info("get OutputMediaDescription success");
                    console.info('get outputMediaDescription : ' + MediaDescription);
                    needgetMediaDes=false;
                }, failCallback).catch(failCatch);
            }
            outputQueue.push(outBuffer);
            await dequeueOutputs(outputQueue, nextStep, done);
        });
        audioEncodeProcessor.on('error',(err) => {
            console.info('case error called,errName is' + err);
        });
        audioEncodeProcessor.on('streamChanged',(format) => {
            console.info('Output format changed: ' + format);
        });
    }

    eventEmitter.on('nextStep', async (done) => {
        console.info('in case : nextStep success');
        await beforeTest();
        let sampleRate = Number(sampleRateList.shift());       
        let savePath = `AAC_LC_${channelCount}_${sampleRate}.aac`;
        let srcPath = `S16LE_${channelCount}_${sampleRate}.pcm`;
        if (channelCount === 2) {
            ES = [0, 4096];
        } else {
            ES = [0, 2048];
        }
        let mediaDescription = {
            "channel_count": channelCount,
            "sample_rate": sampleRate,
            "audio_sample_format": 1,
            "codec_mime": 'audio/mp4a-latm',
        }

        await encodeSource(mediaDescription, savePath, srcPath, done);
    });

    async function getFormatCaps() {
        await media.createAudioEncoderByMime('audio/mp4a-latm').then((processor) => {
            console.info("case create createAudioEncoder success");
            audioEncodeProcessor = processor;
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.getAudioEncoderCaps().then((AudioCaps) => {
            console.info("case get AudioEncoderCaps success");
            console.info("print AudioCaps: " + AudioCaps)
            console.info("print AudioCaps.supportedSampleRates: " + AudioCaps.supportedSampleRates)
            console.info("print AudioCaps.supportedChannel.min: " + AudioCaps.supportedChannel.min)
            console.info("print AudioCaps.supportedChannel.max: " + AudioCaps.supportedChannel.max)
            formatSampleRate = AudioCaps.supportedSampleRates;
            for (let i = AudioCaps.supportedChannel.min; i <= AudioCaps.supportedChannel.max; i++) {
                channelCountList.push(i);
            }
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.release().then(() => {
            console.info('audioEncodeProcessor release success');
            audioEncodeProcessor = null;
        }, failCallback).catch(failCatch);
    }

    async function encodeSource(config, savePath, srcPath, done){
        console.info('start test case');
        let mediaDescription = config;
        readPath = srcPath;
        needgetMediaDes = true;
        workdoneAtEOS = true;

        await getFdWrite(savePath);
        console.info('case getFdWrite success');
        await getFdRead(readPath, done);
        console.info('case getFdRead success');
        await media.createAudioEncoderByMime('audio/mp4a-latm').then((processor) => {
            console.info("case create createAudioEncoder success");
            audioEncodeProcessor = processor;
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.getAudioEncoderCaps().then((AudioCaps) => {
            console.info("case get AudioEncoderCaps success");
            console.info("print AudioCaps: " + AudioCaps)
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.configure(mediaDescription).then(() => {
            console.info("case configure success");
            readFile(readPath);
        }, failCallback).catch(failCatch);
        setCallback(function(){eventEmitter.emit('nextStep', done);}, done);
        await audioEncodeProcessor.prepare().then(() => {
            console.info("case prepare success");
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.start().then(() => {
            console.info("case start success")
        }, failCallback).catch(failCatch);
        await audioEncodeProcessor.getOutputMediaDescription().then((mediaDescription) => {
            console.info("getOutputMediaDescription success");
            printfDescription(mediaDescription);
        },failCallback).catch(failCatch);
        audioEncodeProcessor.on('error',(err) => {
            console.info(`case error called,errName is ${err.name}`);
            console.info(`case error called,errCode is ${err.code}`);
            console.info(`case error called,errMessage is ${err.message}`);
            expect().assertFail();
            done();
        });
    }

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_ENCODER_FORMAT_COMPATIBILITY_AAC_PROMISE_01_0100
        * @tc.name      : 01.test acc format compatibility
        * @tc.desc      : audio encoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_AUDIO_ENCODER_FORMAT_COMPATIBILITY_AAC_PROMISE_01_0100', 0, async function (done) {
        console.info("case test acc format compatibility");
        await getFormatCaps();
        sampleRateList = formatSampleRate.toString().split(',');
        channelCount = channelCountList.shift();
        let nextStep = eventEmitter.emit('nextStep', done);
        nextStep();
    })
})