import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {CustomContainer} from '../common/MediaCustomContainer';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  @State FillColor: string = '#FF000000';
  @State name: string = 'startMediaSelectPromise3';
  @State StepTips: string = '测试步骤：点击“点击选择”按钮'+'\n'+'预期结果：可以选择多个图片、视频资源';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('点击选择').margin('5%').fontSize(20).border({ width: 1 }).size({ width: '75%', height: '30%' })
          .onClick(() => {
            let TAG = 'startMediaSelect5_media2';
            let option : mediaLibrary.MediaSelectOption = {
              type : "media",
              count : 2
            };
            mediaLibrary.getMediaLibrary().startMediaSelect(option).then((value) => {
              console.log(TAG + "Media resources selected." + JSON.stringify(value));
            }).catch((err) => {
              console.log(TAG + "An error occurred when selecting media resources." + JSON.stringify(err));
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