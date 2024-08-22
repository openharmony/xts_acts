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
import { Camera_PreconfigType, Camera_PreconfigRatio } from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101; // 参数错误
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

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

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function releaseAll() {
  let ret = cameraObj.callDeconstructFunction();
  console.info(TAG + 'releaseAll: ' + ret);
  if (ret != 0) {
    console.info(TAG + "releaseAll FAILED");
    expect().assertFail();
  }
}

function takePicture() {
  let ret = cameraObj.takePicture();
  console.info(TAG + 'takePicture: ' + ret);
  if (ret != 0) {
    console.info(TAG + "takePicture FAILED");
    expect().assertFail();
  }
}

function createCaptureSession() {
  console.log(TAG + "createCaptureSession start.");
  let ret = cameraObj.createSession();
  if (ret != 0) {
    console.log(TAG + "createCaptureSession FAILED");
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
  cameraObj.cameraInputOpen();
}

function getSupportedSceneModes() {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(0);
  if (supportedSceneModes.errorCode != 0) {
    console.info(TAG + "getSupportedSceneModes FAILED");
    expect().assertFail();
  }
  return supportedSceneModes.sceneModesSize;
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
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

function startSession() {
  let begin = cameraObj.sessionBegin();
  if (begin != 0) {
    console.info(TAG + "beginConfig FAILED");
    expect().assertFail();
  }

  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(0);
  if (canAddInput.errorCode != 0) {
    console.info(TAG + "CanAddInput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
  
  if (canAddInput.isAddInput) {
    let addInput = cameraObj.sessionAddInput();
    if (addInput != 0) {
      console.info(TAG + "addInput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }

  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(0);
  if (canAddPreviewOutput.errorCode != 0) {
    console.info(TAG + "CanAddPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);

  if (canAddPreviewOutput.isAddPreviewOutput) {
    let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
    if (addPreviewOutput != 0) {
      console.info(TAG + "AddPreviewOutput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }

}

function sessionStart() {
  let start = cameraObj.sessionStart();
  if (start != 0) {
    console.info(TAG + "start FAILED");
    expect().assertFail();
  }
}

function sessionCommitConfig() {
  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "commitConfig FAILED");
    expect().assertFail();
  }
}

function createPhotoOutput() {
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
}
function createPhotoOutputWithoutSurface() {
  let mPhotoOutput = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(0);
  if (mPhotoOutput != 0) {
    console.info(TAG + "createPhotoOutputWithoutSurface FAILED");
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

function canAddPhotoOutput() {
  let ret = cameraObj.oHCaptureSessionCanAddPhotoOutput(0);
  if (ret.errorCode != 0) {
    console.log(TAG + "canAddPhotoOutput FAILED" + ret.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPhotoOutput: " + ret.isAddPhotoOutput);
  return ret;
}

function addPhotoOutput() {
  let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(0);
  if (canAddPhotoOutput.errorCode != 0) {
    console.log(TAG + "canAddPhotoOutput FAILED" + canAddPhotoOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
  if (!canAddPhotoOutput.isAddPhotoOutput) {
    console.log(TAG + "addPhotoOutput FAILED");
  } else {
    let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
    if (addPhotoOutput != 0) {
      console.log(TAG + "addPhotoOutput FAILED" + addPhotoOutput);
      expect().assertFail();
    }
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA"| "ohos.permission.MICROPHONE";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.MICROPHONE'];
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

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function sessionStop() {
  let ret = cameraObj.sessionStop();
  if (ret != 0) {
    console.info(TAG + "sessionStop FAILED");
    expect().assertFail();
  }
}

function captureSessionPreconfig() {
  getCameraManagerInstance();
  getSupportedCamerasInstance();
  createCaptureSession();
  getSupportedCameraOutputCapability();
  createCameraInput();
  let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
  if (!ret.canPreconfig) {
    expect(ret.canPreconfig).assertEqual(false);
  } else {
    let ret = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
    console.log(TAG+"testOHCaptureSessionPreconfig0100:"+ret)
    expect(ret).assertEqual(CAMERA_OK);
  }
}

function cameraManagerCreatePhotoOutputUsedInPreconfig() {
  captureSessionPreconfig()
  let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, 0);
  if (ret != 0) {
    console.info(TAG + "oHCameraManagerCreatePhotoOutputUsedInPreconfig FAILED");
    expect().assertFail();
  }
}

function photoOutputRegisterPhotoAvailableCallback() {
  let ret = cameraObj.oHPhotoOutputRegisterPhotoAvailableCallback(0);
  if (ret != 0) {
    console.info(TAG + "photoOutputRegisterPhotoAvailableCallback FAILED");
    expect().assertFail();
  }
}

function photoOutputRegisterPhotoAssetAvailableCallback() {
  let ret = cameraObj.oHPhotoOutputRegisterPhotoAssetAvailableCallback(0);
  if (ret != 0) {
    console.info(TAG + "photoOutputRegisterPhotoAssetAvailableCallback FAILED");
    expect().assertFail();
  }
}

function isMovingPhotoSupported() {
  let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(0);
  if (ret.errorCode != 0) {
    console.info(TAG + "oHPhotoOutputIsMovingPhotoSupported FAILED");
    expect().assertFail();
  }
  console.info(TAG+ "IsMovingPhotoSupported: " + ret.isMovingPhotoSupported);
  return ret.isMovingPhotoSupported;
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function PhotoTest() {
  describe('PhotoTest', () => {
    console.info(TAG + '----------PhotoTest--------------');
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
    })
    beforeEach(() => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
    })
    afterEach(() => {
      // releaseAll();
    })
    afterAll(() => {
      releaseAll();
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHCameraManagerCreatePhotoOutputWithoutSurface0100
     * @tc.name       : testOHCameraManagerCreatePhotoOutputWithoutSurface0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputWithoutSurface0100', 0, () => {
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputWithoutSurface(0);
      console.log(TAG+"testOHCameraManagerCreatePhotoOutputWithoutSurface0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAvailableCallback0100
     * @tc.name       : testOHPhotoOutputRegisterPhotoAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAvailableCallback0100', 0, () => {
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAvailableCallback(0);
      console.log(TAG+"testOHPhotoOutputRegisterPhotoAvailableCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAvailableCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAvailableCallback0100', 0, () => {
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAvailableCallback(0);
      console.log(TAG+"oHPhotoOutputUnregisterPhotoAvailableCallback is called, errorCode: "+ret);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAvailableCallback0100 end.");
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputRegisterPhotoAssetAvailableCallback0100
     * @tc.name       : testOHPhotoOutputRegisterPhotoAssetAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterPhotoAssetAvailableCallback0100', 0, () => {
      createPhotoOutputWithoutSurface();
      let ret = cameraObj.oHPhotoOutputRegisterPhotoAssetAvailableCallback(0);
      console.log(TAG+"testOHPhotoOutputRegisterPhotoAssetAvailableCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputUnregisterPhotoAssetAvailableCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0100', 0, () => {
      createPhotoOutputWithoutSurface();
      photoOutputRegisterPhotoAssetAvailableCallback();
      let ret = cameraObj.oHPhotoOutputUnregisterPhotoAssetAvailableCallback(0);
      console.log(TAG+"oHPhotoOutputUnregisterPhotoAssetAvailableCallback is called, errorCode: "+ret);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG+"testOHPhotoOutputUnregisterPhotoAssetAvailableCallback0100 end.");
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputIsMovingPhotoSupported0100
     * @tc.name       : testOHPhotoOutputIsMovingPhotoSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMovingPhotoSupported0100', 0, () => {
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputIsMovingPhotoSupported(0);
      console.log(TAG+"isMovingPhotoSupported: "+ret.isMovingPhotoSupported);
      console.log(TAG+"testOHPhotoOutputIsMovingPhotoSupported0100:"+ret.errorCode);
      expect(ret.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoOutputEnableMovingPhoto0100
     * @tc.name       : testOHPhotoOutputEnableMovingPhoto0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMovingPhoto0100', 0, () => {
      createPhotoOutput();
      addPhotoOutput();
      if (isMovingPhotoSupported()) {
        console.info(TAG+ "enabled is true");
        let ret_true = cameraObj.oHPhotoOutputEnableMovingPhoto(1);
        console.info(TAG+ "EnableMovingPhoto(true): " + ret_true);
        expect(ret_true).assertEqual(CAMERA_OK);
        console.info(TAG+ "enabled is false");
        let ret_false = cameraObj.oHPhotoOutputEnableMovingPhoto(0);
        console.info(TAG+ "EnableMovingPhoto(false): " + ret_false);
        expect(ret_false).assertEqual(CAMERA_OK);
      } else {
        console.info(TAG+ "MovingPhoto is not supported.");
      }
      console.log(TAG+"testOHPhotoOutputEnableMovingPhoto0100 end");
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoNativeGetMain0100
     * @tc.name       : testOHPhotoNativeGetMain0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoNativeGetMain0200', 0, () => {
      let ret = cameraObj.oHPhotoNativeGetMainImage(1);
      console.log(TAG+"testOHPhotoNativeGetMain0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEDIA_OHCAMERANDK_OHPhotoNativeRelease0100
     * @tc.name       : testOHPhotoNativeRelease0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoNativeRelease0200', 0, () => {
      let ret = cameraObj.oHPhotoNativeRelease(1);
      console.log(TAG+"testOHPhotoNativeRelease0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
  })
}