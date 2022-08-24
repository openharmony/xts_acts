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

import cameraObj from '@ohos.multimedia.camera'
import media from '@ohos.multimedia.media'
import image from '@ohos.multimedia.image';
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import fileio from '@ohos.fileio';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

let TAG = 'CameraModuleTest: '
var cameraManagerPromise
var camerasArrayPromise
var camera0InputPromise
var previewOutputPromise
var videoRecorder
var photoOutputPromise
let fdPath;
let fileAsset;
let fdNumber;

var minFrameRate_Grp0=12;
var maxFrameRate_Grp0=12;
var minFrameRate_Mix=14;
var maxFrameRate_Mix=15;
var minFrameRate_Err1=11;
var maxFrameRate_Err1=31;
var minFrameRate_Err2=14;
var maxFrameRate_Err2=28;
var minFrameRate_Err3=16;
var maxFrameRate_Err3=25;
var minFrameRate_Grp20=30;
var maxFrameRate_Grp20=30;

var Point1 = { x: 1, y: 1 }
var Point2 = { x: 2, y: 2 }
var Point3 = { x: 3, y: 3 }
var photosettings1 = {
  rotation: 0,
  quality: 0,
  location: {
    latitude: 12.9705,
    longitude: 77.7329,
    altitude: 920.0000,
  },
}
var photosettings2 = {
  rotation: 90,
  quality: 1,
  location: {
    latitude: 20,
    longitude: 78,
    altitude: 8586,
  },
}

var photosettings3 = {
  quality: 2,
  location: {
    latitude: 0,
    longitude: 0,
    altitude: 0,
  },
}
var photosettings4 = {
  rotation: 180,
  location: {
    latitude: -1,
    longitude: -1,
    altitude: -1,
  },
}

var photosettings5 = {
  rotation: 270,
}
let configFile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: 'audio/mp4a-latm',
  audioSampleRate: 48000,
  durationTime: 1000,
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
  profile: configFile,
  url: 'file:///data/media/01.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 },
  maxSize: 100,
  maxDuration: 500
}
var surfaceId1
var videoId
var videoOutputPromise
var captureSessionPromise

