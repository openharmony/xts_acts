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
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      hilog.info(0x0000, 'testTag EntryAbility', 'onWindowStageCreate ok');
    });
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility windowStage' + windowStage);
    AppStorage.setOrCreate<window.WindowStage>('windowStage', windowStage)
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility context' + this.context);
    AppStorage.setOrCreate<common.UIAbilityContext>('abilityContext', this.context)
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility launchWant' + this.launchWant);
    AppStorage.setOrCreate<Want>('launchWant', this.launchWant)
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility lastRequestWant' + this.lastRequestWant);
    AppStorage.setOrCreate<Want>('lastRequestWant', this.lastRequestWant)
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

  onDestroyAsync(): Promise<void> {
    hilog.info(0x0000, 'testTag  EntryAbility', 'onDestroyAsync');
    return new Promise<void>((resolve: (a: undefined)=>void, reject: (err: Error)=>void): void => {
      hilog.info(0x0000, 'testTag  EntryAbility', 'onDestroyAsync resolve 1');
      resolve(undefined);
      hilog.info(0x0000, 'testTag  EntryAbility', 'onDestroyAsync resolve 2');
    });
  }
}