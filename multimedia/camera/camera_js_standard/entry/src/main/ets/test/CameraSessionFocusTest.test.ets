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
 
// @ts-ignore

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import deviceInfo from '@ohos.deviceInfo';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';

const TAG = "CameraModuleTest: ";

// Define global letiables
let mCameraManager;
let mCameraDevicesArray;
let mCameraSession;

let mPhotoSurface;
let mVideoRecorder;
let mVideoSurface;
let mFileAsset;
let mFdPath;
let mFdNumber;

// CAMERA-0 letiables
let mCameraNum;

let mCameraInput;
let mPreviewOutput;
let mPhotoOutput;
let mVideoOutput;

let mIsFocusModeSupportedArray;

let mVideoProfileCfg = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: 'audio/mp4a-latm',
    audioSampleRate: 48000,
    durationTime: 1000,
    fileFormat: 'mp4',
    videoBitrate: 2000000,
    videoCodec: 'video/mp4v-es',
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
}

let mVideoConfig = {
    audioSourceType: 1,
    videoSourceType: 0,
    profile: mVideoProfileCfg,
    url: 'file:///data/media/CameraSessionFocus.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 1;
let mPicHeightMax = 1;

let mFocusPoint = {
    x: mPicWidthMax / 2.0,
    y: mPicHeightMax / 2.0,
}

let mFocusPointLT = {
    x: 0,
    y: 0,
}

let mFocusPointRT = {
    x: mPicWidthMax ,
    y: 0,
}

let mFocusPointLB = {
    x: 0,
    y: mPicHeightMax,
}

let mFocusPointRB = {
    x: mPicWidthMax,
    y: mPicHeightMax,
}

let mFocusPointInvalidLT = {
    x: -1,
    y: -1,
}

let mFocusPointInvalidRT = {
    x: (mPicWidthMax + 1),
    y: -1,
}

let mFocusPointInvalidLB = {
    x: -1,
    y: (mPicHeightMax + 1),
}

let mFocusPointInvalidRB = {
    x: (mPicWidthMax + 1),
    y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidFocusPoint = false;
let receiver;

export default function cameraSessionFocusTest() {

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
            mFileAsset = await fetchFileResult.getAllObject();
            mFdNumber = await mFileAsset[0].open('Rw');
            mFdPath = "fd://" + mFdNumber.toString();
        }
    }
    
    async function closeFd() {
        if (mFileAsset != null) {
                await mFileAsset[0].close(mFdNumber).then(() => {
                console.info('[mediaLibrary] case close fd success');
            }).catch((err) => {
                console.info('[mediaLibrary] case close fd failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAsset is null');
        }
    }

    async function getPhotoReceiverSurface() {
        console.log(TAG + 'Entering getPhotoReceiverSurface')
        receiver = image.createImageReceiver(640, 480, 4, 8)
        console.log(TAG + 'before receiver check')
        if (receiver !== undefined) {
            console.log(TAG + 'Photo receiver is created successfully')
            mPhotoSurface = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
        } else {
            console.log(TAG + 'Photo receiver is created failed')
        }
        console.log(TAG + 'Exit getPhotoReceiverSurface')
    }

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraSessionFocus.mp4');
        mVideoConfig.url = mFdPath;
        media.createAVRecorder((err, recorder) => {
            if (!err) {
                console.info(TAG + 'Entering create video receiver')
                mVideoRecorder = recorder
                console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
                console.info(TAG + 'videoRecorder.prepare called.')
                mVideoRecorder.prepare(mVideoConfig, (err) => {
                    if (!err) {
                        console.info(TAG + 'videoRecorder.prepare success.')
                        mVideoRecorder.getInputSurface((err, id) => {
                            console.info(TAG + 'getInputSurface called')
                            if (!err) {
                                mVideoSurface = id
                                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface))
                            } else {
                                console.info(TAG + 'getInputSurface FAILED')
                            }
                        })
                    } else {
                        console.info(TAG + 'prepare FAILED')
                    }
                })
            } else {
                console.info(TAG + 'createVideoRecorder FAILED')
            }
        })
        console.log(TAG + 'Exit getVideoReceiveSurface')
    }

    async function releaseVideoReceiveSurface() {
        console.log(TAG + 'Entering releaseVideoReceiveSurface')
        mVideoRecorder.release((err) => {
            console.info(TAG + 'Entering release video receiver')
        })
        await closeFd();

        await sleep(100);
        console.log(TAG + 'Exit releaseVideoReceiveSurface')
    }

    function getCameraManagerInstance() {
        console.info('Enter getCameraManagerInstance');

        mCameraManager = cameraObj.getCameraManager(null);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }

        console.info('Exit getCameraManagerInstance');

        return true;
    }

    function getCameraSupportDevicesArray() {
        console.info('Enter getCameraSupportDevicesArray');
        
        mCameraDevicesArray = mCameraManager.getSupportedCameras();

        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "getSupportedCameras FAILED");
            return false;
        }


        mCameraNum = mCameraDevicesArray.length;

        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

        mIsFocusModeSupportedArray = new Array(mCameraNum);

        console.info('Exit getCameraSupportDevicesArray');

        return true;
    }

    function createCameraSessionInstance() {
        console.info('Enter createCameraSessionInstance');

        try {
            mCameraSession = mCameraManager.createCaptureSession();
        }
        catch {
            console.info('createCaptureSession FAILED');
        }

        if (isEmpty(mCameraSession)) {
            console.info(TAG + "createCaptureSession FAILED");
            return false;
        }

        mCameraSession.beginConfig();

        console.info('Exit createCameraSessionInstance');

        return true;
    }

    async function releaseCameraSessionInstance() {
        await mCameraSession.release();
    }

    async function createInput(idx:any) {
        console.info('Enter createInput');

        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "Entering createInputs FAILED with NoCamera");
            return false;
        }

        mCameraInput = await mCameraManager.createCameraInput(mCameraDevicesArray[idx]);

        if (isEmpty(mCameraInput)) {
            console.info(TAG + "createCameraInput FAILED");
            return false;
        }

        await mCameraInput.open();

        await sleep(100);

        console.info(idx + 'th CameraInput is: ' + mCameraInput);

        console.info('Exit createInput');

        return true;
    }

    async function releaseInput() {
        console.info('Enter releaseInput');

        if (!isEmpty(mCameraInput)) {
            await mCameraInput.close();
        }

        console.info('Exit releaseInput');

        return true;
    }

    function createOutput(idx:any) {
        console.info('Enter createOutput');

        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

        if (!isEmpty(cameraOutputCap)) {
            if (!isEmpty(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);      
                for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                    mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], globalThis.surfaceId);
                    if (!isEmpty(mPreviewOutput)) {
                        break;
                    }
                }
    
                if (isEmpty(mPreviewOutput)) {
                    console.info(TAG + "createPreviewOutput FAILED");
                }
    
                console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
            }
    
            if (!isEmpty(cameraOutputCap.photoProfiles)) {
                console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);   
                    
                for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
                    mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
                    if (!isEmpty(mPhotoOutput)) {
                        break;
                    }
                }
    
                if (isEmpty(mPhotoOutput)) {
                        console.info(TAG + "createPhotoOutput FAILED");
                }
    
                console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
            }
            /*
            if (!isEmpty(cameraOutputCap.videoProfiles)) {
                console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length); 
                for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
                    try {
                        mVideoOutput = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
                        if (!isEmpty(mVideoOutput)) {
                            break;
                        }
                    }
                    catch {
                        console.info(TAG + "createVideoOutput FAILED");
                    }
                }
    
                if (isEmpty(mVideoOutput)) {
                    console.info(TAG + "createVideoOutput FAILED");
                }
    
                console.info(TAG + "createVideoOutput: " + mVideoOutput);  
            }
            */
        }
        
        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');

        if (!isEmpty(mPreviewOutput)) {
            await mPreviewOutput.release();
        }
        
        if (!isEmpty(mPhotoOutput)) {
            await mPhotoOutput.release();
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            await mVideoOutput.stop();
            await mVideoOutput.release();
        }
        */
        console.info('Exit releaseOutput');
        
        return true;
    }

    async function startCameraSession(idx:any) {
        console.info(TAG + "Enter startCameraSession");

        await createInput(idx);
        createOutput(idx);

        await sleep(1);

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to addInput");
            mCameraSession.addInput(mCameraInput);
        }
        
        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            mCameraSession.addOutput(mPreviewOutput);
        }
        
        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to addOutput mPhotoOutput");
            mCameraSession.addOutput(mPhotoOutput);
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            await mCameraSession.addOutput(mVideoOutput);
        }
        */
        await sleep(1);

        await mCameraSession.commitConfig();
        
        /*
        await mCameraSession.start(async (err) => {
            console.info(TAG + "Entering mCameraSession start callback");
            if (!err) {
                console.info(TAG + "Entering mCameraSession start PASSED ");
            } else {
                console.info(TAG + "Entering mCameraSession start FAILED : " + err.message);
            }
        })
        
        await sleep(100);
        */
        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");

        mCameraSession.beginConfig();
        /*
        mCameraSession.stop(async (err) => {
            console.info(TAG + "Entering mCameraSession stop callback");
            if (!err) {
                console.info(TAG + "Entering mCameraSession stop PASSED ");
            } else {
                console.info(TAG + "Entering mCameraSession stop FAILED : " + err.message);
            }
        })

        await sleep(100);
        */

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to removeInput input");
            mCameraSession.removeInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to removeOutput mPreviewOutput");
            mCameraSession.removeOutput(mPreviewOutput);
        }
        
        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to removeOutput mPhotoOutput");
            mCameraSession.removeOutput(mPhotoOutput);
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            await mCameraSession.removeOutput(mVideoOutput);
        }
        */
        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionFocusTest', function () {
        console.info(TAG + '----------cameraSessionFocusTest--------------')

        beforeAll(async function () {
            sleep(100);
            await getPhotoReceiverSurface();
            await getVideoReceiveSurface();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            createCameraSessionInstance();

            console.info('Device type = ' + deviceInfo.deviceType);

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
            releaseVideoReceiveSurface();
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support focus manual mode with promise or not
        * @tc.desc      : Check capture session support focus manual mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100
        * @tc.name      : Check capture session set focus manual mode with promise
        * @tc.desc      : Check capture session set focus manual mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_MANUAL);  

                        let focusMode = mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_MANUAL) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101
        * @tc.name      : Check capture session support focus continuous auto mode with promise or not
        * @tc.desc      : Check capture session support focus continuous auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0101 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101
        * @tc.name      : Check capture session set focus continuous auto mode with promise
        * @tc.desc      : Check capture session set focus continuous auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);

                        let focusMode = mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0101 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102
        * @tc.name      : Check capture session support focus auto mode with promise or not
        * @tc.desc      : Check capture session support focus auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }    
    
                    await sleep(100);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0102 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102
        * @tc.name      : Check capture session set focus auto mode with promise
        * @tc.desc      : Check capture session set focus auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_AUTO);

                        let focusMode = mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0102 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103
        * @tc.name      : Check capture session support focus locked mode with promise or not
        * @tc.desc      : Check capture session support focus locked mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isFocusModeSupported = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 finish");
                    if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 PASSED with isFocusModeSupported is: " + isFocusModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 FAILED with isFocusModeSupported is: " + isFocusModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_0103 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103
        * @tc.name      : Check capture session set focus locked mode with promise
        * @tc.desc      : Check capture session set focus locked mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsFocusModeSupportedArray[i] == true) {
                        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 PASSED with FocusMode is: " + cameraObj.FocusMode.FOCUS_MODE_LOCKED);

                        let focusMode = mCameraSession.getFocusMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 finish");
                        if (focusMode == cameraObj.FocusMode.FOCUS_MODE_LOCKED) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 PASSED with FocusMode is: " + focusMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 FAILED with FocusMode is: " + focusMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_0103 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100
        * @tc.name      : Check capture session set focus point with promise
        * @tc.desc      : Check capture session set focus point with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPoint);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 PASSED with FocusPoint is: " + mFocusPoint.x + ", " + mFocusPoint.y);  

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 finish");
                    if ((focusPoint.x == mFocusPoint.x) && (focusPoint.y == mFocusPoint.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0100 ends here");
                done();
            }
        })  



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101
        * @tc.name      : Check capture session set focus point with promise(left-top point)
        * @tc.desc      : Check capture session set focus point with promise(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 PASSED with FocusPoint is: " + mFocusPointLT.x + ", " + mFocusPointLT.y);  

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 finish");
                    if ((Math.abs(focusPoint.x - mFocusPointLT.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointLT.y) >= 0)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0101 ends here");
                done();
            }
        })  



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102
        * @tc.name      : Check capture session set focus point with promise(right-top point)
        * @tc.desc      : Check capture session set focus point with promise(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 PASSED with FocusPoint is: " + mFocusPointRT.x + ", " + mFocusPointRT.y);

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 finish");
                    if ((Math.abs(focusPoint.x - mFocusPointRT.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointRT.y) >= 0)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0102 ends here");
                done();
            }
        })  



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103
        * @tc.name      : Check capture session set focus point with promise(left-bottom point)
        * @tc.desc      : Check capture session set focus point with promise(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 PASSED with FocusPoint is: " + mFocusPointLB.x + ", " + mFocusPointLB.y);

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 finish");
                    if ((Math.abs(focusPoint.x - mFocusPointLB.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointLB.y) >= 0)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0103 ends here");
                done();
            }
        })  

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104
        * @tc.name      : Check capture session set focus point with promise(right-bottom point)
        * @tc.desc      : Check capture session set focus point with promise(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 PASSED with FocusPoint is: " + mFocusPointRB.x + ", " + mFocusPointRB.y);
                    
                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 finish");
                    if ((focusPoint.x == mFocusPointRB.x) && (focusPoint.y == mFocusPointRB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0104 ends here");
                done();
            }
        })  



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105
        * @tc.name      : Check capture session set focus point with promise(left-top invalid point)
        * @tc.desc      : Check capture session set focus point with promise(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 PASSED with FocusPoint is: " + mFocusPointInvalidLT.x + ", " + mFocusPointInvalidLT.y); 

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 finish");
                    if (((focusPoint.x != mFocusPointInvalidLT.x) && (focusPoint.y != mFocusPointInvalidLT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0105 ends here");
                done();
            }
        })  


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106
        * @tc.name      : Check capture session set focus point with promise(right-top invalid point)
        * @tc.desc      : Check capture session set focus point with promise(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 PASSED with FocusPoint is: " + mFocusPointInvalidRT.x + ", " + mFocusPointInvalidRT.y);  

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 finish");
                    if (((focusPoint.x != mFocusPointInvalidRT.x) && (focusPoint.y != mFocusPointInvalidRT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0106 ends here");
                done();
            }
        })  



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107
        * @tc.name      : Check capture session set focus point with promise(left-bottom invalid point)
        * @tc.desc      : Check capture session set focus point with promise(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 PASSED with FocusPoint is: " + mFocusPointInvalidLB.x + ", " + mFocusPointInvalidLB.y);

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 finish");
                    if (((focusPoint.x != mFocusPointInvalidLB.x) && (focusPoint.y != mFocusPointInvalidLB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0107 ends here");
                done();
            }
        })  

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108
        * @tc.name      : Check capture session set focus point with promise(right-bottom invalid point)
        * @tc.desc      : Check capture session set focus point with promise(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setFocusPoint(mFocusPointInvalidRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 PASSED with FocusPoint is: " + mFocusPointInvalidRB.x + ", " + mFocusPointInvalidRB.y);  

                    let focusPoint = mCameraSession.getFocusPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 finish");
                    if (((focusPoint.x != mFocusPointInvalidRB.x) && (focusPoint.y != mFocusPointInvalidRB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_0108 ends here");
                done();
            }
        })  
        


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100
        * @tc.name      : Check capture session get focal length with promise
        * @tc.desc      : Check capture session get focal length with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let focalLength = mCameraSession.getFocalLength();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 PASSED with FocalLength is: " + focalLength);
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_0100 ends here");
                done(); 
            }
        })


        /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100
      * @tc.name      : camera session focusstatechange api
      * @tc.desc      : camera session focusstatechange api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100', 1, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100--------------");
        if (isEmpty(mCameraSession)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100 mCameraSession == null || undefined")
          expect().assertFail();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100 to operate");
          mCameraSession.on('focusStateChange', async (err, data) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_0100 FAILED: " + err.message);
            }
            await sleep(1000);
            done();
          })
        }
        await sleep(1000);
        done();
      })


      /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100
      * @tc.name      : camera session callback on error
      * @tc.desc      : camera session callback on error
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100', 1, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100--------------");
        if (isEmpty(mCameraSession)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100 previewOutput == null || undefined")
          expect().assertFail();
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100 to operate");
          mCameraSession.on('error', async (err, data) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_0100 FAILED: " + err.message);
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