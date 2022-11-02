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

let mZoomRatioRangeArray;
let mZoomRatioMaxArray;
let mZoomRatioMinArray;

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
    url: 'file:///data/media/CameraSessionZoomRatio.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;

export default function cameraSessionZoomRatioTest(surfaceId: any) {

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
            let permissionName6 = 'ohos.permission.START_ABILIIES_FROM_BACKGROUND';
            let permissionName7 = 'ohos.permission.START_INVISIBLE_ABILITY';
            let permissionName8 = 'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION';
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
            await atManager.grantUserGrantedPermission(tokenID, permissionName6, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
              await atManager.grantUserGrantedPermission(tokenID, permissionName7, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
              await atManager.grantUserGrantedPermission(tokenID, permissionName8, 1).then((result) => {
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
            mPhotoSurface = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
        } else {
            console.log(TAG + 'Photo receiver is created failed')
        }
        console.log(TAG + 'Exit getPhotoReceiverSurface')
    }

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraSessionZoomRatio.mp4');
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

        //mCameraNum = 1;
        mCameraNum = mCameraDevicesArray.length;

        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

        mZoomRatioRangeArray = new Array(mCameraNum);
        mZoomRatioMaxArray = new Array(mCameraNum);
        mZoomRatioMinArray = new Array(mCameraNum);

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
        
        mCameraInput = null;
        await mCameraManager.createCameraInput(mCameraDevicesArray[idx]).then((result) => {
            console.info('createCameraInput success');
            mCameraInput = result;
        }).catch((err) => {
            console.info('createCameraInput failed, err = ' + err.message);
        });
        
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
            await mCameraInput.release();
        }

        console.info('Exit releaseInput');

        return true;
    }

    async function createOutput(idx:any) {
        console.info('Enter createOutput');

        let cameraOutputCap = null;
        await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]).then((result) => {
            console.info('getSupportedOutputCapability success');
            cameraOutputCap = result;
        }).catch((err) => {
            console.info('getSupportedOutputCapability failed, err = ' + err.message);
        });

        if (!isEmpty(cameraOutputCap)) {
            if (!isEmpty(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);      
                for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                    mPreviewOutput = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
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

    describe('cameraSessionZoomRatioTest', function () {
        console.info(TAG + '----------cameraSessionZoomRatioTest--------------')

        beforeAll(async function () {
            sleep(100);

            await applyPermission();
            await getPhotoReceiverSurface();
            await getVideoReceiveSurface();
            await getCameraManagerInstance();
            await getCameraSupportDevicesArray();
            await createCameraSessionInstance();

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
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100
        * @tc.name      : Check capture session get zoom ratio range with callback
        * @tc.desc      : Check capture session get zoom ratio range with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.getZoomRatioRange(async (err, data) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 callback");
                        if (!err) {
                            if (data.length > 0) {
                                mZoomRatioRangeArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 PASSED with ZoomRatioRange length is: " + data.length);
                                for (let j = 0; j < mZoomRatioRangeArray[i].length; j++) {
                                    console.info(TAG + j + "th, zoom ratio is: " + data[j] + ", " + mZoomRatioRangeArray[i][j]);
    
                                    if ((mZoomRatioMaxArray[i] == undefined) || (mZoomRatioMaxArray[i] < mZoomRatioRangeArray[i][j])) {
                                        mZoomRatioMaxArray[i] = mZoomRatioRangeArray[i][j]
                                    }
    
                                    if ((mZoomRatioMinArray[i] == undefined) || (mZoomRatioMinArray[i] > mZoomRatioRangeArray[i][j])) {
                                        mZoomRatioMinArray[i] = mZoomRatioRangeArray[i][j]
                                    }
                                }
    
                                console.info(TAG + "Zoom ratio max is: " + mZoomRatioMaxArray[i] + ", min is: " + mZoomRatioMinArray[i]);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 FAILED with ZoomRatioRange length is: " + data.length);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 PASSED : " + err.message);
                        }
                    })
                    await sleep(100);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 ends here");
                done();           
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100
        * @tc.name      : Check capture session get zoom ratio range with promise
        * @tc.desc      : Check capture session get zoom ratio range with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    try {
                        let zoomRatioRange = await mCameraSession.getZoomRatioRange();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 finish");
                        if (zoomRatioRange.length > 0) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 PASSED with ZoomRatioRange length is: " + zoomRatioRange.length);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 FAILED with ZoomRatioRange length is: " + zoomRatioRange.length);
                            expect().assertFail();
                        }
        
                        for (let j = 0; j < zoomRatioRange.length; j++) {
                            console.info(TAG + j + "th, zoom ratio is: " + zoomRatioRange[j]);
                        }    
                    }
                    catch {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 PASSED");
                    }
    
                    await sleep(100);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100
        * @tc.name      : Check capture session zoom ratio with callback
        * @tc.desc      : Check capture session zoom ratio with callback
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
    
                        mCameraSession.setZoomRatio(mZoomRatioRangeArray[i][0], async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 PASSED with ZoomRatio is: " + mZoomRatioRangeArray[i][0]);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getZoomRatio(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 callback");
                            if (!err) {
                                if (data == mZoomRatioRangeArray[i][0]) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 PASSED with ZoomRatioRange is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 FAILED with ZoomRatioRange is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                        
                        await stopCameraSession();    
                    }
                    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100
        * @tc.name      : Check capture session set zoom ratio with promise
        * @tc.desc      : Check capture session set zoom ratio with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        await mCameraSession.setZoomRatio(mZoomRatioRangeArray[i][0]);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: " + mZoomRatioRangeArray[i][0]);  
                        await sleep(500);

                        let zoomRatio = await mCameraSession.getZoomRatio();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
                        if (zoomRatio == mZoomRatioRangeArray[i][0]) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: " + zoomRatio);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 FAILED with ZoomRatio is: " + zoomRatio);
                            expect().assertFail();
                        }
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101
        * @tc.name      : Check capture session zoom ratio with callback(invalid value, max + 1)
        * @tc.desc      : Check capture session zoom ratio with callback(invalid value, max + 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] + 1), async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] + 1));
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getZoomRatio(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 callback");
                            if (!err) {
                                if (data != (mZoomRatioMaxArray[i] + 1)) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 PASSED with ZoomRatio is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 FAILED with ZoomRatio is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101
        * @tc.name      : Check capture session set zoom ratio with promise(invalid value, max + 1)
        * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, max + 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        await mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] + 1));
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] + 1));  
                        await sleep(500);

                        let zoomRatio = await mCameraSession.getZoomRatio();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 finish");
                        if (zoomRatio != (mZoomRatioMaxArray[i] + 1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 PASSED with ZoomRatio is: " + zoomRatio);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 FAILED with ZoomRatio is: " + zoomRatio);
                            expect().assertFail();
                        }
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102
        * @tc.name      : Check capture session zoom ratio with callback(invalid value, max + 0.1)
        * @tc.desc      : Check capture session zoom ratio with callback(invalid value, max + 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] + 0.1), async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] + 0.1));
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getZoomRatio(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 callback");
                            if (!err) {
                                if (data != (mZoomRatioMaxArray[i] + 0.1)) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 PASSED with ZoomRatio is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 FAILED with ZoomRatio is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102
        * @tc.name      : Check capture session set zoom ratio with promise(invalid value, max + 0.1)
        * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, max + 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        await mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] + 0.1));
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] + 0.1));  
                        await sleep(500);

                        let zoomRatio = await mCameraSession.getZoomRatio();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 finish");
                        if (zoomRatio != (mZoomRatioMaxArray[i] + 0.1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 PASSED with ZoomRatio is: " + zoomRatio);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 FAILED with ZoomRatio is: " + zoomRatio);
                            expect().assertFail();
                        }
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103
        * @tc.name      : Check capture session zoom ratio with callback(invalid value, min - 1)
        * @tc.desc      : Check capture session zoom ratio with callback(invalid value, min - 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        mCameraSession.setZoomRatio((mZoomRatioMinArray[i] - 1), async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] - 1));
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getZoomRatio(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 callback");
                            if (!err) {
                                if (data != (mZoomRatioMinArray[i] - 1)) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 PASSED with ZoomRatio is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 FAILED with ZoomRatio is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0103 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103
        * @tc.name      : Check capture session set zoom ratio with promise(invalid value, min - 1)
        * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, min - 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        await mCameraSession.setZoomRatio((mZoomRatioMinArray[i] - 1));
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] - 1));  
                        await sleep(500);

                        let zoomRatio = await mCameraSession.getZoomRatio();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 finish");
                        if (zoomRatio != (mZoomRatioMinArray[i] - 1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 PASSED with ZoomRatio is: " + zoomRatio);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 FAILED with ZoomRatio is: " + zoomRatio);
                            expect().assertFail();
                        }
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 ends here");
                done();
            }
        })    

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104
        * @tc.name      : Check capture session zoom ratio with callback(invalid value, min - 0.1)
        * @tc.desc      : Check capture session zoom ratio with callback(invalid value, min - 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] - 0.1), async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] - 0.1));
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);

                        mCameraSession.getZoomRatio(async (err, data) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 callback");
                            if (!err) {
                                if (data != (mZoomRatioMaxArray[i] - 0.1)) {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 PASSED with ZoomRatio is: " + data);
                                } else {
                                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 FAILED with ZoomRatio is: " + data);
                                    expect().assertFail();
                                }
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_CALLBACK_0104 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104
        * @tc.name      : Check capture session set zoom ratio with promise(invalid value, min - 0.1)
        * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, min - 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 start for camera[" + i + "]");
    
                    if (!isEmpty(mZoomRatioRangeArray[i])) {
                        await startCameraSession(i);
        
                        await mCameraSession.setZoomRatio((mZoomRatioMinArray[i] - 0.1));
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[i] - 0.1));  
                        await sleep(500);

                        let zoomRatio = await mCameraSession.getZoomRatio();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 finish");
                        if (zoomRatio != (mZoomRatioMinArray[i] - 0.1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 PASSED with ZoomRatio is: " + zoomRatio);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 FAILED with ZoomRatio is: " + zoomRatio);
                            expect().assertFail();
                        }
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 ends here");
                done();
            }
        })    

    })
}