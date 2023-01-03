import {CustomContainer} from '../common/CustomContainer4';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct TapGestureExample {
  @State value: string = '';
  @State name: string = 'TapGesture';
  @State StepTips: string = '操作步骤：用至少一根手指连续双击图像（最多十根手指）'+'\n'+'预期结果：双击图片后文本提示正常弹出';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.flower")).height('60%').width('70%')
      }
      .height('250vp').width('350vp').padding(20)
      .gesture(
      TapGesture({ count: 2 })
        .onAction(() => {
          this.value = 'TapGesture onAction'
        })
      )
      Text(this.value)
    }.width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        StepTips:this.StepTips,
        Url:'pages/ArkUI/ArkUI_index',
        content: this.specificNoParam,
        value:$value,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}