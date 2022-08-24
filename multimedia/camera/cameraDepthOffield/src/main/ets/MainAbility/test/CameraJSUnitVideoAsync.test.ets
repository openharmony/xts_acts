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
import media from '@ohos.multimedia.media'
import image from '@ohos.multimedia.image';
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import fileio from '@ohos.fileio';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

let TAG = "CameraModuleTest: ";
var cameraManager
var camerasArray
var camera0Input
var previewOutput
var photoOutputAsync
var videoRecorder
var surfaceId1

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

var Point = { x: 1, y: 1 }
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

let fdPath;
let fileAsset;
let fdNumber;
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
  url: 'file:///data/media/02.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 },
  maxSize: 100,
  maxDuration: 500
}
var videoId
var videoOutput
var captureSession

export default function cameraJSUnitVideoAsync(surfaceId: any) {

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
    await getFd('02.mp4');
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

  describe('VideoModeAsync', function () {
    console.info(TAG + '----------Camera-VideoMode-Async--------------')

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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 0, async function (done) {
      console.info('--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100--------------')
      await sleep(1)
      cameraObj.getCameraManager(null, (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Get Camera manager success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Get Camera Manager data is not null || undefined')
            cameraManager = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100 PASSED')
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100 FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100 ends here')
        done()
      })
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
      if (cameraManager == null || cameraManager == undefined) {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 cameraManager == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 to operate')
        cameraManager.on('cameraStatus', async (err, data) => {
          if (!err) {
            console.info(TAG + "Camera status Callback on cameraManager is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Camera status Callback CameraStatusInfo_Camera: " + data.camera);
              console.info(TAG + "Camera status Callback CameraStatusInfo_Status: " + data.status);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Camera status Callback FAILED: " + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', 0, async function (done) {
      console.info('--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100--------------')
      await sleep(1)
      cameraManager.getCameras((err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Get Cameras success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Get Cameras data is not null || undefined')
            camerasArray = data
            if (camerasArray != null && camerasArray.length > 0) {
              for (var i = 0; i < camerasArray.length; i++) {
                // Get the variables from camera object
                var cameraId = camerasArray[i].cameraId
                console.info(TAG + 'Entering Get Cameras camera' + i + 'Id: ' + cameraId)
                var cameraPosition = camerasArray[i].cameraPosition
                console.info(TAG + 'Entering Get Cameras camera' + i + 'Position: ' + cameraPosition)
                var cameraType = camerasArray[i].cameraType
                console.info(TAG + 'Entering Get Cameras camera' + i + 'Type: ' + cameraType)
                var connectionType = camerasArray[i].connectionType
                console.info(TAG + 'Entering Get Cameras connection' + i + 'Type: ' + connectionType)
              }
              expect(true).assertTrue()
              console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 PASSED')
            } else {
              expect().assertFail()
              console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED cameraArray is null || undefined')
            }
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 ends here')
        done()
      })
      await sleep(1)
      done()
    })

    /*CAMERA-0 Scripts*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-0 cameraId async api
      * @tc.desc      : Create camerainput from camera-0 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100', 0, async function (done) {
      console.info('--------------CAMERA-0 STARTS HERE--------------')
      console.info('--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100--------------')
      await sleep(1)
      cameraManager.createCameraInput(camerasArray[0].cameraId, (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + 'Entering Create camera input data is not null || undefined')
            camera0Input = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 PASSED with CameraID :' + camerasArray[0].cameraId)
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 ends here')
        done()
      })
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
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering Camera Input callback camera0Input == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 to operate");
        camera0Input.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "camera0Input error callback is success");
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create previewoutput async api
      * @tc.desc      : Create previewoutput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 to operate')
      await sleep(1)
      cameraObj.createPreviewOutput(surfaceId, (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create preview output success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Create preview output data is not null || undefined')
            previewOutput = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 PASSED')
          }
        } else {
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: ' + err.message)
          expect().assertFail();
        }
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 ends here')
        done()
      })
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100
      * @tc.name      : Preview output callback on error api
      * @tc.desc      : Preview output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering PreviewOutput callback on error previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_CALLBACK_0100 to operate");
        previewOutput.on('error', async (err, data) => {
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

    /*PhotoOutput APIs test script*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100
      * @tc.name      : Create PhotoOutput instance api
      * @tc.desc      : Create PhotoOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100 to operate");
      console.info(TAG + 'Entering getImageReceiverSurfaceId')
      await getImageReceiverSurfaceId()
      await sleep(1)
      cameraObj.createPhotoOutput(surfaceId1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering  createPhotoOutput success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering  createPhotoOutput data is not null || undefined");
            photoOutputAsync = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100 PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "Entering  createPhotoOutput ends here");
        }
        await sleep(1);
        done();
      })
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_CALLBACK_0100 to operate");
        photoOutputAsync.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PhotoOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during PhotoOutput with ErrorCode: " + data.code);
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100
      * @tc.name      : Create videooutput async api
      * @tc.desc      : Create videooutput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 to operate')
      await getvideosurface()
      await sleep(2)
      cameraObj.createVideoOutput(videoId, (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create videooutput success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Create videooutput data is not null || undefined')
            videoOutput = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 PASSED')
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 ends here')
        done()
      })
      await sleep(1)
      done()
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
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100 videoOutput == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_ERROR_CALLBACK_0100 to operate')
        await sleep(1)
        videoOutput.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "VideoOutput Errorcallback is success")
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

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100
      * @tc.name      : Create capturesession async api
      * @tc.desc      : Create capturesession async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 to operate')
      await sleep(1)
      cameraObj.createCaptureSession(null, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create capturesession success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Create capturesession data is not null || undefined')
            captureSession = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 PASSED')
          }
        } else {
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100
      * @tc.name      : CaptureSession callback on error api
      * @tc.desc      : CaptureSession callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAP_SES_ON_ERROR_CALLBACK_0100 to operate");
        captureSession.on('error', async (err, data) => {
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

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_CALLBACK_0100
      * @tc.name      : Begin Config async api
      * @tc.desc      : Begin Config async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering Begin Config captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.beginConfig((err, data) => {
          if (!err) {
            console.info(TAG + 'Entering Begin Config success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_CALLBACK_0100 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_CALLBACK_0100 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0100
      * @tc.name      : AddInput async api
      * @tc.desc      : AddInput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddInput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.addInput(camera0Input, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddInput success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0100 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0100 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0100
      * @tc.name      : AddOutput preview async api
      * @tc.desc      : AddOutput preview async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput preview captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.addOutput(previewOutput, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput preview success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0100 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0100 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_CALLBACK_0100
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Photo captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_CALLBACK_0100 to operate");
        captureSession.addOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Photo  success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Photo data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_CALLBACK_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_CALLBACK_0100 ends here");
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0100
      * @tc.name      : AddOutput video async api
      * @tc.desc      : AddOutput video async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput video captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.addOutput(videoOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput video success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0100 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0100 ends here')
          await sleep(1);
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_CALLBACK_0100
      * @tc.name      : remove input api
      * @tc.desc      : remove input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_CALLBACK_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_CALLBACK_0100 to operate");
        captureSession.removeInput(camera0Input, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove input success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_CALLBACK_0100 PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering Remove Input FAILED" + err.message);
            console.info(TAG + "Entering Remove Input ends here");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_CALLBACK_0100
      * @tc.name      : Remove preview Output api
      * @tc.desc      : Remove preview Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_CALLBACK_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_CALLBACK_0100 to operate");
        captureSession.removeOutput(previewOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove preview Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_CALLBACK_0100 PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering Remove preview Output FAILED" + err.message);
            console.info(TAG + "Entering Remove Preview Output ends here");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100
      * @tc.name      : Remove photo Output api
      * @tc.desc      : Remove photo Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100 to operate");
        captureSession.removeOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove photo Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_CALLBACK_0100 PASSED");
          }
          else {
            expect().assertFail();
            console.info(TAG + "Entering Remove photo Output FAILED" + err.message);
            console.info(TAG + "Entering Remove photo Output ends here");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_CALLBACK_0100
      * @tc.name      : Remove video Output api
      * @tc.desc      : Remove video Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_CALLBACK_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_CALLBACK_0100 to operate");
        captureSession.removeOutput(videoOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove video Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_VIDEO_OUTPUT_SUCCESS_CALLBACK_0100 PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering Remove video Output FAILED" + err.message);
            console.info(TAG + "Entering Remove video Output ends here");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0200
      * @tc.name      : AddInput async api
      * @tc.desc      : AddInput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddInput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0200 to operate')
        await sleep(1)
        captureSession.addInput(camera0Input, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddInput success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0200 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0200 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_CALLBACK_0200 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0200
      * @tc.name      : AddOutput preview async api
      * @tc.desc      : AddOutput preview async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0200 to operate')
        await sleep(1)
        captureSession.addOutput(previewOutput, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput success')
            console.info(TAG + 'Entering AddOutput data is not null || undefined')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0200 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0200 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_CALLBACK_0200 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_CALLBACK_0100
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Photo captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_CALLBACK_0100 to operate");
        captureSession.addOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Photo  success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Photo data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_CALLBACK_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_CALLBACK_0100 ends here");
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0200
      * @tc.name      : AddOutput video async api
      * @tc.desc      : AddOutput video async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0200 to operate')
        await sleep(1)
        captureSession.addOutput(videoOutput, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput success')
            console.info(TAG + 'Entering AddOutput data is not null || undefined')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0200 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0200 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_VIDEO_CALLBACK_0200 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })
 
    //framerate
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_CALLBACK_0100
      * @tc.name      : get frame rate range camera0 api
      * @tc.desc      : get frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_CALLBACK_0100 to operate");
      videoOutput.getFrameRateRange(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get frame rate range success");
            expect(true).assertTrue();
            console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_CALLBACK_0100 PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FRAME_RATE_RANGE_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp0_CALLBACK_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp0_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp0_CALLBACK_0100 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Grp0,maxFrameRate_Grp0, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range PASSED")
          expect(true).assertTrue();
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp0_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp0_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Mix_CALLBACK_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Mix_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Mix_CALLBACK_0100 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Mix,maxFrameRate_Mix, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED")
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Mix_CALLBACK_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Mix_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err1_CALLBACK_0100
      * @tc.name      : set frame rate range camera0 api_err
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err1_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err1_CALLBACK_0100 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Err1,maxFrameRate_Err1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED")
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err1_CALLBACK_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err1_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err2_CALLBACK_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err2_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err2_CALLBACK_0100 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Err2,maxFrameRate_Err2, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED");
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err2_CALLBACK_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err2_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err3_CALLBACK_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err3_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err3_CALLBACK_0100 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Err3,maxFrameRate_Err3, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED");
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err3_CALLBACK_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Err3_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp20_CALLBACK_0100
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp20_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp20_CALLBACK_0100 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Grp20,maxFrameRate_Grp20, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range PASSED")
          expect(true).assertTrue();
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp20_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FRAME_RATE_RANGE_Grp20_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_OFF_CALLBACK_0100
      * @tc.name      : getVideoStabilizationModeOff 
      * @tc.desc      : getVideoStabilizationModeOff async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_OFF_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_OFF_CALLBACK_0100 to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode Off success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(data).assertEqual(0);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_OFF_CALLBACK_0100 PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_OFF_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_OFF_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_LOW_CALLBACK_0100
      * @tc.name      : getVideoStabilizationModeLow 
      * @tc.desc      : getVideoStabilizationModeLOw async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_LOW_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_LOW_CALLBACK_0100 to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode low success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(data).assertEqual(1)
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_LOW_CALLBACK_0100 PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_LOW_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_LOW_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_MIDDLE_CALLBACK_0100
      * @tc.name      : getVideoStabilizationModeMedium 
      * @tc.desc      : getVideoStabilizationModeMedium async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_MIDDLE_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_MIDDLE_CALLBACK_0100 to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode medium success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_MIDDLE_CALLBACK_0100 PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_MIDDLE_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_MIDDLE_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_HIGH_CALLBACK_0100
      * @tc.name      : getVideoStabilizationModeHigh 
      * @tc.desc      : getVideoStabilizationModeHigh async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_HIGH_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_HIGH_CALLBACK_0100 to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode High success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_HIGH_CALLBACK_0100 PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_HIGH_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_HIGH_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_AUTO_CALLBACK_0100
      * @tc.name      : getVideoStabilizationModeAuto 
      * @tc.desc      : getVideoStabilizationModeAuto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_AUTO_CALLBACK_0100 to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode Auto success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_AUTO_CALLBACK_0100 PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_AUTO_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_VIDEOSTABILIZATION_MODE_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_CALLBACK_0100
      * @tc.name      : CommitConfig async api
      * @tc.desc      : CommitConfig async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering CommitConfig captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.commitConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering CommitConfig success')
            console.info(TAG + 'Entering CommitConfig data is not null || undefined')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_CALLBACK_0100 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_CALLBACK_0100 ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_CALLBACK_0100
      * @tc.name      : FocusStateChange callback api
      * @tc.desc      : FocusStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_CALLBACK_0100', 0, async function (done) {
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering FocusStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_CALLBACK_0100 to operate");
        camera0Input.on('focusStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "FocusState callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current FocusState is: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_CALLBACK_0100 FAILED: " + err.message);
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
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering ExposureStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_ON_CAMERAINPUT_CALLBACK_0100 to operate");
        camera0Input.on('exposureStateChange', async (err, data) => {
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

    //callback API
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100
      * @tc.name      : Preview output callback on frame start api
      * @tc.desc      : Preview output callback on frame start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering Preview output callback on frame start previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100 to operate");
        previewOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_START_CALLBACK_0100 is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
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
      * @tc.name      : Preview capture callback on frame end api
      * @tc.desc      : Preview capture callback on frame end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering Preview capture callback on frame end previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100 to operate");
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_FRAME_END_CALLBACK_0100 is success");
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering Photo Capture Callback on CaptureStart photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_START_CALLBACK_0100 to operate");
        photoOutputAsync.on('captureStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Photo Capture Callback on CaptureStart  is success");
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_END_CALLBACK_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_CAPTURE_END_CALLBACK_0100 to operate");
        photoOutputAsync.on('captureEnd', async (err, data) => {
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_ON_FRAME_SHUTTER_CALLBACK_0100 to operate");
        photoOutputAsync.on('frameShutter', async (err, data) => {
          if (!err) {
            console.info(TAG + "frameShutter callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "frameShutter callback with captureId: " + data.captureId);
              console.info(TAG + "frameShutter callback with timestamp: " + data.timestamp);
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100
      * @tc.name      : VideoOutput callback onframestart async api
      * @tc.desc      : VideoOutput callback onframestart async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + "Entering VideoOutput callback onframestart videoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100 to operate");
        videoOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_START_CALLBACK_0100 is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
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
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + 'Entering VideoOutput callback onframeend videoOutput == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100 to operate')
        await sleep(1)
        videoOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100 is success');
            if (data != null || data != undefined) {
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail();
            console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ON_FRAME_END_CALLBACK_0100 FAILED' + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100
      * @tc.name      : CaptureSession start async api
      * @tc.desc      : CaptureSession start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering CaptureSession start captureSession == null || undefined")
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 to operate")
        await sleep(1)
        captureSession.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CaptureSession start success")
            expect(true).assertTrue()
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 PASSED")
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_CALLBACK_0100 ends here");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    //FLASH Function API scripts
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100
      * @tc.name      : check if has flash-camera0Input api
      * @tc.desc      : check if has flash-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "hasFlash called.")
      camera0Input.hasFlash(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100 PASSED with SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100 is: " + data);
            expect(data).assertEqual(true);
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_CALLBACK_0100 ends here");
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if flash mode open is supported-camera0Input api
      * @tc.desc      : check if flash mode open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_OPEN supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100
      * @tc.name      : set flash mode open camera0 api
      * @tc.desc      : set flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_OPEN).assertEqual(1);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100
      * @tc.name      : get flash mode open camera0 api
      * @tc.desc      : get flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100 success");
          if (data == 1) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100 data is not null || undefined: ");
            console.info(TAG + "Current FlashMode is: " + data);
            expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_ALWAYS_OPEN supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100
      * @tc.name      : set flash mode always open camera0 api
      * @tc.desc      : set flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN).assertEqual(3);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100
      * @tc.name      : get flash mode always open camera0 api
      * @tc.desc      : get flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 success");
          if (data == 3) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if flash mode auto is supported-camera0Input api
      * @tc.desc      : check if flash mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_AUTO SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_AUTO supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100 FAILED :" + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100
      * @tc.name      : set flash mode auto camera0 api
      * @tc.desc      : set flash mode auto open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_AUTO).assertEqual(2);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100 success");
          if (data == 2) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100 data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if flash mode close is supported-camera0Input api
      * @tc.desc      : check if flash mode close is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_CLOSE SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_CLOSE supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100 FAILED :" + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100
      * @tc.name      : set flash mode close camera0 api
      * @tc.desc      : set flash mode close open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_CLOSE).assertEqual(0);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100 success");
          if (data == 0) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100 data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100
      * @tc.name      : get zoom ratio camera-0 cameraId api
      * @tc.desc      : get zoom ratio camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100--------------");
      camera0Input.getZoomRatioRange(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100 data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100 Success " + data)
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_CALLBACK_0100 ends here");
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_ASYNC_CALLBACK_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_ASYNC_CALLBACK_0100', 0, async function (done) {
      camera0Input.setZoomRatio(1, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 1");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(1);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_ASYNC_CALLBACK_0100 PASSED ");
            }
            else {
              console.info(TAG + "GET_ZOOM_1_ASYNC FAILED" + err.message);
              expect().assertFail();
            }
          })
        } else {
          console.info(TAG + "SET_ZOOM_1_ASYNC FAILED" + err.message);
          expect().assertFail();
        }
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_ASYNC_CALLBACK_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_ASYNC_CALLBACK_0100', 0, async function (done) {
      camera0Input.setZoomRatio(2, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 2");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(2);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_ASYNC_CALLBACK_0100 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "GET_ZOOM_2_ASYNC FAILED" + err.message);
            }
          })
        } else {
          expect().assertFail();
          console.info(TAG + "SET_ZOOM_2_ASYNC FAILED" + err.message);
        }
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_ASYNC_CALLBACK_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_ASYNC_CALLBACK_0100', 0, async function (done) {
      camera0Input.setZoomRatio(3, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 3");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(3);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_ASYNC_CALLBACK_0100 PASSED ");
            }
            else {
              console.info(TAG + "GET_ZOOM_3_ASYNC FAILED" + err.message);
              expect().assertFail();
            }
          })
        } else {
          console.info(TAG + "SET_ZOOM_3_ASYNC FAILED" + err.message);
          expect().assertFail();
        }
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_ASYNC_CALLBACK_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_ASYNC_CALLBACK_0100', 0, async function (done) {
      camera0Input.setZoomRatio(4, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 4");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(4);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_ASYNC_CALLBACK_0100 PASSED ");
            }
            else {
              console.info(TAG + "GET_ZOOM_4_ASYNC FAILED" + err.message);
              expect().assertFail();
            }
          })
        } else {
          console.info(TAG + "SET_ZOOM_4_ASYNC FAILED" + err.message);
          expect().assertFail();
        }
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_ASYNC_CALLBACK_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_ASYNC_CALLBACK_0100', 0, async function (done) {
      camera0Input.setZoomRatio(5, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 5");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(5);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_ASYNC_CALLBACK_0100 PASSED ");
            }
            else {
              console.info(TAG + "GET_ZOOM_5_ASYNC FAILED" + err.message);
              expect().assertFail();
            }
          })
        } else {
          console.info(TAG + "SET_ZOOM_5_ASYNC FAILED" + err.message);
          expect().assertFail();
        }
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_ASYNC_CALLBACK_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_ASYNC_CALLBACK_0100', 0, async function (done) {
      camera0Input.setZoomRatio(6, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 6");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(6);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_ASYNC_CALLBACK_0100 PASSED ");
            }
            else {
              console.info(TAG + "GET_ZOOM_6_ASYNC FAILED" + err.message);
              expect().assertFail();
            }
          })
        } else {
          console.info(TAG + "SET_ZOOM_6_ASYNC FAILED" + err.message);
          expect().assertFail();
        }
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if focus mode locked is supported-camera0Input api
      * @tc.desc      : check if focus mode locked is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Is Focus Mode Locked Supported SUCCESS: " + data);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Is Focus Mode Locked Supported data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_LOCKED_SUPPORTED is: " + data);
            expect(data).assertEqual(false);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_CALLBACK_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_CALLBACK_0100 FAILED :" + err.message);
          expect().assertFail()
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_CALLBACK_0100
      * @tc.name      : set focus mode locked camera0 api
      * @tc.desc      : set focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_CALLBACK_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Mode Locked SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_CALLBACK_0100 FAILED : ")
          expect().assertFail();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_CALLBACK_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_CALLBACK_0100
      * @tc.name      : get focus mode locked camera0 api
      * @tc.desc      : get focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_CALLBACK_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Mode Locked SUCCESS: " + data);
          console.info(TAG + "Get Focus Mode Locked data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(0);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if focus mode manual is supported-camera0Input api
      * @tc.desc      : check if focus mode manual is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100 FAILED  " + err.message);
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100
      * @tc.name      : set focus mode manual camera0 api
      * @tc.desc      : set focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100 PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_MANUAL).assertEqual(0)
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100
      * @tc.name      : get focus mode manual camera0 api
      * @tc.desc      : get focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100 SUCCESS");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100 data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(0);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0100
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0100 to operate");
      camera0Input.setFocusPoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0100 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0100
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0100 to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if focus mode continuous is supported-camera0Input api
      * @tc.desc      : check if focus mode continuous is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_CONTINOUS_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100
      * @tc.name      : set focus mode continuous camera0 api
      * @tc.desc      : set focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          expect(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO).assertEqual(1);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 PASSED");
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100
      * @tc.name      : get focus mode continuous camera0 api
      * @tc.desc      : get focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 SUCCESS");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0200
      * @tc.name      : set focus Point locked camera0 api
      * @tc.desc      : set focus Point locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0200 to operate");
      camera0Input.setFocusPoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0200 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0200 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0200 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0200
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0200 to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0200 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0200 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100
      * @tc.name      : check if focus mode auto is supported-camera0Input api
      * @tc.desc      : check if focus mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100 data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_AUTO_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100
      * @tc.name      : set focus mode auto camera0 api
      * @tc.desc      : set focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
          if (data != null || data != undefined) {
            expect(cameraObj.FocusMode.FOCUS_MODE_AUTO).assertEqual(2);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100 PASSED")
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100
      * @tc.name      : get focus mode auto camera0 api
      * @tc.desc      : get focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100 SUCCESS");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100 data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(2);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0300
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0300 to operate");
      camera0Input.setFocusPoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0300 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0300 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_CALLBACK_0300 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0300
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0300 to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0300 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0300 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_CALLBACK_0300 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_CALLBACK_0100
      * @tc.name      : get exposure mode locked camera0 api
      * @tc.desc      : get exposure mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_CALLBACK_0100 to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0100
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0100 to operate");
      camera0Input.setExposurePoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0100 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0100
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0100 to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_CALLBACK_0100_exposure mode continuous auto
      * @tc.name      : get exposure bias range camera0 api
      * @tc.desc      : get exposure bias range camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_CALLBACK_0100 to operate");
      camera0Input.getExposureBiasRange(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias range SUCCESS");
          console.info(TAG + "Current Exposure bias range is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0100
      * @tc.name      : set exposure bias camera0 api 
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0100 to operate");
      camera0Input.setExposureBias(-4, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "-4");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0100 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0100
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0100 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(-4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_CALLBACK_0100
      * @tc.name      : get exposure mode auto camera0 api
      * @tc.desc      : get exposure mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_CALLBACK_0100 to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure Mode SUCCESS");
          console.info(TAG + "Get Exposure Mode data is not null || undefined: ");
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0200
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0200 to operate");
      camera0Input.setExposurePoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0200 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0200 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0200 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0200
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0200 to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0200 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0200 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0200
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0200 to operate");
      camera0Input.setExposureBias(1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "1");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0200 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0200 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0200 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0200
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0200 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0200 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0200 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_CALLBACK_0100
      * @tc.name      : get exposure mode continuous auto camera0 api
      * @tc.desc      : get exposure mode continuous auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_CALLBACK_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_CALLBACK_0100 to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_CALLBACK_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_CALLBACK_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_CALLBACK_0100 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0300
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0300 to operate");
      camera0Input.setExposurePoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0300 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0300 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_CALLBACK_0300 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0300
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0300 to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0300 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0300 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_CALLBACK_0300 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0300
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0300 to operate");
      camera0Input.setExposureBias(4, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "4");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0300 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0300 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_CALLBACK_0300 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0300
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0300 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0300 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0300 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_CALLBACK_0300 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_CALLBACK_0100
      * @tc.name      : isMirrorSupported
      * @tc.desc      : isMirrorSupported
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_CALLBACK_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_CALLBACK_0100 to operate");
        photoOutputAsync.isMirrorSupported(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_CALLBACK_0100 is success");
            console.info(TAG + "isMirrorSupported : " + data);
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_CALLBACK_0100
      * @tc.name      : setMirror true
      * @tc.desc      : setMirror true
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_CALLBACK_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_CALLBACK_0100 to operate");
        photoOutputAsync.setMirror(true, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_CALLBACK_0100 is success:");
            console.info(TAG + "setMirror is : " + 'True');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100
      * @tc.name      : VideoOutput start async api
      * @tc.desc      : VideoOutput start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 videoOutput == null || undefined")
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 to operate")
        await sleep(1)
        videoOutput.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 success: " + JSON.stringify(data))
            if (data == undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 FAILED: " + err.message)
          }
        })
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_START_CALLBACK_0100
      * @tc.name      : VideoRecorder start async api
      * @tc.desc      : VideoRecorder start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_START_CALLBACK_0100', 0, async function (done) {
      if (videoRecorder == null || videoRecorder == undefined) {
        console.info(TAG + 'Entering VideoRecorder start videoRecorder == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_START_CALLBACK_0100 to operate')
        videoRecorder.start()
        console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_START_CALLBACK_0100 called');
        sleep(3);
        console.info(TAG + 'Capture with photosettings1 during video - Start & setMirror: true')
        photoOutputAsync.capture(photosettings1)
        console.info(TAG + 'Capture during Video - End.')
        expect(true).assertTrue()
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_START_CALLBACK_0100 PASSED')
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_START_CALLBACK_0100 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100
      * @tc.name      : VideoOutput stop async api
      * @tc.desc      : VideoOutput stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + 'Entering VideoOutput stop videoOutput == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 to operate')
        videoOutput.stop(async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 success: ' + JSON.stringify(data))
            if (data == undefined) {
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 FAILED: ' + err.message)
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_STOP_CALLBACK_0100
      * @tc.name      : VideoRecorder stop async api
      * @tc.desc      : VideoRecorder stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_STOP_CALLBACK_0100', 0, async function (done) {
      if (videoRecorder == null || videoRecorder == undefined) {
        console.info(TAG + 'Entering VideoRecorder stop videoRecorder == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_STOP_CALLBACK_0100 to operate')
        videoRecorder.stop()
        console.info(TAG + 'VideoRecorder stop stopVideo done.')
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_VIDEO_RECORDER_STOP_CALLBACK_0100 PASSED')
        expect(true).assertTrue()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100
      * @tc.name      : CaptureSession stop async api
      * @tc.desc      : CaptureSession stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering CaptureSession stop captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.stop((err, data) => {
          if (!err) {
            console.info(TAG + 'Entering CaptureSession stop success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 PASSED')
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100
      * @tc.name      : CaptureSession release async api
      * @tc.desc      : CaptureSession release async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering CaptureSession release captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 to operate')
        await sleep(1)
        captureSession.release(async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering CaptureSession release success')
            if (data != null || data != undefined) {
              console.info(TAG + 'Entering CaptureSession release data is not null || undefined')
              expect(true).assertTrue()
              console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 PASSED')
            }
          } else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEOOUPUT_RELEASE_SUCCESS_CALLBACK_0100
      * @tc.name      : videooutput release api
      * @tc.desc      : videooutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEOOUPUT_RELEASE_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + "Entering videooutput.release previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUPUT_RELEASE_SUCCESS_CALLBACK_0100 to operate");
        videoOutput.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering videooutput.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering videooutput.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUPUT_RELEASE_SUCCESS_CALLBACK_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUPUT_RELEASE_SUCCESS_CALLBACK_0100 FAILED: " + err.message);
            console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_VIDEOOUPUT_RELEASE_SUCCESS_CALLBACK_0100 ends here");
            await sleep(1);
            done();
          }
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_SUCCESS_CALLBACK_0100
      * @tc.name      : previewOutput release api
      * @tc.desc      : previewOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_SUCCESS_CALLBACK_0100 previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_SUCCESS_CALLBACK_0100 to operate");
        previewOutput.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering previewOutput.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering previewOutput.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering previewOutput.release PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_SUCCESS_CALLBACK_0100 FAILED: " + err.message);
            console.info(TAG + "Entering  previewOutput.release ends here");
            await sleep(1);
            done();
          }
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_CALLBACK_0100
      * @tc.name      : photoOutput release api
      * @tc.desc      : photoOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_CALLBACK_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_CALLBACK_0100 photoOutputAsync == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_CALLBACK_0100 to operate");
        photoOutputAsync.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutputAsync.release success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_CALLBACK_0100 PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_CALLBACK_0100 FAILED: " + err.message);
            console.info(TAG + "Entering  photoOutputAsync.release ends here");
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_CALLBACK_0100
      * @tc.name      : camera Input release api
      * @tc.desc      : camera Input release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_CALLBACK_0100', 0, async function (done) {
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering camera0Input.release camera0Input == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_CALLBACK_0100 to operate");
        camera0Input.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering camera0Input.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering camera0Input.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_CALLBACK_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_CALLBACK_0100 FAILED: " + err.message);
            console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_CALLBACK_0100 ends here");
            await sleep(1);
            done();
          }
        })
        await sleep(1);
        done();
      }
    })
  })
}