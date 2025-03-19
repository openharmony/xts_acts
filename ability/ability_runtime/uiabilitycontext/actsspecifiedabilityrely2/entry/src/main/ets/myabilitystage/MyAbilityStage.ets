import { AbilityStage, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
const LOG_TAG = 'testTag';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onCreate');
    commonEventManager.publish('demo2_stage_create', {}, () => {});
  }

  onAcceptWant(want: Want): string {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onAcceptWant: ' + JSON.stringify(want));
    let flag: string = want.parameters?.flag as string;
    commonEventManager.publish('demo2_acceptWant', {}, () => {});
    if (flag) {
      return flag;
    }
    return 'default';
  }

  onNewProcessRequest(want: Want): string {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onNewProcessRequest: ' + JSON.stringify(want));
    let flag: string = want.parameters?.processFlag as string;
    commonEventManager.publish('demo2_onNewProcessRequest', {}, () => {});
    if (flag) {
      return flag;
    }
    return 'default';
  }

  onDestroy(): void {
    hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'AbilityStage onDestroy');
  }
}