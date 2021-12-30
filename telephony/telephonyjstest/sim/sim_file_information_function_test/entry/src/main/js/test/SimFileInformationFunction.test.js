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
import {
  SIM_SLOT_ID,
  PHONE_NUMBER_LENGTH
} from './lib/Const.js';
import {
  describe,
  it,
  expect,
} from 'deccjsunit/index';
describe('SimFileInformationFunction', function () {

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Async_0100
   * @tc.name    The getSimTelephoneNumber interface is called with slotId input parameter 0.
   *             The expected return value is not null
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Async_0100', 0, async function (done) {
    sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0100 fail err${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0100 data${data}`);
      expect(data.length >= PHONE_NUMBER_LENGTH).assertTrue();
      console.log('Telephony_Sim_getSimTelephoneNumber_Async_0100 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Async_0200
   * @tc.name    Call getSimTelephoneNumber, slotId parameter abnormal, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Async_0200', 0, async function (done) {
    sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId11, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getSimTelephoneNumber_Async_0200 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0200 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Async_0500
   * @tc.name    Test getSimTelephoneNumber slotId exception input parameter 1, check the callback
   *             value, and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Async_0500', 0, async function (done) {
    sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId1, (err, data) => {
      if (err) {
        console.log('Telephony_Sim_getSimTelephoneNumber_Async_0500 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0500 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Async_0600
   * @tc.name    Test getSimTelephoneNumber slotId exception input parameter 2,
   *             check the callback value, and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Async_0600', 0, async function (done) {
    sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId2, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getSimTelephoneNumber_Async_0600 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0600 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Promise_0100
   * @tc.name    The getSimTelephoneNumber interface is called with slotId input parameter 0.
   *             The expected return value is not null
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Promise_0100', 0, async function (done) {
    let data;
    try {
      data = await sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId0);
    } catch (err) {
      console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0100 fail err${err.message}`);
      done();
      return;
    }
    console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0100 data${data}`);
    expect(data.length >= 11).assertTrue();
    console.log('Telephony_Sim_getSimTelephoneNumber_Promise_0100 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Promise_0200
   * @tc.name    Call getSimTelephoneNumber, slotId parameter abnormal, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Promise_0200', 0, async function (done) {
    let data;
    try {
      data = await sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId11);
    } catch (err) {
      console.log('Telephony_Sim_getSimTelephoneNumber_Promise_0200 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0200, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Promise_0500
   * @tc.name    Test getSimTelephoneNumber slotId exception input parameter 1, check the callback
   *             value, and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Promise_0500', 0, async function (done) {
    let data;
    try {
      data = await sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId1);
    } catch (err) {
      console.log('Telephony_Sim_getSimTelephoneNumber_Promise_0500 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0500, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Promise_0600
   * @tc.name    Test getSimTelephoneNumber slotId exception input parameter 2, check the callback
   *             value, and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Promise_0600', 0, async function (done) {
    let data;
    try {
      data = await sim.getSimTelephoneNumber(SIM_SLOT_ID.slotId2);
    } catch (err) {
      console.log('Telephony_Sim_getSimTelephoneNumber_Promise_0600 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0600, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Async_0100
   * @tc.name    Call the getVoiceMailIdentifier interface with slotId input parameter 0,
   *             the return value is not null
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailIdentifier_Async_0100', 0, async function (done) {
    sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getVoiceMailIdentifier_Async_0100 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data.length !== 0).assertTrue();
      console.log('Telephony_Sim_getVoiceMailIdentifier_Async_0100 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Async_0200
   * @tc.name    Call getVoiceMailIdentifier, slotId parameter abnormal, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailIdentifier_Async_0200', 0, async function (done) {
    sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId11, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getVoiceMailIdentifier_Async_0200 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Async_0200 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Async_0500
   * @tc.name    Test getVoiceMailIdentifier slotId exception input parameter 1, check the callback value,
   *             and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailIdentifier_Async_0500', 0, async function (done) {
    sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId1, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getVoiceMailIdentifier_Async_0500 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Async_0500 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Async_0600
   * @tc.name    Test getVoiceMailIdentifier slotId exception input parameter 2, check the
   *             callback value, and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailIdentifier_Async_0600', 0, async function (done) {
    sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId2, (err, data) => {
      if (err) {
        console.log('Telephony_Sim_getVoiceMailIdentifier_Async_0600 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Async_0600 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Promise_0100
   * @tc.name    Call the getVoiceMailIdentifier interface with slotId input parameter 0,
   *             the return value is not null
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailIdentifier_Promise_0100', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId0);
    } catch (err) {
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0100 fail, data : ${data}`);
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0100 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    expect(data.length !== 0).assertTrue();
    console.log('Telephony_Sim_getVoiceMailIdentifier_Promise_0100 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Promise_0200
   * @tc.name    Call getVoiceMailIdentifier, slotId parameter abnormal, and expect to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailIdentifier_Promise_0200', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId11);
    } catch (err) {
      console.log('Telephony_Sim_getVoiceMailIdentifier_Promise_0200 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0200, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Promise_0500
   * @tc.name    Test getVoiceMailIdentifier slotId exception input parameter 1, check the callback
   *             value, and expect to enter err
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailIdentifier_Promise_0500', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId1);
    } catch (err) {
      console.log('Telephony_Sim_getVoiceMailIdentifier_Promise_0500 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0500, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Promise_0600
   * @tc.name    Test getVoiceMailIdentifier slotId exception input parameter 2, check the callback
   *             value, and expect to enter err
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailIdentifier_Promise_0600', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailIdentifier(SIM_SLOT_ID.slotId2);
    } catch (err) {
      console.log('Telephony_Sim_getVoiceMailIdentifier_Promise_0600 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0600, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Async_0100
   * @tc.name    Call the getVoiceMailNumber interface with slotId input parameter 0,
   *             the return value is not null
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailNumber_Async_0100', 0, async function (done) {
    sim.getVoiceMailNumber(SIM_SLOT_ID.slotId0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getVoiceMailNumber_Async_0100 getVoiceMailNumber fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data.length !== 0).assertTrue();
      console.log('Telephony_Sim_getVoiceMailNumber_Async_0100 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Async_0200
   * @tc.name    Call getVoiceMailNumber, slotId parameter abnormal, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailNumber_Async_0200', 0, async function (done) {
    sim.getVoiceMailNumber(SIM_SLOT_ID.slotId11, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getVoiceMailNumber_Async_0200 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailNumber_Async_0200 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Async_0500
   * @tc.name    Test getVoiceMailNumber slotId exception input parameter 1, check the callback
   *             value, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailNumber_Async_0500', 0, async function (done) {
    sim.getVoiceMailNumber(SIM_SLOT_ID.slotId1, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getVoiceMailNumber_Async_0500 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailNumber_Async_0500 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Async_0600
   * @tc.name    Test getVoiceMailNumber slotId exception input parameter 2, check the callback
   *             value, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailNumber_Async_0600', 0, async function (done) {
    sim.getVoiceMailNumber(SIM_SLOT_ID.slotId2, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log('Telephony_Sim_getVoiceMailNumber_Async_0600 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailNumber_Async_0600 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Promise_0100
   * @tc.name    Call the getVoiceMailNumber interface with slotId input parameter 0,
   *             the return value is not null
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailNumber_Promise_0100', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailNumber(SIM_SLOT_ID.slotId0);
    } catch (err) {
      console.log(`Telephony_Sim_getVoiceMailNumber_Promise_0100 getVoiceMailNumber, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    expect(data.length !== 0).assertTrue();
    console.log('Telephony_Sim_getVoiceMailNumber_Promise_0100 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Promise_0200
   * @tc.name    Call getVoiceMailNumber, slotId parameter abnormal, and expect to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailNumber_Promise_0200', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailNumber(SIM_SLOT_ID.slotId11);
    } catch (err) {
      console.log('Telephony_Sim_getVoiceMailNumber_Promise_0200 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailNumber_Promise_0200, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Promise_0500
   * @tc.name    Test getVoiceMailNumber slotId exception input parameter 1, check the callback
   *             value, and expect to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailNumber_Promise_0500', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailNumber(SIM_SLOT_ID.slotId1);
    } catch (err) {
      console.log('Telephony_Sim_getVoiceMailNumber_Promise_0500 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailNumber_Promise_0500, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Promise_0600
   * @tc.name    Test getVoiceMailNumber slotId exception input parameter 2, check the callback
   *             value, and expect to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailNumber_Promise_0600', 0, async function (done) {
    let data;
    try {
      data = await sim.getVoiceMailNumber(SIM_SLOT_ID.slotId2);
    } catch (err) {
      console.log('Telephony_Sim_getVoiceMailNumber_Promise_0600 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailNumber_Promise_0600, data : ${data}`);
    expect().assertFail();
    done();
  });
});