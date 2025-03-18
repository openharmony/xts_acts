import { common } from '@kit.AbilityKit';
let context = getContext(this) as common.UIAbilityContext;;
let tag = 'UIExtensionPage03'
@Entry
@Component
struct UIExtensionPage03 {
  @State message: string = 'UIExtension User';
  private myProxy: UIExtensionProxy | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .size({ width: '100%', height: '50' })
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)

        UIExtensionComponent(
          {
            bundleName: 'ohos.example.myapplication',
            abilityName: 'UIExtensionProvider03',
            moduleName: 'entry_test',
            parameters: {
              'ability.want.params.uiExtensionType': 'sys/commonUI',
            }
          })
          .focusable(true)
          .onRemoteReady((proxy) => {
            console.log('UIExtensionComponent onRemoteReady')
            this.myProxy = proxy;
          })
          .onReceive((data) => {
            console.log('UIExtensionComponent onReceive')
            this.message = JSON.stringify(data);
          })
          .onResult((data) => {
            console.log('UIExtensionComponent onResult')
            this.message = JSON.stringify(data);
          })
          .onRelease((code) => {
            console.log('UIExtensionComponent onRelease')
            this.message = "release code:" + code;
          })
          .offset({ x: 0, y: 30 })
          .size({ width: 300, height: 300 })
          .border({ width: 5, color: 0x317AF7, radius: 10, style: BorderStyle.Dotted })

        Button("sendData")
          .type(ButtonType.Capsule)
          .offset({ x: 0, y: 60 })
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .onClick(() => {
            this.myProxy?.send({
              "data": 123456,
              "message": "data from component"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
