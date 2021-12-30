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

describe('SimNoSimFunction', function () {

  /**
   * @tc.number  Telephony_Sim_getSimState_Async_0500
   * @tc.name    Test if there is no SIM card in the case of normal finish-parameter call interface getSimState.
   * @tc.desc    Function test
   */
   it('Telephony_Sim_getSimState_Async_0500', 0, async function (done) {
    sim.getSimState(env.SLOTID0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getSimState_Async_0500 fail, err: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      console.log(`Telephony_Sim_getSimState_Async_0500, data : ${data}`);
      // If there is no SIM card, the return value is SIM_STATE_NOT_PRESENT.
      expect(data === sim.SIM_STATE_NOT_PRESENT).assertTrue();
      console.log('Telephony_Sim_getSimState_Async_0500 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getSimState_Promise_0500
   * @tc.name    Test if there is no SIM card in the case of normal finish-parameter call interface getSimState.
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimState_Promise_0500', 0, async function (done) {
    try {
      let data = await sim.getSimState(env.SLOTID0);
      console.log(`Telephony_Sim_getSimState_Promise_0500, data : ${data}`);
      // If there is no SIM card, the return value is SIM_STATE_NOT_PRESENT.
      expect(data === sim.SIM_STATE_NOT_PRESENT).assertTrue();
    } catch (err) {
      console.log(`Telephony_Sim_getSimState_Promise_0500 fail, err: ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_getSimState_Promise_0500 finish');
    done();
  });

  /**
   *
   * @tc.number  Telephony_Sim_getOperatorConfigs_Async_0100
   * @tc.name    The slotId parameter is 0 and the OperatorConfig structure is not expected to be empty
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getOperatorConfigs_Async_0500', 0, async function (done) {
    sim.getOperatorConfigs(env.SLOTID0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getOperatorConfigs_Async_0500 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(Object.keys(data).length !== 0).assertTrue();
      console.log('Telephony_Sim_getOperatorConfigs_Async_0500 finish');
      done();
    });
  });

  /**
     *
     * @tc.number  Telephony_Sim_getOperatorConfigs_Promise_0500
     * @tc.name    The slotId parameter is 0 and the OperatorConfig structure is not expected to be empty
     * @tc.desc    Function test
     */
  it('Telephony_Sim_getOperatorConfigs_Promise_0500', 0, async function (done) {
    try {
      var data = await sim.getOperatorConfigs(env.SLOTID0);
    } catch (err) {
      console.log(`Telephony_Sim_getOperatorConfigs_Promise_0500 fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    expect(Object.keys(data).length !== 0).assertTrue();
    console.log('Telephony_Sim_getOperatorConfigs_Promise_0500 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_hasSimCard_Async_0700
   * @tc.name    HasSimCard (slotId:number, callback: AsyncCallback< Boolean >):void interface exception
   *             input parameter return value, expected result flase
   * @tc.desc    Function test
   */
  it('Telephony_Sim_hasSimCard_Async_0700', 0, async function (done) {
    sim.hasSimCard(env.SLOTID0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_hasSimCard_Async_0700 fail data${data}`);
        console.log(`Telephony_Sim_hasSimCard_Async_0700 fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data).assertFalse();
      console.log('Telephony_Sim_hasSimCard_Async_0700 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_hasSimCard_Promise_0700
   * @tc.name    Test hasSimCard (slotId:number): Promise< Boolean > Return value of
   *             the interface exception input parameter. Expect to return false
   * @tc.desc    Function test
   */
  it('Telephony_Sim_hasSimCard_Promise_0700', 0, async function (done) {
    try {
      var data = await sim.hasSimCard(env.SLOTID0);
      expect(data).assertFalse();
    } catch (err) {
      console.log(`Telephony_Sim_hasSimCard_Promise_0700 data${data}`);
      console.log(`Telephony_Sim_hasSimCard_Promise_0700 err${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_hasSimCard_Promise_0700 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Async_0800
   * @tc.name    Test isSimActive (slotId: number, callback: AsyncCallback< Boolean >): void Abnormal input parameter
   *             during interface card activation, expectation 1. Enter false.
   *             2. Call the getSimState interface input parameter 0 and return the result SIM_STATE_READY
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Async_0800', 0, async function (done) {
    sim.isSimActive(env.SLOTID_MINUS1, (err, data) => {
      if (err) {
        expect(data).assertFalse();
        console.log('Telephony_Sim_isSimActive_Async_0800 finish');
        done();
        return;
      }
      sim.getSimState(env.SLOTID0, (err, value) => {
        if (err) {
          console.log(`Telephony_Sim_isSimActive_Async_0800 getSimState fail, err : ${err.message}`);
          done();
          return;
        }
        console.log(`Telephony_Sim_isSimActive_Async_0800 getSimState, value : ${value}`);
        expect(value === sim.SIM_STATE_NOT_PRESENT).assertTrue();
        console.log('Telephony_Sim_isSimActive_Async_0800 finish');
        done();
      });
      console.log(`Telephony_Sim_isSimActive_Async_0800 isSimActive fail, err : ${err.message}`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_isSimActive_Promise_0800
   * @tc.name    Test isSimActive (slotId: number): Promise< Boolean > Abnormal entry parameter during
   *             interface card activation, expectation 1. Enter the false 2. Call the getSimState
   *             interface input parameter 0 and return the result SIM_STATE_NOT_PRESENT
   * @tc.desc    Function test
   */
  it('Telephony_Sim_isSimActive_Promise_0800', 0, async function (done) {
    try {
      var data = await sim.isSimActive(env.SLOTID0);
      expect(data).assertFalse();
      try {
        var value = await sim.getSimState(env.SLOTID0);
        console.log(`Telephony_Sim_isSimActive_Promise_0800 getSimState , value : ${value}`);
        expect(value === sim.SIM_STATE_NOT_PRESENT).assertTrue();
      } catch (err) {
        console.log(`Telephony_Sim_isSimActive_Promise_0800 getSimState fail, err : ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
    } catch (err) {
      console.log(`Telephony_Sim_isSimActive_Promise_0800 isSimActive fail, err : ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    console.log('Telephony_Sim_isSimActive_Promise_0800 isSimActive finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_activateSim_Async_0700
   * @tc.name    Test activateSim (slotId: number, callback: AsyncCallback): Void interface slotId
   *             exception input parameter, expected to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_activateSim_Async_0700', 0, async function (done) {
    sim.activateSim(env.SLOTID0, (err, data) => {
      if (err) {
        console.log('Telephony_Sim_activateSim_Async_0700 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_activateSim_Async_0700  fail, data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_activateSim_Promise_0700
   * @tc.name    Test activateSim (slotId: number): Promise Interface slotId exception
   *             entry parameter, expected to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_activateSim_Promise_0700', 0, async function (done) {
    try {
      var data = await sim.activateSim(env.SLOTID0);
    } catch (err) {
      console.log('Telephony_Sim_activateSim_Promise_0700 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_activateSim_Promise_0700  fail, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   *
   * @tc.number  Telephony_Sim_deactivateSim_Async_0700
   * @tc.name    Test deactivateSim (slotId: number): Promise Interface slotId
   *             exception entry parameter, expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_deactivateSim_Async_0700', 0, async function (done) {
    sim.deactivateSim(env.SLOTID0, (err, data) => {
      if (err) {
        console.log('Telephony_Sim_deactivateSim_Async_0700 deactivateSim finish ');
        done();
        return;
      }
      console.log(`Telephony_Sim_deactivateSim_Async_0700 data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   *
   * @tc.number  Telephony_Sim_deactivateSim_Promise_0700
   * @tc.name    Test deactivateSim (slotId: number): Promise Interface slotId exception
   *             entry parameter, expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_deactivateSim_Promise_0700', 0, async function (done) {
    try {
      await sim.deactivateSim(env.SLOTID0);
    } catch (err) {
      console.log(`Telephony_Sim_deactivateSim_Promise_0700 expect error: ${err.message}`);
      console.log('Telephony_Sim_deactivateSim_Promise_0700 finish');
      done();
      return;
    }
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getActiveSimAccountInfoList_Async_0500
   * @tc.name    When there is no card, test the getActiveSimAccountInfoList interface and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getActiveSimAccountInfoList_Async_0500', 0, function (done) {
    sim.getActiveSimAccountInfoList((error, info) => {
      if (error) {
        console.log(`Telephony_Sim_getActiveSimAccountInfoList_Async_0500 expect error: ${error.message}`);
      } else {
        console.log('Telephony_Sim_getActiveSimAccountInfoList_Async_0500 test fail.');
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getActiveSimAccountInfoList_Promise_0500
   * @tc.name    When there is no card, test the getActiveSimAccountInfoList interface and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getActiveSimAccountInfoList_Promise_0500', 0, async function (done) {
    try {
      await sim.getActiveSimAccountInfoList();
      expect().assertFail();
    } catch (error) {
      console.log(`Telephony_Sim_getActiveSimAccountInfoList_Promise_0500 expect error: ${error.message}`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Async_0800
   * @tc.name    When there is no card, test the GetShowName interface to check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_getShowName_Async_0800', 0, async function (done) {
    sim.setShowName(env.SLOTID0, env.CARD_NAME.nameYouXiao, (err) => {
      if (err) {
        console.log(`Telephony_Sim_getShowName_Async_0800 setShowName finish, err : ${err.message}`);
        sim.getShowName(env.SLOTID0, (geterr, getdata) => {
          if (geterr) {
            console.log(`Telephony_Sim_getShowName_Async_0800 getShowName finish, err : ${geterr.message}`);
            done();
            return;
          }
          console.log('Telephony_Sim_getShowName_Async_0800 getShowName fail');
          expect().assertFail();
          done();
        });
        return;
      }
      console.log('Telephony_Sim_getShowName_Async_0800 setShowName fail');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowName_Promise_0800
   * @tc.name    When there is no card, test the GetShowName interface to check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowName_Promise_0800', 0, async function (done) {
    try {
      await sim.setShowName(env.SLOTID0, env.CARD_NAME.nameYouXiao);
      console.log('Telephony_Sim_getShowName_Promise_0800 setShowName fail ');
      expect().assertFail();
      done();
      return;
    } catch (err) {
      console.log(`Telephony_Sim_getShowName_Promise_0800 setShowName finish, err : ${err.message}`);
      try {
        await sim.getShowName(env.SLOTID0);
        console.log('Telephony_Sim_getShowName_Promise_0800 getShowName fail ');
        expect().assertFail();
        done();
        return;
      } catch (err) {
        console.log(`Telephony_Sim_getShowName_Promise_0800 getShowName finish, err : ${err.message}`);
        done();
      }
    }
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Async_0700
   * @tc.name    When there is no card, test the GetShowNumber interface to check the callback value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getShowNumber_Async_0700', 0, async function (done) {
    sim.setShowNumber(env.SLOTID0, env.CARD_NAME.nameYouXiao, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getShowNumber_Async_0700 setShowNumber finish, err : ${err.message}`);
        sim.getShowNumber(env.SLOTID0, (err, value) => {
          if (err) {
            console.log(`Telephony_Sim_getShowNumber_Async_0700 getShowNumber finish, err : ${err.message}`);
            done();
            return;
          }
          console.log('Telephony_Sim_getShowNumber_Async_0700 getShowNumber fail ');
          expect().assertFail();
          done();
        });
        return;
      }
      console.log('Telephony_Sim_getShowNumber_Async_0700 setShowNumber fail ');
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getShowNumber_Promise_0700
   * @tc.name    The getShowNumber interface is called, the slotId parameter is 4,
   *             and the err is expected
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getShowNumber_Promise_0700', 0, async function (done) {
    try {
      await sim.setShowNumber(env.SLOTID0, env.CARD_NAME.nameYouXiao);
      console.log('Telephony_Sim_getShowNumber_Promise_0700 setShowNumber fail ');
      done();
      return;
    } catch (err) {
      console.log(`Telephony_Sim_getShowNumber_Promise_0700 setShowNumber finish, err : ${err.message}`);
      try {
        await sim.getShowNumber(env.SLOTID0);
        console.log('Telephony_Sim_getShowNumber_Promise_0700 getShowNumber fail');
        expect().assertFail();
      } catch (err) {
        console.log(`Telephony_Sim_getShowNumber_Promise_0700 getShowNumber finish, err : ${err.message}`);
        done();
      }
    }
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Async_0700
   * @tc.name    Call getSimTelephoneNumber, slotId parameter 4, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Async_0700', 0, async function (done) {
    sim.getSimTelephoneNumber(env.SLOTID0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0700 expect error: ${err.message}`);
        console.log('Telephony_Sim_getSimTelephoneNumber_Async_0700 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getSimTelephoneNumber_Async_0700 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getSimTelephoneNumber_Promise_0700
   * @tc.name    Call getSimTelephoneNumber, slotId parameter 4, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getSimTelephoneNumber_Promise_0700', 0, async function (done) {
    try {
      var data = await sim.getSimTelephoneNumber(env.SLOTID0);
    } catch (err) {
      console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0700 expect error: ${err.message}`);
      console.log('Telephony_Sim_getSimTelephoneNumber_Promise_0700 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getSimTelephoneNumber_Promise_0700, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Async_0700
   * @tc.name    Call getVoiceMailIdentifier, slotId parameter 4, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailIdentifier_Async_0700', 0, async function (done) {
    sim.getVoiceMailIdentifier(env.SLOTID0, (err, data) => {
      if (err) {
        console.log('Telephony_Sim_getVoiceMailIdentifier_Async_0700 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Async_0700 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailIdentifier_Promise_0700
   * @tc.name    Call getVoiceMailIdentifier, slotId parameter 4, and expect to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailIdentifier_Promise_0700', 0, async function (done) {
    try {
      var data = await sim.getVoiceMailIdentifier(env.SLOTID0);
    } catch (err) {
      console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0700 expect error: ${err.message}`);
      console.log('Telephony_Sim_getVoiceMailIdentifier_Promise_0700 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailIdentifier_Promise_0700, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Async_0700
   * @tc.name    Call getVoiceMailNumber, slotId parameter 4, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_getVoiceMailNumber_Async_0700', 0, async function (done) {
    sim.getVoiceMailNumber(env.SLOTID0, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_getVoiceMailNumber_Async_0700 expect error: ${err.message}`);
        console.log('Telephony_Sim_getVoiceMailNumber_Async_0700 finish');
        done();
        return;
      }
      console.log(`Telephony_Sim_getVoiceMailNumber_Async_0700 , data : ${data}`);
      expect().assertFail();
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_getVoiceMailNumber_Promise_0700
   * @tc.name    Call getVoiceMailNumber, slotId parameter 4, and expect to enter ERR
   * @tc.desc    Function test
   */

  it('Telephony_Sim_getVoiceMailNumber_Promise_0700', 0, async function (done) {
    try {
      var data = await sim.getVoiceMailNumber(env.SLOTID0);
    } catch (err) {
      console.log(`Telephony_Sim_getVoiceMailNumber_Promise_0700 expect error: ${err.message}`);
      console.log('Telephony_Sim_getVoiceMailNumber_Promise_0700 finish');
      done();
      return;
    }
    console.log(`Telephony_Sim_getVoiceMailNumber_Promise_0700, data : ${data}`);
    expect().assertFail();
    done();
  });

  /**
   * @tc.number  Telephony_Sim_queryIccDiallingNumbers_Async_1100
   * @tc.name    Test the queryIccDiallingNumbers async callback interface when there is no sim card,
   *             and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_queryIccDiallingNumbers_Async_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_queryIccDiallingNumbers_Async_1100';
    sim.queryIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, (error, data) => {
      if (error) {
        console.log(`${CASE_NAME} query error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data.length === 0).assertTrue();
      console.log(`${CASE_NAME} test finish`);
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_queryIccDiallingNumbers_Promise_1100
   * @tc.name    Test the queryIccDiallingNumbers promise interface when there is no sim card,
   *             and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_queryIccDiallingNumbers_Promise_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_queryIccDiallingNumbers_Promise_1100';
    try {
      const numbers = await sim.queryIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1);
      expect(numbers.length === 0).assertTrue();
      console.log(`${CASE_NAME} test finish`);
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_addIccDiallingNumbers_Async_1200
   * @tc.name    Test the addIccDiallingNumbers async callback interface when there is no sim card,
   *             and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_addIccDiallingNumbers_Async_1200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_addIccDiallingNumbers_Async_1200';
    const diallingNumbersInfo = { recordNumber: 1, alphaTag: 'test', number: '12345678', pin2: '123@#ABCD' };
    sim.addIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, diallingNumbersInfo, error => {
      if (error) {
        console.log(`${CASE_NAME} add error:${error.message}`);
        console.log(`${CASE_NAME} finish.`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
        done();
        return;
      }
      sim.queryIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, (error, data) => {
        if (error) {
          console.log(`${CASE_NAME} query error: ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        expect(data.length === 0).assertTrue();
        console.log(`${CASE_NAME} test finish`);
        done();
      });
    });
  });

  /**
   * @tc.number   Telephony_Sim_addIccDiallingNumbers_Promise_1200
   * @tc.name     Test the addIccDiallingNumbers promise interface when there is no sim card, and check the return value
   * @tc.desc     Function test
   */
  it('Telephony_Sim_addIccDiallingNumbers_Promise_1200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_addIccDiallingNumbers_Promise_1200';
    const diallingNumbersInfo = { recordNumber: 1, alphaTag: 'test', number: '12345678', pin2: '123@#ABCD' };
    try {
      await sim.addIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, diallingNumbersInfo);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
    }
    try {
      const numbers = await sim.queryIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1);
      expect(numbers.length === 0).assertTrue();
      console.log(`${CASE_NAME} test finish`);
    } catch (error) {
      console.log(`${CASE_NAME} query error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number   Telephony_Sim_delIccDiallingNumbers_Async_1200
   * @tc.name     Test the delIccDiallingNumbers async callback interface when there is no sim card,
   *              and check the return value
   * @tc.desc     Function test
   */
  it('Telephony_Sim_delIccDiallingNumbers_Async_1200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_delIccDiallingNumbers_Async_1200';
    let diallingNumbersInfo = { recordNumber: 1, alphaTag: 'test', number: '12345678', pin2: '123@#ABCD' };
    sim.delIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, diallingNumbersInfo, error => {
      if (error) {
        console.log(`${CASE_NAME} expect error:${error.message}`);
        console.log(`${CASE_NAME} finish.`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number   Telephony_Sim_delIccDiallingNumbers_Promise_1200
   * @tc.name     Test the delIccDiallingNumbers promise interface when there is no sim card,
   *              and check the return value
   * @tc.desc     Function test
   */
  it('Telephony_Sim_delIccDiallingNumbers_Promise_1200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_delIccDiallingNumbers_Promise_1200';
    let diallingNumbersInfo = { recordNumber: 1, alphaTag: 'test', number: '12345678', pin2: '123@#ABCD' };
    try {
      await sim.delIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, diallingNumbersInfo);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_updateIccDiallingNumbers_Async_1500
   * @tc.name    Test the updateIccDiallingNumbers async callback interface when there is no sim card,
   *             and check the return value
   * @tc.desc    Function test
   */
  it('Telephony_Sim_updateIccDiallingNumbers_Async_1500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_updateIccDiallingNumbers_Async_1500';
    let diallingNumbersInfoUpdate = {
      recordNumber: 1, alphaTag: 'test_Update', number: '87654321', pin2: '123@#ABCD'
    };
    sim.updateIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, diallingNumbersInfoUpdate, error => {
      if (error) {
        console.log(`${CASE_NAME} expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish.`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_updateIccDiallingNumbers_Promise_1500
   * @tc.name   Test the updateIccDiallingNumbers promise interface when there is no sim card,
   *             and check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_updateIccDiallingNumbers_Promise_1500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_updateIccDiallingNumbers_Promise_1500';
    let diallingNumbersInfoUpdate = {
      recordNumber: 1, alphaTag: 'test_Update', number: '87654321', pin2: '123@#ABCD'
    };
    try {
      await sim.updateIccDiallingNumbers(env.SLOTID0, env.NUM_TYPE1, diallingNumbersInfoUpdate);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish.`);
    }
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Async_1100
   * @tc.name    When there is no card, test the unlockPin2 interface, check the callback value, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPin2_Async_1100', 0, async function (done) {
    sim.unlockPin2(env.SLOTID0, env.CARD_NAME.pinNumberFour, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_unlockPin2_Async_1100 , error: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data.result === -2).assertTrue();
      console.log('Telephony_Sim_unlockPin2_Async_1100 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPin2_Promise_1100
   * @tc.name    When there is no card, test the unlockPin2 interface, check the callback value, and expect to enter ERR
   * @tc.desc    Function test
  */
  it('Telephony_Sim_unlockPin2_Promise_1100', 0, async function (done) {
    let data;
    try {
      data = await sim.unlockPin2(env.SLOTID0, env.CARD_NAME.pinNumberFour);
    } catch (err) {
      console.log(`Telephony_Sim_unlockPin2_Promise_1100, error: ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    expect(data.result === -2).assertTrue();
    console.log('Telephony_Sim_unlockPin2_Promise_1100 finish');
    done();
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Async_1200
   * @tc.name    When there is no card, test the unlockPuk2 interface, check the callback value, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Async_1200', 0, async function (done) {
    sim.unlockPuk2(env.SLOTID0, env.CARD_NAME.newPin, env.CARD_NAME.pukErr, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_unlockPuk2_Async_1200 , error: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data.result === -2).assertTrue();
      console.log('Telephony_Sim_unlockPuk2_Async_1200 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_unlockPuk2_Promise_1200
   * @tc.name    When there is no card, test the unlockPuk2 interface, check the callback value, and expect to enter ERR
   * @tc.desc    Function test
   */
  it('Telephony_Sim_unlockPuk2_Promise_1200', 0, async function (done) {
    let data;
    try {
      data = await sim.unlockPuk2(env.SLOTID0, env.CARD_NAME.newPin, env.CARD_NAME.pukErr);
    } catch (err) {
      console.log(`Telephony_Sim_unlockPuk2_Promise_1200, error: ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    expect(data.result === -2).assertTrue();
    console.log('Telephony_Sim_unlockPuk2_Promise_1200 finish');
    done();

  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Async_1200
   * @tc.name    When there is no card, test alterPin2 interface exception, check callback value, expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Async_1200', 0, async function (done) {
    sim.alterPin2(env.SLOTID0, env.CARD_NAME.newPin, env.CARD_NAME.oldPin, (err, data) => {
      if (err) {
        console.log(`Telephony_Sim_alterPin2_Async_1200 , error: ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      expect(data.result === -2).assertTrue();
      console.log('Telephony_Sim_alterPin2_Async_1200 finish');
      done();
    });
  });

  /**
   * @tc.number  Telephony_Sim_alterPin2_Promise_1200
   * @tc.name    When there is no card, test alterPin2 interface exception, check callback value, expect to enter err
   * @tc.desc    Function test
   */
  it('Telephony_Sim_alterPin2_Promise_1200', 0, async function (done) {
    let data;
    try {
      data = await sim.alterPin2(env.SLOTID0, env.CARD_NAME.newPin, env.CARD_NAME.oldPin);
    } catch (err) {
      console.log(`Telephony_Sim_alterPin2_Promise_1200 , error: ${err.message}`);
      expect().assertFail();
      done();
      return;
    }
    expect(data.result === -2).assertTrue();
    console.log('Telephony_Sim_alterPin2_Promise_1200 finish');
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0700
   * @tc.name   Test the setVoiceMailInfo async callback interface when there is no sim card,
   *            expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0700', 0, function (done) {
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`Telephony_Sim_setVoiceMailInfo_Async_0700 setVoiceMailInfo expect error: ${error.message}`);
        console.log('Telephony_Sim_setVoiceMailInfo_Async_0700 test finish');
      } else {
        console.log('Telephony_Sim_setVoiceMailInfo_Async_0700 test fail.');
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0700
   * @tc.name   Test the setVoiceMailInfo promise interface when there is no sim card,
   *            expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0700', 0, async function (done) {
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20);
      console.log('Telephony_Sim_setVoiceMailInfo_Promise_0700 test fail.');
      expect().assertFail();
    } catch (error) {
      console.log(`Telephony_Sim_setVoiceMailInfo_Promise_0700 setVoiceMailInfo expect error: ${error.message}`);
      console.log('Telephony_Sim_setVoiceMailInfo_Promise_0700 test finish');
    }
    done();
  });
});