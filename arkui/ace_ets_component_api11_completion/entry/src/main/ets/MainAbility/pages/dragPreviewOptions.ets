// xxx.ets
@Entry
@Component
struct dragPreviewOptionsDemo{
  build() {
    Row() {
      Column() {
        Image($rawfile('bm.jpg'))
          .key("dragPreviewOption")
          .height(150)
          .margin({ top: 10 })
          .width("100%")
          .draggable(true)
          .dragPreviewOptions({ mode: DragPreviewMode.AUTO })
      }
      .width("100%")
      .height("100%")
    }
  }
}