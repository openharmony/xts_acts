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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import appManager from "@ohos.app.ability.appManager"

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function appManagerStaticTest() {
  describe('appManagerStaticTest', () => {

    /**
      * @tc.number: System_API_Test_App_Manager_Static_1700
      * @tc.name: System_API_Test_App_Manager_Static_1700
      * @tc.desc: Test the third-party application without permission call killProcessesByBundleName will be blocked
      * @tc.level 3
      */
    it('System_API_Test_App_Manager_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let bundleName = "com.example.systemapitest.static";
      try {
        appManager.killProcessesByBundleName(bundleName, false).then(() => {
          hilog.info(domain, tag, 'System_API_Test_App_Manager_Static_1700 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1700 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (paramError: BusinessError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1700 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(16000050);
        done();
      }
    });

   /**
     * @tc.number: Public_API_Test_App_Manager_Static_0100
     * @tc.name: Public_API_Test_App_Manager_Static_0100
     * @tc.desc: Test the third-party application get ProcessState enum will be right
     * @tc.level 3
     */
    it('Public_API_Test_App_Manager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(appManager.ProcessState.STATE_CREATE + '').assertEqual('0');
      expect(appManager.ProcessState.STATE_FOREGROUND + '').assertEqual('1');
      expect(appManager.ProcessState.STATE_ACTIVE + '').assertEqual('2');
      expect(appManager.ProcessState.STATE_BACKGROUND + '').assertEqual('3');
      expect(appManager.ProcessState.STATE_DESTROY + '').assertEqual('4');
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_Static_0100
     * @tc.name   : SUB_Ability_AbilityBase_AppManager_Static_0100
     * @tc.desc   : Test the return value of the isRunningInStabilityTest interface(Promise).
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0100`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_0100 begin');
      try {
        appManager.isRunningInStabilityTest().then((data: boolean)=>{
          hilog.info(domain, tag, 'isRunningInStabilityTest success, pid: ' + data);
          expect(data).assertFalse();
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
          expect().assertFail();
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, ' isRunningInStabilityTest error, errorCode: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_Static_0200
     * @tc.name   : SUB_Ability_AbilityBase_AppManager_Static_0200
     * @tc.desc   : Test the return value of the isRunningInStabilityTest interface(CallBack).
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0200`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_0200 begin');
      try {
        appManager.isRunningInStabilityTest((err, data)=>{
          hilog.info(domain, tag, 'isRunningInStabilityTest success, pid: ' + data);
          expect(data).assertFalse();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_Static_0400
     * @tc.name   : SUB_Ability_AbilityBase_AppManager_Static_0400
     * @tc.desc   : Verify that isAppRunning is called when no permission is available(appCloneIndex).
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0400`;
      hilog.info(domain, tag, `SUB_Ability_AbilityBase_AppManager_Static_0400 begin`);
      try {
        appManager.isAppRunning('com.example.systemapitest.static', 0).then((data: boolean)=>{
          hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
          expect(data).assertFalse();
          done();
        }).catch((err: BusinessError): void=>{
          hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_Static_0500
     * @tc.name   : SUB_Ability_AbilityBase_AppManager_Static_0500
     * @tc.desc   : Verify that isAppRunning is called when no permission is available(no appCloneIndex)).
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0500`;
      hilog.info(domain, tag, `SUB_Ability_AbilityBase_AppManager_Static_0500 begin`);
      try {
        appManager.isAppRunning('com.example.systemapitest.static').then((data: boolean)=>{
          hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
          expect(data).assertFalse();
          done();
        }).catch((err: BusinessError): void=>{
          hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_Static_0900
     * @tc.name   : SUB_Ability_AbilityBase_AppManager_Static_0900
     * @tc.desc   : Verify isRamConstrainedDevice(callback).
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0900`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_0900 begin');
      try {
        appManager.isRamConstrainedDevice((err, data)=>{
          expect(typeof data).assertEqual('boolean');
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_Static_1000
     * @tc.name   : SUB_Ability_AbilityBase_AppManager_Static_1000
     * @tc.desc   : Verify isRamConstrainedDevice(promise).
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_1000`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_1000 begin');
      try {
        appManager.isRamConstrainedDevice().then((data)=>{
          expect(typeof data).assertEqual('boolean');
          done();
        }).catch((err: BusinessError): void => {
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });
  })
}
