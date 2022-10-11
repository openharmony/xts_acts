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
      * @tc.number    : GET_CAMERA_MANAGER_PROMISE
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERA_MANAGER_PROMISE', 0, async function (done) {
      console.info('--------------GET_CAMERA_MANAGER_PROMISE--------------')
      cameraManagerPromise = await cameraObj.getCameraManager(null)
      console.info(TAG + 'Entering Get cameraManagerPromise cameraManagerPromise: ' + cameraManagerPromise)
      if (cameraManagerPromise != null && cameraManagerPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering GET_CAMERA_MANAGER_PROMISE PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering GET_CAMERA_MANAGER_PROMISE FAILED')
      }
      console.info(TAG + 'Entering GET_CAMERA_MANAGER_PROMISE ends here')
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAMERA_STATUS_CALLBACK
      * @tc.name      : camera status callback on CameraManager async api
      * @tc.desc      : camera status callback on CameraManager async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAMERA_STATUS_CALLBACK', 0, async function (done) {
      if (cameraManagerPromise == null || cameraManagerPromise == undefined) {
        console.info(TAG + 'Entering Camera status Callback cameraManagerPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAMERA_STATUS_CALLBACK to operate')
        await sleep(1)
        cameraManagerPromise.on('cameraStatus', async (err, data) => {
          if (!err) {
            console.info(TAG + "Camera status Callback on cameraManagerPromise is success");
            if (data != null || data != undefined) {
              console.info(TAG + "CAMERA_STATUS_CALLBACK CameraStatusInfo_Camera: " + data.camera);
              console.info(TAG + "CAMERA_STATUS_CALLBACK CameraStatusInfo_Status: " + data.status);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "CAMERA_STATUS_CALLBACK FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : GET_CAMERAS_PROMISE
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERAS_PROMISE', 0, async function (done) {
      console.info('--------------GET_CAMERAS_PROMISE--------------')
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
        console.info(TAG + 'Entering GET_CAMERAS_PROMISE PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering GET_CAMERAS_PROMISE FAILED')
      }
      console.info(TAG + 'Entering GET_CAMERAS_PROMISE ends here')
      await sleep(1)
      done()
    })

    /*CAMERA-0 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_PROMISE
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_PROMISE', 0, async function (done) {
      console.info('--------------CREATE_CAMERA_INPUT_PROMISE--------------')
      camera0InputPromise = await cameraManagerPromise.createCameraInput(camerasArrayPromise[0].cameraId)
      console.info(TAG + 'Entering Create camera input promise camera0InputPromise: ' + JSON.stringify(camera0InputPromise))
      if (camera0InputPromise != null && camera0InputPromise != undefined) {
        console.info(TAG + 'Entering Create camera input promise  camera0InputPromise is not null || undefined')
        expect(true).assertTrue()
        console.info(TAG + 'Entering CREATE_CAMERA_INPUT_PROMISE PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering CREATE_CAMERA_INPUT_PROMISE FAILED')
      }
      console.info(TAG + 'Entering CREATE_CAMERA_INPUT_PROMISE ends here')
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAMERA_INPUT_CALLBACK_ON_ERROR
      * @tc.name      : Photo output callback on error api
      * @tc.desc      : Photo output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAMERA_INPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering Camera input error callback camera0InputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering CAMERA_INPUT_CALLBACK_ON_ERROR to operate");
        camera0InputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "camera0InputPromise error callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "CAMERA_INPUT_CALLBACK_ON_ERROR with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "CAMERA_INPUT_CALLBACK_ON_ERROR FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : CREATE_PREVIEW_OUTPUT_PROMISE
      * @tc.name      : Create previewoutput promise api
      * @tc.desc      : Create previewoutput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PREVIEW_OUTPUT_PROMISE', 0, async function (done) {
      console.info('--------------CREATE_PREVIEW_OUTPUT_PROMISE--------------')
      previewOutputPromise = await cameraObj.createPreviewOutput(surfaceId)
      console.info(TAG + 'Entering Create previewOutputPromise: ' + JSON.stringify(previewOutputPromise))
      if (previewOutputPromise != null && previewOutputPromise != undefined) {
        console.info(TAG + 'Entering Create previewOutputPromise is not null || undefined')
        expect(true).assertTrue();
        console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE PASSED')
      } else {
        expect().assertFail();
        console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE FAILED')
      }
      console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE ends here')
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT
      * @tc.name      : FocusStateChange callback api
      * @tc.desc      : FocusStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering FocusStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT to operate");
        camera0InputPromise.on('focusStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "FocusState callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current FocusState is : " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT
      * @tc.name      : ExposureStateChange callback api
      * @tc.desc      : ExposureStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering ExposureStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT to operate");
        camera0InputPromise.on('exposureStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "ExposureStateChange callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current ExposureStateChange is: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_ERROR
      * @tc.name      : PreviewOutput callback onerror async api
      * @tc.desc      : PreviewOutput callback onerror async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + 'Entering PreviewOutputError callback  previewOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR to operate')
        await sleep(1)
        previewOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_ERROR with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_ERROR FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : CREATE_VIDEO_OUTPUT_PROMISE
      * @tc.name      : Create videooutput promise api
      * @tc.desc      : Create videooutput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_VIDEO_OUTPUT_PROMISE', 0, async function (done) {
      console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT_PROMISE to operate')
      await getvideosurface()
      await sleep(2)
      videoOutputPromise = await cameraObj.createVideoOutput(videoId)
      console.info(TAG + 'Entering Create videoOutputPromise: ' + videoOutputPromise)
      if (videoOutputPromise != null && videoOutputPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT_PROMISE PASSED')
      } else {
        expect().assertFail();
        console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT_PROMISE FAILED')
      }
      console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT_PROMISE ends here');
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_ERROR
      * @tc.name      : VideoOutput callback onerror async api
      * @tc.desc      : VideoOutput callback onerror async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_ERROR videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_ERROR to operate')
        await sleep(1)
        videoOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + 'VideoOutput Errorcallback is success')
            if (data != null || data != undefined) {
              console.info(TAG + "VIDEO_OUTPUT_CALLBACK_ON_ERROR with ErrorCode: " + data.code);
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail()
            console.info(TAG + "VIDEO_OUTPUT_CALLBACK_ON_ERROR FAILED: " + err.message);
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
      * @tc.number    : CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE
      * @tc.name      : Create PhotoOutput instance promise api
      * @tc.desc      : Create PhotoOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE', 0, async function (done) {
      console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE to operate");
      console.info(TAG + 'Entering getImageReceiverSurfaceId')
      await getImageReceiverSurfaceId()
      await sleep(1)
      photoOutputPromise = await cameraObj.createPhotoOutput(surfaceId1);
      console.info(TAG + "Entering  createPhotoOutput success");
      if (photoOutputPromise != null || photoOutputPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE FAILED : ");
        console.info(TAG + "Entering createPhotoOutput ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : PHOTO_OUTPUT_CALLBACK_ON_ERROR
      * @tc.name      : Photo output callback on error api
      * @tc.desc      : Photo output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo output callback on error photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR to operate");
        photoOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PhotoOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "PHOTO_OUTPUT_CALLBACK_ON_ERROR with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "PHOTO_OUTPUT_CALLBACK_ON_ERROR FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : CREATE_CAPTURE_SESSION_PROMISE
      * @tc.name      : Create capturesession promise api
      * @tc.desc      : Create capturesession promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAPTURE_SESSION_PROMISE', 0, async function (done) {
      console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE to operate')
      captureSessionPromise = await cameraObj.createCaptureSession(null)
      console.info(TAG + 'Entering Create captureSessionPromise: ' + captureSessionPromise)
      if (captureSessionPromise != null && captureSessionPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE FAILED')
      }
      console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE ends here');
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : CAP_SES_CALLBACK_ON_ERROR
      * @tc.name      : CaptureSession callback onerror async api
      * @tc.desc      : CaptureSession callback onerror async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAP_SES_CALLBACK_ON_ERROR', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering captureSession errorcallback captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAP_SES_CALLBACK_ON_ERROR to operate')
        await sleep(1)
        captureSessionPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + " captureSession errorcallback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "CAP_SES_CALLBACK_ON_ERROR with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "CAP_SES_CALLBACK_ON_ERROR FAILED: " + err.message);
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
      * @tc.number    : BEGIN_CONFIG_SUCCESS_PROMISE
      * @tc.name      : CaptureSession_Begin config promise api
      * @tc.desc      : CaptureSession_Begin config promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('BEGIN_CONFIG_SUCCESS_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Create captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering BEGIN_CONFIG_SUCCESS_PROMISE to operate");
        const promise = await captureSessionPromise.beginConfig();
        console.info(TAG + "Entering beginConfig success:");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering BEGIN_CONFIG_SUCCESS_PROMISE beginConfig PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering BEGIN_CONFIG_SUCCESS_PROMISE FAILED : ");
        }
        console.info(TAG + "Entering BEGIN_CONFIG_SUCCESS_PROMISE ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_INPUT_SUCCESS_PROMISE
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_INPUT_SUCCESS_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add Input captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE to operate");
        const Promise = await captureSessionPromise.addInput(camera0InputPromise);
        console.info(TAG + "Entering Add Input success");
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE FAILED: ");
        }
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add preview output captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE to operate");
        const promise = await captureSessionPromise.addOutput(previewOutputPromise);
        console.info(TAG + "Entering Add preview output : Success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE FAILED : ");
        }
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_VIDEO_SUCCESS
      * @tc.name      : Add output with video output api
      * @tc.desc      : Add output with video output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_VIDEO_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add video output captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS to operate");
        const promise = await captureSessionPromise.addOutput(videoOutputPromise);
        console.info(TAG + "Entering Add video output  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS FAILED: ");
        }
        console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_PHOTO
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PHOTO', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Add output with photo output captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO to operate");
        const promise = await captureSessionPromise.addOutput(photoOutputPromise);
        console.info(TAG + "Entering Add output with photo output  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO FAILED ");
        }
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : REMOVE_INPUT_SUCCESS
      * @tc.name      : remove input api
      * @tc.desc      : remove input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_INPUT_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS to operate");
        const Promise = await captureSessionPromise.removeInput(camera0InputPromise);
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS  success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering REMOVE_INPUT_SUCCESS  PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering REMOVE_INPUT_SUCCESS FAILED: ");
        }
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : REMOVE_PREVIEW_OUTPUT_SUCCESS
      * @tc.name      : Remove preview Output api
      * @tc.desc      : Remove preview Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_PREVIEW_OUTPUT_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS to operate");
        const Promise = await captureSessionPromise.removeOutput(previewOutputPromise);
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS FAILED: ");
        }
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : REMOVE_PHOTO_OUTPUT_SUCCESS
      * @tc.name      : Remove photo Output api
      * @tc.desc      : Remove photo Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_PHOTO_OUTPUT_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS to operate");
        const Promise = await captureSessionPromise.removeOutput(photoOutputPromise);
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS addInput success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering REMOVE_INPUT_SUCCESS addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering REMOVE_INPUT_SUCCESS FAILED: ");
        }
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : REMOVE_VIDEO_OUTPUT_SUCCESS
      * @tc.name      : Remove video Output api
      * @tc.desc      : Remove video Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_VIDEO_OUTPUT_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS to operate");
        const Promise = await captureSessionPromise.removeOutput(videoOutputPromise);
        console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS success " + Promise);
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS FAILED: ");
        }
        console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_INPUT_SUCCESS_PROMISE
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_INPUT_SUCCESS_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE to operate");
        const Promise = await captureSessionPromise.addInput(camera0InputPromise);
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE addInput success");
        if (Promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE FAILED: ");
        }
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE to operate");
        const promise = await captureSessionPromise.addOutput(previewOutputPromise);
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE : Success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE FAILED");
        }
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_PHOTO_SUCCESS
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PHOTO_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS to operate");
        const promise = await captureSessionPromise.addOutput(photoOutputPromise);
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS FAILED ");
        }
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_VIDEO_SUCCESS
      * @tc.name      : Add output with video output api
      * @tc.desc      : Add output with video output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_VIDEO_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS to operate");
        const promise = await captureSessionPromise.addOutput(videoOutputPromise);
        console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS  success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS FAILED: ");
        }
        console.info(TAG + "Entering ADD_OUTPUT_VIDEO_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FRAME_RATE_RANGE
      * @tc.name      : get frame rate range camera0 api
      * @tc.desc      : get frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FRAME_RATE_RANGE', 0, async function (done) {
      console.info(TAG + "Entering GET_FRAME_RATE_RANGE to operate");
      await videoOutputPromise.getFrameRateRange()
        .then(function (data) {
          console.info(TAG + "Entering get frame rate range SUCCESS ");
          console.info(TAG + "Entering GET_FRAME_RATE_RANGE PASSED : " + JSON.stringify(data))
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering GET_FRAME_RATE_RANGE FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering GET_FRAME_RATE_RANGE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Grp0
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Grp0', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp0 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Grp0,maxFrameRate_Grp0)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Grp0 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Grp0 FAILED: " + err.message);
        });
      console.info(TAG + "SET_FRAME_RATE_RANGE_Grp0 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_MIX
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_MIX', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_MIX to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Mix,maxFrameRate_Mix)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
         expect().assertFail();
          console.info(TAG + "SET_FRAME_RATE_RANGE_MIX FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SET_FRAME_RATE_RANGE_MIX PASSED: " + err.message);
        });
      console.info(TAG + "SET_FRAME_RATE_RANGE_MIX ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Err1
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Err1', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err1 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Err1,maxFrameRate_Err1)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect().assertFail();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Err1 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Err1 PASSED: " + err.message);
        });
      console.info(TAG + "SET_FRAME_RATE_RANGE_Err1 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Err2
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Err2', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err2 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Err2,maxFrameRate_Err2)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect().assertFail();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Err2 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Err2 PASSED: " + err.message);
        });
      console.info(TAG + "SET_FRAME_RATE_RANGE_Err2 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Err3
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Err3', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err3 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Err3,maxFrameRate_Err3)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect().assertFail();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Err3 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Err3 PASSED: " + err.message);
        });
      console.info(TAG + "SET_FRAME_RATE_RANGE_Err3 ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Grp20
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Grp20', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp20 to operate");
      await videoOutputPromise.setFrameRateRange(minFrameRate_Grp20,maxFrameRate_Grp20)
        .then(function (data) {
          console.info(TAG + "Entering setFrameRateRange SUCCESS");
          console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Grp20 PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "SET_FRAME_RATE_RANGE_Grp20 FAILED: " + err.message);
        });
      console.info(TAG + "SET_FRAME_RATE_RANGE_Grp20 ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTEDOFF
      * @tc.name      : isVideoStabilizationModeSupportedOff
      * @tc.desc      : isVideoStabilizationModeSupported promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTEDOFF', 0, async function (done) {
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF to operate");
      await captureSessionPromise.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.OFF)
      .then(function (data){
      console.info(TAG + "Entering is Video Stabilization Mode OFF Supported SUCCESS ");
      console.info(TAG + "isVideoStabilizationModeSupported : " + data);
      expect(data).assertEqual(true);
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF PASSED");
      })
        .catch((err) => {
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF FAILED : " + err.message);
        expect().assertFail();
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF ends here");
      });
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEOFF
      * @tc.name      : SetVideoStabilizationModeOff
      * @tc.desc      : SetVideoStabilizationModeOff promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEOFF', 0, async function (done) {
      console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEOFF to operate");
      await captureSessionPromise.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.OFF)
      .then(function (){
        console.info(TAG + "Entering Set VideoStabilization Mode Off SUCCESS, current VideoStabilization Mode  is: " + cameraObj.VideoStabilizationMode.OFF);
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEOFF PASSED")
        expect(cameraObj.VideoStabilizationMode.OFF).assertEqual(0)
      })
        .catch((err) => {
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEOFF FAILED : " + err.message);
        expect().assertFail();
        });
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEOFF ends here");
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATIONMODEOFF
      * @tc.name      : getVideoStabilizationModeOff 
      * @tc.desc      : getVideoStabilizationModeOff promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATIONMODEOFF', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATIONMODEOFF to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeOff SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(data).assertEqual(0);
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEOFF PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEOFF FAILED : " + err.message);
        });
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEOFF ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_LOW
      * @tc.name      : isVideoStabilizationModeSupported low 
      * @tc.desc      : isVideoStabilizationModeSupported low promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_LOW', 0, async function (done) {
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW to operate");
      await captureSessionPromise.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.LOW)
      .then(function (data){
      console.info(TAG + "Entering is Video Stabilization Mode LOW Supported SUCCESS ");
      console.info(TAG + "isVideoStabilizationModeSupported : " + data);
      expect(data).assertEqual(true);
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW PASSED");
      })
        .catch((err) => {
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW FAILED : " + err.message);
        expect().assertFail();
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW ends here");
      });
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODELOW
      * @tc.name      : SetVideoStabilizationModelow
      * @tc.desc      : SetVideoStabilizationModelow promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODELOW', 0, async function (done) {
      console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODELOW to operate");
      await captureSessionPromise.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.LOW)
      .then(function (){
        console.info(TAG + "Entering Set VideoStabilization Mode Off SUCCESS, current VideoStabilization Mode  is: " + cameraObj.VideoStabilizationMode.LOW);
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODELOW PASSED")
        expect(cameraObj.VideoStabilizationMode.LOW).assertEqual(1)
      })
        .catch((err) => {
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODELOW FAILED : " + err.message);
        expect().assertFail();
        });
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODELOW ends here");
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATIONMODELOW
      * @tc.name      : getVideoStabilizationModeLow 
      * @tc.desc      : getVideoStabilizationModeLow promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('GET_VIDEOSTABILIZATIONMODELOW', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATIONMODELOW to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeLow SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(data).assertEqual(1);
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODELOW PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODELOW FAILED : " + err.message);
        });
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODELOW ends here");
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE
      * @tc.name      : isVideoStabilizationModeSupported MIDDLE
      * @tc.desc      : isVideoStabilizationModeSupported MIDDLE promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE', 0, async function (done) {
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE to operate");
      await captureSessionPromise.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.MIDDLE)
      .then(function (data){
      console.info(TAG + "Entering is Video Stabilization Mode MIDDLE Supported SUCCESS ");
      console.info(TAG + "isVideoStabilizationModeSupported : " + data);
      expect(data).assertEqual(false);
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE PASSED");
      })
        .catch((err) => {
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE FAILED : " + err.message);
        expect().assertFail();
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE ends here");
      });
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEMIDDLE
      * @tc.name      : SetVideoStabilizationModeMIDDLE
      * @tc.desc      : SetVideoStabilizationModeMIDDLE promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEMIDDLE', 0, async function (done) {
      console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEMIDDLE to operate");
      await captureSessionPromise.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.MIDDLE)
      .then(function (){
        console.info(TAG + "Entering Set VideoStabilization Mode MIDDLE SUCCESS, current VideoStabilization Mode  is: " + cameraObj.VideoStabilizationMode.MIDDLE);
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEMIDDLE FAILED")
        expect().assertFail();
      })
        .catch((err) => {
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEMIDDLE PASSED : " + err.message);
        expect(true).assertTrue();
        });
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEMIDDLE ends here");
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATIONMODEMIDDLE
      * @tc.name      : getVideoStabilizationModeMIDDLE
      * @tc.desc      : getVideoStabilizationModeMIDDLE promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATIONMODEMIDDLE', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATIONMODEMIDDLE to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeMIDDLE SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(true).assertTrue();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEMIDDLE PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEMIDDLE FAILED : " + err.message);
        });
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEMIDDLE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH
      * @tc.name      : isVideoStabilizationModeSupported High
      * @tc.desc      : isVideoStabilizationModeSupported High promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH', 0, async function (done) {
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH to operate");
      await captureSessionPromise.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.HIGH)
      .then(function (data){
      console.info(TAG + "Entering is Video Stabilization Mode HIGH Supported SUCCESS ");
      console.info(TAG + "isVideoStabilizationModeSupported : " + data);
      expect(data).assertEqual(false);
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH PASSED");
      })
        .catch((err) => {
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH FAILED : " + err.message);
        expect().assertFail();
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH ends here");
      });
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEHIGH
      * @tc.name      : SetVideoStabilizationModeHigh
      * @tc.desc      : SetVideoStabilizationModeHigh promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEHIGH', 0, async function (done) {
      console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEHIGH to operate");
      await captureSessionPromise.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.HIGH)
      .then(function (){
        console.info(TAG + "Entering Set VideoStabilization Mode High SUCCESS, current VideoStabilization Mode  is: " + cameraObj.VideoStabilizationMode.HIGH);
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEHIGH FAILED")
        expect().assertFail();
      })
        .catch((err) => {
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEHIGH PASSED : " + err.message);
        expect(true).assertTrue();
        });
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEHIGH ends here");
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATIONMODEHIGH
      * @tc.name      : getVideoStabilizationModeHigh
      * @tc.desc      : getVideoStabilizationModeHigh promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATIONMODEHIGH', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATIONMODEHIGH to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeHigh SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(true).assertTrue();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEHIGH PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEHIGH FAILED : " + err.message);
        });
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEHIGH ends here");
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO
      * @tc.name      : isVideoStabilizationModeSupported Auto
      * @tc.desc      : isVideoStabilizationModeSupported Auto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO', 0, async function (done) {
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO to operate");
      await captureSessionPromise.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.AUTO)
      .then(function (data){
      console.info(TAG + "Entering is Video Stabilization Mode AUTO Supported SUCCESS ");
      console.info(TAG + "isVideoStabilizationModeSupported : " + data);
      expect(data).assertEqual(false);
      console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO PASSED");
      })
        .catch((err) => {
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO FAILED : " + err.message);
        expect().assertFail();
        console.info(TAG + "Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO ends here");
      });
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEAUTO
      * @tc.name      : SetVideoStabilizationModeAuto
      * @tc.desc      : SetVideoStabilizationModeAuto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEAUTO', 0, async function (done) {
      console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEAUTO to operate");
      await captureSessionPromise.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.AUTO)
      .then(function (){
        console.info(TAG + "Entering Set VideoStabilization Mode Auto SUCCESS, current VideoStabilization Mode  is: " + cameraObj.VideoStabilizationMode.AUTO);
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEAUTO FAILED")
        expect().assertFail();
      })
        .catch((err) => {
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEAUTO PASSED : " + err.message);
        expect(true).assertTrue();
        });
        console.info(TAG + "Entering SET_VIDEOSTABILIZATIONMODEAUTO ends here");
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATIONMODEAUTO
      * @tc.name      : getVideoStabilizationModeAuto
      * @tc.desc      : getVideoStabilizationModeAuto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATIONMODEAUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATIONMODEAUTO to operate");
      await captureSessionPromise.getActiveVideoStabilizationMode()
      .then(function (data){
      console.info(TAG + "Entering getVideoStabilizationModeAuto SUCCESS");
        console.info(TAG + "Current VideoStabilizationMode is: " + data);
        expect(true).assertTrue();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEAUTO PASSED");
      })
        .catch((err) => {
        expect().assertFail();
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEAUTO FAILED : " + err.message);
        });
        console.info(TAG + "GET_VIDEOSTABILIZATIONMODEAUTO ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : COMMIT_CONFIG_SUCCESS
      * @tc.name      : commit config api
      * @tc.desc      : commit config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('COMMIT_CONFIG_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering Commit config captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS to operate");
        const promise = await captureSessionPromise.commitConfig();
        console.info(TAG + "Entering commitConfig success");
        if (promise == undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS commitConfig PASSED");
        }
        else {
          expect().assertFail()
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS commitConfig FAILED : ");
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS commitConfig ends here");
        }
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : Preview output callback on frame start api
      * @tc.desc      : Preview output callback on frame start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering Preview Output callback on frame start previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        previewOutputPromise.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
            console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START  FAILED : + err.message");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END
      * @tc.name      : PreviewOutput callback onframeend async api
      * @tc.desc      : PreviewOutput callback onframeend async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + 'Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END previewOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END to operate')
        await sleep(1)
        previewOutputPromise.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewStop frameEnd Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END  FAILED : + err.message");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : VideoOutput callback onframestart async api
      * @tc.desc      : VideoOutput callback onframestart async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video frameStart Callback videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START to operate')
        await sleep(1)
        videoOutputPromise.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Video frameStart Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
            console.info(TAG + "VIDEO_OUTPUT_CALLBACK_ON_FRAME_START is FAILED : " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_END
      * @tc.name      : VideoOutput callback onframeend async api
      * @tc.desc      : VideoOutput callback onframeend async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_END', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video frameEnd callback videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_END to operate')
        await sleep(1)
        videoOutputPromise.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + 'VIDEO_OUTPUT_CALLBACK_ON_FRAME_END is success')
            if (data != null || data != undefined) {
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail()
            console.info(TAG + 'VIDEO_OUTPUT_CALLBACK_ON_FRAME_END FAILED' + err.message)
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
      * @tc.number    : PHOTO_CAP_CALLBACK_ON_CAPTURE_START
      * @tc.name      : Photo capture callback on capture start api
      * @tc.desc      : Photo capture callback on capture start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_CAP_CALLBACK_ON_CAPTURE_START', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo capture callback on capture start photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_START to operate");
        photoOutputPromise.on('captureStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "CaptureStart Callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "PHOTO_CAP_CALLBACK_ON_CAPTURE_START with captureId: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "PHOTO_CAP_CALLBACK_ON_CAPTURE_START FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : PHOTO_CAP_CALLBACK_ON_CAPTURE_END
      * @tc.name      : Photo capture callback on capture end api
      * @tc.desc      : Photo capture callback on capture end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_CAP_CALLBACK_ON_CAPTURE_END', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo capture callback on capture end photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END to operate");
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
            console.info(TAG + 'PHOTO_CAP_CALLBACK_ON_CAPTURE_END FAILED' + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER
      * @tc.name      : Photo capture callback on frame shutter api
      * @tc.desc      : Photo capture callback on frame shutter api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering Photo capture callback on frame shutter photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER to operate");
        photoOutputPromise.on('frameShutter', async (err, data) => {
          if (!err) {
            console.info(TAG + "frameShutter callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER with captureId: " + data.captureId);
              console.info(TAG + "PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER with timestamp: " + data.timestamp);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : CAPTURE_SESSION_START_SUCCESS
      * @tc.name      : capture session start api
      * @tc.desc      : capture session start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_START_SUCCESS', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + "Entering capture session start captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS to operate");
        await captureSessionPromise.start();
        console.info(TAG + "Entering captureSession start success");
        expect(true).assertTrue();
        console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS PASSED");
        console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : isMirrorSupported_PHOTO_OUTPUT
      * @tc.name      : isMirrorSupported
      * @tc.desc      : isMirrorSupported
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('isMirrorSupported_PHOTO_OUTPUT', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering isMirrorSupported_PHOTO_OUTPUT to operate");
        await photoOutputPromise.isMirrorSupported()
          .then(function (data) {
            console.info(TAG + "Entering isMirrorSupported_PHOTO_OUTPUT is success");
            console.info(TAG + "isMirrorSupported : " + data);
            expect(true).assertTrue();
          })
          .catch((err) => {
            expect().assertFail();
            console.info(TAG + "isMirrorSupported_PHOTO_OUTPUT FAILED : " + err.message);
          });
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : setMirror_true
      * @tc.name      : setMirror true
      * @tc.desc      : setMirror true
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('setMirror_true', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering setMirror_true to operate");
        await photoOutputPromise.setMirror(true)
          .then(function (data) {
            console.info(TAG + "Entering setMirror_true is success:");
            console.info(TAG + "setMirror is : " + 'True');
            expect(true).assertTrue();
          })
          .catch((err) => {
            expect().assertFail();
            console.info(TAG + "setMirror_true FAILED : " + err.message);
          });
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })

    //FLASH Function API scripts
    /**
      * @tc.number    : HAS_FLASH
      * @tc.name      : check if has flash-camera0Input api
      * @tc.desc      : check if has flash-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('HAS_FLASH', 0, async function (done) {
      console.info("--------------HAS_FLASH--------------");
      console.info(TAG + 'hasFlash called.')
      var hasFlashPromise = await camera0InputPromise.hasFlash();
      console.info(TAG + "Entering HAS_FLASH success");
      if (hasFlashPromise != null || hasFlashPromise != undefined) {
        console.info(TAG + "Entering HAS_FLASH data is not null || undefined");
        console.info(TAG + "Entering HAS_FLASH PASSED with HAS_FLASH is: " + JSON.stringify(hasFlashPromise));
        expect(hasFlashPromise).assertEqual(true);
      }
      else {
        console.info(TAG + "Entering HAS_FLASH FAILED : ");
        expect().assertFail();
      }
      console.info(TAG + "Entering HAS_FLASH ends here");
      await sleep(1)
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_OPEN_SUPPORTED
      * @tc.name      : check if flash mode open is supported-camera0Input api
      * @tc.desc      : check if flash mode open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FLASH_MODE_OPEN_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED to operate");
      var isFMOpenSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED SUCCESS ");
      if (isFMOpenSupported != null || isFMOpenSupported != undefined) {
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED data is not null || undefined");
        console.info(TAG + "FLASH_MODE_OPEN supported is: " + JSON.stringify(isFMOpenSupported));
        expect(isFMOpenSupported).assertEqual(true);
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_OPEN
      * @tc.name      : set flash mode open camera0 api
      * @tc.desc      : set flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FLASH_MODE_OPEN', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_OPEN to operate");
      var SetFMOpen = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMOpen))
      if (SetFMOpen == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_OPEN).assertEqual(1);
      } else {
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_OPEN
      * @tc.name      : get flash mode open camera0 api
      * @tc.desc      : get flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FLASH_MODE_OPEN', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_OPEN to operate");
      var GetFMOpen = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_OPEN success: " + JSON.stringify(GetFMOpen));
      if (GetFMOpen == 1) {
        console.info(TAG + "GET_FLASH_MODE_OPEN data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + JSON.stringify(GetFMOpen));
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_OPEN PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_OPEN FAILED : ");
        console.info(TAG + "GET_FLASH_MODE_OPEN ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED to operate");
      var isFMAlwaysOpenSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED SUCCESS ");
      if (isFMAlwaysOpenSupported != null || isFMAlwaysOpenSupported != undefined) {
        console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN data is not null || undefined");
        console.info(TAG + "FLASH_MODE_OPEN supported is: " + isFMAlwaysOpenSupported);
        expect(isFMAlwaysOpenSupported).assertEqual(true);
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_ALWAYS_OPEN
      * @tc.name      : set flash mode always open camera0 api
      * @tc.desc      : set flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FLASH_MODE_ALWAYS_OPEN', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN to operate");
      var SetFMAlwaysOpen = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMAlwaysOpen))
      if (SetFMAlwaysOpen == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN).assertEqual(3)
      } else {
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_ALWAYS_OPEN
      * @tc.name      : get flash mode always open camera0 api
      * @tc.desc      : get flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FLASH_MODE_ALWAYS_OPEN', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_ALWAYS_OPEN to operate");
      var GetFMAlwaysOpen = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_ALWAYS_OPEN success");
      if (GetFMAlwaysOpen == 3) {
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMAlwaysOpen);
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN FAILED : ");
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_AUTO_SUPPORTED
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FLASH_MODE_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED to operate");
      var isFMAutoSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
      console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED SUCCESS ");
      if (isFMAutoSupported != null || isFMAutoSupported != undefined) {
        console.info(TAG + "Entering FLASH_MODE_AUTO data is not null || undefined");
        console.info(TAG + "FLASH_MODE_AUTO supported is: " + isFMAutoSupported);
        expect(isFMAutoSupported).assertEqual(true);
        console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_AUTO
      * @tc.name      : set flash mode auto camera0 api
      * @tc.desc      : set flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FLASH_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_AUTO to operate");
      var SetFMAlwaysAuto = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
      console.info(TAG + "SetFMAlwaysAuto: " + JSON.stringify(SetFMAlwaysAuto))
      if (SetFMAlwaysAuto == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_AUTO SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);
        console.info(TAG + "Entering SET_FLASH_MODE_AUTO PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_AUTO).assertEqual(2)
      } else {
        console.info(TAG + "Entering SET_FLASH_MODE_AUTO FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_AUTO ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_AUTO
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FLASH_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_AUTO to operate");
      var GetFMAuto = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_AUTO success");
      if (GetFMAuto == 2) {
        console.info(TAG + "GET_FLASH_MODE_AUTO data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMAuto);
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_AUTO PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_AUTO FAILED : ");
        console.info(TAG + "GET_FLASH_MODE_AUTO ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_CLOSE_SUPPORTED
      * @tc.name      : check if flash mode close is supported-camera0Input api
      * @tc.desc      : check if flash mode close is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FLASH_MODE_CLOSE_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED to operate");
      var isFMCloseSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED SUCCESS ");
      if (isFMCloseSupported != null || isFMCloseSupported != undefined) {
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED data is not null || undefined");
        console.info(TAG + "FLASH_MODE_CLOSE supported is: " + isFMCloseSupported);
        expect(isFMCloseSupported).assertEqual(true);
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_CLOSE
      * @tc.name      : set flash mode close camera0 api
      * @tc.desc      : set flash mode close camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FLASH_MODE_CLOSE', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_CLOSE to operate");
      var SetFMClose = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMClose))
      if (SetFMClose == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE PASSED")
        expect(cameraObj.FlashMode.FLASH_MODE_CLOSE).assertEqual(0)
      } else {
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_CLOSE
      * @tc.name      : get flash mode close camera0 api
      * @tc.desc      : get flash mode close camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FLASH_MODE_CLOSE', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_CLOSE to operate");
      var GetFMClose = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_CLOSE success");
      if (GetFMClose == 0) {
        console.info(TAG + "GET_FLASH_MODE_CLOSE data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMClose);
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_CLOSE PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_CLOSE FAILED : ");
        console.info(TAG + "GET_FLASH_MODE_CLOSE ends here");
      }
      await sleep(1);
      done();
    })

    //ZOOM Function
    /**
      * @tc.number    : GET_ZOOM_RATIO_PROMISE
      * @tc.name      : get zoom ratio camera-0 cameraId api promise api
      * @tc.desc      : get zoom ratio camera-0 cameraId api promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_ZOOM_RATIO_PROMISE', 0, async function (done) {
      console.info("--------------GET_ZOOM_RATIO_PROMISE--------------");
      var getZoomRatioPromise = await camera0InputPromise.getZoomRatioRange();
      console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE getZoomRatioPromise: " + JSON.stringify(getZoomRatioPromise));
      if (getZoomRatioPromise != null && getZoomRatioPromise != undefined) {
        console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE setZoomRatioPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE success: " + JSON.stringify(getZoomRatioPromise));
        console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE PASSED");
      } else {
        console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_1_PROMISE
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_1_PROMISE', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(1);
      console.info(TAG + "setZoomRatio success: 1");
      console.info(TAG + "getZoomRatio called")
      var getpromise1 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise1);
      if (getpromise1 != null && getpromise1 != undefined) {
        expect(getpromise1).assertEqual(1);
        console.info(TAG + "SET_GET_ZOOM_1_PROMISE PASSED ");
      }
      else {
        console.info(TAG + "SET_GET_ZOOM_1_PROMISE FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_2_PROMISE
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_2_PROMISE', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(2);
      console.info(TAG + "setZoomRatio success: 2");
      console.info(TAG + "getZoomRatio called")
      var getpromise2 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise2);
      if (getpromise2 != null && getpromise2 != undefined) {
        expect(getpromise2).assertEqual(2);
        console.info(TAG + "SET_GET_ZOOM_2_PROMISE PASSED ");
      }
      else {
        console.info(TAG + "SET_GET_ZOOM_2_PROMISE FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_3_PROMISE
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_3_PROMISE', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(3);
      console.info(TAG + "setZoomRatio success: 3");
      console.info(TAG + "getZoomRatio called")
      var getpromise3 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise3);
      if (getpromise3 != null && getpromise3 != undefined) {
        expect(getpromise3).assertEqual(3);
        console.info(TAG + "SET_GET_ZOOM_3_PROMISE PASSED ");
      }
      else {
        console.info(TAG + "SET_GET_ZOOM_3_PROMISE FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_4_PROMISE
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_4_PROMISE', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(4);
      console.info(TAG + "setZoomRatio success: 4");
      console.info(TAG + "getZoomRatio called")
      var getpromise4 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise4);
      if (getpromise4 != null && getpromise4 != undefined) {
        expect(getpromise4).assertEqual(4);
        console.info(TAG + "SET_GET_ZOOM_4_PROMISE PASSED ");
      }
      else {
        console.info(TAG + "SET_GET_ZOOM_4_PROMISE FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_5_PROMISE
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_5_PROMISE', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(5);
      console.info(TAG + "setZoomRatio success: 5");
      console.info(TAG + "getZoomRatio called")
      var getpromise5 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise5);
      if (getpromise5 != null && getpromise5 != undefined) {
        expect(getpromise5).assertEqual(5);
        console.info(TAG + "SET_GET_ZOOM_5_PROMISE PASSED ");
      }
      else {
        console.info(TAG + "SET_GET_ZOOM_5_PROMISE FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_6_PROMISE
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_6_PROMISE', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(6);
      console.info(TAG + "setZoomRatio success: 6");
      console.info(TAG + "getZoomRatio called")
      var getpromise6 = await camera0InputPromise.getZoomRatio();
      console.info(TAG + "getZoomRatio success: " + getpromise6);
      if (getpromise6 != null && getpromise6 != undefined) {
        expect(getpromise6).assertEqual(6);
        console.info(TAG + "SET_GET_ZOOM_6_PROMISE PASSED ");
      }
      else {
        console.info(TAG + "SET_GET_ZOOM_6_PROMISE FAILED");
        expect().assertFail();
      }
      await sleep(1);
      done();
    })

    // FOCUS promise API's
    /**
      * @tc.number    : IS_FOCUS_MODE_LOCKED_SUPPORTED
      * @tc.name      : check is focus mode locked supported-camera0Input api
      * @tc.desc      : check is focus mode locked supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_LOCKED_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED to operate");
      var isFMLockedSupported = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
      console.info(TAG + "Entering is focus mode locked supported SUCCESS ");
      if (isFMLockedSupported != null || isFMLockedSupported != undefined) {
        console.info(TAG + "Entering is focus mode locked supported data is not null || undefined");
        console.info(TAG + "is focus mode locked supported : " + isFMLockedSupported);
        expect(isFMLockedSupported).assertEqual(false);
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_LOCKED
      * @tc.name      : set focus mode locked camera0 api
      * @tc.desc      : set focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_MODE_LOCKED', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED)
        .then(function (data) {
          console.info(TAG + "SetFMLocked: " + JSON.stringify(data))
          console.info(TAG + "Entering set focus mode locked SUCCESS, current focusmode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);
          console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED FAILED : ")
          expect().assertFail();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED ends here");
        });
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_LOCKED
      * @tc.name      : get focus mode locked camera0 api
      * @tc.desc      : get focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_MODE_LOCKED', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_LOCKED to operate");
      await camera0InputPromise.getFocusMode()
        .then(function (data) {
          console.info(TAG + "Entering get focus mode locked success: ");
          if (data == 0) {
            console.info(TAG + "Current focusmode is: " + JSON.stringify(data));
            expect(true).assertTrue();
            console.info(TAG + "GET_FOCUS_MODE_LOCKED PASSED");
          }
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_LOCKED FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_MODE_LOCKED ends here");
        });
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCAL_LENGTH
      * @tc.name      : get focal length camera0 api
      * @tc.desc      : get focal length camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCAL_LENGTH', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCAL_LENGTH to operate");
      await camera0InputPromise.getFocalLength()
        .then(function (data) {
          console.info(TAG + "Current focallength is: " + JSON.stringify(data));
          expect(data).assertEqual(3.4600000381469727);
          console.info(TAG + "GET_FOCAL_LENGTH PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCAL_LENGTH FAILED : " + err.message);
        });
      console.info(TAG + "GET_FOCAL_LENGTH ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_MANUAL_SUPPORTED
      * @tc.name      : is focusmode manual supported
      * @tc.desc      : is focusmode manual supported
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_MANUAL_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED to operate");
      var isFMmanualSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
      if (isFMmanualSupportedpromise != null || isFMmanualSupportedpromise != undefined) {
        console.info(TAG + "Entering is focusmode manual supported data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMmanualSupportedpromise);
        expect(isFMmanualSupportedpromise).assertEqual(true);
        console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_MANUAL
      * @tc.name      : set focus mode manual camera0 api
      * @tc.desc      : set focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_MODE_MANUAL', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL to operate");
      await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL)
        .then(function (data) {
          console.info(TAG + "setFocusManual: " + JSON.stringify(data))
          console.info(TAG + "Entering set focus mode manual SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_MANUAL).assertEqual(0)
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_MANUAL
      * @tc.name      : get focus mode manual camera0 api
      * @tc.desc      : get focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_MODE_MANUAL', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_MANUAL to operate");
      await camera0InputPromise.getFocusMode()
        .then(function (data) {
          console.info(TAG + "Entering get focus mode manual SUCCESS");
          if (data == 0) {
            console.info(TAG + "Current FocusMode is: " + JSON.stringify(data));
            expect(true).assertTrue();
            console.info(TAG + "GET_FOCUS_MODE_MANUAL PASSED");
          }
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_MANUAL FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_MODE_MANUAL ends here");
        });
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_POINT
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusPoint(Point1)
        .then(function (data) {
          console.info(TAG + "Entering set focus Point SUCCESS, current focusPoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED");
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_FOCUS_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_POINT
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_POINT to operate");
      await camera0InputPromise.getFocusPoint()
        .then(function (data) {
          console.info(TAG + "Current focusPoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_FOCUS_POINT PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_POINT FAILED " + err.message);
        });
      console.info(TAG + "GET_FOCUS_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_CONTINUOUS_SUPPORTED
      * @tc.name      : check is focus mode continuous supported-camera0Input api
      * @tc.desc      : check is focus mode continuous supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_CONTINUOUS_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED to operate");
      var isFMContinuousSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      if (isFMContinuousSupportedpromise != null || isFMContinuousSupportedpromise != undefined) {
        console.info(TAG + "Entering is focus mode continuous supported data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_CONTINUOUS_SUPPORTED is: " + isFMContinuousSupportedpromise);
        expect(isFMContinuousSupportedpromise).assertEqual(true);
        console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_CONTINUOUS
      * @tc.name      : set focus mode continuous camera0 api
      * @tc.desc      : set focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_MODE_CONTINUOUS', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS to operate");
      await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)
        .then(function (data) {
          console.info(TAG + "setFocusCont: " + JSON.stringify(data))
          console.info(TAG + "Entering set focus mode continuous SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO).assertEqual(1)
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_CONTINUOUS
      * @tc.name      : get focus mode continuous camera0 api
      * @tc.desc      : get focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_MODE_CONTINUOUS', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_CONTINUOUS to operate");
      await camera0InputPromise.getFocusMode()
        .then(function (data) {
          console.info(TAG + "Entering get focus mode continuous SUCCESS");
          if (data == 1) {
            console.info(TAG + "Current FocusMode is: " + JSON.stringify(data));
            expect(true).assertTrue();
            console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS PASSED");
          }
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS FAILED: " + err.message);
        });
      console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_POINT
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusPoint(Point2)
        .then(function (data) {
          console.info(TAG + "Entering set focus Point SUCCESS, current focusPoint is:" + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED");
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_FOCUS_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_POINT
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_POINT to operate");
      await camera0InputPromise.getFocusPoint()
        .then(function (data) {
          console.info(TAG + "Current FocusPoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_FOCUS_POINT PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_POINT FAILED: " + err.message);
        });
      console.info(TAG + "GET_FOCUS_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_AUTO_SUPPORTED
      * @tc.name      : check is focus mode auto supported-camera0Input api
      * @tc.desc      : check is focus mode auto supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED to operate");
      var isFMAutoSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
      if (isFMAutoSupportedpromise != null || isFMAutoSupportedpromise != undefined) {
        console.info(TAG + "Entering is focus mode auto supported data is not null || undefined");
        console.info(TAG + "is focus mode auto supported is: " + isFMAutoSupportedpromise);
        expect(isFMAutoSupportedpromise).assertEqual(true);
        console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED FAILED : ");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_AUTO
      * @tc.name      : set focus mode auto camera0 api
      * @tc.desc      : set focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_MODE_AUTO to operate");
      var setFocusAuto = await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO)
        .then(function () {
          console.info(TAG + "setFocusAuto: " + JSON.stringify(setFocusAuto))
          console.info(TAG + "Entering set focus mode auto SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
          console.info(TAG + "Entering SET_FOCUS_MODE_AUTO PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_AUTO).assertEqual(2)
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_MODE_AUTO FAILED : ");
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_FOCUS_MODE_AUTO ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_AUTO
      * @tc.name      : get focus mode auto camera0 api
      * @tc.desc      : get focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_AUTO to operate");
      var getfocusmodepromise = await camera0InputPromise.getFocusMode();
      console.info(TAG + "Entering get focus mode auto SUCCESS");
      if (getfocusmodepromise == 2) {
        console.info(TAG + "Current FocusMode is: " + getfocusmodepromise);
        expect(true).assertTrue();
        console.info(TAG + "GET_FOCUS_MODE_AUTO PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FOCUS_MODE_AUTO FAILED : ");
        console.info(TAG + "GET_FOCUS_MODE_AUTO ends here");
      }
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_POINT
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering set focus mode locked to operate");
      await camera0InputPromise.setFocusPoint(Point3)
        .then(function (data) {
          console.info(TAG + "Entering set focus Point SUCCESS, current focusPoint is:" + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED");
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_FOCUS_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_POINT
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_POINT to operate");
      await camera0InputPromise.getFocusPoint()
        .then(function (data) {
          console.info(TAG + "Current focusPoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_FOCUS_POINT PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_POINT FAILED : " + err.message);
        });
      console.info(TAG + "GET_FOCUS_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_EXPOSURE_MODE_LOCKED_SUPPORTED
      * @tc.name      : check is exposure mode locked supported-camera0Input api
      * @tc.desc      : check is exposure mode locked supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('IS_EXPOSURE_MODE_LOCKED_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_EXPOSURE_MODE_LOCKED_SUPPORTED to operate");
      await camera0InputPromise.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED)
        .then(function (data) {
          console.info(TAG + "Entering IS_EXPOSURE_MODE_LOCKED_SUPPORTED PASSED: " + data);
          expect(data).assertEqual(false);
        })
        .catch((err) => {
          console.info(TAG + "IS_EXPOSURE_MODE_LOCKED_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "IS_EXPOSURE_MODE_LOCKED_SUPPORTED ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : SET_EXPOSURE_MODE_LOCKED
      * @tc.name      : set exposure mode locked camera0 api
      * @tc.desc      : set exposure mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('SET_EXPOSURE_MODE_LOCKED', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_MODE_Locked to operate");
      await camera0InputPromise.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED)
        .then(function () {
          console.info(TAG + "Entering set exposure mode auto SUCCESS, current ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
          console.info(TAG + "Entering SET_EXPOSURE_MODE_Locked FAILED")
          expect().assertFail()
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_MODE_LOCKED PASSED : " + err.message);
          expect(true).assertTrue();
        });
      console.info(TAG + "Entering SET_EXPOSURE_MODE_LOCKED ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : GET_EXPOSURE_MODE_LOCKED
      * @tc.name      : get exposure mode locked camera0 api
      * @tc.desc      : get exposure mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_MODE_LOCKED', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_MODE_LOCKED to operate");
      await camera0InputPromise.getExposureMode()
        .then(function (data) {
          console.info(TAG + "Entering get exposure mode locked SUCCESS");
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_MODE_LOCKED PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_MODE_LOCKED FAILED : " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_MODE_LOCKED ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_EXPOSURE_POINT_exposure mode locked
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_Point to operate");
      await camera0InputPromise.setExposurePoint(Point1)
        .then(function (data) {
          console.info(TAG + "Entering set exposure Point SUCCESS, current ExposurePoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_POINT PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_POINT FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_POINT_exposure mode locked
      * @tc.name      : get exposure Point camera0 api
      * @tc.desc      : get exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_POINT to operate");
      await camera0InputPromise.getExposurePoint()
        .then(function (data) {
          console.info(TAG + "Entering getExposurePoint SUCCESS");
          console.info(TAG + "Current ExposurePoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_POINT PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_POINT FAILED: " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_BIASRANGE_exposure mode locked
      * @tc.name      : get exposure bias range camera0 api
      * @tc.desc      : get exposure bias range camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_BIASRANGE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_BIASRANGE to operate");
      await camera0InputPromise.getExposureBiasRange()
        .then(function (data) {
          console.info(TAG + "Entering getExposureBiasRange SUCCESS");
          console.info(TAG + "Current ExposureBiasRange is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_BIASRANGE PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_BIASRANGE FAILED: " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_BIASRANGE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_EXPOSURE_BIAS_exposure mode locked
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_BIAS', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_BIAS to operate");
      await camera0InputPromise.setExposureBias(-4)
        .then(function (data) {
          console.info(TAG + "Entering set exposure bias SUCCESS, current Exposurebias is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_BIAS PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_BIAS FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_BIAS ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_VALUE_exposure mode locked
      * @tc.name      : get exposure value camera0 api
      * @tc.desc      : get exposure value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_VALUE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_VALUE to operate");
      await camera0InputPromise.getExposureValue()
        .then(function (data) {
          console.info(TAG + "Entering getExposureValue SUCCESS");
          console.info(TAG + "Current ExposureValue is: " + JSON.stringify(data));
          expect(data).assertEqual(-4);
          console.info(TAG + "GET_EXPOSURE_VALUE PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_VALUE FAILED : " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_VALUE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_EXPOSURE_MODE_AUTO_SUPPORTED
      * @tc.name      : check is exposure mode auto supported-camera0Input api
      * @tc.desc      : check is exposure mode auto supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('IS_EXPOSURE_MODE_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_EXPOSURE_MODE_AUTO_SUPPORTED to operate");
      await camera0InputPromise.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO)
        .then(function (data) {
          console.info(TAG + "Entering IS_EXPOSURE_MODE_AUTO_SUPPORTED PASSED: " + data);
          expect(data).assertEqual(true);
        })
        .catch((err) => {
          console.info(TAG + "IS_EXPOSURE_MODE_AUTO_SUPPORTED FAILED: " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "IS_EXPOSURE_MODE_AUTO_SUPPORTED ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : SET_EXPOSURE_MODE_AUTO
      * @tc.name      : set exposure mode auto camera0 api
      * @tc.desc      : set exposure mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('SET_EXPOSURE_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO to operate");
      await camera0InputPromise.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO)
        .then(function () {
          console.info(TAG + "Entering set exposure mode auto SUCCESS, current ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
          console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO PASSED")
          expect(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO).assertEqual(1);
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : GET_EXPOSURE_MODE_AUTO
      * @tc.name      : get exposure mode auto camera0 api
      * @tc.desc      : get exposure mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('GET_EXPOSURE_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_MODE_AUTO to operate");
      await camera0InputPromise.getExposureMode()
        .then(function (data) {
          console.info(TAG + "Entering get exposure mode auto SUCCESS");
          console.info(TAG + "Current exposureMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "GET_EXPOSURE_MODE_AUTO PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_MODE_AUTO FAILED: " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_MODE_AUTO ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : SET_EXPOSURE_POINT_exposure mode auto
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_POINT to operate");
      await camera0InputPromise.setExposurePoint(Point2)
        .then(function (data) {
          console.info(TAG + "Entering set exposure Point SUCCESS, current ExposurePoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_POINT PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_POINT FAILED: " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_POINT_exposure mode auto
      * @tc.name      : get exposure Point camera0 api
      * @tc.desc      : get exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_POINT to operate");
      await camera0InputPromise.getExposurePoint()
        .then(function (data) {
          console.info(TAG + "Entering getExposurePoint SUCCESS");
          console.info(TAG + "Current ExposurePoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_POINT PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_POINT FAILED: " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_EXPOSURE_BIAS_exposure mode auto
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_BIAS', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_BIAS to operate");
      await camera0InputPromise.setExposureBias(1)
        .then(function (data) {
          console.info(TAG + "Entering set exposure bias SUCCESS, current Exposurebias is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_BIAS PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_BIAS FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_BIAS ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_VALUE_exposure mode auto
      * @tc.name      : get exposure value camera0 api
      * @tc.desc      : get exposure value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_VALUE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_VALUE to operate");
      await camera0InputPromise.getExposureValue()
        .then(function (data) {
          console.info(TAG + "Entering getExposureValue SUCCESS");
          console.info(TAG + "Current ExposureValue is: " + JSON.stringify(data));
          expect(data).assertEqual(1);
          console.info(TAG + "GET_EXPOSURE_VALUE PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_VALUE FAILED : " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_VALUE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_EXPOSURE_MODE_CONTINUOUS_AUTO
      * @tc.name      : check is exposure mode continuous auto supported-camera0Input api
      * @tc.desc      : check is exposure mode continuous auto supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('IS_EXPOSURE_MODE_CONTINUOUS_AUTO', 0, async function (done) {
      console.info(TAG + "Entering IS_EXPOSURE_MODE_CONTINUOUS_AUTO to operate");
      await camera0InputPromise.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)
        .then(function (data) {
          console.info(TAG + "Entering IS_EXPOSURE_MODE_CONTINUOUS_AUTO PASSED: " + data);
          expect(data).assertEqual(false);
        })
        .catch((err) => {
          console.info(TAG + "IS_EXPOSURE_MODE_CONTINUOUS_AUTO FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "IS_EXPOSURE_MODE_CONTINUOUS_AUTO ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : SET_EXPOSURE_MODE_CONTINUOUS_AUTO
      * @tc.name      : set exposure mode continuous auto camera0 api
      * @tc.desc      : set exposure mode continuous auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('SET_EXPOSURE_MODE_CONTINUOUS_AUTO', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO to operate");
      await camera0InputPromise.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)
        .then(function () {
          console.info(TAG + "Entering set exposure mode auto SUCCESS, current ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
          console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO FAILED")
          expect().assertFail();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO PASSED : " + err.message);
          expect(true).assertTrue();
        });
      console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : GET_EXPOSURE_MODE_CONTINUOUS_AUTO
      * @tc.name      : get exposure mode continuous auto camera0 api
      * @tc.desc      : get exposure mode continuous auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('GET_EXPOSURE_MODE_CONTINUOUS_AUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_MODE_CONTINUOUS_AUTO to operate");
      await camera0InputPromise.getExposureMode()
        .then(function (data) {
          console.info(TAG + "Entering get exposure mode auto SUCCESS");
          console.info(TAG + "Current exposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_MODE_CONTINUOUS_AUTO PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_MODE_CONTINUOUS_AUTO FAILED : " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_MODE_CONTINUOUS_AUTO ends here");
      await sleep(1);
      done();
    })
    */

    /**
      * @tc.number    : SET_EXPOSURE_POINT
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_POINT to operate");
      await camera0InputPromise.setExposurePoint(Point3)
        .then(function (data) {
          console.info(TAG + "Entering set exposure Point SUCCESS, current ExposurePoint is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_POINT PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_POINT FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_POINT
      * @tc.name      : get exposure Point camera0 api
      * @tc.desc      : get exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_POINT to operate");
      await camera0InputPromise.getExposurePoint()
        .then(function (data) {
          console.info(TAG + "Entering getExposurePoint SUCCESS");
          console.info(TAG + "Current ExposurePoint is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_POINT PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_POINT FAILED : " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_POINT ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_EXPOSURE_BIAS_exposure mode continuous auto
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_BIAS', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_BIAS to operate");
      await camera0InputPromise.setExposureBias(4)
        .then(function (data) {
          console.info(TAG + "Entering set exposure bias SUCCESS, current Exposurebias is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_BIAS PASSED")
          expect(true).assertTrue();
        })
        .catch((err) => {
          console.info(TAG + "Entering SET_EXPOSURE_BIAS FAILED : " + err.message);
          expect().assertFail();
        });
      console.info(TAG + "Entering SET_EXPOSURE_BIAS ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_VALUE
      * @tc.name      : get exposure value camera0 api
      * @tc.desc      : get exposure value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_VALUE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_VALUE to operate");
      await camera0InputPromise.getExposureValue()
        .then(function (data) {
          console.info(TAG + "Entering getExposureValue SUCCESS");
          console.info(TAG + "Current ExposureValue is: " + JSON.stringify(data));
          expect(data).assertEqual(4);
          console.info(TAG + "GET_EXPOSURE_VALUE PASSED");
        })
        .catch((err) => {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_VALUE FAILED : " + err.message);
        });
      console.info(TAG + "GET_EXPOSURE_VALUE ends here");
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : VIDEO_OUTPUT_START_PROMISE
      * @tc.name      : VideoOutput start promise api
      * @tc.desc      : VideoOutput start promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_START_PROMISE', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video Output start videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_START_PROMISE to operate')
        await videoOutputPromise.start()
        expect(true).assertTrue()
        console.info(TAG + 'Entering VIDEO_OUTPUT_START_PROMISE PASSED')
        console.info(TAG + 'Entering VIDEO_OUTPUT_START_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : VIDEO_OUTPUT_STOP_PROMISE
      * @tc.name      : VideoOutput stop promise api
      * @tc.desc      : VideoOutput stop promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_STOP_PROMISE', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + 'Entering Video Output Stop videoOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_STOP_PROMISE to operate')
        await videoOutputPromise.stop()
        expect(true).assertTrue()
        console.info(TAG + 'Entering VIDEO_OUTPUT_STOP_PROMISE PASSED')
        console.info(TAG + 'Entering VIDEO_OUTPUT_STOP_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAPTURE_SESSION_STOP_PROMISE
      * @tc.name      : CaptureSession stop promise api
      * @tc.desc      : CaptureSession stop promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_STOP_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering Capture Session Stop captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAPTURE_SESSION_STOP_PROMISE to operate')
        await captureSessionPromise.stop()
        expect(true).assertTrue()
        console.info(TAG + 'Entering CAPTURE_SESSION_STOP_PROMISE PASSED')
        console.info(TAG + 'Entering CAPTURE_SESSION_STOP_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAPTURE_SESSION_RELEASE_PROMISE
      * @tc.name      : CaptureSession release promise api
      * @tc.desc      : CaptureSession release promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_RELEASE_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering Capture session release captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE_PROMISE to operate')
        await captureSessionPromise.release()
        expect(true).assertTrue()
        console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE_PROMISE PASSED')
        console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE
      * @tc.name      : videoOutput release api
      * @tc.desc      : videoOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE', 0, async function (done) {
      if (videoOutputPromise == null || videoOutputPromise == undefined) {
        console.info(TAG + "Entering Video Output release previewOutputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE to operate");
        await videoOutputPromise.release();
        expect(true).assertTrue();
        console.info(TAG + "Entering VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE PASSED");
        console.info(TAG + "Entering VIDEOOUTPUT_RELEASE_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE
      * @tc.name      : PreviewOutput release api
      * @tc.desc      : PreviewOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering previewOutputPromise.release previewOutputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE to operate");
        await previewOutputPromise.release();
        expect(true).assertTrue();
        console.info(TAG + "Entering PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE PASSED");
        console.info(TAG + "Entering PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAMERAINPUT_RELEASE_SUCCESS_PROMISE
      * @tc.name      : cameraInput release api
      * @tc.desc      : cameraInput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAMERAINPUT_RELEASE_SUCCESS_PROMISE', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering camera0InputPromise.release camera0InputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS_PROMISE to operate");
        await camera0InputPromise.release();
        expect(true).assertTrue();
        console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS_PROMISE PASSED");
        console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS_PROMISE ends here");
        await sleep(1);
        done();
      }
      await sleep(1)
      done()
    })
  })
}