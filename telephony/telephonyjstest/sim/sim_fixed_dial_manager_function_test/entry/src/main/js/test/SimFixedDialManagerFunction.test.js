/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import sim from '@ohos.telephony.sim';
import * as env from './lib/Const.js';
import { describe, it, expect, Core } from 'deccjsunit/index';
describe('SimFixedDialManagerFunction', function () {

  // set timeout
  const core = Core.getInstance();
  const config = core.getDefaultService('config');
  config.timeout = 5 * 1000;

  const triggerPuk2 = async function () {
    await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2);
    await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2);
    await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2);
  };
  const unlockPuk2AndResetPin2 = async function () {
    await sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PUK2);
  };

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0100
   * @tc.name    UnlockPin2 (pin2: string, slotId: number, callback: AsyncCallback):void
   *             Interface PIN is a string of length 3, expected result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0100';
    sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN3, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} unlock pin2 err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0200
   * @tc.name    UnlockPin2 (pin2: string, slotId: number, callback: AsyncCallback):void
   *             Interface PIN is a string of length 9, expected result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0200';
    sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN9, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} unlock pin2 err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0300
   * @tc.name    UnlockPin2 (pin2: string, slotId: number, callback: AsyncCallback):
   *             void slotId exception input parameter, expected to enter err
   *             and the err is expected
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0300', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0300';
    sim.unlockPin2(env.SIM_SLOTID11, env.INCORRECT_PIN2_REVERSE, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME}, data : ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0600
   * @tc.name    UnlockPin2 slotId is unlocked properly. Check the callback value. Expect result =0
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0600';
    sim.unlockPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.SUCCESS).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0700
   * @tc.name    Test unlockPin2 interface error pin2 code entry parameter, check callback
   *             value, expect callback result = -1, Remain =2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0700';
    sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_REVERSE, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.FAILURE && data.remain === 2).assertTrue();
      // reset remain
      sim.unlockPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, (error, data) => {
        if (error) {
          console.log(`${CASE_NAME} restore pin2 error:${error.message}`);
        }
        console.log(`${CASE_NAME} finish`);
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0800
   * @tc.name    Test unlockPin2 interface input error pin2 too many codes trigger PUK2 lock, check the callback
   *             value, expect 1. First callback result=-1, Remain = 2.
   *             2. Second callback result=-1, Remain = 1, 3. The third callback result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0800', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0800';
    const recursiveUnlockPin2 = function (n) {
      if (n === 0) {
        console.log(`${CASE_NAME} test finish`);
        console.log(`${CASE_NAME} unlock puk2 and reset pin2`);
        sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PUK2, (error, data) => {
          if (error) {
            console.debug(`unlockPuk2 error cause : ${error.message}`);
          } else {
            console.debug(`unlockPuk2 success result = ${data.result}`);
            console.debug(`unlockPuk2 success remain = ${data.remain}`);
          }
          done();
        });
      } else {
        console.log(`${CASE_NAME} unlock pin2 ${4 - n} time`);
        sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_REVERSE, (err, data) => {
          if (err) {
            console.log(`${CASE_NAME} fail err: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.log(`${CASE_NAME} data${JSON.stringify(data)}`);
          const validateResult = n === 1 ?
            (data.result !== env.UNLOCKPIN2_STATE_CODE.EXCEPTION) :
            (data.result !== env.UNLOCKPIN2_STATE_CODE.FAILURE || data.remain !== (n - 1));
          if (validateResult) {
            console.log(`${CASE_NAME} test fail`);
            expect().assertFail();
            done();
            return;
          }
          recursiveUnlockPin2(n - 1);
        });
      }
    };
    recursiveUnlockPin2(3);
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_0900
   * @tc.name    Test slotid exception input parameter 1 of unlockPin2 and check the callback
   *             value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_0900', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_0900';
    sim.unlockPin2(env.SIM_SLOTID1, env.INCORRECT_PIN2_REVERSE, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME} , data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_1000
   * @tc.name    Test slotid exception input parameter 2 of unlockPin2 and check the callback
   *             value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Async_1000';
    sim.unlockPin2(env.SIM_SLOTID2, env.INCORRECT_PIN2_REVERSE, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME} , data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0100
   * @tc.name    UnlockPin2 (pin2: string, slotId: number): Promise The interface pin is a
   *             string of length 3. Expect result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0100';
    try {
      const data = await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN3);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.EXCEPTION).assertTrue();
    } catch (err) {
      console.log(`${CASE_NAME} fail err: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0200
   * @tc.name    UnlockPin2 (pin2: string, slotId: number): Promise The interface
   *             pin is a string of length 9. Expect result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0200';
    try {
      const data = await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN9);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.EXCEPTION).assertTrue();
    } catch (err) {
      console.log(`${CASE_NAME} fail err: ${err.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0300
   * @tc.name    UnlockPin2 (pin2: string, slotId: number): Promise Interface
   *             slotId exception entry parameter, expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0300', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0300';
    try {
      await sim.unlockPin2(env.SIM_SLOTID11, env.INCORRECT_PIN2_REVERSE);
      expect().assertFail();
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0600
   * @tc.name    UnlockPin2 slotId is unlocked properly. Check the callback value. Expect result =0
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0600';
    try {
      const data = await sim.unlockPin2(env.SIM_SLOTID0, env.CORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.SUCCESS).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (err) {
      console.log(`${CASE_NAME} fail err${err.message}`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0700
   * @tc.name    Test unlockPin2 interface error pin2 code entry parameter, check callback
   *             value, expect callback result = -1, Remain =2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0700';
    try {
      const data = await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_REVERSE);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPIN2_STATE_CODE.FAILURE && data.remain === 2).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (err) {
      console.log(`${CASE_NAME} fail err${err.message}`);
    } finally {
      console.log(`${CASE_NAME} reset remain`);
      await sim.unlockPin2(env.SIM_SLOTID0, env.CORRECT_PIN2);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0800
   * @tc.name    Test unlockPin2 interface input error pin2 too many codes trigger PUK2 lock, check the callback
   *             value, expect 1. First callback result=-1, Remain = 2.
   *             2. Second callback result=-1, Remain = 1, 3. The third callback result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0800', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0800';
    try {
      for (let i = 1; i < 4; i++) {
        const data = await sim.unlockPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_REVERSE);
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        const validateResult = i === 3 ?
          (data.result !== env.UNLOCKPIN2_STATE_CODE.EXCEPTION) :
          (data.result !== env.UNLOCKPIN2_STATE_CODE.FAILURE || data.remain !== (3 - i));
        if (validateResult) {
          expect().assertFail();
          break;
        }
      }
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail err: ${error.message}`);
      expect().assertFail();

    }
    unlockPuk2AndResetPin2();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_0900
   * @tc.name    Test slotid exception input parameter 1 of unlockPin2 and check the callback
   *             value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_0900', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_0900';
    try {
      await sim.unlockPin2(env.SIM_SLOTID1, env.INCORRECT_PIN2_REVERSE);
      expect().assertFail();
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_1000
   * @tc.name    Test slotid exception input parameter 2 of unlockPin2 and check the callback
   *             value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Promise_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPin2_Promise_1000';
    try {
      await sim.unlockPin2(env.SIM_SLOTID2, env.INCORRECT_PIN2_REVERSE);
      expect().assertFail();
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0100
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number, callback: AsyncCallback):void Puk is a
   *             string of length 3 and is expected to return LockStatusResponse Result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0100';
    try {
      await triggerPuk2();
      sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.INCORRECT_PUK2_LEN3, async (err, data) => {
        if (err) {
          console.log(`${CASE_NAME}, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
        console.log(`${CASE_NAME} finish`);
        unlockPuk2AndResetPin2();
        done();
      });
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0200
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number, callback: AsyncCallback):void Puk
   *             is a string of length 9 and is expected to return LockStatusResponse Result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0200';
    try {
      await triggerPuk2();
      sim.unlockPuk2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN9, async (err, data) => {
        if (err) {
          console.log(`${CASE_NAME}, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
        console.log(`${CASE_NAME} finish`);
        unlockPuk2AndResetPin2();
        done();
      });
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0300
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number, callback: AsyncCallback):void
   *             Interface slotId exception input parameter, expected to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0300', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0200';
    sim.unlockPuk2(env.SIM_SLOTID11, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect error: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME}, data : ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0400
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number, callback: AsyncCallback):void interface
   *             exception newPin entry parameter, expected to return structure LockStatusResponse result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0400';
    try {
      await triggerPuk2();
      sim.unlockPuk2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN9, env.CORRECT_PUK2, async (err, data) => {
        if (err) {
          console.log(`${CASE_NAME}, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
        console.log(`${CASE_NAME} finish`);
        unlockPuk2AndResetPin2();
        done();
      });
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0700
   * @tc.name    UnlockPuk2 interface slotId normal input parameter unlock, check the callback value,
   *             expected callback result =0
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0700';
    try {
      await triggerPuk2();
      sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PUK2, async (err, data) => {
        if (err) {
          console.log(`${CASE_NAME}, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        expect(data.result === env.UNLOCKPUK2_STATE_CODE.SUCCESS).assertTrue();
        console.log(`${CASE_NAME} finish`);
        done();
      });
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0800
   * @tc.name    Test unlockPuk2 interface error puk2 code entry parameter, check the callback
   *             value, expect callback result = -1 remain = 9
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0800', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0800';
    try {
      await triggerPuk2();
      sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.INCORRECT_PUK2, async (err, data) => {
        if (err) {
          console.log(`${CASE_NAME}, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        expect(data.result === env.UNLOCKPUK2_STATE_CODE.FAILURE && data.remain === 9).assertTrue();
        console.log(`${CASE_NAME} finish`);
        unlockPuk2AndResetPin2();
        done();
      });
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_0900
   * @tc.name    The test calls the UnlockPuk2 interface when no puK2 lock is triggered and checks the
   *             return value, expecting a callback result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_0900', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_0900';
    sim.unlockPuk2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_1000
   * @tc.name    Test the slotId exception input parameter 1 of the unlockPuk2 interface and check
   *             the callback value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_1000';
    sim.unlockPuk2(env.SIM_SLOTID1, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME}, data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_1100
   * @tc.name    Test the slotId exception input parameter 2 of the unlockPuk2
   *             interface and check the callback value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_1100';
    sim.unlockPuk2(env.SIM_SLOTID2, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME}, data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0100
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number): Promise PuK is a string of length 3 that
   *             is expected to return the struct LockStatusResponse Result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0100';
    try {
      await triggerPuk2();
      const data = await sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.INCORRECT_PUK2_LEN3);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      unlockPuk2AndResetPin2();
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0200
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number): Promise PuK is a
   *             string of length 9 that is expected to return the struct LockStatusResponse Result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0200';
    try {
      await triggerPuk2();
      const data = await sim.unlockPuk2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN9);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      unlockPuk2AndResetPin2();
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0300
   * @tc.name    unlockPuk2 (newPin2: string, puK2: string, slotId: number): Promise
   *             Interface slotId exception entry parameter, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0300', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0300';
    try {
      const data = await sim.unlockPuk2(env.SIM_SLOTID11, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8);
      console.log(`${CASE_NAME}, data : ${JSON.stringify(data)}`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect error: ${error.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0400
   * @tc.name    unlockPuk2 (newPin2: string, puk2: string, slotId: number): Promise Interface exception newPin
   *             entry parameter, expected to return structure LockStatusResponse Result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0400';
    try {
      await triggerPuk2();
      const data = await sim.unlockPuk2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN9, env.CORRECT_PUK2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      unlockPuk2AndResetPin2();
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0700
   * @tc.name    UnlockPuk2 interface slotId normal input parameter unlock, check the callback value, expected callback
                 result =0
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0700';
    try {
      await triggerPuk2();
      const data = await sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PUK2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.SUCCESS).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0800
   * @tc.name    Test unlockPuk2 interface error puk2 code entry parameter, check the callback value,
   *             expect callback result = -1 remain = 9
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0800', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0800';
    try {
      await triggerPuk2();
      const data = await sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.INCORRECT_PUK2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.FAILURE && data.remain === 9).assertTrue();
      console.log(`${CASE_NAME} finish`);
      unlockPuk2AndResetPin2();
    } catch (error) {
      console.log(`${CASE_NAME} has error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_0900
   * @tc.name    The test calls the UnlockPuk2 interface when no puK2 lock is triggered and checks
   *             the return value, expecting a callback result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_0900', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_0900';
    try {
      const data = await sim.unlockPuk2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.UNLOCKPUK2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_1000
   * @tc.name    Test the slotId exception input parameter 1 of the unlockPuk2 interface and check
   *             the callback value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Promise_1000';
    try {
      const data = await sim.unlockPuk2(env.SIM_SLOTID1, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8);
      console.log(`${CASE_NAME}, data: ${JSON.stringify(data)}`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect err: ${error.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_1100
   * @tc.name    Test the slotId exception input parameter 2 of the unlockPuk2 interface
   *             and check the callback value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_unlockPuk2_Async_1100';
    try {
      const data = await sim.unlockPuk2(env.SIM_SLOTID2, env.INCORRECT_PIN2, env.INCORRECT_PUK2_LEN8);
      console.log(`${CASE_NAME}, data: ${JSON.stringify(data)}`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect err: ${error.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0100
   * @tc.name    Test sim.alterPin2 async callback interface when slotId = -1, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0100';
    sim.alterPin2(env.SIM_SLOTID11, env.INCORRECT_PIN2, env.INCORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME}, data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0400
   * @tc.name    Test the alterPin2 interface. Check the callback value. Expect the callback result =0
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0400';
    sim.alterPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.SUCCESS).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0500
   * @tc.name    Test alterPin2 interface newpin parameter of length 3, check
   *             the callback value, expect callback result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0500';
    sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN3, env.CORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0600
   * @tc.name    Test alterPin2 interface newpin with length 9 exception value, check
   *             callback value, expect callback result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0600';
    sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN9, env.CORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0700
   * @tc.name    Test alterPin2 interface exception oldPin input parameter, check callback value,
   *             expect callback result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0700';
    sim.alterPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.INCORRECT_PIN2_LEN9, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0800
   * @tc.name    AlterPin2 interface error oldPin input parameter, check callback value,
   *             expect callback result = -1 remain = 2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0800', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0800';
    sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.FAILURE && data.remain === 2).assertTrue();
      sim.unlockPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, (error, data) => {
        if (error) {
          console.log(`${CASE_NAME} restore pin2 error:${error.message}`);
        }
        console.log(`${CASE_NAME} finish`);
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_0900
   * @tc.name    Test alterPin2 interface input error oldPin too much trigger PUK2 lock,
   *             check the callback value, expect the first callback result = -1, Remain = 2.
   *             2. Second callback Result = -1 Remain = 1 3 The third callback result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_0900', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_0900';
    const recursiveAlterPin2 = function (n) {
      if (n === 0) {
        console.log(`${CASE_NAME} test finish`);
        console.log(`${CASE_NAME} unlock puk2 and reset pin2`);
        sim.unlockPuk2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PUK2, (error, data) => {
          if (error) {
            console.debug(`unlockPuk2 error cause : ${error.message}`);
          } else {
            console.debug(`unlockPuk2 success result = ${data.result}`);
            console.debug(`unlockPuk2 success remain = ${data.remain}`);
          }
          done();
        });
      } else {
        console.log(`${CASE_NAME} alter pin2 ${4 - n} time`);
        sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PIN2, (err, data) => {
          if (err) {
            console.log(`${CASE_NAME} fail err: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.log(`${CASE_NAME} data${JSON.stringify(data)}`);
          const validateResult = n === 1 ?
            (data.result !== env.UNLOCKPIN2_STATE_CODE.EXCEPTION) :
            (data.result !== env.UNLOCKPIN2_STATE_CODE.FAILURE || data.remain !== (n - 1));
          if (validateResult) {
            console.log(`${CASE_NAME} test fail`);
            expect().assertFail();
            done();
            return;
          }
          recursiveAlterPin2(n - 1);
        });
      }
    };
    recursiveAlterPin2(3);
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_1000
   * @tc.name    Test alterPin2 interface exception slotId input parameter 1, check the callback value,
   *             expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_1000';
    sim.alterPin2(env.SIM_SLOTID1, env.INCORRECT_PIN2, env.INCORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect error: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_1100
   * @tc.name    Test alterPin2 interface exception slotId input parameter 2, check the callback
   *             value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Async_1100';
    sim.alterPin2(env.SIM_SLOTID2, env.INCORRECT_PIN2, env.INCORRECT_PIN2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect error: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0100
   * @tc.name    Test sim.alterPin2 async promise when slotId = -1, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0100';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID11, env.INCORRECT_PIN2, env.INCORRECT_PIN2);
      console.log(`${CASE_NAME}, data: ${JSON.stringify(data)}`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect error: ${error.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0400
   * @tc.name    Test the alterPin2 interface. Check the callback value. Expect the callback result =0
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0400';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.CORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.SUCCESS).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0500
   * @tc.name    Test alterPin2 interface newpin parameter of length 3, check the callback
   *             value, expect callback result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0500';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN3, env.CORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0600
   * @tc.name    Test alterPin2 interface newpin with length 9 exception value, check callback
   *             value, expect callback result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0600';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2_LEN9, env.CORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0700
   * @tc.name    Test alterPin2 interface exception oldPin input parameter, check callback
   *             value, expect callback result =-2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0700';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID0, env.CORRECT_PIN2, env.INCORRECT_PIN2_LEN9);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.EXCEPTION).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0800
   * @tc.name    AlterPin2 interface error oldPin input parameter, check callback value,
   *             expect callback result = -1 remain = 2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0800', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0800';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect(data.result === env.ALTERPIN2_STATE_CODE.FAILURE && data.remain === 2).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err: ${error.message}`);
      expect().assertFail();
    } finally {
      console.log(`${CASE_NAME} reset remain`);
      await sim.unlockPin2(env.SIM_SLOTID0, env.CORRECT_PIN2);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_0900
   * @tc.name    Test alterPin2 interface input error oldPin too much trigger PUK2 lock, check the callback value,
   *             expect the first callback result = -1, Remain = 2.2. Second callback
   *             Result = -1 Remain = 1 3 The third callback result = -2
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_0900', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_0900';
    try {
      for (let i = 1; i < 4; i++) {
        const data = await sim.alterPin2(env.SIM_SLOTID0, env.INCORRECT_PIN2, env.INCORRECT_PIN2);
        console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
        const validateResult = i === 3 ?
          (data.result !== env.UNLOCKPIN2_STATE_CODE.EXCEPTION) :
          (data.result !== env.UNLOCKPIN2_STATE_CODE.FAILURE || data.remain !== (3 - i));
        if (validateResult) {
          expect().assertFail();
          break;
        }
      }
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail err: ${error.message}`);
      expect().assertFail();
    }
    unlockPuk2AndResetPin2();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_1000
   * @tc.name    Test alterPin2 interface exception slotId input parameter 1, check the callback
   *             value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_1000';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID1, env.INCORRECT_PIN2, env.INCORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect error: ${error.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_1100
   * @tc.name    Test alterPin2 interface exception slotId input parameter 2, check the callback
   *             value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_alterPin2_Promise_1100';
    try {
      const data = await sim.alterPin2(env.SIM_SLOTID2, env.INCORRECT_PIN2, env.INCORRECT_PIN2);
      console.log(`${CASE_NAME} data: ${JSON.stringify(data)}`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect error: ${error.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });
});