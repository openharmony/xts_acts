import hilog from '@ohos.hilog';
import AbilityStage from '@ohos.app.ability.AbilityStage';

export default class TestAbilityStage extends AbilityStage {
  onCreate() {
    globalThis.appContext = this.context.getApplicationContext();
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbilityStage onCreate');
  }
}