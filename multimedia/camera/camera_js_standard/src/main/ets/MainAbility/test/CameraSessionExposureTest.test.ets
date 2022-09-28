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
import media from '@ohos.multimedia.media'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import fileio from '@ohos.fileio';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import deviceInfo from '@ohos.deviceInfo';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

const TAG = "CameraModuleTest: ";

// Define global letiables
let mCameraManager;
let mCameraDevicesArray;
let mCameraSession;

let mPhoteSurface;
let mVideoRecorder;
let mVideoSurface;
let mFileAsset;
let mFdPath;
let mFdNumber;

// CAMERA-0 letiables
let mCameraInputArray;
let mCameraOutputCap;

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
    url: 'file:///data/media/02.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;

let mMeterringPoint = {
    x: mPicWidthMax / 2,
    y: mPicHeightMax / 2,
}

let mMeterringPointLT = {
    x: 0,
    y: 0,
}

let mMeterringPointRT = {
    x: mPicWidthMax,
    y: 0,
}

let mMeterringPointLB = {
    x: 0,
    y: mPicHeightMax,
}

let mMeterringPointRB = {
    x: mPicWidthMax,
    y: mPicHeightMax,
}

let mMeterringPointInvalidLT = {
    x: -1,
    y: -1,
}

let mMeterringPointInvalidRT = {
    x: (mPicWidthMax + 1),
    y: -1,
}

let mMeterringPointInvalidLB = {
    x: -1,
    y: mPicHeightMax,
}

