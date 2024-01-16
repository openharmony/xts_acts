import promptAction from '@ohos.promptAction'
let customDialogId: number = 0
@Builder
function customDialogBuilder() {
  Column() {
    Text('Custom dialog Message').fontSize(10).id("openCustomDialog")
    Row() {
      Button("确认").onClick(() => {
        promptAction.closeCustomDialog(customDialogId)
      })
      Blank().width(50)
      Button("取消").onClick(() => {
        promptAction.closeCustomDialog(customDialogId)
      })
    }
  }.height(200).padding(5)
}

@Entry
@Component
struct openCustomDialogExample {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button(this.message)
          .id("CustomDialog")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: customDialogBuilder.bind(this)
            }).then((dialogId: number) => {
              customDialogId = dialogId
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}