import events_emitter from '@ohos.events.emitter';
import { expect } from '../../../hypium/index';
import webview from '@ohos.web.webview';
import {loadAndSetUpUiTest } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

class Utils{
  static isLoadAndSetupUiTest = false;

  static async loadAndSetUpUiTest() : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      console.info(`loadAndSetUpUiTest, isLoadAndSetupUiTest: ${JSON.stringify(Utils.isLoadAndSetupUiTest)}`);
      try {
        if (!Utils.isLoadAndSetupUiTest) {
          loadAndSetUpUiTest();
          console.info(`loadAndSetUpUiTest, success`);
          Utils.isLoadAndSetupUiTest = true;
        }
        resolve(true)
      } catch(error: Error) {
        console.info(`UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
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

  static async emitEvent(actualValue: boolean | string | number | object, eventId: number) {
    try {
      console.info('Entry emitEvent, actualValue = ' + actualValue);
      let tempData: Record<string, Object> = {};
      tempData['ACTION'] = actualValue;
      let backData: events_emitter.EventData = {
        data: tempData
      }

      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.emit(backEvent, backData);
      console.info('Utils sleep start');
      await Utils.msSleep(2000)
      console.info('Finish emit, Utils sleep over');
    } catch (err) {
      console.info('webFlag emit action state err: ' + JSON.stringify(err));
    }
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: number,
    done: () => void, expectFunction: (backData: events_emitter.EventData, expected: Object) => void) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expectFunction(backData, expected);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack)
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: number, done: () => void) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done, (backData: events_emitter.EventData, expected: Object) => {
      console.info(`Begin to assert [` + backData?.data?.['ACTION'] + `] Equal [` + expected + `]`);
      expect(backData?.data?.['ACTION']).assertEqual(expected);
    });
  }

  static isPC(controller: webview.WebviewController): boolean {
    let userAgent: string = controller.getUserAgent();
    console.info('userAgent' + userAgent);

    try {
      let isPc: boolean = userAgent.includes('PC') || userAgent.toLowerCase().includes('pc') || userAgent.includes("2in1")
      console.log('device is pc:' + isPc)
      return isPc
    } catch (error) {
      console.info('userAgent error:' + error);
      return true
    }
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`UiTestCase, start abilityFinished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
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