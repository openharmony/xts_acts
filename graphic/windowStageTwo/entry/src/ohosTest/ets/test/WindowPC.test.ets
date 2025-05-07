/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';
import { StartOptions } from '@kit.AbilityKit';
import type Want from '@ohos.app.ability.Want';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility2(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let key1 = 'AAAABBBBtest1';
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility2',
    parameters: { // 自定义信息
      instanceKey: key1,
    }
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest2') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility2(caseName: string) {
  let pageContext = AppStorage.get('contextTest2') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowPCTest() {
  describe('windowPCTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0100
     * @tc.name      : test_setWindowRectAutoSave_401
     * @tc.desc      : test_setWindowRectAutoSave_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_setWindowRectAutoSave_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_setWindowRectAutoSave_401';
      console.log(caseName + 'begin');
      try{
        windowStage.setWindowRectAutoSave(null,null);
        expect().assertFail()
        done();
      } catch(err) {
        console.log(`${caseName} :setWindowRectAutoSave fail1:`+err.code);
        expect(err.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0200
     * @tc.name      : test_setWindowRectAutoSave_801
     * @tc.desc      : test_setWindowRectAutoSave_801
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_setWindowRectAutoSave_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_setWindowRectAutoSave_801';
      console.log(caseName + 'begin');
      try{
        windowStage.setWindowRectAutoSave(true, true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          done()
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          if (err.code === 801) {
            done();
          } else {
            expect().assertFail()
            done()
          }
        });
      } catch(err) {
        console.log(`${caseName} :setWindowRectAutoSave fail1:`+err.code);
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0300
     * @tc.name      : test_setWindowRectAutoSave_1300002
     * @tc.desc      : test_setWindowRectAutoSave_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_setWindowRectAutoSave_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_setWindowRectAutoSave_1300002';
      console.log(caseName + 'begin');
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowStageStart = await startAbility2(caseName, context);
      await terminateAbility2(caseName);
      try {
        await windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowRectAutoSave.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowRectAutoSave. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0100
     * @tc.name      : test_SetWindowRectAutoSave_0100
     * @tc.desc      : test_SetWindowRectAutoSave_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SetWindowRectAutoSave_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0100 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          mainWindow.moveWindowToAsync(300, 400)
          mainWindow.resizeAsync(1000, 1200);
          await sleep(300);
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0200
     * @tc.name      : test_SetWindowRectAutoSave_0200
     * @tc.desc      : test_SetWindowRectAutoSave_0200
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SetWindowRectAutoSave_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0200 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200);
          await sleep(300);
          let driver: Driver = Driver.create()
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          await sleep(1000)
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(1000)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0300
     * @tc.name      : test_SetWindowRectAutoSave_0300
     * @tc.desc      : test_SetWindowRectAutoSave_0300
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SetWindowRectAutoSave_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0300 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          let windowStatusType = mainWindow2.getWindowStatus()
          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE)
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0400
     * @tc.name      : test_SetWindowRectAutoSave_0400
     * @tc.desc      : test_SetWindowRectAutoSave_0400
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SetWindowRectAutoSave_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0400 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0500
     * @tc.name      : test_SetWindowRectAutoSave_0500
     * @tc.desc      : test_SetWindowRectAutoSave_0500
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SetWindowRectAutoSave_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0500 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.minimize()
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0600
     * @tc.name      : test_SetWindowRectAutoSave_0600
     * @tc.desc      : test_SetWindowRectAutoSave_0600
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SetWindowRectAutoSave_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0600 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0700
     * @tc.name      : test_SetWindowRectAutoSave_0700
     * @tc.desc      : test_SetWindowRectAutoSave_0700
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SetWindowRectAutoSave_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0700 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          let driver: Driver = Driver.create()
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          await sleep(1000)
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(1000)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0800
     * @tc.name      : test_SetWindowRectAutoSave_0800
     * @tc.desc      : test_SetWindowRectAutoSave_0800
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SetWindowRectAutoSave_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0800 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0900
     * @tc.name      : test_SetWindowRectAutoSave_0900
     * @tc.desc      : test_SetWindowRectAutoSave_0900
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SetWindowRectAutoSave_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0900 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_1000
     * @tc.name      : test_SetWindowRectAutoSave_1000
     * @tc.desc      : test_SetWindowRectAutoSave_1000
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SetWindowRectAutoSave_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_1000 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.minimize()
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

  })
}