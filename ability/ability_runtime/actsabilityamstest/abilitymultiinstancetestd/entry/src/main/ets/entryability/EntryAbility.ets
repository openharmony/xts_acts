import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEventManger from '@ohos.commonEventManager';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate, want:' + JSON.stringify(want));
    AppStorage.setOrCreate<boolean>('onCreate', true);
    AppStorage.setOrCreate<string>('event', want.action);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

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

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    let events = AppStorage.get<string>('event');
    let onCreate = AppStorage.get<boolean>('onCreate');
    let onAcceptWant = AppStorage.get<number>('onAcceptWant');
    let onForeground = true;
    if (events) {
      let commonEventData: commonEventManger.CommonEventPublishData  = {
        parameters:{
          data: {
            onAcceptWant: onAcceptWant,
            onCreate: onCreate,
            onForeground: onForeground
          }
        }
      };
      commonEventManger.publish(events,commonEventData,(result)=>{
        hilog.info(0x0000, 'testTag', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    };
    setTimeout(() => {
      this.context.terminateSelf();
    }, 5000);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
