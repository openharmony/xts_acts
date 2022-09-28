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
      sleep(10000);
      console.info('beforeEach case');
    })

    afterEach(async function () {
      console.info('afterEach case');
    })

    afterAll(function () {
      console.info('afterAll case');
    })

    /**
      * @tc.number    : GET_CAMERA_MANAGER_TC_001
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_CAMERA_MANAGER_TC_001', 0, async function (done) {
      console.info("--------------GET_CAMERA_MANAGER_TC_001--------------");
      cameraObj.getCameraManager(null, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_CAMERA_MANAGER_TC_001 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering GET_CAMERA_MANAGER_TC_001 data is not null || undefined");
            cameraManager = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_CAMERA_MANAGER_TC_001 PASSED");
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering GET_CAMERA_MANAGER_TC_001 FAILED: " + err.message);
        }
        console.info(TAG + "Entering GET_CAMERA_MANAGER_TC_001 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_CAMERA_MANAGER_PROMISE_TC_002
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_CAMERA_MANAGER_PROMISE_TC_002', 0, async function (done) {
      console.info("--------------GET_CAMERA_MANAGER_PROMISE_TC_002--------------");
      var cameraManagerPromise = await cameraObj.getCameraManager(null);
      console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_002 cameraManagerPromise: " + JSON.stringify(cameraManagerPromise));
      if (cameraManagerPromise != null && cameraManagerPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_002 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_002 FAILED");
      }
      console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_002 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_CAMERAS_TC_003
      * @tc.name      : Get camera from cameramanager to get array of camera async api
      * @tc.desc      : Get camera from cameramanager to get array of camera async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_CAMERAS_TC_003', 0, async function (done) {
      console.info("--------------GET_CAMERAS_TC_003--------------");
      cameraManager.getCameras(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_CAMERAS_TC_003 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering GET_CAMERAS_TC_003 data is not null || undefined");
            camerasArray = data;
            if (camerasArray != null && camerasArray.length > 0) {
              for (var i = 0; i < camerasArray.length; i++) {
                // Get the variables from camera object
                var cameraId = camerasArray[i].cameraId;
                console.info(TAG + "Entering GET_CAMERAS_TC_003 camera" + i + "Id: " + cameraId);
                var cameraPosition = camerasArray[i].cameraPosition;
                console.info(TAG + "Entering GET_CAMERAS_TC_003 camera" + i + "Position: " + cameraPosition);
                var cameraType = camerasArray[i].cameraType;
                console.info(TAG + "Entering GET_CAMERAS_TC_003 camera" + i + "Type: " + cameraType);
                var connectionType = camerasArray[i].connectionType
                console.info(TAG + "Entering GET_CAMERAS_TC_003 connection" + i + "Type: " + connectionType);
              }
              expect(true).assertTrue();
              console.info(TAG + "Entering GET_CAMERAS_TC_003 PASSED");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering GET_CAMERAS_TC_003 FAILED cameraArray is null || undefined");
            }
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering GET_CAMERAS_TC_003 FAILED: " + err.message);
        }
        console.info(TAG + "Entering GET_CAMERAS_TC_003 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_CAMERAS_PROMISE_TC_004
      * @tc.name      : Get camera from cameramanager to get array of camera promise api
      * @tc.desc      : Get camera from cameramanager to get array of camera promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_CAMERAS_PROMISE_TC_004', 0, async function (done) {
      console.info("--------------GET_CAMERAS_PROMISE_TC_004--------------");
      var camerasArrayPromise = await cameraManager.getCameras();
      console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004: " + JSON.stringify(camerasArrayPromise));
      if (camerasArrayPromise != null && camerasArrayPromise.length > 0) {
        console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 success");
        for (var i = 0; i < camerasArrayPromise.length; i++) {
          // Get the variables from camera object
          var cameraId = camerasArrayPromise[i].cameraId;
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 camera" + i + "Id: " + cameraId);
          var cameraPosition = camerasArrayPromise[i].cameraPosition;
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 camera" + i + "Position: " + cameraPosition);
          var cameraType = camerasArrayPromise[i].cameraType;
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 camera" + i + "Type: " + cameraType);
          var connectionType = camerasArrayPromise[i].connectionType
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 connection" + i + "Type: " + connectionType);
        }
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 FAILED");
      }
      console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_004 ends here");
      await sleep(1000);
      done();
    })

    /*CAMERA-0 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_TC_005
      * @tc.name      : Create camerainput from camera-0 cameraId async api
      * @tc.desc      : Create camerainput from camera-0 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_TC_005', 0, async function (done) {
      console.info("--------------CAMERA-0 STARTS HERE--------------");
      console.info("--------------CREATE_CAMERA_INPUT_TC_005--------------");
      cameraManager.createCameraInput(camerasArray[0].cameraId, async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_005 data is not null || undefined");
            camera0Input = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_005 PASSED with CameraID :" + camerasArray[0].cameraId);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_005 FAILED: " + err.message);
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_005 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_PROMISE_TC_006
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_PROMISE_TC_006', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_PROMISE_TC_006--------------");
      camera0InputPromise = await cameraManager.createCameraInput(camerasArray[0].cameraId);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_006 camera0InputPromise: " + JSON.stringify(camera0InputPromise));
      if (camera0InputPromise != null && camera0InputPromise != undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_006 camera0InputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_006 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_006 FAILED");
      }
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_006 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_CAMERA_ID_TC_007
      * @tc.name      : get camera if from camera-0 input async api
      * @tc.desc      : get camera if from camera-0 input async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_CAMERA_ID_TC_007', 0, async function (done) {
      camera0Input.getCameraId(async (err, data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering GET_CAMERA_ID_TC_007 data is not null || undefined");
            var CameraId0 = data;
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_CAMERA_ID_TC_007 PASSED with CameraID :" + CameraId0);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering GET_CAMERA_ID_TC_007 FAILED: " + err.message);
        }
        console.info(TAG + "Entering GET_CAMERA_ID_TC_007 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_CAMERA_ID_PROMISE_TC_008
      * @tc.name      : get camera if from camera-0 input promise api
      * @tc.desc      : get camera if from camera-0 input promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_CAMERA_ID_PROMISE_TC_008', 0, async function (done) {
      var camera0IdPromise = await camera0InputPromise.getCameraId();
      console.info(TAG + "Entering GET_CAMERA_ID_PROMISE_TC_008 camera0IdPromise: " + JSON.stringify(camera0IdPromise));
      if (camera0IdPromise != null && camera0IdPromise != undefined) {
        console.info(TAG + "Entering GET_CAMERA_ID_PROMISE_TC_008 camera0IdPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERA_ID_PROMISE_TC_008 PASSED" + camera0IdPromise);
      } else {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERA_ID_PROMISE_TC_008 FAILED");
      }
      console.info(TAG + "Entering GET_CAMERA_ID_PROMISE_TC_008 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_011
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_PREVIEW_FORMATS_TC_011', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_011--------------");
      camera0InputPromise.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_011 success");
          if (data != null && data.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_011 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_011 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_011 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_011 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_011 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012--------------");
      var cam0FormatPromise = await camera0InputPromise.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012: " + JSON.stringify(cam0FormatPromise));
      if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012 is not null || undefined");
        for (var i = 0; i < cam0FormatPromise.length; i++) {
          console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012 cam0FormatPromise: " + cam0FormatPromise[i]);
          expect(cam0FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012 PASSED");
        }
      }
      console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_012 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_VIDEO_FORMATS_TC_013
      * @tc.name      : Get supported video formats from camera-0 camerainput async api
      * @tc.desc      : Get supported video formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_VIDEO_FORMATS_TC_013', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_VIDEO_FORMATS_TC_013--------------");
      camera0InputPromise.getSupportedVideoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_TC_013 success");
          if (data != null && data.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_TC_013 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_TC_013 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_TC_013 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_TC_013 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_TC_013 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014
      * @tc.name      : Get supported video formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported video formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014--------------");
      var cam0FormatPromise = await camera0InputPromise.getSupportedVideoFormats();
      console.info("CameraModuleTest: Entering GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014: " + JSON.stringify(cam0FormatPromise));
      if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
        console.info("CameraModuleTest: Entering GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014 is not null || undefined");
        for (var i = 0; i < cam0FormatPromise.length; i++) {
          console.info(TAG + "Entering GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014 cam0FormatPromise: " + cam0FormatPromise[i]);
          expect(cam0FormatPromise[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014 PASSED");
        }
      }
      console.info("CameraModuleTest: Entering GET_SUPPORTED_VIDEO_FORMATS_PROMISE_TC_014 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_017
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_PHOTO_FORMATS_TC_017', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_017--------------");
      camera0InputPromise.getSupportedPhotoFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_017 success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_017 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_017 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(2000);
              console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_017 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_017 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_017 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018--------------");
      var cam0FormatPromise = await camera0InputPromise.getSupportedPhotoFormats();
      console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018: " + JSON.stringify(cam0FormatPromise));
      if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018 is not null || undefined");
        for (var i = 0; i < cam0FormatPromise.length; i++) {
          console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018 cam0FormatPromise: " + cam0FormatPromise[i]);
          expect(cam0FormatPromise[i]).assertEqual(2000);
          console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018 PASSED");
        }
      } else {
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_018 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, camerasArray[0].cameraType, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031 success");
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031 PASSED");
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_031 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032--------------");
      camera0InputPromisePosFront = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, camerasArray[0].cameraType);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032 camera0InputPromisePosFront: " + JSON.stringify(camera0InputPromisePosFront));
      if (camera0InputPromisePosFront != null && camera0InputPromisePosFront != undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032 camera0InputPromisePosFront is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032 FAILED");
      }
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_032 ends here");
      await sleep(1000);
      done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_033
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_PREVIEW_FORMATS_TC_033', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_033--------------");
      camera0InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_033 success");
          if (data != null || data.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_033 data is not null || undefined");
            for (var i = 0; i < data.length; i++) {
              console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_033 cameraFormat: " + data[i]);
              expect(data[i]).assertEqual(1003);
              console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_033 PASSED");
            }
          }
        } else {
          console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_033 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_033 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034', 0, async function (done) {
      console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034--------------");
      var cam0FormatPromisePosFront = await camera0InputPromisePosFront.getSupportedPreviewFormats();
      console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034: " + JSON.stringify(cam0FormatPromisePosFront));
      if (cam0FormatPromisePosFront != null && cam0FormatPromisePosFront.length > 0) {
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034 is not null || undefined");
        for (var i = 0; i < cam0FormatPromisePosFront.length; i++) {
          console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034 cam0FormatPromisePosFront: " + cam0FormatPromisePosFront[i]);
          expect(cam0FormatPromisePosFront[i]).assertEqual(1003);
          console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034 PASSED");
        }
      }
      console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_034 ends here");
      await sleep(1000);
      done();
    })

    it('CF_FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT', 0, async function (done) {
      if (camera0InputPromise == null || camera0InputPromise == undefined) {
        console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT to operate");
        camera0InputPromise.on("focusStateChange", async (err, data) => {
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
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype unspecified async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150 success: ");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_150 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_151
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_151', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_151--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED)
        .then(function () {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_151 camInputPromise: ");
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_151 FAILED");
        })
        .catch((err) => {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC PASSED : " + err.message);
          expect(true).assertTrue();
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_151 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype wide angle promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype wide angle promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE)
        .then(function () {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 FAILED");
          expect().assertFail();
        })
        .catch((err) => {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 PASSED : " + err.message);
          expect(true).assertTrue();
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE ULTRA ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype ultra wide async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype ultra wide async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype ultra wide promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype ultra wide promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE)
        .then(function () {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 FAILED");
          expect().assertFail();
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE TELEPHOTO*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE TRUE DEAPTH*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype true deapth async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype true deapth async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype true deapth promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype true deapth promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160
      * @tc.name      : Create camerainput from cameraposition back & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161
      * @tc.name      : Create camerainput from cameraposition back & cameratype wide angle promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype wide angle promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE ULTRA ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162
      * @tc.name      : Create camerainput from cameraposition back & cameratype ultra wide async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype ultra wide async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163
      * @tc.name      : Create camerainput from cameraposition back & cameratype ultra wide promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype ultra wide promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE TELEPHOTO*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164
      * @tc.name      : Create camerainput from cameraposition back & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165
      * @tc.name      : Create camerainput from cameraposition back & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE TRUE DEAPTH*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166
      * @tc.name      : Create camerainput from cameraposition back & cameratype true deapth async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype true deapth async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167
      * @tc.name      : Create camerainput from cameraposition back & cameratype true deapth promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype true deapth promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE ULTRA ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170
      * @tc.name      : Create camerainput from cameraposition front & cameratype ultra wide async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype ultra wide async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171
      * @tc.name      : Create camerainput from cameraposition front & cameratype ultra wide promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype ultra wide promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE TELEPHOTO*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172
      * @tc.name      : Create camerainput from cameraposition front & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 FAILED");
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173
      * @tc.name      : Create camerainput from cameraposition front & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE TRUE DEAPTH*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174
      * @tc.name      : Create camerainput from cameraposition front & cameratype true deapth async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype true deapth async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 success");
          var camInput = data;
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 camInput: " + JSON.stringify(camInput));
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 FAILED");
        }
        else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 PASSED: " + err.message);
          expect(true).assertTrue();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175
      * @tc.name      : Create camerainput from cameraposition front & cameratype true deapth promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype true deapth promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CF_CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175--------------");
      await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH)
        .then(function () {
          expect().assertFail();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 FAILED");
        })
        .catch((err) => {
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 PASSED : " + err.message);
        });
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 ends here");
      await sleep(1000);
      done();
    })
  })
}
