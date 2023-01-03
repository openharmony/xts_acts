import {CustomContainer} from '../common/CustomContainer3';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SwipeGestureTest {
  @State X : number = 0;
  @State Y : number = 0;
  @State name: string = 'SwipeGesture';
  @State StepTips: string = '操作步骤：用至少一根手指滑动图像（最多十根手指）'+'\n'+'预期结果：图片正常滑动，手势滑动角度及速度显示正常';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.flower")).height('60%').width('70%')
      }
      .height('250vp').width('350vp').padding(20)
      .rotate({x: 0, y: 0, z: 1, angle: this.X})
      .gesture(
      SwipeGesture({fingers: 1, direction: SwipeDirection.Vertical})
        .onAction((event: GestureEvent) => {
          this.Y = event.speed
          this.X = event.angle
        })
      )
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text("滑动手势速度 ： " + this.Y)
        Text("滑动手势角度 ： " + this.X)
      }.height('15%').width('100%').padding(20)
    }
    .width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        X :$X, Y :$Y,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}