export default function cameraJSUnitVideoPromise(surfaceId: any) {

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

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve(1)
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
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
    } else {
      console.info('[permission] case apply permission failed, createAtManager failed');
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
    await getFd('01.mp4');
    videoConfig.url = fdPath;
    media.createVideoRecorder((err, recorder) => {
      console.info(TAG + 'createVideoRecorder called')
      videoRecorder = recorder
      console.info(TAG + 'videoRecorder is :' + JSON.stringify(videoRecorder))
      console.info(TAG + 'videoRecorder.prepare called.')
      videoRecorder.prepare(videoConfig, (err) => {
        console.info(TAG + 'videoRecorder.prepare success.')
      })
      videoRecorder.getInputSurface((err, id) => {
        console.info(TAG + 'getInputSurface called')
        videoId = id
        console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(videoId))
      })
    })
  }

  describe('VideoModePromise', function () {
    console.info(TAG + '----------Camera-VideoMode-Promise--------------')

    beforeAll(async function () {
      await applyPermission();
      console.info('beforeAll case');
    })

    beforeEach(function () {
      sleep(5);
      console.info('beforeEach case');
    })

    afterEach(async function () {
      await closeFd();
      console.info('afterEach case');
    })

    afterAll(function () {
      console.info('afterAll case');
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100', 0, async function (done) {
      console.info('--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100--------------')
      cameraManagerPromise = await cameraObj.getCameraManager(null)
      console.info(TAG + 'Entering Get cameraManagerPromise cameraManagerPromise: ' + cameraManagerPromise)
      if (cameraManagerPromise != null && cameraManagerPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 FAILED')
      }
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 ends here')
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100
      * @tc.name      : camera status callback on CameraManager async api
      * @tc.desc      : camera status callback on CameraManager async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100', 0, async function (done) {
      if (cameraManagerPromise == null || cameraManagerPromise == undefined) {
        console.info(TAG + 'Entering Camera status Callback cameraManagerPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 to operate')
        await sleep(1)
        cameraManagerPromise.on('cameraStatus', async (err, data) => {
          if (!err) {
            console.info(TAG + "Camera status Callback on cameraManagerPromise is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 CameraStatusInfo_Camera: " + data.camera);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 CameraStatusInfo_Status: " + data.status);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100', 0, async function (done) {
      console.info('--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100--------------')
      camerasArrayPromise = await cameraManagerPromise.getCameras()
      console.info(TAG + 'Entering Get Cameras Promise: ' + JSON.stringify(camerasArrayPromise))
      if (camerasArrayPromise != null && camerasArrayPromise.length > 0) {
        console.info(TAG + 'Entering Get Cameras Promise success')
        for (var i = 0; i < camerasArrayPromise.length; i++) {
          // Get the variables from camera object
          var cameraId = camerasArrayPromise[i].cameraId
          console.info(TAG + 'Entering Get Cameras Promise camera' + i + 'Id: ' + cameraId)
          var cameraPosition = camerasArrayPromise[i].cameraPosition
          console.info(TAG + 'Entering Get Cameras Promise camera' + i + 'Position: ' + cameraPosition)
          var cameraType = camerasArrayPromise[i].cameraType
          console.info(TAG + 'Entering Get Cameras Promise camera' + i + 'Type: ' + cameraType)
          var connectionType = camerasArrayPromise[i].connectionType
          console.info(TAG + 'Entering Get Cameras Promise connection' + i + 'Type: ' + connectionType)
        }
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 FAILED')
      }
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 ends here')
      await sleep(1)
      done()
    })

    /*CAMERA-0 Scripts*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 0, async function (done) {
      console.info('--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------')
      camera0InputPromise = await cameraManagerPromise.createCameraInput(camerasArrayPromise[0].cameraId)
      console.info(TAG + 'Entering Create camera input promise camera0InputPromise: ' + JSON.stringify(camera0InputPromise))
      if (camera0InputPromise != null && camera0InputPromise != undefined) {
        console.info(TAG + 'Entering Create camera input promise  camera0InputPromise is not null || undefined')
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED')
      }
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here')
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100
      * @tc.name      : Photo output callback on error api
      * @tc.desc      : Photo output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering Camera input error callback camera0InputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 to operate");
        camera0InputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "camera0InputPromise error callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_PROMISE_0100
      * @tc.name      : Create previewoutput promise api
      * @tc.desc      : Create previewoutput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_PROMISE_0100', 0, async function (done) {
      console.info('--------------SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_PROMISE_0100--------------')
      previewOutputPromise = await cameraObj.createPreviewOutput(surfaceId)
      console.info(TAG + 'Entering Create previewOutputPromise: ' + JSON.stringify(previewOutputPromise))
      if (previewOutputPromise != null && previewOutputPromise != undefined) {
        console.info(TAG + 'Entering Create previewOutputPromise is not null || undefined')
        expect(true).assertTrue();
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_PROMISE_0100 PASSED')
      } else {
        expect().assertFail();
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_PROMISE_0100 FAILED')
      }
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_PROMISE_0100 ends here')
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100
      * @tc.name      : FocusStateChange callback api
      * @tc.desc      : FocusStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering FocusStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100 to operate");
        camera0InputPromise.on('focusStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "FocusState callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current FocusState is : " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100
      * @tc.name      : ExposureStateChange callback api
      * @tc.desc      : ExposureStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering ExposureStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100 to operate");
        camera0InputPromise.on('exposureStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "ExposureStateChange callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current ExposureStateChange is: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100
      * @tc.name      : PreviewOutput callback onerror async api
      * @tc.desc      : PreviewOutput callback onerror async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + 'Entering PreviewOutputError callback  previewOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100 to operate')
        await sleep(1)
        previewOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_PROMISE_0100
      * @tc.name      : Create videooutput promise api
      * @tc.desc      : Create videooutput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_PROMISE_0100', 0, async function (done) {
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_PROMISE_0100 to operate')
      await getvideosurface()
      await sleep(2)
      videoOutputPromise = await cameraObj.createVideoOutput(videoId)
      console.info(TAG + 'Entering Create videoOutputPromise: ' + videoOutputPromise)
      if (videoOutputPromise != null && videoOutputPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_PROMISE_0100 PASSED')
      } else {
        expect().assertFail();
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_PROMISE_0100 FAILED')
      }
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_PROMISE_0100 ends here');
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100
      * @tc.name      : VideoOutput callback onerror async api
      * @tc.desc      : VideoOutput callback onerror async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100 videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100 to operate')
        await sleep(1)
        videoOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + 'VideoOutput Errorcallback is success')
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail()
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1)
          done()
        })
        await sleep(1)
        done();
      }
    })

    /*PhotoOutput APIs test script*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100
      * @tc.name      : Create PhotoOutput instance promise api
      * @tc.desc      : Create PhotoOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 to operate");
      console.info(TAG + 'Entering getImageReceiverSurfaceId')
      await getImageReceiverSurfaceId()
      await sleep(1)
      photoOutputPromise = await cameraObj.createPhotoOutput(surfaceId1);
      console.info(TAG + "Entering  createPhotoOutput success");
      if (photoOutputPromise != null || photoOutputPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 FAILED : ");
        console.info(TAG + "Entering createPhotoOutput ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100
      * @tc.name      : Photo output callback on error api
      * @tc.desc      : Photo output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo output callback on error photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100 to operate");
        photoOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PhotoOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100
      * @tc.name      : Create capturesession promise api
      * @tc.desc      : Create capturesession promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100', 0, async function (done) {
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 to operate')
      captureSessionPromise = await cameraObj.createCaptureSession(null)
      console.info(TAG + 'Entering Create captureSessionPromise: ' + captureSessionPromise)
      if (captureSessionPromise != null && captureSessionPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 FAILED')
      }
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 ends here');
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100
      * @tc.name      : CaptureSession callback onerror async api
      * @tc.desc      : CaptureSession callback onerror async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering captureSession errorcallback captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100 to operate')
        await sleep(1)
        captureSessionPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + " captureSession errorcallback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /*CaptureSession APIs*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_PROMISE_0100
      * @tc.name      : CaptureSession_Begin config promise api
      * @tc.desc      : CaptureSession_Begin config promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Create captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_PROMISE_0100 to operate");
        const promise = await captureSessionPromise.beginConfig();
        console.info(TAG + "Entering beginConfig success:");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_PROMISE_0100 beginConfig PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_PROMISE_0100 FAILED : ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0100
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add Input captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0100 to operate");
        const Promise = await captureSessionPromise.addInput(camera0InputPromise);
        console.info(TAG + "Entering Add Input success");
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0100 addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0100 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0100
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add preview output captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0100 to operate");
        const promise = await captureSessionPromise.addOutput(previewOutputPromise);
        console.info(TAG + "Entering Add preview output : Success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0100 FAILED : ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0100
      * @tc.name      : Add output with video output api
      * @tc.desc      : Add output with video output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add video output captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0100 to operate");
        const promise = await captureSessionPromise.addOutput(videoOutputPromise);
        console.info(TAG + "Entering Add video output  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0100 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_PROMISE_0100
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add output with photo output captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_PROMISE_0100 to operate");
        const promise = await captureSessionPromise.addOutput(photoOutputPromise);
        console.info(TAG + "Entering Add output with photo output  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_PROMISE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_PROMISE_0100 FAILED ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100
      * @tc.name      : remove input api
      * @tc.desc      : remove input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100 to operate");
        const Promise = await captureSessionPromise.removeInput(camera0InputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100  success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100  PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100
      * @tc.name      : Remove preview Output api
      * @tc.desc      : Remove preview Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100 to operate");
        const Promise = await captureSessionPromise.removeOutput(previewOutputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100 success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100
      * @tc.name      : Remove photo Output api
      * @tc.desc      : Remove photo Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 to operate");
        const Promise = await captureSessionPromise.removeOutput(photoOutputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 addInput success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100
      * @tc.name      : Remove video Output api
      * @tc.desc      : Remove video Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100 to operate");
        const Promise = await captureSessionPromise.removeOutput(videoOutputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100 success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200 to operate");
        const Promise = await captureSessionPromise.addInput(camera0InputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200 addInput success");
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200 addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_PROMISE_0200 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200 to operate");
        const promise = await captureSessionPromise.addOutput(previewOutputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200 : Success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200 FAILED");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_0200 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100 to operate");
        const promise = await captureSessionPromise.addOutput(photoOutputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100 FAILED ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200
      * @tc.name      : Add output with video output api
      * @tc.desc      : Add output with video output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200 to operate");
        const promise = await captureSessionPromise.addOutput(videoOutputPromise);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200 FAILED: ");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_SUCCESS_PROMISE_0200 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_PROMISE_0100
      * @tc.name      : get frame rate range camera0 api
      * @tc.desc      : get frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_PROMISE_0100 to operate");
      await videoOutputPromise.getFrameRateRange()
        .then(function (data) {
          console.info(TAG + "Entering get frame rate range SUCCESS ");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_PROMISE_0100 PASSED : " + JSON.stringify(data))
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_PROMISE_0100 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP0_PROMISE_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP0_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP0_PROMISE_0100 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Grp0,maxFrameRate_Grp0)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP0_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP0_PROMISE_0100 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP0_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_MIX_PROMISE_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_MIX_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_MIX_PROMISE_0100 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Mix,maxFrameRate_Mix)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
         expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_MIX_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_MIX_PROMISE_0100 PASSED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_MIX_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR1_PROMISE_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR1_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR1_PROMISE_0100 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Err1,maxFrameRate_Err1)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR1_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR1_PROMISE_0100 PASSED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR1_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR2_PROMISE_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR2_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR2_PROMISE_0100 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Err2,maxFrameRate_Err2)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR2_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR2_PROMISE_0100 PASSED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR2_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR3_PROMISE_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR3_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR3_PROMISE_0100 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Err3,maxFrameRate_Err3)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR3_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR3_PROMISE_0100 PASSED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_ERR3_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP20_PROMISE_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP20_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP20_PROMISE_0100 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Grp20,maxFrameRate_Grp20)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP20_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP20_PROMISE_0100 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_GRP20_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEOFF_PROMISE_0100
      * @tc.name      : getVideoStabilizationModeOff 
      * @tc.desc      : getVideoStabilizationModeOff promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEOFF_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEOFF_PROMISE_0100 to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeOff SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(data).assertEqual(0);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEOFF_PROMISE_0100 PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEOFF_PROMISE_0100 FAILED : " + err.message);
        });
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEOFF_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODELOW_PROMISE_0100
      * @tc.name      : getVideoStabilizationModeLow 
      * @tc.desc      : getVideoStabilizationModeLow promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODELOW_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODELOW_PROMISE_0100 to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeLow SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(data).assertEqual(1);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODELOW_PROMISE_0100 PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODELOW_PROMISE_0100 FAILED : " + err.message);
        });
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODELOW_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEMIDDLE_PROMISE_0100
      * @tc.name      : getVideoStabilizationModeMIDDLE
      * @tc.desc      : getVideoStabilizationModeMIDDLE promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEMIDDLE_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEMIDDLE_PROMISE_0100 to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeMIDDLE SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEMIDDLE_PROMISE_0100 PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEMIDDLE_PROMISE_0100 FAILED : " + err.message);
        });
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEMIDDLE_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEHIGH_PROMISE_0100
      * @tc.name      : getVideoStabilizationModeHigh
      * @tc.desc      : getVideoStabilizationModeHigh promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEHIGH_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEHIGH_PROMISE_0100 to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeHigh SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEHIGH_PROMISE_0100 PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEHIGH_PROMISE_0100 FAILED : " + err.message);
        });
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEHIGH_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEAUTO_PROMISE_0100
      * @tc.name      : getVideoStabilizationModeAuto
      * @tc.desc      : getVideoStabilizationModeAuto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEAUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEAUTO_PROMISE_0100 to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeAuto SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEAUTO_PROMISE_0100 PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEAUTO_PROMISE_0100 FAILED : " + err.message);
        });
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATIONMODEAUTO_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_PROMISE_0100
      * @tc.name      : commit config api
      * @tc.desc      : commit config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Commit config captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_PROMISE_0100 to operate");
        const promise = await captureSessionPromise.commitConfig();
        console.info(TAG + "Entering commitConfig success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_PROMISE_0100 commitConfig PASSED");
        }
        else {
          expect().assertFail()
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_PROMISE_0100 commitConfig FAILED : ");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_PROMISE_0100 commitConfig ends here");
        }
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100
      * @tc.name      : Preview output callback on frame start api
      * @tc.desc      : Preview output callback on frame start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering Preview Output callback on frame start previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100 to operate");
        previewOutputPromise.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100 is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100  FAILED : + err.message");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100
      * @tc.name      : PreviewOutput callback onframeend async api
      * @tc.desc      : PreviewOutput callback onframeend async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100 previewOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100 to operate')
        await sleep(1)
        previewOutputPromise.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewStop frameEnd Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100  FAILED : + err.message");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100
      * @tc.name      : VideoOutput callback onframestart async api
      * @tc.desc      : VideoOutput callback onframestart async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video frameStart Callback videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100 to operate')
        await sleep(1)
        videoOutputPromise.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Video frameStart Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100 is FAILED : " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100
      * @tc.name      : VideoOutput callback onframeend async api
      * @tc.desc      : VideoOutput callback onframeend async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video frameEnd callback videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100 to operate')
        await sleep(1)
        videoOutputPromise.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100 is success')
            if (data != null || data != undefined) {
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail()
            console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100 FAILED' + err.message)
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    //Capture callback
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_START_CALLBACK_0100
      * @tc.name      : Photo capture callback on capture start api
      * @tc.desc      : Photo capture callback on capture start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_START_CALLBACK_0100', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo capture callback on capture start photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_START_CALLBACK_0100 to operate");
        photoOutputPromise.on('captureStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "CaptureStart Callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_START_CALLBACK_0100 with captureId: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_START_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_END_CALLBACK_0100
      * @tc.name      : Photo capture callback on capture end api
      * @tc.desc      : Photo capture callback on capture end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_END_CALLBACK_0100', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo capture callback on capture end photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_END_CALLBACK_0100 to operate");
        photoOutputPromise.on('captureEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + "captureEnd callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "captureEnd callback with captureId: " + data.captureId);
              console.info(TAG + "captureEnd callback with frameCount: " + data.frameCount);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_END_CALLBACK_0100 FAILED' + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100
      * @tc.name      : Photo capture callback on frame shutter api
      * @tc.desc      : Photo capture callback on frame shutter api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo capture callback on frame shutter photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100 to operate");
        photoOutputPromise.on('frameShutter', async (err, data) => {
          if (!err) {
            console.info(TAG + "frameShutter callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100 with captureId: " + data.captureId);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100 with timestamp: " + data.timestamp);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_SUCCESS_PROMISE_0100
      * @tc.name      : capture session start api
      * @tc.desc      : capture session start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering capture session start captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_SUCCESS_PROMISE_0100 to operate");
        await captureSessionPromise.start();
        console.info(TAG + "Entering captureSession start success");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_SUCCESS_PROMISE_0100 PASSED");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_PROMISE_0100
      * @tc.name      : isMirrorSupported
      * @tc.desc      : isMirrorSupported
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_PROMISE_0100', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_PROMISE_0100 to operate");
        await photoOutputPromise.isMirrorSupported()
          .then(function (data) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_PROMISE_0100 is success");
            console.info(TAG + "isMirrorSupported : " + data);
            expect(true).assertTrue();
          })
          .catch((err) => {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_PROMISE_0100 FAILED : " + err.message);
          });
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_PROMISE_0100
      * @tc.name      : setMirror true
      * @tc.desc      : setMirror true
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_PROMISE_0100', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_PROMISE_0100 to operate");
        await photoOutputPromise.setMirror(true)
          .then(function (data) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_PROMISE_0100 is success:");
            console.info(TAG + "setMirror is : " + 'True');
            expect(true).assertTrue();
          })
          .catch((err) => {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_PROMISE_0100 FAILED : " + err.message);
          });
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    //FLASH Function API scripts
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100
      * @tc.name      : check if has flash-camera0Input api
      * @tc.desc      : check if has flash-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100--------------");
      console.info(TAG + 'hasFlash called.')
      var hasFlashPromise = await camera0InputPromise.hasFlash();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100 success");
      if (hasFlashPromise != null || hasFlashPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100 data is not null || undefined");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100 PASSED with SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100 is: " + JSON.stringify(hasFlashPromise));
        expect(hasFlashPromise).assertEqual(true);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100 FAILED : ");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_PROMISE_0100 ends here");
      await sleep(1)
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100
      * @tc.name      : check if flash mode open is supported-camera0Input api
      * @tc.desc      : check if flash mode open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100 to operate");
      var isFMOpenSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100 SUCCESS ");
      if (isFMOpenSupported != null || isFMOpenSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100 data is not null || undefined");
        console.info(TAG + "FLASH_MODE_OPEN supported is: " + JSON.stringify(isFMOpenSupported));
        expect(isFMOpenSupported).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100 PASSED");
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100
      * @tc.name      : set flash mode open camera0 api
      * @tc.desc      : set flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100 to operate");
      var SetFMOpen = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMOpen))
      if (SetFMOpen == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100 PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_OPEN).assertEqual(1);
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100
      * @tc.name      : get flash mode open camera0 api
      * @tc.desc      : get flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100 to operate");
      var GetFMOpen = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100 success: " + JSON.stringify(GetFMOpen));
      if (GetFMOpen == 1) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100 data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + JSON.stringify(GetFMOpen));
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100 FAILED : ");
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100 to operate");
      var isFMAlwaysOpenSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100 SUCCESS ");
      if (isFMAlwaysOpenSupported != null || isFMAlwaysOpenSupported != undefined) {
        console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN data is not null || undefined");
        console.info(TAG + "FLASH_MODE_OPEN supported is: " + isFMAlwaysOpenSupported);
        expect(isFMAlwaysOpenSupported).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100 PASSED");
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100
      * @tc.name      : set flash mode always open camera0 api
      * @tc.desc      : set flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 to operate");
      var SetFMAlwaysOpen = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMAlwaysOpen))
      if (SetFMAlwaysOpen == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN).assertEqual(3)
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100
      * @tc.name      : get flash mode always open camera0 api
      * @tc.desc      : get flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 to operate");
      var GetFMAlwaysOpen = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 success");
      if (GetFMAlwaysOpen == 3) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMAlwaysOpen);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 FAILED : ");
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100 to operate");
      var isFMAutoSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100 SUCCESS ");
      if (isFMAutoSupported != null || isFMAutoSupported != undefined) {
        console.info(TAG + "Entering FLASH_MODE_AUTO data is not null || undefined");
        console.info(TAG + "FLASH_MODE_AUTO supported is: " + isFMAutoSupported);
        expect(isFMAutoSupported).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100 PASSED");
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100
      * @tc.name      : set flash mode auto camera0 api
      * @tc.desc      : set flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100 to operate");
      var SetFMAlwaysAuto = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
      console.info(TAG + "SetFMAlwaysAuto: " + JSON.stringify(SetFMAlwaysAuto))
      if (SetFMAlwaysAuto == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100 PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_AUTO).assertEqual(2)
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100 to operate");
      var GetFMAuto = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100 success");
      if (GetFMAuto == 2) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100 data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMAuto);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100 FAILED : ");
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100
      * @tc.name      : check if flash mode close is supported-camera0Input api
      * @tc.desc      : check if flash mode close is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100 to operate");
      var isFMCloseSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100 SUCCESS ");
      if (isFMCloseSupported != null || isFMCloseSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100 data is not null || undefined");
        console.info(TAG + "FLASH_MODE_CLOSE supported is: " + isFMCloseSupported);
        expect(isFMCloseSupported).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100 PASSED");
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100
      * @tc.name      : set flash mode close camera0 api
      * @tc.desc      : set flash mode close camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100 to operate");
      var SetFMClose = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMClose))
      if (SetFMClose == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100 PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_CLOSE).assertEqual(0)
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100
      * @tc.name      : get flash mode close camera0 api
      * @tc.desc      : get flash mode close camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100 to operate");
      var GetFMClose = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100 success");
      if (GetFMClose == 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100 data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMClose);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100 FAILED : ");
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    //ZOOM Function
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100
      * @tc.name      : get zoom ratio camera-0 cameraId api promise api
      * @tc.desc      : get zoom ratio camera-0 cameraId api promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100--------------");
      var getZoomRatioPromise = await camera0InputPromise.getZoomRatioRange();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100 getZoomRatioPromise: " + JSON.stringify(getZoomRatioPromise));
      if (getZoomRatioPromise != null && getZoomRatioPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100 setZoomRatioPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100 success: " + JSON.stringify(getZoomRatioPromise));
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100 PASSED");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_PROMISEE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_PROMISE_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_PROMISE_0100', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(1);
      console.info(TAG + "setZoomRatio success: 1");
      console.info(TAG + "getZoomRatio called")
      var getpromise1 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise1);
      if (getpromise1 != null && getpromise1 != undefined) {
        expect(getpromise1).assertEqual(1);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_PROMISE_0100 PASSED ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_PROMISE_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_PROMISE_0100', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(2);
      console.info(TAG + "setZoomRatio success: 2");
      console.info(TAG + "getZoomRatio called")
      var getpromise2 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise2);
      if (getpromise2 != null && getpromise2 != undefined) {
        expect(getpromise2).assertEqual(2);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_PROMISE_0100 PASSED ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_PROMISE_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_PROMISE_0100', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(3);
      console.info(TAG + "setZoomRatio success: 3");
      console.info(TAG + "getZoomRatio called")
      var getpromise3 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise3);
      if (getpromise3 != null && getpromise3 != undefined) {
        expect(getpromise3).assertEqual(3);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_PROMISE_0100 PASSED ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_PROMISE_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_PROMISE_0100', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(4);
      console.info(TAG + "setZoomRatio success: 4");
      console.info(TAG + "getZoomRatio called")
      var getpromise4 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise4);
      if (getpromise4 != null && getpromise4 != undefined) {
        expect(getpromise4).assertEqual(4);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_PROMISE_0100 PASSED ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_PROMISE_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_PROMISE_0100', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(5);
      console.info(TAG + "setZoomRatio success: 5");
      console.info(TAG + "getZoomRatio called")
      var getpromise5 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise5);
      if (getpromise5 != null && getpromise5 != undefined) {
        expect(getpromise5).assertEqual(5);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_PROMISE_0100 PASSED ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_PROMISE_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_PROMISE_0100', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(6);
      console.info(TAG + "setZoomRatio success: 6");
      console.info(TAG + "getZoomRatio called")
      var getpromise6 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise6);
      if (getpromise6 != null && getpromise6 != undefined) {
        expect(getpromise6).assertEqual(6);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_PROMISE_0100 PASSED ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    // FOCUS promise API's
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_PROMISE_0100
      * @tc.name      : check is focus mode locked supported-camera0Input api
      * @tc.desc      : check is focus mode locked supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_PROMISE_0100 to operate");
      var isFMLockedSupported = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
      console.info(TAG + "Entering is focus mode locked supported SUCCESS ");
      if (isFMLockedSupported != null || isFMLockedSupported != undefined) {
        console.info(TAG + "Entering is focus mode locked supported data is not null || undefined");
        console.info(TAG + "is focus mode locked supported : " + isFMLockedSupported);
        expect(isFMLockedSupported).assertEqual(false);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_PROMISE_0100 PASSED");
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_PROMISE_0100
      * @tc.name      : set focus mode locked camera0 api
      * @tc.desc      : set focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED)
        .then(function (data) {
          console.info(TAG + "SetFMLocked: " + JSON.stringify(data))
          console.info(TAG + "Entering set focus mode locked SUCCESS, current focusmode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_PROMISE_0100 FAILED : ")
          expect().assertFail();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_PROMISE_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_PROMISE_0100 ends here");
        });
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_PROMISE_0100
      * @tc.name      : get focus mode locked camera0 api
      * @tc.desc      : get focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_PROMISE_0100 to operate");
      await camera0InputPromise.getFocusMode()
        .then(function (data) {
          console.info(TAG + "Entering get focus mode locked success: ");
          if (data == 0) {
            console.info(TAG + "Current focusmode is: " + JSON.stringify(data));
            expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_PROMISE_0100 PASSED");
          }
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_PROMISE_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_PROMISE_0100 ends here");
        });
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_PROMISE_0100
      * @tc.name      : get focal length camera0 api
      * @tc.desc      : get focal length camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_PROMISE_0100 to operate");
      await camera0InputPromise.getFocalLength()
        .then(function (data) {
          console.info(TAG + "Current focallength is: " + JSON.stringify(data));
          expect(data).assertEqual(3.4600000381469727);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_PROMISE_0100 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_PROMISE_0100
      * @tc.name      : is focusmode manual supported
      * @tc.desc      : is focusmode manual supported
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_PROMISE_0100 to operate");
      var isFMmanualSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
      if (isFMmanualSupportedpromise != null || isFMmanualSupportedpromise != undefined) {
        console.info(TAG + "Entering is focusmode manual supported data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMmanualSupportedpromise);
        expect(isFMmanualSupportedpromise).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_PROMISE_0100 PASSED: ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_PROMISE_0100
      * @tc.name      : set focus mode manual camera0 api
      * @tc.desc      : set focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_PROMISE_0100 to operate");
      await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL)
        .then(function (data) {
          console.info(TAG + "setFocusManual: " + JSON.stringify(data))
          console.info(TAG + "Entering set focus mode manual SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_PROMISE_0100 PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_MANUAL).assertEqual(0)
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_PROMISE_0100 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUAL_PROMISE_0100
      * @tc.name      : get focus mode manual camera0 api
      * @tc.desc      : get focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUAL_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUAL_PROMISE_0100 to operate");
      await camera0InputPromise.getFocusMode()
        .then(function (data) {
          console.info(TAG + "Entering get focus mode manual SUCCESS");
          if (data == 0) {
            console.info(TAG + "Current FocusMode is: " + JSON.stringify(data));
            expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUAL_PROMISE_0100 PASSED");
          }
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUAL_PROMISE_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUAL_PROMISE_0100 ends here");
        });
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0100
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusPoint(Point1)
        .then(function (data) {
          console.info(TAG + "Entering set focus Point SUCCESS, current focusPoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0100 PASSED");
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0100 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0100
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0100 to operate");
      await camera0InputPromise.getFocusPoint()
        .then(function (data) {
          console.info(TAG + "Current focusPoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0100 FAILED " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_PROMISE_0100
      * @tc.name      : check is focus mode continuous supported-camera0Input api
      * @tc.desc      : check is focus mode continuous supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_PROMISE_0100 to operate");
      var isFMContinuousSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      if (isFMContinuousSupportedpromise != null || isFMContinuousSupportedpromise != undefined) {
        console.info(TAG + "Entering is focus mode continuous supported data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_CONTINUOUS_SUPPORTED is: " + isFMContinuousSupportedpromise);
        expect(isFMContinuousSupportedpromise).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_PROMISE_0100 PASSED: ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_PROMISE_0100
      * @tc.name      : set focus mode continuous camera0 api
      * @tc.desc      : set focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 to operate");
      await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)
        .then(function (data) {
          console.info(TAG + "setFocusCont: " + JSON.stringify(data))
          console.info(TAG + "Entering set focus mode continuous SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO).assertEqual(1)
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_PROMISE_0100
      * @tc.name      : get focus mode continuous camera0 api
      * @tc.desc      : get focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 to operate");
      await camera0InputPromise.getFocusMode()
        .then(function (data) {
          console.info(TAG + "Entering get focus mode continuous SUCCESS");
          if (data == 1) {
            console.info(TAG + "Current FocusMode is: " + JSON.stringify(data));
            expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 PASSED");
          }
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0200
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0200', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusPoint(Point2)
        .then(function (data) {
          console.info(TAG + "Entering set focus Point SUCCESS, current focusPoint is:" + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0200 PASSED");
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0200 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0200 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0200
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0200 to operate");
      await camera0InputPromise.getFocusPoint()
        .then(function (data) {
          console.info(TAG + "Current FocusPoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0200 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0200 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0200 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_PROMISE_0100
      * @tc.name      : check is focus mode auto supported-camera0Input api
      * @tc.desc      : check is focus mode auto supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_PROMISE_0100 to operate");
      var isFMAutoSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
      if (isFMAutoSupportedpromise != null || isFMAutoSupportedpromise != undefined) {
        console.info(TAG + "Entering is focus mode auto supported data is not null || undefined");
        console.info(TAG + "is focus mode auto supported is: " + isFMAutoSupportedpromise);
        expect(isFMAutoSupportedpromise).assertEqual(true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_PROMISE_0100 PASSED: ");
      }
      else {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_PROMISE_0100 FAILED : ");
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_PROMISE_0100
      * @tc.name      : set focus mode auto camera0 api
      * @tc.desc      : set focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_PROMISE_0100 to operate");
      var setFocusAuto = await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO)
        .then(function () {
          console.info(TAG + "setFocusAuto: " + JSON.stringify(setFocusAuto))
          console.info(TAG + "Entering set focus mode auto SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_PROMISE_0100 PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_AUTO).assertEqual(2)
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_PROMISE_0100 FAILED : ");
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_PROMISE_0100
      * @tc.name      : get focus mode auto camera0 api
      * @tc.desc      : get focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_PROMISE_0100 to operate");
      var getfocusmodepromise = await camera0InputPromise.getFocusMode();
      console.info(TAG + "Entering get focus mode auto SUCCESS");
      if (getfocusmodepromise == 2) {
        console.info(TAG + "Current FocusMode is: " + getfocusmodepromise);
        expect(true).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_PROMISE_0100 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_PROMISE_0100 FAILED : ");
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_PROMISE_0100 ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0300
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0300', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusPoint(Point3)
        .then(function (data) {
          console.info(TAG + "Entering set focus Point SUCCESS, current focusPoint is:" + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0300 PASSED");
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0300 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_PROMISE_0300 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0300
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0300 to operate");
      await camera0InputPromise.getFocusPoint()
        .then(function (data) {
          console.info(TAG + "Current focusPoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0300 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0300 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_PROMISE_0300 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_PROMISE_0100
      * @tc.name      : get exposure mode locked camera0 api
      * @tc.desc      : get exposure mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_PROMISE_0100 to operate");
      await camera0InputPromise.getExposureMode()
        .then(function (data) {
          console.info(TAG + "Entering get exposure mode locked SUCCESS");
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_PROMISE_0100 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0100 mode locked
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0100 to operate");
      await camera0InputPromise.setExposurePoint(Point1)
        .then(function (data) {
          console.info(TAG + "Entering set exposure Point SUCCESS, current ExposurePoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0100 PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0100 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0100 mode locked
      * @tc.name      : get exposure Point camera0 api
      * @tc.desc      : get exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0100 to operate");
      await camera0InputPromise.getExposurePoint()
        .then(function (data) {
          console.info(TAG + "Entering getExposurePoint SUCCESS");
          console.info(TAG + "Current ExposurePoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0100 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_PROMISE_0100_exposure mode locked
      * @tc.name      : get exposure bias range camera0 api
      * @tc.desc      : get exposure bias range camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_PROMISE_0100 to operate");
      await camera0InputPromise.getExposureBiasRange()
        .then(function (data) {
          console.info(TAG + "Entering getExposureBiasRange SUCCESS");
          console.info(TAG + "Current ExposureBiasRange is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_PROMISE_0100 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0100 mode locked
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0100 to operate");
      await camera0InputPromise.setExposureBias(-4)
        .then(function (data) {
          console.info(TAG + "Entering set exposure bias SUCCESS, current Exposurebias is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0100 PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0100 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0100 mode locked
      * @tc.name      : get exposure value camera0 api
      * @tc.desc      : get exposure value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0100 to operate");
      await camera0InputPromise.getExposureValue()
        .then(function (data) {
          console.info(TAG + "Entering getExposureValue SUCCESS");
          console.info(TAG + "Current ExposureValue is: " + JSON.stringify(data));
          expect(data).assertEqual(-4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0100 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_PROMISE_0100
      * @tc.name      : get exposure mode auto camera0 api
      * @tc.desc      : get exposure mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_PROMISE_0100 to operate");
      await camera0InputPromise.getExposureMode()
        .then(function (data) {
          console.info(TAG + "Entering get exposure mode auto SUCCESS");
          console.info(TAG + "Current exposureMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_PROMISE_0100 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0200 mode auto
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0200 to operate");
      await camera0InputPromise.setExposurePoint(Point2)
        .then(function (data) {
          console.info(TAG + "Entering set exposure Point SUCCESS, current ExposurePoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0200 PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0200 FAILED: " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0200 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0200 mode auto
      * @tc.name      : get exposure Point camera0 api
      * @tc.desc      : get exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0200 to operate");
      await camera0InputPromise.getExposurePoint()
        .then(function (data) {
          console.info(TAG + "Entering getExposurePoint SUCCESS");
          console.info(TAG + "Current ExposurePoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0200 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0200 FAILED: " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0200 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0200 mode auto
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0200 to operate");
      await camera0InputPromise.setExposureBias(1)
        .then(function (data) {
          console.info(TAG + "Entering set exposure bias SUCCESS, current Exposurebias is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0200 PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0200 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0200 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0200 mode auto
      * @tc.name      : get exposure value camera0 api
      * @tc.desc      : get exposure value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0200 to operate");
      await camera0InputPromise.getExposureValue()
        .then(function (data) {
          console.info(TAG + "Entering getExposureValue SUCCESS");
          console.info(TAG + "Current ExposureValue is: " + JSON.stringify(data));
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0200 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0200 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0200 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_PROMISE_0100
      * @tc.name      : get exposure mode continuous auto camera0 api
      * @tc.desc      : get exposure mode continuous auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_PROMISE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_PROMISE_0100 to operate");
      await camera0InputPromise.getExposureMode()
        .then(function (data) {
          console.info(TAG + "Entering get exposure mode auto SUCCESS");
          console.info(TAG + "Current exposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_PROMISE_0100 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_PROMISE_0100 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_PROMISE_0100 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0300
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0300 to operate");
      await camera0InputPromise.setExposurePoint(Point3)
        .then(function (data) {
          console.info(TAG + "Entering set exposure Point SUCCESS, current ExposurePoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0300 PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0300 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_PROMISE_0300 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0300
      * @tc.name      : get exposure Point camera0 api
      * @tc.desc      : get exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0300 to operate");
      await camera0InputPromise.getExposurePoint()
        .then(function (data) {
          console.info(TAG + "Entering getExposurePoint SUCCESS");
          console.info(TAG + "Current ExposurePoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0300 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0300 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_PROMISE_0300 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0300 mode continuous auto
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0300 to operate");
      await camera0InputPromise.setExposureBias(4)
        .then(function (data) {
          console.info(TAG + "Entering set exposure bias SUCCESS, current Exposurebias is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0300 PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0300 FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_PROMISE_0300 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0300
      * @tc.name      : get exposure value camera0 api
      * @tc.desc      : get exposure value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0300 to operate");
      await camera0InputPromise.getExposureValue()
        .then(function (data) {
          console.info(TAG + "Entering getExposureValue SUCCESS");
          console.info(TAG + "Current ExposureValue is: " + JSON.stringify(data));
          expect(data).assertEqual(4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0300 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0300 FAILED : " + err.message);
        });
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_VALUE_PROMISE_0300 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100
      * @tc.name      : VideoOutput start promise api
      * @tc.desc      : VideoOutput start promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video Output start videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 to operate')
        await videoOutputPromise.start()
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 PASSED')
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100
      * @tc.name      : VideoOutput stop promise api
      * @tc.desc      : VideoOutput stop promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video Output Stop videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 to operate')
        await videoOutputPromise.stop()
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 PASSED')
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_PROMISE_0100
      * @tc.name      : CaptureSession stop promise api
      * @tc.desc      : CaptureSession stop promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering Capture Session Stop captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_PROMISE_0100 to operate')
        await captureSessionPromise.stop()
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_PROMISE_0100 PASSED')
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_PROMISE_0100 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_PROMISE_0100
      * @tc.name      : CaptureSession release promise api
      * @tc.desc      : CaptureSession release promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_PROMISE_0100', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering Capture session release captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_PROMISE_0100 to operate')
        await captureSessionPromise.release()
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_PROMISE_0100 PASSED')
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_PROMISE_0100 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE_0100
      * @tc.name      : videoOutput release api
      * @tc.desc      : videoOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + "Entering Video Output release previewOutputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE_0100 to operate");
        await videoOutputPromise.release();
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE_0100 PASSED");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE_0100
      * @tc.name      : PreviewOutput release api
      * @tc.desc      : PreviewOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering previewOutputPromise.release previewOutputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE_0100 to operate");
        await previewOutputPromise.release();
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE_0100 PASSED");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_PROMISE_0100
      * @tc.name      : cameraInput release api
      * @tc.desc      : cameraInput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_PROMISE_0100', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering camera0InputPromise.release camera0InputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_PROMISE_0100 to operate");
        await camera0InputPromise.release();
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_PROMISE_0100 PASSED");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_PROMISE_0100 ends here");
        await sleep(1);
        done();
      }
      await sleep(1)
      done()
    })
  })
}