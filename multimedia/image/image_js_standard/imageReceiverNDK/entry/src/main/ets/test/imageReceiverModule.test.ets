// @ts-nocheck
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import cameraObj from 'libImageReceiverNativeTest.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'

const TAG = "ImageReceiverModuleTest: ";

// multi-device
let camera: cameraObj.cameraInfo;

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getCameraManagerInstance() {
  let previewSurfaceId = globalThis.surfaceId;
  console.info(TAG, 'previewSurfaceId = ' + JSON.stringify(previewSurfaceId));
  let ret = cameraObj.initCamera(previewSurfaceId);
  if (ret) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function getCameraSupportDevicesArray() {
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraSupportDevicesArray');
  return true;
}

async function createInput() {
  console.info(TAG + 'Enter createInput');
  let ret = cameraObj.createCameraInput();
  if (ret) {
    console.info(TAG + "createCameraInput FAILED");
    return false;
  }
  await cameraObj.cameraInputOpen();
  console.info(TAG + 'Exit createInput');
  return true;
}

function beginCameraSessionConfig() {
  console.info(TAG + 'Enter beginCameraSessionConfig');
  cameraObj.sessionBegin();
  console.info(TAG + 'Exit beginCameraSessionConfig');
  return true;
}

function createCameraSessionInstance() {
  console.info(TAG + 'Enter createCameraSessionInstance');
  let ret = cameraObj.createSession();
  if (ret) {
    console.info(TAG + "createCaptureSession FAILED");
    return false;
  }
  beginCameraSessionConfig();
  console.info(TAG + 'Exit createCameraSessionInstance');
  return true;
}

function createPhotoOutput() {
  console.info(TAG + 'Enter createPhotoOutput');
  cameraObj.getSupportedOutputCapability();
  let ret = cameraObj.createPhotoOutput(640, 480, 8);

  if (ret) {
    console.info(TAG + "createPhotoOutput FAILED");
    return false;
  }
  console.info(TAG + "createPhotoOutput: " + ret);
  console.info(TAG + 'Exit createPhotoOutput');
  return true;
}

async function commitCameraSessionConfig() {
  console.info(TAG + 'Enter commitCameraSessionConfig');
  await cameraObj.sessionCommitConfig();
  console.info(TAG + 'Exit commitCameraSessionConfig');
  return true;
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export default function ImageReceiverModuleTest() {

    describe('ImageReceiverModuleTest', function () {

        beforeAll(async function () {
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            cameraObj.getSupportedOutputCapability();
            console.info('beforeAll case');
        })

        beforeEach(function () { console.info('beforeEach case'); })

        afterEach(function () { console.info('afterEach case'); })

        afterAll(function () { console.info('afterAll case'); })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_FUNCTION_SINGLE_PHOTO_001
         * @tc.name      : ImageInput api
         * @tc.desc      : ImageInput api
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_NDK_FUNCTION_SINGLE_PHOTO_001', 0, async function (done) {
            console.info(TAG + "--------------SUB_MULTIMEDIA_IMAGE_NDK_FUNCTION_SINGLE_PHOTO--------------");
            await createInput();
            createCameraSessionInstance();
            cameraObj.sessionAddInput();
            let ret = createPhotoOutput();
            expect(ret == true).assertTrue();
            cameraObj.sessionAddPhotoOutput();
            await commitCameraSessionConfig();
            try {
                await cameraObj.photoOutputCapture();
            }
            catch (err) {
                console.info(TAG + "SUB_MULTIMEDIA_IMAGE_NDK_FUNCTION_SINGLE_PHOTO FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                expect().assertFail();
            }
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_IMAGE_NDK_FUNCTION_SINGLE_PHOTO ends here");
            cameraObj.getCameraCallbackCode();
            done();
        });
    })
}