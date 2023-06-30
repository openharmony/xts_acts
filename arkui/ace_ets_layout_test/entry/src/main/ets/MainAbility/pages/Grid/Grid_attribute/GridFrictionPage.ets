import { MessageManager, Callback } from '../../../common/MessageManager';

@Entry
@Component
struct GridFrictionPage {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State friction:number = 1000

  messageManager:MessageManager = new MessageManager();
  onPageShow() {
    console.info('Grid_lanes page show called');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'friction') {
        this.friction = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column({ space: 5 }) {
      Grid(this.scroller) {
        ForEach(this.Number, (day: string) => {
          ForEach(this.Number, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, day => day)
        }, day => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((first: number) => {
        console.info(first.toString())
      })
      .onScrollBarUpdate((index: number, offset: number) => {
        return {totalOffset: (index / 5) * (80 + 10) - 10 + offset, totalLength: 80 * 5 + 10 * 4}
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
      .scrollBar(BarState.Off)
        .onClick(() => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true })
        })
      .friction(this.friction)
      .key(Grid_GridFriction)
    }.width('100%').margin({ top: 5 })
  }
}
