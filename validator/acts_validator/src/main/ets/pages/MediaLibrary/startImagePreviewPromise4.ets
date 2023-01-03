import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {CustomContainer} from '../common/MediaCustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'startImagePreviewPromise4';
  @State StepTips: string = '测试步骤：点击“点击预览”按钮' + '\n' + '预期结果：预览图片失败';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('点击预览').margin('5%').fontSize(20).border({ width: 1 }).size({ width: '75%', height: '30%' })
          .onClick(() => {
            let TAG = 'startImagePreviewPromise4';
            let images = [
              "datashare:///media/image/9999",
              "datashare:///media/image/9998",
              "datashare:///media/image/9997",
            ];
            let index = 1;
            mediaLibrary.getMediaLibrary().startImagePreview(images, index).then(() => {
              console.log(TAG + "Succeeded in previewing the images.");
            }).catch((err) => {
              console.log(TAG + "An error occurred when previewing the images." + JSON.stringify(err));
            });
          })
      }
    }.width('100%').height('80%').backgroundColor(Color.White)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/MediaLibrary/MediaLibrary_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        FillColor: $FillColor,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}

