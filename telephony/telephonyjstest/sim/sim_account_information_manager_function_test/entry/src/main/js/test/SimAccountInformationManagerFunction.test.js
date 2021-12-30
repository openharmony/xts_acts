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
import radio from '@ohos.telephony.radio';
import * as CONSTANT from './lib/Const.js';
import { describe, it, expect, Core, beforeAll } from 'deccjsunit/index';

describe('SimAccountInformationManagerFunction', function () {

  // set timeout
  const core = Core.getInstance();
  const config = core.getDefaultService('config');
  config.timeout = 10 * 1000;

  let defaultName = '';
  const waitingForNetworkReady = 5;

  const sleep = function (s) {
    return new Promise(resolve => {
      setTimeout(() => {
        resolve();
      }, s * 1000);
    });
  };

  // The promise approach is encapsulated to ensure sequential execution and reduce nesting.
  const setShowNameWriteToPromise = function () {
    return new Promise((resolve, reject) => {
      sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME, (err) => {
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
      sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NUMBER, (err) => {
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
      sim.getSimIccId(CONSTANT.SLOT_ID_0, (err, result) => {
        if (err) {
          console.log(`Telephony_Sim getSimIccIdWriteToPromise fail, err : ${err.message}`);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  };

  // Restores the default display name of the card.
  const restoreDefaultShowName = function () {
    return new Promise((resolve, reject) => {
      radio.getOperatorName(CONSTANT.SLOT_ID_0, (err, operatorName) => {
        if (err) {
          err.message = `Telephony_Sim await restoreDefaultShowName getOperatorName fail, err : ${err.message}`;
          reject(err);
          return;
        }
        if (operatorName !== '') {
          defaultName = operatorName;
        }
        if (defaultName !== '') {
          sim.setShowName(CONSTANT.SLOT_ID_0, defaultName, (err) => {
            if (err) {
              err.message = `Telephony_Sim await restoreDefaultShowName setShowName fail, err : ${err.message}`;
              reject(err);
              return;
            }
            resolve(defaultName);
          });
        } else {
          resolve(defaultName);
        }
      });
    });
  };

  beforeAll(async function () {
    try {
      let isActiveState = await sim.isSimActive(CONSTANT.SLOT_ID_0);
      if (!isActiveState) {
        await sim.activateSim(CONSTANT.SLOT_ID_0);
        await sleep(60);
      }
      defaultName = await radio.getOperatorName(CONSTANT.SLOT_ID_0);
      console.log(`getOperatorName default name: ${defaultName}, type: ${typeof defaultName}`);
    } catch (error) {
      console.log(`beforeAll has a error: ${error.message}`);
    }
  });

  /**
   * @tc.number Telephony_Sim_getActiveSimAccountInfoList_Async_0100
   * @tc.name   Card activation, test the getActiveSimAccountInfoList async callback interface,
   *            check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_getActiveSimAccountInfoList_Async_0100', 0, async function (done) {
    sim.activateSim(CONSTANT.SLOT_ID_0, async (err) => {
      if (err) {
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0100 activateSim fail, error : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      try {
        console.log('Telephony_Sim_getActiveSimAccountInfoList_Async_0100 setShowNameWriteToPromise');
        await setShowNameWriteToPromise();
        console.log('Telephony_Sim_getActiveSimAccountInfoList_Async_0100 setShowNumberWriteToPromise');
        await setShowNumberWriteToPromise();
        console.log('Telephony_Sim_getActiveSimAccountInfoList_Async_0100 getSimIccIdWriteToPromise');
        var result = await getSimIccIdWriteToPromise();
      } catch (err) {
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0100 toPromise fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getActiveSimAccountInfoList(async (err, info) => {
        if (err) {
          console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0100 fail, error :${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0100 result: ${JSON.stringify(info)}`);
        expect(info.some(item =>
          item.simId === CONSTANT.SLOT_ID_0
          && item.isEsim === false
          && item.isActive === true
          && item.iccId === result
          && item.showName === CONSTANT.CARD_NAME
          && item.showNumber === CONSTANT.CARD_NUMBER)).assertTrue();
        await restoreDefaultShowName().catch(err => {
          console.log(
            `Telephony_Sim_getActiveSimAccountInfoList_Async_0100 restoreDefaultShowName error: ${err.message}`
          );
        });
        console.log('Telephony_Sim_getActiveSimAccountInfoList_Async_0100 finish');
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_getActiveSimAccountInfoList_Promise_0100
   * @tc.name    Card activation, test the getActiveSimAccountInfoList promise interface,
   *            check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getActiveSimAccountInfoList_Promise_0100', 0, async function (done) {
    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
      await sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME);
      await sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NUMBER);
      var iccResult = await sim.getSimIccId(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 getSimIccId: ${JSON.stringify(iccResult)}`);
    } catch (err) {
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100  fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let info = await sim.getActiveSimAccountInfoList();
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 result: ${JSON.stringify(info)}`);
      expect(info.some(item =>
        item.simId === CONSTANT.SLOT_ID_0
        && item.isEsim === false
        && item.isActive === true
        && item.iccId === iccResult
        && item.showName === CONSTANT.CARD_NAME
        && item.showNumber === CONSTANT.CARD_NUMBER)).assertTrue();
      await restoreDefaultShowName();
      console.log('Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 finish');
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0100 fail, error :${err.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getActiveSimAccountInfoList_Async_0200
   * @tc.name    The card is not activated, test the getActiveSimAccountInfoList async callback interface,
   *             and check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getActiveSimAccountInfoList_Async_0200', 0, async function (done) {
    try {
      await setShowNameWriteToPromise();
      await setShowNumberWriteToPromise();
    } catch (err) {
      console.log(
        `Telephony_Sim_getActiveSimAccountInfoList_Async_0200  set show name and number, err : ${err.message}`
      );
      expect().assertFail();
      done();
      return;
    }
    sim.deactivateSim(CONSTANT.SLOT_ID_0, (err) => {
      if (err) {
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0200 deactivateSim fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getActiveSimAccountInfoList((err, res) => {
        if (!err) {
          expect().assertFail();
          done();
          return;
        }
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0200 expect err : ${err.message}`);
        sim.activateSim(CONSTANT.SLOT_ID_0, async (err) => {
          if (err) {
            console.log(
              `Telephony_Sim_getActiveSimAccountInfoList_Async_0200 activateSim fail, err : ${err.message}`
            );
            done();
            return;
          }
          try {
            await sleep(waitingForNetworkReady);
            await restoreDefaultShowName();
          } catch (error) {
            console.log(
              `Telephony_Sim_getActiveSimAccountInfoList_Async_0200 restoreDefaultShowName error: ${error.message}`
            );
          }
          console.log('Telephony_Sim_getActiveSimAccountInfoList_Async_0200 finish');
          done();
        });
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_getActiveSimAccountInfoList_Promise_0200
   * @tc.name    The card is not activated, test the getActiveSimAccountInfoList promise interface,
   *             and check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getActiveSimAccountInfoList_Promise_0200', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME);
      await sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NUMBER);
      await sim.deactivateSim(CONSTANT.SLOT_ID_0);
    } catch (err) {
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0200 set fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      await sim.getActiveSimAccountInfoList();
      expect().assertFail();
    } catch (err) {
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0200 expect err : ${err.message}`);
    }

    try {
      await sim.activateSim(CONSTANT.SLOT_ID_0);
      await sleep(waitingForNetworkReady);
      await restoreDefaultShowName();
      console.log('Telephony_Sim_getActiveSimAccountInfoList_Promise_0200 finish');
    } catch (err) {
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0200 activateSim fail, err : ${err.message}`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Async_0100
   * @tc.name    Call setShowName with slotId as the input parameter 0 and name as the input parameter 1234. Call
   *             getShowName with slotId as the input parameter 0 and expect to return true with 1234
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Async_0100', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_MINUS, CONSTANT.CARD_NAME, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowName_Async_0100 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowName_Async_0100 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setShowName_Async_0200
   * @tc.name   Test setShowName async callback interface parameter name input an abnormal value that
   *            exceeds 32 characters in length, and check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setShowName_Async_0200', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_OVERLONG, (err) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_setShowName_Async_0200 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowName_Async_0200 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Async_0300
   * @tc.name    Test setShowName async callback interface parameter name input
   *             is empty abnormal value, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Async_0300', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_NULL, (err) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_setShowName_Async_0300 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowName_Async_0300 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Async_0600
   * @tc.name    Test setShowName slotId exception input parameter 1 to check the callback
   *             value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Async_0600', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_1, CONSTANT.CARD_NAME, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowName_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowName_Async_0600 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Async_0700
   * @tc.name    Test setShowName slotId exception input parameter 2 to check the
   *             callback value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Async_0700', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_2, CONSTANT.CARD_NAME, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowName_Async_0700 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowName_Async_0700 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Async_0800
   * @tc.name    Test SetShowName Interface name enter valid mixed values, check the callback
   *             value, expect to return 01234567890123456789_测@#$%ABCD
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Async_0800', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_LEN32, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowName_Async_0800 setShowName fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getShowName(CONSTANT.SLOT_ID_0, async (error, data) => {
        if (error) {
          console.log(`Telephony_Sim_setShowName_Async_0800 getShowName fail, error : ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data === CONSTANT.CARD_NAME_LEN32).assertTrue();
        await restoreDefaultShowName().catch(err => {
          console.log(`Telephony_Sim_setShowName_Async_0800 restoreDefaultShowName error: ${err.message}`);
        });
        console.log('Telephony_Sim_setShowName_Async_0800 finish');
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Promise_0100
   * @tc.name    Test setShowName promise interface slotId exception into parameter -1, check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Promise_0100', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_MINUS, CONSTANT.CARD_NAME);
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0100 finish, error : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_setShowName_Promise_0100 fail');
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Promise_0200
   * @tc.name    Test setShowName promise Interface parameter name If the value of an exception
   *             exceeds 32 characters, check the return value.
   * @tc.desc    Function test
   */

  it('Telephony_Sim_setShowName_Promise_0200', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_OVERLONG);
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0200 finish, error : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_setShowName_Promise_0200 fail');
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Promise_0300
   * @tc.name    Test setShowName promise interface parameter name input is empty abnormal value,
   *             check the return value
   * @tc.desc    Function test
   */

  it('Telephony_Sim_setShowName_Promise_0300', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_NULL);
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0300 finish, error : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_setShowName_Promise_0300 fail');
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Promise_0600
   * @tc.name    Test setShowName promise interface slotId exception into parameter 1, check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Promise_0600', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_1, CONSTANT.CARD_NAME);
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0600 finish, error : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_setShowName_Promise_0600 fail');
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Promise_0700
   * @tc.name    Test setShowName promise interface slotId exception into parameter 2, check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Promise_0700', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_2, CONSTANT.CARD_NAME);
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0700 finish, error : ${err.message}`);
      done();
      return;
    }
    console.log('Telephony_Sim_setShowName_Promise_0700 fail');
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_setShowName_Promise_0800
   * @tc.name    Test SetShowName promise Interface name enter mixed valid values, check the return value.
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowName_Promise_0800', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_LEN32);
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0800 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let data = await sim.getShowName(CONSTANT.SLOT_ID_0);
      expect(data === CONSTANT.CARD_NAME_LEN32).assertTrue();
      await restoreDefaultShowName();
      console.log('Telephony_Sim_setShowName_Promise_0800 finish ');
      done();
    } catch (err) {
      console.log(`Telephony_Sim_setShowName_Promise_0800 getShowName fail, err : ${err.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Async_0100
   * @tc.name    Test that the slotId of the getShowName async callback interface is entered normally,
   *             and check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Async_0100', 0, async function (done) {
    sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME, (err) => {
      if (err) {
        console.log(`Telephony_Sim_getShowName_Async_0100 setShowName fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getShowName(CONSTANT.SLOT_ID_0, async (err, value) => {
        if (err) {
          console.log(`Telephony_Sim_getShowName_Async_0100 getShowName fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`Telephony_Sim_getShowName_Async_0100 , value : ${value}`);
        expect(value === CONSTANT.CARD_NAME).assertTrue();
        await restoreDefaultShowName().catch(err => {
          console.log(`Telephony_Sim_setShowName_Async_0100 restoreDefaultShowName error: ${err.message}`);
        });
        console.log('Telephony_Sim_getShowName_Async_0100 finish');
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Async_0200
   * @tc.name    Test the getShowName async callback interface to get the default value, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Async_0200', 0, async function (done) {
    sim.getShowName(CONSTANT.SLOT_ID_0, (err, value) => {
      if (err) {
        console.log(`Telephony_Sim_getShowName_Async_0200 getShowName fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowName_Async_0200 getShowName, data : ${value}`);
      radio.getOperatorName(CONSTANT.SLOT_ID_0, (err, data) => {
        if (err) {
          console.log(`Telephony_Sim_getShowName_Async_0200 getOperatorName fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`Telephony_Sim_getShowName_Async_0200 getOperatorName, data : ${data}`);
        expect(data === value).assertTrue();
        console.log('Telephony_Sim_getShowName_Async_0200 finish');
        done();
      });
    });
  });

  /**
   * @tc.number Telephony_Sim_getShowName_Async_0300
   * @tc.name   Test getShowName async callback interface slotId exception into parameter -1, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_getShowName_Async_0300', 0, async function (done) {
    sim.getShowName(CONSTANT.SLOT_ID_MINUS, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getShowName_Async_0300 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowName_Async_0300 fail, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Async_0600
   * @tc.name    Test the slotId exception input parameter 1 of getShowName
   *             and check the return value, expecting to enter ERR
   * @tc.desc   Function test
   */
  it('Telephony_Sim_getShowName_Async_0600', 0, async function (done) {
    sim.getShowName(CONSTANT.SLOT_ID_1, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getShowName_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowName_Async_0600, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Async_0700
   * @tc.name    Test the slotId exception input parameter 2 of getShowName and
   *             check the return value, expecting to enter ERR
   * @tc.desc   Function test
   */
  it('Telephony_Sim_getShowName_Async_0700', 0, async function (done) {
    sim.getShowName(CONSTANT.SLOT_ID_2, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getShowName_Async_0700 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowName_Async_0700 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Promise_0100
   * @tc.name    Call setShowName with slotId as the input parameter 0 and name as the input parameter 1234. Call
   *             getShowName with slotId as the input parameter 0 and expect to return 1234
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Promise_0100', 0, async function (done) {
    try {
      await sim.setShowName(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME);
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0100 setShowName fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let value = await sim.getShowName(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_getShowName_Promise_0100 getShowName, value : ${value}`);
      expect(value === CONSTANT.CARD_NAME).assertTrue();
      console.log('Telephony_Sim_getShowName_Promise_0100 finish');
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0100 getShowName fail, err : ${err.message}`);
      expect().assertFail();
    }
    await restoreDefaultShowName().catch(err => {
      console.log(`Telephony_Sim_setShowName_Promise_0100 restoreDefaultShowName error: ${err.message}`);
    });
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Promise_0200
   * @tc.name    Test the getShowName promise interface to get the default value, check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Promise_0200', 0, async function (done) {
    try {
      var value = await sim.getShowName(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_getShowName_Promise_0200 getShowName data: ${value}`);
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0200 getShowName fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let data = await radio.getOperatorName(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_getShowName_Promise_0200 getOperatorName data: ${data}`);
      expect(value === data).assertTrue();
      console.log('Telephony_Sim_getShowName_Promise_0200 finish');
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0200 getOperatorName fail, err : ${err.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Promise_0300
   * @tc.name    Test getShowName promise interface slotId exception into parameter -1, check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Promise_0300', 0, async function (done) {
    try {
      let data = await sim.getShowName(CONSTANT.SLOT_ID_MINUS);
      console.log(`Telephony_Sim_getShowName_Promise_0300, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0300 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Promise_0600
   * @tc.name    Test the slotId exception input parameter 1 of getShowName and check the
   *             return value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Promise_0600', 0, async function (done) {
    try {
      let data = await sim.getShowName(CONSTANT.SLOT_ID_1);
      console.log(`Telephony_Sim_getShowName_Promise_0600 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log('Telephony_Sim_getShowName_Promise_0600 finish');
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Promise_0700
   * @tc.name    Test the slotId exception input parameter 2 of getShowName and check the
   *             return value, expecting to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getShowName_Promise_0700', 0, async function (done) {
    try {
      let data = await sim.getShowName(CONSTANT.SLOT_ID_2);
      console.log(`Telephony_Sim_getShowName_Promise_0700 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0700 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Async_0100
   * @tc.name    Test setShowNumber async callback interface slotId exception into parameter -1,
   *             check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Async_0100', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_MINUS, CONSTANT.CARD_NUMBER, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_setShowNumber_Async_0100 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_setShowNumber_Async_0100, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setShowNumber_Async_0200
   * @tc.name   Test setShowNumber async callback interface parameter number input an abnormal value
   *            exceeding 32 characters in length, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setShowNumber_Async_0200', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_OVERLONG, (err) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_setShowNumber_Async_0200 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowNumber_Async_0200 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Async_0300
   * @tc.name    Test setShowNumber async callback interface parameter number input is empty abnormal value,
   *             check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Async_0300', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_NULL, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_setShowNumber_Async_0300 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowNumber_Async_0300 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Async_0600
   * @tc.name    Test setShowNumber async callback interface slotId exception into parameter 1, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Async_0600', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_1, CONSTANT.CARD_NUMBER, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowNumber_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowNumber_Async_0600 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Async_0700
   * @tc.name    Test setShowNumber slotId exception input parameter 2, check the callback value,
   *             and expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Async_0700', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_2, CONSTANT.CARD_NUMBER, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowNumber_Async_0700 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log('Telephony_Sim_setShowNumber_Async_0700 fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Async_0800
   * @tc.name    Test the number input of the setShowNumber async callback interface as a mixed valid value,
   *             and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Async_0800', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NUMBER_LEN32, (err) => {
      if (err) {
        console.log(`Telephony_Sim_setShowNumber_Async_0800 setShowNumber fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getShowNumber(CONSTANT.SLOT_ID_0, (err, value) => {
        if (err) {
          console.log(`Telephony_Sim_setShowNumber_Async_0800 getShowNumber fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(value === CONSTANT.CARD_NUMBER_LEN32).assertTrue();
        console.log('Telephony_Sim_setShowNumber_Async_0800 finish');
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Promise_0100
   * @tc.name    Test setShowNumber promise interface slotId exception into parameter -1, check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Promise_0100', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_MINUS, CONSTANT.CARD_NUMBER);
      console.log('Telephony_Sim_setShowNumber_Promise_0100 fail');
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0100 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Promise_0200
   * @tc.name    Test setShowNumber promise interface parameter number input an abnormal value
   *             exceeding 32 characters in length, and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Promise_0200', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_MINUS, CONSTANT.CARD_NAME_OVERLONG);
      console.log('Telephony_Sim_setShowNumber_Promise_0200 fail');
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0200 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Promise_0300
   * @tc.name    Try setShowNumber promise interface parameter number input is empty abnormal value,
   *             check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Promise_0300', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME_NULL);
      console.log('Telephony_Sim_setShowNumber_Promise_0300 fail');
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0300 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Promise_0600
   * @tc.name    Test setShowNumber slotId exception input parameter 1 and check the return
   *             value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Promise_0600', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_1, CONSTANT.CARD_NUMBER);
      console.log('Telephony_Sim_setShowNumber_Promise_0600 fail');
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0600 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Promise_0700
   * @tc.name    Test setShowNumber slotId exception input parameter 2 and check
   *             the return value, expecting to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Promise_0700', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_2, CONSTANT.CARD_NUMBER);
      console.log('Telephony_Sim_setShowNumber_Promise_0700 fail');
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0700 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_setShowNumber_Promise_0800
   * @tc.name    Test the number input of the setShowNumber promise interface as a mixed valid value,
   *             and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_setShowNumber_Promise_0800', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NUMBER_LEN32);
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0800 setShowNumber fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let value = await sim.getShowNumber(CONSTANT.SLOT_ID_0);
      expect(CONSTANT.CARD_NUMBER_LEN32 === value).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_setShowNumber_Promise_0800 getShowNumber fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_setShowNumber_Promise_0800 finish');
    done();
  });

  /**
   * @tc.number   Telephony_Sim_getShowNumber_Async_0100
   * @tc.         Test getShowNumber async callback interface slotId normal input parameter,
   *              check the callback value
   * @tc.desc     Function test
   */
  it('Telephony_Sim_getShowNumber_Async_0100', 0, async function (done) {
    sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NAME, (err) => {
      if (err) {
        console.log(`Telephony_Sim_getShowNumber_Async_0100 setShowNumber fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getShowNumber(CONSTANT.SLOT_ID_0, (err, value) => {
        if (err) {
          console.log(`Telephony_Sim_getShowNumber_Async_0100  getShowNumber fail, err : ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(value === CONSTANT.CARD_NAME).assertTrue();
        console.log('Telephony_Sim_getShowNumber_Async_0100 finish');
        done();
      });
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Async_0200
   * @tc.name    Test getShowNumber async callback interface slotId exception into parameter -1,
   *             check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Async_0200', 0, async function (done) {
    sim.getShowNumber(CONSTANT.SLOT_ID_MINUS, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_getShowNumber_Async_0200 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowNumber_Async_0200 fail, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Async_0500
   * @tc.name    Test the getShowNumber async callback interface slotId exception into parameter 1,
   *             check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Async_0500', 0, async function (done) {
    sim.getShowNumber(CONSTANT.SLOT_ID_1, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_getShowNumber_Async_0500 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowNumber_Async_0500 fail, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Async_0600
   * @tc.name    Test the slotId exception of the getShowNumber async callback interface into parameter 2,
   *             check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Async_0600', 0, async function (done) {
    sim.getShowNumber(CONSTANT.SLOT_ID_2, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_getShowNumber_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getShowNumber_Async_0600 fail, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Promise_0100
   * @tc.name    Test getShowNumber promise interface slotId normal input parameter, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Promise_0100', 0, async function (done) {
    try {
      await sim.setShowNumber(CONSTANT.SLOT_ID_0, CONSTANT.CARD_NUMBER);
    } catch (err) {
      console.log(`Telephony_Sim_getShowNumber_Promise_0100 setShowNumber fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }

    try {
      let value = await sim.getShowNumber(CONSTANT.SLOT_ID_0);
      console.log(`Telephony_Sim_getShowNumber_Promise_0100 getShowNumber, value : ${value}`);
      expect(value === CONSTANT.CARD_NUMBER).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_getShowNumber_Promise_0100 getShowNumber fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_getShowNumber_Promise_0100 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Promise_0200
   * @tc.name    Test getShowNumber promise interface slotId exception into parameter -1, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Promise_0200', 0, async function (done) {
    try {
      let data = await sim.getShowNumber(CONSTANT.SLOT_ID_MINUS);
      console.log(`Telephony_Sim_getShowNumber_Promise_0200 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getShowNumber_Promise_0200 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Promise_0500
   * @tc.name    Test the getShowNumber promise interface slotId exception into parameter 1, check the callback value
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getShowNumber_Promise_0500', 0, async function (done) {
    try {
      let data = await sim.getShowNumber(CONSTANT.SLOT_ID_1);
      console.log(`Telephony_Sim_getShowNumber_Promise_0500 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getShowNumber_Promise_0500 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Promise_0600
   * @tc.name    Test the slotId exception of the getShowNumber interface into parameter 2, check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Promise_0600', 0, async function (done) {
    try {
      let data = await sim.getShowNumber(CONSTANT.SLOT_ID_2);
      console.log(`Telephony_Sim_getShowNumber_Promise_0600 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getShowNumber_Promise_0600 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Async_0100
   * @tc.name    The slotId parameter is 0 and the OperatorConfig structure is not expected to be empty
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Async_0100', 0, async function (done) {
    let containerIsEmpty = 0;
    sim.getOperatorConfigs(CONSTANT.SLOT_ID_0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getOperatorConfigs_Async_0100 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(Object.keys(data).length !== containerIsEmpty).assertTrue();
      console.log('Telephony_Sim_getOperatorConfigs_Async_0100 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Async_0200
   * @tc.name    The getOperatorConfigs interface is called, the slotId parameter is -1,
   *             and the err is expected
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Async_0200', 0, async function (done) {
    sim.getOperatorConfigs(CONSTANT.SLOT_ID_MINUS, (err, data) => {
      if (err) {
        // Enter the exception ID to enter err.
        console.log(`Telephony_Sim_getOperatorConfigs_Async_0200 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getOperatorConfigs_Async_0200 fail, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Async_0600
   * @tc.name    Test the getOperatorConfigs slotId exception input parameter 1 and check the
   *             callback value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Async_0600', 0, async function (done) {
    sim.getOperatorConfigs(CONSTANT.SLOT_ID_1, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getOperatorConfigs_Async_0600 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getOperatorConfigs_Async_0600 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Async_0700
   * @tc.name    Test the getOperatorConfigs slotId exception input parameter 2 and check the
   *             callback value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Async_0700', 0, async function (done) {
    sim.getOperatorConfigs(CONSTANT.SLOT_ID_1, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getOperatorConfigs_Async_0700 finish, err : ${err.message}`);
        done();
        return;
      }
      console.log(`Telephony_Sim_getOperatorConfigs_Async_0700 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Promise_0100
   * @tc.name    The slotId parameter is 0 and the OperatorConfig structure is not expected to be empty
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Promise_0100', 0, async function (done) {
    try {
      let data = await sim.getOperatorConfigs(CONSTANT.SLOT_ID_0);
      expect(Object.keys(data).length !== 0).assertTrue();
      console.log('Telephony_Sim_getOperatorConfigs_Promise_0100 finish');
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0100 fail, err : ${err.message}`);
      expect().assertFail();
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Promise_0200
   * @tc.name    The getOperatorConfig interface is called, the slotId parameter is -1,
   *             and the err is expected
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Promise_0200', 0, async function (done) {
    try {
      let data = await sim.getOperatorConfigs(CONSTANT.SLOT_ID_MINUS);
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0200 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0200 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Promise_0600
   * @tc.name    Test the getOperatorConfigs slotId exception input parameter 1 and check
   *             the callback value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Promise_0600', 0, async function (done) {
    try {
      let data = await sim.getOperatorConfigs(CONSTANT.SLOT_ID_1);
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0600 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0600 finish, err : ${err.message}`);
      done();
    }
  });

  /**
   * @tc.number  Telephony_Sim_getOperatorConfigs_Promise_0700
   * @tc.name    Test the getOperatorConfigs slotId exception input parameter 2 and check
   *             the callback value, expecting to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Promise_0700', 0, async function (done) {
    try {
      let data = await sim.getOperatorConfigs(CONSTANT.SLOT_ID_2);
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0700 fail, data : ${data}`);
      expect().assertFail();
      done();
    } catch (err) {
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0700 finish, err : ${err.message}`);
      done();
    }
  });
});