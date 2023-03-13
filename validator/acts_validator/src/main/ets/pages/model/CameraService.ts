/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera'
import deviceInfo from '@ohos.deviceInfo'
import fileio from '@ohos.fileio'
import image from '@ohos.multimedia.image'
import media from '@ohos.multimedia.media'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import Logger from '../model/Logger'
import MediaUtils from '../model/MediaUtils'

const CameraMode = {
    MODE_PHOTO: 0, // 拍照模式
    MODE_VIDEO: 1 // 录像模式
}

//const CameraSize = {
//    WIDTH: 1280,
//    HEIGHT: 960
//}
const CameraSize = {
    WIDTH: 4096,
    HEIGHT: 3072
}

class CameraService {
    private tag: string = 'qlw CameraService'
    private static instance: CameraService = new CameraService()
    private mediaUtil = MediaUtils.getInstance()
    private cameraManager: camera.CameraManager = undefined
    private cameras: Array<camera.CameraDevice> = undefined
    private cameraOutputCapability: camera.CameraOutputCapability = undefined
    private cameraId: string = ''
    private cameraInput: camera.CameraInput = undefined
    private previewOutput: camera.PreviewOutput = undefined
    private photoOutPut: camera.PhotoOutput = undefined
    private captureSession: camera.CaptureSession = undefined
    private mReceiver: image.ImageReceiver = undefined
    private photoUri: string = ''
    private fileAsset: mediaLibrary.FileAsset = undefined
    private fd: number = -1
    private curMode = CameraMode.MODE_PHOTO
    private videoRecorder: media.VideoRecorder = undefined
    private videoOutput: camera.VideoOutput = undefined
    private handleTakePicture: (photoUri: string) => void = undefined
    private mirrorValue: boolean = false
    private videoConfig: any = {
        audioSourceType: 1,
        videoSourceType: 0,
        profile: {
            audioBitrate: 48000,
            audioChannels: 2,
            audioCodec: 'audio/mp4v-es',
            audioSampleRate: 48000,
            durationTime: 1000,
            fileFormat: 'mp4',
            videoBitrate: 48000,
            videoCodec: 'video/mp4v-es',
//            videoFrameWidth: globalThis.videoSize.width,
//            videoFrameHeight: globalThis.videoSize.height,
            videoFrameWidth: 176,
            videoFrameHeight: 144,
            videoFrameRate: 30
        },
        url: '',
        orientationHint: 0,
        location: { latitude: 30, longitude: 130 },
        maxSize: 10000,
        maxDuration: 10000
    }

    constructor() {
        this.mReceiver = image.createImageReceiver(CameraSize.WIDTH, CameraSize.HEIGHT, image.ImageFormat.JPEG, 8)
        Logger.info(this.tag, 'createImageReceiver')
        this.mReceiver.on('imageArrival', () => {
            Logger.info(this.tag, 'imageArrival')
            this.mReceiver.readNextImage((err, image) => {
                Logger.info(this.tag, 'readNextImage')
                if (err || image === undefined) {
                    Logger.error(this.tag, 'failed to get valid image')
                    return
                }
                image.getComponent(4, (errMsg, img) => {
                    Logger.info(this.tag, 'getComponent')
                    if (errMsg || img === undefined) {
                        Logger.info(this.tag, 'failed to get valid buffer')
                        return
                    }
                    let buffer
                    if (img.byteBuffer) {
                        buffer = img.byteBuffer
                    } else {
                        Logger.error(this.tag, 'img.byteBuffer is undefined')
                    }
                    this.savePicture(buffer, image)
                })
            })
        })
    }

    async savePicture(buffer: ArrayBuffer, img: image.Image) {
        Logger.info(this.tag, 'savePicture')
        this.fileAsset = await this.mediaUtil.createAndGetUri(mediaLibrary.MediaType.IMAGE)
        this.photoUri = this.fileAsset.uri
        Logger.info(this.tag, `this.photoUri = ${this.photoUri}`)
        this.fd = await this.mediaUtil.getFdPath(this.fileAsset)
        Logger.info(this.tag, `this.fd = ${this.fd}`)
        await fileio.write(this.fd, buffer)
        await this.fileAsset.close(this.fd)
        await img.release()
        Logger.info(this.tag, 'save image done')
        if (this.handleTakePicture) {
            this.handleTakePicture(this.photoUri)
        }
    }

