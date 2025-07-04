import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const waitUiReadyMs : number = 1000;
const TestTag = 'UitestDriverErrorTest';
const AsyncErrorCode = 17000002;
const ParameterErrorCode = 17000007;
const CapabilityCode = 801;
const ErrorCode = 401;

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
  setTimeout(() => {
  resolve(0)
}, count)
})
}

export default function uitestDriverErrorTest() {
  describe('uitestDriverErrorTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverErrorTest loadup start!!!!!")
      await Utils.loadAndSetUpUiTest();
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestDriverErrorTest loadup over!!!!!")
    })

    /*
     * @tc.number: uitestDriverErrorTest_001
     * @tc.name: test_assertComponentExist_17000003_static
     * @tc.desc: assertComponentExist 17000003 test.
     */
    it('test_assertComponentExist_17000003_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_assertComponentExist_17000003_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        await driver.assertComponentExist(ON.text('NotTest'));
        await driver.delayMs(waitUiReadyMs);
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_assertComponentExist_17000003_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000003);
      }
      await sleep(1000);
      console.log(`${TestTag}, test_assertComponentExist_17000003_static end`);
    })

  })
}