/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cameraObj from 'libentry.so'
import image from '@ohos.multimedia.image';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_ERROR_7400101 = 7400101; //参数错误
const CAMERA_INVALID_ARGUMENT = 7400101; // 参数错误
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

async function getPhotoReceiverSurface() {
  console.log(TAG + 'createImageReceiver start.');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.log(TAG + 'createImageReceiver successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + 'createImageReceiver failed');
  }
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function createCameraInput() {
  console.log(TAG + "createCameraInput start.");
  let ret = cameraObj.createCameraInput();
  if (ret != 0) {
    console.log(TAG + "createCameraInput FAILED");
    expect().assertFail();
  }
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.camerandk', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
};

function createCaptureSession() {
  console.log(TAG + "createCaptureSession start.");
  let ret = cameraObj.createSession();
  if (ret != 0) {
    console.log(TAG + "createCaptureSession FAILED");
    expect().assertFail();
  }
}

function getSupportedSceneModes() {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(0);
  if (supportedSceneModes.errorCode != 0) {
    console.info(TAG + "getSupportedSceneModes FAILED");
    expect().assertFail();
  }
  return supportedSceneModes.sceneModesSize;
}

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
}

function setSceneMode(index_sceneMode: number) {
  let ret = cameraObj.oHCameraManagerSetSceneMode(index_sceneMode);
  if (ret != 0) {
    console.info(TAG + "setSceneMode FAILED");
    expect().assertFail();
  }
  if (index_sceneMode == 0) {
    console.info(TAG + "set sceneMode: NORMAL_PHOTO");
  } else if (index_sceneMode == 1) {
    console.info(TAG + "set sceneMode: NORMAL_VIDEO");
  } else if (index_sceneMode == 2) {
    console.info(TAG + "set sceneMode: SECURE_PHOTO");
  }
}

function setSessionMode() {
  let ret = cameraObj.oHCaptureSessionSetSessionMode(0);
  if (ret != 0) {
    console.info(TAG + "setSessionMode FAILED");
    expect().assertFail();
  }
}

function createPreviewOutput() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.info(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
}

function sessionBeginConfig() {
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}

function canAddInput() {
  let ret = cameraObj.oHCaptureSessionCanAddInput(0);
  if (ret.errorCode != 0) {
    console.log(TAG + "canAddInput FAILED" + ret);
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
}

function addInput() {
  let ret = cameraObj.sessionAddInput();
  if (ret != 0) {
    console.log(TAG + "addInput FAILED" + ret);
    expect().assertFail();
  }
}

function addPreviewOutput() {
  let ret = cameraObj.sessionAddPreviewOutput();
  if (ret != 0) {
    console.log(TAG + "addPreviewOutput FAILED" + ret);
    expect().assertFail();
  }
}

function canAddPreviewOutput() {
  let ret = cameraObj.oHCaptureSessionCanAddPreviewOutput(0);
  if (ret.errorCode != 0) {
    console.log(TAG + "canAddPreviewOutput FAILED" + ret);
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + ret.isAddPreviewOutput);
}

export default function SecureCameraTest() {
  describe('SecureCameraTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getSupportedCamerasInstance();
    })
    beforeEach(() => {
      
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraInputOpenSecureCamera0100
     * @tc.name       : testOHCameraInputOpenSecureCamera0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraInputOpenSecureCamera0100', 0, () => {
      createCaptureSession();
      getSupportedCameraOutputCapability();
      let sceneModesSize = getSupportedSceneModes();
      console.log(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+sceneModesSize);
      if (sceneModesSize == 2) {
        console.log(TAG+"SECURE_PHOTO is not supported");
        console.log(TAG+"testOHCaptureSessionAddSecureOutput0100 end");
        expect(true).assertTrue();
      } else if (sceneModesSize == 3) {
        setSceneMode(2);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        let ret = cameraObj.oHCameraInputOpenSecureCamera(0);
        console.log(TAG+"testOHCameraInputOpenSecureCamera0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0100
     * @tc.name       : testOHCaptureSessionAddSecureOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddSecureOutput0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let sceneModesSize = getSupportedSceneModes();
      console.log(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+sceneModesSize);
      if (sceneModesSize == 2) {
        console.log(TAG+"SECURE_PHOTO is not supported");
        console.log(TAG+"testOHCaptureSessionAddSecureOutput0100 end");
        expect(true).assertTrue();
      } else if (sceneModesSize == 3) {
        console.log(TAG+"SECURE_PHOTO is supported");
        setSceneMode(2);
        setSessionMode();
        createPreviewOutput();
        createCameraInput();
        sessionBeginConfig();
        canAddInput();
        addInput();
        canAddPreviewOutput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(0);
        console.log(TAG+"testOHCaptureSessionAddSecureOutput0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
      
    })
  })
}