let mMeterringPointInvalidRB = {
    x: (mPicWidthMax + 1),
    y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidMeterringPoint = false;

export default function cameraSessionExposureTest(surfaceId: any) {

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

    async function getFd(pathName){
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

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('com.open.harmony.multimedia.cameratest', 0, 100);
        let atManager = abilityAccessCtrl.createAtManager();
        if (atManager != null) {
            let tokenID = appInfo.accessTokenId;
            console.info('[permission] case accessTokenID is ' + tokenID);
            let permissionName1 = 'ohos.permission.CAMERA';
            let permissionName2 = 'ohos.permission.MICROPHONE';
            let permissionName3 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName4 = 'ohos.permission.READ_MEDIA';
            let permissionName5 = 'ohos.permission.WRITE_MEDIA';
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
            await atManager.grantUserGrantedPermission(tokenID, permissionName4, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName5, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
        } else {
            console.info('[permission] case apply permission failed, createAtManager failed');
        }
    }

    async function getPhotoReceiverSurface() {
        console.log(TAG + 'Entering getPhotoReceiverSurface')
        let receiver = image.createImageReceiver(640, 480, 4, 8)
        console.log(TAG + 'before receiver check')
        if (receiver !== undefined) {
            console.log(TAG + 'Photo receiver is created successfully')
            mPhoteSurface = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhoteSurface))
        } else {
            console.log(TAG + 'Photo receiver is created failed')
        }
        console.log(TAG + 'Exit getPhotoReceiverSurface')
    }

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('02.mp4');
        mVideoConfig.url = mFdPath;
        media.createVideoRecorder((err, recorder) => {
            console.info(TAG + 'Entering create video receiver')
            mVideoRecorder = recorder
            console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
            console.info(TAG + 'videoRecorder.prepare called.')
            mVideoRecorder.prepare(mVideoConfig, (err) => {
                console.info(TAG + 'videoRecorder.prepare success.')
            })
            mVideoRecorder.getInputSurface((err, id) => {
                console.info(TAG + 'getInputSurface called')
                mVideoSurface = id
                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface))
            })
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

        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraDevicesArray.length);
        console.info('Exit getCameraSupportDevicesArray');

        return true;
    }

    async function beginCameraSessionConfig() {
        console.info('Enter beginCameraSessionConfig');

        mCameraSession.beginConfig(async (err) => {
            if (!err) {
              console.info(TAG + "Entering beginConfig PASSED");
            } else {
              console.info(TAG + "Entering beginConfig FAILED : " + err.message);
            }
        })

        await sleep(100);

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

        await sleep(100);

        console.info('Exit commitCameraSessionConfig');

        return true;
    }

    async function createCameraSessionInstance() {
        console.info('Enter createCameraSessionInstance');

        mCameraSession = await mCameraManager.createCaptureSession();
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

    async function createInputs() {
        console.info('Enter createInputs');

        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "Entering createInputs FAILED with NoCamera");
            return false;
        }

        mCameraInputArray = new Array(mCameraDevicesArray.length);
        mIsExposureModeSupportedArray = new Array(mCameraDevicesArray.length);
        mExposureBiasRangeArray = new Array(mCameraDevicesArray.length);
        mExposureBiasMaxArray = new Array(mCameraDevicesArray.length);
        mExposureBiasMinArray = new Array(mCameraDevicesArray.length);

        for (let i = 0; i < mCameraDevicesArray.length; i++) {
            mCameraInputArray[i] = await mCameraManager.createCameraInput(mCameraDevicesArray[i]);
            if (isEmpty(mCameraInputArray[i])) {
                console.info(TAG + "createCameraInput FAILED");
                return false;
            }

            mCameraInputArray[i].open(async (err) => {
                console.info(TAG + "Entering mCameraInputArray open callback");
                if (!err) {
                    console.info(TAG + "Entering mCameraInputArray open PASSED ");
                } else {
                    console.info(TAG + "Entering mCameraInputArray open FAILED : " + err.message);
                }
            })

            await sleep(2000);

            console.info(i + 'th CameraInput is: ' + mCameraInputArray[i]);
        }

        console.info('Exit createInputs');

        return true;
    }

    async function releaseInputs() {
        console.info('Enter releaseInputs');

        if (isEmpty(mCameraInputArray)) {
            console.info(TAG + "Entering releaseInputs FAILED with NoCamera");
            return true;
        }

        for (let i = 0; i < mCameraInputArray.length; i++) {
            await mCameraInputArray[i].close();
            await mCameraInputArray[i].release();
        }

        console.info('Exit releaseInputs');

        return true;
    }

    async function createOutputs() {
        console.info('Enter createOutputs');

        mCameraOutputCap = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        if (!isEmpty(mCameraOutputCap.previewProfiles)) {
            console.info(TAG + "cameraOutputCap.previewProfiles.length: " + mCameraOutputCap.previewProfiles.length);      
            for (let i = 0; i< mCameraOutputCap.previewProfiles.length; i++) {
                mPreviewOutput = await mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[i], surfaceId);
                if (!isEmpty(mPreviewOutput)) {
                    break;
                }
            }

            if (isEmpty(mPreviewOutput)) {
                console.info(TAG + "createPreviewOutput FAILED");
            }
        }

        if (!isEmpty(mCameraOutputCap.photoProfiles)) {
            console.info(TAG + "cameraOutputCap.photoProfiles.length: " + mCameraOutputCap.photoProfiles.length);   
            
            for (let i = 0; i < mCameraOutputCap.photoProfiles.length; i++) {
                mPhotoOutput = await mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[i], mPhoteSurface);
                if (!isEmpty(mPhotoOutput)) {
                    break;
                }
            }

            if (isEmpty(mPhotoOutput)) {
                console.info(TAG + "createPhotoOutput FAILED");
            }

            console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
        }

        if (!isEmpty(mCameraOutputCap.videoProfiles)) {
            console.info(TAG + "cameraOutputCap.videoProfiles.length: " + mCameraOutputCap.videoProfiles.length); 
            for (let i = 0; i < mCameraOutputCap.videoProfiles.length; i++) {
                mVideoOutput = await mCameraManager.createVideoOutput(mCameraOutputCap.videoProfiles[i], mVideoSurface);
                if (!isEmpty(mVideoOutput)) {
                    break;
                }
            }

            if (isEmpty(mVideoOutput)) {
                console.info(TAG + "createVideoOutput FAILED");
            }

            console.info(TAG + "createVideoOutput: " + mPhotoOutput);  
        }

        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutputs() {
        if (!isEmpty(mPreviewOutput)) {
            await mPreviewOutput.close();
            await mPreviewOutput.release();
        }

        if (!isEmpty(mPhotoOutput)) {
            await mPhotoOutput.close();
            await mPhotoOutput.release();
        }

        if (!isEmpty(mVideoOutput)) {
            await mVideoOutput.close();
            await mVideoOutput.release();
        }

        return true;
    }

    async function startCameraSession(input:any) {
        console.info(TAG + "Enter startCameraSession");

        if (!isEmpty(input)) {
            console.info(TAG + "Start to addInput");
            await mCameraSession.addInput(input);
        }
        
        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            await mCameraSession.addOutput(mPreviewOutput);
        }
        
        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to addOutput mPhotoOutput");
            await mCameraSession.addOutput(mPhotoOutput);
        }

        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            await mCameraSession.addOutput(mVideoOutput);
        }

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
        
        await sleep(1000);
        */
        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession(input:any) {
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

        await sleep(1000);
        */

        if (!isEmpty(input)) {
            console.info(TAG + "Start to removeInput input");
            await mCameraSession.removeInput(input);
        }

        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to removeOutput mPreviewOutput");
            await mCameraSession.removeOutput(mPreviewOutput);
        }

        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to removeOutput mPhotoOutput");
            await mCameraSession.removeOutput(mPhotoOutput);
        }

        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            await mCameraSession.removeOutput(mVideoOutput);
        }

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionExposureTest', function () {
        console.info(TAG + '----------cameraSessionExposureTest--------------')

        beforeAll(async function () {
            sleep(100);
            await applyPermission();
            await getPhotoReceiverSurface();
            //await getVideoReceiveSurface();
            await getCameraManagerInstance();
            await getCameraSupportDevicesArray();
            await createCameraSessionInstance();
            await createInputs();
            await createOutputs();

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
            releaseInputs();
            releaseOutputs();
            //releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(100);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100
        * @tc.name      : Check capture session support exposure locked mode with callback or not
        * @tc.desc      : Check capture session support exposure locked mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mIsExposureModeSupportedArray[i] = false;
    
                    mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsExposureModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 PASSED with isExposureModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 FAILED with isExposureModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support exposure locked mode with promise or not
        * @tc.desc      : Check capture session support exposure locked mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    let isExposureModeSupported = await mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100
        * @tc.name      : Check capture session set exposure locked mode with callback
        * @tc.desc      : Check capture session set exposure locked mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getExposureMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 callback");
                            if (!err) {
                                if (data == cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 PASSED with ExposureMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 FAILED with ExposureMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 FAILED");
                        expect().assertFail();
                    }
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100
        * @tc.name      : Check capture session set exposure locked mode with promise
        * @tc.desc      : Check capture session set exposure locked mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 FAILED");
                        expect().assertFail();
                    }
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101
        * @tc.name      : Check capture session support exposure auto mode with callback or not
        * @tc.desc      : Check capture session support exposure auto mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mIsExposureModeSupportedArray[i] = false;
    
                    mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsExposureModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 PASSED with isExposureModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 FAILED with isExposureModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101
        * @tc.name      : Check capture session support exposure auto mode with promise or not
        * @tc.desc      : Check capture session support exposure auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    let isExposureModeSupported = await mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101
        * @tc.name      : Check capture session set exposure auto mode with callback
        * @tc.desc      : Check capture session set exposure auto mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getExposureMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 callback");
                            if (!err) {
                                if (data == cameraObj.ExposureMode.EXPOSURE_MODE_AUTO) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 PASSED with ExposureMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 FAILED with ExposureMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 FAILED");
                        expect().assertFail();
                    }
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101
        * @tc.name      : Check capture session set exposure auto mode with promise
        * @tc.desc      : Check capture session set exposure auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 FAILED");
                        expect().assertFail();
                    }
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102
        * @tc.name      : Check capture session support exposure continuous auto mode with callback or not
        * @tc.desc      : Check capture session support exposure continuous auto mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mIsExposureModeSupportedArray[i] = false;
    
                    mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsExposureModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 PASSED with isExposureModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 FAILED with isExposureModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102
        * @tc.name      : Check capture session support exposure continuous auto mode with promise or not
        * @tc.desc      : Check capture session support exposure continuous auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    let isExposureModeSupported = await mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102
        * @tc.name      : Check capture session set exposure continuous auto mode with callback
        * @tc.desc      : Check capture session set exposure continuous auto mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getExposureMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 callback");
                            if (!err) {
                                if (data == cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 PASSED with ExposureMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 FAILED with ExposureMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 FAILED");
                        expect().assertFail();
                    }
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102
        * @tc.name      : Check capture session set exposure continuous auto mode with promise
        * @tc.desc      : Check capture session set exposure continuous auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 FAILED");
                        expect().assertFail();
                    }
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100
        * @tc.name      : Check capture session set meterring point with callback
        * @tc.desc      : Check capture session set meterring point with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPoint, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 PASSED with MeterringPoint is: " + mMeterringPoint.x + ", " + mMeterringPoint.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 callback");
                        if (!err) {
                            if ((data.x == mMeterringPoint.x) && (data.y == mMeterringPoint.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100
        * @tc.name      : Check capture session set meterring point with promise
        * @tc.desc      : Check capture session set meterring point with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPoint);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 PASSED with MeterringPoint is: " + mMeterringPoint.x + ", " + mMeterringPoint.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 finish");
                    if ((meterringPoint.x == mMeterringPoint.x) && (meterringPoint.y == mMeterringPoint.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101
        * @tc.name      : Check capture session set meterring point with callback(left-top point)
        * @tc.desc      : Check capture session set meterring point with callback(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointLT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 PASSED with MeterringPoint is: " + mMeterringPointLT.x + ", " + mMeterringPointLT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 callback");
                        if (!err) {
                            if ((data.x == mMeterringPointLT.x) && (data.y == mMeterringPointLT.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101
        * @tc.name      : Check capture session set meterring point with promise(left-top point)
        * @tc.desc      : Check capture session set meterring point with promise(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 PASSED with MeterringPoint is: " + mMeterringPointLT.x + ", " + mMeterringPointLT.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 finish");
                    if ((meterringPoint.x == mMeterringPointLT.x) && (meterringPoint.y == mMeterringPointLT.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102
        * @tc.name      : Check capture session set meterring point with callback(right-top point)
        * @tc.desc      : Check capture session set meterring point with callback(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointRT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 PASSED with MeterringPoint is: " + mMeterringPointRT.x + ", " + mMeterringPointRT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 callback");
                        if (!err) {
                            if ((data.x == mMeterringPointRT.x) && (data.y == mMeterringPointRT.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102
        * @tc.name      : Check capture session set meterring point with promise(right-top point)
        * @tc.desc      : Check capture session set meterring point with promise(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 PASSED with MeterringPoint is: " + mMeterringPointRT.x + ", " + mMeterringPointRT.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 finish");
                    if ((meterringPoint.x == mMeterringPointRT.x) && (meterringPoint.y == mMeterringPointRT.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103
        * @tc.name      : Check capture session set meterring point with callback(left-bottom point)
        * @tc.desc      : Check capture session set meterring point with callback(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointLB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 PASSED with MeterringPoint is: " + mMeterringPointLB.x + ", " + mMeterringPointRB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 callback");
                        if (!err) {
                            if ((data.x == mMeterringPointLB.x) && (data.y == mMeterringPointLB.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103
        * @tc.name      : Check capture session set meterring point with promise(left-bottom point)
        * @tc.desc      : Check capture session set meterring point with promise(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 PASSED with MeterringPoint is: " + mMeterringPointLB.x + ", " + mMeterringPointRB.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 finish");
                    if ((meterringPoint.x == mMeterringPointLB.x) && (meterringPoint.y == mMeterringPointLB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104
        * @tc.name      : Check capture session set meterring point with callback(right-bottom point)
        * @tc.desc      : Check capture session set meterring point with callback(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointRB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 PASSED with MeterringPoint is: " + mMeterringPointRB.x + ", " + mMeterringPointRB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 callback");
                        if (!err) {
                            if ((data.x == mMeterringPointRB.x) && (data.y == mMeterringPointRB.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0104 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104
        * @tc.name      : Check capture session set meterring point with promise(right-bottom point)
        * @tc.desc      : Check capture session set meterring point with promise(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 PASSED with MeterringPoint is: " + mMeterringPointRB.x + ", " + mMeterringPointRB.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 finish");
                    if ((meterringPoint.x == mMeterringPointRB.x) && (meterringPoint.y == mMeterringPointRB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
    
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0104 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105
        * @tc.name      : Check capture session set meterring point with callback(left-top invalid point)
        * @tc.desc      : Check capture session set meterring point with callback(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointInvalidLT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 PASSED with MeterringPoint is: " + mMeterringPointInvalidLT.x + ", " + mMeterringPointInvalidLT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 callback");
                        if (!err) {
                            if (((data.x != mMeterringPointInvalidLT.x) && (data.y != mMeterringPointInvalidLT.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0105 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105
        * @tc.name      : Check capture session set meterring point with promise(left-top invalid point)
        * @tc.desc      : Check capture session set meterring point with promise(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointInvalidLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 PASSED with MeterringPoint is: " + mMeterringPointInvalidLT.x + ", " + mMeterringPointInvalidLT.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 finish");
                    if (((meterringPoint.x != mMeterringPointInvalidLT.x) && (meterringPoint.y != mMeterringPointInvalidLT.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0105 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106
        * @tc.name      : Check capture session set meterring point with callback(right-top invalid point)
        * @tc.desc      : Check capture session set meterring point with callback(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointInvalidRT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 PASSED with MeterringPoint is: " + mMeterringPointInvalidRT.x + ", " + mMeterringPointInvalidRT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 callback");
                        if (!err) {
                            if (((data.x != mMeterringPointInvalidRT.x) && (data.y != mMeterringPointInvalidRT.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0106 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106
        * @tc.name      : Check capture session set meterring point with promise(right-top invalid point)
        * @tc.desc      : Check capture session set meterring point with promise(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointInvalidRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 PASSED with MeterringPoint is: " + mMeterringPointInvalidRT.x + ", " + mMeterringPointInvalidRT.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 finish");
                    if (((meterringPoint.x != mMeterringPointInvalidRT.x) && (meterringPoint.y != mMeterringPointInvalidRT.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0106 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107
        * @tc.name      : Check capture session set meterring point with callback(left-bottom invalid point)
        * @tc.desc      : Check capture session set meterring point with callback(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointInvalidLB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 PASSED with MeterringPoint is: " + mMeterringPointInvalidLB.x + ", " + mMeterringPointInvalidRB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 callback");
                        if (!err) {
                            if (((data.x != mMeterringPointInvalidLB.x) && (data.y != mMeterringPointInvalidLB.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0107 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107
        * @tc.name      : Check capture session set meterring point with promise(left-bottom invalid point)
        * @tc.desc      : Check capture session set meterring point with promise(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointInvalidLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 PASSED with MeterringPoint is: " + mMeterringPointInvalidLB.x + ", " + mMeterringPointInvalidRB.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 finish");
                    if (((meterringPoint.x != mMeterringPointInvalidLB.x) && (meterringPoint.y != mMeterringPointInvalidLB.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0107 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108
        * @tc.name      : Check capture session set meterring point with callback(right-bottom invalid point)
        * @tc.desc      : Check capture session set meterring point with callback(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setMeterringPoint(mMeterringPointInvalidRB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 PASSED with MeterringPoint is: " + mMeterringPointInvalidRB.x + ", " + mMeterringPointInvalidRB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getMeterringPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 callback");
                        if (!err) {
                            if (((data.x != mMeterringPointInvalidRB.x) && (data.y != mMeterringPointInvalidRB.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 PASSED with MeterringPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 FAILED with MeterringPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_CALLBACK_0108 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108
        * @tc.name      : Check capture session set meterring point with promise(right-bottom invalid point)
        * @tc.desc      : Check capture session set meterring point with promise(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.setMeterringPoint(mMeterringPointInvalidRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 PASSED with MeterringPoint is: " + mMeterringPointInvalidRB.x + ", " + mMeterringPointInvalidRB.y);  
                    await sleep(500);

                    let meterringPoint = await mCameraSession.getMeterringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 finish");
                    if (((meterringPoint.x != mMeterringPointInvalidRB.x) && (meterringPoint.y != mMeterringPointInvalidRB.y)) || (mEnableCheckInvalidMeterringPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 PASSED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 FAILED with MeterringPoint is: " + meterringPoint.x + ", " + meterringPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERRING_POINT_PROMISE_0108 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100
        * @tc.name      : Check capture session get exposure bias range with callback
        * @tc.desc      : Check capture session get exposure bias range with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.getExposureBiasRange(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 callback");
                        if (!err) {
                            if (data.length > 0) {
                                mExposureBiasRangeArray[i] = data;
                                console.info(TAG + i + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 PASSED with ExposureBiasRange length is: " + data.length);
                                for (let j = 0; j < mExposureBiasRangeArray[i].length; j++) {
                                    console.info(TAG + j + "th, exposure bias is: " + data[j] + ", " + mExposureBiasRangeArray[i][j]);
    
                                    if ((mExposureBiasMaxArray[i] == undefined) || (mExposureBiasMaxArray[i] < mExposureBiasRangeArray[i][j])) {
                                        mExposureBiasMaxArray[i] = mExposureBiasRangeArray[i][j]
                                    }
    
                                    if ((mExposureBiasMinArray[i] == undefined) || (mExposureBiasMinArray[i] > mExposureBiasRangeArray[i][j])) {
                                        mExposureBiasMinArray[i] = mExposureBiasRangeArray[i][j]
                                    }
                                }
    
                                console.info(TAG + "Exposure bias max is: " + mExposureBiasMaxArray[i] + ", min is: " + mExposureBiasMinArray[i]);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 FAILED with ExposureBiasRange length is: " + data.length);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100
        * @tc.name      : Check capture session get exposure bias range with promise
        * @tc.desc      : Check capture session get exposure bias range with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100
        * @tc.name      : Check capture session set exposure bias with callback
        * @tc.desc      : Check capture session set exposure bias with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setExposureBias(mExposureBiasRangeArray[i][0], async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 PASSED with ExposureBias is: " + mExposureBiasRangeArray[i][0]);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getExposureValue(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 callback");
                        if (!err) {
                            if (data == mExposureBiasRangeArray[i][0]) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 PASSED with ExposureValue is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 FAILED with ExposureValue is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0100 ends here");
                done();       
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100
        * @tc.name      : Check capture session set exposure bias with promise
        * @tc.desc      : Check capture session set exposure bias with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101
        * @tc.name      : Check capture session set exposure bias with callback(invalid value, min - 1)
        * @tc.desc      : Check capture session set exposure bias with callback(invalid value, min - 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setExposureBias(mExposureBiasMinArray[i] - 1, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 PASSED with ExposureBias is: " + (mExposureBiasMinArray[i] - 1));
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getExposureValue(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 callback");
                        if (!err) {
                            if (data != (mExposureBiasMinArray[i] - 1)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 PASSED with ExposureValue is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 FAILED with ExposureValue is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, min - 1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, min - 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0101 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102
        * @tc.name      : Check capture session set exposure bias with callback(invalid value, min - 0.1)
        * @tc.desc      : Check capture session set exposure bias with callback(invalid value, min - 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setExposureBias(mExposureBiasMinArray[i] - 0.1, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 PASSED with ExposureBias is: " + (mExposureBiasMinArray[i] - 0.1));
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getExposureValue(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 callback");
                        if (!err) {
                            if (data != (mExposureBiasMinArray[i] - 0.1)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 PASSED with ExposureValue is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 FAILED with ExposureValue is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, min - 0.1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, min - 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0102 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103
        * @tc.name      : Check capture session set exposure bias with callback(invalid value, max + 1)
        * @tc.desc      : Check capture session set exposure bias with callback(invalid value, max + 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setExposureBias(mExposureBiasMaxArray[i] + 1, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[i] + 1));
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getExposureValue(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 callback");
                        if (!err) {
                            if (data != (mExposureBiasMaxArray[i] + 1)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 PASSED with ExposureValue is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 FAILED with ExposureValue is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, max + 1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, max + 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0103 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104
        * @tc.name      : Check capture session set exposure bias with callback(invalid value, max + 0.1)
        * @tc.desc      : Check capture session set exposure bias with callback(invalid value, max + 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.setExposureBias(mExposureBiasMaxArray[i] + 0.1, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[i] + 0.1));
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getExposureValue(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 callback");
                        if (!err) {
                            if (data != (mExposureBiasMaxArray[i] + 0.1)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 PASSED with ExposureValue is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 FAILED with ExposureValue is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_CALLBACK_0104 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, max + 0.1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, max + 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0104 ends here");
                done();
            }
        })    

    })
}