    async initCamera(surfaceId: number, cameraDeviceIndex: number) {
        try{
            Logger.info(this.tag, 'initCamera')
            if (this.curMode === CameraMode.MODE_VIDEO) {
                await this.releaseCamera()
            }
            if (this.curMode === CameraMode.MODE_PHOTO) {
                await this.releasePhotoCamera()
            }
            Logger.info(this.tag, `deviceInfo.deviceType = ${deviceInfo.deviceType}`)
            if (deviceInfo.deviceType === 'default') {
                this.videoConfig.videoSourceType = 1
            } else {
                this.videoConfig.videoSourceType = 0
            }
            this.cameraManager = await camera.getCameraManager(globalThis.abilityContext)
            Logger.info(this.tag, 'getCameraManager')
            this.cameras = await this.cameraManager.getSupportedCameras()
            Logger.info(this.tag, `get cameras ${this.cameras.length}`)
            if (this.cameras.length === 0) {
                Logger.info(this.tag, 'cannot get cameras')
                return
            }
            this.cameraInput = await this.cameraManager.createCameraInput(this.cameras[cameraDeviceIndex])
            await this.cameraInput.open((err) => {
                if(err){
                    Logger.info(this.tag, `cameraInput open Failed : ${err}`)
                    return
                }
                Logger.info(this.tag, `cameraInput open success`)
            })
            Logger.info(this.tag, 'createCameraInput')
            this.cameraOutputCapability = await this.cameraManager.getSupportedOutputCapability(this.cameras[cameraDeviceIndex])
            Logger.info(this.tag, 'cameraOutputCapability: ' + JSON.stringify(this.cameraOutputCapability))
            Logger.info(this.tag, 'cameraOutputCapability previewProfiles: ' + JSON.stringify(this.cameraOutputCapability.previewProfiles))
            Logger.info(this.tag, 'cameraOutputCapability photoProfiles: ' + JSON.stringify(this.cameraOutputCapability.photoProfiles))
            Logger.info(this.tag, 'cameraOutputCapability videoProfiles: ' + JSON.stringify(this.cameraOutputCapability.videoProfiles))

            this.previewOutput = await this.cameraManager.createPreviewOutput(this.cameraOutputCapability.previewProfiles[0], surfaceId.toString())
            Logger.info(this.tag, 'createPreviewOutput')
            let mSurfaceId = await this.mReceiver.getReceivingSurfaceId()
            this.photoOutPut =  await this.cameraManager.createPhotoOutput(this.cameraOutputCapability.photoProfiles[0], (mSurfaceId))
            Logger.info(this.tag, 'createPhotoOutput')
            this.captureSession = await this.cameraManager.createCaptureSession()
            Logger.info(this.tag, 'createCaptureSession')
            await this.captureSession.beginConfig()
            Logger.info(this.tag, 'beginConfig')
            await this.captureSession.addInput(this.cameraInput)
            await this.captureSession.addOutput(this.previewOutput)
            await this.captureSession.addOutput(this.photoOutPut)
            await this.captureSession.commitConfig()
            await this.captureSession.start()
            Logger.info(this.tag, 'captureSession start')
        }catch(err){
            Logger.info(this.tag, 'initCamera err: ' + err)
        }

    }

    setTakePictureCallback(callback) {
        this.handleTakePicture = callback
    }

