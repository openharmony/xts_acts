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
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }.backgroundColor('#FFF0F0F0').size({ height: 100, width: 100 })
}

@Entry
@Component
struct closeCustomDialog {
  @State message: string = "hello"
  @State change: string = ""

  build() {
    Row() {
      Column({ space: 12 }) {
        Text(this.change)
          .id('CloseCustomDialog')
        Button("click me")
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            promptAction.openCustomDialog(contentNode, { onDidDisappear: () => { this.change = 'CloseCustomDialog' }});
            setTimeout(() => {
              promptAction.closeCustomDialog(contentNode);
            }, 1000);     //2秒后自动关闭
          })
      }
      .width('100%')
    }
    .id('row')
    .height('100%')
  }
}