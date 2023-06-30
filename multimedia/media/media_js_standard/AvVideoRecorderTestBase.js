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

export async function startCameraOutput() {
    console.info('startCameraOutput start')
    await videoOutput.start(async (err) => {
        if (err) {
            console.error(`Failed to start the video output ${err.message}`);
            return;
        }
        console.log('Callback invoked to indicate the video output start success.');
    });
}

export async function stopCameraOutput() {
    await videoOutput.stop((err) => {
        if (err) {
            console.error(`Failed to stop the video output ${err.message}`);
            return;
        }
        console.log('Callback invoked to indicate the video output stop success.');
    });

}

// 释放相机实例
export async function releaseCamera() {
    try{
        await captureSession.stop()
        console.info('releaseCamera 001');
        console.info('captureSession.stop success');
        await cameraInput.close()
        console.info('releaseCamera 002');
        console.info('cameraInput.close success');
        await previewOutput.release()
        console.info('releaseCamera 003');
        console.info('previewOutput.release success');
        await videoOutput.release()
        console.info('releaseCamera 004');
        console.info('videoOutput.release success');
        await captureSession.release()
        console.info('releaseCamera 005');
        console.info('captureSession.release success');
        captureSession = null
        console.info('releaseCamera success');
    } catch(err){
        console.info('releaseCamera failed and catch error is ' + err.message);
    }
}

// release camera and avRecorder
export async function releaseRecorderCallBack(avRecorder, done) {
    await AVRecorderTestBase.releaseCallback(avRecorder)
    await releaseCamera()
    done();
}

export async function releaseRecorderPromise(avRecorder, done) {
    await AVRecorderTestBase.releasePromise(avRecorder)
    await releaseCamera()
    done();
}

export async function releaseRecorderPromiseNotDone(avRecorder) {
    await AVRecorderTestBase.releasePromise(avRecorder)
    await releaseCamera()
}

export async function getInputSurfacePromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    // console.info('getInputSurfacePromise avRecorder.state is: ' + avRecorder.state)
    await avRecorder.getInputSurface().then((surfaceId) => {
        console.info('getInputSurface success');
        videoSurfaceId = surfaceId;
    }).catch((err) => {
        console.info('getInputSurface failed and catch error is ' + err.message);
    });
}

export async function getInputSurfaceCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    await avRecorder.getInputSurface((err, surfaceId) => {
        if (err == null) {
            console.info('getInputSurface success');
            videoSurfaceId = surfaceId;
        } else {
            console.info('getInputSurface failed and error is ' + err.message);
        }
    });
}

export function setAvRecorderCallback(avRecorder, done) {
    // 状态机变化回调函数
    avRecorder.on('stateChange', (state, reason) => {
        console.info(TAG + 'current state is: ' + state);
    })
    // 错误上报回调函数
    avRecorder.on('error', async (err) => {
        try {
            console.error(TAG + 'error ocConstantSourceNode, error message is ' + err);
            await releaseRecorderPromise(avRecorder, done);
        } catch (error) {
            // 处理错误
            console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
        }
    });
}

// 开始录制对应的流程
export async function startRecordingProcessCallback(avRecorder, recorderTime) {
    await startCameraOutput()
    await AVRecorderTestBase.startCallback(avRecorder, recorderTime);
}

export async function startRecordingProcessPromise(avRecorder, recorderTime) {
    await startCameraOutput()
    await AVRecorderTestBase.startPromise(avRecorder, recorderTime);
}

// 暂停录制对应的流程
export async function pauseRecordingProcessCallback(avRecorder) {
    if (avRecorder.state === 'started') {
        // 仅在started状态下调用pause为合理状态切换
        await AVRecorderTestBase.pauseCallback(avRecorder);
        await stopCameraOutput(); // 停止相机出流
    }
}

export async function pauseRecordingProcessPromise(avRecorder) {
    if (avRecorder.state === 'started') {
        // 仅在started状态下调用pause为合理状态切换
        await AVRecorderTestBase.pausePromise(avRecorder);
        await stopCameraOutput(); // 停止相机出流
    }
}

