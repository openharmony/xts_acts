import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

export default class NoSpecifiedAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'NoSpecifiedAbility onCreate');
    commonEventManager.publish('demo2_nospecified_onCreate', {}, () => {});
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'NoSpecifiedAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'NoSpecifiedAbility onWindowStageCreate');

    windowStage.loadContent('pages/NSpecified', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'NoSpecifiedAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'NoSpecifiedAbility onForeground');
    setTimeout(() => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'demo2 no specified terminateSelf');
      this.context.terminateSelf();
    }, 500);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'NoSpecifiedAbility onBackground');
  }
}
