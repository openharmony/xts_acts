import { common, Want } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

let context = getContext(this) as common.UIAbilityContext;;
let tag = 'UIExtensionPage02'
@Entry
@Component
struct UIExtensionPage02 {
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
            abilityName: 'UIExtensionProvider02',
            moduleName: 'entry_test',
            parameters: {
              'ability.want.params.uiExtensionType': 'sys/commonUI',
            }
          })
          .focusable(true)
          .onRemoteReady((proxy) => {
            console.log('UIExtensionComponent onRemoteReady')
            this.myProxy = proxy;
            commonEventManager.publish('ACTS_TEST_IN_USER', ()=> {
              console.info('====>Sub_UIExtensionContentSession_errorCode_0100 publish ACTS_TEST_IN_USER');
            });
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
            setTimeout(async () => {
              try {
                await router.pushUrl({
                  url: 'testability/pages/UIExtensionContentSession/extension',
                });
                console.info(tag, 'push page UIExtensionProvider success');
                commonEventManager.publish('ACTS_TEST_IN_PROVIDER', ()=> {
                  console.info('====>Sub_UIExtensionContentSession_errorCode_0100 publish ACTS_TEST_IN_PROVIDER');
                });
              } catch (err) {
                console.info(tag, 'push page UIExtensionProvider err,err is :',err);
              }
            }, 3000);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
