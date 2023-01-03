import {CustomContainer} from '../common/CanvasCustomContainer2'
import FirstDialog from '../model/FirstDialog'
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CanvasShadowBlur';
  @State StepTips: string = '操作步骤：拖动滑块向右移动'+'\n'+'预期结果：阴影会随着拖动距离增大而变模糊，并显示模糊数值';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text('→').fontSize(16).border({width:2}).size({width:'20%',height:'20%'})
          .translate({ x: this.X, y: 20, z: 5 })
          .gesture(
          PanGesture({})
            .onActionStart((event: GestureEvent) => {
              this.context.clearRect(10, 50, 400, 300)
              this.context.fillStyle = 'rgb(255,0,0)'
              this.context.fillRect(150, 150, 100, 100)
              console.info('Pan start')
            })
            .onActionUpdate((event: GestureEvent) => {
              this.X = event.offsetX
            })
            .onActionEnd(() => {
              console.info('Pan end')
            })
          )
        Text('阴影模糊: ' + this.X )
      }.width('70%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.shadowBlur = this.X
            this.context.shadowColor = 'rgb(0,0,0)'
            this.context.fillStyle = 'rgb(255,0,0)'
            this.context.fillRect(150, 150, 100, 100)
          })
      }.width('100%').height('70%')
    }.width('100%').height('80%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/ArkUI/ArkUI_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        FillColor:$FillColor,
        X:$X,
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}