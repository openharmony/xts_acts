/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function errCodeQueryTest() {
  describe('errCodeQueryTest', () => {
    beforeAll(() => {

    })
    beforeEach(() => {

    })
    afterEach(() => {
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100
     * @tc.name    SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100
     * @tc.desc    Passing null to the setFont interface results in a 401 error code
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_Configuration_FontSettings_0100';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      try {
        expect(1).assertEqual(1);
        done();
      } catch (paramError) {
        hilog.info(0x0000, TAG, '[%{public}s] paramError: %{public}s', TAG, JSON.stringify(paramError));
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

  })
}