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
import media from '@ohos.multimedia.media'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

const TAG = "CameraUnitTest: ";

let captureLocation = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}
let captureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
  rotation: cameraObj.ImageRotation.ROTATION_0,
  location: captureLocation,
  mirror: false
}

// 创建视频录制的参数
let videoProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: 'audio/mp4a-latm',
  audioSampleRate: 48000,
  fileFormat: 'mp4',
  videoBitrate: 48000,
  videoCodec: 'video/mp4v-es',
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
}

let videoConfig = {
  audioSourceType: 1,
  videoSourceType: 0,
  profile: videoProfile,
  url: 'file:///data/media/CameraOutput.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 },
  maxSize: 100,
  maxDuration: 500
}

// 创建录像输出流
let videoRecorder

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

let mMetadataObjectTypeArray;
let mMetadataObjectArray;

export default function cameraJSUnitOutput(surfaceId: any) {

  async function getImageReceiverSurfaceId() {
    console.log(TAG + 'Entering create Image receiver')
    var receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Receiver is ok')
      surfaceId1 = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId1))
    } else {
      console.log(TAG + 'Receiver is not ok')
    }
  }

  async function getFd(pathName) {
    let displayName = pathName;
    const mediaTest = mediaLibrary.getMediaLibrary();
    let fileKeyObj = mediaLibrary.FileKey;
    let mediaType = mediaLibrary.MediaType.VIDEO;
    let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
    let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
    if (dataUri != undefined) {
      let args = dataUri.id.toString();
      let fetchOp = {
        selections: fileKeyObj.ID + "=?",
        selectionArgs: [args],
      }
      let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
      fileAsset = await fetchFileResult.getAllObject();
      fdNumber = await fileAsset[0].open('Rw');
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
      videoConfig.url = fdPath;
    media.createVideoRecorder((err, recorder) => {
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
        console.info(TAG + 'createVideoRecorder FAILED')
      }
    })
  }

  async function release() {
    console.log(TAG + "start release");
    await cameraInput.release();
    await captureSession.release();
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

  async function applyPermission() {
    let appInfo = await bundle.getApplicationInfo('com.open.harmony.multimedia.cameratest', 0, 100);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
      let tokenID = appInfo.accessTokenId;
      console.info('[permission] case accessTokenID is ' + tokenID);
      let permissionName1 = 'ohos.permission.CAMERA';
      let permissionName2 = 'ohos.permission.MICROPHONE';
      let permissionName3 = 'ohos.permission.MEDIA_LOCATION';
      let permissionName4 = 'ohos.permission.READ_MEDIA';
      let permissionName5 = 'ohos.permission.WRITE_MEDIA';
      let permissionName6 = 'ohos.permission.START_ABILIIES_FROM_BACKGROUND';
      let permissionName7 = 'ohos.permission.START_INVISIBLE_ABILITY';
      let permissionName8 = 'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION';
      await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName3, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName4, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName5, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName6, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName7, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
      await atManager.grantUserGrantedPermission(tokenID, permissionName8, 1).then((result) => {
        console.info('[permission] case grantUserGrantedPermission success :' + result);
      }).catch((err) => {
        console.info('[permission] case grantUserGrantedPermission failed :' + err);
      });
    } else {
      console.info('[permission] case apply permission failed, createAtManager failed');
    }
  }

  function getSupportedOutputCapabilityInPromise(cameraDevice) {
    if (isEmpty(cameraManager)) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
      expect().assertFail();
      return undefined;
    }
    let outputCapabilityPromise = cameraManager.getSupportedOutputCapability(cameraDevice);
    console.info("CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " + JSON.stringify(outputCapabilityPromise));
    expect(isEmpty(outputCapabilityPromise)).assertFalse();

    return outputCapabilityPromise;
  }

  describe('cameraJSUnitOutput', function () {
    console.info(TAG + '----------cameraJSUnitOutput begin--------------')

    beforeAll(async function () {
      await applyPermission();
      await getImageReceiverSurfaceId();
      await getvideosurface();
      console.info('beforeAll case');
    })

    beforeEach(function () {
      sleep(5000);
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
        cameraObj.getCameraManager(null, async (err, data) => {
          if (!err) {
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering GET_CAMERA_MANAGER success");
            cameraManager = data;
          } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_CAMERA_MANAGER FAILED: " + err.message);
          }
          console.info(TAG + "Entering GET_CAMERA_MANAGER ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering GET_CAMERAS cameraManager == null || undefined")
        expect().assertFail();
      }
      cameraManager.getSupportedCameras(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_CAMERAS success");
          if (isEmpty(data)) {
            expect().assertFail();
            console.info(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
          } else {
            console.info(TAG + "Entering GET_CAMERAS data is not null || undefined");
            cameraDevicesArray = data;
            if (cameraDevicesArray != null && cameraDevicesArray.length > 0) {
              for (let i = 0; i < cameraDevicesArray.length; i++) {
                // Get the variables from camera object
                let cameraId = cameraDevicesArray[i].cameraId;
                expect(isEmpty(cameraId)).assertFalse();
                console.info(TAG + "Entering GET_CAMERAS camera" + i + "Id: " + cameraId);
                let cameraPosition = cameraDevicesArray[i].cameraPosition;
                expect(isEmpty(cameraPosition)).assertFalse();
                console.info(TAG + "Entering GET_CAMERAS camera" + i + "Position: " + cameraPosition);
                let cameraType = cameraDevicesArray[i].cameraType;
                expect(isEmpty(cameraType)).assertFalse();
                console.info(TAG + "Entering GET_CAMERAS camera" + i + "Type: " + cameraType);
                let connectionType = cameraDevicesArray[i].connectionType
                expect(isEmpty(connectionType)).assertFalse();
                console.info(TAG + "Entering GET_CAMERAS connection" + i + "Type: " + connectionType);
              }
              expect(true).assertTrue();
              console.info(TAG + "Entering GET_CAMERAS PASSED");
            }
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering GET_CAMERAS FAILED: " + err.message);
        }
        console.info(TAG + "Entering GET_CAMERAS ends here");
        await sleep(1000);
        done();
      })
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100', 2, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT cameraManager == null || undefined")
        expect().assertFail();
      } else {
        cameraInput = await cameraManager.createCameraInput(cameraDevicesArray[0]);
        if (isEmpty(cameraInput)) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100 FAILED");
        }
        cameraInput.open(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100 open callback");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100")
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        let previewProfilesArray = cameraOutputCap.previewProfiles;
        if (isEmpty(previewProfilesArray)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 previewProfilesArray == null || undefined")
          expect(isEmpty(previewProfilesArray)).assertFalse();
        }
        cameraManager.createPreviewOutput(previewProfilesArray[0], surfaceId, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 success");
            previewOutput = data;
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        let photoProfilesArray = cameraOutputCap.photoProfiles;
        if (isEmpty(photoProfilesArray)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 previewProfilesArray == null || undefined")
          expect().assertFalse();
        }
        photoOutput = await cameraManager.createPhotoOutput(photoProfilesArray[0], surfaceId1);
        if (isEmpty(photoOutput)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 data is empty");
          expect().assertFalse();
        }
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100
      * @tc.name      : Create videoOutput instance async api
      * @tc.desc      : Create videoOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 camera:" + cameraDevicesArray[0].cameraId);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap.videoProfiles;
        expect(isEmpty(videoProfilesArray)).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 start createVideoOutput")
        cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 success");
            videoOutput = data;
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Create metadataOutput instance async api
      * @tc.desc      : Create metadataOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 camera:" + cameraDevicesArray[0].cameraId);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        mMetadataObjectTypeArray = cameraOutputCap.supportedMetadataObjectTypes;
        if (isEmpty(mMetadataObjectTypeArray)) {
          console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 end with mMetadataObjectTypeArray is null");
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 start createMetadataOutput")
          cameraManager.createMetadataOutput(mMetadataObjectTypeArray, async (err, data) => {
            if (!err) {
              if (!isEmpty(data)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 success");
                metadataOutput = data;
              } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100, data == null || undefined");
                expect().assertFail();
              }
              
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
              expect().assertFail();
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
          })
        }
      }
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100")
        cameraManager.createCaptureSession(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering createCaptureSession is not error");
            expect(isEmpty(data)).assertFalse();
            captureSession = data;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 PASSED");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 FAILED : " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.beginConfig(async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addInput(cameraInput, async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(previewOutput)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
          expect().assertFail();
        }
        captureSession.addOutput(previewOutput, async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(photoOutput)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 photoOutput == null || undefined")
          expect().assertFail();
        }
        console.info(TAG + "captureSession start add photoOutput")
        captureSession.addOutput(photoOutput, async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addOutput(videoOutput, async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
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
     it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addOutput(metadataOutput, async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.commitConfig(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.on('metadataObjectsAvailable', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 success");
            mMetadataObjectArray = data;
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
        })

      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100
      * @tc.name      : captureSession start
      * @tc.desc      : captureSession start
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100 mMetadataObjectArray == null || undefined")
      } else {
        mMetadataObjectArray[0].getType(async (err, data) => {
          if (!err) {
            if (!isEmpty(data)) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100 success, data : " + data);
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100 FAILED, data == null || undefined");
              expect().assertFail();
            }
            
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_CALLBACK_0100 ends here");
          await sleep(1000);
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let type = mMetadataObjectArray[0].getType().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 failed :' + err);
          expect().assertFail();
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 success, type : " + type);
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100
      * @tc.name      : Start metadataOutput timestamp async api
      * @tc.desc      : Start metadataOutput timestamp async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100 mMetadataObjectArray == null || undefined")
      } else {
        mMetadataObjectArray[0].getTimestamp(async (err, data) => {
          if (!err) {
            if (!isEmpty(data)) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100 success, data : " + data);
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100 FAILED, data == null || undefined");
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_CALLBACK_0100 ends here");
          await sleep(1000);
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100
      * @tc.name      : Start metadataOutput timestamp async api
      * @tc.desc      : Start metadataOutput timestamp async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let timeStamp = mMetadataObjectArray[0].getTimestamp().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 failed :' + err);
          expect().assertFail();
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 success, timeStamp : " + timeStamp);
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100
      * @tc.name      : Start metadataOutput bounding box async api
      * @tc.desc      : Start metadataOutput bounding box async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100 mMetadataObjectArray == null || undefined")
      } else {
        mMetadataObjectArray[0].getBoundingBox(async (err, data) => {
          if (!err) {
            if (!isEmpty(data)) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100 success, data : " + data);
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100 FAILED, data == null || undefined");
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })

      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100
      * @tc.name      : Start metadataOutput bounding box async api
      * @tc.desc      : Start metadataOutput bounding box async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let boundingBox = mMetadataObjectArray[0].getBoundingBox().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 failed :' + err);
          expect().assertFail();
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success, boundingBox : " + boundingBox.width + "x" + boundingBox.height);
	console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success, boundingBox : " + boundingBox.topLeftX + "x" + boundingBox.topLeftY);
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
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 start")
        previewOutput.start();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 end")
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
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 start")
        previewOutput.stop();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 end")
      }
      await sleep(1000);
      done();
    })




    /**
       * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100
       * @tc.name      : Create previewOutput instance async api
       * @tc.desc      : Create previewOutput instance async api
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        previewOutput.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        previewOutput.stop(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        previewOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
      }
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
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
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
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        previewOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100
      * @tc.name      : check photoOutput is mirror supported with promise mode
      * @tc.desc      : check photoOutput is mirror supported with promise mode
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        let isMirrorSupportedFlag = await photoOutput.isMirrorSupported().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 success :' + result);
        }).catch((err) => {
            console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 failed :' + err);
            expect().assertFail();
        });

        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 isMirrorSupportedFlag = ' + isMirrorSupportedFlag);
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100
      * @tc.name      : check photoOutput is mirror supported with callback mode
      * @tc.desc      : check photoOutput is mirror supported with callback mode
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.isMirrorSupported(async (err, data) => {
          if (!err) {
            if (!isEmpty(data)) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100 success, data = " + data);
              expect(true).assertTrue();
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100 FAILED, data == null || undefined");
              expect().assertFail();
            }
            
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
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
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        await photoOutput.capture().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 success :' + result);
        }).catch((err) => {
            console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 failed :' + err);
            expect().assertFail();
        });
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
     it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.quality = ' + captureSetting.quality);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.rotation = ' + captureSetting.rotation);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.latitude = ' + captureSetting.location.latitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.longitude = ' + captureSetting.location.longitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.altitude = ' + captureSetting.location.altitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.mirror = ' + captureSetting.mirror);

        await photoOutput.capture(captureSetting).then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 success :' + result);
        }).catch((err) => {
            console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 failed :' + err);
        });
        
      }
      await sleep(1000);
      done();
    })

    

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(captureSetting, async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 to operate");
        photoOutput.on('captureStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
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
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 to operate");
        photoOutput.on('frameShutter', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, captureId = " + data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, timestamp = " + data.timestamp);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
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
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 to operate");
        photoOutput.on('captureEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, captureId = " + data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, frameCount = " + data.frameCount);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
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
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        photoOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
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
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.release(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
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
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 start")
        videoOutput.start();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 end")
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
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 start")
        videoOutput.stop();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 end")
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
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 ends here");
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
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100
      * @tc.name      : videoOutput start async api
      * @tc.desc      : videoOutput start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        videoOutput.start(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100
      * @tc.name      : videoOutput stop async api
      * @tc.desc      : videoOutput stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        videoOutput.stop(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100
      * @tc.name      : video output callback on frameStart api
      * @tc.desc      : video output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        videoOutput.on('frameStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100
      * @tc.name      : video output callback on frameEnd api
      * @tc.desc      : video output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        videoOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100
      * @tc.name      : video output callback on error api
      * @tc.desc      : video output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 to operate");
        videoOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })
  })

}