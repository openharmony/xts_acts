/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { display } from '@kit.ArkUI';

export default function windowKeyBorad() {
  describe('windowKeyBorad', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    beforeAll(async () => {
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
      let mainWindow =  windowStage.getMainWindowSync();
      await mainWindow.setUIContent('testability/pages/WindowTest/KeyBoradTest');
      await sleep(1000);
      let driver: Driver = Driver.create();
      await sleep(1000);
      let input = await driver.findComponent(ON.id('textInput'));
      await sleep(1000);
      await input.click();
      await sleep(1000);
      let text = await driver.findComponent(ON.text('下一步'));
      await sleep(1000);
      if (text) {
        await text.click();
      }
      await driver.pressBack();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
      let mainWindow =  windowStage.getMainWindowSync();
      await mainWindow.setUIContent('testability/pages/Index');
      await sleep(1000);
    });


    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_0100
     * @tc.name      : testMainWindow_onKeyboradWillShow
     * @tc.desc      : 主窗监听onKeyboardWillShow后拉起固定态输入法键盘触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainWindow_onKeyboradWillShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainWindow_onKeyboradWillShow ';
      console.log(caseName + 'begin');
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          done();
        }
        let mainWindow = windowStage.getMainWindowSync();
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
          let displayInfo = display.getDefaultDisplaySync();
          console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
          expect(keyboardInfo.beginRect.left).assertEqual(0);
          expect(keyboardInfo.beginRect.top).assertEqual(displayInfo.height);
          expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.beginRect.height).assertLarger(0);
          expect(keyboardInfo.endRect.left).assertEqual(0);
          expect(keyboardInfo.endRect.top + keyboardInfo.endRect.height).assertEqual(displayInfo.height);
          expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.height).assertLarger(0);
          expect(keyboardInfo.animated).assertEqual(true);
          expect(keyboardInfo.config?.curve).assertEqual(1);
          expect(keyboardInfo.config?.duration).assertLarger(0);
          if (keyboardInfo.config?.param != null) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFalse();
          }
        }
        mainWindow.on('keyboardWillShow', callback);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        mainWindow.off('keyboardWillShow');
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_0200
     * @tc.name      : testSubWindow_onKeyboradWillShow
     * @tc.desc      : 子窗监听onKeyboardWillShow后拉起固定态输入法键盘触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSubWindow_onKeyboradWillShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSubWindow_onKeyboradWillShow ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('testSubWindow_onKeyboradWillShow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow()
          done();
        }
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
          let displayInfo = display.getDefaultDisplaySync();
          console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
          expect(keyboardInfo.beginRect.left).assertEqual(0);
          expect(keyboardInfo.beginRect.top).assertEqual(displayInfo.height);
          expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.beginRect.height).assertLarger(0);
          expect(keyboardInfo.endRect.left).assertEqual(0);
          expect(keyboardInfo.endRect.top + keyboardInfo.endRect.height).assertEqual(displayInfo.height);
          expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.height).assertLarger(0);
          expect(keyboardInfo.animated).assertEqual(true);
          expect(keyboardInfo.config?.curve).assertEqual(1);
          expect(keyboardInfo.config?.duration).assertLarger(0);
          if (keyboardInfo.config?.param != null) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFalse();
          }
        }
        subWindowClass.on('keyboardWillShow', callback);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        subWindowClass.off('keyboardWillShow');
        await subWindowClass.destroyWindow()
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_0300
     * @tc.name      : testSystemWindow_onKeyboradWillShow
     * @tc.desc      : 系统dialog窗监听onKeyboardWillShow后拉起固定态输入法键盘触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSystemWindow_onKeyboradWillShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSystemWindow_onKeyboradWillShow ';
      console.log(caseName + 'begin');
      let config: window.Configuration = {
        name: "testSystemWindow_onKeyboradWillShow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      const subWindowClass = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the dialog window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow()
          done();
        }
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
          let displayInfo = display.getDefaultDisplaySync();
          console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
          expect(keyboardInfo.beginRect.left).assertEqual(0);
          expect(keyboardInfo.beginRect.top).assertEqual(displayInfo.height);
          expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.beginRect.height).assertLarger(0);
          expect(keyboardInfo.endRect.left).assertEqual(0);
          expect(keyboardInfo.endRect.top + keyboardInfo.endRect.height).assertEqual(displayInfo.height);
          expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.height).assertLarger(0);
          expect(keyboardInfo.animated).assertEqual(true);
          expect(keyboardInfo.config?.curve).assertEqual(1);
          expect(keyboardInfo.config?.duration).assertLarger(0);
          if (keyboardInfo.config?.param != null) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFalse();
          }
        }
        subWindowClass.on('keyboardWillShow', callback);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        subWindowClass.off('keyboardWillShow');
        await subWindowClass.destroyWindow();
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await subWindowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_0400
     * @tc.name      : testSubWindowDestroy_onKeyboradWillShow
     * @tc.desc      : 子窗销毁后监听onKeyboardWillShow返回1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSubWindowDestroy_onKeyboradWillShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSubWindowDestroy_onKeyboradWillShow ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('testSubWindowDestroy_onKeyboradWillShow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow()
          done();
        }
        await subWindowClass.destroyWindow()
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
        }
        subWindowClass.on('keyboardWillShow', callback);
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_0500
     * @tc.name      : testSubWindowDestroy_offKeyboradWillShow
     * @tc.desc      : 子窗销毁后取消监听offKeyboardWillShow返回1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSubWindowDestroy_offKeyboradWillShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSubWindowDestroy_offKeyboradWillShow ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('testSubWindowDestroy_onKeyboradWillShow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow()
          done();
        }
        await subWindowClass.destroyWindow()
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
        }
        subWindowClass.off('keyboardWillShow', callback);
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_0100
     * @tc.name      : testMainWindow_onkeyboardWillHide
     * @tc.desc      : 主窗监听onKeyboardWillHide后隐藏固定态输入法键盘触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainWindow_onkeyboardWillHide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainWindow_onkeyboardWillHide ';
      console.log(caseName + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      console.info(`${caseName} Succeeded in getting the main window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          done();
        }
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
          let displayInfo = display.getDefaultDisplaySync();
          console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
          expect(keyboardInfo.beginRect.left).assertEqual(0);
          expect(keyboardInfo.beginRect.top + keyboardInfo.beginRect.height).assertEqual(displayInfo.height);
          expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.left).assertEqual(0);
          expect(keyboardInfo.endRect.top).assertEqual(displayInfo.height);
          expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.height).assertLarger(0);
          expect(keyboardInfo.animated).assertEqual(true);
          expect(keyboardInfo.config?.curve).assertEqual(1);
          expect(keyboardInfo.config?.duration).assertLarger(0);
          if (keyboardInfo.config?.param != null) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFalse();
          }
        }
        mainWindow.on('keyboardWillHide', callback);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        mainWindow.off('keyboardWillHide');
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });


    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_0200
     * @tc.name      : testSubWindow_onkeyboardWillHide
     * @tc.desc      : 子窗监听onKeyboardWillHide后隐藏固定态输入法键盘触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSubWindow_onkeyboardWillHide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSubWindow_onkeyboardWillHide ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('testSubWindow_onKeyboradWillShow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow();
          done();
        }
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
          let displayInfo = display.getDefaultDisplaySync();
          console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
          expect(keyboardInfo.beginRect.left).assertEqual(0);
          expect(keyboardInfo.beginRect.top + keyboardInfo.beginRect.height).assertEqual(displayInfo.height);
          expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.left).assertEqual(0);
          expect(keyboardInfo.endRect.top).assertEqual(displayInfo.height);
          expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.height).assertLarger(0);
          expect(keyboardInfo.animated).assertEqual(true);
          expect(keyboardInfo.config?.curve).assertEqual(1);
          expect(keyboardInfo.config?.duration).assertLarger(0);
          if (keyboardInfo.config?.param != null) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFalse();
          }
        }
        subWindowClass.on('keyboardWillHide', callback);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        subWindowClass.off('keyboardWillHide');
        await subWindowClass.destroyWindow();
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await subWindowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_0300
     * @tc.name      : testSystemWindow_onkeyboardWillHide
     * @tc.desc      : 系统dialog窗监听onKeyboardWillHide后隐藏固定态输入法键盘触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSystemWindow_onkeyboardWillHide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSystemWindow_onkeyboardWillHide ';
      console.log(caseName + 'begin');
      let config: window.Configuration = {
        name: "testSystemWindow_onkeyboardWillHide",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      const subWindowClass = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the dialog window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow();
          done();
        }
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
          let displayInfo = display.getDefaultDisplaySync();
          console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
          expect(keyboardInfo.beginRect.left).assertEqual(0);
          expect(keyboardInfo.beginRect.top + keyboardInfo.beginRect.height).assertEqual(displayInfo.height);
          expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.left).assertEqual(0);
          expect(keyboardInfo.endRect.top).assertEqual(displayInfo.height);
          expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
          expect(keyboardInfo.endRect.height).assertLarger(0);
          expect(keyboardInfo.animated).assertEqual(true);
          expect(keyboardInfo.config?.curve).assertEqual(1);
          expect(keyboardInfo.config?.duration).assertLarger(0);
          if (keyboardInfo.config?.param != null) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFalse();
          }
        }
        subWindowClass.on('keyboardWillHide', callback);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        subWindowClass.off('keyboardWillHide');
        await subWindowClass.destroyWindow();
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await subWindowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_0400
     * @tc.name      : testSubWindowDestroy_onkeyboardWillHide
     * @tc.desc      : 子窗销毁后监听onKeyboardWillHide返回1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSubWindowDestroy_onkeyboardWillHide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSubWindowDestroy_onkeyboardWillHide ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('testSubWindowDestroy_onKeyboradWillShow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow()
          done();
        }
        await subWindowClass.destroyWindow()
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
        }
        subWindowClass.on('keyboardWillHide', callback);
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_0500
     * @tc.name      : testSubWindowDestroy_offkeyboardWillHide
     * @tc.desc      : 子窗销毁后取消监听offKeyboardWillHide返回1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSubWindowDestroy_offkeyboardWillHide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSubWindowDestroy_offkeyboardWillHide ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('testSubWindowDestroy_onKeyboradWillShow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          await subWindowClass.destroyWindow()
          done();
        }
        await subWindowClass.destroyWindow()
        const callback  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
        }
        subWindowClass.off('keyboardWillHide', callback);
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_ONKEYBOARDWILLHIDE_0100
     * @tc.name      : testMainWindow_OnAndOffKeyBoardWillShow_RegisterTwoTimes
     * @tc.desc      : 主窗注册2次输入法键盘显示隐藏验证回调2次
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainWindow_OnAndOffKeyBoardWillShow_RegisterTwoTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainWindow_OnAndOffKeyBoardWillShow_RegisterTwoTimes ';
      console.log(caseName + 'begin');
      let mainWindow = await windowStage.getMainWindowSync();
      console.info(`${caseName} Succeeded in getting the main window.`);
      let timer1 = 0;
      let timer2 = 0;
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          done();
        }
        const callback1  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo1: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        const callback2  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo2: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        mainWindow.on('keyboardWillShow', callback1);
        mainWindow.on('keyboardWillShow', callback2);
        const callback3  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo3: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        const callback4  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo4: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        mainWindow.on('keyboardWillHide', callback3);
        mainWindow.on('keyboardWillHide', callback4);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        expect(timer1).assertEqual(2);
        expect(timer2).assertEqual(2);
        mainWindow.off('keyboardWillShow');
        mainWindow.off('keyboardWillHide');
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        if (err.code === 801) {
          done();
        } else {
          mainWindow.off('keyboardWillShow');
          mainWindow.off('keyboardWillHide');
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_ONKEYBOARDWILLHIDE_0200
     * @tc.name      : testMainWindow_OnAndOffKeyBoardWillShow_UnregisterOneTimes
     * @tc.desc      : 主窗注册2次输入法键盘显示隐藏后取消其中一个监听验证回调1次
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainWindow_OnAndOffKeyBoardWillShow_UnregisterOneTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainWindow_OnAndOffKeyBoardWillShow_UnregisterOneTimes ';
      console.log(caseName + 'begin');
      let mainWindow = await windowStage.getMainWindowSync();
      console.info(`${caseName} Succeeded in getting the main window.`);
      let timer1 = 0;
      let timer2 = 0;
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          done();
        }
        const callback1  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo1: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        const callback2  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo2: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        mainWindow.on('keyboardWillShow', callback1);
        mainWindow.on('keyboardWillShow', callback2);
        const callback3  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo3: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        const callback4  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo4: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        mainWindow.on('keyboardWillHide', callback3);
        mainWindow.on('keyboardWillHide', callback4);
        mainWindow.off('keyboardWillShow', callback1);
        mainWindow.off('keyboardWillHide', callback3);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        expect(timer1).assertEqual(1);
        expect(timer2).assertEqual(1);
        mainWindow.off('keyboardWillShow');
        mainWindow.off('keyboardWillHide');
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        if (err.code === 801) {
          done();
        } else {
          mainWindow.off('keyboardWillShow');
          mainWindow.off('keyboardWillHide');
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_ONKEYBOARDWILLHIDE_0300
     * @tc.name      : testMainWindow_OnAndOffKeyBoardWillShow_UnregisterAll
     * @tc.desc      : 主窗注册2次输入法键盘显示隐藏后取消所有监听验证无法触发回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainWindow_OnAndOffKeyBoardWillShow_UnregisterAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainWindow_OnAndOffKeyBoardWillShow_UnregisterAll ';
      console.log(caseName + 'begin');
      let mainWindow = await windowStage.getMainWindowSync();
      console.info(`${caseName} Succeeded in getting the main window.`);
      let timer1 = 0;
      let timer2 = 0;
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          done();
        }
        const callback1  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo1: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        const callback2  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo2: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        mainWindow.on('keyboardWillShow', callback1);
        mainWindow.on('keyboardWillShow', callback2);
        const callback3  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo3: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        const callback4  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo4: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        mainWindow.on('keyboardWillHide', callback3);
        mainWindow.on('keyboardWillHide', callback4);

        mainWindow.off('keyboardWillShow');
        mainWindow.off('keyboardWillHide');
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);
        expect(timer1).assertEqual(0);
        expect(timer2).assertEqual(0);
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        if (err.code === 801) {
          done();
        } else {
          mainWindow.off('keyboardWillShow');
          mainWindow.off('keyboardWillHide');
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_ONKEYBOARDWILLHIDE_0400
     * @tc.name      : testMainWindow_OnAndOffKeyBoardWillShow
     * @tc.desc      : 主窗注册输入法键盘显示隐藏后可监听多个输入框拉起固定键盘的显示隐藏
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainWindow_OnAndOffKeyBoardWillShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainWindow_OnAndOffKeyBoardWillShow ';
      console.log(caseName + 'begin');
      let mainWindow = await windowStage.getMainWindowSync();
      console.info(`${caseName} Succeeded in getting the main window.`);
      let timer1 = 0;
      let timer2 = 0;
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          done();
        }
        const callback1  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo1: ${JSON.stringify(keyboardInfo)}`);
          timer1++;
        }
        const callback2  = (keyboardInfo: window.KeyboardInfo) => {
          console.info(`${caseName} KeyboardInfo2: ${JSON.stringify(keyboardInfo)}`);
          timer2++;
        }
        mainWindow.on('keyboardWillShow', callback1);
        mainWindow.on('keyboardWillHide', callback2);

        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        await sleep(1000);
        await input.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);

        let input2 = await driver.findComponent(ON.id('textInput2'));
        await sleep(1000);
        await input2.click();
        await sleep(500);
        await driver.pressBack();
        await sleep(500);

        expect(timer1).assertEqual(2);
        expect(timer2).assertEqual(0);
        mainWindow.off('keyboardWillShow');
        mainWindow.off('keyboardWillHide');
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        if (err.code === 801) {
          done();
        } else {
          mainWindow.off('keyboardWillShow');
          mainWindow.off('keyboardWillHide');
          expect().assertFail();
          done();
        }
      }
    });

  })
}