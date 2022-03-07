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
var camera0InputPromise;
var cameraManagerPromise;
var previewOutputPromise;
var photoOutputPromise;
var CaptureSessionPromise;
var surfaceId1;

var photosettings1 = {
  rotation: 0,
  quality: 0,
}
var photosettings2 = {
  rotation: 90,
  quality: 1,
}
var photosettings3 = {
  rotation: 180,
  quality: 2,
}
var photosettings4 = {
  rotation: 270
}

var PermissionFlag = {
    PERMISSION_USER_SET: 1,
    PERMISSION_USER_FIXED: 2,
    PERMISSION_SYSTEM_FIXED: 3
};

const RESULT_FAIL = -1
const TIMEOUT = 1000;
const DEFAULT_PERMISSION_FALG = 0
var permissionNameUser = "ohos.permission.CAMERA";
var tokenID = undefined

export default function cameraTestCase(surfaceId:any) {

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

  describe('PhotoModePromise', function () {
    // Define local variables
    var camerasArrayPromise;

    var camerasArray;
    console.log('##########start AccessTokenTests');
    beforeAll(async function (done){
        var appInfo = await bundle.getApplicationInfo('com.example.cameramoduletestetsv2',0 ,100);
        tokenID = appInfo.accessTokenId;
        console.info(TAG + "AccessTokenTest accessTokenId:" + appInfo.accessTokenId + ", name:"+ appInfo.name
			+ ", bundleName:" + appInfo.bundleName)
        sleep(TIMEOUT);
        console.info(TAG + "Grant permission start");
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
			PermissionFlag.PERMISSION_USER_FIXED); 
        console.info(TAG + "Grant permission finish, result:" + result + ", TokenID:" + tokenID);
        done();
    })
    afterEach(function(){
    })
	
    function sleep(ms) {
      console.info(TAG + "Entering sleep -> Promise constructor");
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    console.info(TAG + "----------Camera-PhotoMode-Promise-------------");
    /**
      * @tc.number    : GET_CAMERA_MANAGER_PROMISE_TC_001
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERA_MANAGER_PROMISE_TC_001', 0, async function (done) {
      console.info("--------------GET_CAMERA_MANAGER_PROMISE_TC_001--------------");
      cameraManagerPromise = await cameraObj.getCameraManager(null);
      console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_001 cameraManagerPromise: " + JSON.stringify(cameraManagerPromise));
      if (cameraManagerPromise != null && cameraManagerPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_001 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_001 FAILED");
      }
      console.info(TAG + "Entering GET_CAMERA_MANAGER_PROMISE_TC_001 ends here");
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_CAMERAS_PROMISE_TC_002
      * @tc.name      : Get camera from cameramanager to get array of camera promise api
      * @tc.desc      : Get camera from cameramanager to get array of camera promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERAS_PROMISE_TC_002', 0, async function (done) {
      console.info("--------------GET_CAMERAS_PROMISE_TC_002--------------");
      camerasArrayPromise = await cameraManagerPromise.getCameras();
      console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002: " + JSON.stringify(camerasArrayPromise));
      if (camerasArrayPromise != null && camerasArrayPromise.length > 0) {
        console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 success");
        for (var i = 0; i < camerasArrayPromise.length; i++) {
          // Get the variables from camera object
          var cameraId = camerasArrayPromise[i].cameraId;
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 camera" + i + "Id: " + cameraId);
          var cameraPosition = camerasArrayPromise[i].cameraPosition;
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 camera" + i + "Position: " + cameraPosition);
          var cameraType = camerasArrayPromise[i].cameraType;
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 camera" + i + "Type: " + cameraType);
          var connectionType = camerasArrayPromise[i].connectionType
          console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 connection" + i + "Type: " + connectionType);
        }
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 FAILED");
      }
      console.info(TAG + "Entering GET_CAMERAS_PROMISE_TC_002 ends here");
      await sleep(1000);
      done();
    })

    /*CAMERA-0 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_PROMISE_TC_003
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_PROMISE_TC_003', 0, async function (done) {
      console.info("--------------CAMERA-0 STARTS HERE--------------");
      console.info("--------------CREATE_CAMERA_INPUT_PROMISE_TC_003--------------");
      camera0InputPromise = await cameraManagerPromise.createCameraInput(camerasArrayPromise[0].cameraId);
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_003 camera0InputPromise: " + JSON.stringify(camera0InputPromise));
      if (camera0InputPromise != null && camera0InputPromise != undefined) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_003 camera0InputPromise is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_003 PASSED");
      } else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_003 FAILED");
      }
      console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_003 ends here");
      await sleep(1000);
      done();
    })

    /*PreviewOutput APIs test script*/
    /**
      * @tc.number    : CREATE_PREVIEW_OUTPUT_SUCCESS_PROMISE_TC_004
      * @tc.name      : Create PreviewOutput instance promise api
      * @tc.desc      : Create PreviewOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PREVIEW_OUTPUT_SUCCESS_TC_004', 0, async function (done) {
      console.info(TAG + " Entering CREATE_PREVIEW_OUTPUT_SUCCESS_PROMISE_TC_004 to operate");
      previewOutputPromise = await cameraObj.createPreviewOutput(surfaceId);
      console.info(TAG + " Entering  createPreviewOutput success");
      if (previewOutputPromise != null || previewOutputPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering createPreviewOutput PASSED: " + JSON.stringify(previewOutputPromise));
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering createPreviewOutput FAILED");
        console.info(TAG + "Entering createPreviewOutput ends here");
      }
      await sleep(1000);
      done();
    })

    /*PhotoOutput APIs test script*/
    /**
      * @tc.number    : CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_TC_005
      * @tc.name      : Create PhotoOutput instance promise api
      * @tc.desc      : Create PhotoOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_TC_005', 0, async function (done) {
      console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_TC_005 to operate");
      console.info(TAG + 'Entering getImageReceiverSurfaceId')
      await getImageReceiverSurfaceId()
      await sleep(1000)
      photoOutputPromise = await cameraObj.createPhotoOutput(surfaceId1);
      console.info(TAG + "Entering  createPhotoOutput success");
      if (photoOutputPromise != null || photoOutputPromise != undefined) {
        expect(true).assertTrue();
        console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_TC_005 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_PROMISE_TC_005 FAILED");
        console.info(TAG + "Entering createPhotoOutput ends here");
      }
      await sleep(1000);
      done();
    })

    /*CaptureSession APIs test script*/
    /**
      * @tc.number    : CREATE_CAPTURE_SESSION_SUCCESS_PROMISE_TC_006
      * @tc.name      : Create CaptureSession instance promise api
      * @tc.desc      : Create Capturesession instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAPTURE_SESSION_SUCCESS_PROMISE_TC_006', 0, async function (done) {
      console.info(TAG + "Entering CREATE_CAPTURE_SESSION_SUCCESS_PROMISE_TC_006 to operate");
      CaptureSessionPromise = await cameraObj.createCaptureSession(null);
      console.info(TAG + "Entering createCaptureSession success");
      if (CaptureSessionPromise != null || CaptureSessionPromise != undefined) {
        console.info(TAG + "Entering createCaptureSession data is not null || undefined");
        expect(true).assertTrue();
        console.info(TAG + "Entering createCaptureSession PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering CREATE_CAPTURE_SESSION_SUCCESS_PROMISE_TC_006 FAILED");
        console.info(TAG + "Entering createCaptureSession ends here");
      }
      await sleep(1000);
      done();
    })

    /*CaptureSession APIs*/
    /**
      * @tc.number    : CREATE_BEGIN_CONFIG_SUCCESS_PROMISE_TC_007
      * @tc.name      : CaptureSession_Begin config promise api
      * @tc.desc      : CaptureSession_Begin config promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_BEGIN_CONFIG_SUCCESS_PROMISE_TC_007', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering CREATE_BEGIN_CONFIG_SUCCESS captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CREATE_BEGIN_CONFIG_SUCCESS_PROMISE_TC_007 to operate");
        const promise = await CaptureSessionPromise.beginConfig();
        console.info(TAG + "Entering  beginConfig success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering CREATE_BEGIN_CONFIG beginConfig data is not null || undefined: " + JSON.stringify(promise));
          expect(true).assertTrue();
          console.info(TAG + "Entering CREATE_BEGIN_CONFIG_SUCCESS_PROMISE_TC_007 beginConfig PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering beginConfig FAILED");
        }
        console.info(TAG + "Entering beginConfig ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : ADD_INPUT_SUCCESS_PROMISE_008
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('ADD_INPUT_SUCCESS_PROMISE_008', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 to operate");
        const Promise = await CaptureSessionPromise.addInput(camera0InputPromise);
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 addInput success");
        if (Promise != null || Promise != undefined) {
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 addInput data is not null || undefined");
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 addInput PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 FAILED: ");
        }
        console.info(TAG + "Entering ADD_INPUT_SUCCESS_PROMISE_008 ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_PREVIEW_SUCCESS_PROMISE_009
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('ADD_OUTPUT_PREVIEW_SUCCESS_009', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 to operate");
        const promise = await CaptureSessionPromise.addOutput(previewOutputPromise);
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 : Success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 data is not null || undefined");
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 FAILED");
        }
        console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : ADD_OUTPUT_PHOTO_SUCCESS_010
      * @tc.name      : Add output with photo output api
      * @tc.desc      : Add output with photo output api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('ADD_OUTPUT_PHOTO_SUCCESS_010', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 to operate");
        const promise = await CaptureSessionPromise.addOutput(photoOutputPromise);
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010  success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 data is not null || undefined" );
          expect(true).assertTrue();
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 FAILED: ");
        }
        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : COMMIT_CONFIG_SUCCESS_011
      * @tc.name      : commit config api
      * @tc.desc      : commit config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('COMMIT_CONFIG_SUCCESS_011', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 to operate");
        const promise = await CaptureSessionPromise.commitConfig();
        console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 data is not null || undefined");
          expect(true).assertTrue();
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig FAILED");
          console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig ends here");
        }
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    // callback related API

    //preview callback

    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_012
      * @tc.name      : Preview output callback on frame start api
      * @tc.desc      : Preview output callback on frame start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_012', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_012 previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_012 to operate");
        previewOutputPromise.on("frameStart", async (err, data) => {
          if (!err) {
            console.info(TAG + "Preview frameStart Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_013
      * @tc.name      : Preview capture callback on frame end api
      * @tc.desc      : Preview capture callback on frame end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_013', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_013 previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_013 to operate");
        previewOutputPromise.on("frameEnd", async (err, data) => {
          if (!err) {
            console.info(TAG + "Preview frameEnd Callback is success");
            if (data != null || data != undefined) {
              expect(true).assertTrue();
            }
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
      * @tc.number    : PREVIEW_OUTPUT_CALLBACK_ON_ERROR_014
      * @tc.name      : Preview output callback on error api
      * @tc.desc      : Preview output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PREVIEW_OUTPUT_CALLBACK_ON_ERROR_014', 0, async function (done) {
      if (previewOutputPromise == null || previewOutputPromise == undefined) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR_014 previewOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR_014 to operate");
        previewOutputPromise.on("error", async (err, data) => {
          if (!err) {
            console.info(TAG + "PreviewOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during PreviewOutput with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
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

    //Capture callback
    /**
      * @tc.number    : PHOTO_CAP_CALLBACK_ON_CAPTURE_START_015
      * @tc.name      : Photo capture callback on capture start api
      * @tc.desc      : Photo capture callback on capture start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTO_CAP_CALLBACK_ON_CAPTURE_START_015', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_START_015 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_START_015 to operate");
        photoOutputPromise.on("captureStart", async (err, data) => {
          if (!err) {
            console.info(TAG + "CaptureStart Callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "captureStart success with captureId: " + data);
              expect(true).assertTrue();
            }
          } else {
            expect().assertFail()
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : PHOTO_CAP_CALLBACK_ON_CAPTURE_END_016
      * @tc.name      : Photo capture callback on capture end api
      * @tc.desc      : Photo capture callback on capture end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTO_CAP_CALLBACK_ON_CAPTURE_END_016', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END_016 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END_016 to operate");
        photoOutputPromise.on("captureEnd", async (err, data) => {
          if (!err) {
            console.info(TAG + "captureEnd callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "captureEnd callback with captureId: " + data.captureId);
              console.info(TAG + "captureEnd callback with frameCount: " + data.frameCount);
              expect(true).assertTrue();
            }
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
      * @tc.number    : PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_017
      * @tc.name      : Photo capture callback on frame shutter api
      * @tc.desc      : Photo capture callback on frame shutter api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_017', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_017 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_017 to operate");
        photoOutputPromise.on("frameShutter", async (err, data) => {
          if (!err) {
            console.info(TAG + "frameShutter callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "frameShutter callback with captureId: " + data.captureId);
              console.info(TAG + "frameShutter callback with timestamp: " + data.timestamp);
              expect(true).assertTrue();
            }
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
      * @tc.number    : PHOTO_OUTPUT_CALLBACK_ON_ERROR_018
      * @tc.name      : Photo output callback on error api
      * @tc.desc      : Photo output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTO_OUTPUT_CALLBACK_ON_ERROR_018', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR_018 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR_018 to operate");
        photoOutputPromise.on("error", async (err, data) => {
          if (!err) {
            console.info(TAG + "PhotoOutputError callback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error during PhotoOutput with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
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

    //Capturesession callback
    /**
      * @tc.number    : CAP_SES_CALLBACK_ON_ERROR_019
      * @tc.name      : CaptureSession callback on error api
      * @tc.desc      : CaptureSession callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('CAP_SES_CALLBACK_ON_ERROR_019', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering CAP_SES_CALLBACK_ON_ERROR_019 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CAP_SES_CALLBACK_ON_ERROR_019 to operate");
        CaptureSessionPromise.on("error", async (err, data) => {
          if (!err) {
            console.info(TAG + " captureSession errorcallback is success");
            if (data != null || data != undefined) {
              console.info(TAG + "Error in CaptureSessioncallback with ErrorCode: " + data.code);
              expect(true).assertTrue();
            }
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

    //FocusState callback
    /**
      * @tc.number    : FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020
      * @tc.name      : focus state change callback on camera0Input api
      * @tc.desc      : Preview capture callback on frame end api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
//    it('FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020', 0, async function (done) {
//      if (camera0InputPromise == null || camera0InputPromise == undefined) {
//        console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020 previewOutput == null || undefined");
//      } else {
//        console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020 to operate");
//        camera0InputPromise.on("focusStateChange", async (err, data) => {
//          if (!err) {
//            console.info(TAG + "FocusState callback is success");
//            if (data != null || data != undefined) {
//              console.info(TAG + "Current FocusState is: " + data);
//              expect(true).assertTrue();
//            }
//          } else {
//            expect().assertFail();
//          }
//          await sleep(1000);
//          done();
//        })
//        await sleep(1000);
//        done();
//      }
//    })

    /**
      * @tc.number    : CAPTURE_SESSION_START_SUCCESS_021
      * @tc.name      : capture session start api
      * @tc.desc      : capture session start api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('CAPTURE_SESSION_START_SUCCESS_021', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 to operate");
        const promise = await CaptureSessionPromise.start();
        console.info(TAG + "Entering captureSession start success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 data is not null || undefined" + promise);
          expect(true).assertTrue();
          console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 PASSED");
        }
        console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    //FLASH Function API scripts
    /**
      * @tc.number    : HAS_FLASH_TC_022
      * @tc.name      : check if has flash-camera0Input api
      * @tc.desc      : check if has flash-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('HAS_FLASH_TC_022', 0, async function (done) {
      console.info("--------------HAS_FLASH_TC_022--------------");
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
      console.info(TAG + "Entering HAS_FLASH_TC_022 ends here");
      await sleep(1000)
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_OPEN_SUPPORTED_023
      * @tc.name      : check if flash mode open is supported-camera0Input api
      * @tc.desc      : check if flash mode open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('IS_FLASH_MODE_OPEN_SUPPORTED_023', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED_023 to operate");
      var isFMOpenSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED_023 SUCCESS ");
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
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_OPEN_024
      * @tc.name      : set flash mode open camera0 api
      * @tc.desc      : set flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('SET_FLASH_MODE_OPEN_024', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 to operate");
      var SetFMOpen = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMOpen))
      if (SetFMOpen == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 PASSED")
        expect(true).assertTrue()
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 FAILED");
        console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_OPEN_025
      * @tc.name      : get flash mode open camera0 api
      * @tc.desc      : get flash mode open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('GET_FLASH_MODE_OPEN_025', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_OPEN_025 to operate");
      var GetFMOpen = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_OPEN success: " + JSON.stringify(GetFMOpen));
      if (GetFMOpen == 1) {
        console.info(TAG + "GET_FLASH_MODE_OPEN data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + JSON.stringify(GetFMOpen));
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_OPEN_025 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_OPEN_025 FAILED");
        console.info(TAG + "GET_FLASH_MODE_OPEN_025 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026
      * @tc.name      : check if flash mode always open is supported-camera0Input api
      * @tc.desc      : check if flash mode always open is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 to operate");
      var isFMAlwaysOpenSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 SUCCESS ");
      if (isFMAlwaysOpenSupported != null || isFMAlwaysOpenSupported != undefined) {
        console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN data is not null || undefined");
        console.info(TAG + "FLASH_MODE_OPEN supported is: " + isFMAlwaysOpenSupported);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 FAILED");
        console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_ALWAYS_OPEN_027
      * @tc.name      : set flash mode always open camera0 api
      * @tc.desc      : set flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('SET_FLASH_MODE_ALWAYS_OPEN_027', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 to operate");
      var SetFMAlwaysOpen = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMAlwaysOpen))
      if (SetFMAlwaysOpen == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 PASSED")
        expect(true).assertTrue()
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 FAILED");
        console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_ALWAYS_OPEN_028
      * @tc.name      : get flash mode always open camera0 api
      * @tc.desc      : get flash mode always open camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('GET_FLASH_MODE_ALWAYS_OPEN_028', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_ALWAYS_OPEN_028 to operate");
      var GetFMAlwaysOpen = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_ALWAYS_OPEN_028 success");
      if (GetFMAlwaysOpen == 3) {
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMAlwaysOpen);
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 FAILED");
        console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_29 Rotation-0 & Quality-0
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_029', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_029 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_029 to operate");
        const promise = photoOutputPromise.capture(photosettings1);
        console.info(TAG + "Entering photoOutput capture with photosettings1 success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering photoOutput capture with photosettings1 data is not null || undefined");
          console.info(TAG + "Entering photoOutput capture with  photosettings1 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering photoOutput capture with photosettings1 FAILED");
          console.info(TAG + "Entering photoOutput capture with photosettings1 ends here");
        }
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : IS_FLASH_MODE_CLOSE_SUPPORTED_030
      * @tc.name      : check if flash mode close is supported-camera0Input api
      * @tc.desc      : check if flash mode close is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('IS_FLASH_MODE_CLOSE_SUPPORTED_030', 0, async function (done) {
      console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 to operate");
      var isFMCloseSupported = await camera0InputPromise.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 SUCCESS ");
      if (isFMCloseSupported != null || isFMCloseSupported != undefined) {
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 data is not null || undefined");
        console.info(TAG + "FLASH_MODE_CLOSE supported is: " + isFMCloseSupported);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 PASSED");
      }
      else {
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 FAILED");
        console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SET_FLASH_MODE_CLOSE_031
      * @tc.name      : set flash mode close camera0 api
      * @tc.desc      : set flash mode close camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('SET_FLASH_MODE_CLOSE_031', 0, async function (done) {
      console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 to operate");
      var SetFMClose = await camera0InputPromise.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "setFlashModeOPEN: " + JSON.stringify(SetFMClose))
      if (SetFMClose == undefined) {
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 PASSED")
        expect(true).assertTrue()
      } else {
        expect().assertFail();
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 FAILED");
        console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_FLASH_MODE_CLOSE_032
      * @tc.name      : get flash mode close camera0 api
      * @tc.desc      : get flash mode close camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('GET_FLASH_MODE_CLOSE_032', 0, async function (done) {
      console.info(TAG + "Entering GET_FLASH_MODE_CLOSE_032 to operate");
      var GetFMClose = await camera0InputPromise.getFlashMode();
      console.info(TAG + "Entering GET_FLASH_MODE_CLOSE success");
      if (GetFMClose == 0) {
        console.info(TAG + "GET_FLASH_MODE_CLOSE data is not null || undefined: ");
        console.info(TAG + "Current FlashMode is: " + GetFMClose);
        expect(true).assertTrue();
        console.info(TAG + "GET_FLASH_MODE_CLOSE_032 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FLASH_MODE_CLOSE_032 FAILED");
        console.info(TAG + "GET_FLASH_MODE_CLOSE_032 ends here");
      }
      await sleep(1000);
      done();
    })

    // FOCUS promise API's

    it('IS_FOCUS_MODE_MANUAL_SUPPORTED_033', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 to operate");
      var isFMmanualSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
      if (isFMmanualSupportedpromise != null || isFMmanualSupportedpromise != undefined) {
        console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMmanualSupportedpromise);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED_033 FAILED");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED_033 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_MANUAL_034
      * @tc.name      : set focus mode manual camera0 api
      * @tc.desc      : set focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('SET_FOCUS_MODE_MANUAL_034', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 to operate");
      var setFocusManual = await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
      console.info(TAG + "setFocusManual: " + JSON.stringify(setFocusManual))
      if (setFocusManual == undefined) {
        console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
        console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 PASSED")
        expect(true).assertTrue()
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 FAILED");
        console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_MANUAL_035
      * @tc.name      : get focus mode manual camera0 api
      * @tc.desc      : get focus mode manual camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('GET_FOCUS_MODE_MANUAL_035', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_MANUAL_035 to operate");
      var getfocusmodepromise = await camera0InputPromise.getFocusMode();
      console.info(TAG + "Entering GET_FOCUS_MODE_MANUAL_035 SUCCESS");
      if (getfocusmodepromise == 0) {
        console.info(TAG + "Current FocusMode is: " + getfocusmodepromise);
        expect(true).assertTrue();
        console.info(TAG + "GET_FOCUS_MODE_MANUAL_035 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FOCUS_MODE_MANUAL_035 FAILED");
        console.info(TAG + "GET_FOCUS_MODE_MANUAL_035 ends here");
      }
      await sleep(1000);
      done();

    })

    /**
      * @tc.number    : IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036
      * @tc.name      : check if focus mode continuous is supported-camera0Input api
      * @tc.desc      : check if focus mode continuous is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 to operate");
      var isFMContinuousSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      if (isFMContinuousSupportedpromise != null || isFMContinuousSupportedpromise != undefined) {
        console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMContinuousSupportedpromise);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 FAILED");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_CONTINUOUS_037
      * @tc.name      : set focus mode continuous camera0 api
      * @tc.desc      : set focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('SET_FOCUS_MODE_CONTINUOUS_037', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 to operate");
      var setFocusCont = await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      console.info(TAG + "setFocusCont: " + JSON.stringify(setFocusCont))
      if (setFocusCont == undefined) {
        console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
        console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 PASSED")
        expect(true).assertTrue()
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 FAILED");
        console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_CONTINUOUS_038
      * @tc.name      : get focus mode continuous camera0 api
      * @tc.desc      : get focus mode continuous camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('GET_FOCUS_MODE_CONTINUOUS_038', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_CONTINUOUS_038 to operate");
      var getfocusmodepromise = await camera0InputPromise.getFocusMode();
      console.info(TAG + "Entering GET_FOCUS_MODE_CONTINUOUS_038 SUCCESS");
      if (getfocusmodepromise == 1) {
        console.info(TAG + "Current FocusMode is: " + getfocusmodepromise);
        expect(true).assertTrue();
        console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS_038 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS_038 FAILED");
        console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS_038 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : IS_FOCUS_MODE_AUTO_SUPPORTED_039
      * @tc.name      : check if focus mode auto is supported-camera0Input api
      * @tc.desc      : check if focus mode auto is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('IS_FOCUS_MODE_AUTO_SUPPORTED_039', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_039 to operate");
      var isFMAutoSupportedpromise = await camera0InputPromise.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
      if (isFMAutoSupportedpromise != null || isFMAutoSupportedpromise != undefined) {
        console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_039 data is not null || undefined");
        console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " + isFMAutoSupportedpromise);
        expect(true).assertTrue();
        console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_039 PASSED: ");
      }
      else {
        console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED_039 FAILED");
        expect().assertFail();
        console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED_039 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SET_FOCUS_MODE_AUTO_040
      * @tc.name      : set focus mode auto camera0 api
      * @tc.desc      : set focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('SET_FOCUS_MODE_AUTO_040', 0, async function (done) {
      console.info(TAG + "Entering SET_FOCUS_MODE_AUTO_040 to operate");
      var setFocusAuto = await camera0InputPromise.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO);
      console.info(TAG + "setFocusAuto: " + JSON.stringify(setFocusAuto))
      if (setFocusAuto == undefined) {
        console.info(TAG + "Entering SET_FOCUS_MODE_AUTO_040 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
        console.info(TAG + "Entering SET_FOCUS_MODE_AUTO_040 PASSED")
        expect(true).assertTrue()
      }
      else {
        expect().assertFail();
        console.info(TAG + "Entering SET_FOCUS_MODE_AUTO_040 FAILED");
        console.info(TAG + "Entering SET_FOCUS_MODE_AUTO_040 ends here");
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : GET_FOCUS_MODE_AUTO_041
      * @tc.name      : get focus mode auto camera0 api
      * @tc.desc      : get focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/

    it('GET_FOCUS_MODE_AUTO_041', 0, async function (done) {
      console.info(TAG + "Entering GET_FOCUS_MODE_AUTO_041 to operate");
      var getfocusmodepromise = await camera0InputPromise.getFocusMode();
      console.info(TAG + "Entering GET_FOCUS_MODE_AUTO_041 SUCCESS");
      if (getfocusmodepromise == 2) {
        console.info(TAG + "Current FocusMode is: " + getfocusmodepromise);
        expect(true).assertTrue();
        console.info(TAG + "GET_FOCUS_MODE_AUTO_041 PASSED");
      }
      else {
        expect().assertFail();
        console.info(TAG + "GET_FOCUS_MODE_AUTO_041 FAILED");
        console.info(TAG + "GET_FOCUS_MODE_AUTO_041 ends here");
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042 with Rotation-90 & Quality-1
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042 to operate");
        const promise = photoOutputPromise.capture(photosettings2);
        console.info(TAG + "Entering photoOutput capture with photosettings2 success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering photoOutput capture with photosettings2 data is not null || undefined");
          console.info(TAG + "Entering photoOutput capture with  photosettings2 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering photoOutput capture with photosettings2 FAILED");
          console.info(TAG + "Entering photoOutput capture with photosettings2 ends here");
        }
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043 with Rotation-180 & Quality-2
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043 to operate");
        const promise = photoOutputPromise.capture(photosettings3);
        console.info(TAG + "Entering photoOutput capture with photosettings3 success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering photoOutput capture with photosettings3 data is not null || undefined");
          console.info(TAG + "Entering photoOutput capture with  photosettings3 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering photoOutput capture with photosettings3 FAILED");
          console.info(TAG + "Entering photoOutput capture with photosettings3 ends here");
        }
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044 with Rotation-270
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044 to operate");
        const promise = photoOutputPromise.capture(photosettings4);
        console.info(TAG + "Entering photoOutput capture with photosettings4 success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering photoOutput capture with photosettings4 data is not null || undefined");
          console.info(TAG + "Entering photoOutput capture with  photosettings4 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering photoOutput capture with photosettings4 FAILED");
          console.info(TAG + "Entering photoOutput capture with photosettings4 ends here");
        }
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })


	   //ZOOM Function
	   
/**
      * @tc.number    : GET_ZOOM_RATIO_PROMISE_TC_045
      * @tc.name      : get zoom ratio camera-0 cameraId api promise api
      * @tc.desc      : get zoom ratio camera-0 cameraId api promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_ZOOM_RATIO_PROMISE_TC_045', 0, async function (done) {
        console.info("--------------GET_ZOOM_RATIO_PROMISE_TC_045--------------");
        var getZoomRatioPromise = await camera0InputPromise.getZoomRatioRange();
        console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE_TC_045 getZoomRatioPromise: " + JSON.stringify(getZoomRatioPromise));
			if (getZoomRatioPromise != null && getZoomRatioPromise != undefined) {
				console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE_TC_045 setZoomRatioPromise is not null || undefined");
				expect(true).assertTrue();
				console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE_TC_045 success: " + JSON.stringify(getZoomRatioPromise));
				console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE_TC_045 PASSED");
		} else {
			expect().assertFail();
			console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE_TC_045 FAILED");
		}
		console.info(TAG + "Entering GET_ZOOM_RATIO_PROMISE_TC_045 ends here");
		await sleep(1000);
		done();
    })
	
	
	/**
      * @tc.number    : SET_GET_ZOOM_1_PROMISE_TC_046
      * @tc.name      : Zoom camera-0 cameraId api 
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
   it('SET_GET_ZOOM_1_PROMISE_TC_046', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(1);
          console.info(TAG + "setZoomRatio success: 1");
          console.info(TAG + "getZoomRatio called")
            var getpromise1 = await camera0InputPromise.getZoomRatio();
              console.info(TAG + "getZoomRatio success: "+getpromise1);
			  if(getpromise1 !=null && getpromise1 != undefined) {
              expect(getpromise1).assertEqual(1);
              console.info(TAG + "SET_GET_ZOOM_1_PROMISE_TC_046 PASSED ");
			  }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_1_PROMISE_TC_046 FAILED" );
            }
		await sleep(1000);
		done();
    })
		

	/**
      * @tc.number    : SET_GET_ZOOM_2_PROMISE_TC_047
      * @tc.name      : Zoom camera-0 cameraId api 
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
   it('SET_GET_ZOOM_2_PROMISE_TC_047', 0, async function (done) {
       var setpromise = await camera0InputPromise.setZoomRatio(2);
          console.info(TAG + "setZoomRatio success: 2");
          console.info(TAG + "getZoomRatio called")
            var getpromise2 = await camera0InputPromise.getZoomRatio();
              console.info(TAG + "getZoomRatio success: "+getpromise2);
			  if(getpromise2 !=null && getpromise2 != undefined) {
              expect(getpromise2).assertEqual(2);
              console.info(TAG + "SET_GET_ZOOM_2_PROMISE_TC_047 PASSED ");
			  }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_2_PROMISE_TC_047 FAILED" );
            }
		await sleep(1000);
		done();
    })
	

	/**
      * @tc.number    : SET_GET_ZOOM_3_PROMISE_TC_048
      * @tc.name      : Zoom camera-0 cameraId api 
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
   it('SET_GET_ZOOM_3_PROMISE_TC_048', 0, async function (done) {
      var setpromise = await camera0InputPromise.setZoomRatio(3);
          console.info(TAG + "setZoomRatio success: 3");
          console.info(TAG + "getZoomRatio called")
            var getpromise3 = await camera0InputPromise.getZoomRatio();
              console.info(TAG + "getZoomRatio success: "+getpromise3);
			  if(getpromise3 !=null && getpromise3 != undefined) {
              expect(getpromise3).assertEqual(3);
              console.info(TAG + "SET_GET_ZOOM_3_PROMISE_TC_048 PASSED ");
			  }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_3_PROMISE_TC_048 FAILED" );
            }
		await sleep(1000);
		done();
    })
	

	/**
      * @tc.number    : SET_GET_ZOOM_4_PROMISE_TC_049
      * @tc.name      : Zoom camera-0 cameraId api 
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_4_PROMISE_TC_049', 0, async function (done) {
        var setpromise = await camera0InputPromise.setZoomRatio(4);
          console.info(TAG + "setZoomRatio success: 4");
          console.info(TAG + "getZoomRatio called")
            var getpromise4 = await camera0InputPromise.getZoomRatio();
              console.info(TAG + "getZoomRatio success: "+getpromise4);
			  if(getpromise4 !=null && getpromise4 != undefined) {
              expect(getpromise4).assertEqual(4);
              console.info(TAG + "SET_GET_ZOOM_4_PROMISE_TC_049 PASSED ");
			  }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_4_PROMISE_TC_049 FAILED" );
            }
		await sleep(1000);
		done();
    })

	
	/**
      * @tc.number    : SET_GET_ZOOM_5_PROMISE_TC_050
      * @tc.name      : Zoom camera-0 cameraId api 
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_5_PROMISE_TC_050', 0, async function (done) {
        var setpromise = await camera0InputPromise.setZoomRatio(5);
          console.info(TAG + "setZoomRatio success: 5");
          console.info(TAG + "getZoomRatio called")
            var getpromise5 = await camera0InputPromise.getZoomRatio();
              console.info(TAG + "getZoomRatio success: "+getpromise5);
			  if(getpromise5 !=null && getpromise5 != undefined) {
              expect(getpromise5).assertEqual(5);
              console.info(TAG + "SET_GET_ZOOM_5_PROMISE_TC_050 PASSED ");
			  }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_5_PROMISE_TC_050 FAILED" );
            }
		await sleep(1000);
		done();
    })
	

	/**
      * @tc.number    : SET_GET_ZOOM_6_PROMISE_TC_051
      * @tc.name      : Zoom camera-0 cameraId api 
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_6_PROMISE_TC_051', 0, async function (done) {
        var setpromise = await camera0InputPromise.setZoomRatio(6);
          console.info(TAG + "setZoomRatio success: 6");
          console.info(TAG + "getZoomRatio called")
            var getpromise6 = await camera0InputPromise.getZoomRatio();
              console.info(TAG + "getZoomRatio success: "+getpromise6);
			  if(getpromise6 !=null && getpromise6 != undefined) {
              expect(getpromise6).assertEqual(6);
              console.info(TAG + "SET_GET_ZOOM_6_PROMISE_TC_051 PASSED ");
			  }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_6_PROMISE_TC_051 FAILED" );
            }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052', 0, async function (done) {
      if (photoOutputPromise == null || photoOutputPromise == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 to operate");
        const promise = photoOutputPromise.capture(photosettings1);
        console.info(TAG + "Entering photoOutput capture with photosettings1 success");
        if (promise != null || promise != undefined) {
          console.info(TAG + "Entering photoOutput capture with photosettings1 data is not null || undefined");
          console.info(TAG + "Entering photoOutput capture with  photosettings1 PASSED");
        }
        else {
          expect().assertFail();
          console.info(TAG + "Entering photoOutput capture with photosettings1 FAILED");
        }
        console.info(TAG + "Entering photoOutput capture with photosettings1 ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /*CaptureSession APIs test script*/
    /**
      * @tc.number    : CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053
      * @tc.name      : capture session stop api
      * @tc.desc      : capture session stop api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053 to operate");
        const promise = await CaptureSessionPromise.stop();
        console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053 captureSession.stop promise: " + JSON.stringify(promise));
        if (promise != null || promise != undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053 captureSession.stop PASSED");
        }
        console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_PROMISE_053 captureSession.stop ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : CAPTURE_SESSION_RELEASE_SUCCESS_PROMISE_054
      * @tc.name      : capture session release api
      * @tc.desc      : capture session release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('CAPTURE_SESSION_RELEASE_SUCCESS_PROMISE_054', 0, async function (done) {
      if (CaptureSessionPromise == null || CaptureSessionPromise == undefined) {
        console.info(TAG + "Entering CAPTURE_SESSION_RELEASE_SUCCESS_PROMISE_054 captureSession == null || undefined");
      } else {
        console.info(TAG + "Entering CAPTURE_SESSION_RELEASE_SUCCESS_PROMISE_054 to operate");
        const promise = await CaptureSessionPromise.release();
        console.info(TAG + "Entering captureSession.release promise: " + JSON.stringify(promise));
        if (promise != null || promise != undefined) {
          expect(true).assertTrue();
          console.info(TAG + "Entering captureSession.release PASSED");
        }
        console.info(TAG + "Entering captureSession.release ends here");
        await sleep(1000);
        done();
      }
      await sleep(1000);
      done();
    })
  });
}