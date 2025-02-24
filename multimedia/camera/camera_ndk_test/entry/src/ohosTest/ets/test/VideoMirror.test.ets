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
import { Camera_PreconfigType, Camera_PreconfigRatio, Camera_MediaType, Camera_SceneMode,
  Parameter_Setting } from './Constants';
//import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import MediaUtils from './MediaUtils';
import media from '@ohos.multimedia.media';
import { ability } from '@kit.AbilityKit';
import { abilityAccessCtrl, Context, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const ALL_CALLBACK_IS_NULL = 1;
const ONLY_ON_ERROR = 2;
const ONLY_ON_FOCUS_STATE_CHANGE = 3;
const INVALID_SURFACE_ID = 4;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let context: Context = getContext(this) as common.UIAbilityContext;

let mediaUtil = MediaUtils.getInstance();
let videoSurfaceId: string;
let videoRecorder: media.AVRecorder;
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
  url : 'fd://',
  rotation : 0,
}

async function getVideoSurfaceId() {
  const mContext: Context = getContext();
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
    console.error(TAG + "setSceneMode FAILED");
    expect().assertFail();
  }
  if (index_sceneMode == Camera_SceneMode.NORMAL_PHOTO) {
    console.info(TAG + "set sceneMode: NORMAL_PHOTO");
  } else if (index_sceneMode == Camera_SceneMode.NORMAL_VIDEO) {
    console.info(TAG + "set sceneMode: NORMAL_VIDEO");
  } else if (index_sceneMode == Camera_SceneMode.SECURE_PHOTO) {
    console.info(TAG + "set sceneMode: SECURE_PHOTO");
  }
}

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

function getSupportedSceneModes(index: number) {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(index);
  if (supportedSceneModes.errorCode != 0) {
    console.error(TAG + "getSupportedSceneModes FAILED");
    expect().assertFail();
  }
  if (supportedSceneModes.isNormalPhoto) {
    console.info(TAG + "NORMAL_PHOTO is supported.");
  }
  if (supportedSceneModes.isNormalVideo) {
    console.info(TAG + "NORMAL_VIDEO is supported.");
  }
  if (supportedSceneModes.isSecurePhoto) {
    console.info(TAG + "SECURE_PHOTO is supported.");
  }
  cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  return supportedSceneModes;
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

function setSessionMode() {
  let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "setSessionMode FAILED");
    expect().assertFail();
  }
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

