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

let mHasFlashArray;
let mIsFlashModeSupportedArray;

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
    url: 'file:///data/media/CameraSessionFlush.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;

export default function cameraSessionFlashTest(surfaceId: any) {

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
        await getFd('CameraSessionFlush.mp4');
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

    async function mgetCameraManagerInstance() {
        console.info('Enter mgetCameraManagerInstance');

        mCameraManager = await cameraObj.getCameraManager(null);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }

        console.info('Exit mgetCameraManagerInstance');

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
        mHasFlashArray = new Array(mCameraDevicesArray.length);
        mIsFlashModeSupportedArray = new Array(mCameraDevicesArray.length);

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

            await sleep(100);

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
                for (let i = 0; i< cameraOutputCap.previewProfiles.length; i++) {
                    mPreviewOutputArray[i] = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
                    if (!isEmpty(mPreviewOutputArray[i])) {
                        break;
                    }
                }

                if (isEmpty(mPreviewOutputArray[i])) {
                    console.info(TAG + "createPreviewOutput FAILED");
                }
            }

            if (!isEmpty(cameraOutputCap.photoProfiles)) {
                console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);   
                
                for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
                    mPhotoOutputArray[i] = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhoteSurface);
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
                for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
                    mVideoOutputArray[i] = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
                    if (!isEmpty(mVideoOutputArray[i])) {
                        break;
                    }
                }

                if (isEmpty(mVideoOutputArray[i])) {
                    console.info(TAG + "createVideoOutput FAILED");
                }

                console.info(TAG + "createVideoOutput: " + mPhotoOutputArray[i]);  
            }
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
    
            if (!isEmpty(mPhotoOutputArray[i])) {
                await mPhotoOutputArray[i].close();
                await mPhotoOutputArray[i].release();
            }
    
            if (!isEmpty(mVideoOutputArray[i])) {
                await mVideoOutputArray[i].close();
                await mVideoOutputArray[i].release();
            }
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
        
        if (!isEmpty(mPhotoOutputArray[idx])) {
            console.info(TAG + "Start to addOutput mPhotoOutput");
            await mCameraSession.addOutput(mPhotoOutputArray[idx]);
        }

        if (!isEmpty(mVideoOutputArray[idx])) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            await mCameraSession.addOutput(mVideoOutputArray[idx]);
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

        if (!isEmpty(mPhotoOutputArray[idx])) {
            console.info(TAG + "Start to removeOutput mPhotoOutput");
            await mCameraSession.removeOutput(mPhotoOutputArray[idx]);
        }

        if (!isEmpty(mVideoOutputArray[idx])) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            await mCameraSession.removeOutput(mVideoOutputArray[idx]);
        }

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionFlashTest', function () {
        console.info(TAG + '----------cameraSessionFlashTest--------------')

        beforeAll(async function () {
            sleep(100);
            await applyPermission();
            await getPhotoReceiverSurface();
            await getVideoReceiveSurface();
            await mgetCameraManagerInstance();
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
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100
        * @tc.name      : Check capture session has flash with callback or not
        * @tc.desc      : Check capture session has flash with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
                    mHasFlashArray[i] = false;
    
                    mCameraSession.hasFlash(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 callback");
                        if (!err) {
                            if (data != null || data != undefined) {
                                mHasFlashArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 PASSED with hasFlash is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 FAILED with hasFlash is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_CALLBACK_0100 ends here");
                done();    
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100
        * @tc.name      : Check capture session has flash with promise or not
        * @tc.desc      : Check capture session has flash with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let hasFlashPromise = await mCameraSession.hasFlash();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 finish");
                    if (hasFlashPromise != null || hasFlashPromise != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 PASSED with hasFlash is: " + hasFlashPromise);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 FAILED with hasFlash is: " + hasFlashPromise);
                        expect().assertFail();
                    }
                    await sleep(1000);
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 ends here");
                done();     
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100
        * @tc.name      : Check capture session support flash close mode with callback or not
        * @tc.desc      : Check capture session support flash close mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFlashModeSupportedArray[i] = false;
    
                    if (mHasFlashArray[i] == true) {
                        mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 callback");
                            if (!err) {
                                if (data != null || data != undefined) {
                                    mIsFlashModeSupportedArray[i] = data;
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 PASSED with isFlashModeSupported is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 FAILED with isFlashModeSupported is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0100 ends here");
                done();    
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support flash close mode with promise or not
        * @tc.desc      : Check capture session support flash close mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mHasFlashArray[i] == true) {
                        let isFlashModeSupported = await mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 finish");
                        if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 PASSED with isFlashModeSupported is: " + isFlashModeSupported);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 FAILED with isFlashModeSupported is: " + isFlashModeSupported);
                            expect().assertFail();
                        }    
    
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }

        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100
        * @tc.name      : Check capture session set flash close mode with callback
        * @tc.desc      : Check capture session set flash close mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFlashMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 callback");
                            if (!err) {
                                if (data == cameraObj.FlashMode.FLASH_MODE_CLOSE) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 PASSED with FlaseMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 FAILED with FlaseMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100
        * @tc.name      : Check capture session set flash close mode with promise
        * @tc.desc      : Check capture session set flash close mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        await mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);  
                        await sleep(500);

                        let flashMode = await mCameraSession.getFlashMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 finish");
                        if (flashMode == cameraObj.FlashMode.FLASH_MODE_CLOSE) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 PASSED with FlaseMode is: " + flashMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 FAILED with FlaseMode is: " + flashMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101
        * @tc.name      : Check capture session support flash open mode with callback or not
        * @tc.desc      : Check capture session support flash open mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFlashModeSupportedArray[i] = false;
    
                    if (mHasFlashArray[i] == true) {
                        mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 callback");
                            if (!err) {
                                if (data != null || data != undefined) {
                                    mIsFlashModeSupportedArray[i] = data;
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 PASSED with isFlashModeSupported is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 FAILED with isFlashModeSupported is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101
        * @tc.name      : Check capture session support flash open mode with promise or not
        * @tc.desc      : Check capture session support flash open mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mHasFlashArray[i] == true) {
                        let isFlashModeSupported = await mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 finish");
                        if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 PASSED with isFlashModeSupported is: " + isFlashModeSupported);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 FAILED with isFlashModeSupported is: " + isFlashModeSupported);
                            expect().assertFail();
                        }    
    
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101
        * @tc.name      : Check capture session set flash open mode with callback
        * @tc.desc      : Check capture session set flash open mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFlashMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 callback");
                            if (!err) {
                                if (data == cameraObj.FlashMode.FLASH_MODE_OPEN) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 PASSED with FlaseMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 FAILED with FlaseMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101
        * @tc.name      : Check capture session set flash open mode with promise
        * @tc.desc      : Check capture session set flash open mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        await mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);  
                        await sleep(500);

                        let flashMode = await mCameraSession.getFlashMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 finish");
                        if (flashMode == cameraObj.FlashMode.FLASH_MODE_OPEN) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 PASSED with FlaseMode is: " + flashMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 FAILED with FlaseMode is: " + flashMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102
        * @tc.name      : Check capture session support flash auto mode with callback or not
        * @tc.desc      : Check capture session support flash auto mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFlashModeSupportedArray[i] = false;
    
                    if (mHasFlashArray[i] == true) {
                        mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 callback");
                            if (!err) {
                                if (data != null || data != undefined) {
                                    mIsFlashModeSupportedArray[i] = data;
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 PASSED with isFlashModeSupported is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 FAILED with isFlashModeSupported is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102
        * @tc.name      : Check capture session support flash auto mode with promise or not
        * @tc.desc      : Check capture session support flash auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mHasFlashArray[i] == true) {
                        let isFlashModeSupported = await mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 finish");
                        if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 PASSED with isFlashModeSupported is: " + isFlashModeSupported);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 FAILED with isFlashModeSupported is: " + isFlashModeSupported);
                            expect().assertFail();
                        }    
    
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102
        * @tc.name      : Check capture session set flash auto mode with callback
        * @tc.desc      : Check capture session set flash auto mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFlashMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 callback");
                            if (!err) {
                                if (data == cameraObj.FlashMode.FLASH_MODE_AUTO) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 PASSED with FlaseMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 FAILED with FlaseMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102
        * @tc.name      : Check capture session set flash auto mode with promise
        * @tc.desc      : Check capture session set flash auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        await mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);  
                        await sleep(500);

                        let flashMode = await mCameraSession.getFlashMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 finish");
                        if (flashMode == cameraObj.FlashMode.FLASH_MODE_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 PASSED with FlaseMode is: " + flashMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 FAILED with FlaseMode is: " + flashMode);
                            expect().assertFail();
                        }
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103
        * @tc.name      : Check capture session support flash always open mode with callback or not
        * @tc.desc      : Check capture session support flash always open mode with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mIsFlashModeSupportedArray[i] = false;
    
                    if (mHasFlashArray[i] == true) {
                        mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 callback");
                            if (!err) {
                                if (data != null || data != undefined) {
                                    mIsFlashModeSupportedArray[i] = data;
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 PASSED with isFlashModeSupported is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 FAILED with isFlashModeSupported is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_CALLBACK_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103
        * @tc.name      : Check capture session support flash always open mode with promise or not
        * @tc.desc      : Check capture session support flash always open mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mHasFlashArray[i] == true) {
                        let isFlashModeSupported = await mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 finish");
                        if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 PASSED with hasFlash is: " + isFlashModeSupported);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 FAILED with hasFlash is: " + isFlashModeSupported);
                            expect().assertFail();
                        }    
    
                        await sleep(1000);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103
        * @tc.name      : Check capture session set flash always open mode with callback
        * @tc.desc      : Check capture session set flash always open mode with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getFlashMode(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 callback");
                            if (!err) {
                                if (data == cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 PASSED with FlaseMode is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 FAILED with FlaseMode is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_CALLBACK_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103
        * @tc.name      : Check capture session set flash always open mode with promise
        * @tc.desc      : Check capture session set flash always open mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if ((mHasFlashArray[i] == true) && (mIsFlashModeSupportedArray[i] == true)) {
                        await mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 PASSED with FlashMode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);  
                        await sleep(500);

                        let flashMode = await mCameraSession.getFlashMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 finish");
                        if (flashMode == cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 PASSED with FlaseMode is: " + flashMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 FAILED with FlaseMode is: " + flashMode);
                            expect().assertFail();
                        }
    
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 not support");
                    }
                    
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_0103 ends here");
                done();
            }
        })

    })
}