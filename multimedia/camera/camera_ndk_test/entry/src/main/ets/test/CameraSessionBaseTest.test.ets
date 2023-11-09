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

import cameraObj from 'libentry.so';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import deviceInfo from '@ohos.deviceInfo';
import featureAbility from '@ohos.ability.featureAbility';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

const TAG = "CameraSessionBaseTest: ";

let receiver;
let mPhotoSurface;
let mFileAsset;
let mFdNumber;
let mFdPath;
let mVideoRecorder;
let mVideoSurface;
let mSupportCamera;
let mCameraInput;

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
  url: 'file:///data/media/CameraSessionBase.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 },
  maxSize: 100,
  maxDuration: 500
}

export default function cameraSessionTest() {

  function sleep(ms) {
    console.info(TAG + "Entering sleep -> Promise constructor ms =" + ms);
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

  function getCameraManagerInstance(){
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
    let cameraInfo = cameraObj.getSupportedCameras();
    if (cameraInfo.cameraId == null) {
      console.info(TAG + "getSupportedCameras FAILED");
      expect().assertFail();
    }
    console.info(TAG + 'Exit getCameraSupportDevicesArray');
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
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  async function createInput() {
    console.info('Enter createInput');
    let mCameraInput = cameraObj.createCameraInput();

    if (mCameraInput != 0) {
      console.info(TAG + "createCameraInput FAILED");
      expect().assertFail();
      return false;
    }

    await cameraObj.cameraInputOpen();
    await sleep(100);
    console.info('Exit cameraInputOpen');
    return true;
  }

  function createOutput() {
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

  async function startCameraSession() {
    console.info(TAG + "Enter startCameraSession");

    await createInput();
    createOutput();

    await sleep(1);
    let ret = cameraObj.sessionBegin();
    if (ret != 0) {
      console.info(TAG + "sessionBegin FAILED");
      expect().assertFail();
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
    await sleep(30);

    let commitConfig = cameraObj.sessionCommitConfig();
    if (commitConfig != 0) {
      console.info(TAG + "CommitConfig FAILED");
      expect().assertFail();
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

  async function releaseInput() {
    console.info('Enter releaseInput');
    if(!isEmpty(mCameraInput)) {
      await cameraObj.cameraInputClose();
    }


    console.info('Exit releaseInput');
    return true;
  }

  async function releaseOutput() {
    console.info('Enter releaseOutput');
    await cameraObj.previewOutputRelease();
    await cameraObj.photoOutputRelease();

    console.info('Exit releaseOutput');
    return true;
  }

  async function releaseVideoReceiveSurface() {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    mVideoRecorder.release((err) => {
      console.info(TAG + 'Entering release video receiver')
    })
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  async function releaseCameraSessionInstance() {
    await cameraObj.sessionRelease();
  }

  describe('CameraSessionBaseTest', function () {
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
    console.info(TAG + '----------CameraSessionTest--------------')

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

      console.info('Device type = ' + deviceInfo.deviceType);

      console.info('beforeAll case');
    })

    beforeEach(async function () {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async function () {
      console.info('afterEach case');
      await sleep(200);
    })

    afterAll(function () {
      releaseVideoReceiveSurface();
      sleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_001
     * @tc.name      : Check capture session begin config
     * @tc.desc      : Check capture session begin config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_001', 2, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_001--------------");
      cameraObj.sessionBegin();
      sleep(1000);
      cameraObj.sessionStop();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_001 PASSED");

      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_002
     * @tc.name      : Check capture session can add input with promise or not
     * @tc.desc      : Check capture session can add input with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_002', 2, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_002--------------");
      await cameraObj.sessionBegin();
      await createInput();
      cameraObj.sessionAddInput();
      cameraObj.sessionRemoveInput();
      await releaseInput();
      sleep(1000);
      cameraObj.sessionStop();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_002 ends here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003
     * @tc.name      : Check capture session can add output with promise or not for preview
     * @tc.desc      : Check capture session can add output with promise or not for preview
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003', 2, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003--------------");
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003 add PASSED");

      cameraObj.sessionRemovePreviewOutput();
      cameraObj.sessionRemovePhotoOutput();
      await releaseOutput();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003 ends here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004
     * @tc.name      : Check capture session start/stop/release output with promise or not
     * @tc.desc      : Check capture session start/stop/release output with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004', 0,
      async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004--------------");
      await sleep(5);
      releaseCameraSessionInstance();
      createCameraSessionInstance();
      await cameraObj.cameraInputClose();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004 start for camera[0]");
      await startCameraSession();

      await cameraObj.sessionStart();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004 start PASSED");
      await sleep(20);

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004 stop PASSED");
      await sleep(20);

      await stopCameraSession();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004 end for camera[0]");

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_004 ends here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_005
     * @tc.name      : Check capture session commit config
     * @tc.desc      : Check capture session commit config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_005', 2, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_005--------------");

      releaseCameraSessionInstance();
      createCameraSessionInstance();
      await cameraObj.cameraInputClose();
      await createInput();
      createOutput();
      console.info(TAG + "Start to sessionAddInput");

      cameraObj.sessionBegin();
      cameraObj.sessionAddInput();
      console.info(TAG + "Start to addOutput mPreviewOutput");
      cameraObj.sessionAddPreviewOutput();
      console.info(TAG + "Start to addOutput mPhotoOutput");
      cameraObj.sessionAddPhotoOutput();

      await cameraObj.sessionCommitConfig();
      cameraObj.sessionStart();

      await stopCameraSession();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_005 PASSED");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_006
     * @tc.name      : Check capture session release with promise or not
     * @tc.desc      : Check capture session release with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_006', 2, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_006--------------");

      await cameraObj.sessionRelease();

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_006 ends here");
      done();
    })
  })
}