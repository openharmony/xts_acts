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
import {simSlotId, timesValue, lockSwitch} from '../default/utils/Constant.test.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

describe('SimPerformance', function () {

  /**
     * @tc.number  Telephony_Sim_getIMSI_Async_0300
     * @tc.name    Test the getIMSI interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getIMSI_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getIMSI_Async_0300 exec done useTime : ${totalTime}ms`);
        console.log('Telephony_Sim_getIMSI_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getIMSI(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getIMSI_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getIMSI_Promise_0300
     * @tc.name    Test the getIMSI interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getIMSI_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getIMSI(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getIMSI_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getIMSI_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getIMSI_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimIccId_Async_0300
     * @tc.name    Test the getSimIccId interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimIccId_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getSimIccId_Async_0300 exec done useTime : ${totalTime}ms`);
        console.log('Telephony_Sim_getSimIccId_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getSimIccId(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getSimIccId_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getSimIccId_Promise_0300
     * @tc.name    Test the getSimIccId interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimIccId_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getSimIccId(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getSimIccId_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getSimIccId_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getSimIccId_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Async_0300
     * @tc.name    Test the getISOCountryCodeForSim interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getISOCountryCodeForSim_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getISOCountryCodeForSim_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getISOCountryCodeForSim_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getISOCountryCodeForSim(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getISOCountryCodeForSim_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getISOCountryCodeForSim_Promise_0300
     * @tc.name    Test the getISOCountryCodeForSim interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getISOCountryCodeForSim_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getISOCountryCodeForSim(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getISOCountryCodeForSim_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getISOCountryCodeForSim_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getISOCountryCodeForSim_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimOperatorNumeric_Async_0300
     * @tc.name    Test the getSimOperatorNumeric interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimOperatorNumeric_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getSimOperatorNumeric_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getSimOperatorNumeric_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getSimOperatorNumeric(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getSimOperatorNumeric_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getSimOperatorNumeric_Promise_0300
     * @tc.name    Test the getSimOperatorNumeric interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimOperatorNumeric_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getSimOperatorNumeric(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getSimOperatorNumeric_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getSimOperatorNumeric_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getSimOperatorNumeric_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimSpn_Async_0300
     * @tc.name    Test the getSimSpn interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimSpn_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getSimSpn_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getSimSpn_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getSimSpn(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getSimSpn_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getSimSpn_Promise_0300
     * @tc.name    Test the getSimSpn interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimSpn_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getSimSpn(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getSimSpn_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getSimSpn_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getSimSpn_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimState_Async_0300
     * @tc.name    Test the getSimState interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimState_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getSimState_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getSimState_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getSimState(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getSimState_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getSimState_Promise_0300
     * @tc.name    Test the getSimState interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimState_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getSimState(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getSimState_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getSimState_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getSimState_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimGid1_Async_0300
     * @tc.name    Test the getSimGid1 interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimGid1_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getSimGid1_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getSimGid1_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getSimGid1(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getSimGid1_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getSimGid1_Promise_0300
     * @tc.name    Test the getSimGid1 interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimGid1_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getSimGid1(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getSimGid1_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getSimGid1_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getSimGid1_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getSimAccountInfo_Async_0300
     * @tc.name    Test the getSimAccountInfo interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimAccountInfo_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getSimAccountInfo_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getSimAccountInfo_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getSimAccountInfo(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getSimAccountInfo_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getSimAccountInfo_Promise_0300
     * @tc.name    Test the getSimAccountInfo interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getSimAccountInfo_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getSimAccountInfo(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_getSimAccountInfo_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getSimAccountInfo_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getSimAccountInfo_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_getDefaultVoiceSlotId_Async_0300
     * @tc.name    Test the getDefaultVoiceSlotId interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getDefaultVoiceSlotId_Async_0300', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_getDefaultVoiceSlotId_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_getDefaultVoiceSlotId_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.getDefaultVoiceSlotId((err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_getDefaultVoiceSlotId_Async_0300 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_getDefaultVoiceSlotId_Promise_0300
     * @tc.name    Test the getDefaultVoiceSlotId interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_getDefaultVoiceSlotId_Promise_0300', 0, async function (done) {
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.getDefaultVoiceSlotId();
      } catch (err) {
        console.log(`Telephony_Sim_getDefaultVoiceSlotId_Promise_0300 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_getDefaultVoiceSlotId_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_getDefaultVoiceSlotId_Promise_0300 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_setDefaultVoiceSlotId_Async_0200
     * @tc.name    Test the setDefaultVoiceSlotId interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_setDefaultVoiceSlotId_Async_0200', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;
    var defaultValue = 0;
    sim.getDefaultVoiceSlotId((err, result) => {
      if (err) {
        console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0200 getDefaultVoiceSLOT_ID_fail, err: ${
          err.message}`);
        expect().assertFail();
        done();
        return;
      }
      defaultValue = result;
    });

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0200 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_setDefaultVoiceSlotId_Async_0200 finish');
        sim.setDefaultVoiceSlotId(defaultValue, (err, ret) => {
          if (err) {
            console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0200 setDefaultVoiceSLOT_ID_err: ${
              err.message}`);
            expect().assertFail();
            done();
            return;
          }
          expect(ret).assertTrue();
        });
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.setDefaultVoiceSlotId(simSlotId.SLOT_ID_0, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_setDefaultVoiceSlotId_Async_0200 fail, err : ${err.message}`);
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
     * @tc.number  Telephony_Sim_setDefaultVoiceSlotId_Promise_0200
     * @tc.name    Test the setDefaultVoiceSlotId interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_setDefaultVoiceSlotId_Promise_0200', 0, async function (done) {
    var defaultValue = 0;
    var result = await sim.getDefaultVoiceSlotId();
    defaultValue = result;
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.setDefaultVoiceSlotId(simSlotId.SLOT_ID_0);
      } catch (err) {
        console.log(`Telephony_Sim_setDefaultVoiceSlotId_Promise_0200 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_setDefaultVoiceSlotId_Promise_0200 : useTime : ${endTime - startTime}ms`);
    var ret = await sim.setDefaultVoiceSlotId(defaultValue);
    expect(ret).assertTrue();
    console.log('Telephony_Sim_setDefaultVoiceSlotId_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_unlockPin_Async_0200
     * @tc.name    Test the unlockPin interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_unlockPin_Async_0200', 0, async function (done) {
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;
    var PIN = '1234';

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_unlockPin_Async_0200 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_unlockPin_Async_0200 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.unlockPin(simSlotId.SLOT_ID_0, PIN, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_unlockPin_Async_0200 fail, err: ${err.message}`);
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
     * @tc.number  Telephony_Sim_unlockPin_Promise_0200
     * @tc.name    Test the unlockPin interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_unlockPin_Promise_0200', 0, async function (done) {
    var PIN = '1234';
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.unlockPin(simSlotId.SLOT_ID_0, PIN);
      } catch (err) {
        console.log('Telephony_Sim_unlockPin_Promise_0200 fail');
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_unlockPin_Promise_0200 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_unlockPin_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_unlockPuk_Async_0200
     * @tc.name    Test the unlockPuk interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_unlockPuk_Async_0200', 0, async function (done) {
    var newPin = '1234';
    var PUK = '12345678';
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_unlockPuk_Async_0200 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_unlockPuk_Async_0200 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.unlockPuk(simSlotId.SLOT_ID_0, newPin, PUK, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_unlockPuk_Async_0200 fail, err: ${err.message}`);
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
     * @tc.number  Telephony_Sim_unlockPuk_Promise_0200
     * @tc.name    Test the unlockPuk interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_unlockPuk_Promise_0200', 0, async function (done) {
    var newPin = '1234';
    var PUK = '4321';
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.unlockPuk(simSlotId.SLOT_ID_0, newPin, PUK);
      } catch (err) {
        console.log(`Telephony_Sim_unlockPuk_Promise_0200 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_unlockPuk_Promise_0200 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_unlockPuk_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_alterPin_Async_0200
     * @tc.name    Test the alterPin interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_alterPin_Async_0200', 0, async function (done) {
    var oldPin = '1234';
    var newPin = '4321';
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_alterPin_Async_0200 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_alterPin_Async_0200 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.alterPin(simSlotId.SLOT_ID_0, oldPin, newPin, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_alterPin_Async_0200 fail, err: ${err.message}`);
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
     * @tc.number  Telephony_Sim_alterPin_Promise_0200
     * @tc.name    Test the alterPin interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_alterPin_Promise_0200', 0, async function (done) {
    var oldPin = '1234';
    var newPin = '4321';
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.alterPin(simSlotId.SLOT_ID_0, oldPin, newPin);
      } catch (err) {
        console.log(`Telephony_Sim_alterPin_Promise_0300 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_alterPin_Promise_0200 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_alterPin_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_setLockState_Async_0300
     * @tc.name    Test the setLockState interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_setLockState_Async_0300', 0, async function (done) {
    var PIN = '0123456789';
    var totalTime = 0;
    var startTime = 0;
    var endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        expect(totalTime).assertLess(timesValue.TIME_SPAN);
        console.log(`Telephony_Sim_setLockState_Async_0300 exec done useTime:${totalTime}ms`);
        console.log('Telephony_Sim_setLockState_Async_0300 finish');
        done();
        return;
      }
      startTime = new Date().getTime();
      sim.setLockState(simSlotId.SLOT_ID_0, PIN, lockSwitch.OPEN, (err, data) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          console.log(`Telephony_Sim_setLockState_Async_0300 fail, err: ${err.message}`);
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
     * @tc.number  Telephony_Sim_setLockState_Promise_0300
     * @tc.name    Test the setLockState interface query function ten times
     *             and expect a delay of less than timesValue.TIME_SPAN millisecond.
     * @tc.desc    Performance test
     */
  it('Telephony_Sim_setLockState_Promise_0300', 0, async function (done) {
    var PIN = '0123456789';
    const startTime = new Date().getTime();
    for (let index = 0;index < timesValue.TEST_RUN_TIME;index++) {
      try {
        await sim.setLockState(simSlotId.SLOT_ID_0, PIN, lockSwitch.OPEN);
      } catch (err) {
        console.log(`Telephony_Sim_setLockState_Promise_0300 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    }
    const endTime = new Date().getTime();
    expect(endTime - startTime).assertLess(timesValue.TIME_SPAN);
    console.log(`Telephony_Sim_setLockState_Promise_0300 : useTime : ${endTime - startTime}ms`);
    console.log('Telephony_Sim_setLockState_Promise_0300 finish');
    done();
  });
});