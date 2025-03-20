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
import { StartOptions } from "@kit.AbilityKit";

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
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
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStart') as ohosWindow.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
  try {
    if (pageContext !== null && pageContext !== undefined) {
      console.log(`${caseName} terminateSelf begin`);
    }
    await pageContext.terminateSelf().then(() => {
      console.log(`${caseName} terminateSelf success`);
    }).catch((err: BusinessError) => {
      console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
    });
  } catch (e) {
    console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
  }
  await sleep(1000)
}

export default function windowErrCode1300005() {
  describe('windowErrCode1300005', () => {
    console.log('describe windowErrCode1300005 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })

    /**
     * @tc.number     : testGetMainWindowSyncErrCode1300005_0100
     * @tc.name       : testGetMainWindowSyncErrCode1300005_0100
     * @tc.desc       : testGetMainWindowSyncErrCode1300005_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetMainWindowSyncErrCode1300005_0100', 0, async (done: Function) => {
      let caseName = "testGetMainWindowSyncErrCode1300005_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);

      try {
        windowStageStart.getMainWindowSync();
        console.error(msgStr + 'Succeeded in calling getMainWindowSync.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call getMainWindowSync. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300005);
        done()
      }
    })

    /**
     * @tc.number     : testCreateSubWindowWithOptionsPromiseErrCode1300005_0100
     * @tc.name       : testCreateSubWindowWithOptionsPromiseErrCode1300005_0100
     * @tc.desc       : testCreateSubWindowWithOptionsPromiseErrCode1300005_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testCreateSubWindowWithOptionsPromiseErrCode1300005_0100', 0, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptionsPromiseErrCode1300005_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);

      try {
        let param: ohosWindow.SubWindowOptions = {
          title: "aa", decorEnabled: true
        }
        await windowStageStart.createSubWindowWithOptions('createSubWindowPromise', param).then(async () => {
          console.info(msgStr + 'Succeeded in calling createSubWindowWithOptions.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call createSubWindowWithOptions. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300005);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call createSubWindowWithOptions. Cause:' + JSON.stringify(exception));
        // expect().assertFail();
        expect(exception.code).assertEqual(1300005);
        done()
      }
    })

    /**
     * @tc.number     : testSetCustomDensityErrCode1300005_0100
     * @tc.name       : testSetCustomDensityErrCode1300005_0100
     * @tc.desc       : testSetCustomDensityErrCode1300005_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetCustomDensityErrCode1300005_0100', 0, async (done: Function) => {
      let caseName = "testSetCustomDensityErrCode1300005_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);

      try {
        windowStageStart.setCustomDensity(0);
        console.error(msgStr + 'Succeeded in calling setCustomDensity.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setCustomDensity. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300005);
        done()
      }
    })

    /**
     * @tc.number     : testGetMainWindowPromiseErrCode1300005_0100
     * @tc.name       : testGetMainWindowPromiseErrCode1300005_0100
     * @tc.desc       : testGetMainWindowPromiseErrCode1300005_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetMainWindowPromiseErrCode1300005_0100', 0, async (done: Function) => {
      let caseName = "testGetMainWindowPromiseErrCode1300005_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);

      try {
        await windowStageStart.getMainWindow().then(async () => {
          console.info(msgStr + 'Succeeded in calling getMainWindow.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call getMainWindow. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300005);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call getMainWindow. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number     : testGetMainWindowCallbackErrCode1300005_0100
     * @tc.name       : testGetMainWindowCallbackErrCode1300005_0100
     * @tc.desc       : testGetMainWindowCallbackErrCode1300005_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetMainWindowCallbackErrCode1300005_0100', 0, async (done: Function) => {
      let caseName = "testGetMainWindowCallbackErrCode1300005_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        windowStageStart!.getMainWindow(async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call getMainWindow. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300005);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling getMainWindow.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call getMainWindow. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

  
  })
}