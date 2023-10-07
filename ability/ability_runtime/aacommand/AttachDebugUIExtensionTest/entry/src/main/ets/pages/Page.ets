@Entry
@Component
struct Page {
  @State message: string = 'Hello World'
  private myProxy: UIExtensionProxy

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)

        UIExtensionComponent({
          bundleName: "com.acts.attachdebuguiextensiontest",
          abilityName: "UIExtAbility"
        })
          .size({
            "width": "60%",
            "height": "60%"
          })
          .border({
            "width": 1,
            "color": Color.Gray
          })
          .margin(30)
      }
      .width('100%')
    }
    .height('100%')
  }
}