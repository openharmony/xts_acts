import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, loadAndSetUpUiTest } from '@ohos.UiTest'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;
let bundle_name:string = "com.example.actsnotificationpublish.static"

export default function abilityTest() {

  describe("abilityTest", (): void => {
    hilog.info(domain, TAG, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      loadAndSetUpUiTest();
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /*
     * @tc.number    : abilityTest001
     * @tc.name      : abilityTest001
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it("abilityTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {

      await Utils.msSleep(1000)
      hilog.info(domain, TAG, '%{public}s', 'abilityTest001 start');
      if (testAbilityContext) {
        let str1:string = testAbilityContext.filesDir
        hilog.info(domain, TAG, '%{public}s', 'abilityTest001 testAbilityContext fileDir' + str1);
      }
      await Utils.msSleep(1000)
      hilog.info(domain, TAG, '%{public}s', 'abilityTest001');
      done()
      hilog.info(domain, TAG, '%{public}s', 'abilityTest001 end');
    })

  })

}