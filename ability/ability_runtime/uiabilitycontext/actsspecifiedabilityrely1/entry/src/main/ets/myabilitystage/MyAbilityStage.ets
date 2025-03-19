import { AbilityStage, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
const LOG_TAG = 'testTag';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onCreate');
  }

  onAcceptWant(want: Want): string {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onAcceptWant: ' + JSON.stringify(want));
    let flag: string = want.parameters?.flag as string;
    commonEventManager.publish('StartSpecifiedAbility_OnAcceptWant', {}, () => {});
    if (flag) {
      return flag;
    }
    return 'default';
  }

  onNewProcessRequest(want: Want): string {
    let flag: string = want.parameters?.processFlag as string;
    if (flag) {
      return flag;
    }
    return 'default';
  }
}