// 恢复录制对应的流程
export async function resumeRecordingProcessCallback(avRecorder) {
    if (avRecorder.state === 'paused') { // 仅在started状态下调用pause为合理状态切换
        await startCameraOutput()
        await AVRecorderTestBase.resumeCallback(avRecorder);
    }
}

export async function resumeRecordingProcessPromise(avRecorder) {
    if (avRecorder.state === 'paused') { // 仅在started状态下调用pause为合理状态切换
        await startCameraOutput()
        await AVRecorderTestBase.resumePromise(avRecorder);
    }
}

// 停止录制对应的流程
export async function stopRecordingProcessCallback(avRecorder) {
    await AVRecorderTestBase.stopCallback(avRecorder);
    await stopCameraOutput()
}

export async function stopRecordingProcessPromise(avRecorder) {
    await AVRecorderTestBase.stopPromise(avRecorder);
    await stopCameraOutput();
}

// 重新录制对应的流程
export async function resetRecordingProcessPromise(avRecorder) {
    await AVRecorderTestBase.resetPromise(avRecorder);
    await stopCameraOutput();
}

// 重新录制对应的流程
export async function resetRecordingProcessCallback(avRecorder) {
    await AVRecorderTestBase.resetCallback(avRecorder);
    await stopCameraOutput();
}

export function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export async function idleCallback(avRecorder) {
    console.info('case idleCallback called');
    media.createAVRecorder((error, recorder) => {
        if (recorder != null) {
            avRecorder = recorder;
            console.info('createAVRecorder idleCallback success');
            return avRecorder;
        } else {
            console.info(`createAVRecorder idleCallback fail, error:${error}`);
        }
    });
}

export async function prepareErrPromise(avRecorder, avConfig) {
    let result = true;
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    await avRecorder.prepare(avConfig).then(() => {
        console.info('prepare success');
    }).catch((err) => {
        result = false;
        expect(result).assertEqual(false);
        console.info('prepare failed and catch error is ' + err.message);
        sleep(1000);
    });
}

export async function avRecorderWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startRecordingProcessPromise(avRecorder, recorderTime)

    await sleep(3000)

    await pauseRecordingProcessPromise(avRecorder)

    await resumeRecordingProcessPromise(avRecorder);

    await stopRecordingProcessPromise(avRecorder)

    await releaseRecorderPromise(avRecorder, done)
}

export async function avRecorderResumePromise1(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startCameraOutput()

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
    }).catch((err) => {
        resumeValue = false
        console.info('avRecorderResumePromise1 resumeValue is ' + resumeValue);
        console.info('resume avRecorderResumePromise1 failed and error is ' + err.message);
        expect(resumeValue).assertEqual(false);
        releaseRecorderPromise(avRecorder, done)
    });
}

export async function avRecorderResumePromise2(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startCameraOutput()

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
    }).catch((err) => {
        resumeValue = false
        console.info('avRecorderResumePromise2 resumeValue is ' + resumeValue);
        console.info('resume avRecorderResumePromise2 failed and error is ' + err.message);
        expect(resumeValue).assertEqual(false);
        releaseRecorderPromise(avRecorder, done)
    });
}

export async function avRecorderResumePromise3(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()
    await startRecordingProcessPromise(avRecorder, recorderTime)

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
        console.info('avRecorderResumePromise3 resumeValue is ' + resumeValue);
        expect(resumeValue).assertEqual(true);
    }).catch((err) => {
        console.info('resume AVRecorder failed and catch error is ' + err.message);
    });

    await releaseRecorderPromise(avRecorder, done)
}

export async function avRecorderResumePromise4(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startRecordingProcessPromise(avRecorder, recorderTime)
    await pauseRecordingProcessPromise(avRecorder)

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
        console.info('avRecorderResumePromise4 resumeValue is ' + resumeValue);
        expect(resumeValue).assertEqual(true);
        startCameraOutput()
    }).catch((err) => {
        console.info('resume AVRecorder failed and catch error is ' + err.message);
    });

    await releaseRecorderPromise(avRecorder, done)
}

