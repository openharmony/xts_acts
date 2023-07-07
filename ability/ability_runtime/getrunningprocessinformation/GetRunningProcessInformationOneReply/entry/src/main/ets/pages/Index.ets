@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button() {
          Text('get BackInfo')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .id('Backtest')
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          if (globalThis.want.action == 'Callback') {
            setTimeout(() => {
              globalThis.StartNormalAbility()
            },500)

            setTimeout(() => {
              globalThis.GetRunningProcessInfoCallback()
            },3000)

            setTimeout(() => {
              globalThis.PublishStateArray()
            },5000)
          }
          else if (globalThis.want.action == 'Promise') {
            setTimeout(() => {
              globalThis.StartNormalAbility()
            },500)

            setTimeout(() => {
              globalThis.GetRunningProcessInfoPromise()
            },3000)

            setTimeout(() => {
              globalThis.PublishStateArray()
            },5000)
          }
        })

        Button() {
          Text('get unFocusedInfo')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .id('unFocusedtest')
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          if (globalThis.want.action == 'Callback') {
            setTimeout(() => {
              globalThis.StartFloatingAbility()
            },500)

            setTimeout(() => {
              globalThis.GetRunningProcessInfoCallback()
            },2500)
          }
          else if (globalThis.want.action == 'Promise') {
            setTimeout(() => {
              globalThis.StartFloatingAbility()
            },500)

            setTimeout(() => {
              globalThis.GetRunningProcessInfoPromise()
            },2500)
          }
        })

        Button() {
          Text('get focusedInfo')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .id('Focustest')
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          if (globalThis.want.action == 'Callback') {
            setTimeout(() => {
              globalThis.GetRunningProcessInfoCallback()
            },500)
          }
          else if (globalThis.want.action == 'Promise') {
            setTimeout(() => {
              globalThis.GetRunningProcessInfoPromise()
            },500)
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}