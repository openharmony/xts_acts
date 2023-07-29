@Entry
@Component
struct navigationType {
  @State strokeWidthStr: string = '10px'
  @State dividerColorStr: string  = '#000000'
  @State startMarginStr: string = '5px'
  @State endMarginStr: string = '5px'

  @State nullFlag: boolean = false

  @State dividerColor: Color = Color.Red


  private arr: number[] = [1, 2, 3];
  normalIcon : Resource = $r("app.media.icon")
  selectedIcon: Resource = $r("app.media.icon")

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, item => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }.key("ArkUX_Navigation_1111")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Auto)
      .minContentWidth(50)
      .navBarWidth(100)
      .navBarWidthRange([50, 300])
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}