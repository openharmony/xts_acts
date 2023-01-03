import {CustomContainer} from '../common/CustomContainer2';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct PinchGuestureTest {
  @State X: number = 1;
  @State name: string = 'PinchGuesture';
  @State StepTips: string = '操作步骤：用手指触摸捏合图片（至少2根手指，最大为5指）'+'\n'+'预期结果：图片能够被正常捏合放缩';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column(){
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.flower")).height('60%').width('70%')
      }
      .height('250vp').width('350vp').padding(20)
      .scale({ x: this.X, y: this.X, z: this.X })
      .gesture(
      PinchGesture()
        .onActionUpdate((event: GestureEvent) => {
          this.X = event.scale
        })
      )
      Text('捏合放缩比例:'+this.X).fontColor(Color.Black)
    } .width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
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