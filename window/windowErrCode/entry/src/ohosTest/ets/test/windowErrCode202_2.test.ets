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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function windowErrCode202_2(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('windowErrCode202_2', () => {
    console.log('describe windowErrCode202_2 start!!!')

    /**
     * @tc.number     : testOpacityErrCode202_0100
     * @tc.name       : testOpacityErrCode202_0100
     * @tc.desc       : testOpacityErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOpacityErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testOpacityErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testOpacityErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.opacity(1);
        console.error(msgStr + 'Succeeded in calling opacity.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call opacity. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testScaleErrCode202_0100
     * @tc.name       : testScaleErrCode202_0100
     * @tc.desc       : testScaleErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testScaleErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testScaleErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testScaleErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        let param: ohosWindow.ScaleOptions = {};
        win!.scale(param);
        console.error(msgStr + 'Succeeded in calling scale.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call scale. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testRotateErrCode202_0100
     * @tc.name       : testRotateErrCode202_0100
     * @tc.desc       : testRotateErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testRotateErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testRotateErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testRotateErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        let param: ohosWindow.RotateOptions = {}
        win!.rotate(param);
        console.error(msgStr + 'Succeeded in calling rotate.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call rotate. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testTranslateErrCode202_0100
     * @tc.name       : testTranslateErrCode202_0100
     * @tc.desc       : testTranslateErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTranslateErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testTranslateErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testTranslateErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        let param: ohosWindow.TranslateOptions = {}
        win!.translate(param);
        console.error(msgStr + 'Succeeded in calling translate.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call translate. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testGetTransitionControllerErrCode202_0100
     * @tc.name       : testGetTransitionControllerErrCode202_0100
     * @tc.desc       : testGetTransitionControllerErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetTransitionControllerErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testGetTransitionControllerErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testGetTransitionControllerErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.getTransitionController();
        console.error(msgStr + 'Succeeded in calling getTransitionController.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call getTransitionController. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetBlurErrCode202_0100
     * @tc.name       : testSetBlurErrCode202_0100
     * @tc.desc       : testSetBlurErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetBlurErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetBlurErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetBlurErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.setBlur(1);
        console.error(msgStr + 'Succeeded in calling setBlur.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setBlur. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetBackdropBlurErrCode202_0100
     * @tc.name       : testSetBackdropBlurErrCode202_0100
     * @tc.desc       : testSetBackdropBlurErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetBackdropBlurErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetBackdropBlurErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetBackdropBlurErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.setBackdropBlur(1);
        console.error(msgStr + 'Succeeded in calling setBackdropBlur.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setBackdropBlur. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetBackdropBlurStyleErrCode202_0100
     * @tc.name       : testSetBackdropBlurStyleErrCode202_0100
     * @tc.desc       : testSetBackdropBlurStyleErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetBackdropBlurStyleErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetBackdropBlurStyleErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetBackdropBlurStyleErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.setBackdropBlurStyle(ohosWindow.BlurStyle.THIN);
        console.error(msgStr + 'Succeeded in calling setBackdropBlurStyle.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setBackdropBlurStyle. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetShadowErrCode202_0100
     * @tc.name       : testSetShadowErrCode202_0100
     * @tc.desc       : testSetShadowErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetShadowErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetShadowErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetShadowErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.setShadow(1);
        console.error(msgStr + 'Succeeded in calling setShadow.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setShadow. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetCornerRadiusErrCode202_0100
     * @tc.name       : testSetCornerRadiusErrCode202_0100
     * @tc.desc       : testSetCornerRadiusErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetCornerRadiusErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetCornerRadiusErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetCornerRadiusErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.setCornerRadius(1);
        console.error(msgStr + 'Succeeded in calling setCornerRadius.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setCornerRadius. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetSingleFrameComposerEnabledPromiseErrCode202_0100
     * @tc.name       : testSetSingleFrameComposerEnabledPromiseErrCode202_0100
     * @tc.desc       : testSetSingleFrameComposerEnabledPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetSingleFrameComposerEnabledPromiseErrCode202_0100', 0, async (done: Function) => {
      {
        let caseName = "testSetSingleFrameComposerEnabledPromiseErrCode202_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');

        let windowConfig: ohosWindow.Configuration = {
          name: "testSetSingleFrameComposerEnabledPromiseErrCode202_0100",
          windowType: ohosWindow.WindowType.TYPE_DIALOG,
          ctx: context,
        };
        let win: ohosWindow.Window | undefined = undefined;
        try {
          win = await ohosWindow.createWindow(windowConfig);
          expect(!!win).assertTrue();
        } catch (err) {
          console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        }

        try {
          await win!.setSingleFrameComposerEnabled(true).then(async () => {
            console.info(msgStr + 'Succeeded in calling setSingleFrameComposerEnabled.');
            expect().assertFail();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call setSingleFrameComposerEnabled. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
          });
          await win!.destroyWindow()
          done()
        } catch (exception) {
          console.error(msgStr + 'Failed to set the call setSingleFrameComposerEnabled. Cause:' +
          JSON.stringify(exception));
          await win!.destroyWindow()
          expect(exception.code).assertEqual(202);
          done()
        }
      }
    })

    /**
     * @tc.number     : testSetTouchableAreasErrCode202_0100
     * @tc.name       : testSetTouchableAreasErrCode202_0100
     * @tc.desc       : testSetTouchableAreasErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetTouchableAreasErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetTouchableAreasErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetTouchableAreasErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        }
        win!.setTouchableAreas([rect]);
        console.error(msgStr + 'Succeeded in calling setTouchableAreas.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setTouchableAreas. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetTitleButtonVisibleErrCode202_0100
     * @tc.name       : testSetTitleButtonVisibleErrCode202_0100
     * @tc.desc       : testSetTitleButtonVisibleErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetTitleButtonVisibleErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetTitleButtonVisibleErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetTitleButtonVisibleErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        win!.setTitleButtonVisible(true, true, true);
        console.error(msgStr + 'Succeeded in calling setTitleButtonVisible.');
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setTitleButtonVisible. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testEnableDragPromiseErrCode202_0100
     * @tc.name       : testEnableDragPromiseErrCode202_0100
     * @tc.desc       : testEnableDragPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testEnableDragPromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testEnableDragPromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testEnableDragPromiseErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        await win!.enableDrag(false).then(async () => {
          console.info(msgStr + 'Succeeded in calling enableDrag.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call enableDrag. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call enableDrag. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testDisableWindowDecorErrCode202_0100
     * @tc.name       : testDisableWindowDecorErrCode202_0100
     * @tc.desc       : testDisableWindowDecorErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testDisableWindowDecorErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testDisableWindowDecorErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        windowStage.disableWindowDecor();
        console.error(msgStr + 'Succeeded in calling disableWindowDecor.');
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call disableWindowDecor. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        console.log(msgStr + 'end.');
        done()
      }
    })

    /**
     * @tc.number     : testSetShowOnLockScreenErrCode202_0100
     * @tc.name       : testSetShowOnLockScreenErrCode202_0100
     * @tc.desc       : testSetShowOnLockScreenErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetShowOnLockScreenErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetShowOnLockScreenErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.setShowOnLockScreen(true);
        console.error(msgStr + 'Succeeded in calling setShowOnLockScreen.');
        console.log(msgStr + 'end.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setShowOnLockScreen. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(202);
        console.log(msgStr + 'end.');
        done()
      }
    })
  })
}