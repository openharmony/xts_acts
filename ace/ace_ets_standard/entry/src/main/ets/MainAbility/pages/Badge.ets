@Entry
@Component
struct badge {
  @State counts: number = 33
  @State message: string = 'new'
  @State active: boolean = false
  private content: string = "badge Page";

  onPageShow() {
    console.info('badge page show called');
  }

  onBuildDone() {
    console.info('badge page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Scroll() {
        Column() {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Badge({
            count: this.counts,
            position: BadgePosition.Right,
            maxCount: 99,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          }) {
            Button('message')
              .onClick(() => {
                this.counts++
              })
              .width(100).height(50).backgroundColor(0x317aff)
          }
          .width(100)
          .height(50)
          .key('badge')

          Text("BadgePosition.RightTop").fontSize(16)
          Badge({
            count: this.counts,
            position: BadgePosition.RightTop,
            maxCount: 99,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          }) {
            Button('message')
              .onClick(() => {
                this.counts++
              })
              .width(100).height(50).backgroundColor(0x317aff)
          }
          .width(100)
          .height(50)
          .key('badge1')

          Text("BadgePosition.Left").fontSize(16)
          Badge({
            count: this.counts,
            position: BadgePosition.Left,
            maxCount: 99,
            style: { color: Color.Pink, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          }) {
            Button('message')
              .onClick(() => {
                this.counts++
              })
              .width(100).height(50).backgroundColor(0x317aff)
          }
          .width(100)
          .height(50)
          .key('badge2')
        }
      }
    }
    .key('flex')
    .width('100%')
    .height('100%')
  }
}
