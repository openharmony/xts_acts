/*
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

import sim from '@ohos.telephony_sim';
import {simSlotId, timesValue, OTHER_ABNORMAL, OPERATOR_NUM_LENGTH, operatorCode, IMSI_LENGTH, ICC_LENGTH, lockSwitch}
  from '../default/utils/Constant.test.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

describe('SimReliability', function () {

  /**
    * @tc.number  Telephony_Sim_getIMSI_Async_0400
    * @tc.name    The test executed the getIMSI interface query function ten times,
    *             expecting to execute successfully each time.
    * @tc.desc    Reliability test
    */
  it('Telephony_Sim_getIMSI_Async_0400', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getIMSI_Async_0400 finish');
        done();
        return;
      }
      sim.getIMSI(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getIMSI_Async_0400 fail err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data !== '' && data !== undefined).assertTrue();
        expect(data.length === IMSI_LENGTH).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
    * @tc.number  Telephony_Sim_getIMSI_Promise_0400
    * @tc.name    The test executed the getIMSI interface query function ten times,
    *             expecting to execute successfully each time.
    * @tc.desc    Reliability test
    */
  it('Telephony_Sim_getIMSI_Promise_0400', 0, async function (done) {
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getIMSI(simSlotId.SLOT_ID_0);
        expect(data !== '' && data !== undefined).assertTrue();
        expect(data.length === IMSI_LENGTH).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getIMSI_Promise_0400 fail err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getIMSI_Promise_0400 finish');
    done();
  });

  /**
    * @tc.number  Telephony_Sim_getSimIccId_Async_0400
    * @tc.name    The test executed the getSimIccId interface query function ten times,
    *             expecting to execute successfully each time.
    * @tc.desc    Reliability test
    */
  it('Telephony_Sim_getSimIccId_Async_0400', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getSimIccId_Async_0400 finish');
        done();
        return;
      }
      sim.getSimIccId(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getSimIccId_Async_0400 fail err${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data !== '' && data !== undefined).assertTrue();
        expect(data.length === ICC_LENGTH).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
    * @tc.number  Telephony_Sim_getSimIccId_Promise_0400
    * @tc.name    The test executed the getSimIccId interface query function ten times,
    *             expecting to execute successfully each time.
    * @tc.desc    Reliability test
    */
  it('Telephony_Sim_getSimIccId_Promise_0400', 0, async function (done) {
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim .getSimIccId(simSlotId.SLOT_ID_0);
        expect(data !== '' && data !== undefined).assertTrue();
        expect(data.length === ICC_LENGTH).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getSimIccId_Promise_0400 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getSimIccId_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Async_0400
     * @tc.name    The test executed the getISOCountryCodeForSim interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getISOCountryCodeForSim_Async_0400', 0, async function (done) {
    var countryCode = 'cn';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getISOCountryCodeForSim_Async_0400 finish');
        done();
        return;
      }
      sim.getISOCountryCodeForSim(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getISOCountryCodeForSim_Async_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        // The country code for mainland China is cn.
        expect(data === countryCode).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Promise_0400
     * @tc.name    The test executed the getISOCountryCodeForSim interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getISOCountryCodeForSim_Promise_0400', 0, async function (done) {
    var countryCode = 'cn';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getISOCountryCodeForSim(simSlotId.SLOT_ID_0);
        // The country code for mainland China is cn.
        expect(data === countryCode).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getISOCountryCodeForSim_Promise_0400 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getISOCountryCodeForSim_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimOperatorNumeric_Async_0400
     * @tc.name    The test executed the getSimOperatorNumeric interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimOperatorNumeric_Async_0400', 0, async function (done) {
    var operatorNumTopThree = '460';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getSimOperatorNumeric_Async_0400 finish');
        done();
        return;
      }
      sim.getSimOperatorNumeric(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getSimOperatorNumeric_Async_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data !== '' && data !== undefined).assertTrue();
        // The length of operator numeric in mainland China is 5.
        expect(data.length === OPERATOR_NUM_LENGTH).assertTrue();
        // The first three operator numeric in mainland China is '460'.
        expect(data.substring(0, 3) === operatorNumTopThree).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_getSimOperatorNumeric_Promise_0400
     * @tc.name    The test executed the getSimOperatorNumeric interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimOperatorNumeric_Promise_0400', 0, async function (done) {
    var operatorNumTopThree = '460';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getSimOperatorNumeric(simSlotId.SLOT_ID_0);
        expect(data !== '' && data !== undefined).assertTrue();
        // The length of operator numeric in mainland China is 5.
        expect(data.length === OPERATOR_NUM_LENGTH).assertTrue();
        // The first three operator numeric in mainland China is '460'.
        expect(data.substring(0, 3) === operatorNumTopThree).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getSimOperatorNumeric_Promise_0400 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getSimOperatorNumeric_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimSpn_Async_0400
     * @tc.name    The test executed the getSimSpn interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimSpn_Async_0400', 0, async function (done) {
    var mobileSpn = '00434D4343FFFFFFFFFFFFFFFFFFFFFFFF';
    var unicomSpn = '00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    var telecomSpn = '01804E2D56FD75354FE1FFFFFFFFFFFFFF';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getSimSpn_Async_0400 finish');
        done();
        return;
      }
      sim.getSimSpn(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getSimSpn_Async_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data !== '' && data !== undefined).assertTrue();
        sim.getSimOperatorNumeric(simSlotId.SLOT_ID_0, (err, value) => {
          if (err) {
            console.log(`Telephony_Sim_getSimSpn_Async_0400 getSimOperatorNumeric fail, err: ${
              err.message}`);
            expect().assertFail();
            done();
            return;
          }
          if ((value === operatorCode.MOBILE_CODE_1) || (value === operatorCode.MOBILE_CODE_2) ||
                    (value === operatorCode.MOBILE_CODE_3) || (value === operatorCode.MOBILE_CODE_4)) {
            expect(data === mobileSpn).assertTrue();
          } else if ((value === operatorCode.UNICOM_CODE_1) || (value === operatorCode.UNICOM_CODE_2) ||
                    (value === operatorCode.UNICOM_CODE_3)) {
            expect(data === unicomSpn).assertTrue();
          } else if ((value === operatorCode.TELECOM_CODE_1) || (value === operatorCode.TELECOM_CODE_2) ||
                    (value === operatorCode.TELECOM_CODE_3)) {
            expect(data === telecomSpn).assertTrue();
          }
        });
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_getSimSpn_Promise_0400
     * @tc.name    The test executed the getSimSpn interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimSpn_Promise_0400', 0, async function (done) {
    var mobileSpn = '00434D4343FFFFFFFFFFFFFFFFFFFFFFFF';
    var unicomSpn = '00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF';
    var telecomSpn = '01804E2D56FD75354FE1FFFFFFFFFFFFFF';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getSimSpn(simSlotId.SLOT_ID_0);
        expect(data !== '' && data !== undefined).assertTrue();
        try {
          var value = await sim.getSimOperatorNumeric(simSlotId.SLOT_ID_0);
          if ((value === operatorCode.MOBILE_CODE_1) || (value === operatorCode.MOBILE_CODE_2) ||
                    (value === operatorCode.MOBILE_CODE_3) || (value === operatorCode.MOBILE_CODE_4)) {
            expect(data === mobileSpn).assertTrue();
          } else if ((value === operatorCode.UNICOM_CODE_1) || (value === operatorCode.UNICOM_CODE_2) ||
                    (value === operatorCode.UNICOM_CODE_3)) {
            expect(data === unicomSpn).assertTrue();
          } else if ((value === operatorCode.TELECOM_CODE_1) || (value === operatorCode.TELECOM_CODE_2) ||
                    (value === operatorCode.TELECOM_CODE_3)) {
            expect(data === telecomSpn).assertTrue();
          }
        } catch (err) {
          console.log(`Telephony_Sim_getSimSpn_Promise_0400 getSimOperatorNumeric fail, err : ${
            err.message}`);
          expect().assertFail();
          done();
          return;
        }
      } catch (err) {
        console.log(`Telephony_Sim_getSimSpn_Promise_0400 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getSimSpn_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimState_Async_0400
     * @tc.name    The test executed the getSimState interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimState_Async_0400', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getSimState_Async_0400 finish');
        done();
        return;
      }
      sim.getSimState(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getSimState_Async_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data === sim.SIM_STATE_READY).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_getSimState_Promise_0400
     * @tc.name    The test executed the getSimState interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimState_Promise_0400', 0, async function (done) {
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getSimState(simSlotId.SLOT_ID_0);
        expect(data === sim.SIM_STATE_READY).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getSimState_Promise_0400 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getSimState_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimGid1_Async_0400
     * @tc.name    The test executed the getSimGid1 interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimGid1_Async_0400', 0, async function (done) {
    var minLength = 1;

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getSimGid1_Async_0400 finish');
        done();
        return;
      }
      sim.getSimGid1(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getSimGid1_Async_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data !== '' && data !== undefined).assertTrue();
        expect((data.length >= minLength)).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_getSimGid1_Promise_0400
     * @tc.name    The test executed the getSimGid1 interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimGid1_Promise_0400', 0, async function (done) {
    var minLength = 1;
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getSimGid1(simSlotId.SLOT_ID_0);
        expect(data !== '' && data !== undefined).assertTrue();
        expect((data.length >= minLength)).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getSimGid1_Promise_0400 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getSimGid1_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimAccountInfo_Async_0400
     * @tc.name    The test executed the getSimAccountInfo interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimAccountInfo_Async_0400', 0, async function (done) {
    var defaultName = 'simDefaultDisplayName';
    var defaultNumber = 'simDefaultDisplayNumber';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getSimAccountInfo_Async_0400 finish');
        done();
        return;
      }
      sim.getSimAccountInfo(simSlotId.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getSimAccountInfo_Async_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data.slotIndex === simSlotId.SLOT_ID_0).assertTrue();
        // return; the default piling data as simDefaultDisplayName.
        expect(data.showName === defaultName).assertTrue();
        // return; the default piling data as simDefaultDisplayNumber.
        expect(data.showNumber === defaultNumber).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_getSimAccountInfo_Promise_0400
     * @tc.name    The test executed the getSimAccountInfo interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getSimAccountInfo_Promise_0400', 0, async function (done) {
    var defaultName = 'simDefaultDisplayName';
    var defaultNumber = 'simDefaultDisplayNumber';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.getSimAccountInfo(simSlotId.SLOT_ID_0);
        expect(data.slotIndex === simSlotId.SLOT_ID_0).assertTrue();
        // return; the default piling data as simDefaultshowName.
        expect(data.showName === defaultName).assertTrue();
        // return; the default piling data as simDefaultshowNumber.
        expect(data.showNumber === defaultNumber).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_getSimAccountInfo_Promise_0400 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_getSimAccountInfo_Promise_0400 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getDefaultVoiceSlotId_Async_0400
     * @tc.name    The test executed the getDefaultVoiceSlotId interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getDefaultVoiceSlotId_Async_0400', 0, async function (done) {
    var defaultValue = 0;
    sim.getDefaultVoiceSlotId((err, result) => {
      if (err) {
        console.log(`Telephony_Sim_getDefaultVoiceSlotId_Async_0400 getDefaultVoiceSLOT_ID_fail, err: ${
          err.message}`);
        expect().assertFail();
        done();
        return;
      }
      defaultValue = result;
    });
    sim.setDefaultVoiceSlotId(simSlotId.SLOT_ID_0, (err) => {
      if (err) {
        console.log('Telephony_Sim_getDefaultVoiceSlotId_Async_0400：setDefaultVoiceSLOT_ID_err');
        expect().assertFail();
        done();
        return;
      }

      function recursive (n) {
        if (n <= 0) {
          sim.setDefaultVoiceSlotId(defaultValue, (err) => {
            if (err) {
              console.log(`Telephony_Sim_getDefaultVoiceSlotId_Async_0400 setDefaultVoiceSLOT_ID_err: ${
                err.message}`);
              expect().assertFail();
              done();
              return;
            }
            console.log('Telephony_Sim_getDefaultVoiceSlotId_Async_0400 finish');
            done();
            return;
          });
        }
        sim.getDefaultVoiceSlotId((err, data) => {
          if (err) {
            console.log(`Telephony_Sim_getDefaultVoiceSlotId_Async_0400 fail, err : ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          expect(data === simSlotId.SLOT_ID_0).assertTrue();
          recursive(n - 1);
        });
      }

      recursive(timesValue.TEST_RUN_TIME);
    });
  });

  /**
     * @tc.number  Telephony_Sim_getDefaultVoiceSlotId_Promise_0400
     * @tc.name    The test executed the getDefaultVoiceSlotId interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_getDefaultVoiceSlotId_Promise_0400', 0, async function (done) {
    var defaultValue = 0;
    var result = await sim.getDefaultVoiceSlotId();
    defaultValue = result;
    try {
      await sim.setDefaultVoiceSlotId(simSlotId.SLOT_ID_0);
      for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
        try {
          var data = await sim.getDefaultVoiceSlotId();
          expect(data === simSlotId.SLOT_ID_0).assertTrue();
        } catch (err) {
          console.log(`Telephony_Sim_getDefaultVoiceSlotId_Promise_0400 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
      }
      await sim.setDefaultVoiceSlotId(defaultValue);
      console.log('Telephony_Sim_getDefaultVoiceSlotId_Promise_0400 finish');
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getDefaultVoiceSlotId_Promise_0400 setDefaultVoiceSLOT_ID_err${err.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
     * @tc.number  Telephony_Sim_setDefaultVoiceSlotId_Async_0300
     * @tc.name    The test executed the setDefaultVoiceSlotId interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_setDefaultVoiceSlotId_Async_0300', 0, async function (done) {
    var defaultValue = 0;
    sim.getDefaultVoiceSlotId((err, result) => {
      if (err) {
        console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0300 getDefaultVoiceSLOT_ID_fail, err: ${
          err.message}`);
        expect().assertFail();
        done();
        return;
      }
      defaultValue = result;
    });

    function recursive (n) {
      if (n <= 0) {
        sim.setDefaultVoiceSlotId(defaultValue, (err) => {
          if (err) {
            console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0300 setDefaultVoiceSLOT_ID_err: ${
              err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.log('Telephony_Sim_setDefaultVoiceSlotId_Async_0300 finish');
          done();
          return;
        });
      }
      sim.setDefaultVoiceSlotId(simSlotId.SLOT_ID_0, (err) => {
        if (err) {
          console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0300 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_setDefaultVoiceSlotId_Promise_0300
     * @tc.name    The test executed the setDefaultVoiceSlotId interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_setDefaultVoiceSlotId_Promise_0300', 0, async function (done) {
    var defaultValue = 0;
    var result = await sim.getDefaultVoiceSlotId();
    defaultValue = result;
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.setDefaultVoiceSlotId(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_setDefaultVoiceSlotId_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    await sim.setDefaultVoiceSlotId(defaultValue);
    console.log('Telephony_Sim_setDefaultVoiceSlotId_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_unlockPin_Async_0300
     * @tc.name    The test executed the unlockPin interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_unlockPin_Async_0300', 0, async function (done) {
    var PIN = '1234';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_unlockPin_Async_0300 finish');
        done();
        return;
      }
      sim.unlockPin(simSlotId.SLOT_ID_0, PIN, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_unlockPin_Async_0300 fail, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data.result === OTHER_ABNORMAL).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_unlockPin_Promise_0300
     * @tc.name    The test executed the unlockPin interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_unlockPin_Promise_0300', 0, async function (done) {
    var PIN = '1234';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.unlockPin(simSlotId.SLOT_ID_0, PIN);
        expect(data.result === OTHER_ABNORMAL).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_unlockPin_Promise_0300 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_unlockPin_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_unlockPuk_Async_0300
     * @tc.name    The test executed the unlockPin interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_unlockPuk_Async_0300', 0, async function (done) {
    var newPin = '1234';
    var PUK = '12345678';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_unlockPuk_Async_0300 finish');
        done();
        return;
      }
      sim.unlockPuk(simSlotId.SLOT_ID_0, newPin, PUK, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_unlockPuk_Async_0300 fail, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data.result === OTHER_ABNORMAL).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_unlockPuk_Promise_0300
     * @tc.name    The test executed the unlockPuk interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_unlockPuk_Promise_0300', 0, async function (done) {
    var newPin = '1234';
    var PUK = '12345678';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.unlockPuk(simSlotId.SLOT_ID_0, newPin, PUK);
        expect(data.result === OTHER_ABNORMAL).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_unlockPuk_Promise_0300 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_unlockPuk_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_alterPin_Async_0300
     * @tc.name    The test executed the alterPin interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_alterPin_Async_0300', 0, async function (done) {
    var oldPin = '1234';
    var newPin = '4321';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_alterPin_Async_0300 finish');
        done();
        return;
      }
      sim.alterPin(simSlotId.SLOT_ID_0, oldPin, newPin, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_alterPin_Async_0300 fail, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data.result === OTHER_ABNORMAL).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_alterPin_Promise_0300
     * @tc.name    The test executed the alterPin interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_alterPin_Promise_0300', 0, async function (done) {
    var oldPin = '1234';
    var newPin = '4321';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.alterPin(simSlotId.SLOT_ID_0, oldPin, newPin);
        expect(data.result === OTHER_ABNORMAL).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_alterPin_Promise_0300 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_alterPin_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_setLockState_Async_0400
     * @tc.name    The test executed the setLockState interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_setLockState_Async_0400', 0, async function (done) {
    var PIN = '0123456789';

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_alterPin_Async_0300 finish');
        done();
        return;
      }
      sim.setLockState(simSlotId.SLOT_ID_0, PIN, lockSwitch.OPEN, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_setLockState_Async_0400 fail, err: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data.result === OTHER_ABNORMAL).assertTrue();
        recursive(n - 1);
      });
    }

    recursive(timesValue.TEST_RUN_TIME);
  });

  /**
     * @tc.number  Telephony_Sim_setLockState_Promise_0400
     * @tc.name    The test executed the setLockState interface query function ten times,
     *             expecting to execute successfully each time.
     * @tc.desc    Reliability test
     */
  it('Telephony_Sim_setLockState_Promise_0400', 0, async function (done) {
    var PIN = '0123456789';
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        var data = await sim.setLockState(simSlotId.SLOT_ID_0, PIN, lockSwitch.OPEN);
        expect(data.result === OTHER_ABNORMAL).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_setLockState_Promise_0400 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_Sim_setLockState_Promise_0400 finish');
    done();
  });
});