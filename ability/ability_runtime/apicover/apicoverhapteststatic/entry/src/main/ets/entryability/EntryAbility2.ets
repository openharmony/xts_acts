import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void>): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      hilog.info(0x0000, 'testTag EntryAbility', 'onWindowStageCreate ok');
    });
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility context' + this.context);
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility context' + this.launchWant);
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility context' + this.lastRequestWant);
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility context' + this.callee);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onDestroy');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackground');
  }

  onWindowStageWillDestroy() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onWindowStageWillDestroy');
  }

  onWindowStageRestore() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onWindowStageRestore');
  }

  onNewWant() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onNewWant');
  }

  onDump() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onDump');
  }

  onShare() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onShare');
  }

  onBackPressed() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackPressed');
    return true;
  }

  // onDestroyAsync() {
  //   hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onDestroyAsync');
  // }
}