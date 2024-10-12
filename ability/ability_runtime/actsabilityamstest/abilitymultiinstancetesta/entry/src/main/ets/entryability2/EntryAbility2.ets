import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEventManger from '@ohos.commonEventManager';

export default class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onCreate, want:' + JSON.stringify(want));
    AppStorage.setOrCreate<boolean>('onCreate', true);
    AppStorage.setOrCreate<string>('event', want.action);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag_appa', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag_appa', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onNewWant');
    AppStorage.setOrCreate<string>('event', want.action);
    AppStorage.setOrCreate<boolean>('onNewWant', true);
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onForeground');
    let events = AppStorage.get<string>('event');
    let onCreate = AppStorage.get<boolean>('onCreate');
    let onAcceptWant = AppStorage.get<number>('onAcceptWant');
    if (events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0900' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0300' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0500' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0700' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0100') {
      let onForeground = true;
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
        hilog.info(0x0000, 'testTag_appa', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    };
    if (events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0900_2' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0300_3' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0500_2' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0700_2' ||
      events == 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0100_2') {
      let secondOnForeground = true;
      let onNewWant = AppStorage.get<boolean>('onNewWant');
      let commonEventData: commonEventManger.CommonEventPublishData  = {
        parameters:{
          data: {
            onAcceptWant: onAcceptWant,
            onNewWant: onNewWant,
            secondOnForeground: secondOnForeground
          }
        }
      };
      commonEventManger.publish(events,commonEventData,(result)=>{
        hilog.info(0x0000, 'testTag_appa', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    };
    setTimeout(() => {
      this.context.terminateSelf();
    }, 5000);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag_appa', '%{public}s', 'Ability onBackground');
  }
}
