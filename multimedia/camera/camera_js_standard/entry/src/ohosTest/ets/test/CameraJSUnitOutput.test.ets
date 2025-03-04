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
import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const TAG = "CameraUnitTest: ";

let context = getContext();
let captureLocation: cameraObj.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}

let captureSetting: cameraObj.PhotoCaptureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
  rotation: cameraObj.ImageRotation.ROTATION_0,
  location: captureLocation,
  mirror: false
}

// 创建视频录制的参数
let videoProfile: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
}

let videoConfig: media.AVRecorderConfig = {
  audioSourceType: 1,
  videoSourceType: 0,
  profile: videoProfile,
  url: 'file:///data/media/CameraOutput.mp4',
  location: { latitude: 30, longitude: 130 } as cameraObj.Location,
  rotation: 0
}

// 创建录像输出流
let AVRecorder: media.AVRecorder;
let surfaceId: string;
let cameraManager: cameraObj.CameraManager;
let cameraDevicesArray: Array<cameraObj.CameraDevice>;
let captureSession: cameraObj.CaptureSession;
let cameraSession: cameraObj.Session;
let cameraInput: cameraObj.CameraInput;
let previewOutput: cameraObj.PreviewOutput;
let photoOutput: cameraObj.PhotoOutput;
let videoOutput: cameraObj.VideoOutput;
let metadataOutput: cameraObj.MetadataOutput;
let videoSurfaceId: string;
let receiver: image.ImageReceiver;
let videoProfilesArray: Array<cameraObj.VideoProfile>;

let mMetadataObjectTypeArray: Array<cameraObj.MetadataObjectType> | undefined;
let mMetadataObjectArray: Array<cameraObj.MetadataObject>;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface GeneratedObjectLiteralInterface {
  latitude: number;
  longitude: number;
  altitude: number;
}

let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];

let power: ESObject;

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(1000)
}

let isEmpty = (data: ESObject) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

// 创建input参数为cameraDevice的下标
let createInput = async (index: number) => {
  cameraInput = cameraManager.createCameraInput(cameraDevicesArray[index]);
  if (!isEmpty(cameraInput)) {
    await cameraInput.open();
  }
}

// 创建Output参数为cameraDevice的下标、相机模式
let createOutput = (index: number, mode: number) => {
  let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[index], mode);
  previewOutput = cameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
  if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
    videoProfilesArray = cameraOutputCap.videoProfiles;
    console.log(`videoProfilesArray:  + ${JSON.stringify(videoProfilesArray)}`)
  } else {
    photoOutput = cameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
    console.log(TAG + `Receiver is ok + ${JSON.stringify(photoOutput)}`)
  }
}

// 创建Session对象参数为相机模式
let createPhotoSession = (mode: number) => {
  cameraSession = cameraManager.createSession(mode);
  cameraSession.beginConfig();
}

// 释放相机资源
let stopCameraSession = async () => {
  cameraSession.beginConfig();
  if (!isEmpty(cameraInput)) {
    cameraSession.removeInput(cameraInput);
    await cameraInput.close();
  }
  if (!isEmpty(previewOutput)) {
    cameraSession.removeOutput(previewOutput);
    await previewOutput.release();
  }
}

// 添加相机流参数为cameraDevice的下标、相机模式
let addCommit = async (i: number, mode: number) => {
  await createInput(i);
  createOutput(i, mode);
  if (cameraInput) {
    cameraSession.addInput(cameraInput);
  }
  if (previewOutput) {
    cameraSession.addOutput(previewOutput);
  }
  if (photoOutput) {
    cameraSession.addOutput(photoOutput);
  }
}

// 获取相机列表
let getCameraDevices = () => {
  cameraManager = cameraObj.getCameraManager(context);
  sleep(1000);
  cameraDevicesArray = cameraManager.getSupportedCameras();
  console.log(`cameraDevicesArray:  + ${JSON.stringify(cameraDevicesArray)}`)

  let sceneModes: Array<cameraObj.SceneMode> = cameraManager.getSupportedSceneModes(cameraDevicesArray[0]);
  console.log(`supportedSceneModes:  + ${JSON.stringify(sceneModes)}`)
}


export default function cameraJSUnitOutput() {

  let getImageReceiverSurfaceId = async () => {
    console.log(TAG + 'Entering create Image receiver')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Receiver is ok')
      surfaceId = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId))
    } else {
      console.log(TAG + 'Receiver is not ok')
    }
  }

  let file: ESObject;
  let fdNumber: number;
  let fdPath: string;

  let getFd = async (pathName: string) => {
    let fileDir: ESObject = await await AppStorage.get('pathDir');
    pathName = fileDir + '/' + pathName;
    file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdNumber = file.fd;
    fdPath = "fd://" + fdNumber.toString();
    console.info('case getFd number is: ' + fdNumber);
  }

  let closeFd = async () => {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }

  let getVideoSurface = async () => {
    await getFd('CameraManager.mp4');
    await sleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    let errs = await AVRecorder.prepare(videoConfig);
    console.log(`${TAG} getSurfaceId start 3 ${JSON.stringify(errs)} `);
    videoSurfaceId = await AVRecorder.getInputSurface();
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let release = async () => {
    console.log(TAG + "start release");
    await AVRecorder!.release();
    AVRecorder = null!;
    await captureSession.release();
    console.log(TAG + "release end")
  }

  let getSupportedOutputCapabilityInPromise = (cameraDevice: cameraObj.CameraDevice, mode: cameraObj.SceneMode) => {
    if (isEmpty(cameraManager)) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
      expect().assertFail();
      return undefined;
    }
    let outputCapabilityPromise = cameraManager.getSupportedOutputCapability(cameraDevice, mode);
    console.info("CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " +
    JSON.stringify(outputCapabilityPromise));
    expect(isEmpty(outputCapabilityPromise)).assertFalse();

    return outputCapabilityPromise;
  }


  let startSession = async (i: number, mode: number) => {
    // 创建相机
    getCameraDevices()
    // 创建输出流
    createOutput(i, mode)
    // 配置录制参数, 获取 videoSurfaceId
    await getVideoSurface();
    console.info('videoSurfaceId: ' + videoSurfaceId)
    // 创建VideoOutput对象
    videoOutput = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
    //创建会话
    createPhotoSession(mode)
    // 配置会话
    createInput(i);
    if (cameraInput) {
      cameraSession.addInput(cameraInput);
    }
    if (previewOutput) {
      cameraSession.addOutput(previewOutput);
    }
    if (videoOutput) {
      cameraSession.addOutput(videoOutput);
    }
    cameraSession.commitConfig();
    cameraSession.start();
}