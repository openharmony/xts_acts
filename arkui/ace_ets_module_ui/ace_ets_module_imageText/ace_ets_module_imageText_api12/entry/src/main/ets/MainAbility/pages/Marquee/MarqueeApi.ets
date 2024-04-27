// xxx.ets
@Entry
@Component
struct MarqueeApi {
  @State start: boolean = false
  @State src: string = ''
  @State marqueeText: string = 'Running Marquee'
  private fromStart: boolean = true
  private step: number = 10
  private loop: number = Number.POSITIVE_INFINITY

  build() {
    Column() {
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.marqueeText + this.src
      })
        .key('MarqueeApi')
        .marqueeUpdateStrategy(MarqueeUpdateStrategy.PRESERVE_POSITION)


    }
    .width('100%')
    .height('100%')
  }
}