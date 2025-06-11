import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext } from '@ohos.arkui.UIContext';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';


class EntryAbility extends UIAbility {
  private wantUri: string = '';
  private uiContext: UIContext | undefined;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag sjd EntryAbility', 'EntryAbility onCreate');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.wantUri = want.uri ?? '';
    hilog.info(0x0000, 'testTag', `EntryAbility onNewWant, wantUri: ${this.wantUri}`);
    if (this.wantUri) {
      try {
        let aRouter = this.uiContext?.getRouter();
        aRouter?.pushUrl({url: this.wantUri})
      } catch (e: Error) {
        hilog.info(0x0000, 'testTag', 'EntryAbility pushUrl error:' + e.message);
      }
    }
    this.wantUri = '';
  }

  // "pages/Index",
  // "pages/Index2",
  // "testform/pages/XtsFormLink",
  // "testform/pages/XtsFormComponent",
  // "testform/pages/XtsFormProvider",
  // "testform/pages/XtsFormInfo"
  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag sjd EntryAbility', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('testform/pages/XtsFormInfo', (err: BusinessError<void>): void => {
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent entering');
        MyCallback.runCasesOfCallback();
        if (err.code) {
          hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent ok');
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent catch error：-----------' + e.message);
    }

    try {
      let windowClass = windowStage.getMainWindowSync();
      this.uiContext = windowClass!.getUIContext();
      hilog.info(0x0000, 'testTag', 'EntryAbility getUIContext');
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag', 'EntryAbility getUIContext error:' + e.message);
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}