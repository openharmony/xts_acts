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

let captureSetting = {
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
let videoSurfaceId;
let fdPath;
let fileAsset;
let fdNumber;

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
      console.info(TAG + 'createVideoRecorder called')
      videoRecorder = recorder
      console.info(TAG + 'videoRecorder is :' + JSON.stringify(videoRecorder))
      console.info(TAG + 'videoRecorder.prepare called.')
      videoRecorder.prepare(videoConfig, (err) => {
        console.info(TAG + 'videoRecorder.prepare success.')
      })
      videoRecorder.getInputSurface((err, id) => {
        console.info(TAG + 'getInputSurface called')
        videoSurfaceId = id
        console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(videoSurfaceId))
      })
    })
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
      let permissionName6 = 'ohos.permission.START_ABILITIES_FROM_BACKGROUND';
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
      console.info('afterAll case');
    })


    /**
      * @tc.number    : GET_CAMERA_MANAGER_INSTANCE
      * @tc.name      : Create CameraManager instance async api
      * @tc.desc      : Create CameraManager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERA_MANAGER', 0, async function (done) {
      console.info(TAG + " --------------GET_CAMERA_MANAGER_INSTANCE--------------");
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
      * @tc.level     : Level 0
    */
    it('GET_CAMERAS', 0, async function (done) {
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
      * @tc.number    : CREATE_PREVIEW_OUTPUT
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT', 0, async function (done) {
      console.info(TAG + " --------------CREATE_CAMERA_INPUT--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT cameraManager == null || undefined")
        expect().assertFail();
      } else {
        cameraInput = await cameraManager.createCameraInput(cameraDevicesArray[0]);
        if (isEmpty(cameraInput)) {
          console.info(TAG + "CREATE_CAMERA_INPUT FAILED");
        }
        cameraInput.open(async (err) => {
          if (!err) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT open callback");
          } else {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
    })



    /**
      * @tc.number    : CREATE_PREVIEW_OUTPUT
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PREVIEW_OUTPUT', 0, async function (done) {
      console.info(TAG + " --------------CREATE_PREVIEW_OUTPUT--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  CREATE_PREVIEW_OUTPUT")
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        let previewProfilesArray = cameraOutputCap.previewProfiles;
        if (isEmpty(previewProfilesArray)) {
          console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT previewProfilesArray == null || undefined")
          expect(isEmpty(previewProfilesArray)).assertFalse();
        }
        cameraManager.createPreviewOutput(previewProfilesArray[0], surfaceId, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT success");
            previewOutput = data;
          } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT FAILED: " + err.message);
          }
          console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CREATE_PHOTO_OUTPUT
      * @tc.name      : Create photoOutput instance async api
      * @tc.desc      : Create photoOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PHOTO_OUTPUT', 0, async function (done) {
      console.info(TAG + " --------------CREATE_PHOTO_OUTPUT--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_PHOTO_OUTPUT cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        let photoProfilesArray = cameraOutputCap.photoProfiles;
        if (isEmpty(photoProfilesArray)) {
          console.info(TAG + "Entering CREATE_PREVIEW_OUTPUT previewProfilesArray == null || undefined")
          expect().assertFalse();
        }
        photoOutput = await cameraManager.createPhotoOutput(photoProfilesArray[0], surfaceId1);
        if (isEmpty(photoOutput)) {
          console.info(TAG + "Entering CREATE_PHOTO_OUTPUT data is empty");
          expect().assertFalse();
        }
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CREATE_VIDEO_OUTPUT
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_VIDEO_OUTPUT', 0, async function (done) {
      console.info(TAG + " --------------CREATE_VIDEO_OUTPUT--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_VIDEO_OUTPUT cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = await getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        console.info("CREATE_VIDEO_OUTPUT camera:" + cameraDevicesArray[0].cameraId);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap.videoProfiles;
        expect(isEmpty(videoProfilesArray)).assertFalse();
        console.info(TAG + "Entering CREATE_VIDEO_OUTPUT start createVideoOutput")
        cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CREATE_VIDEO_OUTPUT is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering CREATE_VIDEO_OUTPUT success");
            videoOutput = data;
          } else {
            console.info(TAG + "Entering CREATE_VIDEO_OUTPUT FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CREATE_VIDEO_OUTPUT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CREATE_CAPTURE_SESSION
      * @tc.name      : Create CaptureSession instance api
      * @tc.desc      : Create CaptureSession instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAPTURE_SESSION', 0, async function (done) {
      console.info(TAG + "--------------CREATE_CAPTURE_SESSION--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_CAPTURE_SESSION cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  CREATE_CAPTURE_SESSION")
        cameraManager.createCaptureSession(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering createCaptureSession is not error");
            expect(isEmpty(data)).assertFalse();
            captureSession = data;
            console.info(TAG + "Entering CREATE_CAPTURE_SESSION PASSED");
          } else {
            console.info(TAG + "Entering CREATE_CAPTURE_SESSION FAILED : " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CREATE_CAPTURE_SESSION ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : CAPTURE_SESSION_BEGIN_CONFIG
      * @tc.name      : captureSession beginConfig
      * @tc.desc      : captureSession beginConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_BEGIN_CONFIG', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_BEGIN_CONFIG--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_BEGIN_CONFIG captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.beginConfig(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering CAPTURE_SESSION_BEGIN_CONFIG success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering CAPTURE_SESSION_BEGIN_CONFIG FAILED: " + err.message);
          }
          console.info(TAG + "Entering CAPTURE_SESSION_BEGIN_CONFIG ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CAPTURE_SESSION_ADD_INPUT
      * @tc.name      : captureSession addInput
      * @tc.desc      : captureSession addInput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_ADD_INPUT', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_ADD_INPUT--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_ADD_INPUT captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addInput(cameraInput, async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_INPUT success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_INPUT FAILED: " + err.message);
          }
          console.info(TAG + "Entering CAPTURE_SESSION_ADD_INPUT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CAPTURE_SESSION_ADD_PREVIEW_OUTPUT
      * @tc.name      : captureSession add previewOutput
      * @tc.desc      : captureSession add previewOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_ADD_PREVIEW_OUTPUT', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_ADD_PREVIEW_OUTPUT--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_ADD_PREVIEW_OUTPUT captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(previewOutput)) {
          console.info(TAG + "Entering CAPTURE_SESSION_ADD_PREVIEW_OUTPUT previewOutput == null || undefined")
          expect().assertFail();
        }
        captureSession.addOutput(previewOutput, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_PREVIEW_OUTPUT success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_PREVIEW_OUTPUT FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CAPTURE_SESSION_ADD_PREVIEW_OUTPUT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : CAPTURE_SESSION_ADD_PHOTO_OUTPUT
      * @tc.name      : captureSession add photoOutput
      * @tc.desc      : captureSession add photoOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_ADD_PHOTO_OUTPUT', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_ADD_PHOTO_OUTPUT--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_ADD_PHOTO_OUTPUT captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(photoOutput)) {
          console.info(TAG + "Entering CAPTURE_SESSION_ADD_PHOTO_OUTPUT photoOutput == null || undefined")
          expect().assertFail();
        }
        console.info(TAG + "captureSession start add photoOutput")
        captureSession.addOutput(photoOutput, async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_PHOTO_OUTPUT success");
          } else {
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_PHOTO_OUTPUT FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CAPTURE_SESSION_ADD_PHOTO_OUTPUT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : CAPTURE_SESSION_REMOVE_PHOTO_OUTPUT
      * @tc.name      : captureSession remove photoOutput
      * @tc.desc      : captureSession remove photoOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_ADD_VIDEO_OUTPUT', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_ADD_VIDEO_OUTPUT--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_ADD_VIDEO_OUTPUT captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addOutput(videoOutput, async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_VIDEO_OUTPUT success");
          } else {
            console.info(TAG + "Entering CAPTURE_SESSION_ADD_VIDEO_OUTPUT FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CAPTURE_SESSION_ADD_VIDEO_OUTPUT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CAPTURE_SESSION_COMMIT_CONFIG
      * @tc.name      : captureSession commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_COMMIT_CONFIG', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_COMMIT_CONFIG--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_COMMIT_CONFIG captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.commitConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CAPTURE_SESSION_COMMIT_CONFIG success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering CAPTURE_SESSION_COMMIT_CONFIG FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CAPTURE_SESSION_COMMIT_CONFIG ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : CAPTURE_SESSION_START
      * @tc.name      : captureSession start
      * @tc.desc      : captureSession start
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CAPTURE_SESSION_START', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_START--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering CAPTURE_SESSION_START captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering CAPTURE_SESSION_START success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering CAPTURE_SESSION_START FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering CAPTURE_SESSION_START ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
       * @tc.number    : START_PREVIEW_OUTPUT_PROMISE
       * @tc.name      : Create previewOutput instance promise api
       * @tc.desc      : Create previewOutput instance promise api
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
     */
    it('START_PREVIEW_OUTPUT_PROMISE', 0, async function (done) {
      console.info(TAG + " --------------START_PREVIEW_OUTPUT_PROMISE--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering START_PREVIEW_OUTPUT_PROMISE previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering START_PREVIEW_OUTPUT_PROMISE start")
        previewOutput.start();
        console.info(TAG + "Entering START_PREVIEW_OUTPUT_PROMISE end")
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : STOP_PREVIEW_OUTPUT_PROMISE
      * @tc.name      : Create previewOutput instance promise api
      * @tc.desc      : Create previewOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('STOP_PREVIEW_OUTPUT_PROMISE', 0, async function (done) {
      console.info(TAG + " --------------STOP_PREVIEW_OUTPUT_PROMISE--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_PROMISE previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_PROMISE start")
        previewOutput.stop();
        console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_PROMISE end")
      }
      await sleep(1000);
      done();
    })




    /**
       * @tc.number    : START_PREVIEW_OUTPUT_ASYNC
       * @tc.name      : Create previewOutput instance async api
       * @tc.desc      : Create previewOutput instance async api
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
     */
    it('START_PREVIEW_OUTPUT_ASYNC', 0, async function (done) {
      console.info(TAG + " --------------START_PREVIEW_OUTPUT_ASYNC--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering START_PREVIEW_OUTPUT_ASYNC previewOutput == null || undefined")
        expect().assertFail();
      } else {
        previewOutput.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering START_PREVIEW_OUTPUT_ASYNC success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering START_PREVIEW_OUTPUT_ASYNC FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering START_PREVIEW_OUTPUT_ASYNC ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : START_PREVIEW_OUTPUT_ASYNC
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('STOP_PREVIEW_OUTPUT_ASYNC', 0, async function (done) {
      console.info(TAG + " --------------STOP_PREVIEW_OUTPUT_ASYNC--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_ASYNC previewOutput == null || undefined")
        expect().assertFail();
      } else {
        previewOutput.stop(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_ASYNC success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_ASYNC FAILED: " + err.message);
          }
          console.info(TAG + "Entering STOP_PREVIEW_OUTPUT_ASYNC ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : preview output callback on frameStart api
      * @tc.desc      : preview output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      console.info("--------------PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        previewOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Error in PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START FAILED: " + err.message);
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
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END
      * @tc.name      : preview output callback on frameEnd api
      * @tc.desc      : preview output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END', 0, async function (done) {
      console.info("--------------PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END to operate");
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_ERROR
      * @tc.name      : preview output callback on frameEnd api
      * @tc.desc      : preview output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PREVIEW_OUTPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      console.info("--------------PREVIEW_OUTPUT_CALLBACK_ON_ERROR--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR to operate");
        previewOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in PREVIEW_OUTPUT_CALLBACK_ON_ERROR FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PHOTO_OUTPUT_CAPTURE_DEFAULT
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CAPTURE_DEFAULT', 0, async function (done) {
      console.info(TAG + " --------------CAPTURE_SESSION_COMMIT_CONFIG--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_DEFAULT photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_DEFAULT success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_DEFAULT FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_DEFAULT ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : PHOTO_OUTPUT_CAPTURE_SETTING
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CAPTURE_SETTING', 0, async function (done) {
      console.info(TAG + " --------------PHOTO_OUTPUT_CAPTURE_SETTING--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_SETTING photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(captureSetting, async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_SETTING success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_SETTING FAILED: " + err.message);
          }
          console.info(TAG + "Entering PHOTO_OUTPUT_CAPTURE_SETTING ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START
      * @tc.name      : photo output callback on captureStart
      * @tc.desc      : photo output callback on captureStart
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START', 0, async function (done) {
      console.info("--------------PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START to operate");
        photoOutput.on('captureStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER
      * @tc.name      : photo output callback on frameShutter
      * @tc.desc      : photo output callback on frameShutter
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER', 0, async function (done) {
      console.info("--------------PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER to operate");
        photoOutput.on('frameShutter', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END
      * @tc.name      : photo output callback on captureEnd
      * @tc.desc      : photo output callback on captureEnd
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END', 0, async function (done) {
      console.info("--------------PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END to operate");
        photoOutput.on('captureEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PHOTO_OUTPUT_CALLBACK_ON_ERROR
      * @tc.name      : photo output callback on error
      * @tc.desc      : photo output callback on error
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_CALLBACK_ON_ERROR', 0, async function (done) {
      console.info("--------------PHOTO_OUTPUT_CALLBACK_ON_ERROR--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR to operate");
        photoOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in PHOTO_OUTPUT_CALLBACK_ON_ERROR FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })





    /**
      * @tc.number    : PHOTO_OUTPUT_RELEASE
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('PHOTO_OUTPUT_RELEASE', 0, async function (done) {
      console.info(TAG + " --------------PHOTO_OUTPUT_RELEASE--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PHOTO_OUTPUT_RELEASE photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.release(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering PHOTO_OUTPUT_RELEASE success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering PHOTO_OUTPUT_RELEASE FAILED: " + err.message);
          }
          console.info(TAG + "Entering PHOTO_OUTPUT_RELEASE ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })





    /**
      * @tc.number    : VIDEO_OUTPUT_START_PROMISE
      * @tc.name      : videoOutput start promise api
      * @tc.desc      : videoOutput start promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_START_PROMISE', 0, async function (done) {
      console.info(TAG + " --------------VIDEO_OUTPUT_START_PROMISE--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_START_PROMISE videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_START_PROMISE start")
        videoOutput.start();
        console.info(TAG + "Entering VIDEO_OUTPUT_START_PROMISE end")
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : VIDEO_OUTPUT_STOP_PROMISE
      * @tc.name      : videoOutput stop promise api
      * @tc.desc      : videoOutput stop promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_STOP_PROMISE', 0, async function (done) {
      console.info(TAG + " --------------VIDEO_OUTPUT_STOP_PROMISE--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_STOP_PROMISE videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_STOP_PROMISE start")
        videoOutput.stop();
        console.info(TAG + "Entering VIDEO_OUTPUT_STOP_PROMISE end")
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : VIDEO_OUTPUT_START_ASYNC
      * @tc.name      : videoOutput start async api
      * @tc.desc      : videoOutput start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_START_ASYNC', 0, async function (done) {
      console.info(TAG + " --------------VIDEO_OUTPUT_START_ASYNC--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_START_ASYNC videoOutput == null || undefined")
        expect().assertFail();
      } else {
        videoOutput.start(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering VIDEO_OUTPUT_START_ASYNC success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering VIDEO_OUTPUT_START_ASYNC FAILED: " + err.message);
          }
          console.info(TAG + "Entering VIDEO_OUTPUT_START_ASYNC ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : VIDEO_OUTPUT_STOP_ASYNC
      * @tc.name      : videoOutput stop async api
      * @tc.desc      : videoOutput stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_STOP_ASYNC', 0, async function (done) {
      console.info(TAG + " --------------VIDEO_OUTPUT_STOP_ASYNC--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_STOP_ASYNC videoOutput == null || undefined")
        expect().assertFail();
      } else {
        videoOutput.stop(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering VIDEO_OUTPUT_STOP_ASYNC success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering VIDEO_OUTPUT_STOP_ASYNC FAILED: " + err.message);
          }
          console.info(TAG + "Entering VIDEO_OUTPUT_STOP_ASYNC ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : video output callback on frameStart api
      * @tc.desc      : video output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      console.info("--------------VIDEO_OUTPUT_CALLBACK_ON_FRAME_START--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        videoOutput.on('frameStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in VIDEO_OUTPUT_CALLBACK_ON_FRAME_START FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_START
      * @tc.name      : video output callback on frameStart api
      * @tc.desc      : video output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_START', 0, async function (done) {
      console.info("--------------VIDEO_OUTPUT_CALLBACK_ON_FRAME_START--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START to operate");
        videoOutput.on('frameStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_START success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in VIDEO_OUTPUT_CALLBACK_ON_FRAME_START FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_END
      * @tc.name      : video output callback on frameEnd api
      * @tc.desc      : video output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_END', 0, async function (done) {
      console.info("--------------VIDEO_OUTPUT_CALLBACK_ON_FRAME_END--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_END videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_END to operate");
        videoOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_END success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in VIDEO_OUTPUT_CALLBACK_ON_FRAME_END FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR
      * @tc.name      : video output callback on error api
      * @tc.desc      : video output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR', 0, async function (done) {
      console.info("--------------VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR to operate");
        videoOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR FAILED: " + err.message);
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