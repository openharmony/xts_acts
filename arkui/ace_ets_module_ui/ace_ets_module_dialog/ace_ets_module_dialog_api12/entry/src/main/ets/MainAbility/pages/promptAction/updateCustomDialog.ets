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
  @State updateCustomDialogMessage: string = "updateCustomDialog"

  build() {
    Row() {
      Column() {
        Text(this.updateCustomDialogMessage).fontSize(20).margin(20).id("updateCustomDialogMessage")
        Button("click me")
          .id("updateCustomDialogXTS")
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            try {
              promptAction.openCustomDialog(contentNode);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
            };

            setTimeout(() => {
              try {
                this.updateCustomDialogMessage = 'updateCustomDialog success'
                promptAction.updateCustomDialog(contentNode, { alignment: DialogAlignment.CenterEnd });
              } catch (error) {
                let message = (error as BusinessError).message;
                let code = (error as BusinessError).code;
                console.error(`updateCustomDialog args error code is ${code}, message is ${message}`);
              };
            }, 2000);   //2秒后自动更新弹窗位置
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}