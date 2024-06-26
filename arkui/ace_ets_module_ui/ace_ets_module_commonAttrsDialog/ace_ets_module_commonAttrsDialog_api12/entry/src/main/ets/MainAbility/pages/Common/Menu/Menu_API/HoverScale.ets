@Entry
@Component
struct HoverScale {
  private iconStr: ResourceStr = $r("app.media.icon")
  @State mHoverScale: AnimationRange<number> = [1,2]
  @State mText: string = ''

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.mText).id('hoverScale')
        Text('preview-image')
          .id('btn')
          .onTouch(() =>{
            this.mText = 'hoverScale'
          })
          .width(200)
          .height(100)
          .textAlign(TextAlign.Center)
          .margin(100)
          .fontSize(30)
          .bindContextMenu(this.MyMenu, ResponseType.LongPress,
            { preview: MenuPreviewMode.IMAGE,
              previewAnimationOptions: {scale: [0.8, 1.0], hoverScale: this.mHoverScale},
            })
          .backgroundColor("#ff3df2f5")
      }
    }.height('100%').width('100%').id('row')
  }
}