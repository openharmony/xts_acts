import {CustomContainer} from '../common/CustomContainer2';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct LongPressGestureExample {
  @State X: number = 0;
  @State name: string = 'LongPressGesture';
  @State StepTips: string = '操作步骤：用至少一根手指长按图像（最多十根手指）'+'\n'+'预期结果：长按动作触发计数增加';
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
      LongPressGesture({ repeat: true })
        .onAction((event: GestureEvent) => {
          if (event.repeat) {
            this.X++
          }
        })
        .onActionEnd(() => {
          this.X = 0
        })
      )
      Text('长按动作连续触发:' + this.X).fontColor(Color.Black)
    }.width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        content: this.specificNoParam,
        StepTips:this.StepTips,
        X:$X,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}