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
        let TAG = "[avVideoRecorderTestOne] ";
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
            location : { latitude : 30, longitude : 130 },
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
                avVideoRecorderTestBase.sleep(1000)
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
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400
            * @tc.name      : 001.test start-pause-resume
            * @tc.desc      : Recorder video start-pause-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500
            * @tc.name      : 001.test start-stop-resume
            * @tc.desc      : Recorder video start-stop-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600
            * @tc.name      : 001.test start-reset-resume
            * @tc.desc      : Recorder video start-reset-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600 end')
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
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800
            * @tc.name      : 001.test create-prepare-getInputSurface-start-pause-resume-resume-resume
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-pause-resume-resume-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300
            * @tc.name      : 001.test start-stop
            * @tc.desc      : Recorder video start-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400
            * @tc.name      : 001.test start-pause-stop
            * @tc.desc      : Recorder video start-pause-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500
            * @tc.name      : 001.test start-pause-resume-stop
            * @tc.desc      : Recorder start-pause-resume-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600
            * @tc.name      : 001.test start-reset-stop
            * @tc.desc      : Recorder start-reset-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800
            * @tc.name      : 001.test start-stop-stop-stop
            * @tc.desc      : Recorder start-stop-stop-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800 end')
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
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300
            * @tc.name      : 001.test start-reset
            * @tc.desc      : Recorder video start-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400
            * @tc.name      : 001.test start-pause-reset
            * @tc.desc      : Recorder video start-pause-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500
            * @tc.name      : 001.test start-resume-reset
            * @tc.desc      : Recorder video start-resume-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600
            * @tc.name      : 001.test start-stop-reset
            * @tc.desc      : Recorder video start-stop-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600 end')
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

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800
            * @tc.name      : 001.test create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100
            * @tc.name      : 001.test 1，record 3s； 2，pause 3，resume 4，stop 5，restart
            * @tc.desc      : Recorder video 1，record 3s； 2，pause 3，resume 4，stop 5，restart
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 end')
        })

        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise1(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise2(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise3(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise4(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise5(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise6(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise7(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 end')
        // })
        //
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800
        //     * @tc.name      : 001.test start-resume
        //     * @tc.desc      : Recorder video start-resume
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResumePromise8(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100
        //     * @tc.name      : 001.test create-stop
        //     * @tc.desc      : Recorder video create-stop
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderStopPromise1(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200
        //     * @tc.name      : 001.test prepare-stop
        //     * @tc.desc      : Recorder video prepare-stop
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderStopPromise2(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700
        //     * @tc.name      : 001.test getInputSurface-stop
        //     * @tc.desc      : Recorder video getInputSurface-stop
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderStopPromise7(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 end')
        // })
        //
        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700
        //     * @tc.name      : 001.test create-prepare-getInputSurface-reset
        //     * @tc.desc      : Recorder create-prepare-getInputSurface-reset
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700', 0, async function (done) {
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getAvRecorderFd(fileName, "video");
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfig.url = fdPath;
        //     avVideoRecorderTestBase.avRecorderResetPromise7(avConfig, avRecorder, recorderTime, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 end')
        // })
    })
}

