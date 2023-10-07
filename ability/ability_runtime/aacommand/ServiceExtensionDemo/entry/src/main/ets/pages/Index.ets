@Entry
@Component
struct Index {
  @State message: string = 'ExtensionAbility'
  @State startExtensionMessage: string = 'Start Extension'
  @State startExtensionMessageAbnormally: string = 'Start Extension Abnormally'
  @State stopExtensionMessage: string = 'Stop Extension'
  @State startUIAbilityMessage: string = 'Start Ability'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)

        Button() {
          Text(this.startExtensionMessage)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          globalThis.StartServiceAbility()
        })

        Button() {
          Text(this.startExtensionMessageAbnormally)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          globalThis.StartServiceAbilityAbnormally()
        })

        Button() {
          Text(this.stopExtensionMessage)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          globalThis.StopServiceAbility()
        })

        Button() {
          Text(this.startUIAbilityMessage)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          globalThis.StartAbility()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}