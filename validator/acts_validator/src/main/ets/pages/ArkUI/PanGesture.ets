import {CustomContainer} from '../common/CustomContainer3';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct PanGestureExample {
  @State X: number = 0;
  @State Y: number = 0;
  @State name: string = 'PanGesture';
  @State StepTips: string = '操作步骤：用至少一根手指拖动图像（最多十根手指）'+'\n'+'预期结果：图片正常拖动，偏移坐标显示正常';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Image($r("app.media.flower")).height('60%').width('70%')
      }
      .height('250vp').width('350vp').padding(20)
      .margin(80).translate({ x: this.X, y: this.Y, z: 5 })
      .gesture(
      PanGesture({})
        .onActionStart((event: GestureEvent) => {
          console.info('Pan start')
        })
        .onActionUpdate((event: GestureEvent) => {
          this.X = event.offsetX
          this.Y = event.offsetY
        })
        .onActionEnd(() => {
          console.info('Pan end')
        })
      )
      Text('偏移坐标x: ' + this.X + '\n' + '偏移坐标y: ' + this.Y)
    }.width('100%').height('80%').backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        X:$X, Y:$Y,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}
