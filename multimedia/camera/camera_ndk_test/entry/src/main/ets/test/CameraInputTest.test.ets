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
import featureAbility from '@ohos.ability.featureAbility';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';
import cameraObj from 'libentry.so';

const TAG = "CameraInputTest: ";

// Define global variables
let ret;

export default function CameraInputTest() {
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
    async function driveFn() {
        console.info(`come in driveFn`);
        let driver = await UiDriver.create();
        console.info(`driver is ${JSON.stringify(driver)}`);
        await sleep(2000);
        console.info(`UiDriver start`);
        let button = await driver.findComponent(BY.text('允许'));
        while(button){
            console.info(`button is ${JSON.stringify(button)}`);
            await button.click();
            await sleep(1000);
            button = await driver.findComponent(BY.text('允许'));
        }
    }

    async function getCameraManagerInstance() {
        let ret = cameraObj.initCamera(globalThis.surfaceId);
        if (ret) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        console.info(TAG + 'Exit getCameraManagerInstance');
        return true;
    }

    function getCameraSupportDevicesArray() {
        console.info('Enter getCameraSupportDevicesArray');
        let ret = cameraObj.getSupportedCameras();
        console.info('Exit getCameraSupportDevicesArray');
        return true;
    }

    function beginCameraSessionConfig() {
        console.info('Enter beginCameraSessionConfig');
        console.info(TAG + "Entering beginConfig start");
        cameraObj.sessionBegin();
        console.info(TAG + "Entering beginConfig end");
        console.info('Exit beginCameraSessionConfig');
        return true;
    }

    async function commitCameraSessionConfig() {
        console.info('Enter commitCameraSessionConfig');
        cameraObj.sessionCommitConfig();
        await sleep(500);

        console.info('Exit commitCameraSessionConfig');
        return true;
    }

    function createCameraSessionInstance() {
        console.info(TAG + 'Enter createCameraSessionInstance');
        try {
            ret = cameraObj.createSession();
        }
        catch {
            console.info(TAG + 'createCaptureSession FAILED');
        }
        if (ret) {
            console.info(TAG + "createCaptureSession FAILED");
            return false;
        }
        beginCameraSessionConfig();
        console.info(TAG + 'Exit createCameraSessionInstance');
        return true;
    }

    async function releaseCameraSessionInstance() {
        await cameraObj.sessionRelease();
    }

    async function createInput() {
        console.info(TAG + 'Enter createInput');
        ret = cameraObj.createCameraInput();
        if (ret) {
            console.info(TAG + "createCameraInput FAILED");
            return false;
        }
        await cameraObj.cameraInputOpen();
        sleep(100);
        console.info(TAG + 'Exit createInput');
        return true;
    }

    async function releaseInput() {
        console.info('Enter releaseInput');
        cameraObj.cameraInputClose();
        console.info('Exit releaseInput');
        return true;
    }

    function createOutput() {
        console.info('Enter createOutput');

        let cameraOutputCap = cameraObj.getSupportedOutputCapability();

        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');
        cameraObj.previewOutputRelease();
        console.info('Exit releaseOutput');

        return true;
    }

    function createPreviewOutput() {
        console.info(TAG + 'Enter createPreviewOutput');
        ret = cameraObj.createPreviewOutput();

        if (ret) {
            console.info(TAG + "createPreviewOutput FAILED");
        }
        console.info(TAG + "createPreviewOutput: " + ret);

        console.info(TAG + 'Exit createPreviewOutputs');
        return true;
    }

    async function startCameraSession() {
        console.info(TAG + "Enter startCameraSession");

        await createInput();
        cameraObj.sessionAddInput();

        await sleep(1);

        createPreviewOutput();
        cameraObj.sessionAddPreviewOutput();

        await sleep(1);

        await commitCameraSessionConfig();
        cameraObj.sessionStart();

        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");

        cameraObj.sessionRemoveInput();

        cameraObj.sessionRemovePreviewOutput();

        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('CameraInputTest', function () {
        console.info(TAG + '----------CameraInputTest--------------');
        beforeAll(async function () {
            await getPermission();
            await sleep(5000);
            let driver = UiDriver.create();
            let button = await driver.findComponent(BY.text("允许"));
            while (button) {
                await button.click();
                button = await driver.findComponent(BY.text("允许"));
            }
            await sleep(1000);
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            createOutput();
            createCameraSessionInstance();
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
            releaseCameraSessionInstance();
            console.info('afterAll case');
        });

        /**
             * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100
             * @tc.name      : camera status callback on CameraInput async api for error
             * @tc.desc      : camera status callback on CameraInput async api for error
             * @tc.size      : MEDIUM
             * @tc.type      : Function
             * @tc.level     : Level 0
            */
        it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100--------------");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 start for camera");
            await startCameraSession();

            await createInput();
            await cameraObj.cameraInputOpen();

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 end for camera");
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100
         * @tc.name      : open/close Camera with cameraInput callback api
         * @tc.desc      : open/close Camera with cameraInput callback api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100--------------");
            await startCameraSession();
            cameraObj.sessionBegin();
            console.info("CameraCallbackCode = " + cameraObj.getCameraCallbackCode());
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100
         * @tc.name      : open/close Camera with cameraInput promise api
         * @tc.desc      : open/close Camera with cameraInput promise api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100', 0, async function (done) {
            let functionTag = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100";
            console.info(functionTag);

            await startCameraSession();
            await releaseInput();

            console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 ends here");
            done();
        });

    })
}