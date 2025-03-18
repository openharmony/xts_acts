import { UIExtensionContentSession } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';

let storage = LocalStorage.GetShared();
const tag: string = `UIExtensionProvider`;

@Entry(storage)
@Component
struct Extension {
  @State message: string = `UIExtension provider`;
  private session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session');

  onPageShow() {
    console.info(tag, 'show');
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)

        Button("send data")
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .onClick(() => {
            this.session?.sendData({ "data": 543321 });
            console.info(tag, 'UIExtAbility session.sendData success');
          })

        Button("load data")
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .onClick(() => {
            try{
              this.session?.loadContent('testability/pages/UIExtensionContentSession/UIExtensionPage01',storage);
              console.info(tag, 'UIExtAbility session.loadContent success');
            } catch (err) {
              console.info(tag, 'UIExtAbility session.loadContent err,err is :',err);
              commonEventManager.publish('ACTS_TEST_DESTROY', ()=> {
                console.info('====>Sub_UIExtensionContentSession_errorCode_0100 publish ACTS_TEST_TERMINATE');
              });
            }
          })

        Button("terminate self")
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .id('terminateSelf')
          .onClick(() => {
            this.session?.terminateSelf();
            storage.clear();
            console.log('UIExtAbility terminate success')
            commonEventManager.publish('ACTS_TEST_DESTROY', ()=> {
              console.info('====>Sub_UIExtensionContentSession_errorCode_0100 publish ACTS_TEST_DESTROY');
            });
          })

        Button("terminate self with result")
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .onClick(() => {
            this.session?.terminateSelfWithResult({
              resultCode: 0,
              want: {
                bundleName: "com.example.uiextensiondemo",
                parameters: { "result": 123456 }
              }
            })
          })
      }
    }
    .height('100%')
  }
}
