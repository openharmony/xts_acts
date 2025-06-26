import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import window from '@ohos.window'
import { AppStorage } from '@ohos.arkui.stateManagement';
import display from '@ohos.display'
import screen from '@ohos.screen'
import image from '@ohos.multimedia.image'
import type { AsyncCallback, Callback } from '@ohos.base'
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';

// import PiPWindow from '@ohos.PiPWindow';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;


export default function abilityTest() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("abilityTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    //let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    //let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let win: window.Window;
    // let session:UIExtensionContentSession;
    //let isAutoWindow: string = '';
    //let isPCStatus: string = '';
    beforeAll(() => {
      //context = AppStorage.get('context') as common.UIAbilityContext;
      //console.log('windowTest context: ' + JSON.stringify(context))
      try {
        windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
        win = AppStorage.get<window.Window>('mainWindow') as window.Window;
        // let win = windowStage.getMainWindowSync();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
      }

      hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
      hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

      //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
      //console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      //console.info(`beforeAll isPCStatus: `+ isPCStatus);
    })
    /**
     * @tc.number     : windowErrCodeOneStatic_testGetMainWindowCallBack_static_0100
     * @tc.name       : windowErrCodeOneStatic_testGetMainWindowCallBack_static_0100
     * @tc.desc       : windowErrCodeOneStatic_testGetMainWindowCallBack_static_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("windowErrCodeOneStatic_testGetMainWindowCallBack_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testGetMainWindowCallBack start');
        windowStage.getMainWindow((err: BusinessError, data: window.Window) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`finaltest [ANI] getMainWindow callback fail . Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          let win2 = data;
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getMainWindow callback success' + JSON.stringify(win2));
          expect(win2 != null).assertTrue();
          done();
        });
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testGetMainWindowPromise_static_0101
     * @tc.name       : windowErrCodeOneStatic_testGetMainWindowPromise_static_0101
     * @tc.desc       : windowErrCodeOneStatic_testGetMainWindowPromise_static_0101
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("windowErrCodeOneStatic_testGetMainWindowPromise_static_0101",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testGetMainWindowPromise start');
        windowStage.getMainWindow().then((ret: window.Window): void => {
          expect(ret != null).assertTrue();
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getMainWindow promise success ' + JSON.stringify(ret));
        }).catch((e: NullishType): void => {
          let err = e as BusinessError;
          expect(false).assertTrue();
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] getMainWindow promise Failed . Cause code: ${err.code}, message: ${err.message}`);
        });
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testgetWindowProperties_static_0104
     * @tc.name       : windowErrCodeOneStatic_testgetWindowProperties_static_0104
     * @tc.desc       : windowErrCodeOneStatic_testgetWindowProperties_static_0104
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testgetWindowProperties_static_0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let ret = win.getWindowProperties();
          expect(ret != null).assertTrue();
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getWindowProperties  sync Succeeded' + JSON.stringify(ret));
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getWindowProperties  fail');
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testsetWindowDecorHeight_static_0105
     * @tc.name       : windowErrCodeOneStatic_testsetWindowDecorHeight_static_0105
     * @tc.desc       : windowErrCodeOneStatic_testsetWindowDecorHeight_static_0105
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetWindowDecorHeight_static_0105",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowDecorHeight(100);
          hilog.info(0x0000, "hh", "finaltest [ANI] setWindowDecorHeight success");
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 801) { // promission
            hilog.error(0x0000, "hh", "finaltest [ANI] setWindowDecorHeight success " + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.error(0x0000, "hh", "finaltest [ANI] setWindowDecorHeight error " + JSON.stringify(e));
            expect(false).assertTrue();
          }
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testgetWindowDecorHeight_static_0106
     * @tc.name       : windowErrCodeOneStatic_testgetWindowDecorHeight_static_0106
     * @tc.desc       : windowErrCodeOneStatic_testgetWindowDecorHeight_static_0106
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testgetWindowDecorHeight_static_0106",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let decorHeight = win.getWindowDecorHeight();
          hilog.info(0x0000, "hh", "finaltest [ANI] getWindowDecorHeight success" + JSON.stringify(decorHeight));
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 801) {
            hilog.error(0x0000, "hh", "finaltest [ANI] getWindowDecorHeight 801");
            expect(true).assertTrue();
          } else {
            hilog.error(0x0000, "hh", "finaltest [ANI] getWindowDecorHeight error");
            expect(false).assertTrue();
          }
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testsetWindowDecorVisible_static_0107
     * @tc.name       : windowErrCodeOneStatic_testsetWindowDecorVisible_static_0107
     * @tc.desc       : windowErrCodeOneStatic_testsetWindowDecorVisible_static_0107
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetWindowDecorVisible_static_0107",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowDecorVisible(false);
          hilog.info(0x0000, "hh", "finaltest [ANI] setWindowDecorVisible success");
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 801) { // e.code == 801 not support
            hilog.info(0x0000, "hh", "finaltest [ANI] testsetWindowDecorVisible success: " + JSON.stringify(e.code));
            expect(true).assertTrue();
            done();
          } else {
            hilog.error(0x0000, "hh", "finaltest [ANI] testsetWindowDecorVisible error: " + JSON.stringify(e.code));
            expect(false).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testsetSpecificSystemBarEnabled_static_0108
     * @tc.name       : windowErrCodeOneStatic_testsetSpecificSystemBarEnabled_static_0108
     * @tc.desc       : windowErrCodeOneStatic_testsetSpecificSystemBarEnabled_static_0108
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetSpecificSystemBarEnabled_static_0108",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setSpecificSystemBarEnabled("status", true, true).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setSpecificSystemBarEnabled promise Succeeded');

          expect(true).assertTrue();
        }).catch((e: NullishType): void => {
          let err = e as BusinessError;
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setSpecificSystemBarEnabled promise Failed, Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testsetWindowKeepScreenOnCallBack_static_0109
     * @tc.name       : windowErrCodeOneStatic_testsetWindowKeepScreenOnCallBack_static_0109
     * @tc.desc       : windowErrCodeOneStatic_testsetWindowKeepScreenOnCallBack_static_0109
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetWindowKeepScreenOnCallBack_static_0109",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowKeepScreenOn(false, (err: BusinessError): void => {
            const errCode: number = err.code;
            if (errCode) {
              hilog.info(0x0000, '[ANI]',
                `finaltest [ANI] setWindowKeepScreenOn callback Failed, Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            }
            hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowKeepScreenOn callback Succeed`);
            expect(true).assertTrue();
          });
        } catch (e: Error) {
          hilog.error(0x0000, '[ani]', 'finaltest [ANI] setWindowKeepScreenOn callback Failed: ' + e.message);
          expect(false).assertTrue();
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testsetWindowKeepScreenOnPromise_static_0110
     * @tc.name       : windowErrCodeOneStatic_testsetWindowKeepScreenOnPromise_static_0110
     * @tc.desc       : windowErrCodeOneStatic_testsetWindowKeepScreenOnPromise_static_0110
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetWindowKeepScreenOnPromise_static_0110",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowKeepScreenOn(true).then((): void => {
          expect(true).assertTrue();
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowKeepScreenOn promise Succeeded');
        }).catch((e: NullishType): void => {
          expect(false).assertTrue();
          let err = e as BusinessError;
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setWindowKeepScreenOn promise  Failed, Cause code: ${err.code}, message: ${err.message}`);
        });
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testSetWindowTouchableCallBack_static_0111
     * @tc.name       : windowErrCodeOneStatic_testSetWindowTouchableCallBack_static_0111
     * @tc.desc       : windowErrCodeOneStatic_testSetWindowTouchableCallBack_static_0111
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetWindowTouchableCallBack_static_0111",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowTouchable(false, (err: BusinessError): void => {
            const errCode: number = err.code;
            if (errCode) {
              hilog.info(0x0000, '[ANI]',
                `finaltest [ANI] setWindowTouchable callback Failed, Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            }
            hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowTouchable callback Succeed`);
            expect(true).assertTrue();
          });
        } catch (e: Error) {
          hilog.error(0x0000, '[ani]', 'finaltest [ANI] setWindowTouchable callback Failed: ' + e.message);
          expect(false).assertTrue();
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testSetWindowTouchablePromise_static_0112
     * @tc.name       : windowErrCodeOneStatic_testSetWindowTouchablePromise_static_0112
     * @tc.desc       : windowErrCodeOneStatic_testSetWindowTouchablePromise_static_0112
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetWindowTouchablePromise_static_0112",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowTouchable(true).then((): void => {
          expect(true).assertTrue();
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowTouchable promise Succeeded');
        }).catch((e: NullishType): void => {
          expect(false).assertTrue();
          let err = e as BusinessError;
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setWindowTouchable promise  Failed, Cause code: ${err.code}, message: ${err.message}`);
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testsetWindowBackgroundColorSync_static_0114
     * @tc.name       : windowErrCodeOneStatic_testsetWindowBackgroundColorSync_static_0114
     * @tc.desc       : windowErrCodeOneStatic_testsetWindowBackgroundColorSync_static_0114
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetWindowBackgroundColorSync_static_0114",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let color: string = '#00ff33';
        try {
          win.setWindowBackgroundColor(color);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowBackgroundColor sync success ');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.error(0x0000, '[ANI]', 'finaltest [ANI] setWindowBackgroundColor sync Failed: ' + e.message);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testisWindowSupportWideGamutCallBack_static_0115
     * @tc.name       : windowErrCodeOneStatic_testisWindowSupportWideGamutCallBack_static_0115
     * @tc.desc       : windowErrCodeOneStatic_testisWindowSupportWideGamutCallBack_static_0115
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testisWindowSupportWideGamutCallBack_static_0115",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.isWindowSupportWideGamut((err: BusinessError, data: boolean) => {
            const errCode: number = err.code;
            if (errCode) {
              hilog.info(0x0000, '[ANI]', 'finaltest [ANI] isWindowSupportWideGamut callback Failed ' + errCode);
              expect(false).assertTrue();
              done();
            }
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] isWindowSupportWideGamut callback success= ' + data);
            expect(true).assertTrue();
          });
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] isWindowSupportWideGamut callback Failed' + e);
          expect(false).assertTrue();
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testisWindowSupportWideGamutPromise_static_0116
     * @tc.name       : windowErrCodeOneStatic_testisWindowSupportWideGamutPromise_static_0116
     * @tc.desc       : windowErrCodeOneStatic_testisWindowSupportWideGamutPromise_static_0116
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testisWindowSupportWideGamutPromise_static_0116",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.isWindowSupportWideGamut().then((data: boolean): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] isWindowSupportWideGamut  promise Succeeded' + data);
          expect(true).assertTrue();
        }).catch((e: NullishType): void => {
          let err = e as BusinessError;
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] isWindowSupportWideGamut promise Failed , Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testsetWindowSystemBarPropertiesSync_static_0117
     * @tc.name       : windowErrCodeOneStatic_testsetWindowSystemBarPropertiesSync_static_0117
     * @tc.desc       : windowErrCodeOneStatic_testsetWindowSystemBarPropertiesSync_static_0117
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testsetWindowSystemBarPropertiesSync_static_0117",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let systemBarProperties: window.SystemBarProperties = {
            statusBarColor: '#ff00ff',
            navigationBarColor: '#00ff00',
            //以下两个属性从API Version8开始支持
            statusBarContentColor: '#ffffff',
            navigationBarContentColor: '#00ffff'
          };
          win.setWindowSystemBarProperties(systemBarProperties);
          expect(true).assertTrue();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowSystemBarProperties sync Succeeded `);
        } catch (e: Error) {
          expect(false).assertTrue();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowSystemBarProperties sync Failed , Cause code: ${e}`);
        }
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testStartMoving_static_0118
     * @tc.name       : windowErrCodeOneStatic_testStartMoving_static_0118
     * @tc.desc       : windowErrCodeOneStatic_testStartMoving_static_0118
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testStartMoving_static_0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.startMoving().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] startMoving promise Succeeded');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] startMoving promise Succeeded');
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] startMoving promise failed');
            expect(false).assertTrue();
          }
          done();
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testStartMovingWithCoordinate_static_0119
     * @tc.name       : windowErrCodeOneStatic_testStartMovingWithCoordinate_static_0119
     * @tc.desc       : windowErrCodeOneStatic_testStartMovingWithCoordinate_static_0119
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testStartMovingWithCoordinate_static_0119",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.startMoving(100, 100).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] startMoving promise Succeeded');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] startMoving promise Succeeded');
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] startMoving promise failed');
            expect(false).assertTrue();
          }
          done();
        });
        done();
      })

    /**
     * @tc.number     : windowErrCodeOneStatic_testSetWindowTitleButtonVisible_static_0120
     * @tc.name       : windowErrCodeOneStatic_testSetWindowTitleButtonVisible_static_0120
     * @tc.desc       : windowErrCodeOneStatic_testSetWindowTitleButtonVisible_static_0120
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetWindowTitleButtonVisible_static_0120",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowTitleButtonVisible(true, true, true);
          expect(true).assertTrue();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowTitleButtonVisible sync Succeeded `);
        } catch (e: BusinessError) {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowTitleButtonVisible sync Succeeded');
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowTitleButtonVisible sync failed');
            expect(false).assertTrue();
          }
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testSetDecorButtonStyle_static_0121
     * @tc.name       : windowErrCodeOneStatic_testSetDecorButtonStyle_static_0121
     * @tc.desc       : windowErrCodeOneStatic_testSetDecorButtonStyle_static_0121
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetDecorButtonStyle_static_0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 24,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20
          };
          win.setDecorButtonStyle(style);
          expect(true).assertTrue();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] setDecorButtonStyle sync Succeeded `);
        } catch (e: BusinessError) {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setDecorButtonStyle sync Succeeded');
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setDecorButtonStyle sync failed' + JSON.stringify(e));
            expect(false).assertTrue();
          }
        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testgetWindowStatus_static_0122
     * @tc.name       : windowErrCodeOneStatic_testgetWindowStatus_static_0122
     * @tc.desc       : windowErrCodeOneStatic_testgetWindowStatus_static_0122
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testgetWindowStatus_static_0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let windowStatusType = win.getWindowStatus();
          expect(windowStatusType != undefined).assertTrue();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] getWindowStatus sync Succeeded `);
        } catch (e: BusinessError) {
          if (e.code === 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getWindowStatus sync success' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getWindowStatus sync failed' + JSON.stringify(e));
            expect(false).assertTrue();
          }

        }
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testMaximize_static_0123
     * @tc.name       : windowErrCodeOneStatic_testMaximize_static_0123
     * @tc.desc       : windowErrCodeOneStatic_testMaximize_static_0123
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testMaximize_static_0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] maximize promise Succeeded');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] maximize promise Succeeded');
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] maximize promise failed');
            expect(false).assertTrue();
          }
          done();
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testMinimize_static_0124
     * @tc.name       : windowErrCodeOneStatic_testMinimize_static_0124
     * @tc.desc       : windowErrCodeOneStatic_testMinimize_static_0124
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testMinimize_static_0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.minimize().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimize promise Succeeded');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimize promise Succeeded');
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimize promise failed');
            expect(false).assertTrue();
          }
          done();
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_testMinimize_static_0125
     * @tc.name       : windowErrCodeOneStatic_testMinimize_static_0125
     * @tc.desc       : windowErrCodeOneStatic_testMinimize_static_0125
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testMinimize_static_0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.minimize((err: BusinessError) => {
          if (err?.code) {
            const errCode: number = err.code;
            if (errCode == 801) {
              hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimize callback Succeeded');
              expect(true).assertTrue();
            } else {
              hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimize callback failed');
              expect(false).assertTrue();
            }
            done();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimize callback Succeeded');
            expect(true).assertTrue();
            done();
          }
        });
        done();
      })
    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowWillCloseTest_static_0126
     * @tc.name       : windowErrCodeOneStatic_onOffWindowWillCloseTest_static_0126
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowWillCloseTest_static_0126
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowWillCloseTest_static_0126",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = () => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onOffWindowWillCloseTest callback success`);
          return new Promise<boolean>((resolve, reject) => {
            resolve(true);
          })
        };
        try {
          win.on('windowWillClose', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowWillClose success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 1300002) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowWillClose success e:' + JSON.stringify(e));
            expect(true).assertTrue();
            done();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowWillClose fail e:' + JSON.stringify(e));
            expect(false).assertTrue();
            done();
          }

        }
        try {
          win.off('windowWillClose', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowWillClose success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowWillClose fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowTitleButtonRectChangeTest_static_0127
     * @tc.name       : windowErrCodeOneStatic_onOffWindowTitleButtonRectChangeTest_static_0127
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowTitleButtonRectChangeTest_static_0127
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowTitleButtonRectChangeTest_static_0127",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (data: window.TitleButtonRect): void => {
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] onOffWindowTitleButtonRectChangeTest callback success:${JSON.stringify(data)}`);
        };
        try {
          win.on('windowTitleButtonRectChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowTitleButtonRectChange success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code === 801) {
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] on_windowTitleButtonRectChange success e:' + JSON.stringify(e.message));
            expect(true).assertTrue();
            done();
          } else {
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] on_windowTitleButtonRectChange fail e:' + JSON.stringify(e.message));
            expect(false).assertTrue();
            done();
          }
        }
        try {
          win.off('windowTitleButtonRectChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowTitleButtonRectChange success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]',
            'finaltest [ANI] off_windowTitleButtonRectChange fail e:' + JSON.stringify(e.message));
          expect(false).assertTrue();
          done();
        }
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowStageCloseTest_static_0128
     * @tc.name       : windowErrCodeOneStatic_onOffWindowStageCloseTest_static_0128
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowStageCloseTest_static_0128
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowStageCloseTest_static_0128",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onOffWindowStageCloseTest callback success`);
        };
        try {
          windowStage.on('windowStageClose', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowStageClose success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code === 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowStageClose success e:' + JSON.stringify(e));
            expect(true).assertTrue();
            done();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowStageClose fail e:' + JSON.stringify(e));
            expect(false).assertTrue();
            done();
          }

        }
        try {
          windowStage.off('windowStageClose', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowStageClose success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowStageClose fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_testSetWindowSystemBarPropertiesPromise_static_0129
     * @tc.name       : windowErrCodeOneStatic_testSetWindowSystemBarPropertiesPromise_static_0129
     * @tc.desc       : windowErrCodeOneStatic_testSetWindowSystemBarPropertiesPromise_static_0129
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetWindowSystemBarPropertiesPromise_static_0129",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testSetWindowSystemBarPropertiesPromise start');
        let systemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          //以下两个属性从API Version8开始支持
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        };
        win.setWindowSystemBarProperties(systemBarProperties).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowSystemBarProperties promise Succeeded');
          expect(true).assertTrue();
          done();
        }).catch((e: NullishType): void => {
          let err = e as BusinessError;
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setWindowSystemBarProperties promise Failed, Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_testSetWindowLayoutFullScreenPromise_static_0130
     * @tc.name       : windowErrCodeOneStatic_testSetWindowLayoutFullScreenPromise_static_0130
     * @tc.desc       : windowErrCodeOneStatic_testSetWindowLayoutFullScreenPromise_static_0130
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetWindowLayoutFullScreenPromise_static_0130",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testSetWindowLayoutFullScreenPromise start');
        win.setWindowLayoutFullScreen(true).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowLayoutFullScreen promise Succeeded');
          expect(true).assertTrue();
          done();
        }).catch((e: NullishType): void => {
          let err = e as BusinessError;
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setWindowLayoutFullScreen promise Failed, Cause code: ${err},:${err}`);
          expect(false).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_testSetImmersiveModeEnabledStateSync_static_0131
     * @tc.name       : windowErrCodeOneStatic_testSetImmersiveModeEnabledStateSync_static_0131
     * @tc.desc       : windowErrCodeOneStatic_testSetImmersiveModeEnabledStateSync_static_0131
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSetImmersiveModeEnabledStateSync_static_0131",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testSetImmersiveModeEnabledStateSync start');
        try {
          win.setImmersiveModeEnabledState(true);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setImmersiveModeEnabledState success');
          expect(true).assertTrue();
          done();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', 'finaltest [ANI] setImmersiveModeEnabledState failed' + err);
          expect(false).assertTrue();
          done();
        }
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowStatusChangeTest_static_0132
     * @tc.name       : windowErrCodeOneStatic_onOffWindowStatusChangeTest_static_0132
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowStatusChangeTest_static_0132
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowStatusChangeTest_static_0132",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (data: window.WindowStatusType): void => {
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] onOffWindowStatusChangeTest callback success status:${data as int}`);
        };

        try {
          win.on('windowStatusChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowStatusChange success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_WindowStatusChangeTest success e:' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_WindowStatusChangeTest fail e:' + JSON.stringify(e));
            expect(false).assertTrue();
          }
        }

        try {
          win.off('windowStatusChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowStatusChange success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_WindowStatusChangeTest success e:' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_WindowStatusChangeTest fail e:' + JSON.stringify(e));
            expect(false).assertTrue();
          }
        }
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowSizeChangeTest_static_0133
     * @tc.name       : windowErrCodeOneStatic_onOffWindowSizeChangeTest_static_0133
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowSizeChangeTest_static_0133
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowSizeChangeTest_static_0133",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (data: window.Size): void => {
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] onOffWindowSizeChangeTest callback success:${JSON.stringify(data)}`);
        };
        try {
          win.on('windowSizeChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowSizeChange success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowSizeChange fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        try {
          win.off('windowSizeChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowSizeChange success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] windowSizeChange fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowRectChangeTest_static_0134
     * @tc.name       : windowErrCodeOneStatic_onOffWindowRectChangeTest_static_0134
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowRectChangeTest_static_0134
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowRectChangeTest_static_0134",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (data: window.RectChangeOptions): void => {
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] onOffWindowRectChangeTest callback success:${JSON.stringify(data)}`);
        };
        try {
          win.on('windowRectChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowRectChange success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code === 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowRectChange success code ===' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_windowRectChange fail code ===' + JSON.stringify(e));
            expect(false).assertTrue();
          }
          done();
        }
        try {
          win.off('windowRectChange', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowRectChange success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code === 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowRectChange success code ===' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_windowRectChange fail code ===' + JSON.stringify(e));
            expect(false).assertTrue();
          }
          done();
        }
        done();
      });

    // 2. windowEvent监听测试
    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowEventTest_static_0135
     * @tc.name       : windowErrCodeOneStatic_onOffWindowEventTest_static_0135
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowEventTest_static_0135
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowEventTest_static_0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (data: window.WindowEventType): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onOffWindowEventTest callback success:${data as int}`);
        };
        try {
          win.on('windowEvent', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_WindowEvent success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on WindowEvent fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        try {
          win.off('windowEvent', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_WindowEvent success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_WindowEvent fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffDialogTargetTouchTest_static_0136
     * @tc.name       : windowErrCodeOneStatic_onOffDialogTargetTouchTest_static_0136
     * @tc.desc       : windowErrCodeOneStatic_onOffDialogTargetTouchTest_static_0136
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffDialogTargetTouchTest_static_0136",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onOffDialogTargetTouchTest callback success`);
        };
        try {
          win.on('dialogTargetTouch', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_dialogTargetTouch success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_dialogTargetTouch fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        try {
          win.off('dialogTargetTouch', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_dialogTargetTouch success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] dialogTargetTouch fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffTouchOutsideTest_static_0137
     * @tc.name       : windowErrCodeOneStatic_onOffTouchOutsideTest_static_0137
     * @tc.desc       : windowErrCodeOneStatic_onOffTouchOutsideTest_static_0137
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffTouchOutsideTest_static_0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onOfftouchOutsideTest callback success`);
        };
        try {
          win.on('touchOutside', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_touchOutside success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_touchOutside fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        try {
          win.off('touchOutside', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_touchOutside success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] touchOutside fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffNoInteractionDetectedTest_static_0138
     * @tc.name       : windowErrCodeOneStatic_onOffNoInteractionDetectedTest_static_0138
     * @tc.desc       : windowErrCodeOneStatic_onOffNoInteractionDetectedTest_static_0138
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffNoInteractionDetectedTest_static_0138",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onOffNoInteractionDetectedTest callback success`);
        };
        try {
          win.on('noInteractionDetected', 10, callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_noInteractionDetected success');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_noInteractionDetected success e:' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_noInteractionDetected fail e:' + JSON.stringify(e));
            expect(false).assertTrue();
          }
          done();
        }
        try {
          win.off('noInteractionDetected', callback);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_noInteractionDetected success');
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] noInteractionDetected fail e:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_getWindowAvoidAreaTest_static_0140
     * @tc.name       : windowErrCodeOneStatic_getWindowAvoidAreaTest_static_0140
     * @tc.desc       : windowErrCodeOneStatic_getWindowAvoidAreaTest_static_0140
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getWindowAvoidAreaTest_static_0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let area = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getWindowAvoidArea success:' + JSON.stringify(area));
          expect(area != null).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] getWindowAvoidArea fail:' + JSON.stringify(e));
          expect(false).assertTrue();
          done();
        }
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_recoverTestPromise_static_0141
     * @tc.name       : windowErrCodeOneStatic_recoverTestPromise_static_0141
     * @tc.desc       : windowErrCodeOneStatic_recoverTestPromise_static_0141
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_recoverTestPromise_static_0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.recover().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] recover Succeeded');
          expect(true).assertTrue();
        }).catch((e: NullishType): void => {
          let err = e as BusinessError;

          if (err.code == 801) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] recover Succeeded. Cause code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] recover fail. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_recoverTestSync_static_0142
     * @tc.name       : windowErrCodeOneStatic_recoverTestSync_static_0142
     * @tc.desc       : windowErrCodeOneStatic_recoverTestSync_static_0142
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_recoverTestSync_static_0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.recover();
          expect(true).assertTrue();
        } catch (e: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] recover fail.');
          expect(false).assertTrue();
        }
        done();
      });

    // setWindowColorSpaceTest
    /**
     * @tc.number     : windowErrCodeOneStatic_setWindowColorSpaceCallbackTest_static_0143
     * @tc.name       : windowErrCodeOneStatic_setWindowColorSpaceCallbackTest_static_0143
     * @tc.desc       : windowErrCodeOneStatic_setWindowColorSpaceCallbackTest_static_0143
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setWindowColorSpaceCallbackTest_static_0143",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowColorSpace(window.ColorSpace.WIDE_GAMUT, (err: BusinessError) => {
          if (err?.code) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] setWindowColorSpaceTest callback Failed. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowColorSpaceTest callback Succeeded.');
          expect(true).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_setWindowColorSpacePromiseTest_static_0144
     * @tc.name       : windowErrCodeOneStatic_setWindowColorSpacePromiseTest_static_0144
     * @tc.desc       : windowErrCodeOneStatic_setWindowColorSpacePromiseTest_static_0144
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setWindowColorSpacePromiseTest_static_0144",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowColorSpace(window.ColorSpace.WIDE_GAMUT);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowColorSpace promise success');
          expect(true).assertTrue();
          done();
        } catch (err) {
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setWindowColorSpace promise Failed. err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    // setPreferredOrientationTest
    /**
     * @tc.number     : windowErrCodeOneStatic_setPreferredOrientationCallbackTest_static_0145
     * @tc.name       : windowErrCodeOneStatic_setPreferredOrientationCallbackTest_static_0145
     * @tc.desc       : windowErrCodeOneStatic_setPreferredOrientationCallbackTest_static_0145
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setPreferredOrientationCallbackTest_static_0145",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setPreferredOrientation(window.Orientation.AUTO_ROTATION, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] setPreferredOrientation callback Failed. Cause code : ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setPreferredOrientation  callback Succeeded .');
          expect(true).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_setPreferredOrientationPromiseTest_static_0146
     * @tc.name       : windowErrCodeOneStatic_setPreferredOrientationPromiseTest_static_0146
     * @tc.desc       : windowErrCodeOneStatic_setPreferredOrientationPromiseTest_static_0146
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setPreferredOrientationPromiseTest_static_0146",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setPreferredOrientation(window.Orientation.AUTO_ROTATION);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setPreferredOrientation promise success');
          expect(true).assertTrue();
          done();
        } catch (err) {
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] setPreferredOrientation promise Failed. err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    // setWindowPrivacyModeTest
    /**
     * @tc.number     : windowErrCodeOneStatic_setWindowPrivacyModeCallbackTest_static_0147
     * @tc.name       : windowErrCodeOneStatic_setWindowPrivacyModeCallbackTest_static_0147
     * @tc.desc       : windowErrCodeOneStatic_setWindowPrivacyModeCallbackTest_static_0147
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setWindowPrivacyModeCallbackTest_static_0147",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowPrivacyMode(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] setWindowPrivacyMode callback Failed. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowPrivacyMode callback Succeeded .');
          expect(true).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_setWindowPrivacyModePromiseTest_static_0148
     * @tc.name       : windowErrCodeOneStatic_setWindowPrivacyModePromiseTest_static_0148
     * @tc.desc       : windowErrCodeOneStatic_setWindowPrivacyModePromiseTest_static_0148
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setWindowPrivacyModePromiseTest_static_0148",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.setWindowPrivacyMode(true);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowPrivacyMode promise success');
          expect(true).assertTrue();
          done();
        } catch (err) {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowPrivacyMode promise fail. err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    // display
    /**
     * @tc.number     : windowErrCodeOneStatic_isFoldableTest_static_0149
     * @tc.name       : windowErrCodeOneStatic_isFoldableTest_static_0149
     * @tc.desc       : windowErrCodeOneStatic_isFoldableTest_static_0149
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_isFoldableTest_static_0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let foldable = display.isFoldable();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] isFoldable success: ${foldable}`);
          expect(true).assertTrue();
        } catch (exception : Error) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] isFoldable fail: ${JSON.stringify(exception)}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_getFoldStatusTest_static_0150
     * @tc.name       : windowErrCodeOneStatic_getFoldStatusTest_static_0150
     * @tc.desc       : windowErrCodeOneStatic_getFoldStatusTest_static_0150
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getFoldStatusTest_static_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let foldStatus = display.getFoldStatus();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] getFoldStatus success: ${JSON.stringify(foldStatus)}`);
          expect(foldStatus != null).assertTrue();
          done();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] getFoldStatus fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_getGlobalRectTest_static_0151
     * @tc.name       : windowErrCodeOneStatic_getGlobalRectTest_static_0151
     * @tc.desc       : windowErrCodeOneStatic_getGlobalRectTest_static_0151
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getGlobalRectTest_static_0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let globalRect = win.getGlobalRect();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] globalRect success: ${JSON.stringify(globalRect)}`);
          expect(true).assertTrue();
        } catch (err: BusinessError) {
          if (err.code === 801) {
            hilog.error(0x0000, '[ANI]', `finaltest [ANI] globalRect success:  code === ${JSON.stringify(err.code)}`);
            expect(err.code === 801).assertTrue();
          } else {
            hilog.error(0x0000, '[ANI]',
              `finaltest [ANI] globalRect fail: ${JSON.stringify(err.message)}  errcode ${JSON.stringify(err.code)}`);
            expect(err.code === 801).assertTrue();
          }
        }
        done();
      });


    /**
     * @tc.number     : windowErrCodeOneStatic_getFoldDisplayModeTest_static_0152
     * @tc.name       : windowErrCodeOneStatic_getFoldDisplayModeTest_static_0152
     * @tc.desc       : windowErrCodeOneStatic_getFoldDisplayModeTest_static_0152
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getFoldDisplayModeTest_static_0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let foldDisplayMode = display.getFoldDisplayMode();
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] getFoldDisplayMode success. Data: ${JSON.stringify(foldDisplayMode)}`);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] getFoldDisplayMode fail. Data: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_getCurrentFoldCreaseRegionTest_static_0153
     * @tc.name       : windowErrCodeOneStatic_getCurrentFoldCreaseRegionTest_static_0153
     * @tc.desc       : windowErrCodeOneStatic_getCurrentFoldCreaseRegionTest_static_0153
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getCurrentFoldCreaseRegionTest_static_0153",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let foldCreaseRegion: display.FoldCreaseRegion = display.getCurrentFoldCreaseRegion();
          hilog.info(0x0000, '[ANI]',
            'finaltest [ANI] getCurrentFoldCreaseRegion success. Data: ' + JSON.stringify(foldCreaseRegion));
          expect(true).assertTrue();
        } catch (exception : Error) {
          hilog.error(0x0000, '[ANI]',
            `finaltest [ANI] getCurrentFoldCreaseRegion fail. Err: ${JSON.stringify(exception)}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_getDefaultDisplaySyncTest_static_0154
     * @tc.name       : windowErrCodeOneStatic_getDefaultDisplaySyncTest_static_0154
     * @tc.desc       : windowErrCodeOneStatic_getDefaultDisplaySyncTest_static_0154
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getDefaultDisplaySyncTest_static_0154",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let display1 = display.getDefaultDisplaySync();
          hilog.info(0x0000, '[ANI]',
            `finaltest [ANI] getDefaultDisplaySync success. Data: ${JSON.stringify(display1)}`);
          expect(true).assertTrue();
        } catch (exception : Error) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] getDefaultDisplaySync fail. Err: ${JSON.stringify(exception)}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_getDisplayByIdSyncTest_static_0155
     * @tc.name       : windowErrCodeOneStatic_getDisplayByIdSyncTest_static_0155
     * @tc.desc       : windowErrCodeOneStatic_getDisplayByIdSyncTest_static_0155
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getDisplayByIdSyncTest_static_0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let displayId = 0;
          let display2 = display.getDisplayByIdSync(displayId);
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] getDisplayByIdSync success. Data: ${JSON.stringify(display2)}`);
          expect(true).assertTrue();
        } catch (exception : Error) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] getDisplayByIdSync fail. Err: ${JSON.stringify(exception)}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.number     : windowErrCodeOneStatic_getAllDisplaysCallbackTest_static_0156
     * @tc.name       : windowErrCodeOneStatic_getAllDisplaysCallbackTest_static_0156
     * @tc.desc       : windowErrCodeOneStatic_getAllDisplaysCallbackTest_static_0156
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_getAllDisplaysCallbackTest_static_0156",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let displayClass: Array<display.Display>;
          display.getAllDisplays((err: BusinessError, data: Array<display.Display>): void => {
            if (err.code) {
              hilog.error(0x0000, '[ANI]',
                `finaltest [ANI] getAllDisplays ayncCallback fail. Err: ${JSON.stringify(err)}`);
              expect(false).assertTrue();
              done();
            }
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] getAllDisplays ayncCallback succeed. Data: ' + JSON.stringify(data));
            expect(true).assertTrue();
            done();
          });
        } catch (err : Error) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] getAllDisplays ayncCallback fail. Err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_displayAddListenerTest_static_0157
     * @tc.name       : windowErrCodeOneStatic_displayAddListenerTest_static_0157
     * @tc.desc       : windowErrCodeOneStatic_displayAddListenerTest_static_0157
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_displayAddListenerTest_static_0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback1: Callback<number> = (data: number): void => {
          hilog.info(0x0000, '[ANI]', 'Listening enabled. Data: ' + JSON.stringify(data));
        };
        try {
          display.on("add", callback1);
          display.off("add", callback1);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_add success');
          expect(true).assertTrue();
        } catch (err: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] on_add fail Err: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_foldStatusChangeListenerTest_static_0158
     * @tc.name       : windowErrCodeOneStatic_foldStatusChangeListenerTest_static_0158
     * @tc.desc       : windowErrCodeOneStatic_foldStatusChangeListenerTest_static_0158
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_foldStatusChangeListenerTest_static_0158",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let callback2: Callback<display.FoldStatus> = (data: display.FoldStatus): void => {
          hilog.info(0x0000, '[ANI]', 'Listening enabled. Data: ' + JSON.stringify(data));
        };
        try {
          display.on("foldStatusChange", callback2);
          display.off("foldStatusChange", callback2);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_foldStatusChange success');
          expect(true).assertTrue();
        } catch (err: Error) {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] off_foldStatusChange fail' + err);
          expect(false).assertTrue();
        }
        done();
      });


  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');

}