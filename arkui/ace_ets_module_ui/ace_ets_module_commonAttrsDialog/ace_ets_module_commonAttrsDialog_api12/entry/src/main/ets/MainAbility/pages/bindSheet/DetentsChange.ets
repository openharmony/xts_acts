// xxx.ets
@Entry
@Component
struct onDetentsDidChangeExample {
  @State isShow:boolean = false
  @State DetentsChange:string = "DetentsChange"
  @Builder myBuilder() {
    Column() {
      Button("content1")
        .margin(10)
        .fontSize(20)

      Button("content2")
        .margin(10)
        .fontSize(20)
    }
    .width('100%')
  }

  build() {
    Column() {
      Text(this.DetentsChange).margin(30).id("DetentsChangeValue")
      Button("transition modal 1")
        .id("DetentsChange")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(),{
          detents:[SheetSize.MEDIUM,SheetSize.LARGE,200],
          backgroundColor:Color.Gray,
          blurStyle:BlurStyle.Thick,
          showClose:true,
          title:{title:"title", subtitle:"subtitle"},
          preferType: SheetType.CENTER,
          shouldDismiss:((sheetDismiss: SheetDismiss)=> {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          }),
          onDetentsDidChange: () => {
            this.DetentsChange = "DetentsChange success"
            console.log("BindSheet onDetentsDidChange.")
          }
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}