
import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEventManager from '@ohos.commonEventManager';

export default class EntryAbility extends UIAbility {
  private onCreateFlag = false;
  private onWindowStageCreateFlag = false;
  private onForegroundFlag = false;
  private onBackgroundFlag = false;
  private onNewWantFlag = false;
  private onDestroyFlag = false;
  private TEST_CASE_NAME = '';
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'singleEntry Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onCreateFlag)}`);
    this.TEST_CASE_NAME = want.action as string;
    this.onCreateFlag = true
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME}:Ability main onDestroy`);
    this.onDestroyFlag = true
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onBackgroundFlag': this.onBackgroundFlag,
          'onDestroyFlag': this.onDestroyFlag
        }
      }
    }
    commonEventManager.publish(`${this.TEST_CASE_NAME}_onDestroyHap_2`, commonEventData, (result) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onWindowStageCreateFlag)}`);
    this.onWindowStageCreateFlag = true
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onNewWant(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');

  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability main onForeground');
    this.onForegroundFlag = true;

    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onCreateFlag': this.onCreateFlag,
          'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
          'onForegroundFlag': this.onForegroundFlag
        }
      }
    }
    commonEventManager.publish(`${this.TEST_CASE_NAME}_onForegroundHap_2`, commonEventData,
      (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} : ${JSON.stringify(result)}`);
      });
    setTimeout(() => {
      this.context.terminateSelf()
    }, 1000)
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME}:Ability main onBackground`);
    this.onBackgroundFlag = true
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME}:Ability main onBackground ${this.onDestroyFlag}`);
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}