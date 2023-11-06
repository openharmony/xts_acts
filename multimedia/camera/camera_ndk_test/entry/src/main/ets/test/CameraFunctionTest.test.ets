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

import MediaUtils from './MediaUtils';
import cameraObj from 'libentry.so';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import featureAbility from '@ohos.ability.featureAbility';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

// 创建视频录制的参数
let mediaUtil = MediaUtils.getInstance()
let videoRecorder: media.AVRecorder = undefined
let videoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 512000,
    videoCodec: media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: 1920,
    videoFrameHeight: 1080,
    videoFrameRate: 30
  },
  url: 'file:///data/media/CameraOutput.mp4',
  rotation: 0
}
let fd: number = -1

let photoSettings = {
  quality: 0,          // 拍照质量
  rotation: 0,         // 照片方向
  mirror: false,       // 镜像使能
  latitude: 12.9698,   // 地理位置
  longitude: 77.7500,  // 地理位置
  altitude: 1000       // 地理位置
};

const TAG = "CameraFunctionTest: ";

// 创建录像输出流

let mCameraManager;
let cameraOutputCap;
let mCameraDevicesArray;
let mCameraSession;
let mCameraNum;
let mCameraInput;
let mPreviewOutput;
let mPhotoSurface;
let mPhotoOutput;
let mVideoOutput;
let mVideoRecorder;
let mVideoSurfaceId;
let fdPath;
//let fileAsset1: mediaLibrary.FileAsset = undefined;
let fileAsset: mediaLibrary.FileAsset = undefined;
let fdNumber;
let metadataOutput;
let mMetadataObjectTypeArray;
let receiver;
let ret;
let dataUri;
let num: number = 0

