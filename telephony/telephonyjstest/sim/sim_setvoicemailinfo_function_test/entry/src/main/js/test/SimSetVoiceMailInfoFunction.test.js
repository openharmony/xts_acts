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

describe('SimsetVoiceMailInfoFunctionTest', function () {

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0100
   * @tc.name   Test the setVoiceMailInfo async callback interface, slotId is 0, and check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0100', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_0100';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getVoiceMailNumber(env.SLOTID0, (error, value) => {
        if (error) {
          console.log(`${CASE_NAME} getVoiceMailNumber error: ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} getVoiceMailNumber value: ${value}`);
        if (value !== env.MAIL_NUMBER_LEN20) {
          expect().assertFail();
          done();
          return;
        }
        sim.getVoiceMailIdentifier(env.SLOTID0, (error, value) => {
          if (error) {
            console.log(`${CASE_NAME} getVoiceMailIdentifier error: ${error.message}`);
            expect().assertFail();
          } else {
            console.log(`${CASE_NAME} test finish`);
            expect(value === env.MAIL_NAME_LEN12).assertTrue();
          }
          done();
        });
      });
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0200
   * @tc.name   Test the setVoiceMailInfo async callback interface, slotId is -1, expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0200', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_0200';
    sim.setVoiceMailInfo(env.SLOTID_MINUS1, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0300
   * @tc.name   Test the setVoiceMailInfo async callback interface, slotId is 1, expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0300', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_0300';
    sim.setVoiceMailInfo(env.SLOTID1, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0400
   * @tc.name   Test the setVoiceMailInfo async callback interface, slotId is 2, expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0400', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_0400';
    sim.setVoiceMailInfo(env.SLOTID2, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0500
   * @tc.name   Test the setVoiceMailInfo async callback interface, and the mailName exceeds 12 non-Chinese
   *            characters abnormally into the parameters, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0500', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_0500';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN13, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getVoiceMailNumber(env.SLOTID0, (error, value) => {
        if (error) {
          console.log(`${CASE_NAME} getVoiceMailNumber error: ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} getVoiceMailNumber value: ${value}`);
        if (value !== env.MAIL_NUMBER_LEN20) {
          expect().assertFail();
          done();
          return;
        }
        sim.getVoiceMailIdentifier(env.SLOTID0, (error, value) => {
          if (error) {
            console.log(`${CASE_NAME} getVoiceMailIdentifier error: ${error.message}`);
            expect().assertFail();
          } else {
            console.log(`${CASE_NAME} test finish`);
            expect(value === env.MAIL_NAME_LEN12).assertTrue();
          }
          done();
        });
      });
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_0600
   * @tc.name   Test the setVoiceMailInfo async callback interface. If the mailNumber exceeds 20 digits,
   *            enter the parameter abnormally. Check the callback value.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_0600', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_0600';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN21, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getVoiceMailNumber(env.SLOTID0, (error, value) => {
        if (error) {
          console.log(`${CASE_NAME} getVoiceMailNumber error: ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} getVoiceMailNumber value: ${value}`);
        if (value !== env.MAIL_NUMBER_LEN20) {
          expect().assertFail();
          done();
          return;
        }
        sim.getVoiceMailIdentifier(env.SLOTID0, (error, value) => {
          if (error) {
            console.log(`${CASE_NAME} getVoiceMailIdentifier error: ${error.message}`);
            expect().assertFail();
          } else {
            console.log(`${CASE_NAME} test finish`);
            expect(value === env.MAIL_NAME_LEN12).assertTrue();
          }
          done();
        });
      });
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_1000
   * @tc.name   Test the setVoiceMailInfo async callback interface,
   *            the mailName input parameter is empty, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_1000', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_1000';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_EMPTY, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_1100
   * @tc.name   Test the setVoiceMailInfo async callback interface,
   *            the mailNumber input parameter is empty, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_1100', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_1100';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_EMPTY, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_1200
   * @tc.name   Test the setVoiceMailInfo async callback interface, the mailName is normally entered
   *            as 6 Chinese characters, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_1200', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_1200';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_CHS_LEN6, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getVoiceMailNumber(env.SLOTID0, (error, value) => {
        if (error) {
          console.log(`${CASE_NAME} getVoiceMailNumber error: ${error.message}`);
          expect().assertFail();
          done();
          return;
        }
        console.log(`${CASE_NAME} getVoiceMailNumber value: ${value}`);
        if (value !== env.MAIL_NUMBER_LEN20) {
          expect().assertFail();
          done();
          return;
        }
        sim.getVoiceMailIdentifier(env.SLOTID0, (error, value) => {
          if (error) {
            console.log(`${CASE_NAME} getVoiceMailIdentifier error: ${error.message}`);
            expect().assertFail();
          } else {
            console.log(`${CASE_NAME} test finish`);
            expect(value === env.MAIL_NAME_CHS_LEN6).assertTrue();
          }
          done();
        });
      });
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_1300
   * @tc.name   Test the setVoiceMailInfo async callback interface, if the mailName is abnormal,
   *            the input parameter is more than 6 Chinese characters, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_1300', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_1300';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_CHS_LEN7, env.MAIL_NUMBER_LEN20, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo error: ${error.message}`);
        expect().assertFail();
        done();
        return;
      }
      sim.getVoiceMailIdentifier(env.SLOTID0, (error, value) => {
        if (error) {
          console.log(`${CASE_NAME} getVoiceMailIdentifier error: ${error.message}`);
          expect().assertFail();
        } else {
          console.log(`${CASE_NAME} test finish`);
          expect(value === env.MAIL_NAME_CHS_LEN6).assertTrue();
        }
        done();
      });
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Async_1400
   * @tc.name   Test the setVoiceMailInfo async callback interface, the mailNumber input parameter
   *            is a non-pure number, check the callback value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Async_1400', 0, function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Async_1400';
    sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_CHAR, error => {
      if (error) {
        console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
        console.log(`${CASE_NAME} test finish`);
      } else {
        console.log(`${CASE_NAME} test fail.`);
        expect().assertFail();
      }
      done();
    });
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0100
   * @tc.name   Test the setVoiceMailInfo promise interface, slotId = 0, and check the callback value.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_0100';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20);
      const mailNumber = await sim.getVoiceMailNumber(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailNumber value: ${mailNumber}`);
      if (mailNumber !== env.MAIL_NUMBER_LEN20) {
        expect().assertFail();
        done();
        return;
      }
      const mailIdentifier = await sim.getVoiceMailIdentifier(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailIdentifier value: ${mailIdentifier}`);
      expect(mailIdentifier === env.MAIL_NAME_LEN12).assertTrue();
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0200
   * @tc.name   Test the setVoiceMailInfo promise interface, slotId is -1, expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_0200';
    try {
      await sim.setVoiceMailInfo(env.SLOTID_MINUS1, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0300
   * @tc.name   Test the setVoiceMailInfo promise interface, slotId is 1, expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0300', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_0300';
    try {
      await sim.setVoiceMailInfo(env.SLOTID1, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0400
   * @tc.name   Test the setVoiceMailInfo promise interface, slotId is 2, expect enter error.
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_0400';
    try {
      await sim.setVoiceMailInfo(env.SLOTID2, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN20);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0500
   * @tc.name   Test the setVoiceMailInfo promise interface. If the mailName exceeds 12 non-Chinese characters,
   *            enter the parameter abnormally, check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0500', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_0500';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN13, env.MAIL_NUMBER_LEN20);
      const mailNumber = await sim.getVoiceMailNumber(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailNumber value: ${mailNumber}`);
      if (mailNumber !== env.MAIL_NUMBER_LEN20) {
        expect().assertFail();
        done();
        return;
      }
      const mailIdentifier = await sim.getVoiceMailIdentifier(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailIdentifier value: ${mailIdentifier}`);
      expect(mailIdentifier === env.MAIL_NAME_LEN12).assertTrue();
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_0600
   * @tc.name   Test the setVoiceMailInfo promise interface, if mailNumber exceeds 20 digits,
   *            enter the parameter abnormally, check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_0600', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_0600';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_LEN21);
      const mailNumber = await sim.getVoiceMailNumber(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailNumber value: ${mailNumber}`);
      if (mailNumber !== env.MAIL_NUMBER_LEN20) {
        expect().assertFail();
        done();
        return;
      }
      const mailIdentifier = await sim.getVoiceMailIdentifier(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailIdentifier value: ${mailIdentifier}`);
      expect(mailIdentifier === env.MAIL_NAME_LEN12).assertTrue();
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_1000
   * @tc.name   Test the setVoiceMailInfo promise interface, the mailName input parameter is empty,
   *            check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_1000', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_1000';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_EMPTY, env.MAIL_NUMBER_LEN20);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_1100
   * @tc.name   Test the setVoiceMailInfo promise interface, the mailNumber input parameter is empty,
   *            check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_1100', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_1100';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_EMPTY);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_1200
   * @tc.name   Test the setVoiceMailInfo promise interface, the mailName is normally entered as 6 Chinese characters,
   *            check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_1200', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_1200';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_CHS_LEN6, env.MAIL_NUMBER_LEN20);
      const mailNumber = await sim.getVoiceMailNumber(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailNumber value: ${mailNumber}`);
      if (mailNumber !== env.MAIL_NUMBER_LEN20) {
        expect().assertFail();
        done();
        return;
      }
      const mailIdentifier = await sim.getVoiceMailIdentifier(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailIdentifier value: ${mailIdentifier}`);
      expect(mailIdentifier === env.MAIL_NAME_CHS_LEN6).assertTrue();
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_1300
   * @tc.name   Test the setVoiceMailInfo promise interface, if the mailName is abnormal,
   *            the input parameter is more than 6 Chinese characters, check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_1300', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_1300';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_CHS_LEN7, env.MAIL_NUMBER_LEN20);
      const mailIdentifier = await sim.getVoiceMailIdentifier(env.SLOTID0);
      console.log(`${CASE_NAME} getVoiceMailIdentifier value: ${mailIdentifier}`);
      expect(mailIdentifier === env.MAIL_NAME_CHS_LEN6).assertTrue();
    } catch (error) {
      console.log(`${CASE_NAME} error: ${error.message}`);
      expect().assertFail();
    }
    done();
  });

  /**
   * @tc.number Telephony_Sim_setVoiceMailInfo_Promise_1400
   * @tc.name   Test the setVoiceMailInfo promise interface, the mailNumber input parameter is a non-pure number,
   *            check the return value
   * @tc.desc   Function test
   */
  it('Telephony_Sim_setVoiceMailInfo_Promise_1400', 0, async function (done) {
    const CASE_NAME = 'Telephony_Sim_setVoiceMailInfo_Promise_1400';
    try {
      await sim.setVoiceMailInfo(env.SLOTID0, env.MAIL_NAME_LEN12, env.MAIL_NUMBER_CHAR);
      console.log(`${CASE_NAME} test fail.`);
      expect().assertFail();
    } catch (error) {
      console.log(`${CASE_NAME} setVoiceMailInfo expect error: ${error.message}`);
      console.log(`${CASE_NAME} test finish`);
    }
    done();
  });
});