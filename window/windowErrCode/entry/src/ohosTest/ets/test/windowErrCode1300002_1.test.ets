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

export default function windowErrCode1300002_1(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('windowErrCode1300002_1', () => {
    console.log('describe windowErrCode1300002_1 start!!!')

    /**
     * @tc.number     : testMoveWindowToAsyncPromiseErrCode1300002_0100
     * @tc.name       : testMoveWindowToAsyncPromiseErrCode1300002_0100
     * @tc.desc       : testMoveWindowToAsyncPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMoveWindowToAsyncPromiseErrCode1300002_0100', 0, async (done: Function) => {
      {
        let caseName = "testMoveWindowToAsyncPromiseErrCode1300002_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let subWin: ohosWindow.Window | undefined = undefined;
        await windowStage.createSubWindow('testMoveWindowToAsyncPromiseErrCode1300002_SubWindow_Promise')
          .then((data) => {
            subWin = data;
            expect(!!subWin).assertTrue();
            console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            expect().assertFail();
            done()
          });

        await (subWin! as ohosWindow.Window).destroyWindow();
        try {
          await (subWin! as ohosWindow.Window).moveWindowToAsync(0, 0).then(async () => {
            console.info(msgStr + 'Succeeded in calling moveWindowToAsync.');
            expect().assertFail();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call moveWindowToAsync. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
          });
          done()
        } catch (exception) {
          console.error(msgStr + 'Failed to set the call moveWindowToAsync. Cause:' + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300002);
          done()
        }
      }
    })
  })
}