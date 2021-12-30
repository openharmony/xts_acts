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
import { describe, it, expect } from 'deccjsunit/index';

describe('SimGetSimAccountInfoFunctionTest', function () {

  const setShowNameWriteToPromise = function () {
    return new Promise((resolve, reject) => {
      console.debug('Telephony_Sim setShowName');
      sim.setShowName(env.SLOTID0, env.SIM_SLOT_NAME, (err) => {
        if (err) {
          console.log(`Telephony_Sim setShowNameWriteToPromise fail, err : ${err.message}`);
          reject(err);
        } else {
          resolve(null);
        }
      });
    });
  };

  const setShowNumberWriteToPromise = function () {
    return new Promise((resolve, reject) => {
      console.debug('Telephony_Sim setShowNumber');
      sim.setShowNumber(env.SLOTID0, env.SIM_SLOT_NUMBER, (err) => {
        if (err) {
          console.log(`Telephony_Sim setShowNumberWriteToPromise fail, err : ${err.message}`);
          reject(err);
        } else {
          resolve(null);
        }
      });
    });
  };

  const getSimIccIdWriteToPromise = function () {
    return new Promise((resolve, reject) => {
      console.debug('Telephony_Sim getSimIccId');
      sim.getSimIccId(env.SLOTID0, (err, result) => {
        if (err) {
          console.log(`Telephony_Sim getSimIccIdWriteToPromise fail, err : ${err.message}`);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  };

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Async_0100
    * @tc.name    Get the return value by calling the GetSimAccountInfo interface SIM ID input parameter 0.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Async_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Async_0100';
    let iccIdValue;
    try {
      await setShowNameWriteToPromise();
      await setShowNumberWriteToPromise();
      iccIdValue = await getSimIccIdWriteToPromise();
      await sim.activateSim(env.SLOTID0);
    } catch (err) {
      console.log(`${CASE_NAME} setOrGet fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    sim.getSimAccountInfo(env.SLOTID0, (err, info) => {
      if (err) {
        console.log(`${CASE_NAME} fail ,err : ${err.message}`);
        expect().assertFail();
      }
      console.log(`${CASE_NAME} getSimAccountInfo: ${JSON.stringify(info)}`);
      expect(info.slotIndex === env.SLOTID0
        && info.simId === env.SLOTID0
        && info.isEsim === false
        && info.isActive === true
        && info.iccId === iccIdValue
        && info.showName === env.SIM_SLOT_NAME
        && info.showNumber === env.SIM_SLOT_NUMBER
      ).assertTrue();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Async_0200
    * @tc.name    Test getSimAccountInfo async callback interface slotid exception,
    *             enter parameter -1, and check the callback value
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Async_0200';
    sim.getSimAccountInfo(env.SLOTID_MINUS1, (err) => {
      if (err) {
        console.log(`${CASE_NAME} expect error: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} test fail.`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Async_0500
    * @tc.name    Test getSimAccountInfo async callback interface slotid exception,
    *             enter parameter 1, and check the callback value
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Async_0500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Async_0500';
    sim.getSimAccountInfo(env.SLOTID1, (err) => {
      if (err) {
        console.log(`${CASE_NAME} expect error: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} test fail.`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Async_0600
    * @tc.name    Test getSimAccountInfo async callback interface slotid exception,
    *             enter parameter 2, and check the callback value
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Async_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Async_0600';
    sim.getSimAccountInfo(env.SLOTID2, (err) => {
      if (err) {
        console.log(`${CASE_NAME} expect error: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} test fail.`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Promise_0100
    * @tc.name    Enter normal parameters to test whether the getSimAccountInfo
    *             interface function can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Promise_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Promise_0100';
    try {
      await sim.setShowName(env.SLOTID0, env.SIM_SLOT_NAME);
      await sim.setShowNumber(env.SLOTID0, env.SIM_SLOT_NUMBER);
      var iccIdValue = await sim.getSimIccId(env.SLOTID0);
      await sim.activateSim(env.SLOTID0);
    } catch (err) {
      console.log(`${CASE_NAME} setOrGet fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let info = await sim.getSimAccountInfo(env.SLOTID0);
      console.debug(`${CASE_NAME} getSimAccountInfo: ${JSON.stringify(info)}`);
      expect(info.slotIndex === env.SLOTID0
        && info.simId === env.SLOTID0
        && info.isEsim === false
        && info.isActive === true
        && info.iccId === iccIdValue
        && info.showName === env.SIM_SLOT_NAME
        && info.showNumber === env.SIM_SLOT_NUMBER
      ).assertTrue();
      console.log(`${CASE_NAME} finish`);
    } catch (error) {
      console.log(`${CASE_NAME} fail, err : ${error.message}`);
      expect().assertFail();
    }

    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Promise_0200
    * @tc.name    Test getSimAccountInfo promise interface slotid exception,
    *             enter parameter -1, and check the callback value
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Promise_0200';
    try {
      await sim.getSimAccountInfo(env.SLOTID_MINUS1);
      expect().assertFail();
      console.log(`${CASE_NAME} fail`);
    } catch (err) {
      console.log(`${CASE_NAME} expect error: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Promise_0500
    * @tc.name    Test getSimAccountInfo promise interface slotid exception,
    *             enter parameter 1, and check the callback value
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Promise_0500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Promise_0500';
    try {
      await sim.getSimAccountInfo(env.SLOTID1);
      expect().assertFail();
      console.log(`${CASE_NAME} fail`);
    } catch (err) {
      console.log(`${CASE_NAME} expect error: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimAccountInfo_Promise_0600
    * @tc.name    Test getSimAccountInfo promise interface slotid exception,
    *             enter parameter 2, and check the callback value
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimAccountInfo_Promise_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimAccountInfo_Promise_0600';
    try {
      await sim.getSimAccountInfo(env.SLOTID2);
      expect().assertFail();
      console.log(`${CASE_NAME} fail`);
    } catch (err) {
      console.log(`${CASE_NAME} expect error: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });
});