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

const TAG = "cameraSessionZoomRatioTest: ";

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
    url: 'file:///data/media/CameraSessionZoomRatio.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
let receiver;

export default function cameraSessionZoomRatioTest() {

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
        console.info('Enter getCameraSupportDevicesArray');

        let cameraInfo = cameraObj.getSupportedCameras();
        if (cameraInfo.cameraId == null) {
            console.info(TAG + "getSupportedCameras FAILED");
            expect().assertFail();
        }

        mZoomRatioRangeArray = new Array(mCameraNum);
        mZoomRatioMaxArray = new Array(mCameraNum);
        mZoomRatioMinArray = new Array(mCameraNum);
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
        await mCameraSession.release();
    }

    async function createInput(idx:any) {
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

    async function createOutput(idx:any) {
        console.info(TAG + 'Enter createOutput');

        cameraObj.getSupportedOutputCapability();
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

    async function startCameraSession(idx:any) {
        console.info(TAG + "Enter startCameraSession");

        await createInput(idx);
        createOutput(idx);

        console.info(TAG + "Start to sessionAddInput");


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

        console.info(TAG + "Entering startCameraSession start session begin");
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

        let RemovePreviewOutput = cameraObj.sessionRemovePreviewOutput();
        if (RemovePreviewOutput != 0) {
            console.info(TAG + "RemovePreviewOutput FAILED");
            expect().assertFail();
        }
        let RemovePhotoOutput = cameraObj.sessionRemovePhotoOutput();
        if (RemovePhotoOutput != 0) {
            console.info(TAG + "RemovePhotoOutput FAILED");
            expect().assertFail();
        }

        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionZoomRatioTest', function () {
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
                console.info(TAG + "1031xmj request success" + JSON.stringify(data.code));
            })
        }
        console.info(TAG + '----------cameraSessionZoomRatioTest--------------')

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
            await startCameraSession(0);
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
            stopCameraSession();
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
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

            try {
                let zoomRatioRange = cameraObj.sessionGetZoomRatioRange();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 finish");
                if (!isEmpty(zoomRatioRange)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 PASSED with ZoomRatioRange length is: " + (zoomRatioRange.maxZoom - zoomRatioRange.minZoom));
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 FAILED with ZoomRatioRange length is: " + (zoomRatioRange.maxZoom - zoomRatioRange.minZoom));
                    expect().assertFail();
                }
            }
            catch {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 PASSED");
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 ends here");
            done();
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

            cameraObj.sessionSetZoomRatio((mZoomRatioMaxArray[0] + 1));
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: 10.0 ");

            let zoomRatio = cameraObj.sessionGetZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
            if (zoomRatio != (mZoomRatioMaxArray[0] + 1)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: " + zoomRatio);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 FAILED with ZoomRatio is: " + zoomRatio);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 ends here");
            done();
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

            cameraObj.sessionSetZoomRatio((mZoomRatioMaxArray[0] + 1));
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] + 1));

            let zoomRatio = cameraObj.sessionGetZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 finish");
            if (zoomRatio != (mZoomRatioMaxArray[0] + 1)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 PASSED with ZoomRatio is: " + zoomRatio);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 FAILED with ZoomRatio is: " + zoomRatio);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0101 ends here");
            done();
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

            cameraObj.sessionSetZoomRatio((mZoomRatioMaxArray[0] + 0.1));
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] + 0.1));

            let zoomRatio = cameraObj.sessionGetZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 finish");
            if (zoomRatio != (mZoomRatioMaxArray[0] + 0.1)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 PASSED with ZoomRatio is: " + zoomRatio);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 FAILED with ZoomRatio is: " + zoomRatio);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0102 ends here");
            done();
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

            cameraObj.sessionSetZoomRatio((mZoomRatioMinArray[0] - 1));
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] - 1));

            let zoomRatio = cameraObj.sessionGetZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 finish");
            if (zoomRatio != (mZoomRatioMinArray[0] - 1)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 PASSED with ZoomRatio is: " + zoomRatio);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 FAILED with ZoomRatio is: " + zoomRatio);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0103 ends here");
            done();
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

            cameraObj.sessionSetZoomRatio((mZoomRatioMinArray[0] - 0.1));
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 finish");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 PASSED with ZoomRatio is: " + (mZoomRatioMaxArray[0] - 0.1));

            let zoomRatio = cameraObj.sessionGetZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 finish");
            if (zoomRatio != (mZoomRatioMinArray[0] - 0.1)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 PASSED with ZoomRatio is: " + zoomRatio);
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 FAILED with ZoomRatio is: " + zoomRatio);
                expect().assertFail();
            }

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0104 ends here");
            done();
        })
    })
}