function createPhotoOutput() {
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.error(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
}

function createVideoOutput() {
  let ret = cameraObj.createVideoOutput(videoSurfaceId);
  if (ret != 0) {
    console.error(TAG + "createVideoOutput FAILED");
    expect().assertFail();
  }
}

function sessionBeginConfig() {
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.error(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}

function addInput() {
  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddInput.errorCode != 0) {
    console.info(TAG + "canAddInput FAILED" + canAddInput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
  if (canAddInput.isAddInput) {
    let ret = cameraObj.sessionAddInput();
    if (ret != 0) {
      console.error(TAG + "addInput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function addPreviewOutput() {
  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPreviewOutput.errorCode != 0) {
    console.error(TAG + "canAddPreviewOutput FAILED" + canAddPreviewOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
  if (canAddPreviewOutput.isAddPreviewOutput) {
    let ret = cameraObj.sessionAddPreviewOutput();
    if (ret != 0) {
      console.error(TAG + "addPreviewOutput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

let getPermissions1 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)

  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let getPermissions2 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

function sleep1(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep1(500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep1(500);
  await power?.click();
  await sleep1(500);
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function getPreviewOutputActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  sessionBeginConfig();
  addInput();
  addPreviewOutput();
  let ret = cameraObj.oHPreviewOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "getPreviewOutputActiveProfile FAILED");
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
  sessionFlow();
  createPhotoOutput();
  addPhotoOutput();
  let ret = cameraObj.oHPhotoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "getPhotoOutputActiveProfile FAILED");
    expect().assertFail();
  }
}

function getVideoOutputGetActiveProfile() {
  getCameraManagerInstance();
  createCaptureSession();
  getSupportedCamerasInstance();
  getSupportedCameraOutputCapability();
  getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
  setSessionMode();
  createPreviewOutput();
  createCameraInput();
  sessionFlow();
  createPhotoOutput();
  addPhotoOutput();
  createVideoOutput();
  addVideoOutput();
  let ret = cameraObj.oHVideoOutputGetActiveProfile(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "oHVideoOutputGetActiveProfile FAILED");
    expect().assertFail();
  }
}

function captureSessionPreconfig() {
  getCameraManagerInstance();
  getSupportedCamerasInstance();
  createCaptureSession();
  getSupportedCameraOutputCapability();
  let canPreconfig = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
    Parameter_Setting.ALL_PARAMETER_OK);
  console.info(TAG+"canPreconfig: " + canPreconfig.canPreconfig);
  if (!canPreconfig.canPreconfig) {
    expect(canPreconfig.canPreconfig).assertEqual(false);
  } else {
    let preconfig = cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P,
      Parameter_Setting.ALL_PARAMETER_OK);
    console.info(TAG+"captureSessionPreconfig:"+preconfig)
    expect(preconfig).assertEqual(CAMERA_OK);
  }
  return canPreconfig.canPreconfig;
}

function createPhotoOutputUsedInPreconfig(canPreconfig: boolean) {
  if (!canPreconfig) {
    createPhotoOutput();
  } else {
    let photoOutput = cameraObj.oHCameraManagerCreatePhotoOutputUsedInPreconfig(mPhotoSurface,
      Parameter_Setting.ALL_PARAMETER_OK);
    if (photoOutput != 0) {
      console.error(TAG + "createPhotoOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
  }
}

function createPreviewOutputUsedInPreconfig(canPreconfig: boolean) {
  if (!canPreconfig) {
    createPreviewOutput();
  } else {
    let previewOutput =
      cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.ALL_PARAMETER_OK);
    if (previewOutput != 0) {
      console.error(TAG + "createPreviewOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
  }
}

function createVideoOutputUsedInPreconfig(canPreconfig: boolean) {
  if (!canPreconfig) {
    createVideoOutput();
  } else {
    let videoOutput = cameraObj.oHCameraManagerCreateVideoOutputUsedInPreconfig(videoSurfaceId,
      Parameter_Setting.ALL_PARAMETER_OK);
    if (videoOutput != 0) {
      console.error(TAG + "createVideoOutputUsedInPreconfig FAILED");
      expect().assertFail();
    }
  }
}

function addPhotoOutput() {
  let canAddPhotoOutput = cameraObj.oHCaptureSessionCanAddPhotoOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPhotoOutput.errorCode != 0) {
    console.error(TAG + "canAddPhotoOutput FAILED" + canAddPhotoOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPhotoOutput: " + canAddPhotoOutput.isAddPhotoOutput);
  if (!canAddPhotoOutput.isAddPhotoOutput) {
    console.error(TAG + "addPhotoOutput FAILED");
  } else {
    let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
    if (addPhotoOutput != 0) {
      console.error(TAG + "addPhotoOutput FAILED" + addPhotoOutput);
      expect().assertFail();
    }
  }
}

function addVideoOutput() {
  let canAddVideoOutput = cameraObj.oHCaptureSessionCanAddVideoOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddVideoOutput.errorCode != 0) {
    console.error(TAG + "canAddVideoOutput FAILED" + canAddVideoOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddVideoOutput: " + canAddVideoOutput.isAddVideoOutput);
  if (!canAddVideoOutput.isAddVideoOutput) {
    console.error(TAG + "addVideoOutput FAILED");
  } else {
    let addVideoOutput = cameraObj.sessionAddVideoOutput();
    if (addVideoOutput != 0) {
      console.error(TAG + "addVideoOutput FAILED" + addVideoOutput);
      expect().assertFail();
    }
  }
}

function isVideoMirrorSupported() {
  return cameraObj.isVideoMirrorSupported();
}

function enableVideoMirror() {
  let ret = cameraObj.enableVideoMirror(true);
  if (ret != 0) {
    console.error(TAG + "enableMirror FAILED" + ret);
    expect().assertFail();
  }
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function VideoMirrorTest() {
  describe('VideoMirrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      await sleep(3000);
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await getPhotoReceiverSurface();
      await getVideoSurfaceId();
      await sleep(10000);
      done();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (done: Function) => {
      releaseCamera();
      await sleep(300);
      done();
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputEnableMirror0100
     * @tc.name       : testOHVideoOutputEnableMirror0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_ENABLEMIRROR
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputEnableMirror0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      if (isVideoMirrorSupported()) {
        enableVideoMirror();
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHVideoOutputIsMirrorSupported0100
     * @tc.name       : testOHVideoOutputIsMirrorSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_VideoOutput_VideoOutputIsMirrorSupported
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHVideoOutputIsMirrorSupported0100', 0, () => {
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      createPhotoOutput();
      addPhotoOutput();
      createVideoOutput();
      addVideoOutput();
      let isSupported = isVideoMirrorSupported();
      console.info(TAG + "testOHVideoOutputIsMirrorSupported0100 isMirrorSupported:" + isSupported);
    })
  })
}
