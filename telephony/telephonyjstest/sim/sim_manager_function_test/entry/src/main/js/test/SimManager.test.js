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
import * as env from './lib/Const';
import { describe, it, expect, afterEach } from 'deccjsunit/index';

describe('SimManagerTest', function () {
  afterEach(async function () {
    try {
      class IccAccountInfo {
        constructor (slotIndex, showName, showNumber) {
          this.slotIndex = slotIndex;
          this.showName = showName;
          this.showNumber = showNumber;
        }
      }
      const SLOT_INDEX = 0;
      const SHOW_NAME = 'test';
      const SHOW_NUMBER = '10';
      let iccAccountInfo = new IccAccountInfo(SLOT_INDEX, SHOW_NAME, SHOW_NUMBER);
      expect(iccAccountInfo.slotIndex === SLOT_INDEX).assertTrue();
      expect(iccAccountInfo.showName === SHOW_NAME).assertTrue();
      expect(iccAccountInfo.showNumber === SHOW_NUMBER).assertTrue();

      class LockStatusResponse {
        constructor (result, remain) {
          this.result = result;
          this.remain = remain;
        }
      }
      const RES_RESULT = 0;
      const RES_REMAIN = 0;
      let lockStatusResponse = new LockStatusResponse(RES_RESULT, RES_REMAIN);
      expect(lockStatusResponse.result === RES_RESULT).assertTrue();
      expect(lockStatusResponse.remain === RES_REMAIN).assertTrue();
    } catch (error) {
      console.log(`Telephony_Sim error`);
    }
  });

  /**
    * @tc.number  Telephony_Sim_constantValidate_0100
    * @tc.name    SIM card constant validation
    * @tc.desc    Function test
    */
    it('Telephony_Sim_constantValidate_0100', 0, async function (done) {
        console.log(`Telephony_Sim_constantValidate_0100 start`);
        expect(sim.SimState.SIM_STATE_UNKNOWN !== env.INVALID_VALUE).assertTrue();
        expect(sim.SimState.SIM_STATE_NOT_PRESENT !== env.INVALID_VALUE).assertTrue();
        expect(sim.SimState.SIM_STATE_LOCKED !== env.INVALID_VALUE).assertTrue();
        expect(sim.SimState.SIM_STATE_NOT_READY !== env.INVALID_VALUE).assertTrue();
        expect(sim.SimState.SIM_STATE_READY !== env.INVALID_VALUE).assertTrue();
        expect(sim.SimState.SIM_STATE_LOADED !== env.INVALID_VALUE).assertTrue();
        expect(sim.ContactType.GENERAL_CONTACT !== env.INVALID_VALUE).assertTrue();
        expect(sim.ContactType.FIXED_DIALING !== env.INVALID_VALUE).assertTrue();
        expect(sim.LockState.LOCK_OFF !== env.INVALID_VALUE).assertTrue();
        expect(sim.LockState.LOCK_ON !== env.INVALID_VALUE).assertTrue();
        expect(sim.PIN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.FDN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.UNKNOWN_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.SINGLE_MODE_SIM_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.SINGLE_MODE_USIM_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.SINGLE_MODE_RUIM_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.DUAL_MODE_CG_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.CT_NATIONAL_ROAMING_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.CU_DUAL_MODE_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.DUAL_MODE_TELECOM_LTE_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.DUAL_MODE_UG_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.SINGLE_MODE_ISIM_CARD !== env.INVALID_VALUE).assertTrue();
        expect(sim.PN_PIN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PN_PUK_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PU_PIN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PU_PUK_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PP_PIN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PP_PUK_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PC_PIN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.PC_PUK_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.SIM_PIN_LOCK !== env.INVALID_VALUE).assertTrue();
        expect(sim.SIM_PUK_LOCK !== env.INVALID_VALUE).assertTrue();
        console.log(`Telephony_Sim_constantValidate_0100 finish`);
        done();
    });
	
  /**
    * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Async_0200
    * @tc.name    Enter exception parameters to test whether the getISOCountryCodeForSim interface function
    *             can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getISOCountryCodeForSim_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Async_0200';
    sim.getISOCountryCodeForSim(env.SLOTID2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} fail, data = ${data}`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Promise_0200
    * @tc.name    Enter exception parameters to test whether the getISOCountryCodeForSim interface function
    *             can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getISOCountryCodeForSim_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getISOCountryCodeForSim_Promise_0200';
    try {
      var data = await sim.getISOCountryCodeForSim(env.SLOTID2);
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
      done();
      return;
    }
    expect().assertFail();
    console.log(`${CASE_NAME} fail, data = ${data}`);
    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimOperatorNumeric_Async_0200
    * @tc.name    Enter exception parameters to test whether the getSimOperatorNumeric interface function
    *             can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimOperatorNumeric_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimOperatorNumeric_Async_0200';
    sim.getSimOperatorNumeric(env.SLOTID2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} fail, data = ${data}`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimOperatorNumeric_Promise_0200
    * @tc.name    Enter exception parameters to test whether the getSimOperatorNumeric interface function
    *             can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimOperatorNumeric_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimOperatorNumeric_Promise_0200';
    try {
      var data = await sim.getSimOperatorNumeric(env.SLOTID2);
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
      done();
      return;
    }
    expect().assertFail();
    console.log(`${CASE_NAME} fail, data = ${data}`);
    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimSpn_Async_0200
    * @tc.name    Enter exception parameters to test whether the getSimSpn interface function can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimSpn_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimSpn_Async_0200';
    sim.getSimSpn(env.SLOTID2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} fail, data = ${data}`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimSpn_Promise_0200
    * @tc.name    Enter exception parameters to test whether the getSimSpn interface function can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimSpn_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimSpn_Promise_0200';
    try {
      var data = await sim.getSimSpn(env.SLOTID2);
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
      done();
      return;
    }
    expect().assertFail();
    console.log(`${CASE_NAME} fail, data = ${data}`);
    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimState_Async_0200
    * @tc.name    Enter exception parameters to test whether the getSimState interface function can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimState_Async_0200', 0, async function (done) {
    sim.getSimState(env.SLOTID2, (err, data) => {
      const CASE_NAME = 'Telephony_Sim_getSimState_Async_0200';
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      console.log(`${CASE_NAME} fail, data = ${data}`);
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getSimState_Promise_0200
    * @tc.name    Enter exception parameters to test whether the getSimState interface function can execute normally.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getSimState_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getSimState_Promise_0200';
    try {
      var data = await sim.getSimState(env.SLOTID2);
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
      done();
      return;
    }
    expect().assertFail();
    console.log(`${CASE_NAME} fail, data = ${data}`);
    done();
  });

  
 

  

  /**
    * @tc.number  Telephony_Sim_getDefaultVoiceSlotId_Async_0200
    * @tc.name    The test first sets the default card number and then calls
    *             the getDefaultVoiceLotid interface to get the SIM ID.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getDefaultVoiceSlotId_Async_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getDefaultVoiceSlotId_Async_0200';
    sim.getDefaultVoiceSlotId((err, data) => {
      if (err) {
        console.log(`${CASE_NAME} expect err: ${err.message}`);
        console.log(`${CASE_NAME} finish`);
        done();
        return;
      }
      expect().assertFail();
      done();
    });
  });

  /**
    * @tc.number  Telephony_Sim_getDefaultVoiceSlotId_Promise_0200
    * @tc.name    The test first sets the default card number and then calls
    *             the getDefaultVoiceLotid interface to get the default SIM ID.
    * @tc.desc    Function test
    */
  it('Telephony_Sim_getDefaultVoiceSlotId_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_getDefaultVoiceSlotId_Promise_0200';
    try {
      let data = await sim.getDefaultVoiceSlotId();
      console.log(`${CASE_NAME}, data = ${data}`);
      expect().assertFail();
    } catch (err) {
      console.log(`${CASE_NAME} expect err: ${err.message}`);
      console.log(`${CASE_NAME} finish`);
    }
    done();
  });

  

 

  

  


 

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0700
   * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
   *             check the callback value, and expect the callback result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_isSimActive_Async_0700';
    sim.isSimActive(env.SLOTID2, (err, data) => {
      if (err) {
        console.log(`${CASE_NAME} fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data).assertFalse();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0700
   * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
   *             check the callback value, and expect the callback result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0700', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_isSimActive_Promise_0700';
    try {
      let data = await sim.isSimActive(env.SLOTID2);
      expect(data).assertFalse();
    } catch (err) {
      console.log(`${CASE_NAME} isSimActive fail, err: ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log(`${CASE_NAME} finish`);
    done();
  });

  

 

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Async_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Async_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_hasSimCard_Async_0600';
    sim.hasSimCard(env.SLOTID2, (err, data) => {
      if (err) {
        expect().assertFail();
        console.log(`${CASE_NAME} fail, err: ${err.message}`);
        done();
        return;
      }
      expect(data).assertFalse();
      console.log(`${CASE_NAME} finish`);
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Promise_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_hasSimCard_Promise_0600';
    try {
      let data = await sim.hasSimCard(env.SLOTID2);
      expect(data).assertFalse();
    } catch (err) {
      expect().assertFail();
      console.log(`${CASE_NAME} fail, err: ${err.message}`);
      done();
      return;
    }
    console.log(`${CASE_NAME} finish`);
    done();
  });

  

  

  

 

 

 


  /**
   * @tc.number Telephony_Sim_getMaxSimCount_0100
   * @tc.name   Test the getMaxSimCount interface and view the callback result
   * @tc.desc   Function test
   */
  it('Telephony_Sim_getMaxSimCount_0100', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_getMaxSimCount_0100';
    let simCount = sim.getMaxSimCount();
    expect(simCount > env.SIM_MIN_COUNT).assertTrue();
    console.log(`${CASE_NAME} test finish.`);
    done();
  });


  /**
   * @tc.number Telephony_Sim_GetCardType_Async_0400
   * @tc.name   Verify that the slotId of the GetCardType async callback interface is abnormal
   *            and enter parameter 2, and check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_GetCardType_Async_0400', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_GetCardType_Async_0400';
    sim.getCardType(env.SLOTID2, (error, cardType) => {
      if (error) {
        console.log(`${CASE_NAME} GetCardType error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(cardType === sim.UNKNOWN_CARD).assertTrue();
      console.log(`${CASE_NAME} test finish.`);
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_GetCardType_Promise_0400
   * @tc.name   Verify that the slotId of the GetCardType promise interface is abnormal
   *            and enter parameter 2, and check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_GetCardType_Promise_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_GetCardType_Promise_0400';
    try {
      const cardType = await sim.getCardType(env.SLOTID2);
      expect(cardType === sim.UNKNOWN_CARD).assertTrue();
      console.log(`${CASE_NAME} test finish.`);
    } catch (error) {
      console.log(`${CASE_NAME} GetCardType error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });



 

  /**
   * @tc.number Telephony_Sim_hasOperatorPrivileges_Async_0400
   * @tc.name   Test hasOperatorPrivileges interface slotId exception enter parameter 2,
   *            check the callback result
   * @tc.desc   Function test
   */
  it('Telephony_Sim_hasOperatorPrivileges_Async_0400', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_hasOperatorPrivileges_Async_0400';
    sim.hasOperatorPrivileges(env.SLOTID2, (error, result) => {
      if (error) {
        console.log(`${CASE_NAME} hasOperatorPrivileges error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(result).assertFalse();
      console.log(`${CASE_NAME} test finish.`);
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_hasOperatorPrivileges_Promise_0400
   * @tc.name   Test hasOperatorPrivileges interface slotId exception enter parameter 2,
   *            check the returned result
   * @tc.desc   Function test
   */
  it('Telephony_Sim_hasOperatorPrivileges_Promise_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_hasOperatorPrivileges_Promise_0400';
    try {
      const result = await sim.hasOperatorPrivileges(env.SLOTID2);
      expect(result).assertFalse();
      console.log(`${CASE_NAME} test finish.`);
    } catch (error) {
      console.log(`${CASE_NAME} hasOperatorPrivileges error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });
})
