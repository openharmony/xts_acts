/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import wantAgent from '@ohos.app.ability.wantAgent';
import wantConstant from '@ohos.app.ability.wantConstant'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let TAG: string;

export default function wantAgentCoverTest() {
  describe('WantAgentTest', () => {
    /*
     * @tc.number  SUB_AA_OpenHarmony_WantAgentCover_0100
     * @tc.name    Verify stageMode properties and getOperationType interface.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantAgentCover_0100', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantAgentCover_0100 ==>';
      try {
        let status: boolean = AppStorage.get<common.UIAbilityContext>("abilityContext")!.stageMode;
        let code1: number;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: "",
              bundleName: "com.example.apicoverhaptest",
              abilityName: "com.example.apicoverhaptest.MainAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true.true,false}",
              parameters: {
                myKey0: 2222
              }
            }
          ],
          operationType: wantAgent.OperationType.START_ABILITIES,
          requestCode: 0,
          wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        }
        wantAgent.getWantAgent(wantAgentInfo)
          .then((data) => {
            console.info(TAG + "getWantAgent data = " + JSON.stringify(data));
            wantAgent.getOperationType(data, (err, data) => {
              code1 = data;
              console.info(TAG + "getOperationType data = " + JSON.stringify(data));
              console.info(TAG + "getOperationType err = " + JSON.stringify(err));
            });

            setTimeout(() => {
              expect(wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK)
                .assertEqual('ability.params.backToOtherMissionStack');
              expect(status).assertTrue();
              expect(code1).assertEqual(2);
              done();
            }, 1500)
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "getWantAgent err = " + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0100
     * @tc.name    Verify PAGE_PATH.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0100', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0100 ==>';
      expect(wantConstant.Params.PAGE_PATH)
        .assertEqual('ohos.param.atomicservice.pagePath');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0200
     * @tc.name    Verify ROUTER_NAME.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0200', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0200 ==>';
      expect(wantConstant.Params.ROUTER_NAME)
        .assertEqual('ohos.param.atomicservice.routerName');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0300
     * @tc.name    Verify PAGE_SOURCE_FILE.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0300', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0300 ==>';
      expect(wantConstant.Params.PAGE_SOURCE_FILE)
        .assertEqual('ohos.param.atomicservice.pageSourceFile');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0400
     * @tc.name    Verify BUILD_FUNCTION.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0400', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0400 ==>';
      expect(wantConstant.Params.BUILD_FUNCTION)
        .assertEqual('ohos.param.atomicservice.buildFunction');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0500
     * @tc.name    Verify SUB_PACKAGE_NAME.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0500', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0500 ==>';
      expect(wantConstant.Params.SUB_PACKAGE_NAME)
        .assertEqual('ohos.param.atomicservice.subpackageName');
      done();
    })
  })
}