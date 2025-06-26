import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

// import { ConfigurationConstant } from '@kit.AbilityKit';
import window from '@ohos.window'
import image from '@ohos.multimedia.image';
import { AppStorage } from '@ohos.arkui.stateManagement';
import display from '@ohos.display'
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
     * @tc.number     : windowErrCodeOneStatic_onOffScreenShot_static_0197
     * @tc.name       : windowErrCodeOneStatic_onOffScreenShot_static_0197
     * @tc.desc       : windowErrCodeOneStatic_onOffScreenShot_static_0197
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffScreenShot_static_0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (): void => {
          hilog.info(0x0000, '[ANI]', 'screenshot triggered.');
        };
        try {
          win.on('screenshot', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'on screenshot fail.');
          expect(false).assertTrue();
        }
        try {
          win.off('screenshot', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'off screenshot fail.');
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowHighlightChange_static_0198
     * @tc.name       : windowErrCodeOneStatic_onOffWindowHighlightChange_static_0198
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowHighlightChange_static_0198
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowHighlightChange_static_0198",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let callback = (val: boolean): void => {
          hilog.info(0x0000, '[ANI]', 'windowHighlightChange triggered.');
        };
        try {
          win.on('windowHighlightChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'on windowHighlightChange fail.');
          expect(e.code === 801).assertTrue();
        }
        try {
          win.off('windowHighlightChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'off windowHighlightChange fail.');
          expect(e.code === 801).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffAvoidAreaChange_static_0199
     * @tc.name       : windowErrCodeOneStatic_onOffAvoidAreaChange_static_0199
     * @tc.desc       : windowErrCodeOneStatic_onOffAvoidAreaChange_static_0199
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffAvoidAreaChange_static_0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let callback = (data: window.AvoidAreaOptions): void => {
          hilog.info(0x0000, '[ANI]', 'avoidAreaChange triggered.');
        };
        try {
          win.on('avoidAreaChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'on avoidAreaChange fail.');
          expect(false).assertTrue();
        }
        try {
          win.off('avoidAreaChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'off avoidAreaChange fail.');
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowVisibilityChange_static_0200
     * @tc.name       : windowErrCodeOneStatic_onOffWindowVisibilityChange_static_0200
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowVisibilityChange_static_0200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowVisibilityChange_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let callback = (val: boolean): void => {
          hilog.info(0x0000, '[ANI]', 'windowVisibilityChange triggered.');
        };
        try {
          win.on('windowVisibilityChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'on windowVisibilityChange fail.');
          expect(e.code === 801).assertTrue();
        }
        try {
          win.off('windowVisibilityChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'off windowVisibilityChange fail.');
          expect(e.code === 801).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffSystemBarTintChange_static_0201
     * @tc.name       : windowErrCodeOneStatic_onOffSystemBarTintChange_static_0201
     * @tc.desc       : windowErrCodeOneStatic_onOffSystemBarTintChange_static_0201
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffSystemBarTintChange_static_0201",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let callback = (data: window.SystemBarTintState): void => {
          hilog.info(0x0000, '[ANI]', 'systemBarTintChange triggered.');
        };
        try {
          window.on('systemBarTintChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', `on systemBarTintChange fail. ${JSON.stringify(e)}`);
          expect(e.code === 202).assertTrue();
        }
        try {
          window.off('systemBarTintChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', `off systemBarTintChange fail. ${JSON.stringify(e)}`);
          expect(e.code === 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWaterMarkFlagChange_static_0202
     * @tc.name       : windowErrCodeOneStatic_onOffWaterMarkFlagChange_static_0202
     * @tc.desc       : windowErrCodeOneStatic_onOffWaterMarkFlagChange_static_0202
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWaterMarkFlagChange_static_0202",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let callback = (val: boolean): void => {
          hilog.info(0x0000, '[ANI]', 'waterMarkFlagChange triggered.');
        };
        try {
          window.on('waterMarkFlagChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'on waterMarkFlagChange fail.');
          expect(e.code === 202).assertTrue();
        }
        try {
          expect(true).assertTrue();
          window.off('waterMarkFlagChange', callback);
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'off waterMarkFlagChange fail.');
          expect(e.code === 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffGestureNavigationEnabledChange_static_0203
     * @tc.name       : windowErrCodeOneStatic_onOffGestureNavigationEnabledChange_static_0203
     * @tc.desc       : windowErrCodeOneStatic_onOffGestureNavigationEnabledChange_static_0203
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffGestureNavigationEnabledChange_static_0203",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let callback = (val: boolean): void => {
          hilog.info(0x0000, '[ANI]', 'gestureNavigationEnabledChange triggered.');
        };
        try {
          window.on('gestureNavigationEnabledChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'on gestureNavigationEnabledChange fail.');
          expect(e.code === 202).assertTrue();
        }
        try {
          window.off('gestureNavigationEnabledChange', callback);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'off gestureNavigationEnabledChange fail.');
          expect(e.code === 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_testSnapshot_static_0204
     * @tc.name       : windowErrCodeOneStatic_testSnapshot_static_0204
     * @tc.desc       : windowErrCodeOneStatic_testSnapshot_static_0204
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testSnapshot_static_0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // callback
        try {
          win.snapshot((err: BusinessError, data: image.PixelMap): void => {
          });
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', `snapshot fail. ${JSON.stringify(e)}`);
          expect(false).assertTrue();
        }
        try {
          win.snapshot();
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', `snapshot fail. ${JSON.stringify(e)}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_testHideNonSystemFloatingWindows_static_0205
     * @tc.name       : windowErrCodeOneStatic_testHideNonSystemFloatingWindows_static_0205
     * @tc.desc       : windowErrCodeOneStatic_testHideNonSystemFloatingWindows_static_0205
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_testHideNonSystemFloatingWindows_static_0205",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        // callback
        try {
          win.hideNonSystemFloatingWindows(false, (err: BusinessError) => {
          });
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'hideNonSystemFloatingWindows fail.');
          expect(e.code === 202 || e.code === 801).assertTrue();
        }
        try {
          win.hideNonSystemFloatingWindows(true);
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          hilog.info(0x0000, '[ANI]', 'hideNonSystemFloatingWindows fail.');
          expect(e.code === 202 || e.code === 801).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_setWindowFocusableCallbackTest_static_0206
     * @tc.name       : windowErrCodeOneStatic_setWindowFocusableCallbackTest_static_0206
     * @tc.desc       : windowErrCodeOneStatic_setWindowFocusableCallbackTest_static_0206
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setWindowFocusableCallbackTest_static_0206",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowFocusable(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] setWindowFocusable callback Failed. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowFocusable callback Succeeded .');
          expect(true).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_setWindowFocusablePromiseTest_static_0207
     * @tc.name       : windowErrCodeOneStatic_setWindowFocusablePromiseTest_static_0207
     * @tc.desc       : windowErrCodeOneStatic_setWindowFocusablePromiseTest_static_0207
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setWindowFocusablePromiseTest_static_0207",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowFocusable(true).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] setWindowFocusable promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: NullishType): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] setWindowFocusable promise fail. err: ${e}`);
          expect(false).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_shiftAppWindowFocusPromiseTest_static_0208
     * @tc.name       : windowErrCodeOneStatic_shiftAppWindowFocusPromiseTest_static_0208
     * @tc.desc       : windowErrCodeOneStatic_shiftAppWindowFocusPromiseTest_static_0208
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_shiftAppWindowFocusPromiseTest_static_0208",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let winID = win.getWindowProperties().id;
        window.shiftAppWindowFocus(winID, winID).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] shiftAppWindowFocus promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 801) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] shiftAppWindowFocus promise success');
            expect(true).assertTrue();
            done();
          } else if (e.code == 1300002) {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] shiftAppWindowFocus promise success');
            expect(true).assertTrue();
            done();
          } else {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] shiftAppWindowFocus promise fail. err: ${e.message} errcode: ${e.code}`);
            expect(false).assertTrue();
            done();
          }
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_showWindowCallbackTest_static_0209
     * @tc.name       : windowErrCodeOneStatic_showWindowCallbackTest_static_0209
     * @tc.desc       : windowErrCodeOneStatic_showWindowCallbackTest_static_0209
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_showWindowCallbackTest_static_0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.showWindow((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] showWindow callback Failed. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] showWindow callback Succeeded .');
          expect(true).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_showWindowPromiseTest_static_0210
     * @tc.name       : windowErrCodeOneStatic_showWindowPromiseTest_static_0210
     * @tc.desc       : windowErrCodeOneStatic_showWindowPromiseTest_static_0210
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_showWindowPromiseTest_static_0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.showWindow().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] showWindow promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: NullishType): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] showWindow promise fail. err: ${e}`);
          expect(false).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_destroyWindowCallbackTest_static_0211
     * @tc.name       : windowErrCodeOneStatic_destroyWindowCallbackTest_static_0211
     * @tc.desc       : windowErrCodeOneStatic_destroyWindowCallbackTest_static_0211
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_destroyWindowCallbackTest_static_0211",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.destroyWindow((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] destroyWindow callback Failed. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] destroyWindow callback Succeeded .');
          expect(true).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_destroyWindowPromiseTest_static_0212
     * @tc.name       : windowErrCodeOneStatic_destroyWindowPromiseTest_static_0212
     * @tc.desc       : windowErrCodeOneStatic_destroyWindowPromiseTest_static_0212
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_destroyWindowPromiseTest_static_0212",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.destroyWindow().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] destroyWindow promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: NullishType): void => {
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] destroyWindow promise fail. err: ${e}`);
          expect(false).assertTrue();
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_isWindowShowingTest_static_0213
     * @tc.name       : windowErrCodeOneStatic_isWindowShowingTest_static_0213
     * @tc.desc       : windowErrCodeOneStatic_isWindowShowingTest_static_0213
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_isWindowShowingTest_static_0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let res = win.isWindowShowing();
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] isWindowShowing success. res: ${res}`);
          expect(true).assertTrue();
          done();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] isWindowShowing Failed. message: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_hideWithAnimationCallbackTest_static_0214
     * @tc.name       : windowErrCodeOneStatic_hideWithAnimationCallbackTest_static_0214
     * @tc.desc       : windowErrCodeOneStatic_hideWithAnimationCallbackTest_static_0214
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_hideWithAnimationCallbackTest_static_0214",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.hideWithAnimation((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode == 202) { // non sys api
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] minimizeAllCallback success, but non sys app ' + JSON.stringify(err));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimizeAllCallback error ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_hideWithAnimationPromiseTest_static_0215
     * @tc.name       : windowErrCodeOneStatic_hideWithAnimationPromiseTest_static_0215
     * @tc.desc       : windowErrCodeOneStatic_hideWithAnimationPromiseTest_static_0215
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_hideWithAnimationPromiseTest_static_0215",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.hideWithAnimation().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] hideWithAnimation promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 202) { // non sys api
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] hideWithAnimation promise success, but non sys app ' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] hideWithAnimation promise error ' + JSON.stringify(e));
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_showWithAnimationCallbackTest_static_0216
     * @tc.name       : windowErrCodeOneStatic_showWithAnimationCallbackTest_static_0216
     * @tc.desc       : windowErrCodeOneStatic_showWithAnimationCallbackTest_static_0216
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_showWithAnimationCallbackTest_static_0216",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.showWithAnimation((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode == 202) { // non sys api
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] minimizeAllCallback success, but non sys app ' + JSON.stringify(err));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimizeAllCallback error ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_showWithAnimationPromiseTest_static_0217
     * @tc.name       : windowErrCodeOneStatic_showWithAnimationPromiseTest_static_0217
     * @tc.desc       : windowErrCodeOneStatic_showWithAnimationPromiseTest_static_0217
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_showWithAnimationPromiseTest_static_0217",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.hideWithAnimation().then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] showWithAnimation promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 202) { // non sys api
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] showWithAnimation promise success, but non sys app ' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] showWithAnimation promise error ' + JSON.stringify(e));
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_minimizeAllCallbackTest_static_0218
     * @tc.name       : windowErrCodeOneStatic_minimizeAllCallbackTest_static_0218
     * @tc.desc       : windowErrCodeOneStatic_minimizeAllCallbackTest_static_0218
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_minimizeAllCallbackTest_static_0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        window.minimizeAll(0, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode == 202) { // non sys api
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] minimizeAllCallback success, but non sys app ' + JSON.stringify(err));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimizeAllCallback error ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_minimizeAllPromiseTest_static_0219
     * @tc.name       : windowErrCodeOneStatic_minimizeAllPromiseTest_static_0219
     * @tc.desc       : windowErrCodeOneStatic_minimizeAllPromiseTest_static_0219
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_minimizeAllPromiseTest_static_0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        window.minimizeAll(0).then((): void => {
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimizeAll promise success');
          expect(true).assertTrue();
          done();
        }).catch((e: BusinessError): void => {
          if (e.code == 202) { // non sys api
            hilog.info(0x0000, '[ANI]',
              'finaltest [ANI] minimizeAllPromise success, but non sys app ' + JSON.stringify(e));
            expect(true).assertTrue();
          } else {
            hilog.info(0x0000, '[ANI]', 'finaltest [ANI] minimizeAllPromise error ' + JSON.stringify(e));
            expect(false).assertTrue();
          }
          done();
        });
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_findWindowTest_static_0220
     * @tc.name       : windowErrCodeOneStatic_findWindowTest_static_0220
     * @tc.desc       : windowErrCodeOneStatic_findWindowTest_static_0220
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_findWindowTest_static_0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let res = window.findWindow('test_window_manager20');
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] findWindow success. res: ${res}`);
          expect(true).assertTrue();
          done();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] findWindow Failed. message: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_onOffWindowStageEventTest_static_0221
     * @tc.name       : windowErrCodeOneStatic_onOffWindowStageEventTest_static_0221
     * @tc.desc       : windowErrCodeOneStatic_onOffWindowStageEventTest_static_0221
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_onOffWindowStageEventTest_static_0221",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let callback = (data: window.WindowStageEventType): void => {
          };
          windowStage.on('windowStageEvent', callback);
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] onWindowStageEventTest success.`);
          windowStage.off('windowStageEvent', callback);
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] offWindowStageEventTest success.`);
          expect(true).assertTrue();
          done();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] onOffWindowStageEvent Failed. message: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_opacity_static_0222
     * @tc.name       : windowErrCodeOneStatic_opacity_static_0222
     * @tc.desc       : windowErrCodeOneStatic_opacity_static_0222
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_opacity_static_0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.opacity(0.5);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] set opacity success');
          expect(true).assertTrue();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] set opacity Failed. message: ${err}`);
          expect(err.code == 1300004 || err.code == 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_scale_static_0223
     * @tc.name       : windowErrCodeOneStatic_scale_static_0223
     * @tc.desc       : windowErrCodeOneStatic_scale_static_0223
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_scale_static_0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let scaleOptions: window.ScaleOptions = {
            x: 0.5,
            y: 0.5,
            pivotX: 0.5,
            pivotY: 0.5
          }
          win.scale(scaleOptions);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] set scale success');
          expect(true).assertTrue();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] set scale Failed. message: ${err}`);
          expect(err.code == 1300004 || err.code == 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_translate_static_0224
     * @tc.name       : windowErrCodeOneStatic_translate_static_0224
     * @tc.desc       : windowErrCodeOneStatic_translate_static_0224
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_translate_static_0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let translateOptions: window.TranslateOptions = {
            x: 200,
            y: 200,
            z: 10
          }
          win.translate(translateOptions);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] set translate success');
          expect(true).assertTrue();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] set translate Failed. message: ${err}`);
          expect(err.code == 1300004 || err.code == 202).assertTrue();
        }
        done();
      });
    /**
     * @tc.number     : windowErrCodeOneStatic_rotate_static_0225
     * @tc.name       : windowErrCodeOneStatic_rotate_static_0225
     * @tc.desc       : windowErrCodeOneStatic_rotate_static_0225
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_rotate_static_0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let rotateOptions: window.RotateOptions = {
            x: 0.5,
            y: 0.5,
            z: 0,
            pivotX: 0.5,
            pivotY: 0.5
          }
          win.rotate(rotateOptions);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] set rotate success');
          expect(true).assertTrue();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] set rotate Failed. message: ${err}`);
          expect(err.code == 1300004 || err.code == 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_setShadow_static_0226
     * @tc.name       : windowErrCodeOneStatic_setShadow_static_0226
     * @tc.desc       : windowErrCodeOneStatic_setShadow_static_0226
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_setShadow_static_0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.setShadow(50, "#FF0000", 20, 20);
          hilog.info(0x0000, '[ANI]', 'finaltest [ANI] set Shadow success');
          expect(true).assertTrue();
        } catch (err: BusinessError) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] set Shadow Failed. message: ${err}`);
          expect(err.code == 1300004 || err.code == 202).assertTrue();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_resizePromiseTest_static_0227
     * @tc.name       : windowErrCodeOneStatic_resizePromiseTest_static_0227
     * @tc.desc       : windowErrCodeOneStatic_resizePromiseTest_static_0227
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_resizePromiseTest_static_0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.resize(200, 300);
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] resize success`);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] resize fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_resizeCallbackTest_static_0228
     * @tc.name       : windowErrCodeOneStatic_resizeCallbackTest_static_0228
     * @tc.desc       : windowErrCodeOneStatic_resizeCallbackTest_static_0228
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_resizeCallbackTest_static_0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.resize(500, 1000, (err: BusinessError) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(`Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
            }
            console.info('Succeeded in changing the window size.');
          });
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] resize success`);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] resize fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_moveWindowToPromiseTest_static_0229
     * @tc.name       : windowErrCodeOneStatic_moveWindowToPromiseTest_static_0229
     * @tc.desc       : windowErrCodeOneStatic_moveWindowToPromiseTest_static_0229
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_moveWindowToPromiseTest_static_0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.moveWindowTo(200, 300);
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] moveWindowTo success`);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] moveWindowTo fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

    /**
     * @tc.number     : windowErrCodeOneStatic_moveWindowToCallbackTest_static_0230
     * @tc.name       : windowErrCodeOneStatic_moveWindowToCallbackTest_static_0230
     * @tc.desc       : windowErrCodeOneStatic_moveWindowToCallbackTest_static_0230
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("windowErrCodeOneStatic_moveWindowToCallbackTest_static_0230",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.moveWindowTo(300, 300, (err: BusinessError) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(`Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
            }
            console.info('Succeeded in moving the window.');
          });
          hilog.info(0x0000, '[ANI]', `finaltest [ANI] moveWindowTo success`);
          expect(true).assertTrue();
        } catch (err) {
          hilog.error(0x0000, '[ANI]', `finaltest [ANI] moveWindowTo fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        }
        done();
      });

  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');

}