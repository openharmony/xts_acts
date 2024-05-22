@Entry
@Component
struct SheetTransitionExample {
  @State isShow:boolean = false
  @State SheetType: SheetType = SheetType.BOTTOM;
  @State SheetTypeValue: string = "value SheetType:";
  @State WidthValue: string = "value Width:";

  @Builder myBuilder() {
    Column() {
      Text("This is Model Sheet(bindSheet)").fontSize(20).margin(10)
      Text(this.SheetTypeValue).fontSize(20).id("SheetTypeValue").margin(10)
      Text(this.WidthValue).fontSize(20).id("WidthValue").margin(10)
      Button("Close Model Sheet")
        .margin(10)
        .fontSize(20)
        .onClick(()=>{
          this.isShow = false;
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("Open Model Sheet")
        .id("SheetTransition")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          height: SheetSize.MEDIUM,
          backgroundColor: Color.Green,
          onTypeDidChange: (value: SheetType) => {
            this.SheetTypeValue = (`value SheetType:${this.SheetType = value}`)
            console.info(`value SheetType:${this.SheetType = value}`)
          },
          onWidthDidChange: (value: number) => {
            this.WidthValue = (`value Width:${value}`)
            console.info(`value Width:${value}`)
          },
          onWillAppear: () => {console.log("BindSheet onWillAppear.")},
          onAppear: () => {console.log("BindSheet onAppear.")},
          onWillDisappear: () => {console.log("BindSheet onWillDisappear.")},
          onDisappear: () => {console.log("BindSheet onDisappear.")}
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}