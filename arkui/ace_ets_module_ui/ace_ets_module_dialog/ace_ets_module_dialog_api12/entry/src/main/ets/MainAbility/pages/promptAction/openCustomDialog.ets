import { BusinessError } from '@ohos.base';
import { ComponentContent } from "@ohos.arkui.node";

class Params {
  text: string = ""
  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({bottom: 36})
  }.backgroundColor('#FFF0F0F0')
}

@Entry
@Component
struct Index {
  @State message: string = "hello"
  @State openCustomDialogMessage: string = "openCustomDialog"

  build() {
    Row() {
      Column() {
        Text(this.openCustomDialogMessage).fontSize(20).margin(20).id("openCustomDialogMessage")
        Button("click me")
          .id("openCustomDialogXTS")
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            try {
              this.openCustomDialogMessage = 'openCustomDialog success'
              promptAction.openCustomDialog(contentNode);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
            };
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}