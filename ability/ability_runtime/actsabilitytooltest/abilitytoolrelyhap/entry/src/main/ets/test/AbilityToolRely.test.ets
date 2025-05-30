/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TEST_SUITE_NAME: string = 'AbilityToolRelyTest';

export default function AbilityToolRelyTest() {
  describe('AbilityToolRelyTest', () => {
    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600
     * @tc.name      : The parameters of the test command are valid, and the finishTest API is called in AsyncCallback mode,
     * and the msg parameter (including Chinese and special characters) and code parameter (Number.MIN_VALUE-1) are invalid.
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MIN_VALUE-1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20600';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MIN_VALUE - 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in AsyncCallback mode,
     * the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (non-number)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is invalid ('ABCD')
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20700';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, 1.35, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800
     * @tc.name      : Each parameter of the test command is valid, call the finishTest API in AsyncCallback mode,
     * the msg parameter is valid (including Chinese and special characters) and the code parameter is valid (1)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (1)
     * @tc.level     : Level 3
     * @tc.size      : MEDIUMTEST
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20800';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in AsyncCallback mode,
     * the msg parameter is valid (including Chinese and special characters) and the code parameter is valid (Number.MAX_VALUE)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MAX_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_20900';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MAX_VALUE, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000
     * @tc.name      : The parameters of the test command are valid, and the finishTest API is called in AsyncCallback mode,
     * and the msg parameter (including Chinese and special characters) and code parameter (Number.MIN_VALUE) are valid.
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MIN_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21000';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MIN_VALUE, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (Number.MAX_VALUE+1)
     * @tc.desc      : for testing finishTest by promise msg msg parameter is invalid('测试日志!@#$%^&*()_+QWE{}|?><Fafq3146') and the code is invalid(Number.MAX_VALUE+1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21300';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MIN_VALUE + 1)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in Promise mode,
     *                 and the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (Number.MIN_VALUE-1)
     * @tc.desc      : for testing finishTest by promise msg msg parameter is invalid('测试日志!@#$%^&*()_+QWE{}|?><Fafq3146') and the code is invalid(Number.MIN_VALUE-1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21400';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MIN_VALUE - 1)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 msg parameter is valid (including Chinese and special characters) and code parameter is invalid (non-number)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called by promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is invalid ('ABCD')
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21500';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, -11)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 msg parameter (including Chinese and special characters) and code parameter are valid (1)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (1)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21600';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, 1)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700
     * @tc.name      : Each parameter of the test command is valid, call the finishTest interface in Promise mode,
     *                 msg parameter is valid (including Chinese and special characters) and code parameter is valid (Number.MAX_VALUE)
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MAX_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21700';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MAX_VALUE)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            expect(true).assertTrue();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in Promise mode,
     *                 and the msg parameter (including Chinese and special characters) and code parameter (Number.MIN_VALUE) are valid.
     * @tc.desc      : The parameters of the test command are valid, and the finishTest interface is called in promise
     *                  mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
     *                  is valid (Number.MIN_VALUE)
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_01_21800';
      try {
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.finishTest(msg, Number.MIN_VALUE)
          .then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        done();
      }
    })
  })
}