export async function avRecorderResumePromise5(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startRecordingProcessPromise(avRecorder, recorderTime)
    await stopRecordingProcessPromise(avRecorder)

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
    }).catch((err) => {
        resumeValue = false
        console.info('resume avRecorderResumePromise5 failed and error is ' + err.message);
        console.error(TAG + 'error avRecorderResumePromise5, error message is ' + err.message);
        console.info('avRecorderResumePromise5 resumeValue is ' + resumeValue);
        expect(resumeValue).assertEqual(false);
    });

    await releaseRecorderPromise(avRecorder, done)
}

export async function avRecorderResumePromise6(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startRecordingProcessPromise(avRecorder, recorderTime)
    await AVRecorderTestBase.resetPromise(avRecorder) ;

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
        console.info('avRecorderResumePromise6 resumeValue is ' + resumeValue);
    }).catch((err) => {
        resumeValue = false
        console.info('resume avRecorderResumePromise6 failed and error is ' + err.message);
        console.error(TAG + 'error avRecorderResumePromise6, error message is ' + err.message);
        expect(resumeValue).assertEqual(false);
    });

    await releaseRecorderPromise(avRecorder, done)
}

export async function avRecorderResumePromise7(avConfig, avRecorder, recorderTime, done) {
    let resumeValue = true
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await avRecorder.resume().then(() => {
        console.info('resume AVRecorder success');
        console.info('avRecorderResumePromise7 resumeValue is ' + resumeValue);
    }).catch((err) => {
        resumeValue = false
        console.info('resume avRecorderResumePromise7 failed and error is ' + err.message);
        console.error(TAG + 'error avRecorderResumePromise7, error message is ' + err.message);
        expect(resumeValue).assertEqual(false);
    });

    await releaseRecorderPromise(avRecorder, done)

}

export async function avRecorderResumePromise8(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startRecordingProcessPromise(avRecorder, recorderTime)
    await pauseRecordingProcessPromise(avRecorder)

    await resumeRecordingProcessCallback(avRecorder)
    await resumeRecordingProcessCallback(avRecorder)
    await resumeRecordingProcessCallback(avRecorder)

    await releaseRecorderPromise(avRecorder, done)
}

export async function avRecorderStopPromise1(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)

    await avRecorder.stop().then(() => {
        console.info('stop avRecorderStopPromise1 success');
    }).catch((err) => {
        console.info('stop avRecorderStopPromise1 error');
        console.info('stop avRecorderStopPromise1 failed and catch error is ' + err.message);
    });
    await AVRecorderTestBase.releaseDone(avRecorder, done)
}

export async function avRecorderStopPromise2(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await avRecorder.stop().then(() => {
        console.info('stop avRecorderStopPromise2 success');
    }).catch((err) => {
        console.info('stop avRecorderStopPromise2 failed and catch error is ' + err.message);
    });
    await AVRecorderTestBase.releaseDone(avRecorder, done)
}

export async function avRecorderStopPromise7(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)

    await avRecorder.stop().then(() => {
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.STOPPED);
        console.info('stop avRecorderStopPromise7 success');
    }).catch((err) => {
        console.info('stop avRecorderStopPromise7 failed and catch error is ' + err.message);
    });

    await AVRecorderTestBase.releaseDone(avRecorder, done)
}

export async function avRecorderResetPromise7(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder)
    await avRecorder.reset().then(() => {
        console.info('reset avRecorderResetPromise7 success');
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.IDLE);
    }).catch((err) => {
        console.info('reset AVRecorder failed and catch error is ' + err.message);
    });
    await AVRecorderTestBase.releaseDone(avRecorder, done)
}

