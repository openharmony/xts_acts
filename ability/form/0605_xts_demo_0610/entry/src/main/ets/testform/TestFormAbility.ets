import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext } from '@ohos.arkui.UIContext';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class TestFormAbility extends UIAbility {
  private xtsWindowStage: window.WindowStage | undefined;
  private wantUri: string = '';
  private uiContext: UIContext | undefined;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.wantUri = want.uri ?? '';
    hilog.info(domain, tag, `TestFormAbility onCreate, wantUri:${this.wantUri}`);
    hilog.info(domain, tag, `TestFormAbility onCreate, wantUri:${want}`);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.wantUri = want.uri ?? '';
    hilog.info(0x0000, 'testTag', `TestFormAbility onNewWant, wantUri:${this.wantUri}`);
    // if (!this.uiContext) {
    //   hilog.info(0x0000, 'testTag', 'TestFormAbility pushUrl error uiContext is undefined');
    //   return;
    // }
    if (this.wantUri) {
      try {
        let aRouter = this.uiContext?.getRouter();
        aRouter?.pushUrl({url: this.wantUri})
      } catch (e: Error) {
        hilog.info(0x0000, 'testTag', 'TestFormAbility pushUrl error, message: ' + e.message);
      }
    }
    this.wantUri = '';
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(domain, tag, 'TestFormAbility onWindowStageCreate');
    this.xtsWindowStage = windowStage;
    try {
      this.xtsWindowStage?.loadContent(this.wantUri || "testform/pages/XtsFormLink", (err: BusinessError<void>): void => {
        if (err.code) {
          hilog.info(domain, tag, 'TestFormAbility loadContent error');
          return;
        }
        hilog.info(domain, tag, 'TestFormAbility loadContent ok');
      });
    } catch (e: Error) {
      hilog.info(domain, tag, 'TestFormAbility loadContent catch error：-----------' + e.message);
    }

    try {
      let windowClass = windowStage.getMainWindowSync();
      this.uiContext = windowClass!.getUIContext();
      // hilog.info(0x0000, 'testTag', 'TestFormAbility getUIContext' + JSON.stringify(uiContext, null, '\t'));
      hilog.info(0x0000, 'testTag', 'TestFormAbility getUIContext');
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag', 'TestFormAbility getUIContext error:' + e.message);
    }
  }
}