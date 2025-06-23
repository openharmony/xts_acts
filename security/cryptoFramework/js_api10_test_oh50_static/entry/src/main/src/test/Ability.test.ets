import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    // let str1:string = abilitys.context.filesDir
                    // hilog.info(domain, tag, '%{public}s', 'beforeAll fileDir' + str1);
                    // if (abilitys.context) {
                    //     hilog.info(domain, tag, '%{public}s', 'beforeAll context');
                    //     if (abilitys.context.resourceManager) {}
                    // }
                    // abilityss.context.terminateSelf()
                    testAbilityContext = abilitys.context
                    hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError) : void => {
                if (err != null ) {
                    hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
                }
                hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        it("abilityTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {

            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 start');
            if (testAbilityContext) {
                let str1:string = testAbilityContext.filesDir
                hilog.info(domain, tag, '%{public}s', 'abilityTest001 testAbilityContext fileDir' + str1);
                // if (abilitys.context.resourceManager) {}
            }
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001');
            done()
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 end');
        })
    })

}