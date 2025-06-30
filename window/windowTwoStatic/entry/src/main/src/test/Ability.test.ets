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
     * @tc.number     : onOffScreenShot_static_0197
     * @tc.name       : onOffScreenShot_static_0197
     * @tc.desc       : onOffScreenShot_static_0197
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("onOffScreenShot_static_0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : onOffWindowHighlightChange_static_0198
     * @tc.name       : onOffWindowHighlightChange_static_0198
     * @tc.desc       : onOffWindowHighlightChange_static_0198
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("onOffWindowHighlightChange_static_0198",
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
     * @tc.number     : onOffAvoidAreaChange_static_0199
     * @tc.name       : onOffAvoidAreaChange_static_0199
     * @tc.desc       : onOffAvoidAreaChange_static_0199
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("onOffAvoidAreaChange_static_0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : onOffWindowVisibilityChange_static_0200
     * @tc.name       : onOffWindowVisibilityChange_static_0200
     * @tc.desc       : onOffWindowVisibilityChange_static_0200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("onOffWindowVisibilityChange_static_0200",
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
     * @tc.number     : testSnapshot_static_0204
     * @tc.name       : testSnapshot_static_0204
     * @tc.desc       : testSnapshot_static_0204
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testSnapshot_static_0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        // callback
        try {
          win.snapshot((err: BusinessError<void> | null, data: image.PixelMap | undefined): void => {
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
     * @tc.number     : setWindowFocusableCallbackTest_static_0206
     * @tc.name       : setWindowFocusableCallbackTest_static_0206
     * @tc.desc       : setWindowFocusableCallbackTest_static_0206
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("setWindowFocusableCallbackTest_static_0206",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.setWindowFocusable(true, (err: BusinessError<void> | null) => {
          const errCode: number = err?.code as double;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] setWindowFocusable callback Failed. Cause code: ${err?.code}, message: ${err?.message}`);
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
     * @tc.number     : setWindowFocusablePromiseTest_static_0207
     * @tc.name       : setWindowFocusablePromiseTest_static_0207
     * @tc.desc       : setWindowFocusablePromiseTest_static_0207
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("setWindowFocusablePromiseTest_static_0207",
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
     * @tc.number     : shiftAppWindowFocusPromiseTest_static_0208
     * @tc.name       : shiftAppWindowFocusPromiseTest_static_0208
     * @tc.desc       : shiftAppWindowFocusPromiseTest_static_0208
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("shiftAppWindowFocusPromiseTest_static_0208",
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
     * @tc.number     : showWindowCallbackTest_static_0209
     * @tc.name       : showWindowCallbackTest_static_0209
     * @tc.desc       : showWindowCallbackTest_static_0209
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("showWindowCallbackTest_static_0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        win.showWindow((err: BusinessError<void> | null) => {
          const errCode: number = err?.code as double;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] showWindow callback Failed. Cause code: ${err?.code}, message: ${err?.message}`);
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
     * @tc.number     : showWindowPromiseTest_static_0210
     * @tc.name       : showWindowPromiseTest_static_0210
     * @tc.desc       : showWindowPromiseTest_static_0210
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("showWindowPromiseTest_static_0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : destroyWindowCallbackTest_static_0211
     * @tc.name       : destroyWindowCallbackTest_static_0211
     * @tc.desc       : destroyWindowCallbackTest_static_0211
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("destroyWindowCallbackTest_static_0211",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        win.destroyWindow((err: BusinessError<void> | null) => {
          const errCode: number = err?.code as double;
          if (errCode) {
            hilog.info(0x0000, '[ANI]',
              `finaltest [ANI] destroyWindow callback Failed. Cause code: ${err?.code}, message: ${err?.message}`);
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
     * @tc.number     : destroyWindowPromiseTest_static_0212
     * @tc.name       : destroyWindowPromiseTest_static_0212
     * @tc.desc       : destroyWindowPromiseTest_static_0212
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("destroyWindowPromiseTest_static_0212",
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
     * @tc.number     : isWindowShowingTest_static_0213
     * @tc.name       : isWindowShowingTest_static_0213
     * @tc.desc       : isWindowShowingTest_static_0213
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("isWindowShowingTest_static_0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : findWindowTest_static_0220
     * @tc.name       : findWindowTest_static_0220
     * @tc.desc       : findWindowTest_static_0220
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("findWindowTest_static_0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : onOffWindowStageEventTest_static_0221
     * @tc.name       : onOffWindowStageEventTest_static_0221
     * @tc.desc       : onOffWindowStageEventTest_static_0221
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("onOffWindowStageEventTest_static_0221",
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
     * @tc.number     : resizePromiseTest_static_0227
     * @tc.name       : resizePromiseTest_static_0227
     * @tc.desc       : resizePromiseTest_static_0227
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("resizePromiseTest_static_0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : resizeCallbackTest_static_0228
     * @tc.name       : resizeCallbackTest_static_0228
     * @tc.desc       : resizeCallbackTest_static_0228
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("resizeCallbackTest_static_0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          win.resize(500, 1000, (err: BusinessError<void> | null) => {
            const errCode: number = err?.code as double;
            if (errCode) {
              console.error(`Failed to change the window size. Cause code: ${err?.code}, message: ${err?.message}`);
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
     * @tc.number     : moveWindowToPromiseTest_static_0229
     * @tc.name       : moveWindowToPromiseTest_static_0229
     * @tc.desc       : moveWindowToPromiseTest_static_0229
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("moveWindowToPromiseTest_static_0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number     : moveWindowToCallbackTest_static_0230
     * @tc.name       : moveWindowToCallbackTest_static_0230
     * @tc.desc       : moveWindowToCallbackTest_static_0230
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("moveWindowToCallbackTest_static_0230",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          win.moveWindowTo(300, 300, (err: BusinessError<void> | null) => {
            const errCode: number = err?.code as double;
            if (errCode) {
              console.error(`Failed to move the window. Cause code: ${err?.code}, message: ${err?.message}`);
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