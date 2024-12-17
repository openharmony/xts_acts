/**
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { common, StartOptions, bundleManager } from '@kit.AbilityKit';
import ohosWindow from '@ohos.window';
import { Driver, On, ON, ResizeDirection, UiWindow } from '@ohos.UiTest';
import window from '@ohos.window';
import settings from '@ohos.settings';
import { BusinessError } from '@kit.BasicServicesKit';
import Want from '@ohos.app.ability.Want';
import StartAbility from '../testability/StartAbility';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions,) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(300)
  AppStorage.setOrCreate('startNum', startNum + 1)
  let windowStageStart = AppStorage.get('windowStageStart') as ohosWindow.WindowStage;
  return windowStageStart
}

async function terminateAbilityCycle(caseName: string) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  console.log(`${caseName} startNum = ${startNum}`)
  while (startNum) {
    let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
    await pageContext.terminateSelf().then(() => {
      console.log(`${caseName} terminateSelf success`);
      startNum -= 1
    }).catch((err: BusinessError) => {
      console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
    });
    await sleep(500)
  }
  AppStorage.delete('startNum')
}

async function terminateAbility(caseName: string) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  AppStorage.setOrCreate('startNum', startNum - 1)
  await sleep(300)
}

async function assertMaximizeComponentExist(windowState: number, windowRect?: window.Rect,
  windowClass?: window.Window) {
  let driver = Driver.create()
  if (windowState == 1) {
    await driver.mouseMoveTo({ x: 100, y: 0 })
  } else {
    await windowClass?.moveWindowToAsync(windowRect?.left, windowRect?.top)
  }
  let test = true
  await driver.assertComponentExist(ON.id('EnhanceMaximizeBtn')).then(() => {
    test = true
  }).catch((err: BusinessError) => {
    if (err.code == 17000003) {
      test = false
    }
  })
  return test
}


export default function windowInterface() {
  describe('windowInterface', () => {
    // let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isPCStatus: string = '';
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      context = AppStorage.get('context') as common.UIAbilityContext;
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: ${isPCStatus}`);
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await terminateAbilityCycle('afterEach')
      await sleep(300)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of
      // the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0100
     * @tc.name      : testSetWindowRectAutoSaveTrue_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0100', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0100';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect1)).assertEqual(JSON.stringify(windowRect2))
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0200
     * @tc.name      : testSetWindowRectAutoSaveTrue_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0200', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0200';
      let driver = Driver.create()
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(300)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility(message)
          await sleep(200)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect1)).assertEqual(JSON.stringify(windowRect2))
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0300
     * @tc.name      : testSetWindowRectAutoSaveTrue_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0300', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0300';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 最大化
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          windowClassStart = windowStageStart.getMainWindowSync()
          let windowStatusType = windowClassStart.getWindowStatus();
          console.info(`${message} windowStatusType = ${windowStatusType} , expect 2`)
          let isLayoutFullScreen = windowClassStart.getWindowProperties().isLayoutFullScreen
          console.info(`${message} isLayoutFullScreen = ${isLayoutFullScreen} , expect false`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // 窗口全屏，非沉浸式
          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE)
          expect(isLayoutFullScreen).assertFalse()
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0400
     * @tc.name      : testSetWindowRectAutoSaveTrue_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0400', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0400';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          await sleep(300)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 沉浸式
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect1)).assertEqual(JSON.stringify(windowRect2))
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0500
     * @tc.name      : testSetWindowRectAutoSaveTrue_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0500', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0500';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 最小化
          await windowClassStart.minimize()
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect1)).assertEqual(JSON.stringify(windowRect2))
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0600
     * @tc.name      : testSetWindowRectAutoSaveTrue_0600
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0600', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0600';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小一致
          expect(windowRect1.width).assertEqual(windowRect2.width)
          expect(windowRect1.height).assertEqual(windowRect2.height)
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0700
     * @tc.name      : testSetWindowRectAutoSaveTrue_0700
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0700', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0700';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（非沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          windowClassStart = windowStageStart.getMainWindowSync()
          let windowStatusType = windowClassStart.getWindowStatus();
          console.info(`${message} windowStatusType = ${windowStatusType} , expect 2`)
          let isLayoutFullScreen = windowClassStart.getWindowProperties().isLayoutFullScreen
          console.info(`${message} windowRect = ${JSON.stringify(windowClassStart.getWindowProperties()
            .windowRect)} , expect false`)
          console.info(`${message} isLayoutFullScreen = ${isLayoutFullScreen} , expect false`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)

          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE)
          expect(isLayoutFullScreen).assertFalse()
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0800
     * @tc.name      : testSetWindowRectAutoSaveTrue_0800
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0800', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0800';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          windowClassStart = windowStageStart.getMainWindowSync()
          let windowStatusType = windowClassStart.getWindowStatus();
          console.info(`${message} windowStatusType = ${windowStatusType} , expect 2`)
          let isLayoutFullScreen = windowClassStart.getWindowProperties().isLayoutFullScreen
          console.info(`${message} isLayoutFullScreen = ${isLayoutFullScreen} , expect false`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)

          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE)
          expect(isLayoutFullScreen).assertFalse()
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0100
     * @tc.name      : testSetWindowRectAutoSaveFalse_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0100', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0100';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect2)).assertEqual('{"left":585,"top":351,"width":2090,"height":1394}')
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0200
     * @tc.name      : testSetWindowRectAutoSaveFalse_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0200', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0200';
      let driver = Driver.create()
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(300)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility(message)
          await sleep(200)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect2)).assertEqual('{"left":585,"top":351,"width":2090,"height":1394}')
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0300
     * @tc.name      : testSetWindowRectAutoSaveFalse_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0300', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0300';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 最大化
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 窗口全屏，非沉浸式
          expect(JSON.stringify(windowRect2)).assertEqual('{"left":585,"top":351,"width":2090,"height":1394}')
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0400
     * @tc.name      : testSetWindowRectAutoSaveFalse_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0400', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0400';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 沉浸式
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect2)).assertEqual('{"left":585,"top":351,"width":2090,"height":1394}')
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0500
     * @tc.name      : testSetWindowRectAutoSaveFalse_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0500', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0500';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 最小化
          await windowClassStart.minimize()
          // 关闭Ability
          await terminateAbility(message)
          await sleep(300)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小位置一致
          expect(JSON.stringify(windowRect2)).assertEqual('{"left":585,"top":351,"width":2090,"height":1394}')
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0600
     * @tc.name      : testSetWindowRectAutoSaveFalse_0600
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0600', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0600';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小一致
          expect(windowRect2.width).assertEqual(2091)
          expect(windowRect2.height).assertEqual(1394)
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    
    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0700
     * @tc.name      : testSetWindowRectAutoSaveFalse_0700
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0700', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0700';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（非沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小一致
          expect(windowRect2.width).assertEqual(2091)
          expect(windowRect2.height).assertEqual(1394)
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0800
     * @tc.name      : testSetWindowRectAutoSaveFalse_0800
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0800', 0, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0800';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = false
      try {
        await windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小一致
          expect(windowRect2.width).assertEqual(2091)
          expect(windowRect2.height).assertEqual(1394)
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0100
     * @tc.name      : testStartOptionsSupportWindowModes_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0100', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0100';
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FULL_SCREEN,
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FULL_SCREEN
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 全屏
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 2`);
        expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
        // 判断是否存在最大化 - false
        let test = await assertMaximizeComponentExist(windowStatus)

        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0200
     * @tc.name      : testStartOptionsSupportWindowModes_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0200', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0200';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(300)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await driver.click(2340, 977);
        await sleep(500)
        expect(windowStatus).assertEqual(window.windowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0300
     * @tc.name      : testStartOptionsSupportWindowModes_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0300', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0300';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，可触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(300)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0400
     * @tc.name      : testStartOptionsSupportWindowModes_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0400', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0400';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING,
          bundleManager.SupportWindowMode.SPLIT
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(300)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await driver.click(2340, 977);
        await sleep(500)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0500
     * @tc.name      : testStartOptionsSupportWindowModes_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0500', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0500';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING,
          bundleManager.SupportWindowMode.FULL_SCREEN
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 模拟用户移动窗口到左边缘，无法触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(300)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        await driver.click(2340, 977);
        await sleep(500)
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0600
     * @tc.name      : testStartOptionsSupportWindowModes_0600
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0600', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0600';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 点击最大化
        let maxButton = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
        await maxButton.click()
        await sleep(300)
        // 获取窗口状态 - 全屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 2`);
        expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
        // 判断是否存在最大化 - false
        test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，可触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 5000)
        await sleep(300)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await driver.click(2340, 977);
        await sleep(500)
        expect(windowStatus).assertEqual(window.windowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0700
     * @tc.name      : testStartOptionsSupportWindowModes_0700
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0700', 0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0700';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.windowStatusType.FLOATING);
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 点击最大化
        let maxButton = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
        await maxButton.click()
        await sleep(300)
        // 获取窗口状态 - 全屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 2`);
        expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
        // 判断是否存在最大化 - true
        test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(200)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 模拟用户移动窗口到左边缘，可触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 5000)
        await sleep(300)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await driver.click(2340, 977);
        await sleep(500)
        expect(windowStatus).assertEqual(window.windowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })


    /**
     * @tc.number    : testisWindowRectAutoSave
     * @tc.name      : testisWindowRectAutoSave
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testisWindowRectAutoSave', 0, async (done: Function) => {
      const message = 'isWindowRectAutoSaveTest';
      windowStage.setWindowRectAutoSave(true)
      await sleep(500);
      try {
        windowStage.isWindowRectAutoSave().then((result) => {
          console.info(`${message} isWindowRectAutoSave = ${result}, expect true.`)
          expect(result).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
      windowStage.setWindowRectAutoSave(false)
      await sleep(500);
      try {
        windowStage.isWindowRectAutoSave().then((result) => {
          console.info(`${message} isWindowRectAutoSave = ${result}, expect false.`)
          expect(result).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testStartMoving_0100
     * @tc.name      : testStartMoving_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0100', 0, async (done: Function) => {
      const message = 'startMovingTest_0100';
      let windowClass = windowStage.getMainWindowSync();
      windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
      await sleep(300)
      let driver = Driver.create();
      await sleep(300)
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      let blank = await driver.findComponent(ON.id('startMoving'))
      await sleep(300)
      let point = await blank.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
      let text = await driver.findComponent(ON.id('startMovingText'));
      await sleep(200)
      let textDragged = await text.getText()
      if (textDragged == 'startMoving success') {
        let windowPointDragged = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
        expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
        expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
        done()
      } else if (textDragged == 'startMoving 801') {
        expect(true).assertTrue();
        done()
      } else {
        console.error(`${message} Error`);
        expect(true).assertFalse()
        done()
      }
    })

    /**
     * @tc.number    : testStartMoving_0200
     * @tc.name      : testStartMoving_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0200', 0, async (done: Function) => {
      const message = 'startMovingTest_0200';
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('subWindow', options).then(async (data) => {
        let windowClass = data
        windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200)
        windowClass.showWindow()
        await sleep(300)
        let driver = Driver.create();
        await sleep(300)
        let windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        let blank = await driver.findComponent(ON.id('startMoving'))
        await sleep(300)
        let point = await blank.getBoundsCenter();
        await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
        let text = await driver.findComponent(ON.id('startMovingText'));
        await sleep(200)
        let textDragged = await text.getText()
        if (textDragged == 'startMoving success') {
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
          expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
          expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
        } else if (textDragged == 'startMoving 801') {
          expect(true).assertTrue();
        } else {
          console.error(`${message} Error`);
          expect(true).assertFalse()
        }
        windowClass.destroyWindow()
        // await sleep(10000)
        done();
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          expect(false).assertFalse();
        } else {
          console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertFalse();
        }
        done();
      })
    })

    /**
     * @tc.number    : testStartMoving_0300
     * @tc.name      : testStartMoving_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0300', 0, async (done: Function) => {
      const message = 'startMovingTest_0300';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      try {
        windowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(300)
          let driver = Driver.create();
          await sleep(300)
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          let blank = await driver.findComponent(ON.id('startMoving'))
          await sleep(300)
          let point = await blank.getBoundsCenter();
          await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
          let text = await driver.findComponent(ON.id('startMovingText'));
          await sleep(200)
          let textDragged = await text.getText()
          if (textDragged == 'startMoving success') {
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
            expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
            expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
          } else if (textDragged == 'startMoving 801') {
            expect(true).assertTrue();
          } else {
            console.error(`${message} Error`);
            expect(true).assertFalse()
          }
          windowClass.destroyWindow()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertFalse();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0100
     * @tc.name      : testSetWindowTitleMoveEnabled_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0100', 0, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0100';
      let windowClass = windowStage.getMainWindowSync();
      let driver = await Driver.create()
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
      await sleep(300)
      windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      try {
        windowClass.setWindowTitleMoveEnabled(false);
        console.info(`${message} setWindowTitleMoveEnabled`)
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(300)
        let windowPointDragged = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
        await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
        await sleep(300)
        let windowPointClicked = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventClicked = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
        done();
      } catch (exception) {
        if (exception.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
          done();
        }
      }

    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0200
     * @tc.name      : testSetWindowTitleMoveEnabled_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0200', 0, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0200';
      let windowClass = windowStage.getMainWindowSync();
      let driver = await Driver.create()
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
      await sleep(300)
      windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      try {
        windowClass.setWindowDecorVisible(false)
        windowClass.setWindowTitleMoveEnabled(false);
        console.info(`${message} setWindowTitleMoveEnabled`)
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(300)
        let windowPointDragged = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
        await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
        let windowPointClicked = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
        windowClass.setWindowDecorVisible(true)
        done();
      } catch (exception) {
        if (exception.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
          done();
        }
      }

    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0300
     * @tc.name      : testSetWindowTitleMoveEnabled_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0300', 0, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0300';
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('subWindow', options).then(async (data) => {
        let windowClass = data
        windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200)
        windowClass.showWindow()
        await sleep(300)
        let driver = await Driver.create()
        let windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(300)
        windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        try {
          windowClass.setWindowTitleMoveEnabled(false);
          console.info(`${message} setWindowTitleMoveEnabled`)
          await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
          await sleep(300)
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
          expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
          await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
          let windowPointClicked = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
          expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
        } catch (exception) {
          if (exception.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail()
            done();
          }
        }
        windowClass.destroyWindow()
        done();
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          expect(false).assertFalse();
        } else {
          console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertFalse();
        }
        done();
      })
    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0400
     * @tc.name      : testSetWindowTitleMoveEnabled_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0400', 0, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0400';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      try {
        windowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(300)
          let driver = await Driver.create()
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
          await sleep(300)
          windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          try {
            windowClass.setWindowDecorVisible(false)
            windowClass.setWindowTitleMoveEnabled(false);
            console.info(`${message} setWindowTitleMoveEnabled`)
            await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200,
              windowPoint.top + 150)
            await sleep(300)
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
            expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
            await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
            let windowPointClicked = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
            expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
          } catch (exception) {
            if (exception.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              expect(true).assertTrue();
              done();
            } else {
              console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail()
              done();
            }
          }
          windowClass.destroyWindow()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
          }
          done();
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertFalse();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0500
     * @tc.name      : testSetWindowTitleMoveEnabled_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0500', 0, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0500';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: false
      };
      try {
        windowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(300)
          let driver = await Driver.create()
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          try {
            windowClass.setWindowTitleMoveEnabled(true);
            console.info(`${message} setWindowTitleMoveEnabled`)
            await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200,
              windowPoint.top + 150)
            await sleep(500)
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPointDragged = ${JSON.stringify(windowPointDragged)}`)
            expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
          } catch (exception) {
            if (exception.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              expect(true).assertTrue();
              done();
            } else {
              console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail()
              done();
            }
          }
          windowClass.destroyWindow()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
          }
          done();
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertFalse();
        done();
      }
    })

    /**
     * @tc.number    : testSetSubWindowModalModalityType_0100
     * @tc.name      : testSetSubWindowModalModalityType_0100
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0100', 0, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0100';
      let windowClass = windowStage.getMainWindowSync()
      windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      let btnCenter = await btn.getBoundsCenter()
      try {
        let subWindow = windowStage.createSubWindow("testSubWindow");
        subWindow.then(async (data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            return;
          }
          let windowClass = data;
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(100, 100)
          await windowClass.showWindow()
          let promise = windowClass.setSubWindowModal(true, window.ModalityType.WINDOW_MODALITY);
          promise.then(async () => {
            console.info(`${message} setSubWindowModal success`)
            await driver.click(btnCenter.x, btnCenter.y)
            let btnText = await btn.getText()
            console.info(`${message} btnText = ${btnText}, expect Modality`)
            expect(btnText).assertEqual('Modality')
            windowClass.destroyWindow()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              expect(false).assertFalse()
            } else {
              console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail()
            }
          });
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })
    /**
     * @tc.number    : testSetSubWindowModalModalityType_0200
     * @tc.name      : testSetSubWindowModalModalityType_0200
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0200', 0, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0200';
      let windowClass = windowStage.getMainWindowSync()
      windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      let btnCenter = await btn.getBoundsCenter()
      try {
        let subWindow = windowStage.createSubWindow("testSubWindow");
        subWindow.then(async (data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            return;
          }
          let windowClass = data;
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(100, 100)
          await windowClass.showWindow()
          let promise = windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY);
          promise.then(async () => {
            console.info(`${message} setSubWindowModal success`)
            await driver.click(btnCenter.x, btnCenter.y)
            let btnText = await btn.getText()
            console.info(`${message} btnText = ${btnText}, expect Modality`)
            expect(btnText).assertEqual('Modality')
            windowClass.destroyWindow()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              expect(false).assertFalse()
            } else {
              console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail()
            }
          });
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number    : testSetSubWindowModalModalityType_0300
     * @tc.name      : testSetSubWindowModalModalityType_0300
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0300', 0, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0400';
      let windowClass = windowStage.getMainWindowSync()
      try {
        let promise = windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY);
        promise.then(() => {
          console.info(`${message} setSubWindowModal success`)
          expect().assertFail()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse()
          } else if (err.code == 1300004) {
            console.error(`${message} Unauthorized operation.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }

      done()
    })

    /**
     * @tc.number    : testSetSubWindowModalModalityType_0400
     * @tc.name      : testSetSubWindowModalModalityType_0400
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0400', 0, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0300';
      try {
        let subWindow = windowStage.createSubWindow("testSubWindow");
        subWindow.then((data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            return;
          }
          let windowClass = data
          let promise = windowClass.setSubWindowModal(false, window.ModalityType.APPLICATION_MODALITY);
          promise.then(() => {
            console.info(`${message} setSubWindowModal success`)
            expect().assertFail()
          }).catch((err: BusinessError) => {
            if (err.code == 401) {
              console.info(`${message} Parameter error.`);
              expect(false).assertFalse()
            } else {
              console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail()
            }
          });
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })



    /**
     * @tc.number    : testCreateSubWindowWithOptionsModalityType_0100
     * @tc.name      : testCreateSubWindowWithOptionsModalityType_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindowWithOptionsModalityType_0100', 0, async (done: Function) => {
      const message = 'testCreateSubWindowWithOptionsModalityType_0100';
      let windowClass = windowStage.getMainWindowSync()
      windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(300)
      let btnCenter = await btn.getBoundsCenter()
      let options: window.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: window.ModalityType.WINDOW_MODALITY
      };
      try {
        windowStage.createSubWindowWithOptions('mySubWindow', options).then(async (windowClass) => {
          console.info(`${message} setSubWindowModal success`)
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(100, 100)
          await windowClass.showWindow()
          await driver.click(btnCenter.x, btnCenter.y)
          let btnText = await btn.getText()
          console.info(`${message} btnText = ${btnText}, expect Modality`)
          expect(btnText).assertEqual('Modality')
          windowClass.destroyWindow()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number    : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.name      : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindowWithOptionsModalityType_0200', 0, async (done: Function) => {
      const message = 'testCreateSubWindowWithOptionsModalityTypeTest_0200';
      let windowClass = windowStage.getMainWindowSync()
      windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver = await Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      let btnCenter = await btn.getBoundsCenter()
      let options: window.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: window.ModalityType.APPLICATION_MODALITY
      };
      try {
        windowStage.createSubWindowWithOptions('mySubWindow', options).then(async (windowClass) => {
          console.info(`${message} setSubWindowModal success`)
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(100, 100)
          await windowClass.showWindow()
          await driver.click(btnCenter.x, btnCenter.y)
          let btnText = await btn.getText()
          console.info(`${message} btnText = ${btnText}, expect Modality`)
          expect(btnText).assertEqual('Modality')
          windowClass.destroyWindow()
        }).catch((err: BusinessError) => {
          if (err.code == 401) {
            console.info(`${message}  Parameter error.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number    : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.name      : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindowWithOptionsModalityType_0300', 0, async (done: Function) => {
      const message = 'testCreateSubWindowWithOptionsModalityTypeTest_0300';
      let options: window.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: false,
        modalityType: window.ModalityType.APPLICATION_MODALITY
      };
      try {
        windowStage.createSubWindowWithOptions('mySubWindow', options).then(() => {
          console.info(`${message} setSubWindowModal success`)
          expect().assertFail()
        }).catch((err: BusinessError) => {
          if (err.code == 401) {
            console.info(`${message}  Parameter error.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        if (exception.code == 401) {
          console.info(`${message}  Parameter error.`);
          expect(false).assertFalse()
        } else {
          console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
        }
      }
      done()
    })

  })
}