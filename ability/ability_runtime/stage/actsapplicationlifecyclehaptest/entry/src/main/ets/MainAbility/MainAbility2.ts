import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import commonEventManager from '@ohos.commonEvent';

let EVENT_TIME = 1000;

export default class TestAbility2 extends UIAbility {
  onCreate(want, launchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    this.context.terminateSelf();
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
    setTimeout(() => {
      commonEventManager.publish('MainAbility2_onDestroy', () => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility commonEventManager publish success');
      });
    }, EVENT_TIME);
  }

  onWindowStageCreate(windowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}