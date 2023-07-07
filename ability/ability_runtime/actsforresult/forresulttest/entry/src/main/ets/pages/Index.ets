import Want from '@ohos.app.ability.Want';

@Entry
@Component
struct Index {
  @State message: string = 'Second application'
  @StorageLink('want') want: Want = {
    action: "AsyncCallback_0200",
    bundleName: 'com.example.forresulttestsecond',
    abilityName: 'UIExtAbility'
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        UIExtensionComponent(this.want)
          .size({width:'100%',height:'100'})
          .backgroundColor(Color.Blue)
          .border({width:5,color:Color.Red})
        Button('StartAbilityForResult')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            globalThis.StartAbilityForResult()
          })
          .margin({
            top: 5
          })
        Button('StartUI')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            globalThis.startUIExtension()
          })
          .margin({
            top: 5
          })
        Button('StartCalledAbilitybyUIExtension')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            console.info('=======>button======>');
            globalThis.StartAbilityForResult_AsyncCallback_0100()
          })
          .margin({
            top: 5
          })
        Button('terminal')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            globalThis.terminal()
          })
          .margin({
            top: 5
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}