import {CustomContainer} from '../common/CanvasCustomContainer1'
import FirstDialog from '../model/FirstDialog'
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'CanvasTextBaseline';
  @State StepTips: string = '操作步骤：点击不同的水平对齐方式'+'\n'+'预期结果：原本默认水平对齐方式会随点击变化';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text('Top').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.strokeStyle = '#0000ff'
            this.context.lineWidth = 2
            this.context.moveTo(0, 120)
            this.context.lineTo(400, 120)
            this.context.stroke()
            this.context.textBaseline = 'top'
            this.context.fillText('Top', 160, 120)
          })
        Text('Bottom').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.strokeStyle = '#0000ff'
            this.context.lineWidth = 2
            this.context.moveTo(0, 120)
            this.context.lineTo(400, 120)
            this.context.stroke()
            this.context.textBaseline = 'bottom'
            this.context.fillText('Bottom', 160, 120)
          })
        Text('Middle').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.strokeStyle = '#0000ff'
            this.context.lineWidth = 2
            this.context.moveTo(0, 120)
            this.context.lineTo(400, 120)
            this.context.stroke()
            this.context.textBaseline = 'middle'
            this.context.fillText('Middle', 160, 120)
          })
        Text('Alphabetic').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(0, 10, 350, 300)
            this.context.strokeStyle = '#0000ff'
            this.context.lineWidth = 2
            this.context.moveTo(0, 120)
            this.context.lineTo(400, 120)
            this.context.stroke()
            this.context.textBaseline = 'alphabetic'
            this.context.fillText('Alphabetic', 160, 120)
          })
        Text('Hanging').fontSize(13).border({width:2}).size({width:'18%',height:'20%'})
          .onClick(()=> {
            this.context.clearRect(0, 10, 350, 300)
            this.context.strokeStyle = '#0000ff'
            this.context.lineWidth = 2
            this.context.moveTo(0, 120)
            this.context.lineTo(400, 120)
            this.context.stroke()
            this.context.textBaseline = 'hanging'
            this.context.fillText('Hanging', 160, 120)
          })
      }.width('90%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.strokeStyle = '#0000ff'
            this.context.lineWidth = 2
            this.context.moveTo(0, 120)
            this.context.lineTo(400, 120)
            this.context.stroke()

            this.context.font = '60px sans-serif'

            this.context.textBaseline = 'top'
            this.context.fillText('Top', 160, 120)
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