export default function CameraFunctionTest() {

  function sleep(ms) {
    console.info(TAG + "Entering sleep -> Promise constructor");
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  function isEmpty(data) {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
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

  async function closeFd() {
    if (fileAsset != null) {
      await fileAsset[0].close(fdNumber).then(() => {
        console.info('[mediaLibrary] case close fd success');
      }).catch((err) => {
        console.info('[mediaLibrary] case close fd failed');
      });
    } else {
      console.info('[mediaLibrary] case fileAsset is null');
    }
  }

  async function getVideoSurfaceID(){
    videoRecorder = await media.createAVRecorder()
    console.info('getVideoSurfaceID videoRecorder : ' + videoRecorder);

    fileAsset = await mediaUtil.createAndGetUri(mediaLibrary.MediaType.VIDEO)
    fd = await mediaUtil.getFdPath(fileAsset)
    console.info('getVideoSurfaceID fd : ' + fd);
    videoConfig.url = `fd://${fd}`
    videoConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
    console.info('getVideoSurfaceID videoConfig.videoSourceType : ' + videoConfig.videoSourceType);
    await videoRecorder.prepare(videoConfig)
    mVideoSurfaceId = await videoRecorder.getInputSurface()
    console.info('getVideoSurfaceID mVideoSurfaceId : ' + mVideoSurfaceId);
  }

  async function getCameraManagerInstance() {
    let ret = cameraObj.initCamera(globalThis.surfaceId);
    if (ret) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info(TAG + 'Exit getCameraManagerInstance');
    return true;
  }

  function getCameraSupportDevicesArray() {
    console.info(TAG + 'Enter getCameraSupportDevicesArray');
    ret = cameraObj.getSupportedCameras();
    return true;
  }

  async function createInput() {
    console.info(TAG + 'Enter createInput');
    ret = cameraObj.createCameraInput();
    if (ret) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await cameraObj.cameraInputOpen();
    sleep(100);
    console.info(TAG + 'Exit createInput');
    return true;
  }

  async function releaseInput() {
    console.info(TAG + 'Enter releaseInput');
    await cameraObj.cameraInputClose();
    console.info(TAG + 'Exit releaseInput');

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
    try {
      ret = cameraObj.createSession();
    }
    catch {
      console.info(TAG + 'createCaptureSession FAILED');
    }
    if (ret) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }
    beginCameraSessionConfig();
    console.info(TAG + 'Exit createCameraSessionInstance');
    return true;
  }

  function releaseCameraSessionInstance() {
    cameraObj.sessionRelease();
  }

  async function releaseVideoReceiveSurface() {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    mVideoRecorder.release((err) => {
      console.info(TAG + 'Entering release video receiver')
    })
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  function createPreviewOutput() {
    console.info(TAG + 'Enter createPreviewOutput');
    ret = cameraObj.createPreviewOutput();

    if (ret) {
      console.info(TAG + "createPreviewOutput FAILED");
    }
    console.info(TAG + "createPreviewOutput: " + ret);
    console.info(TAG + 'Exit createPreviewOutputs');
    return true;
  }

  function createPhotoOutput(mPhotoSurface) {
    console.info(TAG + 'Enter createPhotoOutput');
    let capability = cameraObj.getSupportedOutputCapability();
    ret = cameraObj.createPhotoOutput(mPhotoSurface);

    if (ret) {
      console.info(TAG + "createPhotoOutput FAILED");
    }
    console.info(TAG + "createPhotoOutput: " + ret);
    console.info(TAG + 'Exit createPhotoOutput');
    return true;
  }

  function createVideoOutput(mVideoSurfaceId) {
    let capability = cameraObj.getSupportedOutputCapability();
    ret = cameraObj.createVideoOutput(mVideoSurfaceId);

    if (ret) {
      console.info(TAG + "createVideoOutput FAILED");
    }
    console.info(TAG + "createVideoOutput: " + ret);
    console.info(TAG + 'Exit createPhotoOutput');
    return true;
  }

  function createMetadataOutput() {
    console.info(TAG + 'Enter createMetadataOutput');
    let capability = cameraObj.getSupportedOutputCapability();
    cameraObj.createMetadataOutput();

    console.info(TAG + 'Exit createMetadataOutput');
    return true;
  }

  async function commitCameraSessionConfig() {
    console.info(TAG + 'Enter commitCameraSessionConfig');
    await cameraObj.sessionCommitConfig();
    sleep(500);
    console.info(TAG + 'Exit commitCameraSessionConfig');
    return true;
  }

  describe('CameraFunctionTest', function () {
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
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
    console.info(TAG + '-------------CameraFunctionTest--------------');
    beforeAll(async function () {
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
      cameraObj.getSupportedOutputCapability();
      console.info(TAG + 'beforeAll case');
    })

    beforeEach(function () {
      sleep(1000);
      console.info('beforeEach case');
    })

    afterEach(async function () {
      console.info('afterEach case');
    })

    afterAll(function () {
      releaseVideoReceiveSurface();
      sleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PREVIEW
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PREVIEW', 0, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PREVIEW--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPreviewOutput();
      cameraObj.sessionAddPreviewOutput();
      await commitCameraSessionConfig();
      try {
        await cameraObj.previewOutputStart();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PREVIEW FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      ;
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PREVIEW ends here");
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_001
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_001', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPhotoOutput(mPhotoSurface);
      cameraObj.sessionAddPhotoOutput();
      await commitCameraSessionConfig();
      try {
        await cameraObj.photoOutputCapture();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO ends here");
      await sleep(1000);
      let status =await cameraObj.getCameraCallbackCode();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_002
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_002', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_002--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPhotoOutput(mPhotoSurface);
      cameraObj.sessionAddPhotoOutput();
      await commitCameraSessionConfig();
      try {
        await cameraObj.takePictureWithSettings(photoSettings);
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_002 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FUNCTION_SINGLE_PHOTO_002 ends here");
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPreviewOutput();
      createPhotoOutput(mPhotoSurface);
      cameraObj.sessionAddPhotoOutput();
      cameraObj.sessionAddPreviewOutput();
      await commitCameraSessionConfig();
      await cameraObj.previewOutputStart();
      try {
        await cameraObj.photoOutputCapture();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_001 ends here");
      await sleep(10000);
      cameraObj.previewOutputStop();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002--------------");
      await createInput();
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createPhotoOutput(mPhotoSurface);
      cameraObj.sessionAddPhotoOutput();
      createPreviewOutput();
      cameraObj.sessionAddPreviewOutput();
      await commitCameraSessionConfig();
      await cameraObj.previewOutputStart();
      try {
        await cameraObj.takePictureWithSettings(photoSettings);
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002 ends here");
      await sleep(10000);
      cameraObj.previewOutputStop();
      done();
    })
  })
}