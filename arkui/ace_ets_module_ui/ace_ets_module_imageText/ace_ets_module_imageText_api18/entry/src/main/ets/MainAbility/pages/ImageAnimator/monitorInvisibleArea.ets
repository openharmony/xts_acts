@Entry
@Component
struct ImageAnimatorAutoPauseTest {
  scroller: Scroller = new Scroller()
  @State state: AnimationStatus = AnimationStatus.Running
  @State reverse: boolean = false
  @State iterations: number = 100
  @State preCallBack: string = 'Null'
  @State monitorInvisibleArea: boolean | undefined | null = true
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          ImageAnimator()
            .id('ImageAnimatorFlag')
            .images([
              {
                src: $r('app.media.flower')
              },
              {
                src: $r('app.media.icon')
              },
              {
                src: $r('app.media.tree')
              },
              {
                src: $r('app.media.icon')
              }
            ])
            .fixedSize(true)
            .borderRadius(10)
            .monitorInvisibleArea(this.monitorInvisibleArea)
            .clip(true).duration(4000).state(this.state).reverse(this.reverse)
            .fillMode(FillMode.Forwards).iterations(this.iterations).width('90%').height('40%')
            .margin({ top: 20 })
            .onStart(() => {
              this.preCallBack = 'Start'
              console.info('ImageAnimator Start')
            })
            .onPause(() => {
              this.preCallBack = 'Pause'
              console.info('ImageAnimator Pause')
            })
            .onRepeat(() => {
              console.info('ImageAnimator Repeat')
            })
            .onCancel(() => {
              console.info('ImageAnimator Cancel')
            })
            .onFinish(() => {
              console.info('ImageAnimator Finish')
            })
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }.width('100%')
      }
      .id('scrollFlag')
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })
      Row({space: 5}){
        Button('TRUE').id('trueFlag').fontSize(10).onClick(() => {
          this.monitorInvisibleArea = true
        })
        Button('FALSE').id('falseFlag').fontSize(10).onClick(() => {
          this.monitorInvisibleArea = false
        })
        Button('UNDEFINED').id('undefinedFlag').fontSize(10).onClick(() => {
          this.monitorInvisibleArea = undefined
        })
        Button('NULL').id('nullFlag').fontSize(10).onClick(() => {
          this.monitorInvisibleArea = null
        })
      }.margin({bottom: '5%'})
      Text(this.preCallBack).id('textFlag').height('5%').width('90%').offset({ x:20,y:50 })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}