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

import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import deviceInfo from '@ohos.deviceInfo';
import { display } from '@kit.ArkUI';

export default function windowRotationTest() {
  describe('windowRotationTest', async () => {
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
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0100
     * @tc.name      : test_RotationChange_0100
     * @tc.desc      : test_RotationChange_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_RotationChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0100';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass = windowStage.getMainWindowSync();
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        windowClass.on(null, rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0200
     * @tc.name      : test_RotationChange_0200
     * @tc.desc      : test_RotationChange_0200
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_RotationChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0200';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0200');
      await subWindowClass.destroyWindow();
      try {
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        subWindowClass.on('rotationChange', rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0300
     * @tc.name      : test_RotationChange_0300
     * @tc.desc      : test_RotationChange_0300
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_RotationChange_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0300';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass = windowStage.getMainWindowSync();
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        windowClass.off(null, rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0400
     * @tc.name      : test_RotationChange_0400
     * @tc.desc      : test_RotationChange_0400
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_RotationChange_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0400';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0200');
      await subWindowClass.destroyWindow();
      try {
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        subWindowClass.off('rotationChange', rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0500
     * @tc.name      : test_RotationChange_0500
     * @tc.desc      : test_RotationChange_0500
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_RotationChange_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0500';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0500');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
              expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            let displayInfo = display.getDefaultDisplaySync();
            console.log(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            expect(rotationInfo.orientation).assertEqual(displayInfo.orientation)
            expect(rotationInfo.orientation).assertEqual(1)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(Math.abs(rotationInfo.displayRect.width-displayInfo.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-displayInfo.height)).assertLessOrEqual(1);
            let subWindowProperties = subWindowClass.getWindowProperties()
            console.log(`${caseName} :subWindowProperties.windowRect: ${JSON.stringify(subWindowProperties.windowRect)}`);
            expect(Math.abs(rotationInfo.displayRect.width-subWindowProperties.windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-subWindowProperties.windowRect.height)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.left-subWindowProperties.windowRect.left)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.top-subWindowProperties.windowRect.top)).assertLessOrEqual(1);
            subWindowClass.off('rotationChange', rotationCallback);
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        subWindowClass.off('rotationChange');
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0600
     * @tc.name      : test_RotationChange_0600
     * @tc.desc      : test_RotationChange_0600
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('test_RotationChange_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0600';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0600');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
              expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            let displayInfo = display.getDefaultDisplaySync();
            console.log(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            expect(rotationInfo.orientation).assertEqual(displayInfo.orientation)
            expect(rotationInfo.orientation).assertEqual(window.Orientation.PORTRAIT_INVERTED)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(Math.abs(rotationInfo.displayRect.width-displayInfo.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-displayInfo.height)).assertLessOrEqual(1);
            let subWindowProperties = subWindowClass.getWindowProperties()
            console.log(`${caseName} :subWindowProperties.windowRect: ${JSON.stringify(subWindowProperties.windowRect)}`);
            expect(Math.abs(rotationInfo.displayRect.width-subWindowProperties.windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-subWindowProperties.windowRect.height)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.left-subWindowProperties.windowRect.left)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.top-subWindowProperties.windowRect.top)).assertLessOrEqual(1);
            subWindowClass.off('rotationChange', rotationCallback);
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED)
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        subWindowClass.off('rotationChange');
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0700
     * @tc.name      : test_RotationChange_0700
     * @tc.desc      : test_RotationChange_0700
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('test_RotationChange_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0700';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0700');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
              expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            let displayInfo = display.getDefaultDisplaySync();
            console.log(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            expect(rotationInfo.orientation).assertEqual(displayInfo.orientation)
            expect(rotationInfo.orientation).assertEqual(window.Orientation.LANDSCAPE_INVERTED) // 文本中是横屏
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(Math.abs(rotationInfo.displayRect.width-displayInfo.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-displayInfo.height)).assertLessOrEqual(1);
            let subWindowProperties = subWindowClass.getWindowProperties()
            console.log(`${caseName} :subWindowProperties.windowRect: ${JSON.stringify(subWindowProperties.windowRect)}`);
            expect(Math.abs(rotationInfo.displayRect.width-subWindowProperties.windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-subWindowProperties.windowRect.height)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.left-subWindowProperties.windowRect.left)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.top-subWindowProperties.windowRect.top)).assertLessOrEqual(1);
            subWindowClass.off('rotationChange', rotationCallback);
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED)
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        subWindowClass.off('rotationChange');
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0800
     * @tc.name      : test_RotationChange_0800
     * @tc.desc      : test_RotationChange_0800
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_RotationChange_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0800';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let windowProperties = windowClass.getWindowProperties()
        console.log(`${caseName} :main windowProperties.windowRect: ${JSON.stringify(windowProperties.windowRect)}`);
        let windowLimits = windowClass.getWindowLimits()
        console.log(`${caseName} :mainWindow getWindowLimits. info: ${JSON.stringify(windowLimits)}`);
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: 100,
                  height: 100,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: 100,
                  height: 100
                }
              };
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            let windowProperties2 = windowClass.getWindowProperties()
            console.log(`${caseName} :main windowProperties2.windowRect: ${JSON.stringify(windowProperties2.windowRect)}`);
            expect(Math.abs(windowProperties.windowRect.left-windowProperties2.windowRect.left)).assertLessOrEqual(1);
            expect(Math.abs(windowProperties.windowRect.top-windowProperties2.windowRect.top)).assertLessOrEqual(1);
            expect(Math.abs(windowProperties.windowRect.height-windowProperties2.windowRect.height)).assertLessOrEqual(1);
            expect(Math.abs(windowProperties.windowRect.width-windowProperties2.windowRect.width)).assertLessOrEqual(1);
            // callback的信息不一致怎么判断？
            expect(Math.abs(windowProperties.windowRect.left-rotationInfo.displayRect.left)).assertLargerOrEqual(2);
            expect(Math.abs(windowProperties.windowRect.top-rotationInfo.displayRect.left)).assertLargerOrEqual(2);
            expect(Math.abs(windowProperties.windowRect.width-rotationInfo.displayRect.width)).assertLargerOrEqual(2);
            expect(Math.abs(windowProperties.windowRect.height-rotationInfo.displayRect.height)).assertLargerOrEqual(2);
            windowClass.off('rotationChange', rotationCallback);
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        windowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
      } catch (err) {
        windowClass.off('rotationChange');
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_0900
     * @tc.name      : test_RotationChange_0900
     * @tc.desc      : test_RotationChange_0900
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_RotationChange_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0900';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0900');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        const rotationCallback1: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback1 rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback1 rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback1 rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback1 rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback1 rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
            }
            console.log(`${caseName} :rotationCallback1 rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback1 rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            subWindowClass.off('rotationChange', rotationCallback1);
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        const rotationCallback2: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback2 rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback2 rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback2 rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback2 rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback2 rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number + 20,
                  height: subWindowLimits.minHeight as number + 20,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 30,
                  height: subWindowLimits.minHeight as number + 30
                }
              };
            }
            console.log(`${caseName} :rotationCallback2 rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback2 rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            subWindowClass.off('rotationChange', rotationCallback2);
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback1);
        subWindowClass.on('rotationChange', rotationCallback2);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        subWindowClass.off('rotationChange');
        subWindowClass.off('rotationChange');
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_1000
     * @tc.name      : test_RotationChange_1000
     * @tc.desc      : test_RotationChange_1000
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_RotationChange_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1000';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_1000');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            subWindowClass.off('rotationChange', rotationCallback);
            await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback);
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        subWindowClass.off('rotationChange');
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_1100
     * @tc.name      : test_RotationChange_1100
     * @tc.desc      : test_RotationChange_1100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_RotationChange_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1100';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_1100');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            subWindowClass.off('rotationChange');
            await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback);
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        subWindowClass.off('rotationChange');
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        done();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RotationChange_1200
     * @tc.name      : test_RotationChange_1200
     * @tc.desc      : test_RotationChange_1200
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_RotationChange_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1200';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let config: window.Configuration = {
        name: "test_RotationChange_1200",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      const subWindowClass = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the dialog window.`);
      let windowClass = windowStage.getMainWindowSync();
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.log(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          async (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
            console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
            console.log(`${caseName} :rotationCallback rotationInfo type: ${JSON.stringify(rotationInfo.type)}`);
            console.log(`${caseName} :rotationCallback rotationInfo orientation: ${JSON.stringify(rotationInfo.orientation)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayId: ${JSON.stringify(rotationInfo.displayId)}`);
            console.log(`${caseName} :rotationCallback rotationInfo displayRect: ${JSON.stringify(rotationInfo.displayRect)}`);
            if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 0,
                  top: 0,
                  width: subWindowLimits.minWidth as number,
                  height: subWindowLimits.minHeight as number,
                }
              };
            } else {
              rotationResult = {
                rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
                windowRect: {
                  left: 200,
                  top: 200,
                  width: subWindowLimits.minWidth as number + 50,
                  height: subWindowLimits.minHeight as number + 50
                }
              };
              expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            }
            console.log(`${caseName} :rotationCallback rotationResult rectType: ${JSON.stringify(rotationResult.rectType)}`);
            console.log(`${caseName} :rotationCallback rotationResult windowRect: ${JSON.stringify(rotationResult.windowRect)}`);
            let displayInfo = display.getDefaultDisplaySync();
            console.log(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            expect(rotationInfo.orientation).assertEqual(displayInfo.orientation)
            expect(rotationInfo.orientation).assertEqual(1)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(Math.abs(rotationInfo.displayRect.width-displayInfo.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-displayInfo.height)).assertLessOrEqual(1);
            let subWindowProperties = subWindowClass.getWindowProperties()
            console.log(`${caseName} :subWindowProperties.windowRect: ${JSON.stringify(subWindowProperties.windowRect)}`);
            expect(Math.abs(rotationInfo.displayRect.width-subWindowProperties.windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.height-subWindowProperties.windowRect.height)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.left-subWindowProperties.windowRect.left)).assertLessOrEqual(1);
            expect(Math.abs(rotationInfo.displayRect.top-subWindowProperties.windowRect.top)).assertLessOrEqual(1);
            subWindowClass.off('rotationChange', rotationCallback);
            await subWindowClass.destroyWindow()
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            done();
          }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
      } catch (err) {
        subWindowClass.off('rotationChange');
        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        done();
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

  })
}