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

describe('CreateCamera_CameraFormat_Size', function () {
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
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007
      * @tc.name      : Create camerainput from camera-0 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007--------------");
        cameraManager.createCameraInput(camerasArray[0].cameraPosition, camerasArray[0].cameraType, async (err, data) => {
            if (!err || err.message != "Failed to get create camera input arguments!") {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007 success");
                if (data == null || data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007 data is null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007 PASSED");
                } else {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007 FAILED: " + err.message);
                    expect().assertFail();
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_007 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008
      * @tc.name      : Create camerainput from camera-0 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-0 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008--------------");
        var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[0].cameraPosition, camerasArray[0].cameraType);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
        if (cameraInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008 cameraInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_008 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_009
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_009', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_009--------------");
        camera0InputPromise.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_009 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_009 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_009 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_009 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_009 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_009 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010--------------");
        var cam0FormatPromise = await camera0InputPromise.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010: " + JSON.stringify(cam0FormatPromise));
        if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010 is not null || undefined");
            for (var i = 0; i < cam0FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010 cam0FormatPromise: " + cam0FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_010 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011
      * @tc.name      : Get supported sizes using camera-0 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-0 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011--------------");
        camera0InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_011 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012
      * @tc.name      : Get supported sizes using camera-0 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-0 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012--------------");
        var sizeArrayPromise = await camera0InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012 sizeArrayPromise");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_012 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_013
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_013', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_013--------------");
        camera0InputPromise.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_013 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_013 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_013 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_013 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_013 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_013 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014--------------");
        var cam0FormatPromise = await camera0InputPromise.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014: " + JSON.stringify(cam0FormatPromise));
        if (cam0FormatPromise != null && cam0FormatPromise.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014 is not null || undefined");
            for (var i = 0; i < cam0FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014 cam0FormatPromise: " + cam0FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_014 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015
      * @tc.name      : Get supported sizes from camera-0 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-0 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015--------------");
        camera0InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
					expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_015 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016
      * @tc.name      : Get supported sizes from camera-0 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-0 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016--------------");
        var sizeArrayPromise = await camera0InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_016 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017
      * @tc.name      : Create camerainput from camera-0 cameraposition back & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition back & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017--------------");
		camera0InputPromise.release();
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017 data is not null || undefined");
                    camera0InputPosBack = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_017 ends here");
			camera0InputPosBack.release();
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018
      * @tc.name      : Create camerainput from camera-0 cameraposition back & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-0 cameraposition back & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018--------------");
        camera0InputPromisePosBack = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018 camera0InputPromisePosBack: " + JSON.stringify(camera0InputPromisePosBack));
        if (camera0InputPromisePosBack != null && camera0InputPromisePosBack != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018 camera0InputPromisePosBack is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_018 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_019
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_019', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_019--------------");
        camera0InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_019 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_019 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_019 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_019 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_019 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_019 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020--------------");
        var cam0FormatPromisePosBack = await camera0InputPromisePosBack.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020: " + JSON.stringify(cam0FormatPromisePosBack));
        if (cam0FormatPromisePosBack != null && cam0FormatPromisePosBack.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020 is not null || undefined");
            for (var i = 0; i < cam0FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020 cam0FormatPromisePosBack: " + cam0FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_020 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021
      * @tc.name      : Get supported sizes using camera-0 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-0 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021--------------");
        camera0InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
					}
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_021 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022
      * @tc.name      : Get supported sizes using camera-0 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-0 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022--------------");
        var sizeArrayPromise = await camera0InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_022 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_023
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_023', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_023--------------");
        camera0InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_023 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_023 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_023 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_023 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_023 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_023 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024--------------");
        var cam0FormatPromisePosBack = await camera0InputPromisePosBack.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024: " + JSON.stringify(cam0FormatPromisePosBack));
        if (cam0FormatPromisePosBack != null && cam0FormatPromisePosBack.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024 is not null || undefined");
            for (var i = 0; i < cam0FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024 cam0FormatPromisePosBack: " + cam0FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_024 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025
      * @tc.name      : Get supported sizes from camera-0 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-0 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025--------------");
        camera0InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
					expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_025 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026
      * @tc.name      : Get supported sizes from camera-0 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-0 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026--------------");
        var sizeArrayPromise = await camera0InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_026 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027 data is not null || undefined");
                    camera0InputPosFront = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_027 ends here");
			camera0InputPosFront.release();
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028--------------");
        camera0InputPromisePosFront = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028 camera0InputPromisePosFront: " + JSON.stringify(camera0InputPromisePosFront));
        if (camera0InputPromisePosFront != null && camera0InputPromisePosFront != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028 camera0InputPromisePosFront is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_028 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_029
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_029', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_029--------------");
        camera0InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_029 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_029 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_029 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_029 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_029 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_029 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030--------------");
        var cam0FormatPromisePosFront = await camera0InputPromisePosFront.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030: " + JSON.stringify(cam0FormatPromisePosFront));
        if (cam0FormatPromisePosFront != null && cam0FormatPromisePosFront.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030 is not null || undefined");
            for (var i = 0; i < cam0FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030 cam0FormatPromisePosFront: " + cam0FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_030 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031
      * @tc.name      : Get supported sizes using camera-0 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-0 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031--------------");
        camera0InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
					}
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_031 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032
      * @tc.name      : Get supported sizes using camera-0 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-0 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032--------------");
        var sizeArrayPromise = await camera0InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_032 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_033
      * @tc.name      : Get supported photo format from camera-0 camerainput async api
      * @tc.desc      : Get supported photo format from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_033', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_033--------------");
        camera0InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_033 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_033 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_033 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_033 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_033 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_033 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034
      * @tc.name      : Get supported photo format from camera-0 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034--------------");
        var cam0FormatPromisePosFront = await camera0InputPromisePosFront.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034: " + JSON.stringify(cam0FormatPromisePosFront));
        if (cam0FormatPromisePosFront != null && cam0FormatPromisePosFront.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034 is not null || undefined");
            for (var i = 0; i < cam0FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034 cam0FormatPromisePosFront: " + cam0FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_034 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035
      * @tc.name      : Get supported sizes from camera-0 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-0 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035--------------");
        camera0InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
					expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_035 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036
      * @tc.name      : Get supported sizes from camera-0 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-0 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036--------------");
        var sizeArrayPromise = await camera0InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_036 ends here");
        console.info("--------------CAMERA-0 ENDS HERE--------------");
        await sleep(1000);
        done();
    })

    /*CAMERA-1 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_TC_037
      * @tc.name      : Create camerainput from camera-1 cameraId async api
      * @tc.desc      : Create camerainput from camera-1 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_TC_037', 0, async function (done) {
        console.info("--------------CAMERA-1 STARTS HERE--------------");
        console.info("--------------CREATE_CAMERA_INPUT_TC_037--------------");
        cameraManager.createCameraInput(camerasArray[1].cameraId, async (err, data) => {
            if (!err) {
                if (data != null && data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_037 data is not null || undefined");
                    camera0Input = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_037 PASSED with CameraID :" + camerasArray[1].cameraId);
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_037 FAILED: " + err.message);
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_037 ends here");
            await sleep(5000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_PROMISE_TC_038
      * @tc.name      : Create camerainput from camera-1 cameraId promise api
      * @tc.desc      : Create camerainput from camera-1 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_PROMISE_TC_038', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_PROMISE_TC_038--------------");
        camera1InputPromise = await cameraManager.createCameraInput(camerasArray[1].cameraId);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_038 camera1InputPromise: " + JSON.stringify(camera1InputPromise));
        if (camera1InputPromise != null && camera1InputPromise != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_038 camera1InputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_038 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_038 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_038 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039
      * @tc.name      : Create camerainput from camera-1 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-1 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039--------------");
        cameraManager.createCameraInput(camerasArray[1].cameraPosition, camerasArray[1].cameraType, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039 data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_039 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040
      * @tc.name      : Create camerainput from camera-1 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-1 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040--------------");
        var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[1].cameraPosition, camerasArray[1].cameraType);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
        if (cameraInputPromise != null && cameraInputPromise != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040 cameraInputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_040 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_041
      * @tc.name      : Get supported preview formats from camera-1 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_041', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_041--------------");
        camera1InputPromise.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_041 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_041 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_041 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_041 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_041 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_041 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042
      * @tc.name      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042--------------");
        var cam1FormatPromise = await camera1InputPromise.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042: " + JSON.stringify(cam1FormatPromise));
        if (cam1FormatPromise != null && cam1FormatPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042 is not null || undefined");
            for (var i = 0; i < cam1FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042 cam1FormatPromise: " + cam1FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_042 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043
      * @tc.name      : Get supported sizes using camera-1 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-1 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043--------------");
        camera1InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_043 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044
      * @tc.name      : Get supported sizes using camera-1 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-1 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044--------------");
        var sizeArrayPromise = await camera1InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_044 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_045
      * @tc.name      : Get supported photo format from camera-1 camerainput async api
      * @tc.desc      : Get supported photo format from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_045', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_045--------------");
        camera1InputPromise.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_045 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_045 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_045 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_045 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_045 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_045 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046
      * @tc.name      : Get supported photo format from camera-1 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046--------------");
        var cam1FormatPromise = await camera1InputPromise.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046: " + JSON.stringify(cam1FormatPromise));
        if (cam1FormatPromise != null && cam1FormatPromise.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046 is not null || undefined");
            for (var i = 0; i < cam1FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046 cam1FormatPromise: " + cam1FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_046 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047
      * @tc.name      : Get supported sizes from camera-1 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-1 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047--------------");
        camera1InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_047 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048
      * @tc.name      : Get supported sizes from camera-1 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-1 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048--------------");
        var sizeArrayPromise = await camera1InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_048 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049
      * @tc.name      : Create camerainput from camera-1 cameraposition back & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-1 cameraposition back & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049 data is not null || undefined");
                    camera1InputPosBack = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_049 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050
      * @tc.name      : Create camerainput from camera-1 cameraposition back & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-1 cameraposition back & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050--------------");
        camera1InputPromisePosBack = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050 camera1InputPromisePosBack: " + JSON.stringify(camera1InputPromisePosBack));
        if (camera1InputPromisePosBack != null && camera1InputPromisePosBack != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050 camera1InputPromisePosBack is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_050 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_051
      * @tc.name      : Get supported preview formats from camera-1 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_051', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_051--------------");
        camera1InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_051 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_051 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_051 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_051 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_051 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_051 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052
      * @tc.name      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052--------------");
        var cam1FormatPromisePosBack = await camera1InputPromisePosBack.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052: " + JSON.stringify(cam1FormatPromisePosBack));
        if (cam1FormatPromisePosBack != null && cam1FormatPromisePosBack.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052 is not null || undefined");
            for (var i = 0; i < cam1FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052 cam1FormatPromisePosBack: " + cam1FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_052 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053
      * @tc.name      : Get supported sizes using camera-1 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-1 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053--------------");
        camera1InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
					}
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_053 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054
      * @tc.name      : Get supported sizes using camera-1 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-1 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054--------------");
        var sizeArrayPromise = await camera1InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_054 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_055
      * @tc.name      : Get supported photo format from camera-1 camerainput async api
      * @tc.desc      : Get supported photo format from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_055', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_055--------------");
        camera1InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_055 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_055 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_055 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_055 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_055 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_055 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056
      * @tc.name      : Get supported photo format from camera-1 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056--------------");
        var cam1FormatPromisePosBack = await camera1InputPromisePosBack.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056: " + JSON.stringify(cam1FormatPromisePosBack));
        if (cam1FormatPromisePosBack != null && cam1FormatPromisePosBack.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056 is not null || undefined");
            for (var i = 0; i < cam1FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056 cam1FormatPromisePosBack: " + cam1FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_056 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057
      * @tc.name      : Get supported sizes from camera-1 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-1 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057--------------");
        camera1InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_057 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058
      * @tc.name      : Get supported sizes from camera-1 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-1 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058--------------");
        var sizeArrayPromise = await camera1InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_058 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059
      * @tc.name      : Create camerainput from camera-1 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-1 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059 data is not null || undefined");
                    camera1InputPosFront = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_059 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060
      * @tc.name      : Create camerainput from camera-1 cameraposition front & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-1 cameraposition front & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060--------------");
        camera1InputPromisePosFront = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060 camera1InputPromisePosFront: " + JSON.stringify(camera1InputPromisePosFront));
        if (camera1InputPromisePosFront != null && camera1InputPromisePosFront != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060 camera1InputPromisePosFront is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_060 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_061
      * @tc.name      : Get supported preview formats from camera-1 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_061', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_061--------------");
        camera1InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_061 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_061 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_061 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_061 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_061 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_061 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062
      * @tc.name      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062--------------");
        var cam1FormatPromisePosFront = await camera1InputPromisePosFront.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062: " + JSON.stringify(cam1FormatPromisePosFront));
        if (cam1FormatPromisePosFront != null && cam1FormatPromisePosFront.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062 is not null || undefined");
            for (var i = 0; i < cam1FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062 cam1FormatPromisePosFront: " + cam1FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_062 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063
      * @tc.name      : Get supported sizes using camera-1 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-1 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063--------------");
        camera1InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_063 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064
      * @tc.name      : Get supported sizes using camera-1 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-1 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064--------------");
        var sizeArrayPromise = await camera1InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_064 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_065
      * @tc.name      : Get supported photo format from camera-1 camerainput async api
      * @tc.desc      : Get supported photo format from camera-1 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_065', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_065--------------");
        camera1InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_065 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_065 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_065 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_065 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_065 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_065 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066
      * @tc.name      : Get supported photo format from camera-1 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-1 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066--------------");
        var cam1FormatPromisePosFront = await camera1InputPromisePosFront.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066: " + JSON.stringify(cam1FormatPromisePosFront));
        if (cam1FormatPromisePosFront != null && cam1FormatPromisePosFront.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066 is not null || undefined");
            for (var i = 0; i < cam1FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066 cam1FormatPromisePosFront: " + cam1FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_066 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067
      * @tc.name      : Get supported sizes from camera-1 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-1 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067--------------");
        camera1InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_067 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068
      * @tc.name      : Get supported sizes from camera-1 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-1 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068--------------");
        var sizeArrayPromise = await camera1InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_068 ends here");
        console.info("--------------CAMERA-1 ENDS HERE--------------");
        await sleep(1000);
        done();
    })

    /*CAMERA-2 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_TC_069
      * @tc.name      : Create camerainput from camera-2 cameraId async api
      * @tc.desc      : Create camerainput from camera-2 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_TC_069', 0, async function (done) {
        console.info("--------------CAMERA-2 STARTS HERE--------------");
        console.info("--------------CREATE_CAMERA_INPUT_TC_069--------------");
        cameraManager.createCameraInput(camerasArray[2].cameraId, async (err, data) => {
            if (!err) {
                if (data != null && data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_069 data is not null || undefined");
                    camera0Input = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_069 PASSED with CameraID :" + camerasArray[2].cameraId);
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_069 FAILED: " + err.message);
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_069 ends here");
            await sleep(5000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_PROMISE_TC_070
      * @tc.name      : Create camerainput from camera-2 cameraId promise api
      * @tc.desc      : Create camerainput from camera-2 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_PROMISE_TC_070', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_PROMISE_TC_070--------------");
        camera2InputPromise = await cameraManager.createCameraInput(camerasArray[2].cameraId);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_070 camera2InputPromise: " + JSON.stringify(camera2InputPromise));
        if (camera2InputPromise != null && camera2InputPromise != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_070 camera2InputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_070 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_070 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_070 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071
      * @tc.name      : Create camerainput from camera-2 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-2 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071--------------");
        cameraManager.createCameraInput(camerasArray[2].cameraPosition, camerasArray[2].cameraType, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071 data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_071 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072
      * @tc.name      : Create camerainput from camera-2 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-2 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072--------------");
        var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[2].cameraPosition, camerasArray[2].cameraType);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
        if (cameraInputPromise != null && cameraInputPromise != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072 cameraInputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_072 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_073
      * @tc.name      : Get supported preview formats from camera-2 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_073', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_073--------------");
        camera2InputPromise.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_073 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_073 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_073 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_073 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_073 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_073 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074
      * @tc.name      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074--------------");
        var cam2FormatPromise = await camera2InputPromise.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074: " + JSON.stringify(cam2FormatPromise));
        if (cam2FormatPromise != null && cam2FormatPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074 is not null || undefined");
            for (var i = 0; i < cam2FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074 cam2FormatPromise: " + cam2FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_074 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075
      * @tc.name      : Get supported sizes using camera-2 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-2 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075--------------");
        camera2InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_075 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076
      * @tc.name      : Get supported sizes using camera-2 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-2 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076--------------");
        var sizeArrayPromise = await camera2InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_076 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_077
      * @tc.name      : Get supported photo format from camera-2 camerainput async api
      * @tc.desc      : Get supported photo format from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_077', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_077--------------");
        camera2InputPromise.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_077 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_077 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_077 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_077 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_077 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_077 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078
      * @tc.name      : Get supported photo format from camera-2 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078--------------");
        var cam2FormatPromise = await camera2InputPromise.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078: " + JSON.stringify(cam2FormatPromise));
        if (cam2FormatPromise != null && cam2FormatPromise.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078 is not null || undefined");
            for (var i = 0; i < cam2FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078 cam2FormatPromise: " + cam2FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_078 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079
      * @tc.name      : Get supported sizes from camera-2 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-2 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079--------------");
        camera2InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_079 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080
      * @tc.name      : Get supported sizes from camera-2 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-2 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080--------------");
        var sizeArrayPromise = await camera2InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_080 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081
      * @tc.name      : Create camerainput from camera-2 cameraposition back & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-2 cameraposition back & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081 data is not null || undefined");
                    camera2InputPosBack = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_081 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082
      * @tc.name      : Create camerainput from camera-2 cameraposition back & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-2 cameraposition back & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082--------------");
        camera2InputPromisePosBack = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082 camera2InputPromisePosBack: " + JSON.stringify(camera2InputPromisePosBack));
        if (camera2InputPromisePosBack != null && camera2InputPromisePosBack != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082 camera2InputPromisePosBack is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_082 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_083
      * @tc.name      : Get supported preview formats from camera-2 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_083', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_083--------------");
        camera2InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_083 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_083 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_083 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_083 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_083 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_083 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084
      * @tc.name      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084--------------");
        var cam2FormatPromisePosBack = await camera2InputPromisePosBack.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084: " + JSON.stringify(cam2FormatPromisePosBack));
        if (cam2FormatPromisePosBack != null && cam2FormatPromisePosBack.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084 is not null || undefined");
            for (var i = 0; i < cam2FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084 cam2FormatPromisePosBack: " + cam2FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_084 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085
      * @tc.name      : Get supported sizes using camera-2 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-2 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085--------------");
        camera2InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_085 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086
      * @tc.name      : Get supported sizes using camera-2 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-2 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086--------------");
        var sizeArrayPromise = await camera2InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_086 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_087
      * @tc.name      : Get supported photo format from camera-2 camerainput async api
      * @tc.desc      : Get supported photo format from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_087', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_087--------------");
        camera2InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_087 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_087 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_087 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_087 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_087 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_087 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088
      * @tc.name      : Get supported photo format from camera-2 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088--------------");
        var cam2FormatPromisePosBack = await camera2InputPromisePosBack.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088: " + JSON.stringify(cam2FormatPromisePosBack));
        if (cam2FormatPromisePosBack != null && cam2FormatPromisePosBack.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088 is not null || undefined");
            for (var i = 0; i < cam2FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088 cam2FormatPromisePosBack: " + cam2FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_088 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089
      * @tc.name      : Get supported sizes from camera-2 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-2 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089--------------");
        camera2InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_089 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090
      * @tc.name      : Get supported sizes from camera-2 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-2 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090--------------");
        var sizeArrayPromise = await camera2InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_090 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091
      * @tc.name      : Create camerainput from camera-2 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-2 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091 data is not null || undefined");
                    camera2InputPosFront = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_091 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092
      * @tc.name      : Create camerainput from camera-2 cameraposition front & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-2 cameraposition front & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092--------------");
        camera2InputPromisePosFront = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092 camera2InputPromisePosFront: " + JSON.stringify(camera2InputPromisePosFront));
        if (camera2InputPromisePosFront != null && camera2InputPromisePosFront != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092 camera2InputPromisePosFront is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_092 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_093
      * @tc.name      : Get supported preview formats from camera-2 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_093', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_093--------------");
        camera2InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_093 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_093 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_093 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_093 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_093 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_093 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094
      * @tc.name      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094--------------");
        var cam2FormatPromisePosFront = await camera2InputPromisePosFront.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094: " + JSON.stringify(cam2FormatPromisePosFront));
        if (cam2FormatPromisePosFront != null && cam2FormatPromisePosFront.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094 is not null || undefined");
            for (var i = 0; i < cam2FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094 cam2FormatPromisePosFront: " + cam2FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_094 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095
      * @tc.name      : Get supported sizes using camera-2 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-2 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095--------------");
        camera2InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_095 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096
      * @tc.name      : Get supported sizes using camera-2 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-2 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096--------------");
        var sizeArrayPromise = await camera2InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_096 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_097
      * @tc.name      : Get supported photo format from camera-2 camerainput async api
      * @tc.desc      : Get supported photo format from camera-2 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_097', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_097--------------");
        camera2InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_097 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_097 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_097 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_097 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_097 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_097 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098
      * @tc.name      : Get supported photo format from camera-2 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-2 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098--------------");
        var cam2FormatPromisePosFront = await camera2InputPromisePosFront.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098: " + JSON.stringify(cam2FormatPromisePosFront));
        if (cam2FormatPromisePosFront != null && cam2FormatPromisePosFront.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098 is not null || undefined");
            for (var i = 0; i < cam2FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098 cam2FormatPromisePosFront: " + cam2FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_098 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099
      * @tc.name      : Get supported sizes from camera-2 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-2 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099--------------");
        camera2InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_099 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100
      * @tc.name      : Get supported sizes from camera-2 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-2 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100--------------");
        var sizeArrayPromise = await camera2InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_100 ends here");
        console.info("--------------CAMERA-2 ENDS HERE--------------");
        await sleep(1000);
        done();
    })

    /*CAMERA-3 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_TC_101
      * @tc.name      : Create camerainput from camera-3 cameraId async api
      * @tc.desc      : Create camerainput from camera-3 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_TC_101', 0, async function (done) {
        console.info("--------------CAMERA-3 STARTS HERE--------------");
        console.info("--------------CREATE_CAMERA_INPUT_TC_101--------------");
        cameraManager.createCameraInput(camerasArray[3].cameraId, async (err, data) => {
            if (!err) {
                if (data != null && data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_101 data is not null || undefined");
                    camera0Input = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_101 PASSED with CameraID :" + camerasArray[3].cameraId);
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_101 FAILED: " + err.message);
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_101 ends here");
            await sleep(5000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_PROMISE_TC_102
      * @tc.name      : Create camerainput from camera-3 cameraId promise api
      * @tc.desc      : Create camerainput from camera-3 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_PROMISE_TC_102', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_PROMISE_TC_102--------------");
        camera3InputPromise = await cameraManager.createCameraInput(camerasArray[3].cameraId);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_102 camera3InputPromise: " + JSON.stringify(camera3InputPromise));
        if (camera3InputPromise != null && camera3InputPromise != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_102 camera3InputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_102 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_102 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_PROMISE_TC_102 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103
      * @tc.name      : Create camerainput from camera-3 cameraposition & cameratype async api
      * @tc.desc      : Create camerainput from camera-3 cameraposition & cameratype async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103--------------");
        cameraManager.createCameraInput(camerasArray[3].cameraPosition, camerasArray[3].cameraType, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103 data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_TC_103 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104
      * @tc.name      : Create camerainput from camera-3 cameraposition & cameratype promise api
      * @tc.desc      : Create camerainput from camera-3 cameraposition & cameratype promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104--------------");
        var cameraInputPromise = await cameraManager.createCameraInput(camerasArray[3].cameraPosition, camerasArray[3].cameraType);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104 cameraInputPromise: " + JSON.stringify(cameraInputPromise));
        if (cameraInputPromise != null && cameraInputPromise != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104 cameraInputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POSITION_TYPE_PROMISE_TC_104 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_105
      * @tc.name      : Get supported preview formats from camera-3 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_105', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_105--------------");
        camera3InputPromise.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_105 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_105 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_105 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_105 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_105 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_105 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106
      * @tc.name      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106--------------");
        var cam3FormatPromise = await camera3InputPromise.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106: " + JSON.stringify(cam3FormatPromise));
        if (cam3FormatPromise != null && cam3FormatPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106 is not null || undefined");
            for (var i = 0; i < cam3FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106 cam3FormatPromise: " + cam3FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_106 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107
      * @tc.name      : Get supported sizes using camera-3 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-3 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107--------------");
        camera3InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_107 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108
      * @tc.name      : Get supported sizes using camera-3 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-3 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108--------------");
        var sizeArrayPromise = await camera3InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_108 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_109
      * @tc.name      : Get supported photo format from camera-3 camerainput async api
      * @tc.desc      : Get supported photo format from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_109', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_109--------------");
        camera3InputPromise.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_109 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_109 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_109 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_109 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_109 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_109 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110
      * @tc.name      : Get supported photo format from camera-3 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110--------------");
        var cam3FormatPromise = await camera3InputPromise.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110: " + JSON.stringify(cam3FormatPromise));
        if (cam3FormatPromise != null && cam3FormatPromise.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110 is not null || undefined");
            for (var i = 0; i < cam3FormatPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110 cam3FormatPromise: " + cam3FormatPromise[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_110 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111
      * @tc.name      : Get supported sizes from camera-3 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-3 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111--------------");
        camera3InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_111 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112
      * @tc.name      : Get supported sizes from camera-3 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-3 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112--------------");
        var sizeArrayPromise = await camera3InputPromise.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_112 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113
      * @tc.name      : Create camerainput from camera-3 cameraposition back & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-3 cameraposition back & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113 data is not null || undefined");
                    camera3InputPosBack = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_TC_113 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114
      * @tc.name      : Create camerainput from camera-3 cameraposition back & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-3 cameraposition back & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114--------------");
        camera3InputPromisePosBack = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114 camera3InputPromisePosBack: " + JSON.stringify(camera3InputPromisePosBack));
        if (camera3InputPromisePosBack != null && camera3InputPromisePosBack != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114 camera3InputPromisePosBack is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_UNSPECIFIED_PROMISE_TC_114 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_115
      * @tc.name      : Get supported preview formats from camera-3 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_115', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_115--------------");
        camera3InputPromisePosBack.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_115 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_115 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_115 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_115 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_115 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_115 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116
      * @tc.name      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116--------------");
        var cam3FormatPromisePosBack = await camera3InputPromisePosBack.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116: " + JSON.stringify(cam3FormatPromisePosBack));
        if (cam3FormatPromisePosBack != null && cam3FormatPromisePosBack.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116 is not null || undefined");
            for (var i = 0; i < cam3FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116 cam3FormatPromisePosBack: " + cam3FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_116 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117
      * @tc.name      : Get supported sizes using camera-3 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-3 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117--------------");
        camera3InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_117 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118
      * @tc.name      : Get supported sizes using camera-3 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-3 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118--------------");
        var sizeArrayPromise = await camera3InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_118 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_119
      * @tc.name      : Get supported photo format from camera-3 camerainput async api
      * @tc.desc      : Get supported photo format from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_119', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_119--------------");
        camera3InputPromisePosBack.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_119 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_119 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_119 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_119 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_119 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_119 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120
      * @tc.name      : Get supported photo format from camera-3 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120--------------");
        var cam3FormatPromisePosBack = await camera3InputPromisePosBack.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120: " + JSON.stringify(cam3FormatPromisePosBack));
        if (cam3FormatPromisePosBack != null && cam3FormatPromisePosBack.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120 is not null || undefined");
            for (var i = 0; i < cam3FormatPromisePosBack.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120 cam3FormatPromisePosBack: " + cam3FormatPromisePosBack[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_120 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121
      * @tc.name      : Get supported sizes from camera-3 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-3 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121--------------");
        camera3InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_121 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122
      * @tc.name      : Get supported sizes from camera-3 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-3 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122--------------");
        var sizeArrayPromise = await camera3InputPromisePosBack.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_122 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123
      * @tc.name      : Create camerainput from camera-3 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-3 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123 data is not null || undefined");
                    camera3InputPosFront = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_TC_123 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124
      * @tc.name      : Create camerainput from camera-3 cameraposition front & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-3 cameraposition front & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124--------------");
        camera3InputPromisePosFront = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124 camera3InputPromisePosFront: " + JSON.stringify(camera3InputPromisePosFront));
        if (camera3InputPromisePosFront != null && camera3InputPromisePosFront != undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124 camera3InputPromisePosFront is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_UNSPECIFIED_PROMISE_TC_124 ends here");
        await sleep(1000);
        done();
    })

    /*GET_SUPPORTED_PREVIEW_PHOTO_FORMATS_SIZE_TC*/
    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_TC_125
      * @tc.name      : Get supported preview formats from camera-3 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_TC_125', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_TC_125--------------");
        camera3InputPromisePosFront.getSupportedPreviewFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_125 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_125 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_125 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_125 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_125 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_TC_125 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126
      * @tc.name      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126--------------");
        var cam3FormatPromisePosFront = await camera3InputPromisePosFront.getSupportedPreviewFormats();
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126: " + JSON.stringify(cam3FormatPromisePosFront));
        if (cam3FormatPromisePosFront != null && cam3FormatPromisePosFront.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126 is not null || undefined");
            for (var i = 0; i < cam3FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126 cam3FormatPromisePosFront: " + cam3FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPPORTED_PREVIEW_FORMATS_PROMISE_TC_126 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127
      * @tc.name      : Get supported sizes using camera-3 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes using camera-3 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127--------------");
        camera3InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_TC_127 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128
      * @tc.name      : Get supported sizes using camera-3 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes using camera-3 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128--------------");
        var sizeArrayPromise = await camera3InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_YCRCb_420_SP);
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128 sizeArrayPromise: ");
        if (sizeArrayPromise != null && sizeArrayPromise.length > 0) {
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128 size0ArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128 size0ArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128 PASSED");
        } else {
            expect().assertFail();
            console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128 FAILED");
        }
        console.info("CameraModuleTest: Entering GET_SUPP_SIZES_CAMERA_FORMAT_YCRCb_420_SP_PROMISE_TC_128 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_TC_129
      * @tc.name      : Get supported photo format from camera-3 camerainput async api
      * @tc.desc      : Get supported photo format from camera-3 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_TC_129', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_TC_129--------------");
        camera3InputPromisePosFront.getSupportedPhotoFormats(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_129 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_129 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_129 cameraFormat: " + data[i]);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_129 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_129 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_TC_129 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130
      * @tc.name      : Get supported photo format from camera-3 camerainput promise api
      * @tc.desc      : Get supported photo format from camera-3 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130', 0, async function (done) {
        console.info("--------------GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130--------------");
        var cam3FormatPromisePosFront = await camera3InputPromisePosFront.getSupportedPhotoFormats();
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130: " + JSON.stringify(cam3FormatPromisePosFront));
        if (cam3FormatPromisePosFront != null && cam3FormatPromisePosFront.length > 0) {
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130 is not null || undefined");
            for (var i = 0; i < cam3FormatPromisePosFront.length; i++) {
                console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130 cam3FormatPromisePosFront: " + cam3FormatPromisePosFront[i]);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130 FAILED");
        }
        console.info(TAG + "Entering GET_SUPPORTED_PHOTO_FORMATS_PROMISE_TC_130 ends here");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131
      * @tc.name      : Get supported sizes from camera-3 cameraformat & camerainput async api
      * @tc.desc      : Get supported sizes from camera-3 cameraformat & camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131--------------");
        camera3InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131 success");
                if (data != null || data.length > 0) {
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131 data is not null || undefined");
                    for (var i = 0; i < data.length; i++) {
                        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131 sizeArray: width * height - " +data[i].width + " * " +data[i].height);
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131 PASSED");
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_TC_131 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132
      * @tc.name      : Get supported sizes from camera-3 cameraformat & camerainput promise api
      * @tc.desc      : Get supported sizes from camera-3 cameraformat & camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132', 0, async function (done) {
        console.info("--------------GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132--------------");
        var sizeArrayPromise = await camera3InputPromisePosFront.getSupportedSizes(cameraObj.CameraFormat.CAMERA_FORMAT_JPEG);
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132: ");
        if (sizeArrayPromise != null && sizeArrayPromise != undefined) {
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132 sizeArrayPromise is not null || undefined");
            for (var i = 0; i < sizeArrayPromise.length; i++) {
                console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132 sizeArrayPromise: width * height - " +sizeArrayPromise[i].width + " * " + sizeArrayPromise[i].height);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132 FAILED");
        }
        console.info(TAG + "Entering GET_SUPP_SIZES_CAMERA_FORMAT_JPEG_PROMISE_TC_132 ends here");
        console.info("--------------CAMERA-3 ENDS HERE--------------");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE UNSPECIFIED*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype unspecified async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133 success: ");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_TC_133 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_UNSPECIFIED);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134 camInputPromise is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_UNSPECIFIED_PROMISE_TC_134 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_TC_135 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype wide angle promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype wide angle promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_WIDE_ANGLE_PROMISE_TC_136 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE ULTRA ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype ultra wide async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype ultra wide async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137 data null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_TC_137 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype ultra wide promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype ultra wide promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_ULTRA_WIDE_PROMISE_TC_138 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE TELEPHOTO*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_TC_139 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TELEPHOTO_PROMISE_TC_140 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION UNSPECIFIED & TYPE TRUE DEAPTH*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype true deapth async api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype true deapth async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEAPTH, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_TC_141 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142
      * @tc.name      : Create camerainput from cameraposition unspecified & cameratype true deapth promise api
      * @tc.desc      : Create camerainput from cameraposition unspecified & cameratype true deapth promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEAPTH);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_UNSPECIFIED_TYPE_TRUE_DEAPTH_PROMISE_TC_142 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143
      * @tc.name      : Create camerainput from cameraposition back & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_TC_143 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144
      * @tc.name      : Create camerainput from cameraposition back & cameratype wide angle promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype wide angle promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_WIDE_ANGLE_PROMISE_TC_144 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE ULTRA ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145
      * @tc.name      : Create camerainput from cameraposition back & cameratype ultra wide async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype ultra wide async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_TC_145 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146
      * @tc.name      : Create camerainput from cameraposition back & cameratype ultra wide promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype ultra wide promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146 camInputPromise isnull || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_ULTRA_WIDE_PROMISE_TC_146 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE TELEPHOTO*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147
      * @tc.name      : Create camerainput from cameraposition back & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_TC_147 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148
      * @tc.name      : Create camerainput from cameraposition back & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TELEPHOTO_PROMISE_TC_148 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION BACK & TYPE TRUE DEAPTH*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149
      * @tc.name      : Create camerainput from cameraposition back & cameratype true deapth async api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype true deapth async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEAPTH, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_TC_149 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150
      * @tc.name      : Create camerainput from cameraposition back & cameratype true deapth promise api
      * @tc.desc      : Create camerainput from cameraposition back & cameratype true deapth promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_BACK, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEAPTH);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_BACK_TYPE_TRUE_DEAPTH_PROMISE_TC_150 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE WIDE ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151
      * @tc.name      : Create camerainput from cameraposition front & cameratype wide angle async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype wide angle async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_TC_151 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152
      * @tc.name      : Create camerainput from cameraposition front & cameratype wide angle promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype wide angle promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_WIDE_ANGLE);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_WIDE_ANGLE_PROMISE_TC_152 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE ULTRA ANGLE*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153
      * @tc.name      : Create camerainput from cameraposition front & cameratype ultra wide async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype ultra wide async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_TC_153 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154
      * @tc.name      : Create camerainput from cameraposition front & cameratype ultra wide promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype ultra wide promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_ULTRA_WIDE);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_ULTRA_WIDE_PROMISE_TC_154 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE TELEPHOTO*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155
      * @tc.name      : Create camerainput from cameraposition front & cameratype telephoto async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype telephoto async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_TC_155 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156
      * @tc.name      : Create camerainput from cameraposition front & cameratype telephoto promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype telephoto promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TELEPHOTO);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TELEPHOTO_PROMISE_TC_156 ends here");
        await sleep(1000);
        done();
    })

    /*CREATE CAMERAINPUT WITH POSITION FRONT & TYPE TRUE DEAPTH*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157
      * @tc.name      : Create camerainput from cameraposition front & cameratype true deapth async api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype true deapth async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157--------------");
        cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEAPTH, async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157 success");
                if (data == undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157 data is null || undefined");
                    var camInput = data;
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157 camInput: " + JSON.stringify(camInput));
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157 PASSED");
                }
            } else {
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157 FAILED: " + err.message);
                expect().assertFail();
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_TC_157 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158
      * @tc.name      : Create camerainput from cameraposition front & cameratype true deapth promise api
      * @tc.desc      : Create camerainput from cameraposition front & cameratype true deapth promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158', 0, async function (done) {
        console.info("--------------CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158--------------");
        var camInputPromise = await cameraManager.createCameraInput(cameraObj.CameraPosition.CAMERA_POSITION_FRONT, cameraObj.CameraType.CAMERA_TYPE_TRUE_DEAPTH);
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158 camInputPromise: " + JSON.stringify(camInputPromise));
        if (camInputPromise == undefined) {
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158 camInputPromise is null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158 PASSED");
        } else {
            expect().assertFail();
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158 FAILED");
        }
        console.info(TAG + "Entering CREATE_CAMERA_INPUT_POS_FRONT_TYPE_TRUE_DEAPTH_PROMISE_TC_158 ends here");
        await sleep(1000);
        done();
    })

})
}