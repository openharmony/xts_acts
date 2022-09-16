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
      * @tc.number    : GET_CAMERA_MANAGER_TC
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERA_MANAGER_TC', 0, async function (done) {
      console.info('--------------GET_CAMERA_MANAGER_TC--------------')
      await sleep(1)
      cameraObj.getCameraManager(null, (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Get Camera manager success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Get Camera Manager data is not null || undefined')
            cameraManager = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering GET_CAMERA_MANAGER_TC PASSED')
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering GET_CAMERA_MANAGER_TC FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering GET_CAMERA_MANAGER_TC ends here')
        done()
      })
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
      if (cameraManager == null || cameraManager == undefined) {
        console.info(TAG + 'Entering CAMERA_STATUS_CALLBACK cameraManager == null || undefined')
      } else {
        console.info(TAG + 'Entering CAMERA_STATUS_CALLBACK to operate')
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
      * @tc.number    : GET_CAMERAS
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERAS', 0, async function (done) {
      console.info('--------------GET_CAMERAS--------------')
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
              console.info(TAG + 'Entering GET_CAMERAS PASSED')
            } else {
              expect().assertFail()
              console.info(TAG + 'Entering GET_CAMERAS FAILED cameraArray is null || undefined')
            }
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering GET_CAMERAS FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering GET_CAMERAS ends here')
        done()
      })
      await sleep(1)
      done()
    })

    /*CAMERA-0 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT
      * @tc.name      : Create camerainput from camera-0 cameraId async api
      * @tc.desc      : Create camerainput from camera-0 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT', 0, async function (done) {
      console.info('--------------CAMERA-0 STARTS HERE--------------')
      console.info('--------------CREATE_CAMERA_INPUT--------------')
      await sleep(1)
      cameraManager.createCameraInput(camerasArray[0].cameraId, (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + 'Entering Create camera input data is not null || undefined')
            camera0Input = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering CREATE_CAMERA_INPUT PASSED with CameraID :' + camerasArray[0].cameraId)
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering CREATE_CAMERA_INPUT FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering CREATE_CAMERA_INPUT ends here')
        done()
      })
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
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering Camera Input callback camera0Input == null || undefined");
      } else {
        console.info(TAG + "Entering CAMERA_INPUT_CALLBACK_ON_ERROR to operate");
        camera0Input.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "camera0Input error callback is success");
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
      * @tc.number    : CREATE_PREVIEW_OUTPUT
      * @tc.name      : Create previewoutput async api
      * @tc.desc      : Create previewoutput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PREVIEW_OUTPUT', 0, async function (done) {
      console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT to operate')
      await sleep(1)
      cameraObj.createPreviewOutput(surfaceId, (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create preview output success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Create preview output data is not null || undefined')
            previewOutput = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT PASSED')
          }
        } else {
          console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT FAILED: ' + err.message)
          expect().assertFail();
        }
        console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT ends here')
        done()
      })
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_ERROR
      * @tc.name      : Preview output callback on error api
      * @tc.desc      : Preview output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering PreviewOutput callback on error previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR to operate");
        previewOutput.on('error', async (err, data) => {
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

    /*PhotoOutput APIs test script*/
    /**
      * @tc.number    : CREATE_PHOTO_OUTPUT_SUCCESS
      * @tc.name      : Create PhotoOutput instance api
      * @tc.desc      : Create PhotoOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PHOTO_OUTPUT_SUCCESS', 0, async function (done) {
      console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS to operate");
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
            console.info(TAG + "Entering  CREATE_PHOTO_OUTPUT_SUCCESS PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS FAILED : " + err.message);
          console.info(TAG + "Entering  createPhotoOutput ends here");
        }
        await sleep(1);
        done();
      })
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR to operate");
        photoOutputAsync.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PhotoOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during PhotoOutput with ErrorCode: " + data.code);
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
      * @tc.number    : CREATE_VIDEO_OUTPUT
      * @tc.name      : Create videooutput async api
      * @tc.desc      : Create videooutput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_VIDEO_OUTPUT', 0, async function (done) {
      console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT to operate')
      await getvideosurface()
      await sleep(2)
      cameraObj.createVideoOutput(videoId, (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create videooutput success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Create videooutput data is not null || undefined')
            videoOutput = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT PASSED')
          }
        } else {
          expect().assertFail()
          console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT FAILED: ' + err.message)
        }
        console.info(TAG + 'Entering CREATE_VIDEO_OUTPUT ends here')
        done()
      })
      await sleep(1)
      done()
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
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_ERROR videoOutput == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_ERROR to operate')
        await sleep(1)
        videoOutput.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "VideoOutput Errorcallback is success")
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

    /**
      * @tc.number    : CREATE_CAPTURE_SESSION
      * @tc.name      : Create capturesession async api
      * @tc.desc      : Create capturesession async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAPTURE_SESSION', 0, async function (done) {
      console.info(TAG + 'Entering CREATE_CAPTURE_SESSION to operate')
      await sleep(1)
      cameraObj.createCaptureSession(null, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create capturesession success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering Create capturesession data is not null || undefined')
            captureSession = data
            expect(true).assertTrue()
            console.info(TAG + 'Entering CREATE_CAPTURE_SESSION PASSED')
          }
        } else {
          console.info(TAG + 'Entering CREATE_CAPTURE_SESSION FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering CREATE_CAPTURE_SESSION ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAP_SES_CALLBACK_ON_ERROR
      * @tc.name      : CaptureSession callback on error api
      * @tc.desc      : CaptureSession callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAP_SES_CALLBACK_ON_ERROR', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering CAP_SES_CALLBACK_ON_ERROR captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CAP_SES_CALLBACK_ON_ERROR to operate");
        captureSession.on('error', async (err, data) => {
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

    /**
      * @tc.number    : BEGIN_CONFIG
      * @tc.name      : Begin Config async api
      * @tc.desc      : Begin Config async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('BEGIN_CONFIG', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering Begin Config captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering BEGIN_CONFIG to operate')
        await sleep(1)
        captureSession.beginConfig((err, data) => {
          if (!err) {
            console.info(TAG + 'Entering Begin Config success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering BEGIN_CONFIG PASSED')
          } else {
            console.info(TAG + 'Entering BEGIN_CONFIG FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering BEGIN_CONFIG ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : ADD_INPUT
      * @tc.name      : AddInput async api
      * @tc.desc      : AddInput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_INPUT', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddInput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_INPUT to operate')
        await sleep(1)
        captureSession.addInput(camera0Input, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddInput success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering ADD_INPUT PASSED')
          } else {
            console.info(TAG + 'Entering ADD_INPUT FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering ADD_INPUT ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW
      * @tc.name      : AddOutput preview async api
      * @tc.desc      : AddOutput preview async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PREVIEW', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput preview captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW to operate')
        await sleep(1)
        captureSession.addOutput(previewOutput, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput preview success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW PASSED')
          } else {
            console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW ends here')
          done()
        })
        await sleep(1)
        done()
      }
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
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Photo captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS to operate");
        captureSession.addOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Photo  success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Photo data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS FAILED: " + err.message);
          }
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS ends here");
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : ADD_OUTPUT_VIDEO
      * @tc.name      : AddOutput video async api
      * @tc.desc      : AddOutput video async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_VIDEO', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput video captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_OUTPUT_VIDEO to operate')
        await sleep(1)
        captureSession.addOutput(videoOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput video success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering ADD_OUTPUT_VIDEO PASSED')
          } else {
            console.info(TAG + 'Entering ADD_OUTPUT_VIDEO FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering ADD_OUTPUT_VIDEO ends here')
          await sleep(1);
          done()
        })
        await sleep(1)
        done()
      }
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
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_INPUT_SUCCESS to operate");
        captureSession.removeInput(camera0Input, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove input success");
            expect(true).assertTrue();
            console.info(TAG + "Entering REMOVE_INPUT_SUCCESS PASSED");
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
      * @tc.number    : REMOVE_PREVIEW_OUTPUT_SUCCESS
      * @tc.name      : Remove preview Output api
      * @tc.desc      : Remove preview Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_PREVIEW_OUTPUT_SUCCESS', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS to operate");
        captureSession.removeOutput(previewOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove preview Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS PASSED");
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
      * @tc.number    : REMOVE_PHOTO_OUTPUT_SUCCESS
      * @tc.name      : Remove photo Output api
      * @tc.desc      : Remove photo Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_PHOTO_OUTPUT_SUCCESS', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering REMOVE_PHOTO_OUTPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_PHOTO_OUTPUT_SUCCESS to operate");
        captureSession.removeOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove photo Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering REMOVE_PHOTO_OUTPUT_SUCCESS PASSED");
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
      * @tc.number    : REMOVE_VIDEO_OUTPUT_SUCCESS
      * @tc.name      : Remove video Output api
      * @tc.desc      : Remove video Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('REMOVE_VIDEO_OUTPUT_SUCCESS', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS to operate");
        captureSession.removeOutput(videoOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove video Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering REMOVE_VIDEO_OUTPUT_SUCCESS PASSED");
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
      * @tc.number    : ADD_INPUT
      * @tc.name      : AddInput async api
      * @tc.desc      : AddInput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_INPUT', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddInput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_INPUT to operate')
        await sleep(1)
        captureSession.addInput(camera0Input, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddInput success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering ADD_INPUT PASSED')
          } else {
            console.info(TAG + 'Entering ADD_INPUT FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering ADD_INPUT ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW
      * @tc.name      : AddOutput preview async api
      * @tc.desc      : AddOutput preview async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PREVIEW', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW to operate')
        await sleep(1)
        captureSession.addOutput(previewOutput, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput success')
            console.info(TAG + 'Entering AddOutput data is not null || undefined')
            expect(true).assertTrue()
            console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW PASSED')
          } else {
            console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW ends here')
          done()
        })
        await sleep(1)
        done()
      }
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
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Photo captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO to operate");
        captureSession.addOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Photo  success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Photo data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering ADD_OUTPUT_PHOTO PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering ADD_OUTPUT_PHOTO FAILED: " + err.message);
          }
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO ends here");
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : ADD_OUTPUT_VIDEO
      * @tc.name      : AddOutput video async api
      * @tc.desc      : AddOutput video async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_VIDEO', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering AddOutput captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_OUTPUT_VIDEO to operate')
        await sleep(1)
        captureSession.addOutput(videoOutput, (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering AddOutput success')
            console.info(TAG + 'Entering AddOutput data is not null || undefined')
            expect(true).assertTrue()
            console.info(TAG + 'Entering ADD_OUTPUT_VIDEO PASSED')
          } else {
            console.info(TAG + 'Entering ADD_OUTPUT_VIDEO FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering ADD_OUTPUT_VIDEO ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })
 
    //framerate
    /**
      * @tc.number    : GET_FRAME_RATE_RANGE
      * @tc.name      : get frame rate range camera0 api
      * @tc.desc      : get frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FRAME_RATE_RANGE', 0, async function (done) {
      console.info(TAG + "Entering GET_FRAME_RATE_RANGE to operate");
      videoOutput.getFrameRateRange(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get frame rate range success");
            expect(true).assertTrue();
            console.info(TAG + "Current FrameRateRange is: " + JSON.stringify(data));
            console.info(TAG + "GET_FRAME_RATE_RANGE PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FRAME_RATE_RANGE FAILED : " + err.message);
          console.info(TAG + "GET_FRAME_RATE_RANGE ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Grp0
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Grp0', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp0 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Grp0,maxFrameRate_Grp0, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range PASSED")
          expect(true).assertTrue();
        }
        else {
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp0 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp0 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Mix
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Mix', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Mix to operate");
      videoOutput.setFrameRateRange(minFrameRate_Mix,maxFrameRate_Mix, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED")
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Mix PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Mix ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Err1
      * @tc.name      : set frame rate range camera0 api_err
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Err1', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err1 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Err1,maxFrameRate_Err1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED")
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err1 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err1 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Err2
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Err2', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err2 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Err2,maxFrameRate_Err2, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED");
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err2 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err2 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Err3
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Err3', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err3 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Err3,maxFrameRate_Err3, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range FAILED");
          expect().assertFail();
        }
        else {
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err3 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Err3 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FRAME_RATE_RANGE_Grp20
      * @tc.name      : set frame rate range camera0 api
      * @tc.desc      : set frame rate range async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FRAME_RATE_RANGE_Grp20', 0, async function (done) {
      console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp20 to operate");
      videoOutput.setFrameRateRange(minFrameRate_Grp20,maxFrameRate_Grp20, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering set frame rate range, current framerateRange is: " + JSON.stringify(data));
          console.info(TAG + "Entering set frame rate range PASSED")
          expect(true).assertTrue();
        }
        else {
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp20 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FRAME_RATE_RANGE_Grp20 ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTEDOFF
      * @tc.name      : isVideoStabilizationModeSupported Off
      * @tc.desc      : isVideoStabilizationModeSupported async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTEDOFF', 0, async function (done) {
      console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF to operate')
      captureSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.OFF, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create isVideoStabilizationModeSupported success')
            expect(data).assertEqual(true)
            console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF PASSED :' + data)
          }
         else {
          console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTEDOFF ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */

     /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEOFF
      * @tc.name      : SetVideoStabilizationModeOff 
      * @tc.desc      : SetVideoStabilizationModeOff async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEOFF', 0, async function (done) {
      console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEOFF to operate')
      captureSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.OFF, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Set VideoStabilization Mode Off success')
            console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEOFF PASSED: ' + data)
            expect(cameraObj.VideoStabilizationMode.OFF).assertEqual(0)
          }
         else {
          console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEOFF FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEOFF ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */

    /**
      * @tc.number    : GET_VIDEOSTABILIZATION_MODE_OFF
      * @tc.name      : getVideoStabilizationModeOff 
      * @tc.desc      : getVideoStabilizationModeOff async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATION_MODE_OFF', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATION_MODE_OFF to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode Off success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(data).assertEqual(0);
            console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_OFF PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_OFF FAILED :" + err.message);
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_OFF ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_LOW
      * @tc.name      : is VideoStabilization Mode Low Supported 
      * @tc.desc      : isVideoStabilizationModeSupported low async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_LOW', 0, async function (done) {
      console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW to operate')
      captureSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.LOW, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering isVideoStabilizationModeSupported success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering isVideoStabilizationModeSupported data is not null || undefined')
            expect(data).assertEqual(true)
            console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW PASSED: ' + data)
          }
        } else {
          console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_LOW ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
     /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODELOW
      * @tc.name      : SetVideoStabilizationModelow
      * @tc.desc      : SetVideoStabilizationModelow async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODELOW', 0, async function (done) {
      console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODELOW to operate')
      captureSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.LOW, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Set VideoStabilization Mode Low success')
            console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODELOW PASSED: ' + data)
            expect(cameraObj.VideoStabilizationMode.LOW).assertEqual(1);
          }
         else {
          console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODELOW FAILED: ' + err.message)
          expect().assertFail();
        }
        console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODELOW ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATION_MODE_LOW
      * @tc.name      : getVideoStabilizationModeLow 
      * @tc.desc      : getVideoStabilizationModeLOw async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('GET_VIDEOSTABILIZATION_MODE_LOW', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATION_MODE_LOW to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode low success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(data).assertEqual(1)
            console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_LOW PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_LOW FAILED :" + err.message);
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_LOW ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
    */
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE
      * @tc.name      : is VideoStabilization Mode Middle Supported 
      * @tc.desc      : isVideoStabilizationModeSupported Middle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE', 0, async function (done) {
      console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE to operate')
      captureSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.MIDDLE, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering is VideoStabilization Mode middle Supported  success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering isVideoStabilizationModeSupported data is not null || undefined')
            expect(data).assertEqual(false)
            console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE PASSED : ' + data)
          }
        } else {
          console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_MIDDLE ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEMIDDLE
      * @tc.name      : SetVideoStabilizationModeMedium
      * @tc.desc      : SetVideoStabilizationModeMedium async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEMIDDLE', 0, async function (done) {
      console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEMIDDLE to operate')
      captureSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.MIDDLE, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create Set VideoStabilization Mode middle success')
            console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEMIDDLE FAILED: ' + data)
            expect().assertFail();
          }
         else {
          console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEMIDDLE PASSED: ' + err.message)
          expect(true).assertTrue();
        }
        console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEMIDDLE ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATION_MODE_MIDDLE
      * @tc.name      : getVideoStabilizationModeMedium 
      * @tc.desc      : getVideoStabilizationModeMedium async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATION_MODE_MIDDLE', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATION_MODE_MIDDLE to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode medium success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(true).assertTrue();
            console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_MIDDLE PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_MIDDLE FAILED :" + err.message);
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_MIDDLE ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH
      * @tc.name      : is VideoStabilization Mode High Supported 
      * @tc.desc      : isVideoStabilizationModeSupported High async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH', 0, async function (done) {
      console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH to operate')
      captureSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.HIGH, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering is VideoStabilization Mode High Supported  success')
            expect(data).assertEqual(false)
            console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH PASSED : ' + data)
          }
         else {
          console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_HIGH ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEHIGH
      * @tc.name      : SetVideoStabilizationModeHigh
      * @tc.desc      : SetVideoStabilizationModeHigh async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEHIGH', 0, async function (done) {
      console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEHIGH to operate')
      captureSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.HIGH, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create Set VideoStabilization Mode High success')
            console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEHIGH FAILED: ' + data)
            expect().assertFail();
          }
         else {
          console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEHIGH PASSED: ' + err.message)
          expect(true).assertTrue();
        }
        console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEHIGH ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATION_MODE_HIGH
      * @tc.name      : getVideoStabilizationModeHigh 
      * @tc.desc      : getVideoStabilizationModeHigh async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATION_MODE_HIGH', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATION_MODE_HIGH to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode High success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(true).assertTrue();
            console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_HIGH PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_HIGH FAILED :" + err.message);
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_HIGH ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO
      * @tc.name      : is VideoStabilization Mode Auto Supported 
      * @tc.desc      : isVideoStabilizationModeSupported Auto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO', 0, async function (done) {
      console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO to operate')
      captureSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering is VideoStabilization Mode Auto Supported  success')
          if (data != null || data != undefined) {
            console.info(TAG + 'Entering isVideoStabilizationModeSupported data is not null || undefined')
            expect(data).assertEqual(false)
            console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO PASSED : ' + data)
          }
        } else {
          console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO FAILED: ' + err.message)
          expect().assertFail()
        }
        console.info(TAG + 'Entering ISVIDEOSTABILIZATIONMODESUPPORTED_AUTO ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : SET_VIDEOSTABILIZATIONMODEAUTO
      * @tc.name      : SetVideoStabilizationModeAuto
      * @tc.desc      : SetVideoStabilizationModeAuto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* VideoStabilizationMode Interface will be change
    it('SET_VIDEOSTABILIZATIONMODEAUTO', 0, async function (done) {
      console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEAUTO to operate')
      captureSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + 'Entering Create Set VideoStabilization Mode auto success')
            console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEAUTO FAILED: ' + data)
            expect().assertFail();
          }
         else {
          console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEAUTO PASSED: ' + err.message)
          expect(true).assertTrue();
        }
        console.info(TAG + 'Entering SET_VIDEOSTABILIZATIONMODEAUTO ends here')
        await sleep(1)
        done()
      })
      await sleep(1)
      done()
    })
    */
 
    /**
      * @tc.number    : GET_VIDEOSTABILIZATION_MODE_AUTO
      * @tc.name      : getVideoStabilizationModeAuto 
      * @tc.desc      : getVideoStabilizationModeAuto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_VIDEOSTABILIZATION_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_VIDEOSTABILIZATION_MODE_AUTO to operate");
      captureSession.getActiveVideoStabilizationMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering get Video Stabilization Mode Auto success");
            console.info(TAG + "Current VideoStabilizationMode is: " + data);
             expect(true).assertTrue();
            console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_AUTO PASSED");
          }
        else {
          expect().assertFail();
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_AUTO FAILED :" + err.message);
          console.info(TAG + "GET_VIDEOSTABILIZATION_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : COMMIT_CONFIG
      * @tc.name      : CommitConfig async api
      * @tc.desc      : CommitConfig async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('COMMIT_CONFIG', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering CommitConfig captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering COMMIT_CONFIG to operate')
        await sleep(1)
        captureSession.commitConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering CommitConfig success')
            console.info(TAG + 'Entering CommitConfig data is not null || undefined')
            expect(true).assertTrue()
            console.info(TAG + 'Entering COMMIT_CONFIG PASSED')
          } else {
            console.info(TAG + 'Entering COMMIT_CONFIG FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering COMMIT_CONFIG ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
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
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering FocusStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT to operate");
        camera0Input.on('focusStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "FocusState callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current FocusState is: " + data);
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
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering ExposureStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT to operate");
        camera0Input.on('exposureStateChange', async (err, data) => {
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

    //callback API
    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : Preview output callback on frame start api
      * @tc.desc      : Preview output callback on frame start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering Preview output callback on frame start previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        previewOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
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
      * @tc.name      : Preview capture callback on frame end api
      * @tc.desc      : Preview capture callback on frame end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering Preview capture callback on frame end previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END to operate");
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + "PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END is success");
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering Photo Capture Callback on CaptureStart photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_START to operate");
        photoOutputAsync.on('captureStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Photo Capture Callback on CaptureStart  is success");
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END to operate");
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER to operate");
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
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : VideoOutput callback onframestart async api
      * @tc.desc      : VideoOutput callback onframestart async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + "Entering VideoOutput callback onframestart videoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        videoOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "VIDEO_OUTPUT_CALLBACK_ON_FRAME_START is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
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
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + 'Entering VideoOutput callback onframeend videoOutput == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_END to operate')
        await sleep(1)
        videoOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + 'VIDEO_OUTPUT_CALLBACK_ON_FRAME_END is success');
            if (data != null || data != undefined) {
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail();
            console.info(TAG + 'VIDEO_OUTPUT_CALLBACK_ON_FRAME_END FAILED' + err.message);
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : CAPTURE_SESSION_START
      * @tc.name      : CaptureSession start async api
      * @tc.desc      : CaptureSession start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_START', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering CaptureSession start captureSession == null || undefined")
      } else {
        console.info(TAG + "Entering CAPTURE_SESSION_START to operate")
        await sleep(1)
        captureSession.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CaptureSession start success")
            expect(true).assertTrue()
            console.info(TAG + "Entering CAPTURE_SESSION_START PASSED")
          } else {
            console.info(TAG + 'Entering CAPTURE_SESSION_START FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering CAPTURE_SESSION_START ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS FAILED : " + err.message);
            console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS ends here");
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
      * @tc.number    : HAS_FLASH
      * @tc.name      : check if has flash-camera0Input api
      * @tc.desc      : check if has flash-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('HAS_FLASH', 0, async function (done) {
      console.info(TAG + "hasFlash called.")
      camera0Input.hasFlash(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering HAS_FLASH success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering HAS_FLASH data is not null || undefined");
            console.info(TAG + "Entering HAS_FLASH PASSED with HAS_FLASH is: " + data);
            expect(data).assertEqual(true);
          }
        } else {
          console.info(TAG + "Entering HAS_FLASH FAILED : " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering HAS_FLASH ends here");
      })
      await sleep(1);
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
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED data is not null || undefined");
            console.info(TAG + "FLASH_MODE_OPEN supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_OPEN).assertEqual(1);
        }
        else {
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_OPEN success");
          if (data == 1) {
            console.info(TAG + "GET_FLASH_MODE_OPEN data is not null || undefined: ");
            console.info(TAG + "Current FlashMode is: " + data);
            expect(true).assertTrue();
            console.info(TAG + "GET_FLASH_MODE_OPEN PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_OPEN FAILED : " + err.message);
          console.info(TAG + "GET_FLASH_MODE_OPEN ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED data is not null || undefined");
            console.info(TAG + "FLASH_MODE_ALWAYS_OPEN supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN).assertEqual(3);
        }
        else {
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_ALWAYS_OPEN success");
          if (data == 3) {
            console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN FAILED : " + err.message);
          console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })
 
    /**
      * @tc.number    : IS_FLASH_MODE_AUTO_SUPPORTED
      * @tc.name      : check if flash mode auto is supported-camera0Input api
      * @tc.desc      : check if flash mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FLASH_MODE_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_AUTO SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED data is not null || undefined");
            console.info(TAG + "FLASH_MODE_AUTO supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED FAILED :" + err.message);
          expect().assertFail();
          console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_AUTO
      * @tc.name      : set flash mode auto camera0 api
      * @tc.desc      : set flash mode auto open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FLASH_MODE_AUTO', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_AUTO to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_AUTO SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);
          console.info(TAG + "Entering SET_FLASH_MODE_AUTO PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_AUTO).assertEqual(2);
        }
        else {
          console.info(TAG + "Entering SET_FLASH_MODE_AUTO FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_AUTO success");
          if (data == 2) {
            console.info(TAG + "GET_FLASH_MODE_AUTO data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "GET_FLASH_MODE_AUTO PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_AUTO FAILED :" + err.message);
          console.info(TAG + "GET_FLASH_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_CLOSE SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED data is not null || undefined");
            console.info(TAG + "FLASH_MODE_CLOSE supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED FAILED :" + err.message);
          expect().assertFail();
          console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_CLOSE
      * @tc.name      : set flash mode close camera0 api
      * @tc.desc      : set flash mode close open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FLASH_MODE_CLOSE', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_CLOSE to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_CLOSE).assertEqual(0);
        }
        else {
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_CLOSE
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FLASH_MODE_CLOSE', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_CLOSE to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_CLOSE success");
          if (data == 0) {
            console.info(TAG + "GET_FLASH_MODE_CLOSE data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "GET_FLASH_MODE_CLOSE PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_CLOSE FAILED :" + err.message);
          console.info(TAG + "GET_FLASH_MODE_CLOSE ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_ZOOM_RATIO
      * @tc.name      : get zoom ratio camera-0 cameraId api
      * @tc.desc      : get zoom ratio camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_ZOOM_RATIO', 0, async function (done) {
      console.info("--------------GET_ZOOM_RATIO--------------");
      camera0Input.getZoomRatioRange(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering GET_ZOOM_RATIO data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_ZOOM_RATIO Success " + data)
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering GET_ZOOM_RATIO FAILED: " + err.message);
        }
        console.info(TAG + "Entering GET_ZOOM_RATIO ends here");
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_GET_ZOOM_1_ASYNC
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_1_ASYNC', 0, async function (done) {
      camera0Input.setZoomRatio(1, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 1");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(1);
              console.info(TAG + "SET_GET_ZOOM_1_ASYNC PASSED ");
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
      * @tc.number    : SET_GET_ZOOM_2_ASYNC
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_2_ASYNC', 0, async function (done) {
      camera0Input.setZoomRatio(2, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 2");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(2);
              console.info(TAG + "SET_GET_ZOOM_2_ASYNC PASSED ");
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
      * @tc.number    : SET_GET_ZOOM_3_ASYNC
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_3_ASYNC', 0, async function (done) {
      camera0Input.setZoomRatio(3, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 3");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(3);
              console.info(TAG + "SET_GET_ZOOM_3_ASYNC PASSED ");
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
      * @tc.number    : SET_GET_ZOOM_4_ASYNC
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_4_ASYNC', 0, async function (done) {
      camera0Input.setZoomRatio(4, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 4");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(4);
              console.info(TAG + "SET_GET_ZOOM_4_ASYNC PASSED ");
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
      * @tc.number    : SET_GET_ZOOM_5_ASYNC
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_5_ASYNC', 0, async function (done) {
      camera0Input.setZoomRatio(5, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 5");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(5);
              console.info(TAG + "SET_GET_ZOOM_5_ASYNC PASSED ");
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
      * @tc.number    : SET_GET_ZOOM_6_ASYNC
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_6_ASYNC', 0, async function (done) {
      camera0Input.setZoomRatio(6, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 6");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(6);
              console.info(TAG + "SET_GET_ZOOM_6_ASYNC PASSED ");
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
      * @tc.number    : IS_FOCUS_MODE_LOCKED_SUPPORTED
      * @tc.name      : check if focus mode locked is supported-camera0Input api
      * @tc.desc      : check if focus mode locked is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_LOCKED_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Is Focus Mode Locked Supported SUCCESS: " + data);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Is Focus Mode Locked Supported data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_LOCKED_SUPPORTED is: " + data);
            expect(data).assertEqual(false);
            console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_FOCUS_MODE_LOCKED_SUPPORTED FAILED :" + err.message);
          expect().assertFail()
          console.info(TAG + "IS_FOCUS_MODE_LOCKED_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Mode Locked SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);
          console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED FAILED : ")
          expect().assertFail();
        } else {
          console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_FOCUS_MODE_LOCKED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Mode Locked SUCCESS: " + data);
          console.info(TAG + "Get Focus Mode Locked data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(0);
          console.info(TAG + "GET_FOCUS_MODE_LOCKED PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_LOCKED FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_MODE_LOCKED ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_MANUAL_SUPPORTED
      * @tc.name      : check if focus mode manual is supported-camera0Input api
      * @tc.desc      : check if focus mode manual is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_MANUAL_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED FAILED  " + err.message);
          expect().assertFail();
          console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_MANUAL).assertEqual(0)
        }
        else {
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FOCUS_MODE_MANUAL SUCCESS");
          console.info(TAG + "GET_FOCUS_MODE_MANUAL data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(0);
          console.info(TAG + "GET_FOCUS_MODE_MANUAL PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_MANUAL FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_MODE_MANUAL ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_POINT_focus mode manual
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_POINT_focus mode manual', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_POINT to operate");
      camera0Input.setFocusPoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_POINT_focus mode manual
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_POINT_focus mode manual', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_POINT to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "GET_FOCUS_POINT PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_POINT FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_CONTINUOUS_SUPPORTED
      * @tc.name      : check if focus mode continuous is supported-camera0Input api
      * @tc.desc      : check if focus mode continuous is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_CONTINUOUS_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_CONTINOUS_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          expect(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO).assertEqual(1);
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS PASSED");
        }
        else {
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FOCUS_MODE_CONTINUOUS SUCCESS");
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_POINT_focus mode continuous
      * @tc.name      : set focus Point locked camera0 api
      * @tc.desc      : set focus Point locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_POINT to operate");
      camera0Input.setFocusPoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_POINT_focus mode continuous
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_POINT to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "GET_FOCUS_POINT PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_POINT FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_AUTO_SUPPORTED
      * @tc.name      : check if focus mode auto is supported-camera0Input api
      * @tc.desc      : check if focus mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('IS_FOCUS_MODE_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_AUTO_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FOCUS_MODE_AUTO SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
          if (data != null || data != undefined) {
            expect(cameraObj.FocusMode.FOCUS_MODE_AUTO).assertEqual(2);
            console.info(TAG + "Entering SET_FOCUS_MODE_AUTO PASSED")
          }
        } else {
          console.info(TAG + "Entering SET_FOCUS_MODE_AUTO FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FOCUS_MODE_AUTO SUCCESS");
          console.info(TAG + "GET_FOCUS_MODE_AUTO data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(2);
          console.info(TAG + "GET_FOCUS_MODE_AUTO PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_AUTO FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_POINT_focus mode auto
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_POINT to operate");
      camera0Input.setFocusPoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_POINT_focus mode auto
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_FOCUS_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_POINT to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_FOCUS_POINT PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_POINT FAILED : " + err.message);
          console.info(TAG + "GET_FOCUS_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_EXPOSURE_MODE_LOCKED_SUPPORTED
      * @tc.name      : check if exposure mode locked is supported-camera0Input api
      * @tc.desc      : check if exposure mode locked is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('IS_EXPOSURE_MODE_LOCKED_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_EXPOSURE_MODE_LOCKED_SUPPORTED to operate");
      camera0Input.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Is Exposure Mode Locked supported SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Is Exposure Mode Locked supported data is not null || undefined");
            console.info(TAG + "Exposure_Mode_Locked_Supported is: " + data);
            expect(data).assertEqual(false);
            console.info(TAG + "Entering IS_EXPOSURE_MODE_LOCKED_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_EXPOSURE_MODE_LOCKED_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "IS_EXPOSURE_MODE_LOCKED_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      console.info(TAG + "Entering SET_EXPOSURE_MODE_LOCKED to operate");
      camera0Input.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Mode Locked, current ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
          console.info(TAG + "Entering SET_EXPOSURE_MODE_LOCKED FAILED")
          expect().assertFail();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_MODE_LOCKED PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_EXPOSURE_MODE_LOCKED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_MODE_LOCKED PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_MODE_LOCKED FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_MODE_LOCKED ends here");
        }
        await sleep(1);
        done();
      })
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
      console.info(TAG + "Entering SET_EXPOSURE_POINT to operate");
      camera0Input.setExposurePoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_POINT_exposure mode locked
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_POINT to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_POINT PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_POINT FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_BIASRANGE_exposure mode continuous auto
      * @tc.name      : get exposure bias range camera0 api
      * @tc.desc      : get exposure bias range camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_BIASRANGE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_BIASRANGE to operate");
      camera0Input.getExposureBiasRange(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias range SUCCESS");
          console.info(TAG + "Current Exposure bias range is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_BIASRANGE PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_BIASRANGE FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_BIASRANGE ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setExposureBias(-4, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "-4");
          console.info(TAG + "Entering SET_EXPOSURE_BIAS PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_BIAS FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_BIAS ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_BIASVALUE_exposure mode locked
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_BIASVALUE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_BIASVALUE to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(-4);
          console.info(TAG + "GET_EXPOSURE_BIASVALUE PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_BIASVALUE FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_BIASVALUE ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_EXPOSURE_MODE_AUTO_SUPPORTED
      * @tc.name      : check if exposure mode auto is supported-camera0Input api
      * @tc.desc      : check if exposure mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('IS_EXPOSURE_MODE_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_EXPOSURE_MODE_AUTO_SUPPORTED to operate");
      camera0Input.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Is Exposure Mode Auto supported SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Is Exposure Mode Auto supported data is not null || undefined");
            console.info(TAG + "Exposure_Mode_Auto_Supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering IS_EXPOSURE_MODE_AUTO_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_EXPOSURE_MODE_AUTO_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "IS_EXPOSURE_MODE_AUTO_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Mode auto,current ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
          if (data != null || data != undefined) {
            expect(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO).assertEqual(1);
            console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO PASSED")
          }
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure Mode SUCCESS");
          console.info(TAG + "Get Exposure Mode data is not null || undefined: ");
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "GET_EXPOSURE_MODE_AUTO PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_MODE_AUTO FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_MODE_AUTO ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setExposurePoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_POINT_exposure mode auto
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_POINT to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_POINT PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_POINT FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_POINT ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setExposureBias(1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "1");
          console.info(TAG + "Entering SET_EXPOSURE_BIAS PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_BIAS FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_BIAS ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_BIASVALUE_exposure mode auto
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_BIASVALUE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_BIASVALUE to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(1);
          console.info(TAG + "GET_EXPOSURE_BIASVALUE PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_BIASVALUE FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_BIASVALUE ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : IS_EXPOSURE_MODE_CONTINUOUS_AUTO_SUPPORTED
      * @tc.name      : check if exposure mode continuous auto is supported-camera0Input api
      * @tc.desc      : check if exposure mode continuous auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    /* EXPOSUREMODE Interface will be change
    it('IS_EXPOSURE_MODE_CONTINUOUS_AUTO_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_EXPOSURE_MODE_CONTINUOUS_AUTO_SUPPORTED to operate");
      camera0Input.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Is Exposure Mode continuous Auto supported SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Is Exposure Mode continuous Auto supported data is not null || undefined");
            console.info(TAG + "Exposure_Mode_continuous_Auto_Supported is: " + data);
            expect(data).assertEqual(false);
            console.info(TAG + "Entering IS_EXPOSURE_MODE_CONTINUOUS_AUTO_SUPPORTED PASSED: ");
          }
        } else {
          console.info(TAG + "IS_EXPOSURE_MODE_CONTINUOUS_AUTO_SUPPORTED FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "IS_EXPOSURE_MODE_CONTINUOUS_AUTO_SUPPORTED ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Mode continuous auto,current ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
          console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO FAILED")
          expect().AssertFail();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SET_EXPOSURE_MODE_CONTINUOUS_AUTO ends here");
        }
        await sleep(1);
        done();
      })
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
    it('GET_EXPOSURE_MODE_CONTINUOUS_AUTO', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_MODE_CONTINUOUS_AUTO to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_MODE_CONTINUOUS_AUTO PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_MODE_CONTINUOUS_AUTO FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_MODE_CONTINUOUS_AUTO ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : SET_EXPOSURE_POINT_exposure mode continuous auto
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering SET_EXPOSURE_POINT to operate");
      camera0Input.setExposurePoint(Point, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_EXPOSURE_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_POINT ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_POINT_exposure mode continuous auto
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_POINT', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_POINT to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "GET_EXPOSURE_POINT PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_POINT FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_POINT ends here");
        }
        await sleep(1);
        done();
      })
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
      camera0Input.setExposureBias(4, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "4");
          console.info(TAG + "Entering SET_EXPOSURE_BIAS PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_EXPOSURE_BIAS FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_EXPOSURE_BIAS ends here");
        }
        await sleep(1);
        done();
      })
      await sleep(1);
      done();
    })

    /**
      * @tc.number    : GET_EXPOSURE_BIASVALUE_exposure mode continuous auto
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_EXPOSURE_BIASVALUE', 0, async function (done) {
      console.info(TAG + "Entering GET_EXPOSURE_BIASVALUE to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(4);
          console.info(TAG + "GET_EXPOSURE_BIASVALUE PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_EXPOSURE_BIASVALUE FAILED : " + err.message);
          console.info(TAG + "GET_EXPOSURE_BIASVALUE ends here");
        }
        await sleep(1);
        done();
      })
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
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering isMirrorSupported_PHOTO_OUTPUT to operate");
        photoOutputAsync.isMirrorSupported(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering isMirrorSupported_PHOTO_OUTPUT is success");
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
      * @tc.number    : setMirror_true
      * @tc.name      : setMirror true
      * @tc.desc      : setMirror true
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('setMirror_true', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering setMirror_true to operate");
        photoOutputAsync.setMirror(true, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering setMirror_true is success:");
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
      * @tc.number    : VIDEO_OUTPUT_START
      * @tc.name      : VideoOutput start async api
      * @tc.desc      : VideoOutput start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_START', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + "Entering VIDEO_OUTPUT_START videoOutput == null || undefined")
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_START to operate")
        await sleep(1)
        videoOutput.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering VIDEO_OUTPUT_START success: " + JSON.stringify(data))
            if (data == undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering VIDEO_OUTPUT_START FAILED: " + err.message)
          }
        })
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : VIDEO_RECORDER_START
      * @tc.name      : VideoRecorder start async api
      * @tc.desc      : VideoRecorder start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_RECORDER_START', 0, async function (done) {
      if (videoRecorder == null || videoRecorder == undefined) {
        console.info(TAG + 'Entering VideoRecorder start videoRecorder == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_RECORDER_START to operate')
        videoRecorder.start()
        console.info(TAG + 'VIDEO_RECORDER_START called');
        sleep(3);
        console.info(TAG + 'Capture with photosettings1 during video - Start & setMirror: true')
        photoOutputAsync.capture(photosettings1)
        console.info(TAG + 'Capture during Video - End.')
        expect(true).assertTrue()
        console.info(TAG + 'Entering VIDEO_RECORDER_START PASSED')
        console.info(TAG + 'Entering VIDEO_RECORDER_START ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : VIDEO_OUTPUT_STOP
      * @tc.name      : VideoOutput stop async api
      * @tc.desc      : VideoOutput stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_STOP', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + 'Entering VideoOutput stop videoOutput == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_OUTPUT_STOP to operate')
        videoOutput.stop(async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering VIDEO_OUTPUT_STOP success: ' + JSON.stringify(data))
            if (data == undefined) {
              expect(true).assertTrue()
            }
          } else {
            expect().assertFail()
            console.info(TAG + 'Entering VIDEO_OUTPUT_STOP FAILED: ' + err.message)
          }
          console.info(TAG + 'Entering VIDEO_OUTPUT_STOP ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : VIDEO_RECORDER_STOP
      * @tc.name      : VideoRecorder stop async api
      * @tc.desc      : VideoRecorder stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_RECORDER_STOP', 0, async function (done) {
      if (videoRecorder == null || videoRecorder == undefined) {
        console.info(TAG + 'Entering VideoRecorder stop videoRecorder == null || undefined')
      } else {
        console.info(TAG + 'Entering VIDEO_RECORDER_STOP to operate')
        videoRecorder.stop()
        console.info(TAG + 'VideoRecorder stop stopVideo done.')
        console.info(TAG + 'Entering VIDEO_RECORDER_STOP PASSED')
        expect(true).assertTrue()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : CAPTURE_SESSION_STOP
      * @tc.name      : CaptureSession stop async api
      * @tc.desc      : CaptureSession stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_STOP', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering CaptureSession stop captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering CAPTURE_SESSION_STOP to operate')
        await sleep(1)
        captureSession.stop((err, data) => {
          if (!err) {
            console.info(TAG + 'Entering CaptureSession stop success')
            expect(true).assertTrue()
            console.info(TAG + 'Entering CAPTURE_SESSION_STOP PASSED')
          } else {
            console.info(TAG + 'Entering CAPTURE_SESSION_STOP FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering CAPTURE_SESSION_STOP ends here')
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : CAPTURE_SESSION_RELEASE
      * @tc.name      : CaptureSession release async api
      * @tc.desc      : CaptureSession release async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_RELEASE', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + 'Entering CaptureSession release captureSession == null || undefined')
      } else {
        console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE to operate')
        await sleep(1)
        captureSession.release(async (err, data) => {
          if (!err) {
            console.info(TAG + 'Entering CaptureSession release success')
            if (data != null || data != undefined) {
              console.info(TAG + 'Entering CaptureSession release data is not null || undefined')
              expect(true).assertTrue()
              console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE PASSED')
            }
          } else {
            console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE ends here')
          await sleep(1)
          done()
        })
        await sleep(1)
        done()
      }
    })

    /**
      * @tc.number    : VIDEOOUPUT_RELEASE_SUCCESS
      * @tc.name      : videooutput release api
      * @tc.desc      : videooutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEOOUPUT_RELEASE_SUCCESS', 0, async function (done) {
      if (videoOutput == null || videoOutput == undefined) {
        console.info(TAG + "Entering videooutput.release previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering VIDEOOUPUT_RELEASE_SUCCESS to operate");
        videoOutput.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering videooutput.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering videooutput.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering VIDEOOUPUT_RELEASE_SUCCESS PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering VIDEOOUPUT_RELEASE_SUCCESS FAILED: " + err.message);
            console.info(TAG + "Entering  VIDEOOUPUT_RELEASE_SUCCESS ends here");
            await sleep(1);
            done();
          }
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : PREVIEWOUPUT_RELEASE_SUCCESS
      * @tc.name      : previewOutput release api
      * @tc.desc      : previewOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEWOUPUT_RELEASE_SUCCESS', 0, async function (done) {
      if (previewOutput == null || previewOutput == undefined) {
        console.info(TAG + "Entering PREVIEWOUPUT_RELEASE_SUCCESS previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEWOUPUT_RELEASE_SUCCESS to operate");
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
            console.info(TAG + "Entering PREVIEWOUPUT_RELEASE_SUCCESS FAILED: " + err.message);
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
      * @tc.number    : PHOTOOUPUT_RELEASE
      * @tc.name      : photoOutput release api
      * @tc.desc      : photoOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTOOUPUT_RELEASE', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUPUT_RELEASE photoOutputAsync == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUPUT_RELEASE to operate");
        photoOutputAsync.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutputAsync.release success");
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTOOUPUT_RELEASE PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering PHOTOOUPUT_RELEASE FAILED: " + err.message);
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
      * @tc.number    : CAMERAINPUT_RELEASE_SUCCESS
      * @tc.name      : camera Input release api
      * @tc.desc      : camera Input release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAMERAINPUT_RELEASE_SUCCESS', 0, async function (done) {
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering camera0Input.release camera0Input == null || undefined");
      } else {
        console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS to operate");
        camera0Input.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering camera0Input.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering camera0Input.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS FAILED: " + err.message);
            console.info(TAG + "Entering  CAMERAINPUT_RELEASE_SUCCESS ends here");
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