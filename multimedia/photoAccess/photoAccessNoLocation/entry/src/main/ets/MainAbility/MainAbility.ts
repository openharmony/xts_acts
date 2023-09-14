import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility extends Ability {
  onCreate(want, launchParam) : void {
    // Ability is creating, initialize resources for this ability
    console.log('[Demo] MainAbility onCreate');
    globalThis.abilityWant = want;
  }

  onDestroy() : void {
    // Ability is destroying, release resources for this ability
    console.log('[Demo] MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage) : void {
    console.log('[Demo] MainAbility onWindowStageCreate windowStage=' + windowStage);
    globalThis.windowStage = windowStage;
    globalThis.abilityContext = this.context;
    windowStage.setUIContent(this.context, 'MainAbility/pages/index/index', null);
  }

  onWindowStageDestroy() : void {
    //Main window is destroyed, release UI related resources
    console.log('[Demo] MainAbility onWindowStageDestroy');
  }

  onForeground() : void {
    // Ability has brought to foreground
    console.log('[Demo] MainAbility onForeground');
  }

  onBackground() : void {
    // Ability has back to background
    console.log('[Demo] MainAbility onBackground');
  }
};