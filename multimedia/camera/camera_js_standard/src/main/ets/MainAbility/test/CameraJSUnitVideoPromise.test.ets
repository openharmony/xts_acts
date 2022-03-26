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
  videoFrameRate: 10
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
var videoId
var videoOutputPromise
var captureSessionPromise

export default function cameraJSUnitVideoPromise(surfaceId: any) {
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
      console.info(TAG + 'Entering GET_CAMERA_MANAGER_PROMISE cameraManagerPromise: ' + cameraManagerPromise)
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
        console.info(TAG + 'Entering CAMERA_STATUS_CALLBACK cameraManagerPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAMERA_STATUS_CALLBACK to operate')
        await sleep(1)
        cameraManagerPromise.on("cameraStatus", async (err, data) => {
          if (!err) {
            console.info(TAG + "Camera status Callback on cameraManagerPromise is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Camera status Callback CameraStatusInfo_Camera: " + data.camera);
              console.info(TAG + "Camera status Callback CameraStatusInfo_Status: " + data.status);

              expect(true).assertTrue();
            }
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
      console.info(TAG + 'Entering GET_CAMERAS_PROMISE: ' + JSON.stringify(camerasArrayPromise))
      if (camerasArrayPromise != null && camerasArrayPromise.length > 0) {
        console.info(TAG + 'Entering GET_CAMERAS_PROMISE success')
        for (var i = 0; i < camerasArrayPromise.length; i++) {
          // Get the variables from camera object
          var cameraId = camerasArrayPromise[i].cameraId
          console.info(TAG + 'Entering GET_CAMERAS_PROMISE camera' + i + 'Id: ' + cameraId)
          var cameraPosition = camerasArrayPromise[i].cameraPosition
          console.info(TAG + 'Entering GET_CAMERAS_PROMISE camera' + i + 'Position: ' + cameraPosition)
          var cameraType = camerasArrayPromise[i].cameraType
          console.info(TAG + 'Entering GET_CAMERAS_PROMISE camera' + i + 'Type: ' + cameraType)
          var connectionType = camerasArrayPromise[i].connectionType
          console.info(TAG + 'Entering GET_CAMERAS_PROMISE connection' + i + 'Type: ' + connectionType)
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
      console.info(TAG + 'Entering CREATE_CAMERA_INPUT_PROMISE camera0InputPromise: ' + JSON.stringify(camera0InputPromise))
      if (camera0InputPromise != null && camera0InputPromise != undefined) {
        console.info(TAG + 'Entering CREATE_CAMERA_INPUT_PROMISE camera0InputPromise is not null || undefined')
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
        console.info(TAG + "Entering CAMERA_INPUT_CALLBACK_ON_ERROR camera0InputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering CAMERA_INPUT_CALLBACK_ON_ERROR to operate");
        camera0InputPromise.on("error", async (err, data) => {
          if (!err) {
            console.info(TAG + "camera0InputPromise error callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during camera0InputPromise with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
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
      console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE previewOutputPromise: ' + JSON.stringify(previewOutputPromise))
      if (previewOutputPromise != null && previewOutputPromise != undefined) {
        console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE previewOutputPromise is not null || undefined')
        expect(true).assertTrue()
        console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE PASSED')
      } else {
        expect().assertFail()
        console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE FAILED')
      }
      console.info(TAG + 'Entering CREATE_PREVIEW_OUTPUT_PROMISE ends here')
      await sleep(1)
      done()
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
        console.info(TAG + 'Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR previewOutputPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR to operate')
        await sleep(1)
        previewOutputPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during PreviewOutput with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
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
      console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE: ' + captureSessionPromise)
      if (captureSessionPromise != null && captureSessionPromise != undefined) {
        expect(true).assertTrue()
        console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE PASSED')
      } else {
        expect(true).assertTrue()
        console.info(TAG + 'Entering CREATE_CAPTURE_SESSION_PROMISE PASSED')
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
        console.info(TAG + 'Entering CAP_SES_CALLBACK_ON_ERROR captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAP_SES_CALLBACK_ON_ERROR to operate')
        await sleep(1)
        captureSessionPromise.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + " captureSession errorcallback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error in CaptureSessioncallback with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
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
      * @tc.number    : BEGIN_CONFIG_PROMISE
      * @tc.name      : CaptureSession begin config promise api
      * @tc.desc      : CaptureSession begin config promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('BEGIN_CONFIG_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering BEGIN_CONFIG_PROMISE captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering BEGIN_CONFIG_PROMISE to operate')
        await captureSessionPromise.beginConfig()
        expect(true).assertTrue()
        console.info(TAG + 'Entering BEGIN_CONFIG_PROMISE PASSED')
        console.info(TAG + 'Entering BEGIN_CONFIG_PROMISE ends here')
        await sleep(1)
        done()
      }

      await sleep(1)
      done()
    })

    /**
      * @tc.number    : ADD_INPUT_PROMISE
      * @tc.name      : AddInput promise api
      * @tc.desc      : AddInput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_INPUT_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering ADD_INPUT_PROMISE captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_INPUT_PROMISE to operate')
        await captureSessionPromise.addInput(camera0InputPromise)
        expect(true).assertTrue()
        console.info(TAG + 'Entering ADD_INPUT_PROMISE PASSED')
        console.info(TAG + 'Entering ADD_INPUT_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW_PROMISE
      * @tc.name      : AddOutput preview promise api
      * @tc.desc      : AddOutput preview promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PREVIEW_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE to operate')
        await captureSessionPromise.addOutput(previewOutputPromise)
        expect(true).assertTrue()
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE PASSED')
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
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
        if (Promise != null || Promise != undefined) {
          console.info(TAG + "Entering REMOVE_INPUT_SUCCESS  data is not null || undefined");
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
        console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS addInput success " + Promise);
        if (Promise != null || Promise != undefined) {
          console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS addInput data is not null || undefined");
          expect(true).assertTrue();
          console.info(TAG + "Entering REMOVE_PREVIEW_OUTPUT_SUCCESS addInput PASSED");
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
      * @tc.number    : ADD_INPUT_PROMISE1
      * @tc.name      : AddInput promise api
      * @tc.desc      : AddInput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_INPUT_PROMISE1', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering ADD_INPUT_PROMISE1 captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_INPUT_PROMISE1 to operate')
        await captureSessionPromise.addInput(camera0InputPromise)
        expect(true).assertTrue()
        console.info(TAG + 'Entering ADD_INPUT_PROMISE1 PASSED')
        console.info(TAG + 'Entering ADD_INPUT_PROMISE1 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW_PROMISE1
      * @tc.name      : AddOutput preview promise api
      * @tc.desc      : AddOutput preview promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('ADD_OUTPUT_PREVIEW_PROMISE1', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE1 captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE1 to operate')
        await captureSessionPromise.addOutput(previewOutputPromise)
        expect(true).assertTrue()
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE1 PASSED')
        console.info(TAG + 'Entering ADD_OUTPUT_PREVIEW_PROMISE1 ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
    })

    /**
      * @tc.number    : COMMIT_CONFIG_PROMISE
      * @tc.name      : CommitConfig promise api
      * @tc.desc      : CommitConfig promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('COMMIT_CONFIG_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering COMMIT_CONFIG_PROMISE captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering COMMIT_CONFIG_PROMISE to operate')
        await captureSessionPromise.commitConfig()
        expect(true).assertTrue()
        console.info(TAG + 'Entering COMMIT_CONFIG_PROMISE PASSED')
        console.info(TAG + 'Entering COMMIT_CONFIG_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
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
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        previewOutputPromise.on("frameStart", async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewStart frameStart Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
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
          }
          await sleep(1);
          done();
        })
        await sleep(1);
        done();
      }
    })

    /**
      * @tc.number    : CAPTURE_SESSION_START_PROMISE
      * @tc.name      : CaptureSession start promise api
      * @tc.desc      : CaptureSession start promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_START_PROMISE', 0, async function (done) {
      if (captureSessionPromise == null || captureSessionPromise == undefined) {
        console.info(TAG + 'Entering CAPTURE_SESSION_START_PROMISE captureSessionPromise == null || undefined')
      } else {
        console.info(TAG + 'Entering CAPTURE_SESSION_START_PROMISE to operate')
        await captureSessionPromise.start()
        expect(true).assertTrue()
        console.info(TAG + 'Entering CAPTURE_SESSION_START_PROMISE PASSED')
        console.info(TAG + 'Entering CAPTURE_SESSION_START_PROMISE ends here')
        await sleep(1)
        done()
      }
      await sleep(1)
      done()
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
        expect(true).assertTrue();
        console.info(TAG + "Entering HAS_FLASH PASSED with HAS_FLASH is: " + JSON.stringify(hasFlashPromise));
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering HAS_FLASH FAILED");
      }
      console.info(TAG + "Entering HAS_FLASH_TC_021 ends here");
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
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED FAILED");
        console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED ends here");
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
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED FAILED");
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED ends here");
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
        expect(isFMAutoSupported).assertEqual(false);
        console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED FAILED");
        console.info(TAG + "Entering IS_FLASH_MODE_AUTO_SUPPORTED ends here");
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
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED FAILED");
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED ends here");
      }
      await sleep(1);
      done();
    })

    // FOCUS promise API's	
    /**
      * @tc.number    : IS_FOCUS_MODE_LOCKED_SUPPORTED
      * @tc.name      : check if flash mode close is supported-camera0Input api
      * @tc.desc      : check if flash mode close is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('IS_FOCUS_MODE_LOCKED_SUPPORTED', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED to operate");
      var isFMLockedSupported = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
      console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED SUCCESS ");
      if (isFMLockedSupported != null || isFMLockedSupported != undefined) {
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED data is not null || undefined");
        console.info(TAG + "IS_FOCUS_MODE_LOCKED_SUPPORTED: " + isFMLockedSupported);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED FAILED");
        console.info(TAG + "Entering IS_FOCUS_MODE_LOCKED_SUPPORTED ends here");
      }
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
        console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMmanualSupportedpromise);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED FAILED");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED ends here");
      }
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
      var isFMContinuousSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      if (isFMContinuousSupportedpromise != null || isFMContinuousSupportedpromise != undefined) {
        console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMContinuousSupportedpromise);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED FAILED");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED ends here");
      }
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
      var isFMAutoSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
      if (isFMAutoSupportedpromise != null || isFMAutoSupportedpromise != undefined) {
        console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMAutoSupportedpromise);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED FAILED");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED ends here");
      }
      await sleep(1);
      done();
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
        console.info(TAG + 'Entering CAPTURE_SESSION_STOP_PROMISE captureSessionPromise == null || undefined')
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
        console.info(TAG + 'Entering CAPTURE_SESSION_RELEASE_PROMISE captureSessionPromise == null || undefined')
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
      * @tc.number    : PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE
      * @tc.name      : PreviewOutput release api
      * @tc.desc      : PreviewOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE previewOutputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEWOUTPUT_RELEASE_SUCCESS_PROMISE to operate");
        const promise = await previewOutputPromise.release();
        console.info(TAG + "Entering previewOutputPromise.release promise: " + JSON.stringify(promise));
        if (promise != null || promise != undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering previewOutputPromise.release PASSED");
        }
        console.info(TAG + "Entering previewOutputPromise.release ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
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
        console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS_PROMISE camera0InputPromise == null || undefined");
      } else {
        console.info(TAG + "Entering CAMERAINPUT_RELEASE_SUCCESS_PROMISE to operate");
        const promise = await camera0InputPromise.release();
        console.info(TAG + "Entering camera0InputPromise.release promise: " + JSON.stringify(promise));
        if (promise != null || promise != undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering camera0InputPromise.release PASSED");
        }
        console.info(TAG + "Entering camera0InputPromise.release ends here");
        await sleep(1);
        done();
      }
      await sleep(1);
      done();
    })
  })
}