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
    url: 'file:///data/media/CameraSessionBase.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

export default function cameraSessionTest(surfaceId: any) {

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
            let permissionName6 = 'ohos.permission.START_ABILITIES_FROM_BACKGROUND';
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
            mPhoteSurface = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhoteSurface))
        } else {
            console.log(TAG + 'Photo receiver is created failed')
        }
        console.log(TAG + 'Exit getPhotoReceiverSurface')
    }

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraSessionBase.mp4');
        mVideoConfig.url = mFdPath;
        media.createVideoRecorder((err, recorder) => {
            console.info(TAG + 'Entering create video receiver')
            mVideoRecorder = recorder
            console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
            console.info(TAG + 'videoRecorder.prepare called.')
            mVideoRecorder.prepare(mVideoConfig, (err) => {
                console.info(TAG + 'videoRecorder.prepare success.')
                mVideoRecorder.getInputSurface((err, id) => {
                    console.info(TAG + 'getInputSurface called')
                    mVideoSurface = id
                    console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface))
                })
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

        await sleep(300);

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
        if (isEmpty(mCameraInputArray)) {
            console.info(TAG + "Entering releaseInputs FAILED with NoCamera");
        }

        for (let i = 0; i < mCameraInputArray.length; i++) {
            await mCameraInputArray[i].close();
            await mCameraInputArray[i].release();
        }

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
        }

        let cameraOutputCap = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        if (!isEmpty(cameraOutputCap.photoProfiles)) {
            console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);   
            
            for (let j = 0; j < cameraOutputCap.photoProfiles.length; j++) {
                mPhotoOutputArray[0] = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[j], mPhoteSurface);
                if (!isEmpty(mPhotoOutputArray[0])) {
                    break;
                }
            }

            if (isEmpty(mPhotoOutputArray[0])) {
                console.info(TAG + "createPhotoOutput FAILED");
            }

            console.info(TAG + "createPhotoOutput: " + mPhotoOutputArray[0]);
        }

        if (!isEmpty(cameraOutputCap.videoProfiles)) {
            console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length); 
            for (let j = 0; j < cameraOutputCap.videoProfiles.length; j++) {
                mVideoOutputArray[0] = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[j], mVideoSurface);
                if (!isEmpty(mVideoOutputArray[0])) {
                    break;
                }
            }

            if (isEmpty(mVideoOutputArray[0])) {
                console.info(TAG + "createVideoOutput FAILED");
            }

            console.info(TAG + "createVideoOutput: " + mPhotoOutputArray[0]);  
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
        }

        if (!isEmpty(mPhotoOutputArray[0])) {
            await mPhotoOutputArray[0].close();
            await mPhotoOutputArray[0].release();
        }

        if (!isEmpty(mVideoOutputArray[0])) {
            await mVideoOutputArray[0].close();
            await mVideoOutputArray[0].release();
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

    describe('CameraSessionBaseTest', function () {
        console.info(TAG + '----------CameraSessionTest--------------')

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
    
        beforeEach(async function () {
            await sleep(100);
            console.info('beforeEach case');
            //await createCameraSessionInstance();
            await sleep(100);
        })

        afterEach(async function () {
            console.info('afterEach case');
            //await releaseCameraSessionInstance();
            await sleep(100);
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
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100
        * @tc.name      : Check capture session begin and commit config with callback or not
        * @tc.desc      : Check capture session begin and commit config with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mCameraInputArray[0])) {
                    console.info(TAG + "Start to addInput");
                    try {
                        await mCameraSession.addInput(mCameraInputArray[0]);
                    }
                    catch {
                        console.info(TAG + "addInput failed!");
                    }
                }
                
                if (!isEmpty(mPreviewOutputArray[0])) {
                    console.info(TAG + "Start to addOutput mPreviewOutput");
                    try {
                        await mCameraSession.addOutput(mPreviewOutputArray[0]);
                    }
                    catch {
                        console.info(TAG + "addOutput failed!");
                    }
                }
                
                await sleep(500);
                
                mCameraSession.commitConfig(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100 PASSED");
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100 FAILED : " + err.message);
                        expect().assertFail();
                    }
                })
                await sleep(500);

                mCameraSession.beginConfig(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100 PASSED");
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100 FAILED : " + err.message);
                        expect().assertFail();
                    }
                })
                await sleep(500);

                if (!isEmpty(mCameraInputArray[0])) {
                    console.info(TAG + "Start to removeInput");
                    await mCameraSession.removeInput(mCameraInputArray[0]);
                }
                
                if (!isEmpty(mPreviewOutputArray[0])) {
                    console.info(TAG + "Start to removeOutput mPreviewOutput");
                    await mCameraSession.removeOutput(mPreviewOutputArray[0]);
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_CALLBACK_0100 ends here");
                done();    
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100
        * @tc.name      : Check capture session begin and commit config with promise or not
        * @tc.desc      : Check capture session begin and commit config with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mCameraInputArray[0])) {
                    console.info(TAG + "Start to addInput");
                    await mCameraSession.addInput(mCameraInputArray[0]);
                }
                
                if (!isEmpty(mPreviewOutputArray[0])) {
                    console.info(TAG + "Start to addOutput mPreviewOutput");
                    await mCameraSession.addOutput(mPreviewOutputArray[0]);
                }
                
                await sleep(500);
                
                try {
                    await mCameraSession.commitConfig();
                } catch {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100 commitConfig with a error");
                    expect().assertFail();
                }
                
                try {
                    await mCameraSession.beginConfig();
                } catch {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100 beginConfig with a error");
                    expect().assertFail();
                }

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100 PASSED");

                if (!isEmpty(mCameraInputArray[0])) {
                    console.info(TAG + "Start to removeInput");
                    await mCameraSession.removeInput(mCameraInputArray[0]);
                }
                
                if (!isEmpty(mPreviewOutputArray[0])) {
                    console.info(TAG + "Start to removeOutput mPreviewOutput");
                    await mCameraSession.removeOutput(mPreviewOutputArray[0]);
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CONFIG_PROMISE_0100 ends here");
                done();   
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100
        * @tc.name      : Check capture session begin config duplicated with callback or not
        * @tc.desc      : Check capture session begin config duplicated with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                mCameraSession.beginConfig(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100 FAILED");
                        expect().assertFail();
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100 PASSED : " + err.message);
                    }
                })
                await sleep(500);   

                mCameraSession.beginConfig(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100 FAILED");
                        expect().assertFail();
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100 PASSED : " + err.message);
                    }
                })
                await sleep(500); 

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_CALLBACK_0100 ends here");
                done();   
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100
        * @tc.name      : Check capture session begin config duplicated with promise or not
        * @tc.desc      : Check capture session begin config duplicated with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                try {
                    await mCameraSession.beginConfig();   
                } catch {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100 with a error, ingore it");
                }
                try {
                    await mCameraSession.beginConfig();   
                } catch {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100 with a error, ingore it");
                }

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100 PASSED");

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_DUPLICATED_PROMISE_0100 ends here");
                done();   
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100
        * @tc.name      : Check capture session begin config duplicated with callback or not
        * @tc.desc      : Check capture session begin config duplicated with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                mCameraSession.commitConfig(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100 FAILED");
                        expect().assertFail();
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100 PASSED : " + err.message);
                    }
                })
                await sleep(500);   

                mCameraSession.commitConfig(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100 FAILED");
                        expect().assertFail();
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100 PASSED : " + err.message);
                    }
                })
                await sleep(500); 

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_CALLBACK_0100 ends here");
                done();   
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100
        * @tc.name      : Check capture session begin config duplicated with promise or not
        * @tc.desc      : Check capture session begin config duplicated with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                try {
                    await mCameraSession.commitConfig();   
                } catch {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100 with a error, ingore it");
                }
                try {
                    await mCameraSession.commitConfig();   
                } catch {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100 with a error, ingore it");
                } 

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100 PASSED");

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_DUPLICATED_PROMISE_0100 ends here");
                done();   
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100
        * @tc.name      : Check capture session add/remove input with callback or not
        * @tc.desc      : Check capture session add/remove input with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 start for camera[" + i + "]");
    
                    mCameraSession.addInput(mCameraInputArray[i], async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.addOutput(mPreviewOutputArray[i]);
                    await mCameraSession.addOutput(mPhotoOutputArray[i]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    mCameraSession.removeInput(mCameraInputArray[i], async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.removeOutput(mPreviewOutputArray[i]);
                    await mCameraSession.removeOutput(mPhotoOutputArray[i]);
                    await sleep(500);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100
        * @tc.name      : Check capture session can add input with promise or not
        * @tc.desc      : Check capture session can add input with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 start for camera[" + i + "]");
    
                    await mCameraSession.addInput(mCameraInputArray[i]);
                    await mCameraSession.addOutput(mPreviewOutputArray[i]);
                    await mCameraSession.addOutput(mPhotoOutputArray[i]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);
    
                    await mCameraSession.removeInput(mCameraInputArray[i]);
                    await mCameraSession.removeOutput(mPreviewOutputArray[i]);
                    await mCameraSession.removeOutput(mPhotoOutputArray[i]);
                    await sleep(500);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 ends here");
                done();
            }
        })
        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100
        * @tc.name      : Check capture session add/remove output with callback or not for preview
        * @tc.desc      : Check capture session add/remove output with callback or not for preview
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPreviewOutputArray[0])) {
                    mCameraSession.addOutput(mPreviewOutputArray[0], async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 add callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 add PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 add FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.addOutput(mPhotoOutputArray[0]);
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    mCameraSession.removeOutput(mPreviewOutputArray[0], async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 remove callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 remove PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 remove FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.removeOutput(mPhotoOutputArray[0]);
                    await mCameraSession.removeInput(mCameraInputArray[0]);
                    await sleep(500);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 FAILED");
                    expect().assertFail();
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100
        * @tc.name      : Check capture session can add output with promise or not for preview
        * @tc.desc      : Check capture session can add output with promise or not for preview
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPreviewOutputArray[0])) {
                    await mCameraSession.addOutput(mPreviewOutputArray[0]);
                    await mCameraSession.addOutput(mPhotoOutputArray[0]);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 add PASSED");
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    await mCameraSession.removeOutput(mPreviewOutputArray[0]);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 remove PASSED");
                    await mCameraSession.removeOutput(mPhotoOutputArray[0]);
                    await mCameraSession.removeInput(mCameraInputArray[0]);
                    await sleep(500);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 FAILED");
                    expect().assertFail();
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101
        * @tc.name      : Check capture session add/remove output with callback or not for photo
        * @tc.desc      : Check capture session add/remove output with callback or not for photo
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPhotoOutputArray[0])) {
                    if (!isEmpty(mPreviewOutputArray[0])) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        await mCameraSession.addOutput(mPreviewOutputArray[0]);
                    }
                    mCameraSession.addOutput(mPhotoOutputArray[0], async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 add callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 add PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 add FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    if (!isEmpty(mPreviewOutputArray[0])) {
                        console.info(TAG + "Start to removeOutput mPreviewOutput");
                        await mCameraSession.removeOutput(mPreviewOutputArray[0]);
                    }
                    mCameraSession.removeOutput(mPhotoOutputArray[0], async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 remove callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 remove PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 remove FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.removeInput(mCameraInputArray[0]);
                    await sleep(500);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 FAILED");
                    expect().assertFail();
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101
        * @tc.name      : Check capture session can add/remove output with promise or not for photo
        * @tc.desc      : Check capture session can add/remove output with promise or not for photo
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPhotoOutputArray[0])) {
                    if (!isEmpty(mPreviewOutputArray[0])) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        await mCameraSession.addOutput(mPreviewOutputArray[0]);
                    }
                    await mCameraSession.addOutput(mPhotoOutputArray[0]);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101 add PASSED");
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    if (!isEmpty(mPreviewOutputArray[0])) {
                        console.info(TAG + "Start to removeOutput mPreviewOutput");
                        await mCameraSession.removeOutput(mPreviewOutputArray[0]);
                    }
                    await mCameraSession.removeOutput(mPhotoOutputArray[0]);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101 remove PASSED");
                    await mCameraSession.removeInput(mCameraInputArray[0]);
                    await sleep(500);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101 FAILED");
                    expect().assertFail();
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101 ends here");
                done();
            }
        })


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100
        * @tc.name      : camera status callback on CaptureSession async api for focusStateChange
        * @tc.desc      : camera status callback on CaptureSession async api for focusStateChange
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    let nfyFlag = false;
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.on('focusStateChange', async (err, data) => {
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 callback");
                            if (data != null || data != undefined) {
                                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 PASSED: " + data);
                                nfyFlag = true;
                            }
                        } else {
                            expect().assertFail();
                            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 FAILED: " + err.message);
                        }
                        await sleep(1);
                    })
    
                    mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO);
    
                    await sleep(3000);
    
                    if (nfyFlag == false) {
                        //expect().assertFail();
                        //console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 FAILED without any nofity!");
                    }
                        
                    await beginCameraSessionConfig();
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0100 ends here");
                done(); 
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101
        * @tc.name      : camera status callback on CaptureSession async api for exposureStateChange
        * @tc.desc      : camera status callback on CaptureSession async api for exposureStateChange
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    let nfyFlag = false;
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 start for camera[" + i + "]"); 
    
                    await startCameraSession(i);
    
                    mCameraSession.on('exposureStateChange', async (err, data) => {
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 callback");
                            if (data != null || data != undefined) {
                                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 PASSED: " + data);
                                nfyFlag = true;
                            }
                        } else {
                            expect().assertFail();
                            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 FAILED: " + err.message);
                        }
                        await sleep(1);
                    })
    
                    mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
    
                    await sleep(3000);
    
                    if (nfyFlag == false) {
                        //expect().assertFail();
                        //console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 FAILED without any nofity!");
                    }
                        
                    await beginCameraSessionConfig();
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0101 ends here");
                done(); 
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102
        * @tc.name      : camera status callback on CaptureSession async api for error
        * @tc.desc      : camera status callback on CaptureSession async api for error
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    let nfyFlag = false;
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.on('error', async (err, data) => {
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 callback");
                            if (data != null || data != undefined) {
                                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 PASSED: " + data);
                                nfyFlag = true;
                            }
                        } else {
                            expect().assertFail();
                            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 FAILED: " + err.message);
                        }
                        await sleep(1);
                    })
    
                    await sleep(3000);
    
                    if (nfyFlag == false) {
                        //expect().assertFail();
                        //console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 FAILED without any nofity!");
                    }

                    await beginCameraSessionConfig();
                    await stopCameraSession(i);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_STATUS_CALLBACK_0102 ends here");
                done(); 
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100
        * @tc.name      : Check capture session release with callback or not for preview
        * @tc.desc      : Check capture session release with callback or not for preview
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100--------------");

            await mCameraSession.release(async (err) => {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100 callback");
                if (!err) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100 PASSED");
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100 FAILED : " + err.message);
                    expect().assertFail();
                }
            })
            await sleep(500);

            await await createCameraSessionInstance();
            await sleep(500);

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_CALLBACK_0100 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100
        * @tc.name      : Check capture session release with promise or not
        * @tc.desc      : Check capture session release with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100--------------");

            await mCameraSession.release()
            await sleep(500);

            await await createCameraSessionInstance();
            await sleep(500);

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100 ends here");
            done();
        })

    })
}