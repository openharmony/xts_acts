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
import mediademo from '@ohos.multimedia.mediademo'
import fileio from '@ohos.fileio'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import featureAbility from '@ohos.ability.featureAbility'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoEncoderFormatPromise', function () {
    let videoEncodeProcessor;
    let mediaTest;
    let surfaceID = '';
    let outputQueue = [];
    let outputCnt = 0;
    let frameTotal = 100;
    let stopAtEOS = false;
    let resetAtEOS = false;
    let flushAtEOS = false;
    let sawOutputEOS = false;
    let needGetMediaDes = false;
    let fd_write;
    let fileAsset;
    const context = featureAbility.getContext();
    const mediaLibraryTest = mediaLibrary.getMediaLibrary(context);
    let fileKeyObj = mediaLibrary.FileKey;

    beforeAll(async function() {
        console.info('beforeAll case 1');
        await applyPermission();
        console.info('beforeAll case after get permission');
    })

    beforeEach(function() {
        console.info('beforeEach case');
        videoEncodeProcessor = null;
        mediaTest = null;
        surfaceID = '';
        outputQueue = [];
        outputCnt = 0;
        frameTotal = 100;
        stopAtEOS = false;
        resetAtEOS = false;
        flushAtEOS = false;
        sawOutputEOS = false;
        needGetMediaDes = false;
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (videoEncodeProcessor != null){
            await videoEncodeProcessor.release().then(() => {
                console.info("case release success"); 
            }, failCallback).catch(failCatch);
            videoEncodeProcessor = null;
        }
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

    function resetParam() {
        outputQueue = [];
        outputCnt = 0;
        frameTotal = 100;
        stopAtEOS = false;
        resetAtEOS = false;
        flushAtEOS = false;
        sawOutputEOS = false;
        needGetMediaDes = false;
    }

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.video.codecformat', 0, 100);
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
        let mediaType = mediaLibrary.MediaType.VIDEO;
        console.info('[mediaLibrary] case mediaType is ' + mediaType);
        let publicPath = await mediaLibraryTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
        console.info('[mediaLibrary] case getFdWrite publicPath is ' + publicPath);
        let dataUri = await mediaLibraryTest.createAsset(mediaType, pathName, publicPath);
        if (dataUri != undefined) {
            let args = dataUri.id.toString();
            let fetchOp = {
                selections : fileKeyObj.ID + "=?",
                selectionArgs : [args],
            }
            let fetchWriteFileResult = await mediaLibraryTest.getFileAssets(fetchOp);
            console.info('[mediaLibrary] case getFdWrite getFileAssets() success');
            fileAsset = await fetchWriteFileResult.getAllObject();
            console.info('[mediaLibrary] case getFdWrite getAllObject() success');
            fd_write = await fileAsset[0].open('Rw');
            console.info('[mediaLibrary] case getFdWrite fd_write is ' + fd_write);
        }
    }

    async function closeFdWrite() {
        if (fileAsset != null) {
            await fileAsset[0].close(fd_write).then(() => {
                console.info('[mediaLibrary] case close fd_write success, fd is ' + fd_write);
            }).catch((err) => {
                console.info('[mediaLibrary] case close fd_write failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAsset is null');
        }
    }

    function writeFile(buf, len) {
        try{
            let res = fileio.writeSync(fd_write, buf, {length: len});
            console.info('case fileio.write buffer success');
        } catch(e) {
            console.info('case fileio.write buffer error is ' + e);
        }
    }

    async function dequeueOutputs(done) {
        while (outputQueue.length > 0) {
            let outputObject = outputQueue.shift();
            outputCnt += 1;
            if (outputObject.flags == 1) {
                console.info("last frame, make choice");
                mediaTest.closeStream(surfaceID);
                sawOutputEOS = true;
                if (stopAtEOS) {
                    await toStop();
                } else if (resetAtEOS) {
                    await toReset();
                } else if (flushAtEOS) {
                    await toFlush();
                } else {
                    await toReset();
                    await toRelease();
                    done();
                }
            } else {
                console.info('not last frame, write data to file');
                writeFile(outputObject.data, outputObject.length);
                console.info("write to file success");
                videoEncodeProcessor.freeOutputBuffer(outputObject).then(() => {
                    console.info('release output success');
                });
            }
        } 
    }

    function setCallback(done) {
        console.info('case callback');
        videoEncodeProcessor.on('newOutputData', async(outBuffer) => {
            console.info('newOutputData');
            console.info('outBuffer.flags: ' + outBuffer.flags);
            if (needGetMediaDes) {
                videoEncodeProcessor.getOutputMediaDescription().then((MediaDescription) => {
                    console.info("get OutputMediaDescription success");
                    console.info('get outputMediaDescription : ' + MediaDescription);
                    needGetMediaDes = false;
                }, failCallback).catch(failCatch);
            }
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

    function printfDescription(obj) {
        for (let item in obj) {
            let property = obj[item];
            console.info("AudioEncoder config is " + item + ":" + property);
        }
    }

    function toCreateStream() {
        mediaTest = mediademo.createMediaTest();
    }

    function toSetStreamParam(width, height, framerate, frameTotal) {
        console.info('case set stream parameter');
        mediaTest.setResolution(width, height);
        mediaTest.setFrameRate(framerate);
        mediaTest.setFrameCount(frameTotal);
    }

    function toStartStream() {
        console.info('case start stream');
        mediaTest.startStream(surfaceID);
    }

    async function toFlush() {
        outputQueue = [];
        await videoEncodeProcessor.flush().then(() => {
            console.info("case flush success"); 
        }, failCallback).catch(failCatch);
    }

    async function toStop() {
        await videoEncodeProcessor.stop().then(() => {
            console.info("case stop success"); 
        }, failCallback).catch(failCatch);
    }

    async function toReset() {
        resetParam();
        await videoEncodeProcessor.reset().then(() => {
            console.info("case reset success"); 
        }, failCallback).catch(failCatch);
    }

    async function toRelease() {
        resetParam();
        await videoEncodeProcessor.release().then(() => {
            console.info("case release success"); 
            videoEncodeProcessor = null;
        }, failCallback).catch(failCatch);
    }

    async function encodeSource(config, path, name, done){
        let mediaDescription = config;
        await getFdWrite(path)
        console.info('case getFdWrite success');
        await media.createVideoEncoderByName(name).then((processor) => {
            if (typeof (processor) != 'undefined') {
                videoEncodeProcessor = processor;
                console.info('in case : createVideoEncoderByName success');
            } else {
                console.info('in case : createVideoEncoderByName fail');
                expect().assertFail();
                done();
            }
        },failCallback).catch(failCatch);
        await videoEncodeProcessor.getVideoEncoderCaps().then((videoCaps) => {
            console.info("case get getVideoEncoderCaps success");
            printVideoCaps(videoCaps, mediaDescription.width, mediaDescription.height);
        },failCallback).catch(failCatch);
        toCreateStream();
        toSetStreamParam(mediaDescription.width, mediaDescription.height, mediaDescription.frame_rate, frameTotal);
        await videoEncodeProcessor.configure(mediaDescription).then(() => {
            console.info("case configure success"); 
        }, failCallback).catch(failCatch);
        setCallback(done);
        await videoEncodeProcessor.getInputSurface().then((inputSurface) => {
            expect(inputSurface != undefined).assertTrue();
            console.info('case getInputSurface success');
            surfaceID = inputSurface;
        }, failCallback).catch(failCatch);
        await videoEncodeProcessor.prepare().then(() => {
            console.info("case prepare success"); 
        }, failCallback).catch(failCatch);
        toStartStream();
        await videoEncodeProcessor.start().then(() => {
            console.info("case start success"); 
        }, failCallback).catch(failCatch);
        await videoEncodeProcessor.getOutputMediaDescription().then((mediaDescription) => {
            console.info("getOutputMediaDescription success");
            printfDescription(mediaDescription);
        },failCallback).catch(failCatch);
        videoEncodeProcessor.on('error',(err) => {
            console.info(`case error called,errName is ${err.name}`);
            console.info(`case error called,errCode is ${err.code}`);
            console.info(`case error called,errMessage is ${err.message}`);
            expect().assertFail();
            done();
        });

    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_01_0100
        * @tc.name      : 000.test MPEG4 format-resolution 640*480-frame rate 30 FPS
        * @tc.desc      : video encoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_01_0100', 0, async function (done) {
        console.info("case test MPEG4 format-resolution 640*480-frame rate 30 FPS");
        let savepath = 'rk_mpeg4_video_software_640_480_30.es';
        let name= 'avenc_mpeg4';
        let mediaDescription = {
            "codec_mime": 'video/mp4v-es',
            "width": 640, 
            "height": 480,
            "pixel_format": 3,
            "frame_rate" : 30
        }
        
        await encodeSource(mediaDescription, savepath, name, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_01_0200
        * @tc.name      : 000.test MPEG4 format-resolution 352*288-frame rate 30 FPS
        * @tc.desc      : video encoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_01_0200', 0, async function (done) {
        console.info("case test MPEG4 format-resolution 352*288-frame rate 30 FPS");
        let savepath = 'rk_mpeg4_video_software_352_288_30.es';
        let name= 'avenc_mpeg4';
        let mediaDescription = {
            "codec_mime": 'video/mp4v-es',
            "width": 352, 
            "height": 288,
            "pixel_format": 3,
            "frame_rate" : 30,
        }
        
        await encodeSource(mediaDescription, savepath, name, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_02_0100
        * @tc.name      : 000.test MPEG4 format-resolution 640*480-frame rate 25 FPS
        * @tc.desc      : video encoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_02_0100', 0, async function (done) {
        console.info("case test MPEG4 format-resolution 640*480-frame rate 25 FPS");
        let savepath = 'rk_mpeg4_video_software_640_480_25.es';
        let name= 'avenc_mpeg4';
        let mediaDescription = {
            "codec_mime": 'video/mp4v-es',
            "width": 640, 
            "height": 480,
            "pixel_format": 3,
            "frame_rate" : 25,
        }
        
        await encodeSource(mediaDescription, savepath, name, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_02_0200
        * @tc.name      : 000.test MPEG4 format-resolution 640*480-frame rate 10 FPS
        * @tc.desc      : video encoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_ENCODER_SOFTWARE_FORMAT_COMPATIBILITY_MPEG4_PROMISE_02_0200', 0, async function (done) {
        console.info("case test MPEG4 format-resolution 640*480-frame rate 10 FPS");
        let savepath = 'rk_mpeg4_video_software_640_480_10.es';
        let name= 'avenc_mpeg4';
        let mediaDescription = {
            "codec_mime": 'video/mp4v-es',
            "width": 640, 
            "height": 480,
            "pixel_format": 3,
            "frame_rate" : 10,
        }
        
        await encodeSource(mediaDescription, savepath, name, done);
    })

})
        
