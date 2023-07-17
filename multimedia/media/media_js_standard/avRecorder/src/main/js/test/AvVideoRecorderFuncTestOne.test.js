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

import deviceInfo from '@ohos.deviceInfo'
import media from '@ohos.multimedia.media'
import camera from '@ohos.multimedia.camera'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import * as avVideoRecorderTestBase from '../../../../../AvVideoRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avVideoRecorderTestOne() {
    describe('avVideoRecorderTestOne', function () {
        let avRecorder = null;
        const recorderTime = 3000;
        const RECORDER_LONG_TIME = 3600000;
        const LOOP_TIMES = 1000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let fdObject;
        let fdPath;
        let TAG = "[avVideoRecorderTest] ";
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 100000, // 视频比特率
            videoCodec : media.CodecMimeType.VIDEO_MPEG4,
            videoFrameWidth : 640,  // 视频分辨率的宽
            videoFrameHeight : 480, // 视频分辨率的高
            videoFrameRate : 30 // 视频帧率
        }

        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile : avProfile,
            url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
            rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
            location : { latitude : 30, longitude : 130 }
        }

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        const CREATE_CALLBACK_EVENT = 'createCallback';
        const SETONCALLBACK_EVENT = 'setAvRecorderCallback'
        const PREPARE_CALLBACK_EVENT = 'prepareCallback';
        const GETINPUTSURFACE_CALLBACK_EVENT = 'getInputSurfaceCallback';
        const INITCAMERA_EVENT = 'initCamera';
        const STARTCAMERA_EVENT = 'startCameraOutput';
        const STOPCAMERA_EVENT = 'stopCameraOutput';
        const STARTRECORDER_CALLBACK_EVENT = 'startCallback';
        const PAUSERECORDER_CALLBACK_EVENT = 'pauseCallback';
        const RESUMERECORDER_CALLBACK_EVENT = 'resumeCallback';
        const STOPRECORDER_CALLBACK_EVENT = 'stopCallback';
        const RESETRECORDER_CALLBACK_EVENT = 'resetCallback';
        const RELEASECORDER_CALLBACK_EVENT = 'releaseCallback';
        const RELEASECAMERA_EVENT = 'releaseCamera';
        const END_EVENT = 'end';

        const CREATE_PROMISE_EVENT = 'createPromise';
        const PREPARE_PROMISE_EVENT = 'preparePromise';
        const GETINPUTSURFACE_PROMISE_EVENT = 'getInputSurfacePromise';
        const STARTRECORDER_PROMISE_EVENT = 'startPromise';
        const PAUSERECORDER_PROMISE_EVENT = 'pausePromise';
        const RESUMERECORDER_PROMISE_EVENT = 'resumePromise';
        const STOPRECORDER_PROMISE_EVENT = 'stopPromise';
        const RESETRECORDER_PROMISE_EVENT = 'resetPromise';
        const RELEASECORDER_PROMISE_EVENT = 'releasePromise';

        let cameraManager;
        let videoOutput;
        let captureSession;
        let cameraInput;
        let previewOutput;
        let cameraOutputCap;
        let videoSurfaceId = null;

        beforeAll(async function () {
            console.info('beforeAll in1');
            if (deviceInfo.deviceType === 'default') {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
                console.info(TAG + 'rk3568 avConfig.videoSourceType is :' + avConfig.videoSourceType)
            } else {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
                console.info(TAG + 'rk3568 avConfig.videoSourceType is :' + avConfig.videoSourceType)
            }
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionName5 = 'ohos.permission.CAMERA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4, permissionName5];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(3000);
            await mediaTestBase.driveFn(4)
            console.info('beforeAll out');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await avRecorderTestBase.sleep(1000);
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avRecorder != null) {
                avRecorder.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            await mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            await avRecorderTestBase.sleep(1000);
        })

        afterAll(function () {
            // mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            console.info('afterAll case');
        })

        async function initCamera(avRecorder, avConfig, recorderTime, steps, done) {
            console.info('initCamera 001');
            // 创建CameraManager对象
            let context = globalThis.contextVideo;
            console.info('initCamera 002');
            cameraManager = camera.getCameraManager(context)
            console.info('initCamera 003');
            if (!cameraManager) {
                console.error("camera.getCameraManager error")
                return;
            }
            console.info('initCamera 004');
            console.info('initCamera 005');
            // 获取相机列表
            let cameras = cameraManager.getSupportedCameras();
            let cameraDevice = cameras[0];
            console.info('initCamera 006');
            // 查询相机设备在模式下支持的输出能力
            let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice);
            console.info('initCamera 007');
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
                console.info('captureSession.addInput cameraInput success');
            } catch (error) {
                console.error('Failed to addInput. errorCode = ' + error.code);
            }

            // 向会话中添加预览输入流
            try {
                captureSession.addOutput(previewOutput)
                console.info('captureSession.addOutput previewOutput success');
            } catch (error) {
                console.error('Failed to addOutput(previewOutput). errorCode = ' + error.code);
            }

            // 向会话中添加录像输出流
            try {
                captureSession.addOutput(videoOutput)
                console.info('captureSession.addOutput videoOutput success');
            } catch (error) {
                console.error('Failed to addOutput(videoOutput). errorCode = ' + error.code);
            }

            // 提交会话配置
            await captureSession.commitConfig()

            // 启动会话
            await captureSession.start().then(() => {
                console.log('captureSession start success.');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            })
        }

        function toNextStep(avRecorder, avConfig, recorderTime, steps, done) {
            if (steps[0] == END_EVENT) {
                console.info('case success!!');
                done();
            } else {
                eventEmitter.emit(steps[0], avRecorder, avConfig, recorderTime, steps, done);
            }
        }

        eventEmitter.on(CREATE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            media.createAVRecorder((error, recorder) => {
                if (recorder != null) {
                    avRecorder = recorder;
                    expect(avRecorder.state).assertEqual('idle');
                    console.info('createAVRecorder idleCallback success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.info(`createAVRecorder idleCallback fail, error:${error}`);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            });
        });

        eventEmitter.on(CREATE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            media.createAVRecorder().then((recorder) => {
                if (recorder != null) {
                    avRecorder = recorder;
                    console.info('createAVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('createAVRecorder fail');
                }
            }).catch((error) => {
                console.info(`createAVRecorder catchCallback, error:${error}`);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(SETONCALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                avVideoRecorderTestBase.setAvRecorderCallback(avRecorder, done)
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }catch(error){
                console.info('setAvRecorderCallback failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(PREPARE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.prepare(avConfig, (err) => {
                console.info('case prepare called');
                if (err == null) {
                    console.error(`case prepare success, state is ${avRecorder.state}`);
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED);
                    console.info('prepare success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.error(`case prepare error, errMessage is ${err.message}`);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(PREPARE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.prepare(avConfig).then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED);
                console.info('prepare success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('prepare failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(GETINPUTSURFACE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.getInputSurface((err, surfaceId) => {
                if (err == null) {
                    console.info('getInputSurface success');
                    videoSurfaceId = surfaceId;
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.info('getInputSurface failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            });
        });

        eventEmitter.on(GETINPUTSURFACE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.getInputSurface().then((surfaceId) => {
                console.info('getInputSurface success');
                videoSurfaceId = surfaceId;
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('getInputSurface failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(INITCAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                initCamera(avRecorder, avConfig, recorderTime, steps, done)
            }catch(error){
                console.info('initCamera failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(STARTCAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                startCameraOutput(avRecorder, avConfig, recorderTime, steps, done)
            }catch(error){
                console.info('startCameraOutput failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(STOPCAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                stopCameraOutput(avRecorder, avConfig, recorderTime, steps, done)
            }catch(error){
                console.info('stopCameraOutput failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(STARTRECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.start((err) => {
                console.info('case start called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED);
                    console.info('start AVRecorder success');
                    setTimeout(() => {
                        console.info('STARTRECORDER_CALLBACK_EVENT setTimeout success');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }, recorderTime);
                } else {
                    console.info('start AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(STARTRECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.start().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED);
                console.info('start success');
                setTimeout(() => {
                    console.info('STARTRECORDER_PROMISE_EVENT setTimeout success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }, recorderTime);
            }).catch((err) => {
                console.info('start failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(PAUSERECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.pause((err) => {
                console.info('case pause called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED);
                    console.info('pause AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('pause AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(PAUSERECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.pause().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED);
                console.info('pause AVRecorder success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('pause failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(RESUMERECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let resumeValue = true;
            avRecorder.resume((err) => {
                console.info('case resume called');
                if (err == null) {
                    console.info('resume AVRecorder success');
                    expect(resumeValue).assertEqual(true);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    resumeValue = false
                    console.info('resume AVRecorder failed and error is ' + err.message);
                    console.info('resumeValue is ' + resumeValue);
                    expect(resumeValue).assertEqual(false);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(RESUMERECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let resumeValue = true;
            avRecorder.resume().then(() => {
                console.info('resume success');
                expect(resumeValue).assertEqual(true);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                resumeValue = false
                console.info('resume AVRecorder failed and error is ' + err.message);
                console.info('resumeValue is ' + resumeValue);
                expect(resumeValue).assertEqual(false);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(STOPRECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let stopValue = true;
            avRecorder.stop((err) => {
                console.info('case stop called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED);
                    console.info('stop AVRecorder success');
                    expect(stopValue).assertEqual(true);
                    setTimeout(() => {
                        console.info('STOPRECORDER_CALLBACK_EVENT setTimeout success');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }, 500);
                } else {
                    stopValue = false
                    console.info('stop AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(STOPRECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let stopValue = true;
            avRecorder.stop((err) => {
                console.info('case stop called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED);
                    console.info('stop AVRecorder success');
                    expect(stopValue).assertEqual(true);
                    setTimeout(() => {
                        console.info('STOPRECORDER_PROMISE_EVENT setTimeout success');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }, 500);
                } else {
                    stopValue = false
                    console.info('stop AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(RESETRECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.reset((err) => {
                console.info('case reset called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE);
                    console.info('reset AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('reset AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(RESETRECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.reset().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('reset AVRecorder failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(RELEASECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.release((err) => {
                console.info('case release called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED);
                    console.info('release AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('release AVRecorder failed and error is ' + err.message);
                }
            })
        });

        eventEmitter.on(RELEASECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.release().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED);
                console.info('release AVRecorder success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('release AVRecorder failed and catch error is ' + err.message);
            });
        });

        async function startCameraOutput(avRecorder, avConfig, recorderTime, steps, done) {
            console.info('startCameraOutput start')
            await videoOutput.start(async (err) => {
                if (err) {
                    console.error(`Failed to start the video output ${err.message}`);
                    return;
                }
                console.log('Callback invoked to indicate the video output start success.');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        }

        async function stopCameraOutput(avRecorder, avConfig, recorderTime, steps, done) {
            await videoOutput.stop((err) => {
                if (err) {
                    console.error(`Failed to stop the video output ${err.message}`);
                    return;
                }
                console.log('Callback invoked to indicate the video output stop success.');

                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });

        }

        eventEmitter.on(RELEASECAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                releaseCamera(avRecorder, avConfig, recorderTime, steps, done)

            }catch(error){
                console.info('releaseCamera failed and catch error is ' + error.message);
            }
        });

        async function releaseCamera(avRecorder, avConfig, recorderTime, steps, done) {
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
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            } catch(err){
                console.info('releaseCamera failed and catch error is ' + err.message);
            }
        }

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100
            * @tc.name      : 001.test create-resume
            * @tc.desc      : Recorder video create-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            console.info('avRecorderResumeCallBack1 test start');
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200
            * @tc.name      : 001.test prepare-resume
            * @tc.desc      : Recorder video prepare-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700
            * @tc.name      : 001.test create-prepare-getInputSurface-resume
            * @tc.desc      : Recorder create-prepare-getInputSurface-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100
            * @tc.name      : 001.test create-reset
            * @tc.desc      : Recorder video create-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            console.info('avRecorderResumeCallBack1 test start');
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200
            * @tc.name      : 001.test prepare-reset
            * @tc.desc      : Recorder video prepare-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700
            * @tc.name      : 001.test create-prepare-getInputSurface-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700 end')
        })

        // promise prepare
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100
            * @tc.name      : 01. create->prepare
            * @tc.desc      : 1.create 2.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2PreparePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800
            * @tc.name      : 08. prepare 3 times
            * @tc.desc      : 1.create 2.prepare 3.prepare 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT
            );
            for (let i = 0; i < loopTimes; i++)
            {
                mySteps.push(
                    // preparePromise
                    PREPARE_PROMISE_EVENT,
                    // AVRecorderTestBase.resetPromise
                    RESETRECORDER_PROMISE_EVENT,
                )
            }
            mySteps.push(
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900
            * @tc.name      : 09.audioBitrate -1
            * @tc.desc      : 1.create 2.prepare (audioBitrate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 start')
            let avNewProfile = {
                audioBitrate : -1,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000
            * @tc.name      : 10.audioSampleRate -1
            * @tc.desc      : 1.create 2.prepare (audioSampleRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : -1,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100
            * @tc.name      : 11.videoBitrateRange -1
            * @tc.desc      : 1.create 2.prepare (videoBitrateRange -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : -1, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200
            * @tc.name      : 12.videoFrameRate -1
            * @tc.desc      : 1.create 2.prepare (videoFrameRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : -1 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 end')
        })

        // Promise getInputSurface
        /* *
             * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100
             * @tc.name      : 01. create->getInputSurface
             * @tc.desc      : 1.create 2.getInputSurface
             * @tc.size      : MediumTest
             * @tc.type      : Function
             * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 end')
        })

        // Promise start
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100
            * @tc.name      : 01. create->start
            * @tc.desc      : 1.create 2.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200
            * @tc.name      : 02. prepare->start
            * @tc.desc      : 1.create 2.prepare 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.prepare2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 end')
        })

        // Promise pause
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100
            * @tc.name      : 01. create->pause
            * @tc.desc      : 1.create 2.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200
            * @tc.name      : 02. prepare->pause
            * @tc.desc      : 1.create 2.prepare 3.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.prepare2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 end')
        })

        // Callback  prepare
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100
            * @tc.name      : 01. create->prepare
            * @tc.desc      : 1.create 2.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorde
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800
            * @tc.name      : 08. prepare 3 times
            * @tc.desc      : 1.create 2.prepare 3.prepare 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900
            * @tc.name      : 09.audioBitrate -1
            * @tc.desc      : 1.create 2.prepare (audioBitrate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900 start')
            let avNewProfile = {
                audioBitrate : -1,
                audioChannels : 2,
                audioSampleRate : 48000,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000,
                videoCodec : media.CodecMimeType.VIDEO_MPEG4,
                videoFrameWidth : 640,
                videoFrameHeight : 480,
                videoFrameRate : 30,
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000
            * @tc.name      : 10.audioSampleRate -1
            * @tc.desc      : 1.create 2.prepare (audioSampleRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioSampleRate : -1,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000,
                videoCodec : media.CodecMimeType.VIDEO_MPEG4,
                videoFrameWidth : 640,
                videoFrameHeight : 480,
                videoFrameRate : 30,
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100
            * @tc.name      : 11.videoBitrateRange -1
            * @tc.desc      : 1.create 2.prepare (videoBitrateRange -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : -1, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200
            * @tc.name      : 12.videoFrameRate -1
            * @tc.desc      : 1.create 2.prepare (videoFrameRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 100000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_MPEG4, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : -1 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            if (deviceInfo.deviceType === 'default') {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avNewConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200 end')
        })

        // Callback getInputSurface
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100
            * @tc.name      : 01. create->getInputSurface
            * @tc.desc      : 1.create 2.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200
            * @tc.name      : 02. prepare->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800
            * @tc.name      : 08. getInputSurface 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800 end')
        })

        // Callback start
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100
            * @tc.name      : 01. create->start
            * @tc.desc      : 1.create 2.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200
            * @tc.name      : 02. prepare->start
            * @tc.desc      : 1.create 2.prepare 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200 end')
        })

        // Callback pause
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100
            * @tc.name      : 01. create->pause
            * @tc.desc      : 1.create 2.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200
            * @tc.name      : 02. prepare->pause
            * @tc.desc      : 1.create 2.prepare 3.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200 end')
        })

        // stability test  Promise
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_PROMISE_0100
            * @tc.name      : 01.AVRecorder.prepare(promise)
            * @tc.desc      : 1. createAVRecorder 2. prepare 2. 执行1000次
            * @tc.size      : MediumTest
            * @tc.type      : Stability test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_PROMISE_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 1000;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT
            );
            for (let i = 0; i < loopTimes; i++)
            {
                mySteps.push(
                    // AVRecorderTestBase.preparePromise
                    PREPARE_PROMISE_EVENT,
                    // AVRecorderTestBase.resetPromise
                    RESETRECORDER_PROMISE_EVENT
                )
            }
            mySteps.push(
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_PROMISE_0100 end')
        })

        // stability test Callback
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_CALLBACK_0100
            * @tc.name      : 01.AVRecorder.prepare(callback)
            * @tc.desc      : 1. createAVRecorder 2. prepare 2. 执行1000次
            * @tc.size      : MediumTest
            * @tc.type      : Stability test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_CALLBACK_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array();
            mySteps.push(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT
            )
            for (let i = 0; i < 1000; i++) {
                mySteps.push(
                    PREPARE_CALLBACK_EVENT, GETINPUTSURFACE_CALLBACK_EVENT, RESETRECORDER_CALLBACK_EVENT
                )
            }
            mySteps.push(
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STABILITY_API_CALLBACK_0100 end')
        })
    })
}

