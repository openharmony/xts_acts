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

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import fileio from '@ohos.fileio';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import media from '@ohos.multimedia.media'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

const TAG = "CameraUnitTest: ";

// Define global variables
let mCameraManager;
let mPhotoSurfaceId;
let mCameraDevicesArray;
let mVideoSurface;
let mVideoRecorder;
let mFdPath;
let mFileAsset;
let mFdNumber;

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
    url: 'file:///data/media/CameraManager.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

export default function cameraManagerTest(surfaceId: any) {

    async function getImageReceiverSurfaceId() {
        console.log(TAG + 'Entering create Image receiver')
        let receiver = image.createImageReceiver(640, 480, 4, 8)
        console.log(TAG + 'before receiver check')
        if (receiver !== undefined) {
            console.log(TAG + 'Receiver is ok')
            mPhotoSurfaceId = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Received id: ' + JSON.stringify(mPhotoSurfaceId))
        } else {
            console.log(TAG + 'Receiver is not ok')
        }
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

      async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraManager.mp4');
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

    async function getCameraManagerInstance() {
        console.info('Enter getCameraManagerInstance');

        mCameraManager = await cameraObj.getCameraManager(null);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        await sleep(500);

        console.info('Exit getCameraManagerInstance');
        return true;
    }

    async function getSupportedOutputCapabilityInCallback(cameraDevice) {
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering getSupportedOutputCapabilityInCallback cameraManager == null || undefined")
            expect().assertFail();
            return undefined;
        }
        let outputCapabilityCallback = null;
        mCameraManager.getSupportedOutputCapability(cameraDevice, async (err, data) => {
            if (!err) {
                if (!isEmpty(data)) {
                    console.info(TAG + "Entering SupportedOutputCapability data is not null || undefined");
                    outputCapabilityCallback = data;
                    expect(outputCapabilityCallback).assertNotNull();
                }
                else {
                    console.info(TAG + "getSupportedOutputCapabilityInCallback FAILED");
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "getSupportedOutputCapabilityInCallback FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "getSupportedOutputCapabilityInCallback ends here");
        })
        await sleep(100);
        return outputCapabilityCallback;
    }

    async function getSupportedOutputCapabilityInPromise(cameraDevice) {
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering getSupportedOutputCapabilityInPromise cameraManager == null || undefined")
            expect().assertFail();
            return undefined;
        }
        let outputCapabilityPromise = await mCameraManager.getSupportedOutputCapability(cameraDevice);
        if (isEmpty(outputCapabilityPromise)) {
            console.info(TAG + "Entering getSupportedOutputCapabilityInPromise outputCapabilityPromise == null || undefined")
            expect().assertFail();
        } else {
            console.info("CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " + JSON.stringify(outputCapabilityPromise));
        }

        return outputCapabilityPromise;
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

describe('CameraManagerTest', function () {
    console.info(TAG + '----------CameraManagerTest--------------')

    beforeAll(async function () {
        await applyPermission();
        await getCameraManagerInstance();
        await getImageReceiverSurfaceId();
        await getVideoReceiveSurface();
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
        sleep(1000);
        console.info('afterAll case');
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100--------------");
        cameraObj.getCameraManager(null, async (err, data) => {
            if (!err) {
                expect(isEmpty(data)).assertFalse();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 success");
            } else {
                expect().assertFail();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 FAILED: " + err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100', 2, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100--------------");
        let cameraManagerPromise = await cameraObj.getCameraManager(null);
        expect(isEmpty(cameraManagerPromise)).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 cameraManagerPromise: " + JSON.stringify(cameraManagerPromise));
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100
      * @tc.name      : Get camera from cameramanager to get array of camera async api
      * @tc.desc      : Get camera from cameramanager to get array of camera async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 cameraManager == null || undefined")
            expect().assertFail();
        }
        mCameraManager.getSupportedCameras(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 success");
                if (!isEmpty(data)) {
                    mCameraDevicesArray = data;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 data is " + mCameraDevicesArray.length);
                    if (mCameraDevicesArray.length > 0) {
                        for (let i = 0; i < mCameraDevicesArray.length; i++) {
                            // Get the variables from camera object
                            let cameraId = mCameraDevicesArray[i].cameraId;
                            expect(isEmpty(cameraId)).assertFalse();
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 camera" + i + "Id: " + cameraId);
                            let cameraPosition = mCameraDevicesArray[i].cameraPosition;
                            expect(isEmpty(cameraPosition)).assertFalse();
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 camera" + i + "Position: " + cameraPosition);
                            let cameraType = mCameraDevicesArray[i].cameraType;
                            expect(isEmpty(cameraType)).assertFalse();
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 camera" + i + "Type: " + cameraType);
                            let connectionType = mCameraDevicesArray[i].connectionType
                            expect(isEmpty(connectionType)).assertFalse();
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 connection" + i + "Type: " + connectionType);
                        }
                        expect(true).assertTrue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 PASSED");
                    } else {
                        expect().assertFail();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED cameraArray is null || undefined");
                    }
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 ends here");
                    await sleep(1000);
                    done();
                } else {
                    expect().assertFail();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED cameraArray is null || undefined");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED , err = " + err.message);
            }
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100
      * @tc.name      : Get camera from cameramanager to get array of camera promise api
      * @tc.desc      : Get camera from cameramanager to get array of camera promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            let mCameraDevicesArrayPromise = await mCameraManager.getSupportedCameras();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100: " + JSON.stringify(mCameraDevicesArrayPromise));
            if (mCameraDevicesArrayPromise != null && mCameraDevicesArrayPromise.length > 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 success");
                for (let i = 0; i < mCameraDevicesArrayPromise.length; i++) {
                    // Get the variables from camera object
                    let cameraId = mCameraDevicesArrayPromise[i].cameraId;
                    expect(isEmpty(cameraId)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Id: " + cameraId);
                    let cameraPosition = mCameraDevicesArrayPromise[i].cameraPosition;
                    expect(isEmpty(cameraPosition)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Position: " + cameraPosition);
                    let cameraType = mCameraDevicesArrayPromise[i].cameraType;
                    expect(isEmpty(cameraType)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Type: " + cameraType);
                    let connectionType = mCameraDevicesArrayPromise[i].connectionType
                    expect(isEmpty(connectionType)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 connection" + i + "Type: " + connectionType);
                }
                expect(true).assertTrue();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 PASSED");
            } else {
                expect().assertFail();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 FAILED");
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInCallback(camerasArray[i]);
            await sleep(100);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let previewProfilesArray = cameraOutputCap.previewProfiles;
            if (isEmpty(previewProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 previewProfilesArray == null || undefined")
                expect().assertFail();
            } 

            let photoProfilesArray = cameraOutputCap.photoProfiles;
            if (isEmpty(photoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 photoProfilesArray == null || undefined")
                expect().assertFail();
            } 

            let videoProfilesArray = cameraOutputCap.videoProfiles;
            if (isEmpty(videoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 videoProfilesArray == null || undefined")
                expect().assertFail();
            } 

            let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
            if (isEmpty(metadataObjectTypesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 metadataObjectTypesArray == null || undefined")
            } 
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100--------------");
        for (let i = 0; i < mCameraDevicesArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(mCameraDevicesArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 camera:" + mCameraDevicesArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let previewProfilesArray = cameraOutputCap.previewProfiles;
            if (isEmpty(previewProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 previewProfilesArray == null || undefined")
                expect().assertFail();
            } 

            let photoProfilesArray = cameraOutputCap.photoProfiles;
            if (isEmpty(photoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 photoProfilesArray == null || undefined")
                expect().assertFail();
            } 

            let videoProfilesArray = cameraOutputCap.videoProfiles;
            if (isEmpty(videoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 videoProfilesArray == null || undefined")
                expect().assertFail();
            } 
            expect(isEmpty(videoProfilesArray)).assertFalse();

            let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
            if (isEmpty(metadataObjectTypesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 metadataObjectTypesArray == null || undefined")
            } 
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 PASSED camera:" + mCameraDevicesArray[i].cameraId);
        }
        console.info("CameraUnitTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let previewProfilesArray = cameraOutputCap.previewProfiles;
            if (isEmpty(previewProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 previewProfilesArray == null || undefined")
                expect().assertFail();
            } 

            for (let i = 0; i < previewProfilesArray.length; i++) {
                let previewProfilesFormat = previewProfilesArray[i].format;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 previewProfilesFormat: " + previewProfilesFormat);
                let previewProfilesSize = previewProfilesArray[i].size;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 width: " + previewProfilesSize.width);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 height: " + previewProfilesSize.height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let photoProfilesArray = cameraOutputCap.photoProfiles;
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 photoProfilesArray == null || undefined")
                expect().assertFail();
            } 

            for (let i = 0; i < photoProfilesArray.length; i++) {
                let photoProfilesFormat = photoProfilesArray[i].format;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 photoProfilesFormat: " + photoProfilesFormat);
                let photoProfilesSize = photoProfilesArray[i].size;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 width: " + photoProfilesSize.width);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 height: " + photoProfilesSize.height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let videoProfilesArray = cameraOutputCap.videoProfiles;
            if (isEmpty(videoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 videoProfilesArray == null || undefined")
                expect().assertFail();
            } 

            for (let i = 0; i < videoProfilesArray.length; i++) {
                let videoProfilesFormat = videoProfilesArray[i].format;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 videoProfilesFormat: " + videoProfilesFormat);
                let videoProfilesSize = videoProfilesArray[i].size;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 width: " + videoProfilesSize.width);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 height: " + videoProfilesSize.height);
                let videoProfilesFrameRateRange = videoProfilesArray[i].frameRateRange;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 min: " + videoProfilesFrameRateRange.min);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 max: " + videoProfilesFrameRateRange.max);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-0 cameraId async api
      * @tc.desc      : Create camerainput from camera-0 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                mCameraManager.createCameraInput(camerasArray[i], async (err, data) => {
                    if (!err) {
                        if (isEmpty(data)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 data == null || undefined")
                            expect().assertFail();
                        } 
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 PASSED with CameraID :" + mCameraDevicesArray[0].cameraId);
                    } else {
                        expect().assertFail();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 FAILED: " + err.message);
                    }
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 camera: " + camerasArray[i].cameraId);
                })
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let cameraInputPromise = await mCameraManager.createCameraInput(camerasArray[i]);
                if (isEmpty(cameraInputPromise)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 cameraInputPromise == null || undefined")
                    expect().assertFail();
                } 
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera: " + camerasArray[i].cameraId);
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here");
        await sleep(1000);
        done();
    })


    /*CREATE CAMERAOUTPUT*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100 camera:" + camerasArray[i].cameraId);
            expect(isEmpty(cameraOutputCap)).assertFalse();

            let previewProfilesArray = cameraOutputCap.previewProfiles;
            if (isEmpty(previewProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100 previewProfilesArray == null || undefined")
                expect().assertFail();
            }
            for (let j = 0; j < previewProfilesArray.length; j++) {
                mCameraManager.createPreviewOutput(previewProfilesArray[j], surfaceId, async (err, data) => {
                    if (isEmpty(data)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100 data == null || undefined")
                        expect().assertFail();
                    } 
                })
                await sleep(10);
                done();
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_CALLBACK_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let previewProfilesArray = cameraOutputCap.previewProfiles;
            if (isEmpty(previewProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 previewProfilesArray == null || undefined")
                expect().assertFail();
            }
            for (let j = 0; j < previewProfilesArray.length; j++) {
                let previewOutputPromise = await mCameraManager.createPreviewOutput(previewProfilesArray[j], surfaceId);
                if (isEmpty(previewOutputPromise)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 previewOutputPromise == null || undefined")
                    expect().assertFail();
                } 
                await sleep(10);
                done();
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let photoProfilesArray = cameraOutputCap.photoProfiles;
            if (isEmpty(photoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100 photoProfilesArray == null || undefined")
                expect().assertFail();
            }
            for (let j = 0; j < photoProfilesArray.length; j++) {
                mCameraManager.createPhotoOutput(photoProfilesArray[j], mPhotoSurfaceId, async (err, data) => {
                    if (isEmpty(data)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100 data == null || undefined")
                        expect().assertFail();
                    } 
                })
                await sleep(10);
                done();
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_CALLBACK_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            } 

            let photoProfilesArray = cameraOutputCap.photoProfiles;
            if (isEmpty(photoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 photoProfilesArray == null || undefined")
                expect().assertFail();
            } 
            for (let j = 0; j < photoProfilesArray.length; j++) {
                let photoOutputPromise = await mCameraManager.createPhotoOutput(photoProfilesArray[j], mPhotoSurfaceId);
                if (isEmpty(photoOutputPromise)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 photoOutputPromise == null || undefined")
                    expect().assertFail();
                } 
                await sleep(10);
                done();
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            }

            let videoProfilesArray = cameraOutputCap.videoProfiles;
            if (isEmpty(videoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 videoProfilesArray == null || undefined")
                expect().assertFail();
            }
            for (let j = 0; j < videoProfilesArray.length; j++) {
                mCameraManager.createVideoOutput(videoProfilesArray[j], mVideoSurface, async (err, data) => {
                    if (isEmpty(data)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 data == null || undefined")
                        expect().assertFail();
                    }
                })
                await sleep(10);
                done();
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = await getSupportedOutputCapabilityInPromise(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (isEmpty(cameraOutputCap)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 cameraOutputCap == null || undefined")
                expect().assertFail();
            }

            let videoProfilesArray = cameraOutputCap.videoProfiles;
            if (isEmpty(videoProfilesArray)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 videoProfilesArray == null || undefined")
                expect().assertFail();
            }
            for (let j = 0; j < videoProfilesArray.length; j++) {
                let videoOutputPromise = await mCameraManager.createVideoOutput(videoProfilesArray[j], mVideoSurface);
                if (isEmpty(videoOutputPromise)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 videoOutputPromise == null || undefined")
                    expect().assertFail();
                }
                await sleep(10);
                done();
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100
      * @tc.name      : Create CaptureSession instance api
      * @tc.desc      : Create CaptureSession instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
     it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100', 2, async function (done) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 to operate");
        let cameraSession;
        mCameraManager.createCaptureSession(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering createCaptureSession success");
                if (isEmpty(data)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 data == null || undefined")
                    expect().assertFail();
                } else {
                    cameraSession = data;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 FAILED : " + err.message);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 ends here");
            }
            await sleep(1000);
            done();
        })
        await sleep(1000);
        await cameraSession.release();
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100
      * @tc.name      : Create CaptureSession instance promise api
      * @tc.desc      : Create Capturesession instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100', 2, async function (done) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 to operate");
        let captureSessionPromise = await mCameraManager.createCaptureSession();
        if (isEmpty(captureSessionPromise)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 captureSessionPromise == null || undefined")
            expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 PASSED");
        await sleep(1000);
        await captureSessionPromise.release();
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100
      * @tc.name      : camera status callback on CameraManager async api
      * @tc.desc      : camera status callback on CameraManager async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100', 2, async function (done) {
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 to operate")
            mCameraManager.on('cameraStatus', async (err, data) => {
                if (!err) {
                    console.info(TAG + "Camera status Callback on cameraManager is success");
                    if (isEmpty(data)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 data == null || undefined")
                        expect().assertFail();
                    }
                    console.info(TAG + "Camera status Callback CameraStatusInfo_Camera: " + data.camera);
                    console.info(TAG + "Camera status Callback CameraStatusInfo_Status: " + data.status);
                } else {
                    expect().assertFail();
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 FAILED: " + err.message);
                }
                await sleep(1000);
                done();
            })
        }
        await sleep(1000);
        done();
    })
})
}