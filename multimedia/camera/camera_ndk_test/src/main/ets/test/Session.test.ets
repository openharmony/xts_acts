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
import { Camera_FlashMode, Camera_ExposureMode ,Camera_FocusMode,Camera_VideoStabilizationMode,
  Camera_PreconfigType, Camera_PreconfigRatio, Camera_MediaType } from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import MediaUtils from './MediaUtils';
import media from '@ohos.multimedia.media';
import { BusinessError } from '@ohos.base';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101; // 参数错误
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

let mediaUtil = MediaUtils.getInstance();
let videoSurfaceId: string;  // 这个变量应在使用前被赋值，从media.AVRecorder获取,用于创建录像输出实例
let videoRecorder: media.AVRecorder;
// 配置参数以实际硬件设备支持的范围为准
let videoConfig: media.AVRecorderConfig = {
  audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
  profile : {
    audioBitrate : 48000,
    audioChannels : 2,
    audioCodec : media.CodecMimeType.AUDIO_AAC,
    audioSampleRate : 48000,
    fileFormat : media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate : 512000,
    videoCodec : media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth : 640,
    videoFrameHeight : 480,
    videoFrameRate : 30
    },
  url : 'fd://', // 文件需先由调用者创建，赋予读写权限，将文件fd传给此参数，eg.fd://45
  rotation : 0, // 合理值0、90、180、270，非合理值prepare接口将报错
}

