// xxx.ets
@Entry
@Component
struct GridExample {
  @State numbers: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State gridPosition: number = 0 //0代表滚动到grid顶部，1代表中间值，2代表滚动到grid底部。

  build() {
    Column({ space: 5 }) {
      Text('scroll').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller) {
        ForEach(this.numbers, (day: string) => {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .enableScrollInteraction(true)
      .supportAnimation(false)
      .multiSelectable(false)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(4)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
      .onScrollIndex((first: number, last: number) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onScrollBarUpdate((index: number, offset: number) => {
        console.info("XXX" + 'Grid onScrollBarUpdate,index : ' + index.toString() + ",offset" + offset.toString())
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 }
      })  //只适用于当前示例代码数据源，如果数据源有变化，则需要修改该部分代码，或者删掉此属性
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(scrollOffset.toString())
        console.info(scrollState.toString())
      })
      .onScrollStart(() => {
        console.info("XXX" + "Grid onScrollStart")
      })
      .onScrollStop(() => {
        console.info("XXX" + "Grid onScrollStop")
      })
      .onReachStart(() => {
        this.gridPosition = 0
        console.info("XXX" + "Grid onReachStart")
      })
      .onReachEnd(() => {
        this.gridPosition = 2
        console.info("XXX" + "Grid onReachEnd")
      })

      Button('next page')
        .onClick(() => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true })
        })
    }.width('100%').margin({ top: 5 })
  }
}
