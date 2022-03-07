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
var cameraManager;
var previewOutputAsync;
var photoOutputAsync;
var captureSession;
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

describe('PhotoModeAsync', function () {
    // Define local variables
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

    console.info(TAG + "----------Camera-PhotoMode-Async-------------");
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
      * @tc.number    : GET_CAMERAS_TC_002
      * @tc.name      : Get camera from cameramanager to get array of camera async api
      * @tc.desc      : Get camera from cameramanager to get array of camera async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_CAMERAS_TC_002', 0, async function (done) {
        console.info("--------------GET_CAMERAS_TC_002--------------");
        cameraManager.getCameras(async (err, data) => {
            if (!err) {
                console.info(TAG + "Entering GET_CAMERAS_TC_002 success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering GET_CAMERAS_TC_002 data is not null || undefined");
                    camerasArray = data;
                    if (camerasArray != null && camerasArray.length > 0) {
                        for (var i = 0; i < camerasArray.length; i++) {
                            // Get the variables from camera object
                            var cameraId = camerasArray[i].cameraId;
                            console.info(TAG + "Entering GET_CAMERAS_TC_002 camera" + i + "Id: " + cameraId);
                            var cameraPosition = camerasArray[i].cameraPosition;
                            console.info(TAG + "Entering GET_CAMERAS_TC_002 camera" + i + "Position: " + cameraPosition);
                            var cameraType = camerasArray[i].cameraType;
                            console.info(TAG + "Entering GET_CAMERAS_TC_002 camera" + i + "Type: " + cameraType);
                            var connectionType = camerasArray[i].connectionType
                            console.info(TAG + "Entering GET_CAMERAS_TC_002 connection" + i + "Type: " + connectionType);
                        }
                        expect(true).assertTrue();
                        console.info(TAG + "Entering GET_CAMERAS_TC_002 PASSED");
                    } else {
                        expect().assertFail();
                        console.info(TAG + "Entering GET_CAMERAS_TC_002 FAILED cameraArray is null || undefined");
                    }
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering GET_CAMERAS_TC_002 FAILED: " + err.message);
            }
            console.info(TAG + "Entering GET_CAMERAS_TC_002 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

	/*CAMERA-0 Scripts*/
    /**
      * @tc.number    : CREATE_CAMERA_INPUT_TC_003
      * @tc.name      : Create camerainput from camera-0 cameraId async api
      * @tc.desc      : Create camerainput from camera-0 cameraId async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAMERA_INPUT_TC_003', 0, async function (done) {
        console.info("--------------CAMERA-0 STARTS HERE--------------");
        console.info("--------------CREATE_CAMERA_INPUT_TC_003--------------");
        cameraManager.createCameraInput(camerasArray[0].cameraId, async (err, data) => {
            if (!err) {
                if (data != null && data != undefined) {
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_003 data is not null || undefined");
                    camera0Input = data;
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_003 PASSED with CameraID :" + camerasArray[0].cameraId);
                }
            } else {
                expect().assertFail();
                console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_003 FAILED: " + err.message);
            }
            console.info(TAG + "Entering CREATE_CAMERA_INPUT_TC_003 ends here");
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

	/*PreviewOutput APIs test script*/
	/**
      * @tc.number    : CREATE_PREVIEW_OUTPUT_SUCCESS_TC_004
      * @tc.name      : Create PreviewOutput instance api
      * @tc.desc      : Create PreviewOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */

    it('CREATE_PREVIEW_OUTPUT_SUCCESS_TC_004', 0, async function (done) {
        console.info(TAG + " Entering CREATE_PREVIEW_OUTPUT_SUCCESS_TC_004 to operate");
        cameraObj.createPreviewOutput(surfaceId, async (err, data) => {
			if(!err){
            console.info(TAG + " Entering  createPreviewOutput success");
            if (data != null || data != undefined) {
                console.info(TAG + " Entering createPreviewOutput data is not null || undefined");
                previewOutputAsync = data;
                expect(true).assertTrue();
                console.info(TAG + "Entering createPreviewOutput PASSED" + previewOutputAsync);
            }
		} else {
			expect().assertFail();
			console.info(TAG + "Entering createPreviewOutput FAILED" + err.message);
			console.info(TAG + "Entering createPreviewOutput ends here");
			}
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

	/*PhotoOutput APIs test script*/
	/**
      * @tc.number    : CREATE_PHOTO_OUTPUT_SUCCESS_TC_005
      * @tc.name      : Create PhotoOutput instance api
      * @tc.desc      : Create PhotoOutput instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */

    it('CREATE_PHOTO_OUTPUT_SUCCESS_TC_005', 0, async function (done) {
        console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_TC_005 to operate");
		console.info(TAG + 'Entering getImageReceiverSurfaceId')
		await getImageReceiverSurfaceId()
		await sleep(1000)
        cameraObj.createPhotoOutput(surfaceId1, async (err, data) => {
			if(!err){
            console.info(TAG + "Entering  createPhotoOutput success");
            if (data != null || data != undefined) {
                console.info(TAG + "Entering  createPhotoOutput data is not null || undefined");
                photoOutputAsync = data;
                expect(true).assertTrue();
                console.info(TAG + "Entering  CREATE_PHOTO_OUTPUT_SUCCESS_TC_005 PASSED");
            }
		}else {
			expect().assertFail();
			console.info(TAG + "Entering CREATE_PHOTO_OUTPUT_SUCCESS_TC_005 FAILED");
			console.info(TAG + "Entering  createPhotoOutput ends here");
			}
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

	/*CaptureSession APIs test script*/
	/**
      * @tc.number    : CREATE_CAPTURE_SESSION_SUCCESS_TC_006
      * @tc.name      : Create CaptureSession instance api
      * @tc.desc      : Create CaptureSession instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_CAPTURE_SESSION_SUCCESS_TC_006', 0, async function (done) {
        console.info(TAG + "Entering CREATE_CAPTURE_SESSION_SUCCESS_TC_006 to operate");
        cameraObj.createCaptureSession(null, async (err, data) => {
			if(!err){
            console.info(TAG + "Entering createCaptureSession success");
            if (data != null || data != undefined) {
                console.info(TAG + "Entering createCaptureSession data is not null || undefined");
                captureSession = data;
                expect(true).assertTrue();
                console.info(TAG + "Entering createCaptureSession PASSED");
            }
		}else {
			expect().assertFail();
			console.info(TAG + "Entering CREATE_CAPTURE_SESSION_SUCCESS_TC_006 FAILED" +err.message);
			console.info(TAG + "Entering createCaptureSession ends here");
			}
            await sleep(1000);
            done();
        })
        await sleep(1000);
        done();
    })

	/*CaptureSession APIs*/
	/**
      * @tc.number    : CREATE_BEGIN_CONFIG_SUCCESS_TC_007
      * @tc.name      : CaptureSession_Begin config api
      * @tc.desc      : CaptureSession_Begin config api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('CREATE_BEGIN_CONFIG_SUCCESS_TC_007', 0, async function (done) {
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering CREATE_BEGIN_CONFIG_SUCCESS captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering CREATE_BEGIN_CONFIG_SUCCESS_TC_007 to operate");
            captureSession.beginConfig(async (err, data) => {
				if(!err){
                console.info(TAG + "Entering  beginConfig success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CREATE_BEGIN_CONFIG beginConfig data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CREATE_BEGIN_CONFIG_SUCCESS_TC_007 beginConfig PASSED");
                }
			}else {
				expect().assertFail();
				console.info(TAG + "Entering beginConfig FAILED" + err.message);
				console.info(TAG + "Entering beginConfig ends here");
				}
                await sleep(1000);
                done();
            })

            await sleep(1000);
            done();
        }
    })

	/**
      * @tc.number    : ADD_INPUT_SUCCESS_008
      * @tc.name      : Add Input with camera0Input api
      * @tc.desc      : Add Input with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
	it('ADD_INPUT_SUCCESS_008', 0, async function (done) {
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 to operate");
            captureSession.addInput(camera0Input, async (err, data) => {
				if(!err){
					console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 addInput success");
					if (data != null || data != undefined) {
						console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 addInput data is not null || undefined");
						expect(true).assertTrue();
						console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 addInput PASSED");
					}
				}else {
				expect().assertFail();
				console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 FAILED: " + err.message);
				console.info(TAG + "Entering ADD_INPUT_SUCCESS_008 ends here");
				}
				await sleep(1000);
				done();
            })
			await sleep(1000);
			done();
        }
    })

	/**
      * @tc.number    : ADD_OUTPUT_PREVIEW_SUCCESS_009
      * @tc.name      : Add output with camera0Input api
      * @tc.desc      : Add output with camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
	it('ADD_OUTPUT_PREVIEW_SUCCESS_009', 0, async function (done) {
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 to operate");
            captureSession.addOutput(previewOutputAsync, async (err, data) => {
				if(!err){
                console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 : Success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 PASSED");
                }
			} else {
                expect().assertFail();
                console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 FAILED" + err.message);
                console.info(TAG + "Entering ADD_OUTPUT_PREVIEW_SUCCESS_009 ends here");
                }
            await sleep(1000);
            done();
            })
        }
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
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 to operate");
            captureSession.addOutput(photoOutputAsync, async (err, data) => {
                if (!err) {
                    console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010  success");
                    if (data != null || data != undefined) {
                        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 data is not null || undefined");
                        expect(true).assertTrue();
                        console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 PASSED");
                    }
                } else {
					expect().assertFail();
                    console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 FAILED: " + err.message);
                }
                console.info(TAG + "Entering ADD_OUTPUT_PHOTO_SUCCESS_010 ends here");
                await sleep(1000);
                done();
            })
            await sleep(1000);
            done();
        }
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
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 to operate");
            captureSession.commitConfig(async (err, data) => {
				if(!err){
                console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig PASSED");
                }
			} else {
				expect().assertFail();
				console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig FAILED" + err.message);
                console.info(TAG + "Entering COMMIT_CONFIG_SUCCESS_011 commitConfig ends here");
			}
                await sleep(1000);
                done();
            })
            await sleep(1000);
            done();
        }
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
        if (previewOutputAsync == null || previewOutputAsync == undefined) {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_012 previewOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_012 to operate");
            previewOutputAsync.on("frameStart", async (err, data) => {
                if (!err) {
                    console.info(TAG + "PreviewStart frameStart Callback is success");
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
        if (previewOutputAsync == null || previewOutputAsync == undefined) {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_013 previewOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_013 to operate");
            previewOutputAsync.on("frameEnd", async (err, data) => {
                if (!err) {
                    console.info(TAG + "PreviewStop frameEnd Callback is success");
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
        if (previewOutputAsync == null || previewOutputAsync == undefined) {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR_014 previewOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_ERROR_014 to operate");
            previewOutputAsync.on("error", async (err, data) => {
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
        if (photoOutputAsync == null || photoOutputAsync == undefined) {
            console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_START_015 photoOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_START_015 to operate");
            photoOutputAsync.on("captureStart", async (err, data) => {
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
        if (photoOutputAsync == null || photoOutputAsync == undefined) {
            console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END_016 photoOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_CAPTURE_END_016 to operate");
            photoOutputAsync.on("captureEnd", async (err, data) => {
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
        if (photoOutputAsync == null || photoOutputAsync == undefined) {
            console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_017 photoOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PHOTO_CAP_CALLBACK_ON_FRAME_SHUTTER_017 to operate");
            photoOutputAsync.on("frameShutter", async (err, data) => {
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
        if (photoOutputAsync == null || photoOutputAsync == undefined) {
            console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR_018 photoOutput == null || undefined");
        } else {
            console.info(TAG + "Entering PHOTO_OUTPUT_CALLBACK_ON_ERROR_018 to operate");
            photoOutputAsync.on("error", async (err, data) => {
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
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering CAP_SES_CALLBACK_ON_ERROR_019 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering CAP_SES_CALLBACK_ON_ERROR_019 to operate");
            captureSession.on("error", async (err, data) => {
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
//	it('FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020', 0, async function (done) {
//        if (camera0Input == null || camera0Input == undefined) {
//            console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020 previewOutput == null || undefined");
//        } else {
//            console.info(TAG + "Entering FOCUSSTATECHANGE_CALLBACK_ON_CAMERAINPUT0_020 to operate");
//            camera0Input.on("focusStateChange", async (err, data) => {
//                if (!err) {
//                    console.info(TAG + "FocusState callback is success");
//                    if (data != null || data != undefined) {
//                        console.info(TAG + "Current FocusState is: " + data);
//                        expect(true).assertTrue();
//                    }
//                } else {
//					expect().assertFail();
//                }
//                await sleep(1000);
//                done();
//            })
//            await sleep(1000);
//            done();
//        }
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
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 to operate");
            captureSession.start(async (err, data) => {
                console.info(TAG + "Entering captureSession.start success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 PASSED");
                }
                console.info(TAG + "Entering CAPTURE_SESSION_START_SUCCESS_021 ends here");
                await sleep(1000);
                done();
            })
            await sleep(1000);
            done();
        }
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
      camera0Input.hasFlash(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering HAS_FLASH success");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering HAS_FLASH data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering HAS_FLASH PASSED with HAS_FLASH is: " +data);
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering HAS_FLASH FAILED" + err.message);
        }
        console.info(TAG + "Entering HAS_FLASH_TC_022 ends here");
      })
      await sleep(1000);
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
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED_023 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED data is not null || undefined");
            console.info(TAG + "FLASH_MODE_OPEN supported is: " +data);
			expect(true).assertTrue();
            console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED FAILED" + err.message);
          console.info(TAG + "Entering IS_FLASH_MODE_OPEN_SUPPORTED ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_OPEN);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 PASSED")
            expect(true).assertTrue()
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 FAILED" + err.message);
          console.info(TAG + "Entering SET_FLASH_MODE_OPEN_024 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_OPEN success");
          if (data == 1) {
            console.info(TAG + "GET_FLASH_MODE_OPEN data is not null || undefined: ");
            console.info(TAG + "Current FlashMode is: " +data);
			expect(true).assertTrue();
            console.info(TAG + "GET_FLASH_MODE_OPEN_025 PASSED");

          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_OPEN_025 FAILED" + err.message);
          console.info(TAG + "GET_FLASH_MODE_OPEN_025 ends here");
        }
        await sleep(1000);
        done();

      })
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
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering FLASH_MODE_ALWAYS_OPEN SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "FLASH_MODE_ALWAYS_OPEN supported is: " +data);
            console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 FAILED" + err.message);
          console.info(TAG + "Entering IS_FLASH_MODE_ALWAYS_OPEN_SUPPORTED_026 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 PASSED")
            expect(true).assertTrue()
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 FAILED" + err.message);
          console.info(TAG + "Entering SET_FLASH_MODE_ALWAYS_OPEN_027 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_ALWAYS_OPEN success");
          if (data == 3) {
            console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN data is not null || undefined: ");
            expect(true).assertTrue();
            console.info(TAG + "Current FlashMode is: " +data);
            console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 FAILED" + err.message);
          console.info(TAG + "GET_FLASH_MODE_ALWAYS_OPEN_028 ends here");
        }
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })
	
	/**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_029
      * @tc.name      : Photo output capture without photosettings api
      * @tc.desc      : Photo output capture without photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_029', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_029 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITHOUT_PHOTOSETTINGS_029 to operate");
        photoOutputAsync.capture(async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture without photosettings success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture without photosettings data is not null || undefined");
              console.info(TAG + "Entering photoOutput capture without  photosettings PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering photoOutput capture without photosettings FAILED" + err.message);
            console.info(TAG + "Entering photoOutput capture without photosettings ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
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
      camera0Input.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED_030 SUCCESS ");
          if (data != null || data != undefined) {
            console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "FLASH_MODE_CLOSE supported is: " +data);
            console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED PASSED");
          }
        } else {
          console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED FAILED" + err.message);
          console.info(TAG + "Entering IS_FLASH_MODE_CLOSE_SUPPORTED ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 SUCCESS, current flashmode is: " + cameraObj.FlashMode.FLASH_MODE_CLOSE);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 PASSED")
            expect(true).assertTrue()
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 FAILED" + err.message);
          console.info(TAG + "Entering SET_FLASH_MODE_CLOSE_031 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.getFlashMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FLASH_MODE_CLOSE_032 success");
          if (data == 0) {
            console.info(TAG + "GET_FLASH_MODE_CLOSE data is not null || undefined: ");
			console.info(TAG + "Current FlashMode is: " +data);
            expect(true).assertTrue();
            console.info(TAG + "GET_FLASH_MODE_CLOSE_032 PASSED");
          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FLASH_MODE_CLOSE_032 FAILED" + err.message);
          console.info(TAG + "GET_FLASH_MODE_CLOSE_032 ends here");
        }
        await sleep(1000)
        done();

      })
      await sleep(1000)
      done()
    })

	// FOCUS API's
	
	/**
      * @tc.number    : IS_FOCUS_MODE_MANUAL_SUPPORTED_033
      * @tc.name      : check if focus mode manual is supported-camera0Input api
      * @tc.desc      : check if focus mode manual is supported-camera0Input api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
	it('IS_FOCUS_MODE_MANUAL_SUPPORTED_033', 0, async function (done) {
	console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 to operate");
	camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
		if (!err) {
			console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 SUCCESS " );
				if (data != null || data != undefined) {
					console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 data is not null || undefined");
					console.info(TAG + "FOCUS_MODE_MANUAL_SUPPORTED is: " +data );
					expect(true).assertTrue();
					console.info(TAG + "Entering IS_FOCUS_MODE_MANUAL_SUPPORTED_033 PASSED: ");
				}
			} else {
				console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED_033 FAILED" + err.message);
				expect().assertFail();
				console.info(TAG + "IS_FOCUS_MODE_MANUAL_SUPPORTED_033 ends here");
			}
			await sleep(1000);
			done();
		})
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
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          if (data != null || data != undefined) {
            console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 PASSED")
            expect(true).assertTrue()
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 FAILED" + err.message);
          console.info(TAG + "Entering SET_FOCUS_MODE_MANUAL_034 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FOCUS_MODE_MANUAL_035 SUCCESS");
      if (data == 0) {
            console.info(TAG + "GET_FOCUS_MODE_MANUAL data is not null || undefined: ");
			console.info(TAG + "Current FocusMode is: " +data);
            expect(true).assertTrue();
            console.info(TAG + "GET_FOCUS_MODE_MANUAL_035 PASSED");

          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_MANUAL_035 FAILED" + err.message);
          console.info(TAG + "GET_FOCUS_MODE_MANUAL_035 ends here");
        }
        await sleep(1000);
        done();

      })
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
	camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
		if (!err) {
			console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 SUCCESS " );
				if (data != null || data != undefined) {
					console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 data is not null || undefined");
					console.info(TAG + "FOCUS_MODE_CONTINOUS_SUPPORTED is: " +data );
					expect(true).assertTrue();
					console.info(TAG + "Entering IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 PASSED: ");
				}
			} else {
				console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 FAILED" + err.message);
				expect().assertFail();
				console.info(TAG + "IS_FOCUS_MODE_CONTINUOUS_SUPPORTED_036 ends here");
			}
			await sleep(1000);
			done();
		})
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
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          if (data != null || data != undefined) {
            expect(true).assertTrue()
			console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 PASSED")
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 FAILED" + err.message);
          console.info(TAG + "Entering SET_FOCUS_MODE_CONTINUOUS_037 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FOCUS_MODE_CONTINUOUS_038 SUCCESS");
      if (data == 1) {
            console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS data is not null || undefined: ");
			console.info(TAG + "Current FocusMode is: " +data);
            expect(true).assertTrue();
            console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS_038 PASSED");

          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS_038 FAILED" + err.message);
          console.info(TAG + "GET_FOCUS_MODE_CONTINUOUS_038 ends here");
        }
        await sleep(1000);
        done();

      })
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
	camera0Input.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
		if (!err) {
			console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_039 SUCCESS " );
				if (data != null || data != undefined) {
					console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_039 data is not null || undefined");
					console.info(TAG + "FOCUS_MODE_AUTO_SUPPORTED is: " + data );
					expect(true).assertTrue();
					console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_039 PASSED: ");
				}
			} else {
				console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED_039 FAILED" + err.message);
				expect().assertFail();
				console.info(TAG + "IS_FOCUS_MODE_AUTO_SUPPORTED_039 ends here");
			}
			await sleep(1000);
			done();
		})
		await sleep(1000);
		done();
	})
	
	/**
      * @tc.number    : IS_FOCUS_MODE_AUTO_SUPPORTED_040
      * @tc.name      : set focus mode auto camera0 api
      * @tc.desc      : set focus mode auto camera0 api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
	
	it('IS_FOCUS_MODE_AUTO_SUPPORTED_040', 0, async function (done) {
      console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_040 to operate");
      camera0Input.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO, async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_040 SUCCESS, current FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);
          if (data != null || data != undefined) {
            expect(true).assertTrue()
			console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_040 PASSED")
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_040 FAILED" + err.message);
          console.info(TAG + "Entering IS_FOCUS_MODE_AUTO_SUPPORTED_040 ends here");
        }
        await sleep(1000);
        done();
      })

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
      camera0Input.getFocusMode(async (err, data) => {
        if (!err) {
          console.info(TAG + "Entering GET_FOCUS_MODE_AUTO_041 SUCCESS");
      if (data == 2) {
            console.info(TAG + "GET_FOCUS_MODE_AUTO data is not null || undefined: ");
			console.info(TAG + "Current FocusMode is: " +data);
            expect(true).assertTrue();
            console.info(TAG + "GET_FOCUS_MODE_AUTO_041 PASSED");

          }
        }
        else {
          expect().assertFail();
          console.info(TAG + "GET_FOCUS_MODE_AUTO_041 FAILED" + err.message);
          console.info(TAG + "GET_FOCUS_MODE_AUTO_041 ends here");
        }
        await sleep(1000);
        done();

      })
      await sleep(1000);
      done();
    })
	
	/**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042 Rotation-0 & Quality-0
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_042 to operate");
        photoOutputAsync.capture(photosettings1, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings1 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings1 data is not null || undefined");
              console.info(TAG + "Entering photoOutput capture with  photosettings1 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering photoOutput capture with photosettings1 FAILED" + err.message);
            console.info(TAG + "Entering photoOutput capture with photosettings1 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043 with Rotation-90 & Quality-1
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_043 to operate");
        photoOutputAsync.capture(photosettings2, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings2 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings2 data is not null || undefined");
              console.info(TAG + "Entering photoOutput capture with  photosettings2 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering photoOutput capture with photosettings2 FAILED" + err.message);
            console.info(TAG + "Entering photoOutput capture with photosettings2 ends here");
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
      }
    })

    /**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044 with Rotation-180 & Quality-2
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_044 to operate");
        photoOutputAsync.capture(photosettings3, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings3 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings3 data is not null || undefined");
              console.info(TAG + "Entering photoOutput capture with  photosettings3 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering photoOutput capture with photosettings3 FAILED" + err.message);
            console.info(TAG + "Entering photoOutput capture with photosettings3 ends here");
          }
        })
        await sleep(1000);
        done();
      }
    })


//ZOOM Function

    /**
      * @tc.number    : GET_ZOOM_RATIO_TC_045
      * @tc.name      : get zoom ratio camera-0 cameraId api
      * @tc.desc      : get zoom ratio camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('GET_ZOOM_RATIO_TC_045', 0, async function (done) {
      console.info("--------------GET_ZOOM_RATIO_TC_045--------------");
      camera0Input.getZoomRatioRange(async (err,data) => {
        if (!err) {
          if (data != null && data != undefined) {
            console.info(TAG + "Entering GET_ZOOM_RATIO_TC_045 data is not null || undefined");
            expect(true).assertTrue();
            console.info(TAG + "Entering GET_ZOOM_RATIO_TC_045 Success "  +data)
          }
        } else {
          expect().assertFail();
          console.info(TAG + "Entering GET_ZOOM_RATIO_TC_045 FAILED: " + err.message);
        }
        console.info(TAG + "Entering GET_ZOOM_RATIO_TC_045 ends here");
        await sleep(1000);
        done();
      })
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SET_GET_ZOOM_1_ASYNC_TC_046
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_1_ASYNC_TC_046', 0, async function (done) {
      camera0Input.setZoomRatio(1, (err,data)=>{
        if(!err){
          console.info(TAG + "setZoomRatio success: 1");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err,data1) => {
            if(!err){
              console.info(TAG + "getZoomRatio success : "+data1);
              expect(data1).assertEqual(1);
              console.info(TAG + "SET_GET_ZOOM_1_ASYNC_TC_046 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_1_ASYNC_TC_046 FAILED" + err.message);
            }
          })
        }
      })
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SET_GET_ZOOM_2_ASYNC_TC_047
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_2_ASYNC_TC_047', 0, async function (done) {
      camera0Input.setZoomRatio(2, (err,data)=>{
        if(!err){
          console.info(TAG + "setZoomRatio success: 2");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err,data1) => {
            if(!err){
              console.info(TAG + "getZoomRatio success : "+data1);
              expect(data1).assertEqual(2);
              console.info(TAG + "SET_GET_ZOOM_2_ASYNC_TC_047 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_2_ASYNC_TC_047 FAILED" + err.message);
            }
          })
        }
      })
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SET_GET_ZOOM_3_ASYNC_TC_048
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_3_ASYNC_TC_048', 0, async function (done) {
      camera0Input.setZoomRatio(3, (err,data)=>{
        if(!err){
          console.info(TAG + "setZoomRatio success: 3");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err,data1) => {
            if(!err){
              console.info(TAG + "getZoomRatio success : "+data1);
              expect(data1).assertEqual(3);
              console.info(TAG + "SET_GET_ZOOM_3_ASYNC_TC_048 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_3_ASYNC_TC_048 FAILED" + err.message);
            }
          })
        }
      })
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SET_GET_ZOOM_4_ASYNC_TC_049
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_4_ASYNC_TC_049', 0, async function (done) {
      camera0Input.setZoomRatio(4, (err,data)=>{
        if(!err){
          console.info(TAG + "setZoomRatio success: 4");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err,data1) => {
            if(!err){
              console.info(TAG + "getZoomRatio success : "+data1);
              expect(data1).assertEqual(4);
              console.info(TAG + "SET_GET_ZOOM_4_ASYNC_TC_049 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_4_ASYNC_TC_049 FAILED" + err.message);
            }
          })
        }
      })
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SET_GET_ZOOM_5_ASYNC_TC_050
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_5_ASYNC_TC_050', 0, async function (done) {
      camera0Input.setZoomRatio(5, (err,data)=>{
        if(!err){
          console.info(TAG + "setZoomRatio success: 5");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err,data1) => {
            if(!err){
              console.info(TAG + "getZoomRatio success : "+data1);
              expect(data1).assertEqual(5);
              console.info(TAG + "SET_GET_ZOOM_5_ASYNC_TC_050 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_5_ASYNC_TC_050 FAILED" + err.message);
            }
          })
        }
      })
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SET_GET_ZOOM_6_ASYNC_TC_051
      * @tc.name      : Zoom camera-0 cameraId api
      * @tc.desc      : Zoom camera-0 cameraId api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('SET_GET_ZOOM_6_ASYNC_TC_051', 0, async function (done) {
      camera0Input.setZoomRatio(6, (err,data)=>{
        if(!err){
          console.info(TAG + "setZoomRatio success: 6");
          console.info(TAG + "getZoomRatio called")
          camera0Input.getZoomRatio((err,data1) => {
            if(!err){
              console.info(TAG + "getZoomRatio success : "+data1);
              expect(data1).assertEqual(6);
              console.info(TAG + "SET_GET_ZOOM_6_ASYNC_TC_051 PASSED ");
            }
            else {
              expect().assertFail();
              console.info(TAG + "SET_GET_ZOOM_6_ASYNC_TC_051 FAILED" + err.message);
            }
          })
        }
      })
      await sleep(1000);
      done();
    })

/**
      * @tc.number    : PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 with Rotation-270
      * @tc.name      : Photo output capture with photosettings api
      * @tc.desc      : Photo output capture with photosettings api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052', 0, async function (done) {
      if (photoOutputAsync == null || photoOutputAsync == undefined) {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 photoOutput == null || undefined");
      } else {
        console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 to operate");
        photoOutputAsync.capture(photosettings4, async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering photoOutput capture with photosettings4 success");
            if (data != null || data != undefined) {
              console.info(TAG + "Entering photoOutput capture with photosettings4 data is not null || undefined");
              console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 PASSED");
            }
          } else {
            expect().assertFail();
            console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 FAILED" + err.message);
            console.info(TAG + "Entering PHOTOOUTPUT_CAPTURE_WITH_PHOTOSETTINGS_052 ends here");
          }
        })
        await sleep(1000);
        done();
      }
    })

	
	
	
	/*CaptureSession APIs test script*/
	/**
      * @tc.number    : CAPTURE_SESSION_STOP_SUCCESS_053
      * @tc.name      : capture session stop api
      * @tc.desc      : capture session stop api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
    it('CAPTURE_SESSION_STOP_SUCCESS_053', 0, async function (done) {
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_053 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_053 to operate");
            captureSession.stop(async (err, data) => {
				if(!err){
                console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_053 captureSession.stop success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering  captureSession.stop data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering CAPTURE_SESSION_STOP_SUCCESS_053 captureSession.stop PASSED");
                }
			} else {
				expect().assertFail();
				console.info(TAG + "Entering captureSession.stop FAILED" + err.message);
                console.info(TAG + "Entering captureSession.stop ends here");
			}
			await sleep(1000);
			done();
            })
            await sleep(1000);
            done();
        }
    })

	/**
      * @tc.number    : CAPTURE_SESSION_RELEASE_SUCCESS_054
      * @tc.name      : capture session release api
      * @tc.desc      : capture session release api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
	*/
	it('CAPTURE_SESSION_RELEASE_SUCCESS_054', 0, async function (done) {
        if (captureSession == null || captureSession == undefined) {
            console.info(TAG + "Entering CAPTURE_SESSION_RELEASE_SUCCESS_054 captureSession == null || undefined");
        } else {
            console.info(TAG + "Entering CAPTURE_SESSION_RELEASE_SUCCESS_054 to operate");
            captureSession.release(async (err, data) => {
				if(!err){
                console.info(TAG + "Entering captureSession.release success");
                if (data != null || data != undefined) {
                    console.info(TAG + "Entering captureSession.release data is not null || undefined");
                    expect(true).assertTrue();
                    console.info(TAG + "Entering captureSession.release PASSED");
                }
			} else {
				expect().assertFail();
                console.info(TAG + "Entering CAPTURE_SESSION_RELEASE_SUCCESS_054 FAILED: " + err.message);
                console.info(TAG + "Entering  captureSession.release ends here");
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