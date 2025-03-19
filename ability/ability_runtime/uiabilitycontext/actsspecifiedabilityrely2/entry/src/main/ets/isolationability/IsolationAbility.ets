import { AbilityConstant, appManager, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';
import { JSON, process } from '@kit.ArkTS';

const DOMAIN = 0x0000;
let exitTime = 500;
let exitTask = 0;

export default class IsolationAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate ' + JSON.stringify(want));

    let flag: string = want.parameters?.flag as string;
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'IsolationAbility flag: ' + flag);
    if (flag === 'delayExit') {
      exitTime = 1400;
    }

    appManager.getRunningProcessInformation().then((result) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'RunningProcessInfo ' + JSON.stringify(result));
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'RunningProcessInfo ' + JSON.stringify(process.pid));
      for (let item of result) {
        if (item.pid === process.pid) {
          commonEventManager.publish('IsolationAbility_onCreate', {data: item.processName}, () => {});
        }
      }
    });
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onNewWant' + JSON.stringify(want));
    commonEventManager.publish('IsolationAbility_onNewWant', {}, () => {});
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
    commonEventManager.publish('IsolationAbility_onDestroy', {}, () => {});
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Isolation', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground: ' + exitTime);
    if (exitTask !== 0) {
      return;
    }
    exitTask = setTimeout(() => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'IsolationAbility terminateSelf');
      this.context.terminateSelf();
      exitTask = 0;
    }, exitTime);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
