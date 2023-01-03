import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {CustomContainer} from '../common/MediaCustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'startImagePreviewCallback2';
  @State StepTips: string = '测试步骤：点击“点击预览”按钮'+'\n'+'预期结果：起始图片为第一张图片，一共可以预览到两张图片';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('点击预览').margin('5%').fontSize(20).border({ width: 1 }).size({ width: '75%', height: '30%' })
          .onClick(() => {
            let TAG = 'startImagePreviewCallback2';
            let images = [
              "datashare:///media/image/3",
              "datashare:///media/image/4",
            ];
            let index = 0;
            mediaLibrary.getMediaLibrary().startImagePreview(images, index, (err) => {
              if (err) {
                console.log(TAG + "An error occurred when previewing the images." + JSON.stringify(err));
                return;
              }
              console.log(TAG + "Succeeded in previewing the images.");
            });
          })
      }
    }.width('100%').height('80%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/MediaLibrary/MediaLibrary_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        FillColor:$FillColor,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}
