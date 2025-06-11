import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class TestFormComAbility extends UIAbility {
  private xtsWindowStage: window.WindowStage | undefined;
  private wantUri: string = '';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.wantUri = want.uri ?? '';
    hilog.info(domain, tag, `TestFormComAbility onCreate, wantUri:${this.wantUri}`);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(domain, tag, 'TestFormComAbility onWindowStageCreate');
    this.xtsWindowStage = windowStage;
    try {
      this.xtsWindowStage?.loadContent('testform/pages/XtsFormComponent', (err: BusinessError<void>): void => {
        if (err.code) {
          hilog.info(domain, tag, 'TestFormComAbility loadContent error');
          return;
        }
        hilog.info(domain, tag, 'TestFormComAbility loadContent ok');
      });
    } catch (e: Error) {
      hilog.info(domain, tag, 'TestFormComAbility loadContent catch error：-----------' + e.message);
    }
  }
}