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
      * @tc.number    : GET_CAMERA_MANAGER_TC_001
      * @tc.name      : Create camera manager instance async api
      * @tc.desc      : Create camera manager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERA_MANAGER_TC_001', 0, async function (done) {
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
    it('GET_CAMERA_MANAGER_PROMISE_TC_002', 0, async function (done) {
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
    it('GET_CAMERAS_TC_003', 0, async function (done) {
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
    it('GET_CAMERAS_PROMISE_TC_004', 0, async function (done) {
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
    it('CREATE_CAMERA_INPUT_TC_005', 0, async function (done) {
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
        camera0Input.release();
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
    it('CREATE_CAMERA_INPUT_PROMISE_TC_006', 0, async function (done) {
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
    it('GET_CAMERA_ID_TC_007', 0, async function (done) {
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
    it('GET_CAMERA_ID_PROMISE_TC_008', 0, async function (done) {
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

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_152 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_153 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 data null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_154 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_155 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_156 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_157 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_158 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_159 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_160 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_161 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_162 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 camInputPromise isnull || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_163 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_164 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_165 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_166 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 FAILED");
      }
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_167 ends here");
      await sleep(1000);
      done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168
      * @tc.name      : Create camerainput from cameraposition front & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168 FAILED: " + err.message);
          expect().assertFail();
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_168 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169
      * @tc.name      : Create camerainput from cameraposition front & cameratype wide angle promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype wide angle promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169 FAILED");
      }
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_169 ends here");
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
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_170 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_171 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_172 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_173 FAILED");
      }
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
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174--------------");
      cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 success");
          if (data == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 data is null || undefined");
            var camInput = data;
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 camInput: " + JSON.stringify(camInput));
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 PASSED");
          }
        } else {
          console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_174 FAILED: " + err.message);
          expect().assertFail();
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
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175', 0, async function (done) {
      console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175--------------");
      var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEPTH);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 camInputPromise: " + JSON.stringify(camInputPromise));
      if (camInputPromise == undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 camInputPromise is null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 FAILED");
      }
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_175 ends here");
      await sleep(1000);
      done();
    })
  })
}
