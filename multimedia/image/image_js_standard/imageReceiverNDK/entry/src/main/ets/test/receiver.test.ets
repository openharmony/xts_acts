// @ts-nocheck
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import {UiDriver, BY} from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
// @ts-ignore
import ndkTest from 'libImageReceiverTest.so'
const TAG = "ImageReceiverTest: ";

// Define global variables
let captureLocation = {
    latitude: 0,
    longitude: 0,
    altitude: 0,
}

let captureSetting = {
    quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
    rotation: cameraObj.ImageRotation.ROTATION_0,
    location: captureLocation,
    mirror: false
}

let mCameraManager;
let cameraOutputCap;
let mCameraDevicesArray;
let mCameraSession;
let mCameraNum;
let mCameraInput;
let mPreviewOutput;
let mPhotoSurface;
let mPhotoOutput;
let mTestImage;
let context = featureAbility.getContext();
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function ImageReceiverTest() {
    async function getPermission() {
        let permissions = ['ohos.permission.CAMERA'];
        featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
            console.info("request success" + JSON.stringify(data));
        })
    }

    async function driveFn() {
        console.info(`come in driveFn`);
        let driver = await UiDriver.create();
        console.info(`driver is ${JSON.stringify(driver)}`);
        await sleep(2000);
        console.info(`UiDriver start`);
        let button = await driver.findComponent(BY.text('允许'));
        if(button == null) {
            let cmd = "hidumper -s WindowManagerService -a'-a'"
            await delegator.executeShellCommand(cmd);
        }
        while (button) {
            console.info(`button is ${JSON.stringify(button)}`);
            await button.click();
            await sleep(1000);
            button = await driver.findComponent(BY.text('允许'));
        }
    }

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    describe('ImageReceiverTest', function () {
        const WIDTH = 1280;
        const HEIGHT = 960;
        const CAPACITY = 8;
        const Jpg_Stride = 1;
        function logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }

        beforeAll(async function () {
            console.info('beforeAll case');
            await getPermission();
            sleep(1000);
            await driveFn();
        })

        beforeEach(function () { console.info('beforeEach case'); })

        afterEach(function () { console.info('afterEach case'); })

        afterAll(function () { console.info('afterAll case'); })

        function createReceiverErr(done, log, ...params) {
            let mlg = logger(log);
            try {
                mlg.log(log);
                let options = ndkTest.JsCreateImageReceiverOptions(params);
                let myReceiverOptions = ndkTest.JsReleaseImageReceiverOptions(options);
                let myReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiverOptions == undefined).assertTrue();
                expect(myReceiver == undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        function isString(value) {
            return typeof value === "string";
        }

        function isEmpty(data) {
            if (data == null || data == undefined) {
                return true;
            }
            return false;
        }

        function getCameraManagerInstance() {
            console.info(TAG + 'Enter getCameraManagerInstance');
            mCameraManager = cameraObj.getCameraManager(context);
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "getCameraManager FAILED");
                return false;
            }
            console.info(TAG + 'Exit getCameraManagerInstance');
            return true;
        }

        function getCameraSupportDevicesArray() {
            console.info(TAG + 'Enter getCameraSupportDevicesArray');
            mCameraDevicesArray = mCameraManager.getSupportedCameras();
            if (isEmpty(mCameraDevicesArray)) {
                console.info(TAG + "getSupportedCameras FAILED");
                return false;
            }
            mCameraNum = mCameraDevicesArray.length;
            console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
            console.info(TAG + 'Exit getCameraSupportDevicesArray');
            return true;
        }

        async function getPhotoReceiverSurface(receiver) {
            console.log(TAG + 'Entering getPhotoReceiverSurface')
            console.log(TAG + 'before receiver check')
            if (receiver !== undefined) {
                mPhotoSurface = ndkTest.JsGetReceivingSurfaceId(receiver);
                console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
            } else {
                console.log(TAG + 'Photo receiver is created failed')
            }
            console.log(TAG + 'Exit getPhotoReceiverSurface')
        }

        function beginCameraSessionConfig() {
            console.info(TAG + 'Enter beginCameraSessionConfig');
            mCameraSession.beginConfig();
            console.info(TAG + 'Exit beginCameraSessionConfig');
            return true;
        }

        function createCameraSessionInstance() {
            console.info(TAG + 'Enter createCameraSessionInstance');
            try {
                mCameraSession = mCameraManager.createCaptureSession();
            }
            catch {
                console.info(TAG + 'createCaptureSession FAILED');
            }
            if (isEmpty(mCameraSession)) {
                console.info(TAG + "createCaptureSession FAILED");
                return false;
            }
            beginCameraSessionConfig();
            console.info(TAG + 'Exit createCameraSessionInstance');
            return true;
        }

        async function createInput(idx: any) {
            console.info(TAG + 'Enter createInput');
            if (isEmpty(mCameraDevicesArray)) {
                console.info(TAG + "Entering createInputs FAILED with NoCamera");
                return false;
            }
            mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
            if (isEmpty(mCameraInput)) {
                console.info(TAG + "createCameraInput FAILED");
                return false;
            }
            await mCameraInput.open();
            sleep(100);
            console.info(idx + 'th CameraInput is: ' + mCameraInput);
            console.info(TAG + 'Exit createInput');
            return true;
        }

        function createOutput(idx: any) {
            console.info(TAG + 'Enter createOutput');
            cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);
            if (!isEmpty(cameraOutputCap)) {
                if (!isEmpty(cameraOutputCap.previewProfiles)) {
                    console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
                    for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                        mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], globalThis.surfaceId);
                        if (!isEmpty(mPreviewOutput)) {
                            break;
                        }
                    }
                    if (isEmpty(mPreviewOutput)) {
                        console.info(TAG + "createPreviewOutput FAILED");
                    }
                    console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
                }
            }
            if (!isEmpty(cameraOutputCap.photoProfiles)) {
                console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

                for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
                    mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
                    if (!isEmpty(mPhotoOutput)) {
                        break;
                    }
                }
                if (isEmpty(mPhotoOutput)) {
                    console.info(TAG + "createPhotoOutput FAILED");
                }
                console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
            }
            console.info(TAG + 'Exit createOutputs');
            return true;
        }

        async function commitCameraSessionConfig() {
            console.info(TAG + 'Enter commitCameraSessionConfig');
            await mCameraSession.commitConfig();
            sleep(500);
            console.info(TAG + 'Exit commitCameraSessionConfig');
            return true;
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0001
         * @tc.name      : JsCreateImageReceiver
         * @tc.desc      : 1.set width,height,capacity
         *               : 2.JsCreateImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0001', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0001");
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            try {
                let options = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver = ndkTest.JsCreateImageReceiver(options);
                ndkTest.JsReleaseImageReceiverOptions(options);

                let onRet = ndkTest.JsOn(myReceiver, (receiver) => {
                    mlg.log("Image receiver callback success " + JSON.stringify(receiver));
                    mTestImage = ndkTest.JsReadNextImage(myReceiver);
                    mlg.log("OnCallback: mTestImage 1 " + JSON.stringify(mTestImage));
                    expect(receiver != undefined).assertTrue();
                });
                expect(onRet != undefined).assertTrue();

                await getPhotoReceiverSurface(myReceiver);
                await createInput(0);
                createCameraSessionInstance();
                mCameraSession.addInput(mCameraInput);
                createOutput(0);
                mCameraSession.addOutput(mPreviewOutput);
                mCameraSession.addOutput(mPhotoOutput);
                await commitCameraSessionConfig();
                await mCameraSession.start();
                mPhotoOutput.capture(captureSetting).then((result) => {
                    console.info('capture success :' + result);
                }).catch((err) => {
                    console.info('capture failed :' + err);
                });
                await sleep(1000);
                mTestImage = ndkTest.JsReadNextImage(myReceiver);
                mlg.log("mTestImage 1 " + JSON.stringify(mTestImage));
                ndkTest.JsReleaseImage(mTestImage);

                let onOFF = ndkTest.JsOff(myReceiver);
                expect(onOFF != undefined).assertTrue();

                mPhotoOutput.capture(captureSetting).then((result) => {
                    console.info('capture success :' + result);
                }).catch((err) => {
                    console.info('capture failed: ' + err);
                });
                await sleep(1000);
                mTestImage = ndkTest.JsReadLatestImage(myReceiver);
                mlg.log("mTestImage 2 " + JSON.stringify(mTestImage));

                await mCameraSession.stop();
                await sleep(1000);
                ndkTest.JsReleaseImageReceiver(myReceiver);
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100
         * @tc.name      : JsCreateImageReceiver
         * @tc.desc      : 1.set width,height,capacity
         *               : 2.JsCreateImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100");
                let options = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                let ret = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret != undefined).assertTrue();
                ret = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret == undefined).assertTrue();
                ret = ndkTest.JsReleaseImageReceiver(myReceiver);
                expect(ret != undefined).assertTrue();
                ret = ndkTest.JsReleaseImageReceiver(myReceiver);
                expect(ret == undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100
         * @tc.name      : JsCreateImageReceiver_1
         * @tc.desc      : 1.set width,height,capacity
         *               : 2.JsCreateImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100", 'a', HEIGHT, CAPACITY);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200
         * @tc.name      : JsCreateImageReceiver_2
         * @tc.desc      : 1.set width,height,capacity
         *               : 2.JsCreateImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200", WIDTH, { a: 1 }, CAPACITY);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300
         * @tc.name      : JsCreateImageReceiver_3
         * @tc.desc      : 1.set width,height,capacity
         *               : 2.JsCreateImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300", WIDTH, HEIGHT, CAPACITY);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400
         * @tc.name      : JsCreateImageReceiver_4
         * @tc.desc      : 1.set width,height,capacity
         *               : 2.JsCreateImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400", WIDTH, HEIGHT, true);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200
         * @tc.name      : JsGetSize
         * @tc.desc      : 1.set width,height,capacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200");
                let options = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver = ndkTest.JsCreateImageReceiver(options);

                let size = ndkTest.JsGetSize(myReceiver);
                let capacity = ndkTest.JsGetCapacity(myReceiver);
                expect(size.width == WIDTH).assertTrue();
                expect(size.height == HEIGHT).assertTrue();
                expect(capacity == CAPACITY).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300
         * @tc.name      : JsGetReceivingSurfaceId
         * @tc.desc      : receiver test
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300");
                let options = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver = ndkTest.JsCreateImageReceiver(options);
                let sId = ndkTest.JsGetReceivingSurfaceId(myReceiver);
                mlg.log("sId " + sId);
                expect(isString(sId)).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600
         * @tc.name      : JsOn
         * @tc.desc      : receiver test
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600");
                let options = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver = ndkTest.JsCreateImageReceiver(options);

                let onRet = ndkTest.JsOn(myReceiver, (receiver) => {
                    mlg.log("Image receiver callback success " + JSON.stringify(receiver));
                    expect(receiver != undefined).assertTrue();
                });
                mlg.log("onRet " + JSON.stringify(onRet));
                await sleep(2000);
                expect(onRet != undefined).assertTrue();
                let onOFF = ndkTest.JsOff(myReceiver);
                expect(onOFF != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900
         * @tc.name      : JsGetImageFormat
         * @tc.desc      : receiver test
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900");
                let types = ndkTest.JsGetImageComponentTypes(mTestImage);
                expect(Array.isArray(types)).assertEqual(true);
                expect(types.length > 0).assertEqual(true);
                mlg.log("JsGetImageComponentTypes types " + JSON.stringify(types));
                let type = types[0];
                let nativeBuffer = ndkTest.JsGetImageByteBuffer(mTestImage, type);
                let bufferSize = ndkTest.JsGetImageBufferSize(mTestImage, type);
                let rowStride = ndkTest.JsGetImageRowStride(mTestImage, type);
                let pixelStride = ndkTest.JsGetImagePixelStride(mTestImage, type);
                expect(bufferSize > 0).assertTrue();
                expect(nativeBuffer != undefined).assertTrue();
                expect(type >= 0).assertTrue();
                expect(rowStride > 0).assertTrue();
                expect(pixelStride == Jpg_Stride).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1600
         * @tc.name      : JsGetImageSize
         * @tc.desc      : receiver test
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1600', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1600");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1600");
                let options = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let size = ndkTest.JsImageReceiverOptionsGetSize(options);
                expect(size.width == WIDTH).assertTrue();
                expect(size.height == HEIGHT).assertTrue();
                ndkTest.JsImageReceiverOptionsSetCapacity(options, CAPACITY);
                let capacity = ndkTest.JsImageReceiverOptionsGetCapacity(options);
                expect(capacity == CAPACITY).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })
    })
}