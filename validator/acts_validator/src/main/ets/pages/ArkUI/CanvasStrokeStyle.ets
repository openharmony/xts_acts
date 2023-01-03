import {CustomContainer} from '../common/CanvasCustomContainer1'
import FirstDialog from '../model/FirstDialog'
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'CanvasStrokeStyle';
  @State StepTips: string = '操作步骤：点击不同的颜色控件'+'\n'+'预期结果：原本默认黑色的边框会随点击变化';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text('Red').fontSize(16).border({width:2}).size({width:'25%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(90, 150, 170, 120)
            this.FillColor = '#FFFF0000'
            this.context.lineWidth = 10
            this.context.strokeStyle = '#FFFF0000'
            this.context.strokeRect(100, 160, 150, 100)
          })
        Text('Yellow').fontSize(16).border({width:2}).size({width:'25%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(90, 150, 170, 120)
            this.FillColor = '#fffffc3c'
            this.context.lineWidth = 10
            this.context.strokeStyle = '#fffffc3c'
            this.context.strokeRect(100, 160, 150, 100)
          })
        Text('Green').fontSize(16).border({width:2}).size({width:'25%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(90, 150, 170, 120)
            this.FillColor = '#ff19fa00'
            this.context.lineWidth = 10
            this.context.strokeStyle = '#ff19fa00'
            this.context.strokeRect(100, 160, 150, 100)
          })
      }.width('70%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.lineWidth = 10
            this.context.strokeStyle = this.FillColor
            this.context.strokeRect(100, 160, 150, 100)
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
        name:$name
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}
