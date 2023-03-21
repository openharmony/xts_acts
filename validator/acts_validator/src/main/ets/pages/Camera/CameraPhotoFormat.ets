/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import camera from '@ohos.multimedia.camera'
import Logger from '../model/Logger'
import CameraService from '../model/CameraService'
import { CustomContainer } from '../common/CameraPhotoContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

@Entry
@Component
struct cameraOrientation {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraPhotoFormat';
  @State StepTips: string = '测试目的：用于测试相机拍照分辨率能力\n预期结果：所有分辨率均可以拍照，图片与预览一致';
  private tag: string = 'qlw'
  private mXComponentController: XComponentController = new XComponentController()
  @State surfaceId: number = 0;
  @State cameraDeviceIndex: number = 0
  @State assetUri: string = undefined
  @State Vue: boolean = false
  @State imageRotation: number = 0
  @State cameraListLength: number = undefined
  @State cameraList: SelectOption[] = []
  @State isEnabled: boolean = true
  @State isNextEnabled: boolean = true
  @State takeSelect: number = 0
  @State clickFrequency: number = 0
  @State resolutionSelectVal: string = '' // 下拉框默认value
  @State clickSerialPhotoVal: number = 0
  @State timer: number = -1
  @State resolution: SelectOption[] = [] // 分辨率
  @State testingFrequency: number = undefined // 测试总数
  @State isCameraChange: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    CameraService.setTakePictureCallback(this.handleTakePicture.bind(this))
  }

  cameraListFn() {
    this.cameraList = []
    this.cameraListLength = CameraService.cameras.length
    for (let index = 0; index < this.cameraListLength; index++) {
      this.cameraList.push({ value: `Camera ${index}` })
    }
    // 测试总次数 = 摄像头0的分辨率 + 摄像头1的分辨率 优先以RK为主
    this.testingFrequency = this.resolution.length
    Logger.info(this.tag, `testingFrequency ${this.testingFrequency}`)
  }

  handleTakePicture = (assetUri: string) => {
    this.assetUri = assetUri
    Logger.info(this.tag, `takePicture end, assetUri: ${this.assetUri}`)
  }

  onPageShow() {
    Logger.info(this.tag, `takePicture end, assetUri`)
	// @ts-ignore
    this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
      this.cameraListFn()
    })
  }

  async cameraInit(obj?) {
    CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex, obj, this.clickFrequency).then(() => {
      this.resolution = CameraService.previewSizeResolution
      this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
      this.cameraListFn()
    })
  }

  onPageHide() {
    CameraService.releaseCamera()
    Logger.info(this.tag, `onPageHide releaseCamera end`)
  }
  // 对分辨率数据处理 获取到需要的格式
  dealWithResolutionFn(arr) {
    let newResolution = []
    arr.forEach((item) => {
      let indexOf = item.value.indexOf("x")
      let objW = Number(item.value.slice(0, indexOf))
      let objH = Number(item.value.slice(indexOf + 1))
      let obj = {
        format: 2000,
        size: {
          "width": objW,
          "height": objH
        }
      }
      newResolution.push(obj)
    })
    return newResolution
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp').margin({ left: '20vp' })
        }.backgroundColor(Color.Black)
        .onClick(() => {
          router.back({
            url: 'pages/Camera/Camera_index',
            params: { result: 'None', }
          })
        })

        Text(this.name).fontColor(Color.White).fontSize('18fp').margin({ left: '-20vp' })
        Text('hello').fontColor(Color.White).visibility(Visibility.Hidden)
      }.backgroundColor(Color.Black).height('10%').width('100%').justifyContent(FlexAlign.SpaceBetween)

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Column() {
          XComponent({
            id: 'componentId',
            type: 'surface',
            controller: this.mXComponentController
          })
            .onLoad(async () => {
              Logger.info(this.tag, 'onLoad is called')
			  // @ts-ignore
              this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
              Logger.info(this.tag, `onLoad surfaceId: ${this.surfaceId}`)
              this.cameraInit()
            })
            .size({ width: '100%', height: '100%' })
          Text('Camera Preview').fontSize('20fp').fontColor(Color.White)
        }.size({ width: '40%', height: '60%' })

        Column() {
          Image(this.assetUri || '').size({ width: '100%', height: '100%' }).border({ width: 1 })
          Text('Oriented Photo').fontSize('20fp').fontColor(Color.White)
        }.size({ width: '40%', height: '60%' })
      }.width('100%').height('50%')

      Flex({ direction: FlexDirection.Column }) {
        Row() {
          Select(this.resolution)
            .selected(this.clickFrequency)
            .value(this.resolutionSelectVal)
            .font({ size: 16, weight: 500 })
            .fontColor(Color.White)
            .selectedOptionBgColor(Color.Black)
            .optionBgColor(Color.Black)
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
            .onSelect((index: number, value) => {
              let indexOf = value.indexOf('x')
              let objW = Number(value.slice(0, indexOf))
              let objH = Number(value.slice(indexOf + 1))
              let obj = {
                format: 2000,
                size: {
                  "width": objW,
                  "height": objH
                }
              }
              CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex, obj)
              Logger.info(this.tag, `onSelect Rotation index: ${index}, value: ${value}, obj: ${obj}`)
            })
          Select(this.cameraList)
            .selected(this.cameraDeviceIndex)
            .value(this.cameraDeviceIndex ? 'Camera 1' : 'Camera 0')
            .font({ size: 16, weight: 500 })
            .fontColor(Color.White)
            .selectedOptionBgColor(Color.Black)
            .optionBgColor(Color.Black)
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
            .onSelect((index: number) => {
              this.cameraDeviceIndex = index
              CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex).then(() => {
                this.cameraListFn()
              })
            })
        }.justifyContent(FlexAlign.SpaceEvenly)

        Text(`提示：对不同分辨率的图片进行拍摄，根据拍摄结果选择pass或选择fail`)
          .fontSize('16fp').fontColor(Color.White).margin({ top: 20 })
      }.size({ width: '80%', height: '20%' })

      Row() {
        Button('拍照')
          .enabled(this.isEnabled)
          .opacity(this.isEnabled ? 1 : 0.4)
          .width('40%')
          .backgroundColor(0x317aff)
          .onClick(async () => {
            this.isEnabled = false
            this.isNextEnabled = false
            CameraService.takePicture()
          })
        Button('NEXT')
          .enabled(!this.isNextEnabled)
          .opacity(!this.isNextEnabled ? 1 : 0.4)
          .width('40%')
          .backgroundColor(0x317aff)
          .onClick(async () => {
            this.clickFrequency++
            Logger.info(this.tag, `nextClickFn new clickFrequency: ${this.clickFrequency}`)

            if (this.resolution.length == this.clickFrequency || this.resolution.length < this.clickFrequency){
              if (this.isCameraChange){
                this.Vue = true
                this.isEnabled = false
                this.isNextEnabled = true
                return
              }
              this.cameraDeviceIndex = Number(!this.cameraDeviceIndex)
              this.clickFrequency = 0
              await this.cameraInit().then(() => {
                this.isCameraChange  = true
              })
            }
            this.isEnabled = true
            this.isNextEnabled = true
            if (this.clickFrequency){
              let newResolution = this.dealWithResolutionFn(this.resolution)
              Logger.info(this.tag, `nextClickFn new Resolution: ${newResolution}`)
              this.cameraInit(newResolution[this.clickFrequency])
              this.resolutionSelectVal = String(this.resolution[this.clickFrequency].value)
            }

          })
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
      .height('10%')

      CustomContainer({
        title: this.name,
        Url: 'pages/Camera/Camera_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue
      }).height('10%').width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}