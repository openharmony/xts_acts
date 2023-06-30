/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import * as mediaTestBase from './MediaTestBase.js';
import * as AVRecorderTestBase from './AVRecorderTestBase.js';
import camera from '@ohos.multimedia.camera'

let TAG = "[avVideoRecorderTest] ";
let cameraManager;
let videoOutput;
let captureSession;
let cameraInput;
let previewOutput;
let cameraOutputCap;
let videoSurfaceId = null;

let events = require('events');
let eventEmitter = new events.EventEmitter();

export const AV_RECORDER_STATE = {
    IDLE : 'idle',
    PREPARED : 'prepared',
    STARTED : 'started',
    PAUSED : 'paused',
    STOPPED : 'stopped',
    RELEASED : 'released',
    ERROR : 'error',
}

export function resourceName(){
    let timestamp = Date.now();
    let filename = `avRecorder_${timestamp}.mp4`;
    return filename;
}

export async function initCamera() {

    // 创建CameraManager对象
    let context = globalThis.contextVideo;
    cameraManager = camera.getCameraManager(context)
    if (!cameraManager) {
        console.error("camera.getCameraManager error")
        return;
    }
    cameraManager.on('cameraStatus', (cameraStatusInfo) => {
        console.log(`camera : ${cameraStatusInfo.camera.cameraId}`);
        console.log(`status: ${cameraStatusInfo.status}`);
    })

    // 获取相机列表
    let cameras = cameraManager.getSupportedCameras();
    let cameraDevice = cameras[0];

    // 查询相机设备在模式下支持的输出能力
    let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice);
    console.info('getSupportedOutputCapability success');
    console.log(`cameraOutputCapability previewProfiles: ${cameraOutputCapability.previewProfiles}`);
    console.log(`cameraOutputCapability photoProfiles: ${cameraOutputCapability.photoProfiles}`);
    console.log(`cameraOutputCapability videoProfiles: ${cameraOutputCapability.videoProfiles}`);

    // 创建相机输入流
    try {
        cameraInput = cameraManager.createCameraInput(cameraDevice);
        console.info('createCameraInput success');
    } catch (error) {
        console.error('Failed to createCameraInput errorCode = ' + error.code);
    }

    // 监听cameraInput错误信息
    cameraInput.on('error', cameraDevice, (error) => {
        console.log(`Camera input error code: ${error.code}`);
    })

    // 创建VideoOutput对象
    let profile = cameraOutputCapability.videoProfiles[0];
    try {
        videoOutput = cameraManager.createVideoOutput(profile, videoSurfaceId)
        console.info('createVideoOutput success');
    } catch (error) {
        console.error('Failed to create the videoOutput instance. errorCode = ' + error.code);
    }
    // 监听视频输出错误信息
    videoOutput.on('error', (error) => {
        console.log(`Preview output error code: ${error.code}`);
    })

    // 创建previewOutput输出对象
    let surfaceId = globalThis.value;
    let previewProfile = cameraOutputCapability.previewProfiles[0];
    try {
        previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceId)
        console.info('createPreviewOutput success');
    } catch (error) {
        console.error('Failed to create the PreviewOutput instance errorCode = ' + error.code);
    }

    // 打开相机
    await cameraInput.open();

    //创建会话
    try {
        captureSession = cameraManager.createCaptureSession()
        console.info('createCaptureSession success');
    } catch (error) {
        console.error('Failed to create the CaptureSession instance. errorCode = ' + error.code);
    }

    // 监听session错误信息
    captureSession.on('error', (error) => {
        console.log(`Capture session error code: ${error.code}`);
    })

    // 开始配置会话
    try {
        captureSession.beginConfig()
        console.info('beginConfig success');
    } catch (error) {
        console.error('Failed to beginConfig. errorCode = ' + error.code);
    }

    // 向会话中添加相机输入流
    try {
        captureSession.addInput(cameraInput)
    } catch (error) {
        console.error('Failed to addInput. errorCode = ' + error.code);
    }

    // 向会话中添加预览输入流
    try {
        captureSession.addOutput(previewOutput)
    } catch (error) {
        console.error('Failed to addOutput(previewOutput). errorCode = ' + error.code);
    }

    // 向会话中添加录像输出流
    try {
        captureSession.addOutput(videoOutput)
    } catch (error) {
        console.error('Failed to addOutput(videoOutput). errorCode = ' + error.code);
    }

    // 提交会话配置
    await captureSession.commitConfig()

    // 启动会话
    await captureSession.start().then(() => {
        console.log('Promise returned to indicate the session start success.');
    })
}