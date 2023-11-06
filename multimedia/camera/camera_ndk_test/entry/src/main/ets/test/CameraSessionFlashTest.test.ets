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

import cameraObj from 'libentry.so';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import deviceInfo from '@ohos.deviceInfo';
import featureAbility from '@ohos.ability.featureAbility';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

const TAG = "CameraSessionFlashTest: ";

// Define global letiables
let mSupportCamera;
let mCameraSession;

let mPhotoSurface;
let mVideoRecorder;
let mVideoSurface;
let mFileAsset;
let mFdPath;
let mFdNumber;

// CAMERA-0 letiables

let mHasFlashArray;
let mIsFlashModeSupportedArray;

let mVideoProfileCfg = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: 'audio/mp4a-latm',
    audioSampleRate: 48000,
    durationTime: 1000,
    fileFormat: 'mp4',
    videoBitrate: 2000000,
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

let Camera_FlashMode = {
    FLASH_MODE_CLOSE : 0,
    FLASH_MODE_OPEN : 1,
    FLASH_MODE_AUTO : 2,
    FLASH_MODE_ALWAYS_OPEN: 3
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
let receiver;

export default function cameraSessionFlashTest() {

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
        receiver = image.createImageReceiver(640, 480, 4, 8)
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

    async function releaseVideoReceiveSurface() {
        console.log(TAG + 'Entering releaseVideoReceiveSurface')
        mVideoRecorder.release((err) => {
            console.info(TAG + 'Entering release video receiver')
        })
        await closeFd();

        await sleep(100);
        console.log(TAG + 'Exit releaseVideoReceiveSurface')
    }

    function getCameraManagerInstance() {
        console.info(TAG + 'Enter getCameraManagerInstance');
        console.info(TAG + 'globalThis.surfaceId : ' + globalThis.surfaceId);
        let ret = cameraObj.initCamera(globalThis.surfaceId);
        if (ret != 0) {
            console.info(TAG + "getCameraManager FAILED");
            expect().assertFail();
        }
        console.info(TAG + 'Exit getCameraManagerInstance');
        return true;
    }

    function getCameraSupportDevicesArray() {
        console.info(TAG + 'Enter getCameraSupportDevicesArray');
        let camera = cameraObj.getSupportedCameras();
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
        if (isEmpty(camera)) {
            console.info(TAG + "getSupportedCameras FAILED");
            expect().assertFail();
        }
        mHasFlashArray = new Array();
        mIsFlashModeSupportedArray = new Array();
        console.info(TAG + 'yyx 444');
        console.info('Exit getCameraSupportDevicesArray');

        return true;
    }

    function createCameraSessionInstance() {
        console.info('Enter createCameraSessionInstance');
        try {
            cameraObj.createSession();
        }
        catch {

            console.info('createCaptureSession FAILED');
            expect().assertFail();
        }
        let ret = cameraObj.sessionBegin();
        if (ret != 0) {
            console.info(TAG + "sessionBegin FAILED");
            expect().assertFail();
        }

        console.info('Exit createCameraSessionInstance');
        return true;
    }

    async function releaseCameraSessionInstance() {
        await cameraObj.sessionRelease();
    }

    async function createInput() {
        console.info('Enter createInput');
        let ret = cameraObj.createCameraInput();

        if (ret != 0) {
            console.info(TAG + "createCameraInput FAILED");
            expect().assertFail();
            return false;
        }

        await cameraObj.cameraInputOpen();
        await sleep(100);
        console.info('Exit createInput');
        return true;
    }

    async function releaseInput() {
        console.info('Enter releaseInput');
        await cameraObj.cameraInputClose();

        console.info('Exit releaseInput');
        return true;
    }

    function createOutput() {
        console.info(TAG + 'Enter createOutput');

        let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
        console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
        console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
        console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
        console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
        let mPreviewOutput = cameraObj.createPreviewOutput();
        if (mPreviewOutput != 0) {
            console.info(TAG + "createPreviewOutput FAILED");
            expect().assertFail();
        }
        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
        let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
        if (mPhotoOutput != 0) {
            console.info(TAG + "mPhotoOutput FAILED");
            expect().assertFail();
        }
        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
        console.info('Exit createOutputs');
        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');

        await cameraObj.previewOutputRelease();
        await cameraObj.photoOutputRelease();
        console.info('Exit releaseOutput');
        return true;
    }

    async function startCameraSession() {
        console.info(TAG + "Enter startCameraSession");

        await createInput();
        createOutput();

        await sleep(1);
        let ret = cameraObj.sessionBegin();
        if (ret != 0) {
            console.info(TAG + "sessionBegin had been execute, please check your operation");
        }
        let addInput =cameraObj.sessionAddInput();
        if (addInput != 0) {
            console.info(TAG + "addInput FAILED");
        }
        let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
        if (addPreviewOutput != 0) {
            console.info(TAG + "addPreviewOutput FAILED");
        }
        let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
        if (addPhotoOutput != 0) {
            console.info(TAG + "addPhotoOutput FAILED");
        }
        await sleep(30);

        let commitConfig = cameraObj.sessionCommitConfig();
        if (commitConfig != 0) {
            console.info(TAG + "CommitConfig FAILED");
        }
        await sleep(50);

        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");
        let ret = cameraObj.sessionStop();
        if (ret != 0) {
            console.info(TAG + "sessionStop FAILED");
            expect().assertFail();
        }
        cameraObj.sessionRemovePreviewOutput();
        cameraObj.sessionRemovePhotoOutput();

        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

        describe('cameraSessionFlashTest', function () {
        async function getPermission() {
            console.info(TAG + 'getPermission');
            let permissions = [
                'ohos.permission.CAMERA',
                'ohos.permission.MICROPHONE',
                'ohos.permission.CAPTURE_SCREEN',
                'ohos.permission.READ_MEDIA',
                'ohos.permission.WRITE_MEDIA',
                'ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
                'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
                'ohos.permission.MEDIA_LOCATION',
                'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
                'ohos.permission.START_INVISIBLE_ABILITY',
                'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
            ];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info(TAG + "request success" + JSON.stringify(data.code));
            })
        }
        console.info(TAG + '----------cameraSessionFlashTest--------------')

        beforeAll(async function () {
            sleep(100);
            await getPermission();
            await sleep(5000);
            let driver = UiDriver.create();
            let button = await driver.findComponent(BY.text("允许"));
            while (button) {
                await button.click();
                button = await driver.findComponent(BY.text("允许"));
            }
            await sleep(1000);
            await getPhotoReceiverSurface();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            createCameraSessionInstance();
            await startCameraSession();
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
            stopCameraSession();
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001
        * @tc.name      : Check capture session has flash with promise or not
        * @tc.desc      : Check capture session has flash with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001--------------");

            let hasFlashPromise = cameraObj.sessionHasFlash();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001 finish");
            if (hasFlashPromise != null || hasFlashPromise != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001 PASSED with sessionHasFlash is: " + hasFlashPromise);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001 FAILED with sessionHasFlash is: " + hasFlashPromise);
                expect().assertFail();
            }
            await sleep(100);

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_001 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002
        * @tc.name      : Check capture session support flash close mode with promise or not
        * @tc.desc      : Check capture session support flash close mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002--------------");

            let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_CLOSE);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 finish");
            if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 PASSED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 FAILED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
                expect().assertFail();
            }

            await sleep(100);

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003
        * @tc.name      : Check capture session set flash close mode with promise
        * @tc.desc      : Check capture session set flash close mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003--------------");

            cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_CLOSE);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003 PASSED with FlashMode is: " + 0);

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003 finish");

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_003 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004
        * @tc.name      : Check capture session support flash open mode with promise or not
        * @tc.desc      : Check capture session support flash open mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004--------------");

            let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 finish");
            if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 PASSED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 FAILED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005
        * @tc.name      : Check capture session set flash open mode with promise
        * @tc.desc      : Check capture session set flash open mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005--------------");

            cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005 PASSED with FlashMode is: " + 1);

            let flashMode = cameraObj.sessionGetFlashMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005 finish");
            if (flashMode == Camera_FlashMode.FLASH_MODE_OPEN) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005 PASSED with FlaseMode is: " + flashMode);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005 FAILED with FlaseMode is: " + flashMode);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_005 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006
        * @tc.name      : Check capture session support flash auto mode with promise or not
        * @tc.desc      : Check capture session support flash auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006--------------");

            if (mHasFlashArray[0] == true) {
                let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_AUTO);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 finish");
                if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 PASSED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 FAILED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 not support");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007
        * @tc.name      : Check capture session set flash auto mode with promise
        * @tc.desc      : Check capture session set flash auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007--------------");

            if ((mHasFlashArray[0] == true) && (mIsFlashModeSupportedArray[0] == true)) {
                cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_AUTO);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 finish");
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 PASSED with FlashMode is: " + 2);
                let flashMode = cameraObj.sessionGetFlashMode();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 finish");
                if (flashMode == Camera_FlashMode.FLASH_MODE_AUTO) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 PASSED with FlaseMode is: " + flashMode);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 FAILED with FlaseMode is: " + flashMode);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 not support");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_007 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008
        * @tc.name      : Check capture session support flash always open mode with promise or not
        * @tc.desc      : Check capture session support flash always open mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008--------------");

            if (mHasFlashArray[0] == true) {
                let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 finish");
                if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 PASSED with sessionHasFlash is: " + sessionIsFlashModeSupported);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 FAILED with sessionHasFlash is: " + sessionIsFlashModeSupported);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 not support");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009
        * @tc.name      : Check capture session set flash always open mode with promise
        * @tc.desc      : Check capture session set flash always open mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009', 2, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009--------------");

            cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009 PASSED with FlashMode is: " + 3);
            let flashMode = cameraObj.sessionGetFlashMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009 finish");
            if (flashMode == Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009 PASSED with FlaseMode is: " + flashMode);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009 FAILED with FlaseMode is: " + flashMode);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_009 ends here");
            done();
        })
    })
}