// Promise  prepare
export async function create2PreparePromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function start2PreparePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case start2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await prepareErrPromise(avRecorder, avConfig);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function pause2PreparePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case pause2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await prepareErrPromise(avRecorder, avConfig);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function resume2PreparePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case resume2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await AVRecorderTestBase.resumePromise(avRecorder);
    await prepareErrPromise(avRecorder, avConfig);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function stop2PreparePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case stop2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.stopPromise(avRecorder);
    await prepareErrPromise(avRecorder, avConfig);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function reset2PreparePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case reset2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.resetPromise(avRecorder);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function getInputSurface2PreparePromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case getInputSurface2PreparePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await prepareErrPromise(avRecorder, avConfig);
    await releaseRecorderCallBack(avRecorder, done);
}

export async function prepare3TimesPromise(avConfig, avRecorder, loopTimes, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case prepare3TimesCallback avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    while (loopTimes > 0) {
        await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
        await AVRecorderTestBase.resetPromise(avRecorder);
        loopTimes--;
    }
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function avConfigChangedPromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfigChangedPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await prepareErrPromise(avRecorder, avConfig)
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function avRecorderWithPromise2(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    console.info('case avConfig.orientationHint is ' + avConfig.orientationHint);
    console.info('case avConfig.profile.audioBitrate is ' + avConfig.profile.audioBitrate)
    console.info('case avConfig.profile.audioSampleRate is ' + avConfig.profile.audioSampleRate)
    console.info('case avConfig.profile.videoBitrate is ' + avConfig.profile.videoBitrate)
    console.info('case avConfig.profile.videoFrameRate is ' + avConfig.profile.videoFrameRate);

    setAvRecorderCallback(avRecorder, done)
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig)
    await getInputSurfacePromise(avRecorder)
    await initCamera()

    await startRecordingProcessPromise(avRecorder, recorderTime)
    await pauseRecordingProcessPromise(avRecorder)

    await resumeRecordingProcessPromise(avRecorder);
    await stopRecordingProcessPromise(avRecorder)

    await releaseRecorderCallBack(avRecorder, done)
}

export async function getInputSurfaceErrPromise(avRecorder) {
    let result = true;
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    await avRecorder.getInputSurface().then((surfaceId) => {
        console.info('getInputSurface success');
        videoSurfaceId = surfaceId;
    }).catch((err) => {
        result = false;
        expect(result).assertEqual(false);
        console.info('getInputSurface failed and catch error is ' + err.message);
        sleep(1000);
    });
}

export async function create2GetInputSurfacePromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await getInputSurfaceErrPromise(avRecorder);
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function create2GetInputSurfacePromise2(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await releaseRecorderPromise(avRecorder, done);
}

