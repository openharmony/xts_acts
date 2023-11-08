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
import MediaUtils from './MediaUtils';
import featureAbility from '@ohos.ability.featureAbility';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY} from '@ohos.UiTest'

const TAG = "CameraUnitTest: ";

let captureLocation = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}

let captureSetting = {
  quality: 2,
  rotation: 0,
  location: captureLocation,
  mirror: false
}

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
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
  },
  url: 'file:///data/media/CameraOutput.mp4',
  rotation: 0
}
let fd: number = -1

// 创建录像输出流

let surfaceId1
let cameraManager;
let cameraDevicesArray;
let captureSession;
let cameraInput;
let previewOutput;
let photoOutput;
let videoOutput;
let metadataOutput;
let videoSurfaceId;
let fdPath;
let fileAsset;
let fdNumber;
let receiver;

let mMetadataObjectTypeArray;
let mMetadataObjectArray;

export default function cameraJSUnitOutput() {

  async function getImageReceiverSurfaceId() {
    console.log(TAG + 'Entering create Image receiver')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Receiver is ok')
      surfaceId1 = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId1))
    } else {
      console.log(TAG + 'Receiver is not ok')
    }
  }

  async function createInput() {
    console.info(TAG + 'Enter createInput');
    let ret = cameraObj.createCameraInput();
    if (ret) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await cameraObj.cameraInputOpen();
    sleep(100);
    console.info(TAG + 'Exit createInput');
    return true;
  }

  async function getFd(pathName) {
    let displayName = pathName;
    const mediaTest = mediaLibrary.getMediaLibrary();
    console.log(TAG + 'mediaTest: ' + JSON.stringify(mediaTest))
    let fileKeyObj = mediaLibrary.FileKey;
    let mediaType = mediaLibrary.MediaType.VIDEO;
    let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
    let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
    console.log(TAG + 'dataUri id: ' + JSON.stringify(dataUri))
    if (dataUri != undefined) {
      let args = dataUri.id.toString();
      let fetchOp = {
        selections: fileKeyObj.ID + "=?",
        selectionArgs: [args],
      }
      let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
      fileAsset = await fetchFileResult.getAllObject();
      fdNumber = await fileAsset[0].open('Rw');
      console.log(TAG + 'fdNumber id: ' + JSON.stringify(fdNumber))
      fdPath = "fd://" + fdNumber.toString();
    }
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

  async function getvideosurface() {
    await getFd('CameraOutput.mp4');
    await sleep(2000);
    videoConfig.url = fdPath;
    media.createAVRecorder((err, recorder) => {
      if (!err) {
        console.info(TAG + 'createVideoRecorder called')
        videoRecorder = recorder
        console.info(TAG + 'videoRecorder is :' + JSON.stringify(videoRecorder))
        console.info(TAG + 'videoRecorder.prepare called.')
        videoRecorder.prepare(videoConfig, (err) => {
          if (!err) {
            console.info(TAG + 'videoRecorder.prepare success.')
            videoRecorder.getInputSurface((err, id) => {
              console.info(TAG + 'getInputSurface called')
              if (!err) {
                videoSurfaceId = id
                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(videoSurfaceId))
              } else {
                console.info(TAG + 'getInputSurface FAILED')
              }
            })
          } else {
            console.info(TAG + 'prepare FAILED')
          }
        })
      }
      else {
        console.info(TAG + 'createVideoRecorder FAILED ,Code' + err.code)
      }
    })
  }

  async function release() {
    console.log(TAG + "start release");
    await cameraObj.sessionRelease();
    console.log(TAG + "release end")
  }


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

  function getSupportedOutputCapabilityInPromise() {
    if (isEmpty(cameraManager)) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
      expect().assertFail();
      return undefined;
    }
    let outputCapabilityPromise = cameraObj.getSupportedOutputCapability();
    console.info("CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " + JSON.stringify(outputCapabilityPromise));
    expect(isEmpty(outputCapabilityPromise)).assertFalse();

    return outputCapabilityPromise;
  }

  async function getVideoSurfaceID(){
    videoRecorder = await media.createAVRecorder()
    fileAsset = await mediaUtil.createAndGetUri(mediaLibrary.MediaType.VIDEO)
    fd = await mediaUtil.getFdPath(fileAsset)
    console.info('getVideoSurfaceID fd : ' + fd);
    videoConfig.url = `fd://${fd}`
    videoConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
    console.info('getVideoSurfaceID videoConfig.videoSourceType : ' + videoConfig.videoSourceType);
    await videoRecorder.prepare(videoConfig)
    videoSurfaceId = await videoRecorder.getInputSurface()
    console.info('getVideoSurfaceIDvideoSurfaceId : ' + videoSurfaceId);
  }

  describe('cameraJSUnitOutput', function () {
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
    console.info(TAG + '----------cameraJSUnitOutput begin--------------')
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

      await getImageReceiverSurfaceId();
      await getVideoSurfaceID();
      sleep(2000);
      console.info('beforeAll case');
    })

    beforeEach(function () {
      sleep(1000);
      console.info('beforeEach case');
    })

    afterEach(async function () {

      console.info('afterEach case');
    })

    afterAll(function () {
      closeFd();
      release();
      console.info('afterAll case');
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100
      * @tc.name      : Create CameraManager instance async api
      * @tc.desc      : Create CameraManager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100--------------");
      if (isEmpty(cameraObj)) {
        console.info(TAG + "Entering GET_CAMERA_MANAGER cameraManager == null || undefined")
        expect().assertFail();
      } else {
        cameraManager = cameraObj.initCamera(globalThis.surfaceId);
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100
      * @tc.name      : Get camera from cameramanager to get array of camera async api
      * @tc.desc      : Get camera from cameramanager to get array of camera async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', 1, async function (done) {
      console.info("--------------GET_CAMERAS--------------");
      let cameraInfo = cameraObj.getSupportedCameras();

      if (isEmpty(cameraInfo)) {
        console.info(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
        expect().assertFail();
      } else {
        console.info(TAG + "Entering GET_CAMERAS data is not null || undefined");
        let cameraId = cameraInfo.cameraId;
        expect(isEmpty(cameraId)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS camera Id: " + cameraId);
        let cameraPosition = cameraInfo.cameraPosition;
        expect(isEmpty(cameraPosition)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS camera Position: " + cameraPosition);
        let cameraType = cameraInfo.cameraType;
        expect(isEmpty(cameraType)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS camera Type: " + cameraType);
        let connectionType = cameraInfo.connectionType
        expect(isEmpty(connectionType)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS connection Type: " + connectionType);

        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERAS PASSED");

      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 2, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");

      let ret = cameraObj.createCameraInput();
      if (ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
        expect().assertFail();
      }

      ret = cameraObj.cameraInputOpen();
      if (ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
        expect().assertFail();
      }

      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100")
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        let previewProfilesSize = cameraOutputCap.previewProfilesSize;
        if (isEmpty(previewProfilesSize)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 previewProfilesSize == null || undefined")
          expect(isEmpty(previewProfilesSize)).assertFalse();
        }
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100
      * @tc.name      : Create photoOutput instance async api
      * @tc.desc      : Create photoOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        let photoProfilesSize = cameraOutputCap.photoProfilesSize;
        if (isEmpty(photoProfilesSize)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 photoProfilesSize == null || undefined")
          expect().assertFalse();
        }
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100
      * @tc.name      : Create videoOutput instance api
      * @tc.desc      : Create videoOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesSize = cameraOutputCap.videoProfilesSize;
        expect(isEmpty(videoProfilesSize)).assertFalse();

      }
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Create metadataOutput instance api
      * @tc.desc      : Create metadataOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let metadataProfilesSize = cameraOutputCap.metadataProfilesSize;
        if (isEmpty(metadataProfilesSize)) {
          console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 end with metadataProfilesSize is null");
        }
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100
      * @tc.name      : Create CaptureSession instance api
      * @tc.desc      : Create CaptureSession instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_0100', 1, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100")
        let ret = cameraObj.createSession();
        if (ret) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 data is empty");
          expect().assertFalse();
        }
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100
      * @tc.name      : captureSession beginConfig
      * @tc.desc      : captureSession beginConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100--------------");
      let ret = cameraObj.sessionBegin();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 sessionBegin fail")
        expect().assertFail();
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100
      * @tc.name      : captureSession addInput
      * @tc.desc      : captureSession addInput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100--------------");
      let ret = cameraObj.sessionAddInput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 sessionAddInput fail")
        expect().assertFail();
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession add previewOutput
      * @tc.desc      : captureSession add previewOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100--------------");
      await cameraObj.createPreviewOutput();
      let ret = cameraObj.sessionAddPreviewOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100 sessionAddPreviewOutput fail")
        expect().assertFail();
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession add photoOutput
      * @tc.desc      : captureSession add photoOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100--------------");
      cameraObj.createPhotoOutput(surfaceId1);
      let ret = cameraObj.sessionAddPhotoOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 csessionAddPhotoOutput fail")
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100
     * @tc.name      : captureSession remove photoOutput
     * @tc.desc      : captureSession remove photoOutput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100--------------");
      cameraObj.createVideoOutput(videoSurfaceId);
      let ret = cameraObj.sessionAddVideoOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 sessionAddVideoOutput fail")
        expect().assertFail();
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession add metadataOutput
      * @tc.desc      : captureSession add metadataOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100--------------");
      cameraObj.createMetadataOutput();
      let ret = await cameraObj.sessionAddMetadataOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 sessionAddMetadataOutput fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100
      * @tc.name      : captureSession commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100--------------");
      let ret = await cameraObj.sessionCommitConfig();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 sessionCommitConfig fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100--------------");
      let ret = cameraObj.metadataOutputStart();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 metadataOutputStart fail")
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Stop metadataOutput type async api
      * @tc.desc      : Stop metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100--------------");
      let ret = cameraObj.metadataOutputStop();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 metadataOutputStop fail")
      }
      await sleep(1000);
      done();
    })

    /**
       * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100
       * @tc.name      : Create previewOutput instance promise api
       * @tc.desc      : Create previewOutput instance promise api
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100--------------");
      let ret = cameraObj.previewOutputStart();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 previewOutputStart fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100
      * @tc.name      : Create previewOutput instance promise api
      * @tc.desc      : Create previewOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100--------------");
      let ret = cameraObj.previewOutputStop();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 previewOutputStop fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100
     * @tc.name      : videoOutput start promise api
     * @tc.desc      : videoOutput start promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100--------------");
      let ret = cameraObj.videoOutputStart();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 videoOutputStart fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100
     * @tc.name      : videoOutput stop promise api
     * @tc.desc      : videoOutput stop promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100--------------");
      let ret = cameraObj.videoOutputStop();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 videoOutputStop fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100
      * @tc.name      : preview output callback on frameStart api
      * @tc.desc      : preview output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      let ret = cameraObj.createPreviewOutput(); //test PreviewOutputRegisterCallback onFrameStart
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 PreviewOutputRegisterCallback fail")
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
      * @tc.name      : preview output callback on frameEnd api
      * @tc.desc      : preview output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      let ret = cameraObj.createPreviewOutput(); //test PreviewOutputRegisterCallback onFrameEnd
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 PreviewOutputRegisterCallback fail")
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100
      * @tc.name      : preview output callback on frameEnd api
      * @tc.desc      : preview output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      let ret = cameraObj.createPreviewOutput(); //test PreviewOutputRegisterCallback onError
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 PreviewOutputRegisterCallback fail")
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100
      * @tc.name      : photoOutput capture with promise mode
      * @tc.desc      : photoOutput capture with promise mode
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100--------------");
      try {
        await cameraObj.photoOutputCapture();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
      * @tc.name      : photo output callback on captureStart
      * @tc.desc      : photo output callback on captureStart
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100--------------");
      cameraObj.initCamera(globalThis.surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability()
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1);//test PhotoOutputRegisterCallback onFrameStart

      if (ret) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START createPhotoOutput fail")
        expect().assertFail();
      } else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100
      * @tc.name      : photo output callback on frameShutter
      * @tc.desc      : photo output callback on frameShutter
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100--------------");
      cameraObj.initCamera(globalThis.surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability()
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onFrameShutter

      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 createPhotoOutput fail")
        expect().assertFail();
      } else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100
      * @tc.name      : photo output callback on captureEnd
      * @tc.desc      : photo output callback on captureEnd
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100--------------");
      cameraObj.initCamera(globalThis.surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability()
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onFrameEnd

      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 createPhotoOutput fail")
        expect().assertFail();
      } else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100
      * @tc.name      : photo output callback on error
      * @tc.desc      : photo output callback on error
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      cameraObj.initCamera(globalThis.surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability()
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onError

      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 createPhotoOutput fail")
        expect().assertFail();
      } else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100--------------");
      let ret = cameraObj.photoOutputRelease();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 photoOutputRelease fail")
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100
      * @tc.name      : Start metadataOutput sync api
      * @tc.desc      : Start metadataOutput sync api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100--------------");
      try {
        await cameraObj.metadataOutputStart();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100
      * @tc.name      : Stop metadataOutput sync api
      * @tc.desc      : Stop metadataOutput aync api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100--------------");
      try {
        await cameraObj.metadataOutputStop();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
      await sleep(1000);
      done();
    })
  })
}