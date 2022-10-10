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

let mCanAddInputArray;
let mCanAddOutput;

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
        mCanAddInputArray = new Array(mCameraDevicesArray.length);

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
            //await mCameraSession.addOutput(mPhotoOutput);
        }

        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            //await mCameraSession.addOutput(mVideoOutput);
        }

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
            //await mCameraSession.removeOutput(mPhotoOutput);
        }

        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            //await mCameraSession.removeOutput(mVideoOutput);
        }

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

        afterAll(async function () {
            await releaseInputs();
            await releaseOutputs();
            await releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            await sleep(100);
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
                
                if (!isEmpty(mPreviewOutput)) {
                    console.info(TAG + "Start to addOutput mPreviewOutput");
                    try {
                        await mCameraSession.addOutput(mPreviewOutput);
                    }
                    catch {
                        console.info(TAG + "addOutput failed!");
                    }
                }
                
                if (!isEmpty(mPhotoOutput)) {
                    console.info(TAG + "Start to addOutput mPhotoOutput");
                    //await mCameraSession.addOutput(mPhotoOutput);
                }
        
                if (!isEmpty(mVideoOutput)) {
                    console.info(TAG + "Start to addOutput mVideoOutput");
                    //await mCameraSession.addOutput(mVideoOutput);
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
                
                if (!isEmpty(mPreviewOutput)) {
                    console.info(TAG + "Start to removeOutput mPreviewOutput");
                    await mCameraSession.removeOutput(mPreviewOutput);
                }
                
                if (!isEmpty(mPhotoOutput)) {
                    console.info(TAG + "Start to removeOutput mPhotoOutput");
                    //await mCameraSession.removeOutput(mPhotoOutput);
                }
        
                if (!isEmpty(mVideoOutput)) {
                    console.info(TAG + "Start to removeOutput mVideoOutput");
                    //await mCameraSession.removeOutput(mVideoOutput);
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
                
                if (!isEmpty(mPreviewOutput)) {
                    console.info(TAG + "Start to addOutput mPreviewOutput");
                    await mCameraSession.addOutput(mPreviewOutput);
                }
                
                if (!isEmpty(mPhotoOutput)) {
                    console.info(TAG + "Start to addOutput mPhotoOutput");
                    //await mCameraSession.addOutput(mPhotoOutput);
                }
        
                if (!isEmpty(mVideoOutput)) {
                    console.info(TAG + "Start to addOutput mVideoOutput");
                    //await mCameraSession.addOutput(mVideoOutput);
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
                
                if (!isEmpty(mPreviewOutput)) {
                    console.info(TAG + "Start to removeOutput mPreviewOutput");
                    await mCameraSession.removeOutput(mPreviewOutput);
                }
                
                if (!isEmpty(mPhotoOutput)) {
                    console.info(TAG + "Start to removeOutput mPhotoOutput");
                    //await mCameraSession.removeOutput(mPhotoOutput);
                }
        
                if (!isEmpty(mVideoOutput)) {
                    console.info(TAG + "Start to removeOutput mVideoOutput");
                    //await mCameraSession.removeOutput(mVideoOutput);
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
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100
        * @tc.name      : Check capture session start/stop with callback or not
        * @tc.desc      : Check capture session start/stop with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.start(async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 start callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 start PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 start FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(2000);

                    mCameraSession.stop(async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 stop callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 stop PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 stop FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    await beginCameraSessionConfig();
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_CALLBACK_0100 ends here");
                done();
            }
        })

        /**               
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100
        * @tc.name      : Check capture session start/stop output with promise or not 
        * @tc.desc      : Check capture session start/stop output with promise or not 
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    await mCameraSession.start();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 start PASSED");
                    await sleep(2000);

                    await mCameraSession.stop();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 stop PASSED");
                    await sleep(500);

                    await beginCameraSessionConfig();
                    
                    await stopCameraSession(mCameraInputArray[i]);
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100
        * @tc.name      : Check capture session can add input with callback or not
        * @tc.desc      : Check capture session can add input with callback or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 start for camera[" + i + "]");
    
                    mCanAddInputArray[i] = false;
                    mCameraSession.canAddInput(mCameraInputArray[i], async (err, data) => {
                        if (!err) {
                            if (data != null || data != undefined) {
                                mCanAddInputArray[i] = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 PASSED with canAddInput is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 FAILED with canAddInput is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);

                    mCanAddInputArray[i] = true;
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100
        * @tc.name      : Check capture session can add input with promise or not
        * @tc.desc      : Check capture session can add input with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                for (let i = 0; i < mCameraInputArray.length; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 start for camera[" + i + "]");

                    let bCanAddInput = await mCameraSession.canAddInput(mCameraInputArray[i]);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 finish");
                    if (bCanAddInput != null || bCanAddInput != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 PASSED with canAddInput is: " + bCanAddInput);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 FAILED with canAddInput is: " + bCanAddInput);
                        expect().assertFail();
                    } 
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDINPUT_PROMISE_0100 ends here");
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
    
                    if (mCanAddInputArray[i] == true) {
                        mCameraSession.addInput(mCameraInputArray[i], async (err) => {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 callback");
                            if (!err) {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 PASSED");
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 FAILED : " + err.message);
                                expect().assertFail();
                            }
                        })
                        await mCameraSession.addOutput(mPreviewOutput);
                        await mCameraSession.addOutput(mPhotoOutput);
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
                        await mCameraSession.removeOutput(mPreviewOutput);
                        await mCameraSession.removeOutput(mPhotoOutput);
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_CALLBACK_0100 FAILED");
                        expect().assertFail();
                    }
    
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
    
                    if (mCanAddInputArray[i] == true) {
                        await mCameraSession.addInput(mCameraInputArray[i]);
                        await mCameraSession.addOutput(mPreviewOutput);
                        await mCameraSession.addOutput(mPhotoOutput);
                        await sleep(500);

                        await commitCameraSessionConfig();
                        await sleep(1);
                        await beginCameraSessionConfig();
                        await sleep(1);
    
                        await mCameraSession.removeInput(mCameraInputArray[i]);
                        await mCameraSession.removeOutput(mPreviewOutput);
                        await mCameraSession.removeOutput(mPhotoOutput);
                        await sleep(500);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 FAILED");
                        expect().assertFail();
                    }
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100
        * @tc.name      : Check capture session can add output with callback or not for preview
        * @tc.desc      : Check capture session can add output with callback or not for preview
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPreviewOutput)) {
                    mCanAddOutput = false;
                    mCameraSession.canAddOutput(mPreviewOutput, async (err, data) => {
                        if (!err) {
                            if (data != null || data != undefined) {
                                mCanAddOutput = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100 PASSED with canAddOutput is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100 FAILED with canAddOutput is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500); 
                    mCanAddOutput = true;    
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100 FAILED with NoReviewOutput");
                    expect().assertFail();    
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0100 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100
        * @tc.name      : Check capture session can add output with promise or not for preview
        * @tc.desc      : Check capture session can add output with promise or not for preview
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPreviewOutput)) {
                    let bCanAddOutput = await mCameraSession.canAddOutput(mPreviewOutput);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100 finish");
                    if (bCanAddOutput != null || bCanAddOutput != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100 PASSED with canAddOutput is: " + bCanAddOutput);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100 FAILED with canAddOutput is: " + bCanAddOutput);
                        expect().assertFail();
                    }      
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100 FAILED with NoReviewOutput");
                    expect().assertFail();    
                }
                
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0100 ends here");
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
                if (!isEmpty(mPreviewOutput) && (mCanAddOutput == true)) {
                    mCameraSession.addOutput(mPreviewOutput, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 add callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 add PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 add FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.addOutput(mPhotoOutput);
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    mCameraSession.removeOutput(mPreviewOutput, async (err) => {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 remove callback");
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 remove PASSED");
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_CALLBACK_0100 remove FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await mCameraSession.removeOutput(mPhotoOutput);
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
                if (!isEmpty(mPreviewOutput) && (mCanAddOutput == true)) {
                    await mCameraSession.addOutput(mPreviewOutput);
                    await mCameraSession.addOutput(mPhotoOutput);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 add PASSED");
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    await mCameraSession.removeOutput(mPreviewOutput);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 remove PASSED");
                    await mCameraSession.removeOutput(mPhotoOutput);
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
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101
        * @tc.name      : Check capture session can add output with callback or not for photo
        * @tc.desc      : Check capture session can add output with callback or not for photo
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPhotoOutput)) {
                    mCanAddOutput = false;
                    mCameraSession.canAddOutput(mPhotoOutput, async (err, data) => {
                        if (!err) {
                            if (data != null || data != undefined) {
                                mCanAddOutput = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101 PASSED with canAddOutput is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101 FAILED with canAddOutput is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);  
                    mCanAddOutput = true;  
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101 FAILED with NoPhotoOutput");
                    expect().assertFail();    
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0101 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101
        * @tc.name      : Check capture session can add output with promise or not for photo
        * @tc.desc      : Check capture session can add output with promise or not for photo
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mPhotoOutput)) {
                    let bCanAddOutput = await mCameraSession.canAddOutput(mPhotoOutput);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101 finish");
                    if (bCanAddOutput != null || bCanAddOutput != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101 PASSED with canAddOutput is: " + bCanAddOutput);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101 FAILED with canAddOutput is: " + bCanAddOutput);
                        expect().assertFail();
                    }      
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101 FAILED with NoPhotoOutput");
                    expect().assertFail();    
                }
                
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0101 ends here");
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
                if (!isEmpty(mPhotoOutput) && (mCanAddOutput == true)) {
                    if (!isEmpty(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        await mCameraSession.addOutput(mPreviewOutput);
                    }
                    mCameraSession.addOutput(mPhotoOutput, async (err) => {
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

                    if (!isEmpty(mPreviewOutput)) {
                        console.info(TAG + "Start to removeOutput mPreviewOutput");
                        await mCameraSession.removeOutput(mPreviewOutput);
                    }
                    mCameraSession.removeOutput(mPhotoOutput, async (err) => {
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
                if (!isEmpty(mPhotoOutput) && (mCanAddOutput == true)) {
                    if (!isEmpty(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        await mCameraSession.addOutput(mPreviewOutput);
                    }
                    await mCameraSession.addOutput(mPhotoOutput);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0101 add PASSED");
                    await mCameraSession.addInput(mCameraInputArray[0]);
                    await sleep(500);

                    await commitCameraSessionConfig();
                    await sleep(1);
                    await beginCameraSessionConfig();
                    await sleep(1);

                    await sleep(500);

                    if (!isEmpty(mPreviewOutput)) {
                        console.info(TAG + "Start to removeOutput mPreviewOutput");
                        await mCameraSession.removeOutput(mPreviewOutput);
                    }
                    await mCameraSession.removeOutput(mPhotoOutput);
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
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102
        * @tc.name      : Check capture session can add output with callback or not for video
        * @tc.desc      : Check capture session can add output with callback or not for video
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mVideoOutput)) {
                    mCanAddOutput = false;
                    mCameraSession.canAddOutput(mVideoOutput, async (err, data) => {
                        if (!err) {
                            if (data != null || data != undefined) {
                                mCanAddOutput = data;
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102 PASSED with canAddOutput is: " + data);
                            } else {
                                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102 FAILED with canAddOutput is: " + data);
                                expect().assertFail();
                            }
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102 FAILED : " + err.message);
                            expect().assertFail();
                        }
                    })
                    await sleep(500);   
                    mCanAddOutput = true;  
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102 FAILED with NoVideoOutput");
                    expect().assertFail();    
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_CALLBACK_0102 ends here");
                done();
            }
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102
        * @tc.name      : Check capture session can add output with promise or not for video
        * @tc.desc      : Check capture session can add output with promise or not for video
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102--------------");

            if (isEmpty(mCameraInputArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            }
            else {
                if (!isEmpty(mVideoOutput)) {
                    let bCanAddOutput = await mCameraSession.canAddOutput(mVideoOutput);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102 finish");
                    if (bCanAddOutput != null || bCanAddOutput != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102 PASSED with canAddOutput is: " + bCanAddOutput);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102 FAILED with canAddOutput is: " + bCanAddOutput);
                        expect().assertFail();
                    }      
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102 FAILED with NoVideoOutput");
                    expect().assertFail();    
                }
                
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADDOUTPUT_PROMISE_0102 ends here");
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
    
                    await startCameraSession(mCameraInputArray[i]);
    
                    mCameraSession.on('focusStatusChange', async (err, data) => {
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
                    await stopCameraSession(mCameraInputArray[i]);
    
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
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    await stopCameraSession(mCameraInputArray[i]);
    
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
    
                    await startCameraSession(mCameraInputArray[i]);
    
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
                    await stopCameraSession(mCameraInputArray[i]);
    
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