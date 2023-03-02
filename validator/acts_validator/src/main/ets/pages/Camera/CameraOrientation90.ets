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
  @State name: string = 'CameraOrientation90';
  @State StepTips: string = '测试目的：用于测试相机预览和拍照旋转能力\n-左侧显示给定旋转角度后的预览窗口\n-右侧显示拍照后的图片\n-对于前置摄像头会有镜像效果'+'\n'+'预期结果：拍照图片与预览窗口的画面一致';
  private tag: string = 'qlw'
  private mXComponentController: XComponentController = new XComponentController()
  @State surfaceId: number = 0;
  @State curModel: number = CameraMode.MODE_PHOTO
  @State cameraDeviceIndex: number = 0
  @State imageRotationValue: number = camera.ImageRotation.ROTATION_0
  @State qualityLevelValue: number = camera.QualityLevel.QUALITY_LEVEL_LOW
  @State assetUri: string = undefined
  @State Vue: boolean = false
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  handleTakePicture = (assetUri: string) => {
    this.assetUri = assetUri
    Logger.info(this.tag, `takePicture end, assetUri: ${this.assetUri}`)
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
        name:$name,
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
        Image(this.assetUri || $r('app.media.img'))
          .width('40%').height('40%').border({ width: 1 }).objectFit(ImageFit.Contain)
        Text('Oriented Photo').fontSize('20fp')
        Button('拍照', {
          type: ButtonType.Normal,
          stateEffect: true
        }).borderRadius(8).backgroundColor(0x317aff).width('20%').onClick(() => {
          CameraService.takePicture(this.imageRotationValue, this.qualityLevelValue)
          CameraService.setTakePictureCallback(this.handleTakePicture.bind(this))
          this.Vue = true
        })
      }.width('100%').height('70%').backgroundColor(Color.White)
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}