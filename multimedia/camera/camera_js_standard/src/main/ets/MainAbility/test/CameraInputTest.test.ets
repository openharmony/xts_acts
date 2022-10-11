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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

const TAG = "CameraInputTest: ";

// Define global variables
let mCameraManager;
let surfaceId1;
let mCameraDevicesArray;

export default function CameraInputTest(surfaceId) {
    async function getImageReceiverSurfaceId() {
        console.log(TAG + 'Entering create Image receiver');
        let receiver = image.createImageReceiver(640, 480, 4, 8);
        console.log(TAG + 'before receiver check');
        if (receiver !== undefined) {
            console.log(TAG + 'Receiver is ok');
            surfaceId1 = await receiver.getReceivingSurfaceId();
            console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId1));
        } else {
            console.log(TAG + 'Receiver is not ok');
        }
    }
    const sleep = (delay) => new Promise(resolve => setTimeout(resolve, delay));
    function isEmpty(data) {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }
    async function getCameraInputTestInstance() {
        mCameraManager = await cameraObj.getCameraManager(null);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        return true;
    }
    async function getSupportedCamerasArray() {
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
        } else {
            mCameraDevicesArray = await mCameraManager.getSupportedCameras();
            console.info(TAG + "getSupportedCamerasArray start " + mCameraDevicesArray.length);
            if (mCameraDevicesArray != null && mCameraDevicesArray.length > 0) {
                console.info(TAG + "mCameraDevicesArray is not null");
            }
        }
        console.info(TAG + "getSupportedCamerasArray end");
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

describe('CameraInputTest', function () {
    console.info(TAG + '----------CameraInputTest--------------');
    beforeAll(async function () {
        await applyPermission();
        await getCameraInputTestInstance();
        await getSupportedCamerasArray();
        console.info('beforeAll case');
    });
    beforeEach(function () {
        sleep(1000);
        console.info('beforeEach case');
    });
    afterEach(async function () {
        console.info('afterEach case');
    });
    afterAll(function () {
        console.info('afterAll case');
    });

    /**
          * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CALLBACK_0100
          * @tc.name      : callback Camera with cameraInput on api
          * @tc.desc      : callback Camera with cameraInput on api
          * @tc.size      : MEDIUM
          * @tc.type      : Function
          * @tc.level     : Level 0
        */
     it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CALLBACK_0100', 0, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CALLBACK_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CALLBACK_0100 cameraManager == null || undefined");
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let successFlag = true;
                console.info(TAG + "Entering  createCameraInput with camera: " + camerasArray[i].cameraId);
                await mCameraManager.createCameraInput(camerasArray[i]).then(async (cameraInput) => {
                    await cameraInput.on("error", (cameraInputError) => {
                        console.log(`Camera input error code: ${cameraInputError.code}`);
                    });
                    expect(successFlag).assertEqual(true);
                }).catch((err) => {
                    expect().assertFail();
                    console.info(TAG + "Failed To create cameraInput cameraId: " + camerasArray[i].cameraId + JSON.stringify(err));
                });
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
    });
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_CALLBACK_0100
      * @tc.name      : open/close/release Camera with cameraInput callback api
      * @tc.desc      : open/close/release Camera with cameraInput callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_CALLBACK_0100', 0, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_CALLBACK_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_CALLBACK_0100 cameraManager == null || undefined");
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let successFlag = true;
                console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
                await mCameraManager.createCameraInput(camerasArray[i]).then(async (cameraInput) => {
                    expect(isEmpty(cameraInput)).assertFalse();
                    await cameraInput.open(async (err) => {
                        if (!err) {
                            console.info(TAG + "PASSED open with CameraID :" + camerasArray[i].cameraId);
                        } else {
                            successFlag = false;
                            console.info(TAG + "open FAILED: " + err.message);
                        }
                    });
                    await sleep(400);
                    await cameraInput.close(async (err) => {
                        if (!err) {
                            console.info(TAG + "PASSED close with CameraID :" + camerasArray[i].cameraId);
                        } else {
                            successFlag = false;
                            console.info(TAG + "close FAILED: " + err.message);
                        }
                    });
                    await sleep(100);
                    await cameraInput.release(async (err) => {
                        if (!err) {
                            console.info(TAG + "PASSED release with CameraID :" + camerasArray[i].cameraId);
                        } else {
                            successFlag = false;
                            console.info(TAG + "release FAILED: " + err.message);
                        }
                    });
                    expect(successFlag).assertEqual(true);
                }).catch((err) => {
                    expect().assertFail();
                    console.info(TAG + "Failed To create cameraInput cameraId: " + camerasArray[i].cameraId + +JSON.stringify(err));
                });
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
    });
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_Promise_0100
      * @tc.name      : open/close/release Camera with cameraInput promise api
      * @tc.desc      : open/close/release Camera with cameraInput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_Promise_0100', 0, async function (done) {
        let functionTag = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_Promise_0100";
        console.info(functionTag);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_Promise_0100 cameraManager == null || undefined");
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let successFlag = true;
                console.info(TAG + functionTag + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
                mCameraManager.createCameraInput(camerasArray[i], async (err, cameraInput) => {
                    if (!err) {
                        expect(isEmpty(cameraInput)).assertFalse();
                        console.info(TAG + functionTag + "Entering cameraInput open with camera: " + camerasArray[i].cameraId);
                        await cameraInput.open().then(async () => {
                            console.info(TAG + functionTag + "PASSED open with CameraID :" + camerasArray[i].cameraId);
                        }).catch((err) => {
                            successFlag = false;
                            console.info(TAG + functionTag + "open FAILED: " + err.message);
                        });;
                        await sleep(400);
                        await cameraInput.close().then(async () => {
                            console.info(TAG + functionTag + "PASSED close with CameraID :" + camerasArray[i].cameraId);
                        }).catch((err) => {
                            successFlag = false;
                            console.info(TAG + functionTag + "close FAILED: " + err.message);
                        });
                        await sleep(100);
                        await cameraInput.release().then(async () => {
                            console.info(TAG + functionTag + "PASSED release with CameraID :" + camerasArray[i].cameraId);
                        }).catch((err) => {
                            successFlag = false;
                            console.info(TAG + functionTag + "release FAILED: " + err.message);
                        });
                        expect(successFlag).assertEqual(true);
                    } else {
                        expect().assertFail();
                        console.info(TAG + functionTag + " FAILED: " + err.message);
                    }
                });
            }
            await sleep(400 * camerasArray.length);
        }
        console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_RELEASE_Promise_0100 ends here");
        done();
    });
})
}