@Entry
@Component
struct NavRouter_onStateChange2 {
  @State isActiveWLAN: boolean = false

  build() {
    Column(){
      Navigation() {
        NavRouter() {
          Row() {
            Text(`push`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
              .id('NavRouter_onStateChange2_btn1')
          }
          .width('90%')
          .height(60)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('NavDestination').fontSize(30).padding({ left: 15 })
            }
          }.title("NavDestination")
        }
        .margin({ top: 10, bottom: 10 })
        .borderRadius(20)
        .mode(NavRouteMode.PUSH_WITH_RECREATE)
        .onStateChange((isActivated: boolean) => {
          this.isActiveWLAN = isActivated
        })
      }
      .height('50%')
      .width('100%')
      .title('NavRouter')
      .backgroundColor("#F2F3F5")
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)

      Text('' + this.isActiveWLAN).key('NavRouter_onStateChange2_text1')
    }
    .width('100%')
    .height('100%')

  }
}