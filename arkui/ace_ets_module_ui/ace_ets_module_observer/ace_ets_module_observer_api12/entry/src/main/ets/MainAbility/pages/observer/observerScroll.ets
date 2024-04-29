import observer from '@ohos.arkui.observer'

@Entry
@Component
struct scrollEvent1 {
  scroller: Scroller = new Scroller();
  options: observer.ObserverOptions = { id: "testId" };
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State message1: string = ''
  @State message2: string = ''
  // @State temp:observer.ScrollEventType=observer.ScrollEventType.SCROLL_START
  build() {
    Row() {
      Column({ space: 10 }) {
        Text('message1:' + this.message1).id('scrollEvent_1')
        Text('message2:' + this.message2).id('scrollEvent_2')
        Button('UIObserver on')
          .id('scrollEvent_3')
          .onClick(() => {
            observer.on('scrollEvent', (info) => {
              console.info('scrollEventInfo', JSON.stringify(info));
              if (observer.ScrollEventType.SCROLL_START == info.scrollEvent) {
                this.message1 = 'SCROLL_START'
              }
              if (observer.ScrollEventType.SCROLL_STOP == info.scrollEvent) {
                this.message1 = 'SCROLL_STOP'
              }
            });
          })
        Scroll(this.scroller) {
          Column() {
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
        .id('scrollEvent_4')
        .border({ width: 1, color: Color.Red })
        .id("testId")
        .height('80%')
      }
      .width('100%')

    }
    .height('100%')
  }
}