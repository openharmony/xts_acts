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
import * as CONSTANT from './lib/Const.js';
import { describe, it, expect, Core, afterAll } from 'deccjsunit/index';

describe('SimActivateManagerFunction', function () {

  // set timeout
  const core = Core.getInstance();
  const config = core.getDefaultService('config');
  config.timeout = 10 * 1000;

  // The promise approach is encapsulated to ensure sequential execution and reduce nesting.
  const deactivateSimWriteToPromise = function () {
    return new Promise((resolve, reject) => {
      sim.deactivateSim(CONSTANT.SLOT_ID_0, (err) => {
        if (err) {
          console.log(`Telephony_Sim deactivateSimWriteToPromise fail, err : ${err.message}`);
          reject(err);
        } else {
          resolve(null);
        }
      });
    });
  };

  afterAll(async function () {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`afterAll activateSim fail, err : ${err.message}`);
    }
  });

  /**
   * @tc.number  Telephony_Sim_hasSimCard_Async_0100
   * @tc.name    HasSimCard (slotId:number, callback: AsyncCallback< Boolean >):void The return value
   *             of the normal input parameter. The expected result is true
   * @tc.desc    Function test
   */
  it('Telephony_Sim_hasSimCard_Async_0100', 0, async function (done) {
    sim.hasSimCard(CONSTANT.SLOT_ID_0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_hasSimCard_Async_0100 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data).assertTrue();
      console.log('Telephony_Sim_hasSimCard_Async_0100 finish');
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Async_0200
     * @tc.name    HasSimCard (slotId:number, callback: AsyncCallback< Boolean >):void interface exception
     *             input parameter return value, expected result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Async_0200', 0, async function (done) {
    sim.hasSimCard(CONSTANT.SLOT_ID_MINUS, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_hasSimCard_Async_0200 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data).assertFalse();
      console.log('Telephony_Sim_hasSimCard_Async_0200 finish');
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Async_0500
     * @tc.name    Test the slotId exception input parameter 1 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Async_0500', 0, async function (done) {
    sim.hasSimCard(CONSTANT.SLOT_ID_1, (err, data) => {
      if (err) {
        expect().assertFail();
        console.log(`Telephony_Sim_hasSimCard_Async_0500 fail, err : ${err.message}`);
        done();
        return;
      }
      expect(data).assertFalse();
      console.log('Telephony_Sim_hasSimCard_Async_0500 finish');
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Async_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Async_0600', 0, async function (done) {
    sim.hasSimCard(CONSTANT.SLOT_ID_2, (err, data) => {
      if (err) {
        expect().assertFail();
        console.log(`Telephony_Sim_hasSimCard_Async_0600 fail, err : ${err.message}`);
        done();
        return;
      }
      expect(data).assertFalse();
      console.log('Telephony_Sim_hasSimCard_Async_0600 finish');
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0100
     * @tc.name    Test hasSimCard (slotId:number): Promise< Boolean > Return value of
     *             the normal input parameter of the interface. Expect the result to be true
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Promise_0100', 0, async function (done) {
    try {
      let data = await sim.hasSimCard(CONSTANT.SLOT_ID_0);
      expect(data).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_hasSimCard_Promise_0100 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_hasSimCard_Promise_0100 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0200
     * @tc.name    Test hasSimCard (slotId:number): Promise< Boolean > Return value of
     *             the interface exception input parameter. Expect to return false
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Promise_0200', 0, async function (done) {
    try {
      let data = await sim.hasSimCard(CONSTANT.SLOT_ID_MINUS);
      expect(data).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_hasSimCard_Promise_0200 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_hasSimCard_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0500
     * @tc.name    Test the slotId exception input parameter 1 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Promise_0500', 0, async function (done) {
    try {
      let data = await sim.hasSimCard(CONSTANT.SLOT_ID_1);
      expect(data).assertFalse();
    } catch (err) {
      expect().assertFail();
      console.log(`Telephony_Sim_hasSimCard_Promise_0500 fail, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_hasSimCard_Promise_0500 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_hasSimCard_Promise_0600
     * @tc.name    Test the slotId exception input parameter 2 of the hasSimCard interface,
     *             check the callback value, and expect the callback result flase
     * @tc.desc    Function test
     */
  it('Telephony_Sim_hasSimCard_Promise_0600', 0, async function (done) {
    try {
      let data = await sim.hasSimCard(CONSTANT.SLOT_ID_2);
      expect(data).assertFalse();
    } catch (err) {
      expect().assertFail();
      console.log(`Telephony_Sim_hasSimCard_Promise_0600 fail, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_hasSimCard_Promise_0600 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0100
   * @tc.name    When the SIM card is activated, the isSimActive interface slotId is called as the normal
   *             input parameter, and the callback value and SIM card status are checked.
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0100', 0, async function (done) {
    sim.activateSim(CONSTANT.SLOT_ID_0, (err) => {
      if (err) {
        console.log(`Telephony_Sim_isSimActive_Async_0100 activateSim fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.isSimActive(CONSTANT.SLOT_ID_0, (err, value) => {
        if (err) {
          console.log(`Telephony_Sim_isSimActive_Async_0100 isSimActive fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`Telephony_Sim_isSimActive_Async_0100 isSimActive, value : ${value}`);
        expect(value).assertTrue();
        sim.getSimState(CONSTANT.SLOT_ID_0, (err, res) => {
          if (err) {
            console.log(`Telephony_Sim_isSimActive_Async_0100 getSimState fail, err : ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.log(`Telephony_Sim_isSimActive_Async_0100 getSimState, res : ${res}`);
          expect(res === sim.SIM_STATE_READY).assertTrue();
          console.log('Telephony_Sim_isSimActive_Async_0100 finish');
          done();
        });
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0200
   * @tc.name    Test isSimActive (slotId: number, callback: AsyncCallback< Boolean >): void Abnormal input parameter
   *             during interface card activation, expectation 1. Enter false.
   *             2. Call the getSimState interface input parameter 0 and return the result SIM_STATE_READY
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0200', 0, async function (done) {
    sim.isSimActive(CONSTANT.SLOT_ID_MINUS, (err, data) => {
      if (err) {
        expect().assertFail();
        console.log(`Telephony_Sim_isSimActive_Async_0200 isSimActive fail, err : ${err.message}`);
        done();
        return;
      }
      expect(data).assertFalse();
      sim.getSimState(CONSTANT.SLOT_ID_0, (error, value) => {
        if (error) {
          console.log(`Telephony_Sim_isSimActive_Async_0200 getSimState fail, error : ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`Telephony_Sim_isSimActive_Async_0200 getSimState, value : ${value}`);
        expect(value === sim.SIM_STATE_READY).assertTrue();
        console.log('Telephony_Sim_isSimActive_Async_0200 finish');
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0300
   * @tc.name    Test isSimActive (slotId: number, callback: AsyncCallback< Boolean >): void This parameter is normally
   *             entered when the interface card is not activated. The expectation is 1. Step 2 Return: false
   *             2. Call the getSimState interface input parameter 0 and return the result SIM_STATE_NOT_PRESENT
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0300', 0, async function (done) {
    try {
      await deactivateSimWriteToPromise();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Async_0300 deactivateSim fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    sim.isSimActive(CONSTANT.SLOT_ID_0, (err, value) => {
      if (err) {
        console.log(`Telephony_Sim_isSimActive_Async_0300 isSimActive fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`Telephony_Sim_isSimActive_Async_0300 isSimActive, value : ${value}`);
      expect(value).assertFalse();

      // Wait one second for the SIM card status to refresh.
      setTimeout(function () {
        sim.getSimState(CONSTANT.SLOT_ID_0, (err, result) => {
          if (err) {
            console.log(`Telephony_Sim_isSimActive_Async_0300 getSimState fail, err : ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.log(`Telephony_Sim_isSimActive_Async_0300 getSimState , result : ${result}`);
          expect(result === sim.SIM_STATE_NOT_PRESENT).assertTrue();

          // Restore the SIM card activation status.
          sim.activateSim(CONSTANT.SLOT_ID_0, (err) => {
            if (err) {
              console.log(`Telephony_Sim_isSimActive_Async_0300 activateSim fail, err : ${err.message}`);
              expect().assertFail();
              done();
              return;
            }
            console.log('Telephony_Sim_isSimActive_Async_0300 finish');
            done();
          });
        });
      }, 1000);
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0600
   * @tc.name    Test the slotId exception input parameter 1 during isSimActive interface card activation,
   *             check the callback value, and expect the callback result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0600', 0, async function (done) {
    sim.isSimActive(CONSTANT.SLOT_ID_1, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_isSimActive_Async_0600 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data).assertFalse();
      console.log('Telephony_Sim_isSimActive_Async_0600 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0700
   * @tc.name    Test the slotId exception input parameter 1 during isSimActive interface card activation,
   *             check the callback value, and expect the callback result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0700', 0, async function (done) {
    sim.isSimActive(CONSTANT.SLOT_ID_2, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_isSimActive_Async_0700 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data).assertFalse();
      console.log('Telephony_Sim_isSimActive_Async_0700 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0100
   * @tc.name    Test isSimActive (slotId: number): Promise< Boolean > When the interface card is activated,
   *             the value is expected to be 1. Returns: true,2. Call the getSimState
   *             interface input parameter 0 and return the result SIM_STATE_READY
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0100', 0, async function (done) {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0100 activateSim fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let res = await sim.isSimActive(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_isSimActive_Promise_0100 isSimActive , res : ${res}`);
      expect(res).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0100 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let value = await sim.getSimState(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_isSimActive_Promise_0100 getSimState, value : ${value}`);
      expect(value === sim.SIM_STATE_READY).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0100 getSimState fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_isSimActive_Promise_0100 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0200
   * @tc.name    Test isSimActive (slotId: number): Promise< Boolean > Abnormal entry parameter during
   *             interface card activation, expectation 1. Enter the false 2. Call the getSimState
   *             interface input parameter 0 and return the result SIM_STATE_READY
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0200', 0, async function (done) {
    try {
      let data = await sim.isSimActive(CONSTANT.SLOT_ID_MINUS);
      expect(data).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0200 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let value = await sim.getSimState(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_isSimActive_Promise_0200 getSimState , value : ${value}`);
      expect(value === sim.SIM_STATE_READY).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0200 getSimState fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_isSimActive_Promise_0200 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0300
   * @tc.name    Test isSimActive (slotId: number): Promise< Boolean > If the interface card is not activated,
   *             the entry parameter is normal. Expect 1. Returns: false 2. Call the
   *             getSimState interface input parameter 0 and return the result SIM_STATE_NOT_PRESENT
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0300', 0, async function (done) {
    try {
      await sim.deactivateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0300 deactivateSim fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let ret = await sim.isSimActive(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_isSimActive_Promise_0300 , ret : ${ret}`);
      expect(ret).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0300 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    // Wait one second for the SIM card status to refresh.
    setTimeout(async function () {
      try {
        let value = await sim.getSimState(CONSTANT.SLOT_ID_0);
        console.log(`Telephony_Sim_isSimActive_Promise_0300 , getSimState value : ${value}`);
        expect(value === sim.SIM_STATE_NOT_PRESENT).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_isSimActive_Promise_0300 getSimState fail, err : ${err.message}`);
        expect().assertFail();
        done();
      }
    }, 1000);

    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0300 activateSim fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_isSimActive_Promise_0300 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0600
   * @tc.name    Test the slotId exception input parameter 1 during isSimActive interface card activation,
   *             check the callback value, and expect the callback result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0600', 0, async function (done) {
    try {
      let data = await sim.isSimActive(CONSTANT.SLOT_ID_1);
      expect(data).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0600 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_isSimActive_Promise_0600 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0700
   * @tc.name    Test the slotId exception input parameter 2 during isSimActive interface card activation,
   *             check the callback value, and expect the callback result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0700', 0, async function (done) {
    try {
      let data = await sim.isSimActive(CONSTANT.SLOT_ID_2);
      expect(data).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0700 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_isSimActive_Promise_0700 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_activateSim_Async_0100
   * @tc.name    Test activateSim (slotId: number, callback: AsyncCallback): Void interface slotId
   *             exception input parameter, expected to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_activateSim_Async_0100', 0, async function (done) {
    sim.activateSim(CONSTANT.SLOT_ID_MINUS, (err) => {
      if (err) {
        console.log(`Telephony_Sim_activateSim_Async_0100 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_activateSim_Async_0100  fail');
      expect().assertFail();
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Async_0200
     * @tc.name    When the card is active, repeatedly test the activateSim interface
     *             setting to active to check the callback value.
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Async_0200', 0, async function (done) {
    sim.activateSim(CONSTANT.SLOT_ID_0, (err) => {
      if (err) {
        console.log(`Telephony_Sim_activateSim_Async_0200 activateSim1 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.activateSim(CONSTANT.SLOT_ID_0, (err) => {
        if (err) {
          console.log(`Telephony_Sim_activateSim_Async_0200 activateSim2 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        sim.isSimActive(CONSTANT.SLOT_ID_0, (err, result) => {
          if (err) {
            console.log(`Telephony_Sim_activateSim_Async_0200 isSimActive fail, err : ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          expect(result).assertTrue();
          console.log('Telephony_Sim_activateSim_Async_0200 finish');
          done();
        });
      });
    });
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Async_0500
     * @tc.name    Test the slotId exception input parameter 1 of activateSim interface,
     *             check the callback value, and expect to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Async_0500', 0, async function (done) {
    sim.activateSim(CONSTANT.SLOT_ID_1, (err) => {
      if (err) {
        console.log(`Telephony_Sim_activateSim_Async_0500 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_activateSim_Async_0500  fail');
      expect().assertFail();
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Async_0600
     * @tc.name    Test the slotId exception input parameter 2 of activateSim interface,
     *             check the callback value, and expect to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Async_0600', 0, async function (done) {
    sim.activateSim(CONSTANT.SLOT_ID_2, (err) => {
      if (err) {
        console.log(`Telephony_Sim_activateSim_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_activateSim_Async_0600  fail');
      expect().assertFail();
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Promise_0100
     * @tc.name    Test activateSim (slotId: number): Promise Interface slotId exception
     *             entry parameter, expected to enter err
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Promise_0100', 0, async function (done) {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_MINUS);
    } catch (err) {
      console.log(`Telephony_Sim_activateSim_Promise_0100 finish, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_activateSim_Promise_0100  fail');
    expect().assertFail();
    done();
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Promise_0200
     * @tc.name    When the card is active, test activateSim (slotId: number, callback: Promise):
     *             void interface is set to active and expects to return true
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Promise_0200', 0, async function (done) {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_activateSim_Promise_0200 activateSim1 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_activateSim_Promise_0200 activateSim2 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let ret = await sim.isSimActive(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_activateSim_Promise_0200 isSimActive , ret : ${ret}`);
      expect(ret).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_activateSim_Promise_0200 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_activateSim_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Promise_0500
     * @tc.name    Test the slotId exception input parameter 1 of activateSim interface,
     *             check the callback value, and expect to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Promise_0500', 0, async function (done) {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_1);
    } catch (err) {
      console.log(`Telephony_Sim_activateSim_Promise_0500 finish, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_activateSim_Promise_0500  fail');
    expect().assertFail();
    done();
  });

  /**
     * @tc.number  Telephony_Sim_activateSim_Promise_0600
     * @tc.name    Test the slotId exception input parameter 2 of activateSim interface,
     *             check the callback value, and expect to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_activateSim_Promise_0600', 0, async function (done) {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_2);
    } catch (err) {
      console.log(`Telephony_Sim_activateSim_Promise_0600 finish, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_activateSim_Promise_0600  fail');
    expect().assertFail();
    done();
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Async_0100
     * @tc.name    Test deactivateSim (slotId: number): Promise Interface slotId
     *             exception entry parameter, expect to enter err
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Async_0100', 0, async function (done) {
    sim.deactivateSim(CONSTANT.SLOT_ID_MINUS, (err) => {
      if (err) {
        console.log(`Telephony_Sim_deactivateSim_Async_0100 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_deactivateSim_Async_0100 fail');
      expect().assertFail();
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Async_0200
     * @tc.name    When the card is active, test deactivateSim  (slotId: number, callback: AsyncCallback):
     *             void interface is set to active and expects to return true
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Async_0200', 0, async function (done) {
    sim.deactivateSim(CONSTANT.SLOT_ID_0, (err) => {
      if (err) {
        console.log(`Telephony_Sim_deactivateSim_Async_0200 deactivateSim1 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.deactivateSim(CONSTANT.SLOT_ID_0, (err) => {
        if (err) {
          console.log(`Telephony_Sim_deactivateSim_Async_0200 deactivateSim2 fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        sim.isSimActive(CONSTANT.SLOT_ID_0, (err, result) => {
          if (err) {
            console.log(`Telephony_Sim_deactivateSim_Async_0200 isSimActive fail, err : ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          expect(result).assertFalse();
          sim.activateSim(CONSTANT.SLOT_ID_0, (err) => {
            if (err) {
              console.log(`Telephony_Sim_deactivateSim_Async_0200 activateSim fail, err : ${err.message}`);
              expect().assertFail();
              done();
            }
            console.log('Telephony_Sim_deactivateSim_Async_0200 finish');
            done();
          });
        });
      });
    });
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Async_0500
     * @tc.name    Test the deactivateSim interface slotId exception input parameter 1 and check the
     *             callback value, expecting to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Async_0500', 0, async function (done) {
    sim.deactivateSim(CONSTANT.SLOT_ID_1, (err) => {
      if (err) {
        console.log(`Telephony_Sim_deactivateSim_Async_0500 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_deactivateSim_Async_0500 fail');
      expect().assertFail();
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Async_0600
     * @tc.name    Test the deactivateSim interface slotId exception input parameter 2
     *             and check the callback value, expecting to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Async_0600', 0, async function (done) {
    sim.deactivateSim(CONSTANT.SLOT_ID_2, (err) => {
      if (err) {
        console.log(`Telephony_Sim_deactivateSim_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_deactivateSim_Async_0600 fail');
      expect().assertFail();
      done();
    });
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Promise_0100
     * @tc.name    Test deactivateSim (slotId: number): Promise Interface slotId exception
     *             entry parameter, expect to enter err
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Promise_0100', 0, async function (done) {
    try {
      await sim.deactivateSim(CONSTANT.SLOT_ID_MINUS);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0100 finish, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_deactivateSim_Promise_0100 fail');
    expect().assertFail();
    done();
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Promise_0200
     * @tc.name    When the card is active, test deactivateSim (slotId: number, callback: Promise):
     *             void interface is set to active and expects to return false
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Promise_0200', 0, async function (done) {
    try {
      await sim.deactivateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0200 deactivateSim1 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      await sim.deactivateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0200 deactivateSim2 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let ret = await sim.isSimActive(CONSTANT.SLOT_ID_0);
      expect(ret).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0200 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0200 activateSim fail, err : ${err.message}`);
      expect().assertFail();
      done();
    }
    console.log('Telephony_Sim_deactivateSim_Promise_0200 finish');
    done();
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Promise_0500
     * @tc.name    Test the deactivateSim interface slotId exception input parameter 1 and
     *             check the callback value, expecting to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Promise_0500', 0, async function (done) {
    try {
      await sim.deactivateSim(CONSTANT.SLOT_ID_1);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0500 finish, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_deactivateSim_Promise_0500 fail');
    expect().assertFail();
    done();
  });

  /**
     * @tc.number  Telephony_Sim_deactivateSim_Promise_0600
     * @tc.name    Test the deactivateSim interface slotId exception input parameter
     *             2 and check the callback value, expecting to enter ERR
     * @tc.desc    Function test
     */
  it('Telephony_Sim_deactivateSim_Promise_0600', 0, async function (done) {
    try {
      await sim.deactivateSim(CONSTANT.SLOT_ID_2);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0600 finish, err : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_deactivateSim_Promise_0600 fail');
    expect().assertFail();
    done();
  });
});