export async function create2GetInputSurfacePromise3(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await getInputSurfaceErrPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function create2GetInputSurfacePromise4(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await getInputSurfaceErrPromise(avRecorder);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function create2GetInputSurfacePromise5(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await AVRecorderTestBase.resumePromise(avRecorder);
    await stopCameraOutput();
    await getInputSurfaceErrPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function create2GetInputSurfacePromise6(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.stopPromise(avRecorder);
    await getInputSurfaceErrPromise(avRecorder);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function create2GetInputSurfacePromise7(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.resetPromise(avRecorder);
    await getInputSurfaceErrPromise(avRecorder);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function getInputSurface3TimesPromise(avConfig, avRecorder, loopTimes, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2GetInputSurfacePromise2 avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    while (loopTimes > 0) {
        await getInputSurfacePromise(avRecorder);
        loopTimes--;
    }
    await initCamera();
    await releaseRecorderPromise(avRecorder, done);
}

// Promise start
export async function startErrPromise(avRecorder, recorderTime) {
    let result = true;
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    await avRecorder.start().then(() => {
        console.info('start success');
        if (recorderTime != undefined) {
            sleep(recorderTime);
        }
    }).catch((err) => {
        result = false;
        expect(result).assertEqual(false);
        console.info('start failed and catch error is ' + err.message);
        sleep(1000);
    });
}

export async function create2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await startErrPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function prepare2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case prepare2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await startErrPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function pause2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case pause2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await startErrPromise(avRecorder, recorderTime);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function resume2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case resume2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await AVRecorderTestBase.resumePromise(avRecorder);
    await startErrPromise(avRecorder, recorderTime);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function stop2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case stop2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.stopPromise(avRecorder);
    await startErrPromise(avRecorder, recorderTime);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function reset2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case reset2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.resetPromise(avRecorder);
    await startErrPromise(avRecorder, recorderTime);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function getInputSurface2StartPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case getInputSurface2StartPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await releaseRecorderPromise(avRecorder, done);
}

export async function start3TimesPromise(avConfig, avRecorder, recorderTime, loopTimes, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case start3TimesPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    while (loopTimes > 0) {
        await startRecordingProcessPromise(avRecorder, recorderTime);
        await AVRecorderTestBase.resetPromise(avRecorder);
        await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
        loopTimes--;
    }
    await releaseRecorderPromise(avRecorder, done);
}

// Promise pause
export async function pauseErrPromise(avRecorder) {
    let result = true;
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    await avRecorder.pause().then(() => {
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.PAUSED);
        console.info('pause success');
    }).catch((err) => {
        result = false;
        expect(result).assertEqual(false);
        console.info('pause failed and catch error is ' + err.message);
        sleep(1000);
    });
}

export async function create2PausePromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case create2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await pauseErrPromise(avRecorder);
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function prepare2PausePromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case prepare2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await pauseErrPromise(avRecorder);
    await AVRecorderTestBase.releasePromise(avRecorder);
    done();
}

export async function start2PausePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case start2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await pauseRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function resume2PausePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case resume2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await pauseRecordingProcessPromise(avRecorder);
    await resumeRecordingProcessPromise(avRecorder);
    // await AVRecorderTestBase.pausePromise(avRecorder);
    // await AVRecorderTestBase.resumePromise(avRecorder);
    await pauseRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function stop2PausePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case stop2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.stopPromise(avRecorder);
    await pauseErrPromise(avRecorder);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function reset2PausePromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case reset2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.resetPromise(avRecorder);
    await pauseErrPromise(avRecorder);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function getInputSurface2PausePromise(avConfig, avRecorder, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case getInputSurface2PausePromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await pauseErrPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function pause3TimesPromise(avConfig, avRecorder, recorderTime, loopTimes, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case pause3TimesPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    while (loopTimes > 0) {
        await pauseRecordingProcessPromise(avRecorder);
        await resumeRecordingProcessPromise(avRecorder);
        loopTimes--;
    }
    await releaseRecorderPromise(avRecorder, done);
}

// Promise
export async function recordStart2ReleaseWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2ReleaseWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2PauseWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await pauseRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2ResumeWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2ResumeWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await AVRecorderTestBase.resumePromise(avRecorder);
    await stopCameraOutput();
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2StopWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await stopRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2ResetWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await resetRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2Pause2StopWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2Pause2StopWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await stopRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2Pause2ResetWithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2Pause2ResetWithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await resetRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2Resume2WithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2Resume2WithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await AVRecorderTestBase.resumePromise(avRecorder);
    await stopRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}

export async function recordStart2reset2WithPromise(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await AVRecorderTestBase.idle(avRecorder);
    console.info('case recordStart2reset2WithPromise avConfig.url is ' + avConfig.url);
    setAvRecorderCallback(avRecorder, done);
    await AVRecorderTestBase.preparePromise(avRecorder, avConfig);
    await getInputSurfacePromise(avRecorder);
    await initCamera();
    await startRecordingProcessPromise(avRecorder, recorderTime);
    await AVRecorderTestBase.pausePromise(avRecorder);
    await AVRecorderTestBase.resumePromise(avRecorder);
    await resetRecordingProcessPromise(avRecorder);
    await releaseRecorderPromise(avRecorder, done);
}