    async takePicture(rotationValue, qualityLevel) {
        Logger.info(this.tag, 'takePicture')
        if (this.curMode === CameraMode.MODE_VIDEO) {
            this.curMode = CameraMode.MODE_PHOTO
        }
//        if(this.photoOutPut.isMirrorSupported()){
//            this.mirrorValue = true
//        }
        let photoSettings = {
            rotation: rotationValue,
            quality: qualityLevel,
            location: { // 位置信息，经纬度
                latitude: 0,
                longitude: 0,
                altitude: 1000
            },
            mirror: this.mirrorValue
        }
        Logger.info(this.tag, JSON.stringify(photoSettings))
        try{
            await this.photoOutPut.capture(photoSettings)
        }catch(err){
            Logger.info(this.tag, `takePicture err ${err.message}`)
        }

        Logger.info(this.tag, 'takePicture done')
    }

    async startVideo() {
        try{
            Logger.info(this.tag, 'startVideo begin')
            await this.captureSession.stop()

            await this.captureSession.beginConfig()
            Logger.info(this.tag, 'beginConfig')
            if (this.curMode === CameraMode.MODE_PHOTO) {
                this.curMode = CameraMode.MODE_VIDEO
                if (this.photoOutPut) {
                    await this.captureSession.removeOutput(this.photoOutPut)
                }
            } else {
                if (this.videoOutput) {
                    await this.captureSession.removeOutput(this.videoOutput)
                }
            }
        }catch(err){
            Logger.info(this.tag, 'startVideo err1: ' + err)
        }

            this.fileAsset = await this.mediaUtil.createAndGetUri(mediaLibrary.MediaType.VIDEO)
            this.fd = await this.mediaUtil.getFdPath(this.fileAsset)
            this.videoRecorder = await media.createVideoRecorder()
            this.videoConfig.url = `fd://${this.fd}`
            await this.videoRecorder.prepare(this.videoConfig)
            let videoId = await this.videoRecorder.getInputSurface()
            Logger.info(this.tag, `cameraOutputCapability.videoProfiles ${this.cameraOutputCapability.videoProfiles.length}`)
//            let index = 0
//            this.videoOutput = await this.cameraManager.createVideoOutput(this.cameraOutputCapability.videoProfiles[index], videoId)

            // @ts-ignore
            let videoProfilesObj: camera.VideoProfile = {
                "format": 1003,
                "size":{
                    "width": 176,
                    "height": 144
                },
                "frameRateRange":{
                    "min": -1,
                    "max": 0
                }
            }
        try{
            this.videoOutput = await this.cameraManager.createVideoOutput(videoProfilesObj, videoId)
            await this.captureSession.addOutput(this.videoOutput)
            await this.captureSession.commitConfig()
            Logger.info(this.tag, 'captureSession commitConfig')
            await this.captureSession.start()
            Logger.info(this.tag, 'captureSession start')
            await this.videoOutput.start()
            Logger.info(this.tag, 'videoOutput start')
            await this.videoRecorder.start()
            Logger.info(this.tag, 'videoRecorder start')
        }catch(err){
            Logger.info(this.tag, 'startVideo err2: ' + err)
        }
    }

    async stopVideo() {
        Logger.info(this.tag, 'stopVideo called')
        await this.videoRecorder.stop()
        await this.videoRecorder.release()
        await this.videoOutput.stop()
        await this.fileAsset.close(this.fd)
    }

    async releaseCamera() {
        Logger.info(this.tag, 'releaseCamera')
        if (this.cameraInput) {
            // @ts-ignore
            await this.cameraInput.release()
        }
        if (this.previewOutput) {
            await this.previewOutput.release()
        }
        if (this.photoOutPut) {
            await this.photoOutPut.release()
        }
        if (this.videoOutput) {
            await this.videoOutput.release()
        }
        if (this.captureSession) {
            await this.captureSession.release()
        }
    }

    async releasePhotoCamera() {
        Logger.info(this.tag, 'releaseCamera')
        if (this.cameraInput) {
            // @ts-ignore
            await this.cameraInput.release()
        }
        if (this.previewOutput) {
            await this.previewOutput.release()
        }
        if (this.photoOutPut) {
            await this.photoOutPut.release()
        }
        if (this.captureSession) {
            await this.captureSession.release()
        }
    }
}

export default new CameraService()