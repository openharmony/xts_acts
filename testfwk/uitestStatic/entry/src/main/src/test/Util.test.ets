import {loadAndSetUpUiTest } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  hilog  from '@ohos.hilog'

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class Utils{
  static isLoadAndSetUpUiTest = false;

  static async loadAndSetUpUiTest() : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      hilog.info(domain, tag, `loadAndSetUpUiTest, isloadAndSetUpUiTest: ${JSON.stringify(Utils.isLoadAndSetUpUiTest)}`);
      try {
        if (!Utils.isLoadAndSetUpUiTest) {
          hilog.info(domain, tag, `loadAndSetUpUiTest start`);
          loadAndSetUpUiTest();
          hilog.info(domain, tag, `loadAndSetUpUiTest, success`);
          Utils.isLoadAndSetUpUiTest = true;
        }
        resolve(true)
      } catch(error: Error) {
        hilog.info(domain, tag, `loadAndSetUpUiTest error, : ${JSON.stringify(error)}`);
        reject(error)
      }
    })
  }

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`UiTestCase, start abilityFinished`);
    hilog.info(domain, tag, `UiTestCase, start abilityFinished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
    hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    console.info(`UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

export {
  Utils,
  startAbility,
  stopApplication
}