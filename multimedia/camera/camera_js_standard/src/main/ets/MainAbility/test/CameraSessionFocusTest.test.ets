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
let mPreviewOutputArray;
let mPhotoOutputArray;
let mVideoOutputArray;

let mIsFocusModeSupportedArray;

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
    url: 'file:///data/media/CameraSessionFocus.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;

let mFocusPoint = {
    x: mPicWidthMax / 2,
    y: mPicHeightMax / 2,
}

let mFocusPointLT = {
    x: 0,
    y: 0,
}

let mFocusPointRT = {
    x: mPicWidthMax ,
    y: 0,
}

let mFocusPointLB = {
    x: 0,
    y: mPicHeightMax,
}

let mFocusPointRB = {
    x: mPicWidthMax,
    y: mPicHeightMax,
}

let mFocusPointInvalidLT = {
    x: -1,
    y: -1,
}

let mFocusPointInvalidRT = {
    x: (mPicWidthMax + 1),
    y: -1,
}

let mFocusPointInvalidLB = {
    x: -1,
    y: (mPicHeightMax + 1),
}

let mFocusPointInvalidRB = {
    x: (mPicWidthMax + 1),
    y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidFocusPoint = false;

export default function cameraSessionFocusTest(surfaceId: any) {

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
        await getFd('CameraSessionFocus.mp4');
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

        await sleep(100);
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

        await sleep(10);

        console.info('Exit beginCameraSessionConfig');

        return true;
    }

    async function commitCameraSessionConfig() {
        console.info('Enter commitCameraSessionConfig');

        mCameraSession.commitConfig(async (err, data) => {
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

    async function createInputs() {
        console.info('Enter createInputs');

        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "Entering createInputs FAILED with NoCamera");
            return false;
        }

        mCameraInputArray = new Array(mCameraDevicesArray.length);
        mIsFocusModeSupportedArray = new Array(mCameraDevicesArray.length);

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

        mPreviewOutputArray = new Array(mCameraDevicesArray.length);
        mPhotoOutputArray = new Array(mCameraDevicesArray.length);
        mVideoOutputArray = new Array(mCameraDevicesArray.length);

        for (let i = 0; i < mCameraDevicesArray.length; i++) {
            let cameraOutputCap = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[i]);
            if (!isEmpty(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);      
                for (let j = 0; j < cameraOutputCap.previewProfiles.length; j++) {
                    mPreviewOutputArray[i] = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[j], surfaceId);
                    if (!isEmpty(mPreviewOutputArray[i])) {
                        break;
                    }
                }

                if (isEmpty(mPreviewOutputArray[i])) {
                    console.info(TAG + "createPreviewOutput FAILED");
                }
            }

            /*
            if (!isEmpty(cameraOutputCap.photoProfiles)) {
                console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);   
                
                for (let j = 0; j < cameraOutputCap.photoProfiles.length; j++) {
                    mPhotoOutputArray[i] = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[j], mPhoteSurface);
                    if (!isEmpty(mPhotoOutputArray[i])) {
                        break;
                    }
                }

                if (isEmpty(mPhotoOutputArray[i])) {
                    console.info(TAG + "createPhotoOutput FAILED");
                }

                console.info(TAG + "createPhotoOutput: " + mPhotoOutputArray[i]);
            }

            if (!isEmpty(cameraOutputCap.videoProfiles)) {
                console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length); 
                for (let j = 0; j < cameraOutputCap.videoProfiles.length; j++) {
                    mVideoOutputArray[i] = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[j], mVideoSurface);
                    if (!isEmpty(mVideoOutputArray[i])) {
                        break;
                    }
                }

                if (isEmpty(mVideoOutputArray[i])) {
                    console.info(TAG + "createVideoOutput FAILED");
                }

                console.info(TAG + "createVideoOutput: " + mPhotoOutputArray[i]);  
            }
            */
        }

        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutputs() {
        for (let i = 0; i < mCameraDevicesArray.length; i++) {
            if (!isEmpty(mPreviewOutputArray[i])) {
                await mPreviewOutputArray[i].close();
                await mPreviewOutputArray[i].release();
            }
    
            /*
            if (!isEmpty(mPhotoOutputArray[i])) {
                await mPhotoOutputArray[i].close();
                await mPhotoOutputArray[i].release();
            }
    
            if (!isEmpty(mVideoOutputArray[i])) {
                await mVideoOutputArray[i].close();
                await mVideoOutputArray[i].release();
            }
            */
        }
        
        return true;
    }

    async function startCameraSession(idx:any) {
        console.info(TAG + "Enter startCameraSession");

        if (!isEmpty(mCameraInputArray[idx])) {
            console.info(TAG + "Start to addInput");
            await mCameraSession.addInput(mCameraInputArray[idx]);
        }
        
        if (!isEmpty(mPreviewOutputArray[idx])) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            await mCameraSession.addOutput(mPreviewOutputArray[idx]);
        }
        
        /*
        if (!isEmpty(mPhotoOutputArray[idx])) {
            console.info(TAG + "Start to addOutput mPhotoOutput");
            await mCameraSession.addOutput(mPhotoOutputArray[idx]);
        }

        if (!isEmpty(mVideoOutputArray[idx])) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            await mCameraSession.addOutput(mVideoOutputArray[idx]);
        }
        */

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

    async function stopCameraSession(idx:any) {
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

        if (!isEmpty(mCameraInputArray[idx])) {
            console.info(TAG + "Start to removeInput input");
            await mCameraSession.removeInput(mCameraInputArray[idx]);
        }

        if (!isEmpty(mPreviewOutputArray[idx])) {
            console.info(TAG + "Start to removeOutput mPreviewOutput");
            await mCameraSession.removeOutput(mPreviewOutputArray[idx]);
        }

        /*
        if (!isEmpty(mPhotoOutputArray[idx])) {
            console.info(TAG + "Start to removeOutput mPhotoOutput");
            await mCameraSession.removeOutput(mPhotoOutputArray[idx]);
        }

        if (!isEmpty(mVideoOutputArray[idx])) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            await mCameraSession.removeOutput(mVideoOutputArray[idx]);
        }
        */

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionFocusTest', function () {
        console.info(TAG + '----------cameraSessionFocusTest--------------')

        beforeAll(async function () {
            sleep(100);
            await applyPermission();
            await getPhotoReceiverSurface();
            await getVideoReceiveSurface();
            await getCameraManagerInstance();
            await getCameraSupportDevicesArray();
            await createCameraSessionInstance();
            await createInputs();
            await createOutputs();

            console.info('Device type = ' + deviceInfo.deviceType);

            console.info('beforeAll case');
        })
    
        beforeEach(function () {
            sleep(5000);
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            releaseInputs();
            releaseOutputs();
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100
        * @tc.name      : Check capture session support focus manual mode with callback or not
        * @tc.desc      : Check capture session support focus manual mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFocusModeSupportedArray[i] = false;
    
                    mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsFocusModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 PASSED with isFocusModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 FAILED with isFocusModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support focus manual mode with promise or not
        * @tc.desc      : Check capture session support focus manual mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = await mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100
        * @tc.name      : Check capture session set focus manual mode with callback
        * @tc.desc      : Check capture session set focus manual mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFocusMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 callback");
                            if (!err) {
                                if (data == cameraObj.FocusMode.FOCUS_MODE_MANUAL) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 PASSED with FocusMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 FAILED with FocusMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100
        * @tc.name      : Check capture session set focus manual mode with promise
        * @tc.desc      : Check capture session set focus manual mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        await mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);  
                        await sleep(500);

                        let focusMode = await mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_MANUAL) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200
        * @tc.name      : Check capture session support focus continuous auto mode with callback or not
        * @tc.desc      : Check capture session support focus continuous auto mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFocusModeSupportedArray[i] = false;
    
                    mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsFocusModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 PASSED with isFocusModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 FAILED with isFocusModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0200 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200
        * @tc.name      : Check capture session support focus continuous auto mode with promise or not
        * @tc.desc      : Check capture session support focus continuous auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = await mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0200 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200
        * @tc.name      : Check capture session set focus continuous auto mode with callback
        * @tc.desc      : Check capture session set focus continuous auto mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFocusMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 callback");
                            if (!err) {
                                if (data == cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 PASSED with FocusMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 FAILED with FocusMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0200 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200
        * @tc.name      : Check capture session set focus continuous auto mode with promise
        * @tc.desc      : Check capture session set focus continuous auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        await mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);  
                        await sleep(500);

                        let focusMode = await mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0200 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300
        * @tc.name      : Check capture session support focus auto mode with callback or not
        * @tc.desc      : Check capture session support focus auto mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFocusModeSupportedArray[i] = false;
    
                    mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsFocusModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 PASSED with isFocusModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 FAILED with isFocusModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0300 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300
        * @tc.name      : Check capture session support focus auto mode with promise or not
        * @tc.desc      : Check capture session support focus auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = await mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0300 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300
        * @tc.name      : Check capture session set focus auto mode with callback
        * @tc.desc      : Check capture session set focus auto mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFocusMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 callback");
                            if (!err) {
                                if (data == cameraObj.FocusMode.FOCUS_MODE_AUTO) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 PASSED with FocusMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 FAILED with FocusMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0300 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300
        * @tc.name      : Check capture session set focus auto mode with promise
        * @tc.desc      : Check capture session set focus auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        await mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);  
                        await sleep(500);

                        let focusMode = await mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0300 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400
        * @tc.name      : Check capture session support focus locked mode with callback or not
        * @tc.desc      : Check capture session support focus locked mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFocusModeSupportedArray[i] = false;
    
                    mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mIsFocusModeSupportedArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 PASSED with isFocusModeSupported is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 FAILED with isFocusModeSupported is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_CALLBACK_0400 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400
        * @tc.name      : Check capture session support focus locked mode with promise or not
        * @tc.desc      : Check capture session support focus locked mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = await mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0400 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400
        * @tc.name      : Check capture session set focus locked mode with callback
        * @tc.desc      : Check capture session set focus locked mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFocusMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 callback");
                            if (!err) {
                                if (data == cameraObj.FocusMode.FOCUS_MODE_LOCKED) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 PASSED with FocusMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 FAILED with FocusMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_CALLBACK_0400 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400
        * @tc.name      : Check capture session set focus locked mode with promise
        * @tc.desc      : Check capture session set focus locked mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        await mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);  
                        await sleep(500);

                        let focusMode = await mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_LOCKED) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0400 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100
        * @tc.name      : Check capture session set focus point with callback
        * @tc.desc      : Check capture session set focus point with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPoint, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 PASSED with FocusPoint is: " + mFocusPoint.x + ", " + mFocusPoint.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 callback");
                        if (!err) {
                            if ((data.x == mFocusPoint.x) && (data.y == mFocusPoint.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100
        * @tc.name      : Check capture session set focus point with promise
        * @tc.desc      : Check capture session set focus point with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPoint);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 PASSED with FocusPoint is: " + mFocusPoint.x + ", " + mFocusPoint.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 finish");
                    if ((focusPoint.x == mFocusPoint.x) && (focusPoint.y == mFocusPoint.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200
        * @tc.name      : Check capture session set focus point with callback(left-top point)
        * @tc.desc      : Check capture session set focus point with callback(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointLT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 PASSED with FocusPoint is: " + mFocusPointLT.x + ", " + mFocusPointLT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 callback");
                        if (!err) {
                            if ((data.x == mFocusPointLT.x) && (data.y == mFocusPointLT.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0200 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200
        * @tc.name      : Check capture session set focus point with promise(left-top point)
        * @tc.desc      : Check capture session set focus point with promise(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 PASSED with FocusPoint is: " + mFocusPointLT.x + ", " + mFocusPointLT.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 finish");
                    if ((focusPoint.x == mFocusPointLT.x) && (focusPoint.y == mFocusPointLT.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0200 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300
        * @tc.name      : Check capture session set focus point with callback(right-top point)
        * @tc.desc      : Check capture session set focus point with callback(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointRT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 PASSED with FocusPoint is: " + mFocusPointRT.x + ", " + mFocusPointRT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 callback");
                        if (!err) {
                            if ((data.x == mFocusPointRT.x) && (data.y == mFocusPointRT.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0300 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300
        * @tc.name      : Check capture session set focus point with promise(right-top point)
        * @tc.desc      : Check capture session set focus point with promise(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 PASSED with FocusPoint is: " + mFocusPointRT.x + ", " + mFocusPointRT.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 finish");
                    if ((focusPoint.x == mFocusPointRT.x) && (focusPoint.y == mFocusPointRT.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0300 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400
        * @tc.name      : Check capture session set focus point with callback(left-bottom point)
        * @tc.desc      : Check capture session set focus point with callback(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointLB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 PASSED with FocusPoint is: " + mFocusPointLB.x + ", " + mFocusPointLB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 callback");
                        if (!err) {
                            if ((data.x == mFocusPointLB.x) && (data.y == mFocusPointLB.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0400 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400
        * @tc.name      : Check capture session set focus point with promise(left-bottom point)
        * @tc.desc      : Check capture session set focus point with promise(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 PASSED with FocusPoint is: " + mFocusPointLB.x + ", " + mFocusPointLB.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 finish");
                    if ((focusPoint.x == mFocusPointLB.x) && (focusPoint.y == mFocusPointLB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0400 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500
        * @tc.name      : Check capture session set focus point with callback(right-bottom point)
        * @tc.desc      : Check capture session set focus point with callback(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointRB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 PASSED with FocusPoint is: " + mFocusPointRB.x + ", " + mFocusPointRB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 callback");
                        if (!err) {
                            if ((data.x == mFocusPointRB.x) && (data.y == mFocusPointRB.y)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0500 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500
        * @tc.name      : Check capture session set focus point with promise(right-bottom point)
        * @tc.desc      : Check capture session set focus point with promise(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 PASSED with FocusPoint is: " + mFocusPointRB.x + ", " + mFocusPointRB.y);  
                    await sleep(500);
                    
                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 finish");
                    if ((focusPoint.x == mFocusPointRB.x) && (focusPoint.y == mFocusPointRB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0500 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600
        * @tc.name      : Check capture session set focus point with callback(left-top invalid point)
        * @tc.desc      : Check capture session set focus point with callback(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidLT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 PASSED with FocusPoint is: " + mFocusPointInvalidLT.x + ", " + mFocusPointInvalidLT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 callback");
                        if (!err) {
                            if (((data.x != mFocusPointInvalidLT.x) && (data.y != mFocusPointInvalidLT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0600 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600
        * @tc.name      : Check capture session set focus point with promise(left-top invalid point)
        * @tc.desc      : Check capture session set focus point with promise(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointInvalidLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 PASSED with FocusPoint is: " + mFocusPointInvalidLT.x + ", " + mFocusPointInvalidLT.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 finish");
                    if (((focusPoint.x != mFocusPointInvalidLT.x) && (focusPoint.y != mFocusPointInvalidLT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0600 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700
        * @tc.name      : Check capture session set focus point with callback(right-top invalid point)
        * @tc.desc      : Check capture session set focus point with callback(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidRT, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 PASSED with FocusPoint is: " + mFocusPointInvalidRT.x + ", " + mFocusPointInvalidRT.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 callback");
                        if (!err) {
                            if (((data.x != mFocusPointInvalidRT.x) && (data.y != mFocusPointInvalidRT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0700 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700
        * @tc.name      : Check capture session set focus point with promise(right-top invalid point)
        * @tc.desc      : Check capture session set focus point with promise(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointInvalidRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 PASSED with FocusPoint is: " + mFocusPointInvalidRT.x + ", " + mFocusPointInvalidRT.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 finish");
                    if (((focusPoint.x != mFocusPointInvalidRT.x) && (focusPoint.y != mFocusPointInvalidRT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0700 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800
        * @tc.name      : Check capture session set focus point with callback(left-bottom invalid point)
        * @tc.desc      : Check capture session set focus point with callback(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidLB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 PASSED with FocusPoint is: " + mFocusPointInvalidLB.x + ", " + mFocusPointInvalidLB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 callback");
                        if (!err) {
                            if (((data.x != mFocusPointInvalidLB.x) && (data.y != mFocusPointInvalidLB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0800 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800
        * @tc.name      : Check capture session set focus point with promise(left-bottom invalid point)
        * @tc.desc      : Check capture session set focus point with promise(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointInvalidLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 PASSED with FocusPoint is: " + mFocusPointInvalidLB.x + ", " + mFocusPointInvalidLB.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 finish");
                    if (((focusPoint.x != mFocusPointInvalidLB.x) && (focusPoint.y != mFocusPointInvalidLB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0800 ends here");
                done();
            }
        })  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900
        * @tc.name      : Check capture session set focus point with callback(right-bottom invalid point)
        * @tc.desc      : Check capture session set focus point with callback(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidRB, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 PASSED with FocusPoint is: " + mFocusPointInvalidRB.x + ", " + mFocusPointInvalidRB.y);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCameraSession.getFocusPoint(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 callback");
                        if (!err) {
                            if (((data.x != mFocusPointInvalidRB.x) && (data.y != mFocusPointInvalidRB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 PASSED with FocusPoint is: " + data.x + ", " + data.y);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 FAILED with FocusPoint is: " + data.x + ", " + data.y);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_CALLBACK_0900 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900
        * @tc.name      : Check capture session set focus point with promise(right-bottom invalid point)
        * @tc.desc      : Check capture session set focus point with promise(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    await mCameraSession.setFocusPoint(mFocusPointInvalidRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 PASSED with FocusPoint is: " + mFocusPointInvalidRB.x + ", " + mFocusPointInvalidRB.y);  
                    await sleep(500);

                    let focusPoint = await mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 finish");
                    if (((focusPoint.x != mFocusPointInvalidRB.x) && (focusPoint.y != mFocusPointInvalidRB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    await sleep(500);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0900 ends here");
                done();
            }
        })  
        
        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100
        * @tc.name      : Check capture session get focal length with callback
        * @tc.desc      : Check capture session get focal length with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.getFocalLength(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 PASSED with FocalLength is: " + data);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100
        * @tc.name      : Check capture session get focal length with promise
        * @tc.desc      : Check capture session get focal length with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let focalLength = await mCameraSession.getFocalLength();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 PASSED with FocalLength is: " + focalLength);
    
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 ends here");
                done(); 
            }
        })    

    })
}