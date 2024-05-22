import { webview } from '@kit.ArkWeb';
import { common } from '@kit.AbilityKit';
import { advertising } from '@kit.AdsKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct WebRegister {
  private webController: webview.WebviewController = new webview.WebviewController();
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  aboutToAppear() {
    try {
      advertising.registerWebAdInterface(this.webController, this.context);
    } catch (err) {
      hilog.error(0x0000, 'testTag', '%{public}s', `register web ad interface error: ${err.code}, ${err.message}`);
    }
  }

  build() {
    Column() {
      Web({
        src: 'www.example.com',
        controller: this.webController,
      })
      .width("100%")
      .height("100%")

    }
  }
}