import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';

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
    this.TEST_CASE_NAME = want.action as string
    this.onCreateFlag = true;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500') {
      this.onDestroyFlag = true
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data: {
            "onDestroyFlag": this.onDestroyFlag,
            "onForegroundFlag": this.onForegroundFlag,
          }
        }
      }
      commonEventManager.publish('SingleEntryAbility3_0500', commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    this.onWindowStageCreateFlag = true;

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    // 释放与UI相关的资源
  }

  onNewWant(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onNewWant');
    this.onNewWantFlag = true;
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    this.onForegroundFlag = true;
    if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400' ||
      this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500') {
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data: {
            "onCreateFlag": this.onCreateFlag,
            "onWindowStageCreateFlag": this.onWindowStageCreateFlag,
            "onForegroundFlag": this.onForegroundFlag
          }
        }
      };
      commonEventManager.publish('singleentryability2', commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s',
          `onConnect SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility, 50==: ${JSON.stringify(result)}`);
      });
    }
    if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500') {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability terminateSelf');
      this.sleep(3000)
      this.context.terminateSelf()
    }
    else {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability terminateSelf');
      this.context.terminateSelf()
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}