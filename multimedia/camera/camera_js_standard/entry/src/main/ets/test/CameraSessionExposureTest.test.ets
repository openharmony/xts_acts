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
 
// @ts-ignore

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import deviceInfo from '@ohos.deviceInfo';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

const TAG = "CameraModuleTest: ";

// Define global letiables
let mCameraManager;
let mCameraDevicesArray;
let mCameraSession;

let mPhotoSurface;
let mVideoRecorder;
let mVideoSurface;
let mFileAsset;
let mFdPath;
let mFdNumber;

// CAMERA-0 letiables
let mCameraNum;

let mCameraInput;
let mPreviewOutput;
let mPhotoOutput;
let mVideoOutput;

let mIsExposureModeSupportedArray;
let mExposureBiasRangeArray;
let mExposureBiasMaxArray;
let mExposureBiasMinArray;

let mVideoProfileCfg = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: 'audio/mp4a-latm',
    audioSampleRate: 48000,
    durationTime: 1000,
    fileFormat: 'mp4',
    videoBitrate: 48000,
    videoCodec: 'video/mp4v-es',
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
}

let mVideoConfig = {
    audioSourceType: 1,
    videoSourceType: 0,
    profile: mVideoProfileCfg,
    url: 'file:///data/media/CameraSessionExposure.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;

let mMETERINGPoint = {
    x: mPicWidthMax / 2,
    y: mPicHeightMax / 2,
}

let mMETERINGPointLT = {
    x: 0,
    y: 0,
}

let mMETERINGPointRT = {
    x: mPicWidthMax,
    y: 0,
}

let mMETERINGPointLB = {
    x: 0,
    y: mPicHeightMax,
}

let mMETERINGPointRB = {
    x: mPicWidthMax,
    y: mPicHeightMax,
}

let mMETERINGPointInvalidLT = {
    x: -1,
    y: -1,
}

let mMETERINGPointInvalidRT = {
    x: (mPicWidthMax + 1),
    y: -1,
}

let mMETERINGPointInvalidLB = {
    x: -1,
    y: mPicHeightMax,
}

let mMETERINGPointInvalidRB = {
    x: (mPicWidthMax + 1),
    y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidMETERINGPoint = false;

export default function cameraSessionExposureTest() {

    function sleep(ms) {
        console.info(TAG + "Entering sleep -> Promise constructor");
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    function isEmpty(data) {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    async function getFd(pathName) {
        let displayName = pathName;
        const mediaTest = mediaLibrary.getMediaLibrary();
        let fileKeyObj = mediaLibrary.FileKey;
        let mediaType = mediaLibrary.MediaType.VIDEO;
        let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
        let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
        if (dataUri != undefined) {
            let args = dataUri.id.toString();
            let fetchOp = {
                selections: fileKeyObj.ID + "=?",
                selectionArgs: [args],
            }
            let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
            mFileAsset = await fetchFileResult.getAllObject();
            mFdNumber = await mFileAsset[0].open('Rw');
            mFdPath = "fd://" + mFdNumber.toString();
        }
    }
    
    async function closeFd() {
        if (mFileAsset != null) {
                await mFileAsset[0].close(mFdNumber).then(() => {
                console.info('[mediaLibrary] case close fd success');
            }).catch((err) => {
                console.info('[mediaLibrary] case close fd failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAsset is null');
        }
    }

    async function getPhotoReceiverSurface() {
        console.log(TAG + 'Entering getPhotoReceiverSurface')
        let receiver = image.createImageReceiver(640, 480, 4, 8)
        console.log(TAG + 'before receiver check')
        if (receiver !== undefined) {
            console.log(TAG + 'Photo receiver is created successfully')
            mPhotoSurface = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
        } else {
            console.log(TAG + 'Photo receiver is created failed')
        }
        console.log(TAG + 'Exit getPhotoReceiverSurface')
    }

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraSessionExposure.mp4');
        mVideoConfig.url = mFdPath;
        media.createVideoRecorder((err, recorder) => {
            if (!err) {
                console.info(TAG + 'Entering create video receiver')
                mVideoRecorder = recorder
                console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
                console.info(TAG + 'videoRecorder.prepare called.')
                mVideoRecorder.prepare(mVideoConfig, (err) => {
                    if (!err) {
                        console.info(TAG + 'videoRecorder.prepare success.')
                        mVideoRecorder.getInputSurface((err, id) => {
                            console.info(TAG + 'getInputSurface called')
                            if (!err) {
                                mVideoSurface = id
                                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface))
                            } else {
                                console.info(TAG + 'getInputSurface FAILED')
                            }
                        })
                    } else {
                        console.info(TAG + 'prepare FAILED')
                    }
                })
            } else {
                console.info(TAG + 'createVideoRecorder FAILED')
            }
        })
        console.log(TAG + 'Exit getVideoReceiveSurface')
    }

    async function releaseVideoReceiveSurface() {
        console.log(TAG + 'Entering releaseVideoReceiveSurface')
        mVideoRecorder.release((err) => {
            console.info(TAG + 'Entering release video receiver')
        })
        await closeFd();
        console.log(TAG + 'Exit releaseVideoReceiveSurface')
    }

    async function getCameraManagerInstance() {
        console.info('Enter getCameraManagerInstance');

        mCameraManager = await cameraObj.getCameraManager(null);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }

        console.info('Exit getCameraManagerInstance');

        return true;
    }

    async function getCameraSupportDevicesArray() {
        console.info('Enter getCameraSupportDevicesArray');
        
        mCameraDevicesArray = await mCameraManager.getSupportedCameras();
        /*
        mCameraManager.getSupportedCameras(async (err, data) => {
            console.info(TAG + "Entering getCameraSupportDevicesArray callback");
            if (!err) {
                if (data != null || data != undefined) {
                    mCameraDevicesArray = data;
                    console.info(TAG + "Entering getCameraSupportDevicesArray PASSED with CameraDevicesArray is: " + data);
                } else {
                    console.info(TAG + "Entering getCameraSupportDevicesArray FAILED with CameraDevicesArray is: " + data);
                }
            } else {
                console.info(TAG + "Entering getCameraSupportDevicesArray FAILED : " + err.message);
            }
        })
        await sleep(3000);
        */
        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "getSupportedCameras FAILED");
            return false;
        }

        //mCameraNum = 1;
        mCameraNum = mCameraDevicesArray.length;

        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

        mIsExposureModeSupportedArray = new Array(mCameraNum);
        mExposureBiasRangeArray = new Array(mCameraNum);
        mExposureBiasMaxArray = new Array(mCameraNum);
        mExposureBiasMinArray = new Array(mCameraNum);

        console.info('Exit getCameraSupportDevicesArray');

        return true;
    }

    async function beginCameraSessionConfig() {
        console.info('Enter beginCameraSessionConfig');

        mCameraSession.beginConfig();

        await sleep(30);

        console.info('Exit beginCameraSessionConfig');

        return true;
    }

    async function commitCameraSessionConfig() {
        console.info('Enter commitCameraSessionConfig');

        mCameraSession.commitConfig(async (err) => {
            if (!err) {
                console.info(TAG + "Entering commitConfig PASSED");
            } else {
                console.info(TAG + "Entering commitConfig FAILED : " + err.message);
            }
        })

        await sleep(500);

        console.info('Exit commitCameraSessionConfig');

        return true;
    }

    async function createCameraSessionInstance() {
        console.info('Enter createCameraSessionInstance');

        try {
            mCameraSession = await mCameraManager.createCaptureSession();
        }
        catch {
            console.info('createCaptureSession FAILED');
        }

        if (isEmpty(mCameraSession)) {
            console.info(TAG + "createCaptureSession FAILED");
            return false;
        }

        await beginCameraSessionConfig();

        console.info('Exit createCameraSessionInstance');

        return true;
    }

    async function releaseCameraSessionInstance() {
        await mCameraSession.release();
    }

    async function createInput(idx:any) {
        console.info('Enter createInput');

        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "Entering createInputs FAILED with NoCamera");
            return false;
        }

        mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
        
        if (isEmpty(mCameraInput)) {
            console.info(TAG + "createCameraInput FAILED");
            return false;
        }

        mCameraInput.open(async (err) => {
            console.info(TAG + "Entering mCameraInput open callback");
            if (!err) {
                console.info(TAG + "Entering mCameraInput open PASSED ");
            } else {
                console.info(TAG + "Entering mCameraInput open FAILED : " + err.message);
            }
        })

        await sleep(100);

        console.info(idx + 'th CameraInput is: ' + mCameraInput);

        console.info('Exit createInput');

        return true;
    }

    async function releaseInput() {
        console.info('Enter releaseInput');

        if (!isEmpty(mCameraInput)) {
            await mCameraInput.close();
        }

        console.info('Exit releaseInput');

        return true;
    }

    async function createOutput(idx:any) {
        console.info('Enter createOutput');

        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

        if (!isEmpty(cameraOutputCap)) {
            if (!isEmpty(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);      
                for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                    mPreviewOutput = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], globalThis.surfaceId);
                    if (!isEmpty(mPreviewOutput)) {
                        break;
                    }
                }
    
                if (isEmpty(mPreviewOutput)) {
                    console.info(TAG + "createPreviewOutput FAILED");
                }
    
                console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
            }
    
            if (!isEmpty(cameraOutputCap.photoProfiles)) {
                console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);   
                    
                for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
                    mPhotoOutput = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
                    if (!isEmpty(mPhotoOutput)) {
                        break;
                    }
                }
    
                if (isEmpty(mPhotoOutput)) {
                        console.info(TAG + "createPhotoOutput FAILED");
                }
    
                console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
            }
            /*
            if (!isEmpty(cameraOutputCap.videoProfiles)) {
                console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length); 
                for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
                    try {
                        mVideoOutput = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
                        if (!isEmpty(mVideoOutput)) {
                            break;
                        }
                    }
                    catch {
                        console.info(TAG + "createVideoOutput FAILED");
                    }
                }
    
                if (isEmpty(mVideoOutput)) {
                    console.info(TAG + "createVideoOutput FAILED");
                }
    
                console.info(TAG + "createVideoOutput: " + mVideoOutput);  
            }
            */
        }
        
        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');

        if (!isEmpty(mPreviewOutput)) {
            await mPreviewOutput.stop();
            await mPreviewOutput.release();
        }
        
        if (!isEmpty(mPhotoOutput)) {
            await mPhotoOutput.release();
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            await mVideoOutput.stop();
            await mVideoOutput.release();
        }
        */
        console.info('Exit releaseOutput');
        
        return true;
    }

    async function startCameraSession(idx:any) {
        console.info(TAG + "Enter startCameraSession");

        await createInput(idx);
        await createOutput(idx);

        await sleep(1);

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to addInput");
            await mCameraSession.addInput(mCameraInput);
        }
        
        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            await mCameraSession.addOutput(mPreviewOutput);
        }
        
        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to addOutput mPhotoOutput");
            await mCameraSession.addOutput(mPhotoOutput);
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            await mCameraSession.addOutput(mVideoOutput);
        }
        */
        await sleep(1);

        await commitCameraSessionConfig();
        await beginCameraSessionConfig();
        
        /*
        await mCameraSession.start(async (err) => {
            console.info(TAG + "Entering mCameraSession start callback");
            if (!err) {
                console.info(TAG + "Entering mCameraSession start PASSED ");
            } else {
                console.info(TAG + "Entering mCameraSession start FAILED : " + err.message);
            }
        })
        
        await sleep(100);
        */
        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");
        /*
        mCameraSession.stop(async (err) => {
            console.info(TAG + "Entering mCameraSession stop callback");
            if (!err) {
                console.info(TAG + "Entering mCameraSession stop PASSED ");
            } else {
                console.info(TAG + "Entering mCameraSession stop FAILED : " + err.message);
            }
        })

        await sleep(100);
        */

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to removeInput input");
            await mCameraSession.removeInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to removeOutput mPreviewOutput");
            await mCameraSession.removeOutput(mPreviewOutput);
        }
        
        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to removeOutput mPhotoOutput");
            await mCameraSession.removeOutput(mPhotoOutput);
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            await mCameraSession.removeOutput(mVideoOutput);
        }
        */
        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionExposureTest', function () {
        console.info(TAG + '----------cameraSessionExposureTest--------------')

        beforeAll(async function () {
            sleep(100);
            await getPhotoReceiverSurface();
            await getVideoReceiveSurface();
            await getCameraManagerInstance();
            await getCameraSupportDevicesArray();
            await createCameraSessionInstance();

            console.info('Device type = ' + deviceInfo.deviceType);

            console.info('beforeAll case');
        })
    
        beforeEach(function () {
            sleep(1000);
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support exposure locked mode with promise or not
        * @tc.desc      : Check capture session support exposure locked mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isExposureModeSupported = await mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(100);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100
        * @tc.name      : Check capture session set exposure locked mode with promise
        * @tc.desc      : Check capture session set exposure locked mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        await mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);  
                        await sleep(500);

                        let exposureMode = await mCameraSession.getExposureMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 finish");
                        if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 PASSED with ExposureMode is: " + exposureMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 FAILED with ExposureMode is: " + exposureMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101
        * @tc.name      : Check capture session support exposure auto mode with promise or not
        * @tc.desc      : Check capture session support exposure auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isExposureModeSupported = await mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(100);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101
        * @tc.name      : Check capture session set exposure auto mode with promise
        * @tc.desc      : Check capture session set exposure auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        await mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);  
                        await sleep(500);

                        let exposureMode = await mCameraSession.getExposureMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 finish");
                        if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 PASSED with ExposureMode is: " + exposureMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 FAILED with ExposureMode is: " + exposureMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102
        * @tc.name      : Check capture session support exposure continuous auto mode with promise or not
        * @tc.desc      : Check capture session support exposure continuous auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isExposureModeSupported = await mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(100);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 ends here");
                done();
            }
        })

  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102
        * @tc.name      : Check capture session set exposure continuous auto mode with promise
        * @tc.desc      : Check capture session set exposure continuous auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        await mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);  
                        await sleep(500);

                        let exposureMode = await mCameraSession.getExposureMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 finish");
                        if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 PASSED with ExposureMode is: " + exposureMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 FAILED with ExposureMode is: " + exposureMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100
        * @tc.name      : Check capture session set METERING point with promise
        * @tc.desc      : Check capture session set METERING point with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPoint);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 PASSED with METERINGPoint is: " + mMETERINGPoint.x + ", " + mMETERINGPoint.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 finish");
                    if ((METERINGPoint.x == mMETERINGPoint.x) && (METERINGPoint.y == mMETERINGPoint.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101
        * @tc.name      : Check capture session set METERING point with promise(left-top point)
        * @tc.desc      : Check capture session set METERING point with promise(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 PASSED with METERINGPoint is: " + mMETERINGPointLT.x + ", " + mMETERINGPointLT.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 finish");
                    if ((METERINGPoint.x == mMETERINGPointLT.x) && (METERINGPoint.y == mMETERINGPointLT.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0101 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102
        * @tc.name      : Check capture session set METERING point with promise(right-top point)
        * @tc.desc      : Check capture session set METERING point with promise(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 PASSED with METERINGPoint is: " + mMETERINGPointRT.x + ", " + mMETERINGPointRT.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 finish");
                    if ((METERINGPoint.x == mMETERINGPointRT.x) && (METERINGPoint.y == mMETERINGPointRT.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0102 ends here");
                done();
            }
        })


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103
        * @tc.name      : Check capture session set METERING point with promise(left-bottom point)
        * @tc.desc      : Check capture session set METERING point with promise(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 PASSED with METERINGPoint is: " + mMETERINGPointLB.x + ", " + mMETERINGPointRB.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 finish");
                    if ((METERINGPoint.x == mMETERINGPointLB.x) && (METERINGPoint.y == mMETERINGPointLB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0103 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104
        * @tc.name      : Check capture session set METERING point with promise(right-bottom point)
        * @tc.desc      : Check capture session set METERING point with promise(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 PASSED with METERINGPoint is: " + mMETERINGPointRB.x + ", " + mMETERINGPointRB.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 finish");
                    if ((METERINGPoint.x == mMETERINGPointRB.x) && (METERINGPoint.y == mMETERINGPointRB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
    
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0104 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105
        * @tc.name      : Check capture session set METERING point with promise(left-top invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointInvalidLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 PASSED with METERINGPoint is: " + mMETERINGPointInvalidLT.x + ", " + mMETERINGPointInvalidLT.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidLT.x) && (METERINGPoint.y != mMETERINGPointInvalidLT.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0105 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106
        * @tc.name      : Check capture session set METERING point with promise(right-top invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointInvalidRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 PASSED with METERINGPoint is: " + mMETERINGPointInvalidRT.x + ", " + mMETERINGPointInvalidRT.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidRT.x) && (METERINGPoint.y != mMETERINGPointInvalidRT.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0106 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107
        * @tc.name      : Check capture session set METERING point with promise(left-bottom invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointInvalidLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 PASSED with METERINGPoint is: " + mMETERINGPointInvalidLB.x + ", " + mMETERINGPointInvalidRB.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidLB.x) && (METERINGPoint.y != mMETERINGPointInvalidLB.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0107 ends here");
                done();
            }
        })


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108
        * @tc.name      : Check capture session set METERING point with promise(right-bottom invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setMeteringPoint(mMETERINGPointInvalidRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 PASSED with METERINGPoint is: " + mMETERINGPointInvalidRB.x + ", " + mMETERINGPointInvalidRB.y);  
                    await sleep(500);

                    let METERINGPoint = await mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidRB.x) && (METERINGPoint.y != mMETERINGPointInvalidRB.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0108 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100
        * @tc.name      : Check capture session get exposure bias range with promise
        * @tc.desc      : Check capture session get exposure bias range with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let exposureBiasRange = await mCameraSession.getExposureBiasRange();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 finish");
                    if (exposureBiasRange.length > 0) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 PASSED with ExposureBiasRange length is: " + exposureBiasRange.length);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 FAILED with ExposureBiasRange length is: " + exposureBiasRange.length);
                        expect().assertFail();
                    }
    
                    for (let j = 0; j < exposureBiasRange.length; j++) {
                        console.info(TAG + j + "th, exposure bias is: " + exposureBiasRange[j]);
                    }
    
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100
        * @tc.name      : Check capture session set exposure bias with promise
        * @tc.desc      : Check capture session set exposure bias with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setExposureBias(mExposureBiasRangeArray[i][0]);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 PASSED with ExposureBias is: " + mExposureBiasRangeArray[i][0]);  
                    await sleep(500);

                    let exposureValue = await mCameraSession.getExposureValue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 finish");
                    if (exposureValue == mExposureBiasRangeArray[i][0]) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 PASSED with ExposureValue is: " + exposureValue);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 FAILED with ExposureValue is: " + exposureValue);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 ends here");
                done();
            }
        })    

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, min - 1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, min - 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setExposureBias(mExposureBiasMinArray[i] - 1);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 PASSED with ExposureBias is: " + (mExposureBiasMinArray[i] - 1));  
                    await sleep(500);

                    let exposureValue = await mCameraSession.getExposureValue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 finish");
                    if (exposureValue != (mExposureBiasMinArray[i] - 1)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 PASSED with ExposureValue is: " + exposureValue);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 FAILED with ExposureValue is: " + exposureValue);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 ends here");
                done();
            }
        })    



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, min - 0.1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, min - 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setExposureBias(mExposureBiasMinArray[i] - 0.1);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 PASSED with ExposureBias is: " + (mExposureBiasMinArray[i] - 0.1));  
                    await sleep(500);

                    let exposureValue = await mCameraSession.getExposureValue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 finish");
                    if (exposureValue != (mExposureBiasMinArray[i] - 0.1)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 PASSED with ExposureValue is: " + exposureValue);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 FAILED with ExposureValue is: " + exposureValue);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 ends here");
                done();
            }
        })    

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, max + 1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, max + 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setExposureBias(mExposureBiasMaxArray[i] + 1);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[i] + 1));  
                    await sleep(500);

                    let exposureValue = await mCameraSession.getExposureValue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 finish");
                    if (exposureValue != (mExposureBiasMaxArray[i] + 1)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 PASSED with ExposureValue is: " + exposureValue);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 FAILED with ExposureValue is: " + exposureValue);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 ends here");
                done();
            }
        })    


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, max + 0.1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, max + 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setExposureBias(mExposureBiasMaxArray[i] + 0.1);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[i] + 0.1));  
                    await sleep(500);

                    let exposureValue = await mCameraSession.getExposureValue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 finish");
                    if (exposureValue != (mExposureBiasMaxArray[i] + 0.1)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 PASSED with ExposureValue is: " + exposureValue);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 FAILED with ExposureValue is: " + exposureValue);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 ends here");
                done();
            }
        })    

    })
}