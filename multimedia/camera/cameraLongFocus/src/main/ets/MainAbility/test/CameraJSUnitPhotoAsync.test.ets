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
import fileio from '@ohos.fileio';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

const TAG = "CameraModuleTest: ";

// Define global variables
var camera0Input;
var camera1Input;
var cameraManager;
var previewOutputAsync;
var photoOutputAsync;
var captureSession;
var surfaceId1;
var camerasArray;

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

export default function cameraJSUnitPhotoAsync(surfaceId: any) {

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

  function sleep(ms) {
    console.info(TAG + "Entering sleep -> Promise constructor");
    return new Promise(resolve => setTimeout(resolve, ms));
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

  describe('CameraJsUnitPhotoAsync', function () {
    console.info(TAG + '----------CameraJsUnitPhotoAsync--------------')

    beforeAll(async function () {
      await applyPermission();
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
      console.info('afterAll case');
    })

    console.info(TAG + "----------Camera-Precision Control-Async-------------");
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100--------------");
      cameraObj.getCameraManager(null, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Camera Manager success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Camera Manager data is not null || undefined");
            cameraManager = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100 PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
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
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 cameraManager == null || undefined")
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 to operate")
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
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_STATUS_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100
      * @tc.name      : Get camera from cameramanager to get array of camera async api
      * @tc.desc      : Get camera from cameramanager to get array of camera async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100--------------");
      cameraManager.getCameras(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GetCameras success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering GetCameras data is not null || undefined");
            camerasArray = data;
            if (camerasArray != null && camerasArray.length > 0) {
              for (var i = 0; i < camerasArray.length; i++) {
                // Get the variables from camera object
                var cameraId = camerasArray[i].cameraId;
                console.info(TAG + "Entering GetCameras camera" + i + "Id: " + cameraId);
                var cameraPosition = camerasArray[i].cameraPosition;
                console.info(TAG + "Entering GetCameras camera" + i + "Position: " + cameraPosition);
                var cameraType = camerasArray[i].cameraType;
                console.info(TAG + "Entering GetCameras camera" + i + "Type: " + cameraType);
                var connectionType = camerasArray[i].connectionType
                console.info(TAG + "Entering GetCameras connection" + i + "Type: " + connectionType);
              }
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 PASSED");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED cameraArray is null || undefined");
            }
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
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
      cameraManager.createCameraInput(camerasArray[0].cameraId, async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 data is not null || undefined");
            camera0Input = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 PASSED with CameraID :" + camerasArray[0].cameraId);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0200
      * @tc.name      : Create camerainput from camera-1 cameraId async api
      * @tc.desc      : Create camerainput from camera-1 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0200', 0, async function (done) {
      cameraManager.createCameraInput(camerasArray[1].cameraId, async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0200 data is not null || undefined");
            camera1Input = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0200 PASSED with CameraID :" + camerasArray[1].cameraId);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0200 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0200 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
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
        console.info(TAG + "Entering CameraInputCallbackOnError  cameraInput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 to operate");
        camera0Input.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "cameraInput error callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_CALLBACK_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /*PreviewOutput APIs test script*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_SUCCESS_0100
      * @tc.name      : Create PreviewOutput instance api
      * @tc.desc      : Create PreviewOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_SUCCESS_0100', 0, async function (done) {
      console.info(TAG + " Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_SUCCESS_0100 to operate");
      cameraObj.createPreviewOutput(surfaceId, async (err, data) => {
        if (!err) {
          console.info(TAG + " Entering  createPreviewOutput success");
          if (data != null || data != undefined) {
            console.info(TAG + " Entering createPreviewOutput data is not null || undefined");
            previewOutputAsync = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_SUCCESS_0100 PASSED" + previewOutputAsync);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_SUCCESS_0100 FAILED : " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_SUCCESS_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_0100
      * @tc.name      : Preview output callback on error api
      * @tc.desc      : Preview output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_0100', 0, async function (done) {
      if (previewOutputAsync == null || previewOutputAsync == undefined) {
        console.info(TAG + "Entering PreviewOutputError callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_0100 to operate");
        previewOutputAsync.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /*PhotoOutput APIs test script*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_0100
      * @tc.name      : Create PhotoOutput instance api
      * @tc.desc      : Create PhotoOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_0100 to operate");
      console.info(TAG + 'Entering getImageReceiverSurfaceId')
      await getImageReceiverSurfaceId()
      await sleep(1000)
      cameraObj.createPhotoOutput(surfaceId1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering  createPhotoOutput success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering  createPhotoOutput data is not null || undefined");
            photoOutputAsync = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_0100 PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_SUCCESS_0100 FAILED : " + err.message);
          console.info(TAG + "Entering  createPhotoOutput ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_0100
      * @tc.name      : Photo output callback on error api
      * @tc.desc      : Photo output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_0100 to operate");
        photoOutputAsync.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "PhotoOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during PhotoOutput with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /*CaptureSession APIs test script*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_SUCCESS_0100
      * @tc.name      : Create CaptureSession instance api
      * @tc.desc      : Create CaptureSession instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_SUCCESS_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_SUCCESS_0100 to operate");
      cameraObj.createCaptureSession(null, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering createCaptureSession success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering createCaptureSession data is not null || undefined");
            captureSession = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_SUCCESS_0100 PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_SUCCESS_0100 FAILED : " + err.message);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_SUCCESS_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    //Capturesession callback
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAP_SES_CALLBACK_ON_ERROR_0100
      * @tc.name      : CaptureSession callback on error api
      * @tc.desc      : CaptureSession callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAP_SES_CALLBACK_ON_ERROR_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering captureSession error callback captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAP_SES_CALLBACK_ON_ERROR_0100 to operate");
        captureSession.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + " captureSession error callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAP_SES_CALLBACK_ON_ERROR_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_CAP_SES_CALLBACK_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /*CaptureSession APIs*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0100
      * @tc.name      : CaptureSession_Begin config api
      * @tc.desc      : CaptureSession_Begin config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering BeginConfig captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0100 to operate");
        captureSession.beginConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering  beginConfig success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering BeginConfig data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0100 beginConfig PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0100
      * @tc.name      : Add Input with camera1Input api
      * @tc.desc      : Add Input with camera1Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering Addinput captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0100 to operate");
        captureSession.addInput(camera1Input, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddInput success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddInput data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0100 addInput PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0100 FAILED: " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0100
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Preview captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0100 to operate");
        captureSession.addOutput(previewOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Preview : Success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Preview data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0100 ends here");
          }
          await sleep(1000);
          done();
        })
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_0100
      * @tc.name      : Remove preview Output api
      * @tc.desc      : Remove preview Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_0100 to operate");
        captureSession.removeOutput(previewOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove preview Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PREVIEW_OUTPUT_SUCCESS_0100 PASSED");
          }
          else {
            expect().assertFail();
            console.info(TAG + "Entering Remove preview Output FAILED" + err.message);
            console.info(TAG + "Entering Remove Preview Output ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0200
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
     it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Preview captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0200 to operate");
        captureSession.addOutput(previewOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Preview : Success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Preview data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0200 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0200 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PREVIEW_SUCCESS_0200 ends here");
          }
          await sleep(1000);
          done();
        })
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0100
      * @tc.name      : commit config api
      * @tc.desc      : commit config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering CommitConfig captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0100 to operate");
        captureSession.commitConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering commitConfig success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering CommitConfig data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_0100
      * @tc.name      : isMirrorSupported
      * @tc.desc      : isMirrorSupported
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_0100 to operate");
        photoOutputAsync.isMirrorSupported(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ISMIRRORSUPPORTED_PHOTO_OUTPUT_0100 is success");
            console.info(TAG + "isMirrorSupported : " + data);
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_0100
      * @tc.name      : setMirror true
      * @tc.desc      : setMirror true
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_0100 to operate");
        photoOutputAsync.setMirror(true, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_TRUE_0100 is success:");
            console.info(TAG + "setMirror is : " + 'True');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETMIRROR_FALSE_0100
      * @tc.name      : setMirror false
      * @tc.desc      : setMirror false
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SETMIRROR_FALSE_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_FALSE_0100 to operate");
        photoOutputAsync.setMirror(false, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SETMIRROR_FALSE_0100 is success");
            console.info(TAG + "setMirror is : " + 'false');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /*CaptureSession APIs*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0200
      * @tc.name      : CaptureSession_Begin config api
      * @tc.desc      : CaptureSession_Begin config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering BeginConfig captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0200 to operate");
        captureSession.beginConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering  beginConfig success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering BeginConfig data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0200 beginConfig PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0200 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_BEGIN_CONFIG_SUCCESS_0200 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_0100
      * @tc.name      : remove input api
      * @tc.desc      : remove input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_0100 to operate");
        captureSession.removeInput(camera1Input, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove input success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_INPUT_SUCCESS_0100 PASSED");
          }
          else {
            expect().assertFail();
            console.info(TAG + "Entering Remove Input FAILED" + err.message);
            console.info(TAG + "Entering Remove Input ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0200
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering Addinput captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0200 to operate");
        captureSession.addInput(camera0Input, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddInput success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddInput data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0200 addInput PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0200 FAILED: " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_INPUT_SUCCESS_0200 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0100
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Photo captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0100 to operate");
        captureSession.addOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Photo  success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Photo data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0100 ends here");
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_0100
      * @tc.name      : Remove photo Output api
      * @tc.desc      : Remove photo Output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_0100 to operate");
        captureSession.removeOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering remove photo Output success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_REMOVE_PHOTO_OUTPUT_SUCCESS_0100 PASSED");
          }
          else {
            expect().assertFail();
            console.info(TAG + "Entering Remove photo Output FAILED" + err.message);
            console.info(TAG + "Entering Remove photo Output ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
      }
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0200
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
     it('SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering AddOutput_Photo captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0200 to operate");
        captureSession.addOutput(photoOutputAsync, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering AddOutput_Photo  success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering AddOutput_Photo data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0200 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0200 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_OUTPUT_PHOTO_SUCCESS_0200 ends here");
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0200
      * @tc.name      : commit config api
      * @tc.desc      : commit config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0200', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering CommitConfig captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0200 to operate");
        captureSession.commitConfig(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering commitConfig success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering CommitConfig data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0200 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0200 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COMMIT_CONFIG_SUCCESS_0200 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100
      * @tc.name      : FocusStateChange callback api
      * @tc.desc      : FocusStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100', 0, async function (done) {
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering FocusStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100 to operate");
        camera0Input.on('focusStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "FocusState callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current FocusState is: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100
      * @tc.name      : ExposureStateChange callback api
      * @tc.desc      : ExposureStateChange callback api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100', 0, async function (done) {
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering ExposureStateChange callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100 to operate");
        camera0Input.on('exposureStateChange', async (err, data) => {
          if (!err) {
            console.info(TAG + "ExposureStateChange callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Current ExposureStateChange is: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_EXPOSURESTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    //preview callback
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100
      * @tc.name      : Preview output callback on frame start api
      * @tc.desc      : Preview output callback on frame start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100', 0, async function (done) {
      if (previewOutputAsync == null || previewOutputAsync == undefined) {
        console.info(TAG + "Entering PreviewStart frameStart Callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        previewOutputAsync.on("frameStart", async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewStart frameStart Callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED : + err.message");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
      * @tc.name      : Preview capture callback on frame end api
      * @tc.desc      : Preview capture callback on frame end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', 0, async function (done) {
      if (previewOutputAsync == null || previewOutputAsync == undefined) {
        console.info(TAG + "Entering PreviewOutput frameEnd Callback previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        previewOutputAsync.on('frameEnd', async (err, data) => {
          if (!err) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100  FAILED : + err.message");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    //Capture callback
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_START_0100
      * @tc.name      : Photo capture callback on capture start api
      * @tc.desc      : Photo capture callback on capture start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_START_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering Photo Capture Callback on CaptureStart photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_START_0100 to operate");
        photoOutputAsync.on('captureStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Photo Capture Callback on CaptureStart  is success");
            if (data != null || data != undefined) {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_START_0100 with captureId: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_START_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_END_0100
      * @tc.name      : Photo capture callback on capture end api
      * @tc.desc      : Photo capture callback on capture end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_END_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_END_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_END_0100 to operate");
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
            console.info(TAG + 'SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_CAPTURE_END_0100 FAILED' + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_0100
      * @tc.name      : Photo capture callback on frame shutter api
      * @tc.desc      : Photo capture callback on frame shutter api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_0100 to operate");
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
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_0100
      * @tc.name      : capture session start api
      * @tc.desc      : capture session start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering CaptureSession Start captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_0100 to operate");
        captureSession.start(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering captureSession.start success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_0100 PASSED");
          }
          else {
            console.info(TAG + 'Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_0100 FAILED: ' + err.message)
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_0100 ends here");
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    //Location
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0100
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS to operate");
        photoOutputAsync.capture(photosettings1, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings1");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0100 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100
      * @tc.name      : Photo output capture with photosettings2 api
      * @tc.desc      : Photo output capture with photosettings2 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100 to operate");
        photoOutputAsync.capture(photosettings2, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings2 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings2 data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS3_0100
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS3_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS3_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS3_0100 to operate");
        photoOutputAsync.capture(photosettings3, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings3 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings3 data is not null || undefined");
              console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS3_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS3_0100 ends here");
          }
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS with Rotation-270
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS4_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS4_0100 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS4_0100 to operate");
        photoOutputAsync.capture(photosettings4, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings4 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings4 data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS4_0100 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS4_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS4_0100 ends here");
          }
        })
        await sleep(1000);
        done();
      }
    })

    //FLASH Function API scripts
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100
      * @tc.name      : check if has flash-camera0Input api
      * @tc.desc      : check if has flash-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100', 0, async function (done) {
      console.info(TAG + "hasFlash called.")
      camera0Input.hasFlash(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100 data is not null || undefined");
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100 PASSED with SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100 is: " + data);
            expect(data).assertEqual(true);
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100 FAILED : " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HAS_FLASH_0100 ends here");
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100
      * @tc.name      : check if flash mode open is supported-camera0Input api
      * @tc.desc      : check if flash mode open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_OPEN supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_OPEN_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100
      * @tc.name      : set flash mode open camera0 api
      * @tc.desc      : set flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_OPEN).assertEqual(1);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_OPEN_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100
      * @tc.name      : get flash mode open camera0 api
      * @tc.desc      : get flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100 success");
          if (data == 1) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100 data is not null || undefined: ");
            console.info(TAG + "Current FlashMode is: " + data);
            expect(true).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_OPEN_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_ALWAYS_OPEN supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100
      * @tc.name      : set flash mode always open camera0 api
      * @tc.desc      : set flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN).assertEqual(3);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_ALWAYS_OPEN_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100
      * @tc.name      : get flash mode always open camera0 api
      * @tc.desc      : get flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100 success");
          if (data == 3) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100 data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_ALWAYS_OPEN_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100
      * @tc.name      : check if flash mode auto is supported-camera0Input api
      * @tc.desc      : check if flash mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_AUTO SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_AUTO supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100 FAILED :" + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_AUTO_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100
      * @tc.name      : set flash mode auto camera0 api
      * @tc.desc      : set flash mode auto open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_AUTO).assertEqual(2);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_AUTO_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100 success");
          if (data == 2) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100 data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_AUTO_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100
      * @tc.name      : check if flash mode close is supported-camera0Input api
      * @tc.desc      : check if flash mode close is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100 to operate");
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_CLOSE SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FLASH_MODE_CLOSE supported is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100 FAILED :" + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FLASH_MODE_CLOSE_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100
      * @tc.name      : set flash mode close camera0 api
      * @tc.desc      : set flash mode close open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100 to operate");
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100 PASSED")
          expect(cameraObj.FlashMode.FLASH_MODE_CLOSE).assertEqual(0);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FLASH_MODE_CLOSE_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100
      * @tc.name      : get flash mode auto camera0 api
      * @tc.desc      : get flash mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100 to operate");
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100 success");
          if (data == 0) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100 data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " + data);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100 FAILED :" + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FLASH_MODE_CLOSE_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100
      * @tc.name      : get zoom ratio camera-0 cameraId api
      * @tc.desc      : get zoom ratio camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100--------------");
      camera0Input.getZoomRatioRange(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100 data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100 Success " + data)
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_ASYNC_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_ASYNC_0100', 0, async function (done) {
      camera0Input.setZoomRatio(1, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 1");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(1);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_1_ASYNC_0100 PASSED ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_ASYNC_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_ASYNC_0100', 0, async function (done) {
      camera0Input.setZoomRatio(2, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 2");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(2);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_2_ASYNC_0100 PASSED ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_ASYNC_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_ASYNC_0100', 0, async function (done) {
      camera0Input.setZoomRatio(3, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 3");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(3);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_3_ASYNC_0100 PASSED ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_ASYNC_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_ASYNC_0100', 0, async function (done) {
      camera0Input.setZoomRatio(4, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 4");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(4);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_4_ASYNC_0100 PASSED ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_ASYNC_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_ASYNC_0100', 0, async function (done) {
      camera0Input.setZoomRatio(5, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 5");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(5);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_5_ASYNC_0100 PASSED ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_ASYNC_0100
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_ASYNC_0100', 0, async function (done) {
      camera0Input.setZoomRatio(6, (err, data) => {
        if (!err) {
          console.info(TAG + "setZoomRatio success: 6");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err, data1) => {
            if (!err) {
              console.info(TAG + "getZoomRatio success : " + data1);
              expect(data1).assertEqual(6);
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_GET_ZOOM_6_ASYNC_0100 PASSED ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_0100
      * @tc.name      : check if focus mode locked is supported-camera0Input api
      * @tc.desc      : check if focus mode locked is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Is Focus Mode Locked Supported SUCCESS: " + data);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering Is Focus Mode Locked Supported data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_LOCKED_SUPPORTED is: " + data);
            expect(data).assertEqual(false);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_0100 FAILED :" + err.message);
          expect().assertFail()
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_LOCKED_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_0100
      * @tc.name      : set focus mode locked camera0 api
      * @tc.desc      : set focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Mode Locked SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_0100 FAILED : ")
          expect().assertFail();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_0100 PASSED : " + err.message);
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_LOCKED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_0100
      * @tc.name      : get focus mode locked camera0 api
      * @tc.desc      : get focus mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Mode Locked SUCCESS: " + data);
          console.info(TAG + "Get Focus Mode Locked data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(0);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_LOCKED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_0100
      * @tc.name      : get focal length camera0 api
      * @tc.desc      : get focal length camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_0100 to operate");
      camera0Input.getFocalLength(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focal length SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focal length is: " + JSON.stringify(data));
          expect(data).assertEqual(3.4600000381469727);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCAL_LENGTH_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_FOCUS_0100
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_FOCUS_0100', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_POINT to operate");
      camera0Input.setFocusPoint(Point1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SET_FOCUS_POINT PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SET_FOCUS_POINT FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_POINT ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_FOCUS_0100
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_FOCUS_0100', 0, async function (done) {
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
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100
      * @tc.name      : check if focus mode manual is supported-camera0Input api
      * @tc.desc      : check if focus mode manual is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100 FAILED  " + err.message);
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_MANUAL_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100
      * @tc.name      : set focus mode manual camera0 api
      * @tc.desc      : set focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100 PASSED")
          expect(cameraObj.FocusMode.FOCUS_MODE_MANUAL).assertEqual(0)
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_MANUAL_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100
      * @tc.name      : get focus mode manual camera0 api
      * @tc.desc      : get focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100 SUCCESS");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100 data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(0);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_MANUALL_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0100
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PhotoOutputCapture photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0100 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0100 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0200
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
     it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0200', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PhotoOutputCapture photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0200 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0200 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0200 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0200 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200
      * @tc.name      : set focus Point locked camera0 api
      * @tc.desc      : set focus Point locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200 to operate");
      camera0Input.setFocusPoint(Point2, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0200
      * @tc.name      : get focus Point camera0 api
      * @tc.desc      : get focus point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0200 to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0200 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100
      * @tc.name      : check if focus mode continuous is supported-camera0Input api
      * @tc.desc      : check if focus mode continuous is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_CONTINOUS_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100
      * @tc.name      : set focus mode continuous camera0 api
      * @tc.desc      : set focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          expect(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO).assertEqual(1);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100 PASSED");
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_CONTINUOUS_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100
      * @tc.name      : get focus mode continuous camera0 api
      * @tc.desc      : get focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100 SUCCESS");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100 data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_CONTINUOUS_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0200
      * @tc.name      : set focus Point camera0 api
      * @tc.desc      : set focus Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0100 to operate");
      camera0Input.setFocusPoint(Point3, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SetFocus Point, current FocusMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0100 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_POINT_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0100 to operate");
      camera0Input.getFocusPoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Focus Point SUCCESS: " + JSON.stringify(data));
          console.info(TAG + "Current Focus Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_POINT_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100
      * @tc.name      : check if focus mode auto is supported-camera0Input api
      * @tc.desc      : check if focus mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100 to operate");
      camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100 data is not null || undefined");
            console.info(TAG + "FOCUS_MODE_AUTO_SUPPORTED is: " + data);
            expect(data).assertEqual(true);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100 PASSED: ");
          }
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_IS_FOCUS_MODE_AUTO_SUPPORTED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100
      * @tc.name      : set focus mode auto camera0 api
      * @tc.desc      : set focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
          if (data != null || data != undefined) {
            expect(cameraObj.FocusMode.FOCUS_MODE_AUTO).assertEqual(2);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100 PASSED")
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_FOCUS_MODE_AUTO_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100
      * @tc.name      : get focus mode auto camera0 api
      * @tc.desc      : get focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100 to operate");
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100 SUCCESS");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100 data is not null || undefined: ");
          console.info(TAG + "Current FocusMode is: " + data);
          expect(data).assertEqual(2);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_AUTO_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0300
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
     it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0300', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PhotoOutputCapture photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0300 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0300 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0300 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0300 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_0100
      * @tc.name      : get exposure mode locked camera0 api
      * @tc.desc      : get exposure mode locked camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_0100 to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_LOCKED_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_0100
      * @tc.name      : get exposure mode continuous auto camera0 api
      * @tc.desc      : get exposure mode continuous auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_0100 to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_CONTINUOUS_AUTO_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_0100
      * @tc.name      : get exposure bias range camera0 api
      * @tc.desc      : get exposure bias range camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_0100 to operate");
      camera0Input.getExposureBiasRange(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias range SUCCESS");
          console.info(TAG + "Current Exposure bias range is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASRANGE_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0100 -4
      * @tc.name      : set exposure bias camera0 api 
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0100 to operate");
      camera0Input.setExposureBias(-4, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "-4");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0100 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0100 mode locked
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0100 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(-4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0100 mode auto
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0100 to operate");
      camera0Input.setExposurePoint(Point1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0100 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0100 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0100 mode auto
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0100 to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_0100
      * @tc.name      : get exposure mode auto camera0 api
      * @tc.desc      : get exposure mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_0100', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_0100 to operate");
      camera0Input.getExposureMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure Mode SUCCESS");
          console.info(TAG + "Get Exposure Mode data is not null || undefined: ");
          console.info(TAG + "Current ExposureMode is: " + data);
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_0100 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_0100 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_MODE_AUTO_0100 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0400
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0400', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PhotoOutputCapture photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0400 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0400 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0400 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_0400 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0200 mode auto
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0200 to operate");
      camera0Input.setExposureBias(1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "1");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0200 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0200 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0200 mode auto
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0200 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(1);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0200 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0200 
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0200 to operate");
      camera0Input.setExposurePoint(Point2, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0200 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0200 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0200
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0200', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0200 to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0200 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0200 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

        /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0200
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0200', 0, async function (done) {
    if (photoOutputAsync == null || photoOutputAsync == undefined) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0200 photoOutput == null || undefined");
    } else {
      console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS to operate");
      photoOutputAsync.capture(photosettings1, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering photoOutput capture with photosettings1");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0200 PASSED");
            expect(true).assertTrue();
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0200 FAILED : " + err.message);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS1_0200 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    }
  })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0300 mode auto
      * @tc.name      : set exposure bias camera0 api
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0300 to operate");
      camera0Input.setExposureBias(4, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "4");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0300 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0300 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0300 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0300 mode continuous auto
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0300 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0300 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0300 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0300 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0300 
      * @tc.name      : set exposure Point camera0 api
      * @tc.desc      : set exposure Point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0300 to operate");
      camera0Input.setExposurePoint(Point3, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure Point, current ExposureMode is: " + JSON.stringify(data));
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0300 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0300 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_POINT_0300 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0300
      * @tc.name      : get exposure point camera0 api
      * @tc.desc      : get exposure point camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0300', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0300 to operate");
      camera0Input.getExposurePoint(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure point SUCCESS");
          console.info(TAG + "Current Exposure Point is: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0300 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0300 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_POINT_0300 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200 to operate");
        photoOutputAsync.capture(photosettings2, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings2");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200 PASSED");
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS2_0200 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0400 -5
      * @tc.name      : set exposure bias camera0 api 
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0400', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0400 to operate");
      camera0Input.setExposureBias(-5, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "-4");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0400 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0400 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0400 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0400 mode locked
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0400', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0400 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(-4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0400 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0400 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0400 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0500 6
      * @tc.name      : set exposure bias camera0 api 
      * @tc.desc      : set exposure bias camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0500', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0500 to operate");
      camera0Input.setExposureBias(6, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Set Exposure bias is: " + "4");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0500 PASSED")
          expect(true).assertTrue();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0500 FAILED : " + err.message);
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_EXPOSURE_BIAS_0500 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0500
      * @tc.name      : get exposure bias value camera0 api
      * @tc.desc      : get exposure bias value camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0500', 0, async function (done) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0500 to operate");
      camera0Input.getExposureValue(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering Get Exposure bias value SUCCESS");
          console.info(TAG + "Current Exposure bias value is: " + JSON.stringify(data));
          expect(data).assertEqual(4);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0500 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0500 FAILED : " + err.message);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIASVALUE_0500 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /*CaptureSession APIs test script*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100
      * @tc.name      : capture session stop api
      * @tc.desc      : capture session stop api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100 to operate");
        captureSession.stop(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100 captureSession.stop success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering  captureSession.stop data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100 captureSession.stop PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100 FAILED : " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_0100 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100
      * @tc.name      : capture session release api
      * @tc.desc      : capture session release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100', 0, async function (done) {
      if (captureSession == null || captureSession == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100 to operate");
        captureSession.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering captureSession.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering captureSession.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100 FAILED: " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_0100 ends here");
            await sleep(1000);
            done();
          }
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_0100
      * @tc.name      : photoOutput release api
      * @tc.desc      : photoOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_0100', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_0100 photoOutputAsync == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_0100 to operate");
        photoOutputAsync.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutputAsync.release success");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_0100 PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUPUT_RELEASE_0100 FAILED: " + err.message);
            console.info(TAG + "Entering  photoOutputAsync.release ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100
      * @tc.name      : previewOutput release api
      * @tc.desc      : previewOutput release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100', 0, async function (done) {
      if (previewOutputAsync == null || previewOutputAsync == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100 previewOutputAsync == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100 to operate");
        previewOutputAsync.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering previewOutputAsync.release success");
            console.info(TAG + "Entering previewOutputAsync.release data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100 PASSED");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100 FAILED: " + err.message);
            console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_PREVIEWOUPUT_RELEASE_0100 ends here");
            await sleep(1000);
            done();
          }
        })
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100
      * @tc.name      : camera Input release api
      * @tc.desc      : camera Input release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100', 0, async function (done) {
      if (camera0Input == null || camera0Input == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100 camera0Input == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100 to operate");
        camera0Input.release(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering camera0Input.release success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering camera0Input.release data is not null || undefined");
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100 FAILED: " + err.message);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_RELEASE_SUCCESS_0100 ends here");
            await sleep(1000);
            done();
          }
        })
        await sleep(1000);
        done();
      }
    })
  })
}