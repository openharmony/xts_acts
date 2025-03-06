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
import { image } from '@kit.ImageKit';
import rpc from '@ohos.rpc';

export default function windowErrCode202_1(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('windowErrCode202_1', () => {
    console.log('describe windowErrCode202_1 start!!!')


    // /**
    //  * @tc.number     : testCompleteTransitionErrCode202_0100
    //  * @tc.name       : testCompleteTransitionErrCode202_0100
    //  * @tc.desc       : testCompleteTransitionErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    //  it('testCompleteTransitionErrCode202_0100', 0, async (done: Function) => {{
    //   let caseName = "testCompleteTransitionErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   //
    //   let testcaseResult = true;
    //   try {
    //     ohosWindow.TransitionContext.completeTransition(true);
    //     console.error(msgStr + 'Succeeded in calling completeTransition.');
    //     testcaseResult = false;
    //   } catch (e) {
    //     console.log(msgStr + 'Failed to call completeTransition. Cause:' + JSON.stringify(e));
    //     testcaseResult = e.code == 202;
    //   }
    //   console.log(msgStr + 'end.');
    //   expect(testcaseResult).assertTrue();
    //   done();
    //
    // }})

    // /**
    //  * @tc.number     : testAnimationForShownErrCode202_0100
    //  * @tc.name       : testAnimationForShownErrCode202_0100
    //  * @tc.desc       : testAnimationForShownErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    //  it('testAnimationForShownErrCode202_0100', 0, async (done: Function) => {{
    //   let caseName = "testAnimationForShownErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   let testcaseResult = true;
    //   try {
    //     let controller: ohosWindow.TransitionController = ohosWindow.getTransitionController();
    //     controller.animationForShown(ohosWindow.TransitionContext);
    //     console.error(msgStr + 'Succeeded in calling animationForShown.');
    //     testcaseResult = false;
    //   } catch (e) {
    //     console.log(msgStr + 'Failed to call animationForShown. Cause:' + JSON.stringify(e));
    //     testcaseResult = e.code == 202;
    //   }
    //   console.log(msgStr + 'end.');
    //   expect(testcaseResult).assertTrue();
    //   done();
    //
    //   }})

    // /**
    //  * @tc.number     : testAnimationForHiddenErrCode202_0100
    //  * @tc.name       : testAnimationForHiddenErrCode202_0100
    //  * @tc.desc       : testAnimationForHiddenErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    //  it('testAnimationForHiddenErrCode202_0100', 0, async (done: Function) => {{
    //   let caseName = "testAnimationForHiddenErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   let testcaseResult = true;
    //   try {
    //     let controller: ohosWindow.TransitionController = ohosWindow.getTransitionController();
    //     controller.animationForHidden(ohosWindow.TransitionContext);
    //     console.error(msgStr + 'Succeeded in calling animationForHidden.');
    //     testcaseResult = false;
    //   } catch (e) {
    //     console.log(msgStr + 'Failed to call animationForHidden. Cause:' + JSON.stringify(e));
    //     testcaseResult = e.code == 202;
    //   }
    //   console.log(msgStr + 'end.');
    //   expect(testcaseResult).assertTrue();
    //   done();
    //
    //   }})

    // /**
    //  * @tc.number     : testMinimizeAllCallbackErrCode202_0100
    //  * @tc.name       : testMinimizeAllCallbackErrCode202_0100
    //  * @tc.desc       : testMinimizeAllCallbackErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testMinimizeAllCallbackErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testMinimizeAllCallbackErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   try {
    //     ohosWindow.minimizeAll(1, async (err: BusinessError) => {
    //       const errCode: number = err.code;
    //       if (errCode) {
    //         console.error(msgStr + 'Failed to call minimizeAll. Cause:' + JSON.stringify(err));
    //         expect(err.code).assertEqual(202);
    //         done()
    //         return;
    //       }
    //       console.info(msgStr + 'Succeeded in calling minimizeAll.');
    //       expect().assertFail();
    //       done();
    //     });
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed to call minimizeAll. Cause:' + JSON.stringify(exception));
    //     expect(exception.code).assertEqual(202);
    //     done()
    //   }
    // })
    //
    // /**
    //  * @tc.number     : testMinimizeAllPromiseErrCode202_0100
    //  * @tc.name       : testMinimizeAllPromiseErrCode202_0100
    //  * @tc.desc       : testMinimizeAllPromiseErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testMinimizeAllPromiseErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testMinimizeAllPromiseErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   try {
    //     await ohosWindow.minimizeAll(1).then(async () => {
    //       console.info(msgStr + 'Succeeded in calling minimizeAll.');
    //       expect().assertFail();
    //       done()
    //     }).catch(async (err: BusinessError) => {
    //       console.error(msgStr + 'Failed to call minimizeAll. Cause: ' + JSON.stringify(err));
    //       expect(err.code).assertEqual(202);
    //       done()
    //     });
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed to set the call minimizeAll. Cause:' + JSON.stringify(exception));
    //     expect(exception.code).assertEqual(202);
    //     done()
    //   }
    // })

    /**
     * @tc.number     : testToggleShownStateForAllAppWindowsCallbackErrCode202_0100
     * @tc.name       : testToggleShownStateForAllAppWindowsCallbackErrCode202_0100
     * @tc.desc       : testToggleShownStateForAllAppWindowsCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testToggleShownStateForAllAppWindowsCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testToggleShownStateForAllAppWindowsCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        ohosWindow.toggleShownStateForAllAppWindows(async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call toggleShownStateForAllAppWindows. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling toggleShownStateForAllAppWindows.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call toggleShownStateForAllAppWindows. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testToggleShownStateForAllAppWindowsPromiseErrCode202_0100
     * @tc.name       : testToggleShownStateForAllAppWindowsPromiseErrCode202_0100
     * @tc.desc       : testToggleShownStateForAllAppWindowsPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testToggleShownStateForAllAppWindowsPromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testToggleShownStateForAllAppWindowsPromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        await ohosWindow.toggleShownStateForAllAppWindows().then(async () => {
          console.info(msgStr + 'Succeeded in calling toggleShownStateForAllAppWindows.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call toggleShownStateForAllAppWindows. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call toggleShownStateForAllAppWindows. Cause:' +
        JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWindowLayoutModeCallbackErrCode202_0100
     * @tc.name       : testSetWindowLayoutModeCallbackErrCode202_0100
     * @tc.desc       : testSetWindowLayoutModeCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowLayoutModeCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWindowLayoutModeCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        ohosWindow.setWindowLayoutMode(ohosWindow.WindowLayoutMode.WINDOW_LAYOUT_MODE_CASCADE,
          async (err: BusinessError) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(msgStr + 'Failed to call setWindowLayoutMode. Cause:' + JSON.stringify(err));
              expect(err.code).assertEqual(202);
              done()
              return;
            }
            console.info(msgStr + 'Succeeded in calling setWindowLayoutMode.');
            expect().assertFail();
            done();
          });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setWindowLayoutMode. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWindowLayoutModePromiseErrCode202_0100
     * @tc.name       : testSetWindowLayoutModePromiseErrCode202_0100
     * @tc.desc       : testSetWindowLayoutModePromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowLayoutModePromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWindowLayoutModePromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        await ohosWindow.setWindowLayoutMode(ohosWindow.WindowLayoutMode.WINDOW_LAYOUT_MODE_CASCADE).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowLayoutMode.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowLayoutMode. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowLayoutMode. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetGestureNavigationEnabledCallbackErrCode202_0100
     * @tc.name       : testSetGestureNavigationEnabledCallbackErrCode202_0100
     * @tc.desc       : testSetGestureNavigationEnabledCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetGestureNavigationEnabledCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetGestureNavigationEnabledCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        ohosWindow.setGestureNavigationEnabled(true, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setGestureNavigationEnabled. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setGestureNavigationEnabled.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setGestureNavigationEnabled. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetGestureNavigationEnabledPromiseErrCode202_0100
     * @tc.name       : testSetGestureNavigationEnabledPromiseErrCode202_0100
     * @tc.desc       : testSetGestureNavigationEnabledPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetGestureNavigationEnabledPromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetGestureNavigationEnabledPromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        await ohosWindow.setGestureNavigationEnabled(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setGestureNavigationEnabled.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setGestureNavigationEnabled. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setGestureNavigationEnabled. Cause:' +
        JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWaterMarkImageCallbackErrCode202_0100
     * @tc.name       : testSetWaterMarkImageCallbackErrCode202_0100
     * @tc.desc       : testSetWaterMarkImageCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWaterMarkImageCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWaterMarkImageCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 512, width: 512
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

        ohosWindow.setWaterMarkImage(pixelMap, true, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWaterMarkImage. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWaterMarkImage.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setWaterMarkImage. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWaterMarkImagePromiseErrCode202_0100
     * @tc.name       : testSetWaterMarkImagePromiseErrCode202_0100
     * @tc.desc       : testSetWaterMarkImagePromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWaterMarkImagePromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWaterMarkImagePromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      try {
        let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: {
            height: 512, width: 512
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await ohosWindow.setWaterMarkImage(pixelMap, true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWaterMarkImage.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWaterMarkImage. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWaterMarkImage. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    // /**
    //  * @tc.number     : testGetVisibleWindowInfoPromiseErrCode202_0100
    //  * @tc.name       : testGetVisibleWindowInfoPromiseErrCode202_0100
    //  * @tc.desc       : testGetVisibleWindowInfoPromiseErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testGetVisibleWindowInfoPromiseErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testGetVisibleWindowInfoPromiseErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   try {
    //     await ohosWindow.getVisibleWindowInfo().then(async (result: Array<ohosWindow.WindowInfo>) => {
    //       console.info(msgStr + 'Succeeded in calling getVisibleWindowInfo.');
    //       expect().assertFail();
    //       done()
    //     }).catch(async (err: BusinessError) => {
    //       console.error(msgStr + 'Failed to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
    //       expect(err.code).assertEqual(202);
    //       done()
    //     });
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed to set the call getVisibleWindowInfo. Cause:' + JSON.stringify(exception));
    //     expect(exception.code).assertEqual(202);
    //     done()
    //   }
    // })

    // /**
    //  * @tc.number     : testGetSnapshotPromiseErrCode202_0100
    //  * @tc.name       : testGetSnapshotPromiseErrCode202_0100
    //  * @tc.desc       : testGetSnapshotPromiseErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testGetSnapshotPromiseErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testGetSnapshotPromiseErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   try {
    //     await ohosWindow.getSnapshot(1).then(async (result: image.PixelMap) => {
    //       console.info(msgStr + 'Succeeded in calling getSnapshot.');
    //       expect().assertFail();
    //       done()
    //     }).catch(async (err: BusinessError) => {
    //       console.error(msgStr + 'Failed to call getSnapshot. Cause: ' + JSON.stringify(err));
    //       expect(err.code).assertEqual(202);
    //       done()
    //     });
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed to set the call getSnapshot. Cause:' + JSON.stringify(exception));
    //     expect(exception.code).assertEqual(202);
    //     done()
    //   }
    // })

    /**
     * @tc.number     : testOnSystemBarTintChangeErrCode202_0100
     * @tc.name       : testOnSystemBarTintChangeErrCode202_0100
     * @tc.desc       : testOnSystemBarTintChangeErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnSystemBarTintChangeErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testOnSystemBarTintChangeErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let testcaseResult = true;
      try {
        ohosWindow.on("systemBarTintChange", (res: ohosWindow.SystemBarTintState) => {
        });
        console.error(msgStr + 'Succeeded in calling on systemBarTintChange.');
        testcaseResult = false;
      } catch (e) {
        console.log(msgStr + 'Failed to call on systemBarTintChange. Cause:' + JSON.stringify(e));
        testcaseResult = e.code == 202;
      }
      console.log(msgStr + 'end.');
      expect(testcaseResult).assertTrue();
      done();
    })

    // /**
    //  * @tc.number     : testOff_systemBarTintChangeErrCode202_0100
    //  * @tc.name       : testOff_systemBarTintChangeErrCode202_0100
    //  * @tc.desc       : testOff_systemBarTintChangeErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testOff_systemBarTintChangeErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testOff_systemBarTintChangeErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   let testcaseResult = true;
    //   try {
    //     ohosWindow.off("systemBarTintChange");
    //     console.error(msgStr + 'Succeeded in calling off systemBarTintChange.');
    //     testcaseResult = false;
    //   } catch (e) {
    //     console.log(msgStr + 'Failed to call off systemBarTintChange. Cause:' + JSON.stringify(e));
    //     testcaseResult = e.code == 202;
    //   }
    //   console.log(msgStr + 'end.');
    //   expect(testcaseResult).assertTrue();
    //   done();
    // })

    /**
     * @tc.number     : testOnGestureNavigationEnabledChangeErrCode202_0100
     * @tc.name       : testOnGestureNavigationEnabledChangeErrCode202_0100
     * @tc.desc       : testOnGestureNavigationEnabledChangeErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnGestureNavigationEnabledChangeErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testOnGestureNavigationEnabledChangeErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let testcaseResult = true;
      try {
        ohosWindow.on("gestureNavigationEnabledChange", (res: boolean) => {
        });
        console.error(msgStr + 'Succeeded in calling on gestureNavigationEnabledChange.');
        testcaseResult = false;
      } catch (e) {
        console.log(msgStr + 'Failed to call on gestureNavigationEnabledChange. Cause:' + JSON.stringify(e));
        testcaseResult = e.code == 202;
      }
      console.log(msgStr + 'end.');
      expect(testcaseResult).assertTrue();
      done();
    })

    // /**
    //  * @tc.number     : testOff_gestureNavigationEnabledChangeErrCode202_0100
    //  * @tc.name       : testOff_gestureNavigationEnabledChangeErrCode202_0100
    //  * @tc.desc       : testOff_gestureNavigationEnabledChangeErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testOff_gestureNavigationEnabledChangeErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testOff_gestureNavigationEnabledChangeErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   let testcaseResult = true;
    //   try {
    //     ohosWindow.off("gestureNavigationEnabledChange");
    //     console.error(msgStr + 'Succeeded in calling off gestureNavigationEnabledChange.');
    //     testcaseResult = false;
    //   } catch (e) {
    //     console.log(msgStr + 'Failed to call off gestureNavigationEnabledChange. Cause:' + JSON.stringify(e));
    //     testcaseResult = e.code == 202;
    //   }
    //   console.log(msgStr + 'end.');
    //   expect(testcaseResult).assertTrue();
    //   done();
    // })

    /**
     * @tc.number     : testOnWaterMarkFlagChangeErrCode202_0100
     * @tc.name       : testOnWaterMarkFlagChangeErrCode202_0100
     * @tc.desc       : testOnWaterMarkFlagChangeErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnWaterMarkFlagChangeErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testOnWaterMarkFlagChangeErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let testcaseResult = true;
      try {
        ohosWindow.on("waterMarkFlagChange", (res: boolean) => {
        });
        console.error(msgStr + 'Succeeded in calling on waterMarkFlagChange.');
        testcaseResult = false;
      } catch (e) {
        console.log(msgStr + 'Failed to call on waterMarkFlagChange. Cause:' + JSON.stringify(e));
        testcaseResult = e.code == 202;
      }
      console.log(msgStr + 'end.');
      expect(testcaseResult).assertTrue();
      done();
    })

    // /**
    //  * @tc.number     : testOff_waterMarkFlagChangeErrCode202_0100
    //  * @tc.name       : testOff_waterMarkFlagChangeErrCode202_0100
    //  * @tc.desc       : testOff_waterMarkFlagChangeErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testOff_waterMarkFlagChangeErrCode202_0100', 0, async (done: Function) => {
    //   let caseName = "testOff_waterMarkFlagChangeErrCode202_0100";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //
    //   let testcaseResult = true;
    //   try {
    //     ohosWindow.off("waterMarkFlagChange");
    //     console.error(msgStr + 'Succeeded in calling off waterMarkFlagChange.');
    //     testcaseResult = false;
    //   } catch (e) {
    //     console.log(msgStr + 'Failed to call off waterMarkFlagChange. Cause:' + JSON.stringify(e));
    //     testcaseResult = e.code == 202;
    //   }
    //   console.log(msgStr + 'end.');
    //   expect(testcaseResult).assertTrue();
    //   done();
    // })

    /**
     * @tc.number     : testHideCallbackErrCode202_0100
     * @tc.name       : testHideCallbackErrCode202_0100
     * @tc.desc       : testHideCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testHideCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testHideCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testHideCallbackErrCode202_0100",
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
        win!.hide(async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call hide. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling hide.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call hide. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testHidePromiseErrCode202_0100
     * @tc.name       : testHidePromiseErrCode202_0100
     * @tc.desc       : testMinimizeAllPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testHidePromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testHidePromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testHidePromiseErrCode202_0100",
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
        await win!.hide().then(async () => {
          console.info(msgStr + 'Succeeded in calling hide.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call hide. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call hide. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : tesHideWithAnimationCallbackErrCode202_0100
     * @tc.name       : tesHideWithAnimationCallbackErrCode202_0100
     * @tc.desc       : tesHideWithAnimationCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('tesHideWithAnimationCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "tesHideWithAnimationCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "tesHideWithAnimationCallbackErrCode202_0100",
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
        win!.hideWithAnimation(async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call hideWithAnimation. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling hideWithAnimation.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call hideWithAnimation. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : tesHideWithAnimationPromiseErrCode202_0100
     * @tc.name       : tesHideWithAnimationPromiseErrCode202_0100
     * @tc.desc       : tesHideWithAnimationPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('tesHideWithAnimationPromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "tesHideWithAnimationPromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "tesHideWithAnimationPromiseErrCode202_0100",
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
        await win!.hideWithAnimation().then(async () => {
          console.info(msgStr + 'Succeeded in calling hideWithAnimation.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call hideWithAnimation. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call hideWithAnimation. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testShowWithAnimationCallbackErrCode202_0100
     * @tc.name       : testShowWithAnimationCallbackErrCode202_0100
     * @tc.desc       : testShowWithAnimationCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testShowWithAnimationCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testShowWithAnimationCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testShowWithAnimationCallbackErrCode202_0100",
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
        win!.showWithAnimation(async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call showWithAnimation. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling showWithAnimation.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call showWithAnimation. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testShowWithAnimationPromsieErrCode202_0100
     * @tc.name       : testShowWithAnimationPromsieErrCode202_0100
     * @tc.desc       : testShowWithAnimationPromsieErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testShowWithAnimationPromsieErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testShowWithAnimationPromsieErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testShowWithAnimationPromsieErrCode202_0100",
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
        await win!.showWithAnimation().then(async () => {
          console.info(msgStr + 'Succeeded in calling showWithAnimation.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call showWithAnimation. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call showWithAnimation. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWindowModeCallbackErrCode202_0100
     * @tc.name       : testSetWindowModeCallbackErrCode202_0100
     * @tc.desc       : testSetWindowModeCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowModeCallbackErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWindowModeCallbackErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowModeCallbackErrCode202_0100",
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
        win!.setWindowMode(ohosWindow.WindowMode.FULLSCREEN, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowMode. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowMode.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setWindowMode. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWindowModePromiseErrCode202_0100
     * @tc.name       : testSetWindowModePromiseErrCode202_0100
     * @tc.desc       : testSetWindowModePromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowModePromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWindowModePromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowModePromiseErrCode202_0100",
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
        await win!.setWindowMode(ohosWindow.WindowMode.FULLSCREEN).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowMode.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowMode. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowMode. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testBindDialogTargetPromiseErrCode202_0100
     * @tc.name       : testBindDialogTargetPromiseErrCode202_0100
     * @tc.desc       : testBindDialogTargetPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testBindDialogTargetPromiseErrCode202_0100', 0, async () => {
      {
        let caseName = "testBindDialogTargetPromiseErrCode202_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');

        let windowConfig: ohosWindow.Configuration = {
          name: "testBindDialogTargetPromiseErrCode202_0100",
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
        }

        class TestRemoteObject extends rpc.RemoteObject {
          constructor(descriptor: string) {
            super(descriptor);
          }
        }

        let token: TestRemoteObject = new TestRemoteObject('testObject');
        try {
          await win!.bindDialogTarget(token, () => {
          }).then(async () => {
            console.info(msgStr + 'Succeeded in calling bindDialogTarget.');
            expect().assertFail();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call bindDialogTarget. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
          });
          await win!.destroyWindow()
        } catch (exception) {
          console.error(msgStr + 'Failed to set the call bindDialogTarget. Cause:' + JSON.stringify(exception));
          await win!.destroyWindow()
          expect(exception.code).assertEqual(202);
        }
      }
    })

    /**
     * @tc.number     : testBindDialogTargetCallbackErrCode202_0100
     * @tc.name       : testBindDialogTargetCallbackErrCode202_0100
     * @tc.desc       : testBindDialogTargetCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testBindDialogTargetCallbackErrCode202_0100', 0, async (done: Function) => {
      {
        let caseName = "testBindDialogTargetCallbackErrCode202_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let windowConfig: ohosWindow.Configuration = {
          name: "testBindDialogTargetCallbackErrCode202_0100",
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

        class TestRemoteObject extends rpc.RemoteObject {
          constructor(descriptor: string) {
            super(descriptor);
          }
        }

        let token: TestRemoteObject = new TestRemoteObject('testObject');
        try {
          win!.bindDialogTarget(token, () => {
          }, async (err: BusinessError) => {
            await win!.destroyWindow()
            const errCode: number = err.code;
            if (errCode) {
              console.error(msgStr + 'Failed to call bindDialogTarget. Cause:' + JSON.stringify(err));
              expect(err.code).assertEqual(202);
              done()
              return;
            }
            console.info(msgStr + 'Succeeded in calling bindDialogTarget.');
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to call bindDialogTarget. Cause:' + JSON.stringify(exception));
          await win!.destroyWindow()
          expect(exception.code).assertEqual(202);
          done()
        }
      }
    })

    //   /**
    //    * @tc.number     : testBindDialogTargetPromiseErrCode202_0200
    //    * @tc.name       : testBindDialogTargetPromiseErrCode202_0200
    //    * @tc.desc       : testBindDialogTargetPromiseErrCode202_0200
    //    * @tc.size       : MediumTest
    //    * @tc.type       : Function
    //    * @tc.level      : Level 3
    //    */
    //    it('testBindDialogTargetPromiseErrCode202_0200', 0, async () => {{
    //     let caseName = "testBindDialogTargetPromiseErrCode202_0200";
    //     let msgStr = 'jsunittest ' + caseName + ' ';
    //     console.log(msgStr + 'begin.');
    //
    //     let windowConfig: ohosWindow.Configuration = {
    //         name: "testBindDialogTargetPromiseErrCode202_0200",
    //         windowType: ohosWindow.WindowType.TYPE_DIALOG,
    //         ctx: context,
    //       };
    //       let win: ohosWindow.Window | undefined = undefined;
    //       try {
    //         win = await ohosWindow.createWindow(windowConfig);
    //         expect(!!win).assertTrue();
    //       } catch (err) {
    //         console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
    //         expect().assertFail();
    //       }
    //
    //       try {
    //         await win!.bindDialogTarget(dialogRequest.RequestInfo, ()=>{}).then(async () => {
    //           console.info(msgStr + 'Succeeded in calling bindDialogTarget.');
    //           expect().assertFail();
    //         }).catch(async (err: BusinessError) => {
    //           console.error(msgStr + 'Failed to call bindDialogTarget. Cause: ' + JSON.stringify(err));
    //           expect(err.code).assertEqual(202);
    //         });
    //         await win!.destroyWindow()
    //       } catch (exception) {
    //         console.error(msgStr + 'Failed to set the call bindDialogTarget. Cause:' + JSON.stringify(exception));
    //         await win!.destroyWindow()
    //         expect(exception.code).assertEqual(202);
    //       }
    //     }})
    //
    //
    //   /**
    //    * @tc.number     : testBindDialogTargetCallbackErrCode202_0200
    //    * @tc.name       : testBindDialogTargetCallbackErrCode202_0200
    //    * @tc.desc       : testBindDialogTargetCallbackErrCode202_0200
    //    * @tc.size       : MediumTest
    //    * @tc.type       : Function
    //    * @tc.level      : Level 3
    //    */
    //    it('testBindDialogTargetCallbackErrCode202_0200', 0, async (done: Function) => {{
    //     let caseName = "testBindDialogTargetCallbackErrCode202_0200";
    //     let msgStr = 'jsunittest ' + caseName + ' ';
    //     console.log(msgStr + 'begin.');
    //
    //      let windowConfig: ohosWindow.Configuration = {
    //         name: "testBindDialogTargetCallbackErrCode202_0200",
    //         windowType: ohosWindow.WindowType.TYPE_DIALOG,
    //         ctx: context,
    //       };
    //       let win: ohosWindow.Window | undefined = undefined;
    //       try {
    //         win = await ohosWindow.createWindow(windowConfig);
    //         expect(!!win).assertTrue();
    //       } catch (err) {
    //         console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
    //         expect().assertFail();
    //         done()
    //       }
    //
    //       try {
    //         win!.bindDialogTarget(dialogRequest.RequestInfo, ()=>{}, async (err: BusinessError) => {
    //           await win!.destroyWindow()
    //           const errCode: number = err.code;
    //           if (errCode) {
    //             console.error(msgStr + 'Failed to call bindDialogTarget. Cause:' + JSON.stringify(err));
    //             expect(err.code).assertEqual(202);
    //             done()
    //             return;
    //           }
    //           console.info(msgStr + 'Succeeded in calling bindDialogTarget.');
    //           expect().assertFail();
    //           done();
    //         });
    //       } catch (exception) {
    //         console.error(msgStr + 'Failed to call bindDialogTarget. Cause:' + JSON.stringify(exception));
    //         await win!.destroyWindow()
    //         expect(exception.code).assertEqual(202);
    //         done()
    //       }
    //     }})

    /**
     * @tc.number     : testSetTopmostPromiseErrCode202_0100
     * @tc.name       : testSetTopmostPromiseErrCode202_0100
     * @tc.desc       : testSetTopmostPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetTopmostPromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetTopmostPromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetTopmostPromiseErrCode202_0100",
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
        await win!.setTopmost(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setTopmost.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setTopmost. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setTopmost. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testRequestFocusPromiseErrCode202_0100
     * @tc.name       : testRequestFocusPromiseErrCode202_0100
     * @tc.desc       : testRequestFocusPromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testRequestFocusPromiseErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testRequestFocusPromiseErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testRequestFocusPromiseErrCode202_0100",
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
        await win!.requestFocus(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling requestFocus.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call requestFocus. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(202);
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call requestFocus. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(202);
        done()
      }
    })

    /**
     * @tc.number     : testSetWakeUpScreenErrCode202_0100
     * @tc.name       : testSetWakeUpScreenErrCode202_0100
     * @tc.desc       : testSetWakeUpScreenErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWakeUpScreenErrCode202_0100', 0, async (done: Function) => {
      let caseName = "testSetWakeUpScreenErrCode202_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWakeUpScreenErrCode202_0100",
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

      let testcaseResult = true;
      try {
        win!.setWakeUpScreen(true);
        console.error(msgStr + 'Succeeded in calling setWakeUpScreen.');
        testcaseResult = false;
      } catch (e) {
        console.log(msgStr + 'Failed to call setWakeUpScreen. Cause:' + JSON.stringify(e));
        testcaseResult = e.code == 202;
      }
      console.log(msgStr + 'end.');
      await win!.destroyWindow()
      expect(testcaseResult).assertTrue();
      done();
    })

    /**
     * @tc.number     : testSetSnapshotSkipErrCode202_0100
     * @tc.name       : testSetSnapshotSkipErrCode202_0100
     * @tc.desc       : testSetSnapshotSkipErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetSnapshotSkipErrCode202_0100', 0, async (done: Function) => {
      {
        let caseName = "testSetSnapshotSkipErrCode202_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');

        let windowConfig: ohosWindow.Configuration = {
          name: "testSetSnapshotSkipErrCode202_0100",
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

        let testcaseResult = true;
        try {
          win!.setSnapshotSkip(true);
          console.error(msgStr + 'Succeeded in calling setSnapshotSkip.');
          testcaseResult = false;
        } catch (e) {
          console.log(msgStr + 'Failed to call setSnapshotSkip. Cause:' + JSON.stringify(e));
          testcaseResult = e.code == 202;
        }
        console.log(msgStr + 'end.');
        await win!.destroyWindow()
        expect(testcaseResult).assertTrue();
        done();

      }
    })

    // /**
    //  * @tc.number     : testSetHandwritingFlagPromiseErrCode202_0100
    //  * @tc.name       : testSetHandwritingFlagPromiseErrCode202_0100
    //  * @tc.desc       : testSetHandwritingFlagPromiseErrCode202_0100
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('testSetHandwritingFlagPromiseErrCode202_0100', 0, async (done: Function) => {
    //   {
    //     let caseName = "testSetHandwritingFlagPromiseErrCode202_0100";
    //     let msgStr = 'jsunittest ' + caseName + ' ';
    //     console.log(msgStr + 'begin.');
    //
    //     let windowConfig: ohosWindow.Configuration = {
    //       name: "testSetHandwritingFlagPromiseErrCode202_0100",
    //       windowType: ohosWindow.WindowType.TYPE_DIALOG,
    //       ctx: context,
    //     };
    //     let win: ohosWindow.Window | undefined = undefined;
    //     try {
    //       win = await ohosWindow.createWindow(windowConfig);
    //       expect(!!win).assertTrue();
    //     } catch (err) {
    //       console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
    //       expect().assertFail();
    //       done()
    //     }
    //
    //     try {
    //       await win!.setHandwritingFlag(true).then(async () => {
    //         console.info(msgStr + 'Succeeded in calling setHandwritingFlag.');
    //         expect().assertFail();
    //       }).catch(async (err: BusinessError) => {
    //         console.error(msgStr + 'Failed to call setHandwritingFlag. Cause: ' + JSON.stringify(err));
    //         expect(err.code).assertEqual(202);
    //       });
    //       await win!.destroyWindow()
    //       done()
    //     } catch (exception) {
    //       console.error(msgStr + 'Failed to set the call setHandwritingFlag. Cause:' + JSON.stringify(exception));
    //       await win!.destroyWindow()
    //       expect(exception.code).assertEqual(202);
    //       done()
    //     }
    //   }
    // })

    /**
     * @tc.number     : testSetForbidSplitMoveCallbackErrCode202_0100
     * @tc.name       : testSetForbidSplitMoveCallbackErrCode202_0100
     * @tc.desc       : testSetForbidSplitMoveCallbackErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetForbidSplitMoveCallbackErrCode202_0100', 0, async (done: Function) => {
      {
        let caseName = "testSetForbidSplitMoveCallbackErrCode202_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');

        let windowConfig: ohosWindow.Configuration = {
          name: "testSetForbidSplitMoveCallbackErrCode202_0100",
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
          win!.setForbidSplitMove(true, async (err: BusinessError) => {
            await win!.destroyWindow()
            const errCode: number = err.code;
            if (errCode) {
              console.error(msgStr + 'Failed to call setForbidSplitMove. Cause:' + JSON.stringify(err));
              expect(err.code).assertEqual(202);
              done()
              return;
            }
            console.info(msgStr + 'Succeeded in calling setForbidSplitMove.');
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to call setForbidSplitMove. Cause:' + JSON.stringify(exception));
          await win!.destroyWindow()
          expect(exception.code).assertEqual(202);
          done()
        }
      }
    })

    /**
     * @tc.number     : testSetForbidSplitMovePromiseErrCode202_0100
     * @tc.name       : testSetForbidSplitMovePromiseErrCode202_0100
     * @tc.desc       : testSetForbidSplitMovePromiseErrCode202_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetForbidSplitMovePromiseErrCode202_0100', 0, async (done: Function) => {
      {
        let caseName = "testSetForbidSplitMovePromiseErrCode202_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');

        let windowConfig: ohosWindow.Configuration = {
          name: "testSetForbidSplitMovePromiseErrCode202_0100",
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
          await win!.setForbidSplitMove(true).then(async () => {
            console.info(msgStr + 'Succeeded in calling setForbidSplitMove.');
            expect().assertFail();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call setForbidSplitMove. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(202);
          });
          await win!.destroyWindow()
          done()
        } catch (exception) {
          console.error(msgStr + 'Failed to set the call setForbidSplitMove. Cause:' + JSON.stringify(exception));
          await win!.destroyWindow()
          expect(exception.code).assertEqual(202);
          done()
        }
      }
    })
  })
}