
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
const unsubscribeCallback = (tcNumber: string) => {
  console.info(`====>${tcNumber} unsubscribeCallback====>`);
}
let subscriberForm: CommonEventManager.CommonEventSubscriber;
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag Utils'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async executeCmd(cmdTest: string, grepLog: string = 'StsSetAction'): Promise<boolean> {
    let data: abilityDelegatorRegistry.ShellCmdResult = await abilityDelegator.executeShellCommand(cmdTest);
    if (data === null || data === undefined || !data) {
      hilog.info(domain, tag, 'cmdTest executeShellCommand failed');
      return false;
    }
    let message: string = data.stdResult;
    hilog.info(domain, tag, 'cmdTest result: %{public}s', message);
    if (message.includes(grepLog)) {
      hilog.info(domain, tag, 'cmdTest success');
      return true;
    }
    hilog.info(domain, tag, 'cmdTest failed');
    return false;
  }

  static startAbility(abilityName: string = "TestFormAbility",
                      bundleName: string = "com.example.helloworld",
                      uri?: string): boolean {
    let isSuccessStartAbility: boolean = false;
    try {
      abilityDelegator.startAbility({
        abilityName: abilityName,
        // use unified ability when push.url ready.
        uri: uri,
        bundleName: bundleName,
      }).then(() => {
        hilog.info(domain, tag, `start ${abilityName} success.`);
        isSuccessStartAbility = true;
        // return true;
      });
      await Utils.msSleep(500);
    } catch (error: BusinessError) {
      hilog.error(domain, tag, `start ${abilityName} fail. message: ${error?.message}`);
      return false;
    }
    if (isSuccessStartAbility) {
      return true;
    }
    hilog.error(domain, tag, `start ${abilityName} timeout so failed.`);
    return false;
  }

}