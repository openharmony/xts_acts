import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';


export default class OtherAbility extends UIAbility {
  AsyncCallback_0300: number= 0;
  onCreate(want, launchParam) {
    console.log('=====> OtherAbility onCreate =====>');
  }

  onDestroy() {
    console.log('=====> OtherAbility onDestroy =====>');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log('=====> OtherAbility onWindowStageCreate =====>');
    windowStage.loadContent('pages/IndexTwo', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('=====> OtherAbility onWindowStageDestroy =====>');
  }

  onForeground() {
    console.log('=====> OtherAbility onForeground =====>');
      this.AsyncCallback_0300++;
      console.log(`=====> OtherAbility AsyncCallback_0300 count: ${this.AsyncCallback_0300}`);
      if (this.AsyncCallback_0300 === 2) {
        this.context.terminateSelfWithResult({
          resultCode: 0,
          want: {
            parameters: {
              action: 'ACTION'
            }
          }
        }, (err) => {
          console.log('=====> OtherAbility CalledAbilityCallBack terminateSelfWithResult =====>' + err.code);
        })
      }
  }

  onBackground() {
    // Ability has back to background
    console.log('=====> OtherAbility onBackground =====>');
  }
}
