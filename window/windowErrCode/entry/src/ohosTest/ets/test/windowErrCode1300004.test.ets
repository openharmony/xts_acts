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

export default function windowErrCode1300004(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('windowErrCode1300004', () => {
    console.log('describe windowErrCode1300004 start!!!')

    /**
     * @tc.number     : testOnSubWindowCloseErrCode1300004_0100
     * @tc.name       : testOnSubWindowCloseErrCode1300004_0100
     * @tc.desc       : testOnSubWindowCloseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnSubWindowCloseErrCode1300004_0100', 0, async (done: Function) => {
      let caseName = "testOnSubWindowCloseErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();

      try {
        mainWindow!.on('subWindowClose', () => {
        });
        console.error(msgStr + 'Succeeded in calling on_subWindowClose.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call on_subWindowClose. Cause:' + JSON.stringify(exception));
        if (exception.code == 801) {
          console.info(msgStr + '此设备不支持on_subWindowClose能力.');
        } else {
          expect(exception.code).assertEqual(1300004);
        }
        done();
      }
    })
    /**
     * @tc.number     : testMaximizePromiseErrCode1300004_0100
     * @tc.name       : testMaximizePromiseErrCode1300004_0100
     * @tc.desc       : testMaximizePromiseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMaximizePromiseErrCode1300004_0100', 0, async (done: Function) => {
      let caseName = "testMaximizePromiseErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testMaximizePromiseErrCode1300004_0100",
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
        await win!.maximize(ohosWindow.MaximizePresentation.EXIT_IMMERSIVE).then(async () => {
          console.info(msgStr + 'Succeeded in calling maximize.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call maximize. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        done()
      }
    })

    /**
     * @tc.number     : testSetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.name       : testSetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.desc       : testSetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetImmersiveModeEnabledStateErrCode1300004_0100', 0, async (done: Function) => {
      let caseName = "testSetImmersiveModeEnabledStateErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testSetImmersiveModeEnabledStateErrCode1300004_0100",
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
        (win as ohosWindow.Window).setImmersiveModeEnabledState(true);
        console.error(msgStr + 'Succeeded in calling setImmersiveModeEnabledState.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setImmersiveModeEnabledState. Cause:' +
        JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        done();
      }
    })

    /**
     * @tc.number     : testGetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.name       : testGetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.desc       : testGetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetImmersiveModeEnabledStateErrCode1300004_0100', 0, async (done: Function) => {
      let caseName = "testGetImmersiveModeEnabledStateErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowConfig: ohosWindow.Configuration = {
        name: "testGetImmersiveModeEnabledStateErrCode1300004_0100",
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
        (win as ohosWindow.Window).getImmersiveModeEnabledState();
        console.error(msgStr + 'Succeeded in calling getImmersiveModeEnabledState.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call getImmersiveModeEnabledState. Cause:' +
        JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        done();
      }
    })
  })
}