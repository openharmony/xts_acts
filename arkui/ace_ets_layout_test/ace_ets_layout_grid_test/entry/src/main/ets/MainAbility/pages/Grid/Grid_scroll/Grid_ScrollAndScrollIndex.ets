// xxx.ets
@Entry
@Component
struct Grid_ScrollAndScrollIndex {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State index : number = 0
  @State text2 : string = ''

  build() {
    Column({ space: 5 }) {
      Stack({ alignContent: Alignment.BottomEnd }) {
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
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .id('Grid_ScrollAndScrollIndex_grid')
        .margin({right:25})
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('80%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .scrollBar(BarState.Off)
        .onScrollIndex(() => {
          this.index++
        })
        .onScroll(() => {
          this.text2 = 'onScroll'
        })

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.On }) {
          Text()
            .width(20)
            .height(150)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
        .id('Grid_ScrollAndScrollIndex_scrollBar')

      }.height(300)

      Text(`onScrollIndex${this.index}`).id('Grid_ScrollAndScrollIndex_tex1')
      Text(this.text2).id('Grid_ScrollAndScrollIndex_tex2')



    }.width('100%').margin({ top: 5 })
  }
}