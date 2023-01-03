import {CustomContainer} from '../common/CustomContainer2';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct RotationGuestureTest {
  @State X: number = 0;
  @State name: string = 'RotationGuesture';
  @State StepTips: string = '操作步骤：用至少两根手指旋转图像（最多五根手指）'+'\n'+'预期结果：图片能够正常旋转';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column(){
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.flower")).height('60%').width('70%')
      }
      .height('250vp').width('350vp').padding(20)
      .rotate({ x:1, y:1, z:1, angle: this.X })
      .margin(80)
      .gesture(
      RotationGesture()
        .onActionUpdate((event: GestureEvent) => {
          this.X = event.angle
        })
      )
      Text('旋转角度:' + this.X)
    }.height('80%').width('100%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        X:$X,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}