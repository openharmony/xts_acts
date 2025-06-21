import { expect } from "../../../hypium/index";
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import HashMap from '@ohos.util.HashMap';
import { loadAndSetUpUiTest } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let testAbilityContext:common.UIAbilityContext;
abilityDelegator.addAbilityMonitor({
  abilityName: "EntryAbility",
  moduleName:"entry",
  onAbilityCreate: (abilitys : UIAbility) : void => {
    testAbilityContext = abilitys.context
    hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreate end');

  },
}, (err : BusinessError) : void => {
  if (err != null ) {
    hilog.info(0x0000, 'testTag', '%{public}s', '-----'+ err.code);
  }
  hilog.info(0x0000, 'testTag', '%{public}s', 'BusinessError  end');
});

class Utils{
  static isLoadAndSetupUiTest = false;
  static async loadAndSetUpUiTest() : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      hilog.info(0x0000, 'testTag', `loadAndSetupUiTest, isLoadAndSetupUiTest: ${JSON.stringify(Utils.isLoadAndSetupUiTest)}`);
      try {
        if (!Utils.isLoadAndSetupUiTest) {
          loadAndSetUpUiTest();
          hilog.info(0x0000, 'testTag', `loadAndSetupUiTest, success`);
          Utils.isLoadAndSetupUiTest = true;
        }
        resolve(true)
      } catch(error: Error) {
        hilog.info(0x0000, 'testTag', `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
        reject(error)
      }
    })
  }

  static sleep(numberMillis: int) {
    const exitTime = new Date().getTime() + numberMillis;
    while (new Date().getTime() < exitTime) {}
    return;
  }

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: number, done: () => void) {
    hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " start expectValue=" + JSON.stringify(expectedValue));
    try {
      let callBack = (backData: emitter.EventData) => {
        try {
          hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " get result is: " + JSON.stringify(backData));
          expect(backData?.data?.get("ACTION")).assertEqual(expectedValue);
          hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " END");
        } catch (err) {
          hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " err: " + JSON.stringify(err));
        }
        // done();
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: eventId
      }
      emitter.on(innerEvent, callBack)
    } catch (err) {
      hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " err: " + JSON.stringify(err));
    }
  }

  static emitEvent(actVal: boolean | string | number | object, eId: number) {
    try {
      let recordData: Record<string, object> = {
        "ACTION": actVal
      }
      let backData: emitter.EventData = {
        data: recordData
      }
      let backEvent: emitter.InnerEvent = {
        eventId: eId
      }
      hilog.info(0x0000, 'testTag', "webFlag start to emit action state, eventId=" + eId + " actVal=" + actVal);
      emitter.emit(backEvent, backData);
    } catch (err) {
      hilog.info(0x0000, 'testTag', "webFlag emit action state err: " + JSON.stringify(err));
    }
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    hilog.info(0x0000, 'testTag', `UiTestCase, start abilityFinished`);
    return true;
  } catch(error) {
    hilog.info(0x0000, 'testTag', `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    hilog.info(0x0000, 'testTag', `UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    hilog.info(0x0000, 'testTag', `UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

export {
  Utils,
  startAbility,
  stopApplication
}