@Entry
@Component
struct PanelExample {
  @State show: boolean = true

  build() {
    Column() {
      Text('2021-09-30    Today Calendar: 1.afternoon......Click for details')
        .width('90%')
        .height(50)
        .borderRadius(10)
        .backgroundColor(0xFFFFFF)
        .padding({ left: 20 })
        .onClick(() => {
          this.show = !this.show
        })
      Panel(this.show) {
        Column() {
          Text('Today Calendar')
          Divider()
          Text('1. afternoon 4:00 The project meeting')
        }
      }
      .key('panel')
      .type(PanelType.Foldable)
      .mode(PanelMode.Half)
      .dragBar(true)
      .fullHeight(500)
      .halfHeight(250)
      .miniHeight(100)
      .onChange((value: any) => {
        console.info(`width:${value.width},height:${value.height},mode:${value.mode}`)
      })

      Panel(this.show) {
        Column() {
          Text('Today Calendar')
          Divider()
          Text('1. afternoon 4:00 The project meeting')
        }
      }
      .key('panel2')
      .type(PanelType.Minibar)
      .mode(PanelMode.Mini)
      .dragBar(true)
      .fullHeight(500)
      .halfHeight(250)
      .miniHeight(100)
      .onChange((value: any) => {
        console.info(`width:${value.width},height:${value.height},mode:${value.mode}`)
      })

      Panel(false) {
        Column() {
          Text('Today Calendar')
          Divider()
          Text('1. afternoon 4:00 The project meeting')
        }
      }
      .key('panel3')
      .type(PanelType.Temporary)
      .mode(PanelMode.Full)
      .dragBar(true)
      .fullHeight(500)
      .halfHeight(250)
      .miniHeight(100)
      .onChange((value: any) => {
        console.info(`width:${value.width},height:${value.height},mode:${value.mode}`)
      })
    }.width('100%').height('50%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}