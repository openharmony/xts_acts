import camera from '@ohos.multimedia.camera'
import Logger from '../model/Logger'
import CameraService from '../model/CameraService'
import {CustomContainer} from '../common/CameraOrientation';
import FirstDialog from '../model/FirstDialog';
const CameraMode = {
  MODE_PHOTO: 0, // 拍照模式
  MODE_VIDEO: 1 // 录像模式
}

@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CameraVideo';
  @State StepTips: string = '测试目的：用于测试相机不同分辨率下的录像能力\n-上边显示录像的预览窗口\n-按下测试按钮后触发3s录像，回放的录像文件将在录像结束后显示在下边窗口\n-使用下拉框可以选择相机设备和分辨率'+'\n'+'预期结果：回放的录像视频与预览窗口的画面一致';
  private tag: string = 'qlw'
  private mXComponentController: XComponentController = new XComponentController()
  @State surfaceId: number = 0;
  private x: number = 0;
  @State curModel: number = CameraMode.MODE_PHOTO
  @State cameraDeviceIndex: number = 0
  @State imageRotationValue: number = camera.ImageRotation.ROTATION_90
  @State qualityLevelValue: number = camera.QualityLevel.QUALITY_LEVEL_LOW
  @State assetUri: string = undefined
  @State Vue: boolean = false
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  handleTakePicture = (assetUri: string) => {
    this.assetUri = assetUri
    Logger.info(this.tag, `Video recorder end, assetUri: ${this.assetUri}`)
  }

  @Builder specificNoParam() {
    Column() {
    }
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/Camera/Camera_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        FillColor:$FillColor,
        name: $name,
        Vue: $Vue
      }).height('30%').width('100%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        XComponent({
          id: 'componentId',
          type: 'surface',
          controller: this.mXComponentController
        })
          .onLoad(async () => {
            Logger.info(this.tag, 'onLoad is called')
            // @ts-ignore
            this.mXComponentController.setXComponentSurfaceSize({ surfaceWidth: 10, surfaceHeight: 10 })
            // @ts-ignore
            this.surfaceId = this.mXComponentController.getXComponentSurfaceId()
            Logger.info(this.tag, `onLoad surfaceId: ${this.surfaceId}`)
            this.curModel = CameraMode.MODE_PHOTO
            CameraService.initCamera(this.surfaceId, this.cameraDeviceIndex)
          })
          .height('40%')
          .width('40%')
        Text('Camera Preview').fontSize('20fp')
//        Video()
        Text('Video playback').fontSize('20fp')
        Button('Test', {
          type: ButtonType.Normal,
          stateEffect: true
        }).borderRadius(8).backgroundColor(0x317aff).width('20%').onClick(() => {
          CameraService.startVideo()
          CameraService.setTakePictureCallback(this.handleTakePicture.bind(this))
          this.Vue = true
        })
      }.width('100%').height('70%').backgroundColor(Color.White)
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}