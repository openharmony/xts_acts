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

var cameraManager;
var surfaceId1;
var camerasArray;

// CAMERA-0 Variables
var camera0Input, camera0InputPosBack, camera0InputPosFront;
var camera0InputPromise, camera0InputPromisePosBack, camera0InputPromisePosFront;
// CAMERA-1 Variables
var camera1Input, camera1InputPosBack, camera1InputPosFront;
var camera1InputPromise, camera1InputPromisePosBack, camera1InputPromisePosFront;
// CAMERA-2 Variables
var camera2Input, camera2InputPosBack, camera2InputPosFront;
var camera2InputPromise, camera2InputPromisePosBack, camera2InputPromisePosFront;
// CAMERA-3 Variables
var camera3Input, camera3InputPosBack, camera3InputPosFront;
var camera3InputPromise, camera3InputPromisePosBack, camera3InputPromisePosFront;

export default function cameraJSUnitCameraFormat(surfaceId: any) {

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

  describe('CameraJsUnitCameraFormat', function () {
    console.info(TAG + '----------CameraJsUnitCameraFormat--------------')

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

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100--------------");
      cameraObj.getCameraManager(null, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 data is not null || undefined");
            cameraManager = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
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
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100--------------");
      var cameraManagerPromise = await cameraObj.getCameraManager(null);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 cameraManagerPromise: " + JSON.stringify(cameraManagerPromise));
      if (cameraManagerPromise != null && cameraManagerPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 ends here");
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
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 data is not null || undefined");
            camerasArray = data;
            if (camerasArray != null && camerasArray.length > 0) {
              for (var i = 0; i < camerasArray.length; i++) {
                // Get the variables from camera object
                var cameraId = camerasArray[i].cameraId;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 camera" + i + "Id: " + cameraId);
                var cameraPosition = camerasArray[i].cameraPosition;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 camera" + i + "Position: " + cameraPosition);
                var cameraType = camerasArray[i].cameraType;
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 camera" + i + "Type: " + cameraType);
                var connectionType = camerasArray[i].connectionType
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100 connection" + i + "Type: " + connectionType);
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

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100
      * @tc.name      : Get camera from cameramanager to get array of camera promise api
      * @tc.desc      : Get camera from cameramanager to get array of camera promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100--------------");
      var camerasArrayPromise = await cameraManager.getCameras();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100: " + JSON.stringify(camerasArrayPromise));
      if (camerasArrayPromise != null && camerasArrayPromise.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 success");
        for (var i = 0; i < camerasArrayPromise.length; i++) {
          // Get the variables from camera object
          var cameraId = camerasArrayPromise[i].cameraId;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Id: " + cameraId);
          var cameraPosition = camerasArrayPromise[i].cameraPosition;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Position: " + cameraPosition);
          var cameraType = camerasArrayPromise[i].cameraType;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Type: " + cameraType);
          var connectionType = camerasArrayPromise[i].connectionType
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 connection" + i + "Type: " + connectionType);
        }
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 ends here");
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
      console.info("--------------CAMERA-0 STARTS HERE--------------");
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100--------------");
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      camera0InputPromise = await cameraManager.createCameraInput(camerasArray[0].cameraId);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera0InputPromise: " + JSON.stringify(camera0InputPromise));
      if (camera0InputPromise != null && camera0InputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera0InputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CALLBACK_0100
      * @tc.name      : get camera if from camera-0 input async api
      * @tc.desc      : get camera if from camera-0 input async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CALLBACK_0100', 0, async function (done) {
      camera0Input.getCameraId(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CALLBACK_0100 data is not null || undefined");
            var CameraId0 = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CALLBACK_0100 PASSED with CameraID :" + CameraId0);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100
      * @tc.name      : get camera if from camera-0 input promise api
      * @tc.desc      : get camera if from camera-0 input promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100', 0, async function (done) {
      var camera0IdPromise = await camera0InputPromise.getCameraId();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100 camera0IdPromise: " + JSON.stringify(camera0IdPromise));
      if (camera0IdPromise != null && camera0IdPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100 camera0IdPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100 PASSED" + camera0IdPromise);
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera0InputPromise.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null && data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromise = await camera0InputPromise.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromise));
      if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam0FormatPromise: " + cam0FormatPromise[i]);
          expect(cam0FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported video formats from camera-0 camerainput async api
      * @tc.desc      : Get supported video formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100--------------");
      camera0InputPromise.getSupportedVideoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100 success");
          if (data != null && data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported video formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported video formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromise = await camera0InputPromise.getSupportedVideoFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromise));
      if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100 cam0FormatPromise: " + cam0FormatPromise[i]);
          expect(cam0FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera0InputPromise.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromise = await camera0InputPromise.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromise));
      if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam0FormatPromise: " + cam0FormatPromise[i]);
          expect(cam0FormatPromise[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera0InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromisePosBack = await camera0InputPromisePosBack.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromisePosBack));
      if (cam0FormatPromisePosBack != null && cam0FormatPromisePosBack.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam0FormatPromisePosBack: " + cam0FormatPromisePosBack[i]);
          expect(cam0FormatPromisePosBack[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera0InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromisePosBack = await camera0InputPromisePosBack.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromisePosBack));
      if (cam0FormatPromisePosBack != null && cam0FormatPromisePosBack.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam0FormatPromisePosBack: " + cam0FormatPromisePosBack[i]);
          expect(cam0FormatPromisePosBack[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera0InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromisePosFront = await camera0InputPromisePosFront.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromisePosFront));
      if (cam0FormatPromisePosFront != null && cam0FormatPromisePosFront.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam0FormatPromisePosFront: " + cam0FormatPromisePosFront[i]);
          expect(cam0FormatPromisePosFront[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera0InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam0FormatPromisePosFront = await camera0InputPromisePosFront.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam0FormatPromisePosFront));
      if (cam0FormatPromisePosFront != null && cam0FormatPromisePosFront.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam0FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam0FormatPromisePosFront: " + cam0FormatPromisePosFront[i]);
          expect(cam0FormatPromisePosFront[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })


    it('SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100 previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT_0100 to operate");
        camera0InputPromise.on("focusStateChange", async (err, data) => {
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

    /*CAMERA-1 Scripts*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-1 cameraId async api
      * @tc.desc      : Create camerainput from camera-1 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100', 0, async function (done) {
      console.info("--------------CAMERA-1 STARTS HERE--------------");
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100--------------");
      cameraManager.createCameraInput(camerasArray[1].cameraId, async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 data is not null || undefined");
            camera1Input = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 PASSED with CameraID :" + camerasArray[1].cameraId);
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-1 cameraId promise api
      * @tc.desc      : Create camerainput from camera-1 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      camera1InputPromise = await cameraManager.createCameraInput(camerasArray[1].cameraId);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera1InputPromise: " + JSON.stringify(camera1InputPromise));
      if (camera1InputPromise != null && camera1InputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera1InputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_CALLBACK_0100
      * @tc.name      : get camera ID from camera-1 input async api
      * @tc.desc      : get camera ID from camera-1 input async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_CALLBACK_0100', 0, async function (done) {
      camera1Input.getCameraId(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_CALLBACK_0100 data is not null || undefined");
            var CameraId1 = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_CALLBACK_0100 PASSED with CameraID : " + CameraId1);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100
      * @tc.name      : get camera ID from camera-1 input promise api
      * @tc.desc      : get camera ID from camera-1 input promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100', 0, async function (done) {
      var camera1IdPromise = await camera1InputPromise.getCameraId();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100 camera1IdPromise: " + JSON.stringify(camera1IdPromise));
      if (camera1IdPromise != null && camera1IdPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100 camera1IdPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100 PASSED" + camera1IdPromise);
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT1_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-1 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-1 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100--------------");
      cameraManager.createCameraInput(camerasArray[1].cameraPosition, camerasArray[1].cameraType, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100
      * @tc.name      : Create camerainput from camera-1 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-1 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100--------------");
      var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[1].cameraPosition, camerasArray[1].cameraType);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
      if (cameraInputPromise != null && cameraInputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 cameraInputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_VIDEO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-1 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera1InputPromise.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam1FormatPromise = await camera1InputPromise.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam1FormatPromise));
      if (cam1FormatPromise != null && cam1FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam1FormatPromise: " + cam1FormatPromise[i]);
          expect(cam1FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100
      * @tc.name      : Get supported video formats from camera-1 camerainput async api
      * @tc.desc      : Get supported video formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100--------------");
      camera1InputPromise.getSupportedVideoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100
      * @tc.name      : Get supported video formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported video formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100--------------");
      var cam1FormatPromise = await camera1InputPromise.getSupportedVideoFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100: " + JSON.stringify(cam1FormatPromise));
      if (cam1FormatPromise != null && cam1FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100 cam1FormatPromise: " + cam1FormatPromise[i]);
          expect(cam1FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT1_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-1 camerainput async api
      * @tc.desc      : Get supported photo format from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera1InputPromise.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-1 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam1FormatPromise = await camera1InputPromise.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam1FormatPromise));
      if (cam1FormatPromise != null && cam1FormatPromise.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam1FormatPromise: " + cam1FormatPromise[i]);
          expect(cam1FormatPromise[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-1 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera1InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam1FormatPromisePosBack = await camera1InputPromisePosBack.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam1FormatPromisePosBack));
      if (cam1FormatPromisePosBack != null && cam1FormatPromisePosBack.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam1FormatPromisePosBack: " + cam1FormatPromisePosBack[i]);
          expect(cam1FormatPromisePosBack[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-1 camerainput async api
      * @tc.desc      : Get supported photo format from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera1InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-1 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam1FormatPromisePosBack = await camera1InputPromisePosBack.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam1FormatPromisePosBack));
      if (cam1FormatPromisePosBack != null && cam1FormatPromisePosBack.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam1FormatPromisePosBack: " + cam1FormatPromisePosBack[i]);
          expect(cam1FormatPromisePosBack[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-1 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera1InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam1FormatPromisePosFront = await camera1InputPromisePosFront.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam1FormatPromisePosFront));
      if (cam1FormatPromisePosFront != null && cam1FormatPromisePosFront.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam1FormatPromisePosFront: " + cam1FormatPromisePosFront[i]);
          expect(cam1FormatPromisePosFront[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-1 camerainput async api
      * @tc.desc      : Get supported photo format from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera1InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-1 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam1FormatPromisePosFront = await camera1InputPromisePosFront.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam1FormatPromisePosFront));
      if (cam1FormatPromisePosFront != null && cam1FormatPromisePosFront.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam1FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam1FormatPromisePosFront: " + cam1FormatPromisePosFront[i]);
          expect(cam1FormatPromisePosFront[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*CAMERA-2 Scripts*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-2 cameraId async api
      * @tc.desc      : Create camerainput from camera-2 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100', 0, async function (done) {
      console.info("--------------CAMERA-2 STARTS HERE--------------");
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100--------------");
      cameraManager.createCameraInput(camerasArray[2].cameraId, async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 data is not null || undefined");
            camera2Input = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 PASSED with CameraID :" + camerasArray[2].cameraId);
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-2 cameraId promise api
      * @tc.desc      : Create camerainput from camera-2 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      camera2InputPromise = await cameraManager.createCameraInput(camerasArray[2].cameraId);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera2InputPromise: " + JSON.stringify(camera2InputPromise));
      if (camera2InputPromise != null && camera2InputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera2InputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_CALLBACK_0100
      * @tc.name      : get camera ID from camera-2 input async api
      * @tc.desc      : get camera ID from camera-2 input async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_CALLBACK_0100', 0, async function (done) {
      camera2Input.getCameraId(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_CALLBACK_0100 data is not null || undefined");
            var CameraId2 = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_CALLBACK_0100 PASSED with CameraID : " + CameraId2);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100
      * @tc.name      : get camera ID from camera-2 input promise api
      * @tc.desc      : get camera ID from camera-2 input promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100', 0, async function (done) {
      var camera2IdPromise = await camera2InputPromise.getCameraId();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100 camera2IdPromise: " + JSON.stringify(camera2IdPromise));
      if (camera2IdPromise != null && camera2IdPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100 camera2IdPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100 PASSED" + camera2IdPromise);
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT2_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-2 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-2 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100--------------");
      cameraManager.createCameraInput(camerasArray[2].cameraPosition, camerasArray[2].cameraType, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100
      * @tc.name      : Create camerainput from camera-2 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-2 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100--------------");
      var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[2].cameraPosition, camerasArray[2].cameraType);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
      if (cameraInputPromise != null && cameraInputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 cameraInputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_VIDEO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-2 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera2InputPromise.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam2FormatPromise = await camera2InputPromise.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam2FormatPromise));
      if (cam2FormatPromise != null && cam2FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam2FormatPromise: " + cam2FormatPromise[i]);
          expect(cam2FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100
      * @tc.name      : Get supported video formats from camera-2 camerainput async api
      * @tc.desc      : Get supported video formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100--------------");
      camera2InputPromise.getSupportedVideoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100
      * @tc.name      : Get supported video formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported video formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100--------------");
      var cam2FormatPromise = await camera2InputPromise.getSupportedVideoFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100: " + JSON.stringify(cam2FormatPromise));
      if (cam2FormatPromise != null && cam2FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100 cam2FormatPromise: " + cam2FormatPromise[i]);
          expect(cam2FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT2_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-2 camerainput async api
      * @tc.desc      : Get supported photo format from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera2InputPromise.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-2 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam2FormatPromise = await camera2InputPromise.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam2FormatPromise));
      if (cam2FormatPromise != null && cam2FormatPromise.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam2FormatPromise: " + cam2FormatPromise[i]);
          expect(cam2FormatPromise[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_VIDEO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-2 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera2InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam2FormatPromisePosBack = await camera2InputPromisePosBack.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam2FormatPromisePosBack));
      if (cam2FormatPromisePosBack != null && cam2FormatPromisePosBack.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam2FormatPromisePosBack: " + cam2FormatPromisePosBack[i]);
          expect(cam2FormatPromisePosBack[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-2 camerainput async api
      * @tc.desc      : Get supported photo format from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera2InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-2 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam2FormatPromisePosBack = await camera2InputPromisePosBack.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam2FormatPromisePosBack));
      if (cam2FormatPromisePosBack != null && cam2FormatPromisePosBack.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam2FormatPromisePosBack: " + cam2FormatPromisePosBack[i]);
          expect(cam2FormatPromisePosBack[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-2 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera2InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam2FormatPromisePosFront = await camera2InputPromisePosFront.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam2FormatPromisePosFront));
      if (cam2FormatPromisePosFront != null && cam2FormatPromisePosFront.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam2FormatPromisePosFront: " + cam2FormatPromisePosFront[i]);
          expect(cam2FormatPromisePosFront[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-2 camerainput async api
      * @tc.desc      : Get supported photo format from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera2InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-2 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam2FormatPromisePosFront = await camera2InputPromisePosFront.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam2FormatPromisePosFront));
      if (cam2FormatPromisePosFront != null && cam2FormatPromisePosFront.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam2FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam2FormatPromisePosFront: " + cam2FormatPromisePosFront[i]);
          expect(cam2FormatPromisePosFront[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*CAMERA-3 Scripts*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-3 cameraId async api
      * @tc.desc      : Create camerainput from camera-3 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100', 0, async function (done) {
      console.info("--------------CAMERA-3 STARTS HERE--------------");
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100--------------");
      cameraManager.createCameraInput(camerasArray[3].cameraId, async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 data is not null || undefined");
            camera3Input = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CALLBACK_0100 PASSED with CameraID :" + camerasArray[3].cameraId);
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
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-3 cameraId promise api
      * @tc.desc      : Create camerainput from camera-3 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      camera3InputPromise = await cameraManager.createCameraInput(camerasArray[3].cameraId);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera3InputPromise: " + JSON.stringify(camera3InputPromise));
      if (camera3InputPromise != null && camera3InputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera3InputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_CALLBACK_0100
      * @tc.name      : get camera ID from camera-3 input async api
      * @tc.desc      : get camera ID from camera-3 input async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_CALLBACK_0100', 0, async function (done) {
      camera3Input.getCameraId(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_CALLBACK_0100 data is not null || undefined");
            var CameraId3 = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_CALLBACK_0100 PASSED with CameraID : " + CameraId3);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_CALLBACK_0100 FAILED: " + err.message);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100
      * @tc.name      : get camera ID from camera-3 input promise api
      * @tc.desc      : get camera ID from camera-3 input promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100', 0, async function (done) {
      var camera3IdPromise = await camera3InputPromise.getCameraId();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100 camera3IdPromise: " + JSON.stringify(camera3IdPromise));
      if (camera3IdPromise != null && camera3IdPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100 camera3IdPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100 PASSED" + camera3IdPromise);
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_ID_CAMINPUT3_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100
      * @tc.name      : Create camerainput from camera-3 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-3 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100--------------");
      cameraManager.createCameraInput(camerasArray[3].cameraPosition, camerasArray[3].cameraType, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 PASSED");
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100
      * @tc.name      : Create camerainput from camera-3 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-3 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100--------------");
      var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[3].cameraPosition, camerasArray[3].cameraType);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
      if (cameraInputPromise != null && cameraInputPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 cameraInputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 FAILED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_VIDEO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-3 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera3InputPromise.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam3FormatPromise = await camera3InputPromise.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam3FormatPromise));
      if (cam3FormatPromise != null && cam3FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam3FormatPromise: " + cam3FormatPromise[i]);
          expect(cam3FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100
      * @tc.name      : Get supported video formats from camera-3 camerainput async api
      * @tc.desc      : Get supported video formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100--------------");
      camera3InputPromise.getSupportedVideoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100
      * @tc.name      : Get supported video formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported video formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100--------------");
      var cam3FormatPromise = await camera3InputPromise.getSupportedVideoFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100: " + JSON.stringify(cam3FormatPromise));
      if (cam3FormatPromise != null && cam3FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100 cam3FormatPromise: " + cam3FormatPromise[i]);
          expect(cam3FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_VIDEO_FORMATS_CAMINPUT3_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-3 camerainput async api
      * @tc.desc      : Get supported photo format from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera3InputPromise.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-3 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam3FormatPromise = await camera3InputPromise.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam3FormatPromise));
      if (cam3FormatPromise != null && cam3FormatPromise.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromise.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam3FormatPromise: " + cam3FormatPromise[i]);
          expect(cam3FormatPromise[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-3 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera3InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam3FormatPromisePosBack = await camera3InputPromisePosBack.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam3FormatPromisePosBack));
      if (cam3FormatPromisePosBack != null && cam3FormatPromisePosBack.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam3FormatPromisePosBack: " + cam3FormatPromisePosBack[i]);
          expect(cam3FormatPromisePosBack[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-3 camerainput async api
      * @tc.desc      : Get supported photo format from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera3InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-3 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam3FormatPromisePosBack = await camera3InputPromisePosBack.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam3FormatPromisePosBack));
      if (cam3FormatPromisePosBack != null && cam3FormatPromisePosBack.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromisePosBack.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam3FormatPromisePosBack: " + cam3FormatPromisePosBack[i]);
          expect(cam3FormatPromisePosBack[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-3 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100--------------");
      camera3InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100--------------");
      var cam3FormatPromisePosFront = await camera3InputPromisePosFront.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100: " + JSON.stringify(cam3FormatPromisePosFront));
      if (cam3FormatPromisePosFront != null && cam3FormatPromisePosFront.length > 0) {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 cam3FormatPromisePosFront: " + cam3FormatPromisePosFront[i]);
          expect(cam3FormatPromisePosFront[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info("CameraModuleTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100
      * @tc.name      : Get supported photo format from camera-3 camerainput async api
      * @tc.desc      : Get supported photo format from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100--------------");
      camera3InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100
      * @tc.name      : Get supported photo format from camera-3 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100--------------");
      var cam3FormatPromisePosFront = await camera3InputPromisePosFront.getSupportedPhotoFormats();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100: " + JSON.stringify(cam3FormatPromisePosFront));
      if (cam3FormatPromisePosFront != null && cam3FormatPromisePosFront.length > 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 is not null || undefined");
        for (var i = 0; i < cam3FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 cam3FormatPromisePosFront: " + cam3FormatPromisePosFront[i]);
          expect(cam3FormatPromisePosFront[i]).assertEqual(2000);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 PASSED");
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE TELEPHOTO*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100 success");
          var camInput = data;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100 FAILED");
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_0100
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_0100--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_0100 PASSED : " + err.message);
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE TELEPHOTO*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100
      * @tc.name      : Create camerainput from cameraposition back & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100 success");
          var camInput = data;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100 FAILED");
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_0100
      * @tc.name      : Create camerainput from cameraposition back & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_0100--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_0100 PASSED : " + err.message);
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE TELEPHOTO*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100
      * @tc.name      : Create camerainput from cameraposition front & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100 success");
          var camInput = data;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100 FAILED");
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_CALLBACK_0100 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_0100
      * @tc.name      : Create camerainput from cameraposition front & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_0100', 0, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_0100--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_0100 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_0100 PASSED : " + err.message);
        });
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_0100 ends here");
      await sleep(1000);
      done();
    })
  })
}