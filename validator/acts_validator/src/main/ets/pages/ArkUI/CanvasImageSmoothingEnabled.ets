import {CustomContainer} from '../common/CanvasCustomContainer2'
import FirstDialog from '../model/FirstDialog'
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private img:ImageBitmap = new ImageBitmap("src/main/resources/base/media/flower.jpg");
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CanvasImageSmoothingEnabled';
  @State StepTips: string = '操作步骤：点击不同的控件'+'\n'+'预期结果：切换平滑过渡效果';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
        Text('True').fontSize(16).border({width:2}).size({width:'25%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(10, 100, 400, 300)
            this.context.imageSmoothingEnabled = true
            this.context.drawImage( this.img,0,0,400,200)
          })
        Text('False').fontSize(16).border({width:2}).size({width:'25%',height:'20%'})
          .onClick(()=>{
            this.context.clearRect(10, 100, 400, 300)
            this.context.imageSmoothingEnabled = false
            this.context.drawImage( this.img,0,0,400,200)
          })
      }.width('70%').height('30%')
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .backgroundColor('#ffffffff')
          .onReady(() =>{
            this.context.imageSmoothingEnabled = false
            this.context.drawImage( this.img,0,0,200,200)
          })
      }.width('100%').height('60%')
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