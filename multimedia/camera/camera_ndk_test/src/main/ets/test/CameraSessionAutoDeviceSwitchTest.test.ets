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
import { Camera_SceneMode, Parameter_Setting } from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import display from '@ohos.display';

const TAG = "CameraXts CameraSessionAutoDeviceSwitchTest: ";

let receiver: image.ImageReceiver;
let mPhotoSurface: string;

async function getPhotoReceiverSurface() {
  console.info(TAG + 'createImageReceiver start.');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.error(TAG + 'createImageReceiver successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.info(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error(TAG + 'createImageReceiver failed');
  }
}

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.error(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function createCaptureSession() {
  console.info(TAG + "createCaptureSession start.");
  let ret = cameraObj.createSession();
  if (ret != 0) {
    console.error(TAG + "createCaptureSession FAILED");
    expect().assertFail();
  }
}

function createCameraInput() {
  console.info(TAG + "createCameraInput start.");
  let ret = cameraObj.createCameraInput();
  if (ret != 0) {
    console.error(TAG + "createCameraInput FAILED");
    expect().assertFail();
  }
  cameraObj.cameraInputOpen();
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.error(TAG + "getSupportedCamerasInstance FAILED");
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

function createPreviewOutput() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.error(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
}

function sessionFlow() {
  let begin = cameraObj.sessionBegin();
  if (begin != 0) {
    console.error(TAG + "beginConfig FAILED");
    expect().assertFail();
  }

  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddInput.errorCode != 0) {
    console.error(TAG + "CanAddInput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);

  if (canAddInput.isAddInput) {
    let addInput = cameraObj.sessionAddInput();
    if (addInput != 0) {
    console.error(TAG + "addInput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }

  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPreviewOutput.errorCode != 0) {
    console.error(TAG + "CanAddPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);

  if (canAddPreviewOutput.isAddPreviewOutput) {
    let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
    if (addPreviewOutput != 0) {
      console.error(TAG + "addPreviewOutput FAILED");
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA"|
      "ohos.permission.MICROPHONE";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA',
      'ohos.permission.MICROPHONE'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo =
        await bundleManager.getApplicationInfoSync('com.example.camerandk', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.error(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

export default function CameraSessionAutoDeviceSwitchTest() {
  describe('CameraSessionAutoDeviceSwitchTest', () => {
    console.info(TAG + '----------CameraSessionAutoDeviceSwitchTest--------------');
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      releaseCamera();
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
        /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionIsAutoDeviceSwitchSupportedTest100
     * @tc.name      : testOHSessionIsAutoDeviceSwitchSupportedTest100
     * @tc.desc      : Checks if the automatic switchover device is supported.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionIsAutoDeviceSwitchSupportedTest100', 2, async () => {
      console.info("--------------testOHSessionIsAutoDeviceSwitchSupportedTest100--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let isFoldable = display.isFoldable();
      console.info(TAG + "testOHSessionIsAutoDeviceSwitchSupportedTest100 isFoldable:" + isFoldable);
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.isSupported != isFoldable || autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      console.info(TAG + "Entering testOHSessionIsAutoDeviceSwitchSupportedTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionEnableAutoDeviceSwitchTest100
     * @tc.name      : testOHSessionEnableAutoDeviceSwitchTest100
     * @tc.desc      : Enables or disables the automatic switchover device.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionEnableAutoDeviceSwitchTest100', 2, async (done: Function) => {
      console.info("--------------testOHSessionEnableAutoDeviceSwitchTest100--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionEnableAutoDeviceSwitchTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterAutoDeviceSwitchCallbackTest100
     * @tc.name      : testOHSessionRegisterAutoDeviceSwitchCallbackTest100
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionRegisterAutoDeviceSwitchCallbackTest100', 2, async () => {
      console.info("--------------testOHSessionRegisterAutoDeviceSwitchCallbackTest100--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionRegisterAutoDeviceSwitchCallbackTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterAutoDeviceSwitchCallbackTest200
     * @tc.name      : testOHSessionRegisterAutoDeviceSwitchCallbackTest200
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionRegisterAutoDeviceSwitchCallbackTest200', 2, async () => {
      console.info("--------------testOHSessionRegisterAutoDeviceSwitchCallbackTest200--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionRegisterAutoDeviceSwitchCallbackTest200 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterAutoDeviceSwitchCallbackTest300
     * @tc.name      : testOHSessionRegisterAutoDeviceSwitchCallbackTest300
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionRegisterAutoDeviceSwitchCallbackTest300', 2, async () => {
      console.info("--------------testOHSessionRegisterAutoDeviceSwitchCallbackTest300--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionRegisterAutoDeviceSwitchCallbackTest300 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterAutoDeviceSwitchCallbackTest100
     * @tc.name      : testOHSessionUnregisterAutoDeviceSwitchCallbackTest100
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionUnregisterAutoDeviceSwitchCallbackTest100', 2, async () => {
      console.info("--------------testOHSessionUnregisterAutoDeviceSwitchCallbackTest100--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionUnregisterAutoDeviceSwitchStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionUnregisterAutoDeviceSwitchCallbackTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterAutoDeviceSwitchCallbackTest200
     * @tc.name      : testOHSessionUnregisterAutoDeviceSwitchCallbackTest200
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionUnregisterAutoDeviceSwitchCallbackTest200', 2, async () => {
      console.info("--------------testOHSessionUnregisterAutoDeviceSwitchCallbackTest200--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionUnregisterAutoDeviceSwitchCallbackTest200 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterAutoDeviceSwitchCallbackTest300
     * @tc.name      : testOHSessionUnregisterAutoDeviceSwitchCallbackTest300
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionUnregisterAutoDeviceSwitchCallbackTest300', 2, async () => {
      console.info("--------------testOHSessionUnregisterAutoDeviceSwitchCallbackTest300--------------");
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionUnregisterAutoDeviceSwitchCallbackTest300 ends here");
    })
  })
}