async function getVideoSurfaceId() {
  let mContext = AppStorage.get('context') as Context;
  console.info(TAG + 'start getVideoSurfaceID ');
  try {
    videoRecorder = await media.createAVRecorder();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`createAVRecorder call failed error code: ${err.code}`);
  }
  if (videoRecorder === undefined) {
    console.error(`createAVRecorder call failed`);
  }
  console.info(TAG + 'createAVRecorder videoRecorder : ' + JSON.stringify(videoRecorder));
  videoConfig.url = `fd://${await mediaUtil.createAndGetUriVideoNew(Camera_MediaType.VIDEO, mContext)}`;
  console.info(TAG + 'getVideoSurfaceID videoConfig.url : ' + JSON.stringify(videoConfig.url));
  try {
    await videoRecorder.prepare(videoConfig);
    console.info(TAG + 'getVideoSurfaceID  videoRecorder.prepare');
  } catch (err) {
    console.error(TAG + 'prepare failed with err: ' + err);
  }
  videoSurfaceId = await videoRecorder.getInputSurface();
  console.info(TAG + 'getVideoSurfaceID videoSurfaceId : ' + JSON.stringify(videoSurfaceId));
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

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
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

  let addInput = cameraObj.sessionAddInput();
  if (addInput != 0) {
    console.info(TAG + "addInput FAILED");
    expect().assertFail();
  }

  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(0);
  if (canAddPreviewOutput.errorCode != 0) {
    console.info(TAG + "CanAddPreviewOutput FAILED");
    expect().assertFail();
  }

  let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
  if (addPreviewOutput != 0) {
    console.info(TAG + "AddPreviewOutput FAILED");
    expect().assertFail();
  }

  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "commitConfig FAILED");
    expect().assertFail();
  }

  let start = cameraObj.sessionStart();
  if (start != 0) {
    console.info(TAG + "start FAILED");
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

function createVideoOutput() {
  let ret = cameraObj.createVideoOutput(videoSurfaceId);
  if (ret != 0) {
    console.info(TAG + "createVideoOutput FAILED");
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

function canAddPreviewOutput() {
  let ret = cameraObj.oHCaptureSessionCanAddPreviewOutput(0);
  if (ret.errorCode != 0) {
    console.log(TAG + "canAddPreviewOutput FAILED" + ret);
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + ret.isAddPreviewOutput);
}

function addPreviewOutput() {
  let ret = cameraObj.sessionAddPreviewOutput();
  if (ret != 0) {
    console.log(TAG + "addPreviewOutput FAILED" + ret);
    expect().assertFail();
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

function getPreviewOutputActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  createPreviewOutput();
  let ret = cameraObj.oHPreviewOutputGetActiveProfile(0);
  if (ret != 0) {
    console.info(TAG + "getPreviewOutputActiveProfile FAILED");
    expect().assertFail();
  }
}

function getPhotoOutputActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  createPreviewOutput();
  createCameraInput();
  startSession();
  sessionStop();
  sessionBeginConfig();
  createPhotoOutput();
  addPhotoOutput();
  let ret = cameraObj.oHPhotoOutputGetActiveProfile(0);
  if (ret != 0) {
    console.info(TAG + "getPhotoOutputActiveProfile FAILED");
    expect().assertFail();
  }
}

function getVideoOutputGetActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  getSupportedSceneModes();
  setSceneMode(1);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  startSession();
  sessionStop();
  sessionBeginConfig();
  createPhotoOutput();
  addPhotoOutput();
  createVideoOutput();
  addVideoOutput();
  let ret = cameraObj.oHVideoOutputGetActiveProfile(0);
  if (ret != 0) {
    console.info(TAG + "oHVideoOutputGetActiveProfile FAILED");
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

function captureSessionCanPreconfigWithRatio() {
  getCameraManagerInstance();
  getSupportedCamerasInstance();
  createCaptureSession();
  let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
    Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
  if (!ret.canPreconfig) {
    expect(ret.canPreconfig).assertEqual(false);
  } else {
    if (ret.errorCode != 0) {
      console.info(TAG + "oHCaptureSessionCanPreconfigWithRatio FAILED");
      expect().assertFail();
    }
  }
}

function cameraManagerCreatePreviewOutputUsedInPreconfig() {
  captureSessionPreconfig()
  let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(0);
  if (ret != 0) {
    console.info(TAG + "oHCameraManagerCreatePreviewOutputUsedInPreconfig FAILED");
    expect().assertFail();
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

function cameraManagerCreateVideoOutputUsedInPreconfig() {
  captureSessionPreconfig()
  let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId, 0);
  if (ret != 0) {
    console.info(TAG + "oHCameraManagerCreatePreviewOutputUsedInPreconfig FAILED");
    expect().assertFail();
  }
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

function addVideoOutput() {
  let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(0);
  if (canAddVideoOutput.errorCode != 0) {
    console.log(TAG + "canAddVideoOutput FAILED" + canAddVideoOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
  if (!canAddVideoOutput.isAddVideoOutput) {
    console.log(TAG + "addVideoOutput FAILED");
  } else {
    let addVideoOutput = cameraObj.sessionAddVideoOutput();
    if (addVideoOutput != 0) {
      console.log(TAG + "addVideoOutput FAILED" + addVideoOutput);
      expect().assertFail();
    }
  }
}

export default function SessionTest() {
  describe('SessionTest', () => {
    console.info(TAG + '----------SessionTest--------------');
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      await getVideoSurfaceId();
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterCallback0100
     * @tc.name       : testOHCaptureSessionRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionRegisterCallback(0);
      console.log(TAG+"testOHCaptureSessionRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterCallback0200
     * @tc.name       : testOHCaptureSessionRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionRegisterCallback(1);
      console.log(TAG+"testOHCaptureSessionRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterCallback0300
     * @tc.name       : testOHCaptureSessionRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionRegisterCallback(2);
      console.log(TAG+"testOHCaptureSessionRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterCallback0100
     * @tc.name       : testOHCaptureSessionUnregisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionUnregisterCallback(0);
      console.log(TAG+"testOHCaptureSessionUnregisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterCallback0200
     * @tc.name       : testOHCaptureSessionUnregisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionUnregisterCallback(1);
      console.log(TAG+"testOHCaptureSessionUnregisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterCallback0300
     * @tc.name       : testOHCaptureSessionUnregisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCaptureSessionUnregisterCallback(3);
      console.log(TAG+"testOHCaptureSessionUnregisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0100
     * @tc.name       : testOHCaptureSessionSetSessionMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(0);
      console.log(TAG+"testOHCaptureSessionSetSessionMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0200
     * @tc.name       : testOHCaptureSessionSetSessionMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(1);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(0);
      console.log(TAG+"testOHCaptureSessionSetSessionMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0300
     * @tc.name       : testOHCaptureSessionSetSessionMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      let sceneModesSize = getSupportedSceneModes();
      console.log(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+sceneModesSize);
      if (sceneModesSize == 2) {
        console.log(TAG+"SECURE_PHOTO is not supported");
        console.log(TAG+"testOHCaptureSessionSetSessionMode0300 end");
        expect(true).assertTrue();
      } else if (sceneModesSize == 3) {
        console.log(TAG+"SECURE_PHOTO is supported");
        setSceneMode(2);
        let ret = cameraObj.oHCaptureSessionSetSessionMode(0);
        console.log(TAG+"testOHCaptureSessionSetSessionMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0400
     * @tc.name       : testOHCaptureSessionSetSessionMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0400', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(1);
      console.log(TAG+"testOHCaptureSessionSetSessionMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionSetSessionMode0500
     * @tc.name       : testOHCaptureSessionSetSessionMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetSessionMode0500', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedSceneModes();
      setSceneMode(0);
      let ret = cameraObj.oHCaptureSessionSetSessionMode(2);
      console.log(TAG+"testOHCaptureSessionSetSessionMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0100
     * @tc.name       : testOHCaptureSessionCanAddInput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(0);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.log(TAG+"testOHCaptureSessionCanAddInput0100:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0200
     * @tc.name       : testOHCaptureSessionCanAddInput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(1);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.log(TAG+"testOHCaptureSessionCanAddInput0200:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0300
     * @tc.name       : testOHCaptureSessionCanAddInput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(2);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.log(TAG+"testOHCaptureSessionCanAddInput0300:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddInput0400
     * @tc.name       : testOHCaptureSessionCanAddInput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddInput0400', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      let canAddInput = cameraObj.oHCaptureSessionCanAddInput(3);
      console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
      console.log(TAG+"testOHCaptureSessionCanAddInput0400:"+canAddInput.errorCode);
      expect(canAddInput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0100
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      canAddInput();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(0);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPreviewOutput0100:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0200
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      canAddInput();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(1);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPreviewOutput0200:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0300
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      canAddInput();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(2);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPreviewOutput0300:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPreviewOutput0400
     * @tc.name       : testOHCaptureSessionCanAddPreviewOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPreviewOutput0400', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(0);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionBeginConfig();
      canAddInput();
      addInput();
      let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(3);
      console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPreviewOutput0400:"+canAddPreviewOutput.errorCode);
      expect(canAddPreviewOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0200
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0200', 0, () => {
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
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(1);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPhotoOutput0200:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0300
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0300', 0, () => {
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
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(2);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPhotoOutput0300:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddPhotoOutput0400
     * @tc.name       : testOHCaptureSessionCanAddPhotoOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddPhotoOutput0400', 0, () => {
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
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(3);
      console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddPhotoOutput0400:"+canAddPhotoOutput.errorCode);
      expect(canAddPhotoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0100
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(0);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddVideoOutput0100:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0200
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(1);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddVideoOutput0200:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0300
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(2);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddVideoOutput0300:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionCanAddVideoOutput0400
     * @tc.name       : testOHCaptureSessionCanAddVideoOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanAddVideoOutput0400', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createVideoOutput();
      let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(3);
      console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
      console.log(TAG+"testOHCaptureSessionCanAddVideoOutput0400:"+canAddVideoOutput.errorCode);
      expect(canAddVideoOutput.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallbackOn0100
     * @tc.name       : testOHCaptureSessionRegisterCallbackOn0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallbackOn0100', 0, () => {
      let ret = cameraObj.oHCaptureSessionRegisterCallbackOn(1);
      console.log(TAG+"testOHCaptureSessionRegisterCallbackOn0100:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallbackOn0200
     * @tc.name       : testOHCaptureSessionRegisterCallbackOn0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallbackOn0200', 0, () => {
      let ret = cameraObj.oHCaptureSessionRegisterCallbackOn(2);
      console.log(TAG+"testOHCaptureSessionRegisterCallbackOn0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionRegisterCallbackOn0300
     * @tc.name       : testOHCaptureSessionRegisterCallbackOn0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallbackOn0300', 0, () => {
      let ret = cameraObj.oHCaptureSessionRegisterCallbackOn(3);
      console.log(TAG+"testOHCaptureSessionRegisterCallbackOn0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallbackOff0100
     * @tc.name       : testOHCaptureSessionUnregisterCallbackOff0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallbackOff0100', 0, () => {
      let ret = cameraObj.oHCaptureSessionUnregisterCallbackOff(1);
      console.log(TAG+"testOHCaptureSessionUnregisterCallbackOff0100:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallbackOff0200
     * @tc.name       : testOHCaptureSessionUnregisterCallbackOff0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallbackOff0200', 0, () => {
      let ret = cameraObj.oHCaptureSessionUnregisterCallbackOff(2);
      console.log(TAG+"testOHCaptureSessionUnregisterCallbackOff0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionUnregisterCallbackOff0300
     * @tc.name       : testOHCaptureSessionUnregisterCallbackOff0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallbackOff0300', 0, () => {
      let ret = cameraObj.oHCaptureSessionUnregisterCallbackOff(3);
      console.log(TAG+"testOHCaptureSessionUnregisterCallbackOff0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfig0100
     * @tc.name       : testOHCaptureSessionCanPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfig0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfig0500
     * @tc.name       : testOHCaptureSessionCanPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0500', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 1);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfig0500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfig0600
     * @tc.name       : testOHCaptureSessionCanPreconfig0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0600', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE, 1);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfig0600:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfig0700
     * @tc.name       : testOHCaptureSessionCanPreconfig0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfig0700', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE, 2);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfig0700:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfigWithRatio0100
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
      console.log(TAG+"testOHCaptureSessionCanPreconfigWithRatio0100 canPreconfig:"+ret.canPreconfig);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfigWithRatio0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfigWithRatio1300
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 1);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfigWithRatio1300:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfigWithRatio1400
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1400', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfigWithRatio1400:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCanPreconfigWithRatio1500
     * @tc.name       : testOHCaptureSessionCanPreconfigWithRatio1500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCanPreconfigWithRatio1500', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.EXCEPTION_ENUMERATION_VALUE, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        console.log(TAG+"testOHCaptureSessionCanPreconfigWithRatio1500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfig0100
     * @tc.name       : testOHCaptureSessionPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
        console.log(TAG+"testOHCaptureSessionPreconfig0100:"+ret)
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfig0500
     * @tc.name       : testOHCaptureSessionPreconfig0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0500', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P, 1);
        console.log(TAG+"testOHCaptureSessionPreconfig0500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfig0600
     * @tc.name       : testOHCaptureSessionPreconfig0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfig0600', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE, 0);
        console.log(TAG+"testOHCaptureSessionPreconfig0600:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfigWithRatio0100
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
        console.log(TAG+"testOHCaptureSessionPreconfigWithRatio0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfigWithRatio1300
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, 1);
        console.log(TAG+"testOHCaptureSessionPreconfigWithRatio1300:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfigWithRatio1400
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1400', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.EXCEPTION_ENUMERATION_VALUE,
          Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
        console.log(TAG+"testOHCaptureSessionPreconfigWithRatio1400:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionPreconfigWithRatio1500
     * @tc.name       : testOHCaptureSessionPreconfigWithRatio1500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionPreconfigWithRatio1500', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      let ret = cameraObj.oHCaptureSessionCanPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
        Camera_PreconfigRatio.PRECONFIG_RATIO_1, 0);
      if (!ret.canPreconfig) {
        expect(ret.canPreconfig).assertEqual(false);
      } else {
        let ret = cameraObj.oHCaptureSessionPreconfigWithRatio(Camera_PreconfigType.PRECONFIG_720P,
          Camera_PreconfigRatio.EXCEPTION_ENUMERATION_VALUE, 0);
        console.log(TAG+"testOHCaptureSessionPreconfigWithRatio1500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0100
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0100', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(0);
      console.log(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0200
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0200', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(1);
      console.log(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0300
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0300', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(2);
      console.log(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutputUsedInPreconfig0400
     * @tc.name       : testOHCameraManagerCreatePreviewOutputUsedInPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutputUsedInPreconfig0400', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(3);
      console.log(TAG+"testOHCameraManagerCreatePreviewOutputUsedInPreconfig0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0100
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0100', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, 0)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0200
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0200', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, 1)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0300
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0300', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, 2)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutputUsedInPreconfig0400
     * @tc.name       : testOHCameraManagerCreatePhotoOutputUsedInPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutputUsedInPreconfig0400', 0, () => {
      captureSessionPreconfig()
      let ret = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface, 3)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutputUsedInPreconfig0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0100
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0100', 0, () => {
      captureSessionPreconfig();
      let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,0);
      console.log(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0200
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0200', 0, () => {
      captureSessionPreconfig();
      let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,1);
      console.log(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0300
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0300', 0, () => {
      captureSessionPreconfig();
      let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,2);
      console.log(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateVideoOutputUsedInPreconfig0400
     * @tc.name       : testOHCameraManagerCreateVideoOutputUsedInPreconfig0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateVideoOutputUsedInPreconfig0400', 0, () => {
      captureSessionPreconfig();
      let ret = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,3);
      console.log(TAG+"testOHCameraManagerCreateVideoOutputUsedInPreconfig0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetActiveProfile0100
     * @tc.name       : testOHPreviewOutputGetActiveProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(0);
      console.log(TAG+"testOHPreviewOutputGetActiveProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetActiveProfile0200
     * @tc.name       : testOHPreviewOutputGetActiveProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(1);
      console.log(TAG+"testOHPreviewOutputGetActiveProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputGetActiveProfile0300
     * @tc.name       : testOHPreviewOutputGetActiveProfile0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputGetActiveProfile0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      let ret = cameraObj.oHPreviewOutputGetActiveProfile(2);
      console.log(TAG+"testOHPreviewOutputGetActiveProfile0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputDeleteProfile0100
     * @tc.name       : testOHPreviewOutputDeleteProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteProfile0100', 0, () => {
      getPreviewOutputActiveProfile();
      let ret = cameraObj.oHPreviewOutputDeleteProfile(0);
      console.log(TAG+"testOHPreviewOutputDeleteProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputDeleteProfile0200
     * @tc.name       : testOHPreviewOutputDeleteProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputDeleteProfile0200', 0, () => {
      getPreviewOutputActiveProfile();
      let ret = cameraObj.oHPreviewOutputDeleteProfile(1);
      console.log(TAG+"testOHPreviewOutputDeleteProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputGetActiveProfile0100
     * @tc.name       : testOHPhotoOutputGetActiveProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(0);
      console.log(TAG+"testOHPhotoOutputGetActiveProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputGetActiveProfile0200
     * @tc.name       : testOHPhotoOutputGetActiveProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(1);
      console.log(TAG+"testOHPhotoOutputGetActiveProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputGetActiveProfile0300
     * @tc.name       : testOHPhotoOutputGetActiveProfile0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputGetActiveProfile0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      addPhotoOutput();
      let ret = cameraObj.oHPhotoOutputGetActiveProfile(2);
      console.log(TAG+"testOHPhotoOutputGetActiveProfile0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputDeleteProfile0100
     * @tc.name       : testOHPhotoOutputDeleteProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputDeleteProfile0100', 0, () => {
      getPhotoOutputActiveProfile();
      let ret = cameraObj.oHPhotoOutputDeleteProfile(0);
      console.log(TAG+"testOHPhotoOutputDeleteProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputDeleteProfile0200
     * @tc.name       : testOHPhotoOutputDeleteProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputDeleteProfile0200', 0, () => {
      getPhotoOutputActiveProfile();
      let ret = cameraObj.oHPhotoOutputDeleteProfile(1);
      console.log(TAG+"testOHPhotoOutputDeleteProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetActiveProfile0100
     * @tc.name       : testOHVideoOutputGetActiveProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(0);
      console.log(TAG+"testOHVideoOutputGetActiveProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetActiveProfile0200
     * @tc.name       : testOHVideoOutputGetActiveProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0200', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(1);
      console.log(TAG+"testOHVideoOutputGetActiveProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputGetActiveProfile0300
     * @tc.name       : testOHVideoOutputGetActiveProfile0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputGetActiveProfile0300', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes();
      setSceneMode(1);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      startSession();
      sessionStop();
      sessionBeginConfig();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let ret = cameraObj.oHVideoOutputGetActiveProfile(2);
      console.log(TAG+"testOHVideoOutputGetActiveProfile0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputDeleteProfile0100
     * @tc.name       : testOHVideoOutputDeleteProfile0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteProfile0100', 0, () => {
      getVideoOutputGetActiveProfile();
      let ret = cameraObj.oHVideoOutputDeleteProfile(0);
      console.log(TAG+"testOHVideoOutputDeleteProfile0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHVideoOutputDeleteProfile0200
     * @tc.name       : testOHVideoOutputDeleteProfile0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputDeleteProfile0200', 0, () => {
      getVideoOutputGetActiveProfile();
      let ret = cameraObj.oHVideoOutputDeleteProfile(1);
      console.log(TAG+"testOHVideoOutputDeleteProfile0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
  })
}