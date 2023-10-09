// xxx.ets
@Entry
@Component
struct Grid_ScrollFrameBegin {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State index : number = 0
  @State text : string = ''

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
        .id('Grid_ScrollFrameBegin_grid')
        .margin({right:25})
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('80%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .scrollBar(BarState.Off)
        .onScrollFrameBegin((offset: number) => {
          this.text = 'onScrollFrameBegin'
          return {offsetRemain: offset}
        })

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.On }) {
          Text()
            .width(20)
            .height(150)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
        .id('Grid_ScrollFrameBegin_scrollBar')

      }.height(300)

      Button('scroller scrollTo 20')
        .id('Grid_ScrollFrameBegin_scrollTo')
        .onClick(()=>{
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: 20,
            animation: {
              duration: 1000,
              curve: Curve.Linear
            }
          })
        })

      Text(this.text).id('Grid_ScrollFrameBegin_text')



    }.width('100%').margin({ top: 5 })
  }
}