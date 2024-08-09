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
import { Camera_Position, Camera_Type } from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Camera_PreconfigType } from './Constants';

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

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
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

function getSupportedCameraOutputCapabilityWithSceneMode() {
  let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(0);
  if (ret != 0) {
    console.info(TAG + "getSupportedCameraOutputCapabilityWithSceneMode FAILED");
    expect().assertFail();
  }
}

function createPreviewOutputInstance() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.info(TAG + "createPreviewOutputInstance FAILED");
    expect().assertFail();
  }
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

export default function CameraManagerTest() {
  describe('CameraManagerTest', () => {
    console.info(TAG + '----------CameraManagerTest--------------');
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();

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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0100
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(0).errorCode;
      console.log(TAG+"testOHCameraManagerGetSupportedSceneModes0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0200
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(1).errorCode;
      console.log(TAG+"testOHCameraManagerGetSupportedSceneModes0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0300
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(2).errorCode;
      console.log(TAG+"testOHCameraManagerGetSupportedSceneModes0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0400
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0400', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(3).errorCode;
      console.log(TAG+"testOHCameraManagerGetSupportedSceneModes0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0100
     * @tc.name       : testOHCameraManagerDeleteSceneModes0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSceneModes0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(0);
      console.log(TAG+"testOHCameraManagerDeleteSceneModes0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0200
     * @tc.name       : testOHCameraManagerDeleteSceneModes0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSceneModes0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(1);
      console.log(TAG+"testOHCameraManagerDeleteSceneModes0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0300
     * @tc.name       : testOHCameraManagerDeleteSceneModes0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSceneModes0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(2);
      console.log(TAG+"testOHCameraManagerDeleteSceneModes0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(0);
      console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(1);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(0);
      console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let sceneModesSize = getSupportedSceneModes();
      console.log(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+sceneModesSize);
      if (sceneModesSize == 2) {
        console.log(TAG+"SECURE_PHOTO is not supported");
        console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300 end");
        expect(true).assertTrue();
      } else if (sceneModesSize == 3) {
        console.log(TAG+"SECURE_PHOTO is supported");
        setSceneMode(2);
        let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(0);
        console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(1);
      console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(2);
      console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(3);
      console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(4);
      console.log(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
  })
}