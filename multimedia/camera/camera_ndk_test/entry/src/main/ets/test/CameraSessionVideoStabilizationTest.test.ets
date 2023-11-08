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

import cameraObj, { sessionStart } from 'libentry.so';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import deviceInfo from '@ohos.deviceInfo';
import featureAbility from '@ohos.ability.featureAbility';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

const TAG = "cameraSessionVideoStabilizationTest: ";

// Define global letiables
let mCameraManager;
let mSupportCamera;
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

let mIsVideoStabilizationModeSupportedArray;

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
    url: 'file:///data/media/CameraSessionVideoStabilization.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let Camera_VideoStabilizationMode = {
    STABILIZATION_MODE_OFF : 0,
    STABILIZATION_MODE_LOW : 1,
    STABILIZATION_MODE_MIDDLE : 2,
    STABILIZATION_MODE_HIGH : 3,
    STABILIZATION_MODE_AUTO : 4
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
let receiver;

export default function cameraSessionVideoStabilizationTest() {

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
        console.info(TAG + 'yyx globalThis.surfaceId : ' + globalThis.surfaceId);
        let ret = cameraObj.initCamera(globalThis.surfaceId);
        if (ret != 0) {
            console.info(TAG + "getCameraManager FAILED");
            expect().assertFail();
        }
        console.info(TAG + 'Exit getCameraManagerInstance');
        return true;
    }

    function getCameraSupportDevicesArray() {
        console.info('Enter getCameraSupportDevicesArray');

        let camera = cameraObj.getSupportedCameras();
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
        console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
        if (isEmpty(camera)) {
            console.info(TAG + "getSupportedCameras FAILED");
            expect().assertFail();
        }

        mIsVideoStabilizationModeSupportedArray = new Array();
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
            expect().assertFail();
        }
        let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
        if (addPreviewOutput != 0) {
            console.info(TAG + "addPreviewOutput FAILED");
            expect().assertFail();
        }
        let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
        if (addPhotoOutput != 0) {
            console.info(TAG + "addPhotoOutput FAILED");
            expect().assertFail();
        }
        await sleep(1);
        let commitConfig = cameraObj.sessionCommitConfig();
        if (commitConfig != 0) {
            console.info(TAG + "CommitConfig FAILED");
            expect().assertFail();
        }

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

    describe('cameraSessionVideoStabilizationTest', function () {
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
        console.info(TAG + '----------cameraSessionVideoStabilizationTest--------------')

        beforeAll(async function () {
            sleep(100);
            await getPermission();
            await sleep(5000);
            await sleep(5000);
            let driver = UiDriver.create();
            let button = await driver.findComponent(BY.text("允许"));
            while (button) {
                await button.click();
                button = await driver.findComponent(BY.text("允许"));
            }

            await getPhotoReceiverSurface();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            createCameraSessionInstance();
            await startCameraSession();
            await cameraObj.sessionStart();

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
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001
        * @tc.name      : Check capture session support video stabilization off mode with promise or not
        * @tc.desc      : Check capture session support video stabilization off mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001--------------");

            let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 finish");
            if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002
        * @tc.name      : Check capture session set video stabilization off mode with promise
        * @tc.desc      : Check capture session set video stabilization off mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002--------------");

            cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF);  //STABILIZATION_MODE_OFF
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 PASSED with VideoStabilizationMode is: " + 0);

            let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 finish");
            if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003
        * @tc.name      : Check capture session support video stabilization low mode with promise or not
        * @tc.desc      : Check capture session support video stabilization low mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003--------------");

            let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW);  //STABILIZATION_MODE_LOW
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 finish");
            if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004
        * @tc.name      : Check capture session set video stabilization low mode with promise
        * @tc.desc      : Check capture session set video stabilization low mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004--------------");

            cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 PASSED with VideoStabilizationMode is: " + 1);

            let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 finish");
            if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005
        * @tc.name      : Check capture session support video stabilization middle mode with promise or not
        * @tc.desc      : Check capture session support video stabilization middle mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005--------------");

            let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 finish");
            if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006
        * @tc.name      : Check capture session set video stabilization middle mode with promise
        * @tc.desc      : Check capture session set video stabilization middle mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006--------------");

            if (mIsVideoStabilizationModeSupportedArray[0] == true) {
                cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 finish");
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 PASSED with VideoStabilizationMode is: " + 2);

                let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 finish");
                if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 PASSED");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007
        * @tc.name      : Check capture session support video stabilization high mode with promise or not
        * @tc.desc      : Check capture session support video stabilization high mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007--------------");

            let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 finish");
            if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008
        * @tc.name      : Check capture session set video stabilization high mode with promise
        * @tc.desc      : Check capture session set video stabilization high mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008--------------");

            if (mIsVideoStabilizationModeSupportedArray[0] == true) {
                cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 finish");
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 PASSED with VideoStabilizationMode is: " + 3);

                let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 finish");
                if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 PASSED");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009
        * @tc.name      : Check capture session support video stabilization auto mode with promise or not
        * @tc.desc      : Check capture session support video stabilization auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009--------------");

            let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 finish");
            if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 ends here");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010
        * @tc.name      : Check capture session set video stabilization auto mode with promise
        * @tc.desc      : Check capture session set video stabilization auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010--------------");

            if (mIsVideoStabilizationModeSupportedArray[0] == true) {
                cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO);
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 finish");
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 PASSED with VideoStabilizationMode is: " + 4);

                let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 finish");
                if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 PASSED");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 ends here");
            done();
        })
    })
}